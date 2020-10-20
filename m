Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF602886F4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:31:24 +0200 (CEST)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpgJ-00084C-AL
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVV-0005GL-MY
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:14 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47915 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVT-0001nA-R6
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wX5xPGz9sWC; Fri,  9 Oct 2020 21:19:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238796;
 bh=yMi9JSvWq3PL1j2sqg+bqydZgz5XuxXnbO6AYlAUWUE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nw8ZNMEWw5YY+v/Rkw1w9qjzyW0bkvoKZ3AyvUypxDrfRKuvIBolMN/lAYPvDLvTH
 MPCug/A9J2Y67EMrbWiYnFYBWl/xffgrJWJ319lvoho4BW3CwnNzzjDyTyaXUaRRjP
 cwRbRDrackuglLKQNDHtbl2fUzzgfdy2AyWCVFyY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/20] spapr: Simplify error handling in prop_get_fdt()
Date: Fri,  9 Oct 2020 21:19:41 +1100
Message-Id: <20201009101951.1569252-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 dbarboza@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nonngu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Use the return value of visit_check_struct() and visit_check_list()
for error checking instead of local_err. This allows to get rid of
the error propagation overhead.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-10-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 04a6bf134e..697b28c343 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -302,7 +302,6 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(obj);
     QNull *null = NULL;
-    Error *err = NULL;
     int fdt_offset_next, fdt_offset, fdt_depth;
     void *fdt;
 
@@ -321,6 +320,7 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
         const struct fdt_property *prop = NULL;
         int prop_len = 0, name_len = 0;
         uint32_t tag;
+        bool ok;
 
         tag = fdt_next_tag(fdt, fdt_offset, &fdt_offset_next);
         switch (tag) {
@@ -334,10 +334,9 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
         case FDT_END_NODE:
             /* shouldn't ever see an FDT_END_NODE before FDT_BEGIN_NODE */
             g_assert(fdt_depth > 0);
-            visit_check_struct(v, &err);
+            ok = visit_check_struct(v, errp);
             visit_end_struct(v, NULL);
-            if (err) {
-                error_propagate(errp, err);
+            if (!ok) {
                 return;
             }
             fdt_depth--;
@@ -355,10 +354,9 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
                     return;
                 }
             }
-            visit_check_list(v, &err);
+            ok = visit_check_list(v, errp);
             visit_end_list(v, NULL);
-            if (err) {
-                error_propagate(errp, err);
+            if (!ok) {
                 return;
             }
             break;
-- 
2.26.2


