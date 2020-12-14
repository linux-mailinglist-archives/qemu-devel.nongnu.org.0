Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E862D9272
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:09:26 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog6v-0002CW-JZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofww-0005v4-6k; Sun, 13 Dec 2020 23:59:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39617 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofws-0004tW-EC; Sun, 13 Dec 2020 23:59:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTft0p6zz9sWl; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921894;
 bh=HrvpZ1c3QUmnLSSVUYMtaks8Ufho2sdvGBWv6odl8B0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CE7exyYvw0zerssmJuwR5mApqLknuEw4tFKUeW4ycmwCMlg/tzWaf3/fqdoTKMP6C
 2h2wOvTry5xQNkE/f7mIxyNKbQI+0ueZpdTkzGlkTXcgrAnCHVD1bVNAMlkyQPQIEm
 8Nb9PY9oj+/VwjNaOMCW0cAaLnhr8nbNEZ3V8uZc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 22/30] hw/ppc: Do not re-read the clock on pre_save if doing
 savevm
Date: Mon, 14 Dec 2020 15:57:59 +1100
Message-Id: <20201214045807.41003-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

A guest with enough RAM, eg. 128G, is likely to detect savevm downtime
and to complain about stalled CPUs. This happens because we re-read
the timebase just before migrating it and we thus don't account for
all the time between VM stop and pre-save.

A very similar situation was already addressed for live migration of
paused guests (commit d14f33976282). Extend the logic to do the same
with savevm.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1893787
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160693010619.1111945.632640981169395440.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 1b98272076..5cbbff1f8d 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1027,7 +1027,8 @@ static void timebase_save(PPCTimebase *tb)
      */
     tb->guest_timebase = ticks + first_ppc_cpu->env.tb_env->tb_offset;
 
-    tb->runstate_paused = runstate_check(RUN_STATE_PAUSED);
+    tb->runstate_paused =
+        runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_SAVE_VM);
 }
 
 static void timebase_load(PPCTimebase *tb)
@@ -1088,7 +1089,7 @@ static int timebase_pre_save(void *opaque)
 {
     PPCTimebase *tb = opaque;
 
-    /* guest_timebase won't be overridden in case of paused guest */
+    /* guest_timebase won't be overridden in case of paused guest or savevm */
     if (!tb->runstate_paused) {
         timebase_save(tb);
     }
-- 
2.29.2


