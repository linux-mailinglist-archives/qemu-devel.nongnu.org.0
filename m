Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF83FCBC2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:48:21 +0200 (CEST)
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6vs-0001v0-MN
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6s4-0007Ji-N7; Tue, 31 Aug 2021 12:44:24 -0400
Received: from [201.28.113.2] (port=43158 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6s3-0008P9-2A; Tue, 31 Aug 2021 12:44:24 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:15 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 90F67800930;
 Tue, 31 Aug 2021 13:43:13 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 06/19] libdecnumber: introduce decNumberFrom[U]Int128
Date: Tue, 31 Aug 2021 13:39:54 -0300
Message-Id: <20210831164007.297781-7-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:15.0403 (UTC)
 FILETIME=[4B6E91B0:01D79E87]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used to implement PowerPC's dcffixqq.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
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
index 1ffe458ad8..75c09ba052 100644
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
+        divu128(&lo, &hi, &rem, DECDPUNMAX + 1);
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
2.25.1


