Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52944A6A7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:11:13 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKLg-0003RB-MB
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3l-0004UE-Ev; Tue, 09 Nov 2021 00:52:44 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=41649
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3g-0006fe-3U; Tue, 09 Nov 2021 00:52:39 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp0Htdz4xdl; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=RWIpuhqlOXfGQHIWH7pib8ZM+xennA+m+zn/lpxMIGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hTgG9HgStnr2bzaORWZdCk/ALBN9Nc8cjpM/gz8gSd4sHJGOPu26/fEfI3kZKZ/1G
 Q5PTnMARnE41qAYs6INQkuDHymLsKsgBvxQqTbIQH/XRhxRAAG1Uiocl7gHyd9kks+
 BDPZsIH150GhzzG7+4SsCIGkYhJoyLYPlO/jBIpk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 11/54] libdecnumber: introduce decNumberFrom[U]Int128
Date: Tue,  9 Nov 2021 16:51:21 +1100
Message-Id: <20211109055204.230765-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

This will be used to implement PowerPC's dcffixqq.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-2-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/libdecnumber/decNumber.h |  2 ++
 libdecnumber/decNumber.c         | 36 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/libdecnumber/decNumber.h b/include/libdecnumber/decNumber.h
index aa115fed07..0cf69c7db2 100644
--- a/include/libdecnumber/decNumber.h
+++ b/include/libdecnumber/decNumber.h
@@ -116,6 +116,8 @@
   decNumber * decNumberFromUInt32(decNumber *, uint32_t);
   decNumber *decNumberFromInt64(decNumber *, int64_t);
   decNumber *decNumberFromUInt64(decNumber *, uint64_t);
+  decNumber *decNumberFromInt128(decNumber *, uint64_t, int64_t);
+  decNumber *decNumberFromUInt128(decNumber *, uint64_t, uint64_t);
   decNumber * decNumberFromString(decNumber *, const char *, decContext *);
   char	    * decNumberToString(const decNumber *, char *);
   char	    * decNumberToEngString(const decNumber *, char *);
diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 1ffe458ad8..d7716ce175 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -167,6 +167,7 @@
 /* ------------------------------------------------------------------ */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "libdecnumber/dconfig.h"
 #include "libdecnumber/decNumber.h"
 #include "libdecnumber/decNumberLocal.h"
@@ -462,6 +463,41 @@ decNumber *decNumberFromUInt64(decNumber *dn, uint64_t uin)
     return dn;
 } /* decNumberFromUInt64 */
 
+decNumber *decNumberFromInt128(decNumber *dn, uint64_t lo, int64_t hi)
+{
+    uint64_t unsig_hi = hi;
+    if (hi < 0) {
+        if (lo == 0) {
+            unsig_hi = -unsig_hi;
+        } else {
+            unsig_hi = ~unsig_hi;
+            lo = -lo;
+        }
+    }
+
+    decNumberFromUInt128(dn, lo, unsig_hi);
+    if (hi < 0) {
+        dn->bits = DECNEG;        /* sign needed */
+    }
+    return dn;
+} /* decNumberFromInt128 */
+
+decNumber *decNumberFromUInt128(decNumber *dn, uint64_t lo, uint64_t hi)
+{
+    uint64_t rem;
+    Unit *up;                             /* work pointer */
+    decNumberZero(dn);                    /* clean */
+    if (lo == 0 && hi == 0) {
+        return dn;                /* [or decGetDigits bad call] */
+    }
+    for (up = dn->lsu; hi > 0 || lo > 0; up++) {
+        rem = divu128(&lo, &hi, DECDPUNMAX + 1);
+        *up = (Unit)rem;
+    }
+    dn->digits = decGetDigits(dn->lsu, up - dn->lsu);
+    return dn;
+} /* decNumberFromUInt128 */
+
 /* ------------------------------------------------------------------ */
 /* to-int64 -- conversion to int64                                    */
 /*                                                                    */
-- 
2.33.1


