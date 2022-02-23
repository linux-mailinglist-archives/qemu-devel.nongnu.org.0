Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FCD4C0F43
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:33:02 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMo17-0004sp-G9
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncg-0001U8-Ew
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnce-00022v-Pm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:46 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 6BB7521EC2;
 Wed, 23 Feb 2022 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yXFjKtsL6//0NeX/WHfSo+Sj8m/tUGliNIvyAG/AQI=;
 b=OQuss5E7KgBuY8/im2tqJLjnNHKA9Ljz14NQT4sCCNGAx5Q/KaFH8JqyIw9fnz9k/PhSpu
 Q0pP98wbYGzgs83LSUiJd4H9vQ0AFZA6aLjFGq0nSFaHsq5VzoCjULTwdqKvw6QraO7GNS
 NXHFpO55MR3He9yu4A70wMb1ZMlkE6s=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 10/14] none-machine: allow several cpus
Date: Wed, 23 Feb 2022 10:07:02 +0100
Message-Id: <20220223090706.4888-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
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
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to dynamically create (cold-plugging) cpus, we need to
increase _maxcpus_. This value is indeed used to initialize the
accelerator during qemu startup.
Allowing 16 seems a good starting point.

Add a check to prevent a user to request more than 1 cpu if he
specifies the cpu type on the CLI so that the legacy use case
of the none machine is preserved.

This commit is needed to use the 'none' machine as a base, and
subsequently to dynamically populate it wth cpus usign qapi
commands.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/null-machine.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 702b56232d..64f9931857 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -34,6 +34,10 @@ static void machine_none_init(MachineState *mch)
 
     /* Initialize CPU (if user asked for it) */
     if (mch->cpu_type) {
+        if (mch->smp.cpus > 1) {
+            error_report("Cannot initialize more than 1 CPU");
+            exit(1);
+        }
         cpu = cpu_create(mch->cpu_type);
         if (!cpu) {
             error_report("Unable to initialize CPU");
@@ -79,7 +83,7 @@ static void machine_none_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "empty machine";
     mc->init = machine_none_init;
-    mc->max_cpus = 1;
+    mc->max_cpus = 16;
     mc->default_ram_size = 0;
     mc->default_ram_id = "ram";
     mc->no_serial = 1;
-- 
2.35.1


