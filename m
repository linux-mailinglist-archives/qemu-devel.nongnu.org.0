Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9D4EC980
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:17:55 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZb16-00058Z-Sj
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:17:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZavl-0001ty-In
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:12:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:43312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZavj-00015k-Fv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:12:21 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C031221C73;
 Wed, 30 Mar 2022 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648656737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+GahVX3SgP+ojB1yjeXegWLVNZJ2DRYwHbQs+spcYw=;
 b=kRAjp0jRbQ0x+OFf+/VugNaUo0rXQZZSBiAJh2L9oU7qUGjOsle1Yww08heFYGtSJtWesy
 gpxYhjCgpohGP3O+kPRSGkMFsm3ts7eOkYTDJfbdUKVePdzAHXi49G06VHLxchxDHvJfNK
 FqALLVaCdyef46aZo4nl2A+PH0ZAa+I=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] qdev-monitor: use the newly uc_requires_machine_allowance
Date: Wed, 30 Mar 2022 18:12:13 +0200
Message-Id: <20220330161215.235231-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330161215.235231-1-damien.hedde@greensocs.com>
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 softmmu/qdev-monitor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12fe60c467..94e5f35127 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -258,12 +258,12 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
-        /* sysbus devices need to be allowed by the machine */
+    if (dc->uc_requires_machine_allowance) {
+        /* some devices need to be allowed by the machine */
         MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
-        if (!device_type_is_dynamic_sysbus(mc, *driver)) {
+        if (!device_type_is_dynamic_allowed(mc, *driver)) {
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                       "a dynamic sysbus device type for the machine");
+                       "the device type is not allowed for this machine");
             return NULL;
         }
     }
-- 
2.35.1


