Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79C29B23D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:39:41 +0100 (CET)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQ8S-0002Bv-Q9
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXPnf-0002HV-K0; Tue, 27 Oct 2020 10:18:12 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34431 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXPnd-0007cR-8X; Tue, 27 Oct 2020 10:18:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CLDLs1tDrz9shy; Wed, 28 Oct 2020 01:17:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1603808277;
 bh=FI9DropvBK9Z4BoxNEIGycdxZkK95p5nBGZ/kb5JGHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RM5G2lbLSvSzCnfvdmAPtt2/PR+nsLntOm0/KFKqa5OeulWrUUkaRf70oq949RxIP
 7GCC7bxuOOqz6t6hYpsrD/Bd27pvqyCXskO1FZg8C7/Isy3I1P0+JEMF8kUSf22WRq
 R32CGLpeU9m87ceFRvaA5As2CknRK2+wmx4OnjvA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 15/18] spapr: Use error_append_hint() in spapr_reallocate_hpt()
Date: Wed, 28 Oct 2020 01:17:32 +1100
Message-Id: <20201027141735.728821-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027141735.728821-1-david@gibson.dropbear.id.au>
References: <20201027141735.728821-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Hints should be added with the dedicated error_append_hint() API
because we don't want to print them when using QMP. This requires
to insert ERRP_GUARD as explained in "qapi/error.h".

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160371604030.305923.17464161378167312662.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0cc19b5863..ba0894e73a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1486,6 +1486,7 @@ void spapr_free_hpt(SpaprMachineState *spapr)
 void spapr_reallocate_hpt(SpaprMachineState *spapr, int shift,
                           Error **errp)
 {
+    ERRP_GUARD();
     long rc;
 
     /* Clean up any HPT info from a previous boot */
@@ -1500,17 +1501,18 @@ void spapr_reallocate_hpt(SpaprMachineState *spapr, int shift,
 
     if (rc < 0) {
         /* kernel-side HPT needed, but couldn't allocate one */
-        error_setg_errno(errp, errno,
-                         "Failed to allocate KVM HPT of order %d (try smaller maxmem?)",
+        error_setg_errno(errp, errno, "Failed to allocate KVM HPT of order %d",
                          shift);
+        error_append_hint(errp, "Try smaller maxmem?\n");
         /* This is almost certainly fatal, but if the caller really
          * wants to carry on with shift == 0, it's welcome to try */
     } else if (rc > 0) {
         /* kernel-side HPT allocated */
         if (rc != shift) {
             error_setg(errp,
-                       "Requested order %d HPT, but kernel allocated order %ld (try smaller maxmem?)",
+                       "Requested order %d HPT, but kernel allocated order %ld",
                        shift, rc);
+            error_append_hint(errp, "Try smaller maxmem?\n");
         }
 
         spapr->htab_shift = shift;
-- 
2.26.2


