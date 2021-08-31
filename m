Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30063FCBE5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:57:19 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL74Y-0007Dh-Ve
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6tO-0000c5-SP; Tue, 31 Aug 2021 12:45:47 -0400
Received: from [201.28.113.2] (port=19047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6tL-0001DD-B3; Tue, 31 Aug 2021 12:45:46 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:27 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 23D37800930;
 Tue, 31 Aug 2021 13:43:25 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 11/19] libdecnumber: Introduce decNumberIntegralToInt128
Date: Tue, 31 Aug 2021 13:39:59 -0300
Message-Id: <20210831164007.297781-12-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:27.0965 (UTC)
 FILETIME=[52EB60D0:01D79E87]
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

This will be used to implement PowerPC's dctfixqq.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 include/libdecnumber/decNumber.h      |  2 +
 include/libdecnumber/decNumberLocal.h |  2 +-
 libdecnumber/decContext.c             |  7 +-
 libdecnumber/decNumber.c              | 94 +++++++++++++++++++++++++++
 4 files changed, 101 insertions(+), 4 deletions(-)

diff --git a/include/libdecnumber/decNumber.h b/include/libdecnumber/decNumber.h
index 0cf69c7db2..41bc2a0d36 100644
--- a/include/libdecnumber/decNumber.h
+++ b/include/libdecnumber/decNumber.h
@@ -124,6 +124,8 @@
   uint32_t    decNumberToUInt32(const decNumber *, decContext *);
   int32_t     decNumberToInt32(const decNumber *, decContext *);
   int64_t     decNumberIntegralToInt64(const decNumber *dn, decContext *set);
+  void        decNumberIntegralToInt128(const decNumber *dn, decContext *set,
+        uint64_t *plow, uint64_t *phigh);
   uint8_t   * decNumberGetBCD(const decNumber *, uint8_t *);
   decNumber * decNumberSetBCD(decNumber *, const uint8_t *, uint32_t);
 
diff --git a/include/libdecnumber/decNumberLocal.h b/include/libdecnumber/decNumberLocal.h
index 4d53c077f2..6198ca8593 100644
--- a/include/libdecnumber/decNumberLocal.h
+++ b/include/libdecnumber/decNumberLocal.h
@@ -98,7 +98,7 @@
 
   /* Shared lookup tables					      */
   extern const uByte  DECSTICKYTAB[10]; /* re-round digits if sticky  */
-  extern const uLong  DECPOWERS[19];    /* powers of ten table        */
+  extern const uLong  DECPOWERS[20];    /* powers of ten table        */
   /* The following are included from decDPD.h			      */
   extern const uShort DPD2BIN[1024];	/* DPD -> 0-999		      */
   extern const uShort BIN2DPD[1000];	/* 0-999 -> DPD		      */
diff --git a/libdecnumber/decContext.c b/libdecnumber/decContext.c
index 7d97a65ac5..1956edf0a7 100644
--- a/libdecnumber/decContext.c
+++ b/libdecnumber/decContext.c
@@ -53,12 +53,13 @@ static	const  Flag *mfctop=(Flag *)&mfcone; /* -> top byte */
 const uByte DECSTICKYTAB[10]={1,1,2,3,4,6,6,7,8,9}; /* used if sticky */
 
 /* ------------------------------------------------------------------ */
-/* Powers of ten (powers[n]==10**n, 0<=n<=9)			      */
+/* Powers of ten (powers[n]==10**n, 0<=n<=19)                         */
 /* ------------------------------------------------------------------ */
-const uLong DECPOWERS[19] = {1, 10, 100, 1000, 10000, 100000, 1000000,
+const uLong DECPOWERS[20] = {1, 10, 100, 1000, 10000, 100000, 1000000,
   10000000, 100000000, 1000000000, 10000000000ULL, 100000000000ULL,
   1000000000000ULL, 10000000000000ULL, 100000000000000ULL, 1000000000000000ULL,
-  10000000000000000ULL, 100000000000000000ULL, 1000000000000000000ULL, };
+  10000000000000000ULL, 100000000000000000ULL, 1000000000000000000ULL,
+  10000000000000000000ULL,};
 
 /* ------------------------------------------------------------------ */
 /* decContextClearStatus -- clear bits in current status	      */
diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 75c09ba052..4474f0dd11 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -264,6 +264,7 @@ static decNumber * decTrim(decNumber *, decContext *, Flag, Int *);
 static Int	   decUnitAddSub(const Unit *, Int, const Unit *, Int, Int,
 			      Unit *, Int);
 static Int	   decUnitCompare(const Unit *, Int, const Unit *, Int, Int);
+static bool        mulUInt128ByPowOf10(uLong *, uLong *, uInt);
 
 #if !DECSUBSET
 /* decFinish == decFinalize when no subset arithmetic needed */
@@ -542,6 +543,67 @@ Invalid:
     return 0;
 } /* decNumberIntegralToInt64 */
 
+/* ------------------------------------------------------------------ */
+/* decNumberIntegralToInt128 -- conversion to int128                  */
+/*                                                                    */
+/*  dn is the decNumber to convert.  dn is assumed to have been       */
+/*    rounded to a floating point integer value.                      */
+/*  set is the context for reporting errors                           */
+/*  returns the converted decNumber via plow and phigh                */
+/*                                                                    */
+/* Invalid is set if the decNumber is a NaN, Infinite or is out of    */
+/* range for a signed 128 bit integer.                                */
+/* ------------------------------------------------------------------ */
+
+void decNumberIntegralToInt128(const decNumber *dn, decContext *set,
+        uint64_t *plow, uint64_t *phigh)
+{
+    if (decNumberIsSpecial(dn) || (dn->exponent < 0) ||
+       (dn->digits + dn->exponent > 39)) {
+        goto Invalid;
+    } else {
+        int d;        /* work */
+        const Unit *up;   /* .. */
+        uint64_t lo = 0, hi = 0;
+        up = dn->lsu;     /* -> lsu */
+
+        for (d = (dn->digits - 1) / DECDPUN; d >= 0; d--) {
+            if (mulu128(&lo, &hi, DECDPUNMAX + 1)) {
+                /* overflow */
+                goto Invalid;
+            }
+            if (uadd64_overflow(lo, up[d], &lo)) {
+                if (uadd64_overflow(hi, 1, &hi)) {
+                    /* overflow */
+                    goto Invalid;
+                }
+            }
+        }
+
+        if (mulUInt128ByPowOf10(&lo, &hi, dn->exponent)) {
+            /* overflow */
+            goto Invalid;
+        }
+
+        if (decNumberIsNegative(dn)) {
+            if (lo == 0) {
+                *phigh = -hi;
+                *plow = 0;
+            } else {
+                *phigh = ~hi;
+                *plow = -lo;
+            }
+        } else {
+            *plow = lo;
+            *phigh = hi;
+        }
+
+        return;
+    }
+
+Invalid:
+    decContextSetStatus(set, DEC_Invalid_operation);
+} /* decNumberIntegralToInt128 */
 
 /* ------------------------------------------------------------------ */
 /* to-scientific-string -- conversion to numeric string		      */
@@ -7885,6 +7947,38 @@ static Int decGetDigits(Unit *uar, Int len) {
   return digits;
   } /* decGetDigits */
 
+/* ------------------------------------------------------------------ */
+/* mulUInt128ByPowOf10 -- multiply a 128-bit unsigned integer by a    */
+/* power of 10.                                                       */
+/*                                                                    */
+/*   The 128-bit factor composed of plow and phigh is multiplied      */
+/*   by 10^exp.                                                       */
+/*                                                                    */
+/*   plow   pointer to the low 64 bits of the first factor            */
+/*   phigh  pointer to the high 64 bits of the first factor           */
+/*   exp    the exponent of the power of 10 of the second factor      */
+/*                                                                    */
+/* If the result fits in 128 bits, returns false and the              */
+/* multiplication result through plow and phigh.                      */
+/* Otherwise, returns true.                                           */
+/* ------------------------------------------------------------------ */
+static bool mulUInt128ByPowOf10(uLong *plow, uLong *phigh, uInt pow10)
+{
+    while (pow10 >= ARRAY_SIZE(powers)) {
+        if (mulu128(plow, phigh, powers[ARRAY_SIZE(powers) - 1])) {
+            /* Overflow */
+            return true;
+        }
+        pow10 -= ARRAY_SIZE(powers) - 1;
+    }
+
+    if (pow10 > 0) {
+        return mulu128(plow, phigh, powers[pow10]);
+    } else {
+        return false;
+    }
+}
+
 #if DECTRACE | DECCHECK
 /* ------------------------------------------------------------------ */
 /* decNumberShow -- display a number [debug aid]		      */
-- 
2.25.1


