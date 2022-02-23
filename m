Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCD4C0F54
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:40:08 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMo7y-0001Zo-Qx
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:40:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncc-0001U1-V3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncR-0001za-DF
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:42 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 83DFF21EB7;
 Wed, 23 Feb 2022 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leheYCudOea9CxkF8jZtbqwtNcoRlV8wZddLLXZ7QCE=;
 b=fDF4R8kwR7lmcowzSBEv0RjHLt78+/fpaGJx+GavXlVpGWRt3o/nPKG0UWR4o9MvAAjObZ
 HdB290gvrrAJqkVkmWjfzXb5cukes4oVBWs9bRnVKT0/9qiGHtPmsT4gs35HIDobhiEU9u
 9YAoLs9X7vlykKRnZJZIDoWmG3ZwpTo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 04/14] qapi/device_add: compute is_hotplug flag
Date: Wed, 23 Feb 2022 10:06:56 +0100
Message-Id: <20220223090706.4888-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of checking the phase everytime, just store the result
in a flag. We will use more of it in the following commit.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 softmmu/qdev-monitor.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..47a89aee20 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -617,6 +617,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
     char *id;
     DeviceState *dev = NULL;
     BusState *bus = NULL;
+    bool is_hotplug = phase_check(PHASE_MACHINE_READY);
 
     driver = qdict_get_try_str(opts, "driver");
     if (!driver) {
@@ -660,7 +661,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         return NULL;
     }
 
-    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
+    if (is_hotplug && bus && !qbus_is_hotpluggable(bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
@@ -674,7 +675,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
     dev = qdev_new(driver);
 
     /* Check whether the hotplug is allowed by the machine */
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (is_hotplug) {
         if (!qdev_hotplug_allowed(dev, errp)) {
             goto err_del_dev;
         }
-- 
2.35.1


