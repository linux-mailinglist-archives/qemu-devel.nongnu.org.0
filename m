Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCD370D9D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:17:47 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDqs-00079H-Cy
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKu-0001qs-8O
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKr-0005Jo-Ri
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso1896242pjn.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/02MvMcvcwaLo+V4KLVseMUFm3Gl9HzSInjVPGbUvE=;
 b=gf6Yv8wMxnj2dWl1qLvsqu+HwCxIxV3u+KPZka1B8Eg8cjqDER65VG6IZ14lt2NZ3G
 EdPvHi4HLYChEjnQI2CFUCfkw9xHizPlQTX7QME3+qAg5FpHnsZDMeC5AE3aEcjNj6An
 xDGQLpAZAKaMDsYsCfdf+o7bbc1TnYiGDKUg6UvN7knKFvJvYtdIwxC+RqWsbatuCbTg
 ZsVELAE++n+YYAGi6bg12DE3C8UXTj/Y208z21ALO2Abwd6vW3gBSHmfBrj3c58PKTJ9
 OIT9jZYNfbGLndIS6WyryK/60Ry4ZMCfm2Cvzy4UHKqY4yPhJBKAKvldeujrAYO1s10g
 V1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/02MvMcvcwaLo+V4KLVseMUFm3Gl9HzSInjVPGbUvE=;
 b=IStk+5B8B3SiGbgDVQrExPGZX59thmmo40qkWDnDg1m2QVpX35Ogiz61Oe3tz5zmhy
 CPZhjO+wch9UbJWMarGmjr4X3XHDH2GWH7ocs88iQbXHjYPOREMN0Zsr3XKU7EZ/G/BW
 jJ+0SsaoBYuN3qUallNozppIiqLUaTsv/2dd6bMbN/wuPOqQHLATM5VUE/nv67oL6CEQ
 hViZ7lya2vFFPMvG0xlv6n1hkybqi9T6hLVtpycje43EGAiRrQFcHsQjnYLiZ4/jljyO
 dqyoy8DRc3ALYGmwwVlXRmHhT1FNyeLP6tg9FLxL4LxgPAgURZQR2KCudFncCwend/D4
 aL9g==
X-Gm-Message-State: AOAM532j5Ug47FSzic/pRxXHuMIrJVJd9NMNsVK9NQf4cvQtADLYswUD
 KNQe0IGR4Qgy6l0XNxEL5weLxt4EYjY93w==
X-Google-Smtp-Source: ABdhPJzbqKS1F3juOP7HmLVCuu3zrUqLzH0bgpWZgr/xE/DHBG89t7FPlNq1fmQIkfED7F+p3jjtkg==
X-Received: by 2002:a17:902:e9d1:b029:ed:1bde:8e4 with SMTP id
 17-20020a170902e9d1b02900ed1bde08e4mr15878839plk.6.1619966680506; 
 Sun, 02 May 2021 07:44:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/31] Hexagon (target/hexagon) CABAC decode bin
Date: Sun,  2 May 2021 07:44:19 -0700
Message-Id: <20210502144419.1659844-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

The following instruction is added
    S2_cabacdecbin            Rdd32=decbin(Rss32,Rtt32)

Test cases added to tests/tcg/hexagon/misc.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-27-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.h                 |  4 ++
 target/hexagon/macros.h               |  7 +++
 target/hexagon/arch.c                 | 91 +++++++++++++++++++++++++++
 tests/tcg/hexagon/misc.c              | 28 +++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 target/hexagon/imported/macros.def    | 15 +++++
 target/hexagon/imported/shift.idef    | 47 ++++++++++++++
 7 files changed, 193 insertions(+)

diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index 3e0c334209..70918065d3 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -20,6 +20,10 @@
 
 #include "qemu/int128.h"
 
+extern const uint8_t rLPS_table_64x4[64][4];
+extern const uint8_t AC_next_state_MPS_64[64];
+extern const uint8_t AC_next_state_LPS_64[64];
+
 uint64_t interleave(uint32_t odd, uint32_t even);
 uint64_t deinterleave(uint64_t src);
 int32_t conv_round(int32_t a, int n);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index ec5bf60f5e..b726c3b791 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -222,6 +222,13 @@ static inline void gen_pred_cancel(TCGv pred, int slot_num)
     (((HIBIT) - (LOWBIT) + 1) ? \
         extract64((INREG), (LOWBIT), ((HIBIT) - (LOWBIT) + 1)) : \
         0LL)
+#define fINSERT_RANGE(INREG, HIBIT, LOWBIT, INVAL) \
+    do { \
+        int width = ((HIBIT) - (LOWBIT) + 1); \
+        INREG = (width >= 0 ? \
+            deposit64((INREG), (LOWBIT), width, (INVAL)) : \
+            INREG); \
+    } while (0)
 
 #define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)
 
diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index dee852e106..68a55b3bd4 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -27,6 +27,97 @@
 #define SF_MANTBITS    23
 #define float32_nan    make_float32(0xffffffff)
 
+/*
+ * These three tables are used by the cabacdecbin instruction
+ */
+const uint8_t rLPS_table_64x4[64][4] = {
+    {128, 176, 208, 240},
+    {128, 167, 197, 227},
+    {128, 158, 187, 216},
+    {123, 150, 178, 205},
+    {116, 142, 169, 195},
+    {111, 135, 160, 185},
+    {105, 128, 152, 175},
+    {100, 122, 144, 166},
+    {95, 116, 137, 158},
+    {90, 110, 130, 150},
+    {85, 104, 123, 142},
+    {81, 99, 117, 135},
+    {77, 94, 111, 128},
+    {73, 89, 105, 122},
+    {69, 85, 100, 116},
+    {66, 80, 95, 110},
+    {62, 76, 90, 104},
+    {59, 72, 86, 99},
+    {56, 69, 81, 94},
+    {53, 65, 77, 89},
+    {51, 62, 73, 85},
+    {48, 59, 69, 80},
+    {46, 56, 66, 76},
+    {43, 53, 63, 72},
+    {41, 50, 59, 69},
+    {39, 48, 56, 65},
+    {37, 45, 54, 62},
+    {35, 43, 51, 59},
+    {33, 41, 48, 56},
+    {32, 39, 46, 53},
+    {30, 37, 43, 50},
+    {29, 35, 41, 48},
+    {27, 33, 39, 45},
+    {26, 31, 37, 43},
+    {24, 30, 35, 41},
+    {23, 28, 33, 39},
+    {22, 27, 32, 37},
+    {21, 26, 30, 35},
+    {20, 24, 29, 33},
+    {19, 23, 27, 31},
+    {18, 22, 26, 30},
+    {17, 21, 25, 28},
+    {16, 20, 23, 27},
+    {15, 19, 22, 25},
+    {14, 18, 21, 24},
+    {14, 17, 20, 23},
+    {13, 16, 19, 22},
+    {12, 15, 18, 21},
+    {12, 14, 17, 20},
+    {11, 14, 16, 19},
+    {11, 13, 15, 18},
+    {10, 12, 15, 17},
+    {10, 12, 14, 16},
+    {9, 11, 13, 15},
+    {9, 11, 12, 14},
+    {8, 10, 12, 14},
+    {8, 9, 11, 13},
+    {7, 9, 11, 12},
+    {7, 9, 10, 12},
+    {7, 8, 10, 11},
+    {6, 8, 9, 11},
+    {6, 7, 9, 10},
+    {6, 7, 8, 9},
+    {2, 2, 2, 2}
+};
+
+const uint8_t AC_next_state_MPS_64[64] = {
+    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
+    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
+    21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
+    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
+    41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
+    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
+    61, 62, 62, 63
+};
+
+
+const uint8_t AC_next_state_LPS_64[64] = {
+    0, 0, 1, 2, 2, 4, 4, 5, 6, 7,
+    8, 9, 9, 11, 11, 12, 13, 13, 15, 15,
+    16, 16, 18, 18, 19, 19, 21, 21, 22, 22,
+    23, 24, 24, 25, 26, 26, 27, 27, 28, 29,
+    29, 30, 30, 30, 31, 32, 32, 33, 33, 33,
+    34, 34, 35, 35, 35, 36, 36, 36, 37, 37,
+    37, 38, 38, 63
+};
+
 #define BITS_MASK_8 0x5555555555555555ULL
 #define PAIR_MASK_8 0x3333333333333333ULL
 #define NYBL_MASK_8 0x0f0f0f0f0f0f0f0fULL
diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c
index e5d78b471f..17c39198fc 100644
--- a/tests/tcg/hexagon/misc.c
+++ b/tests/tcg/hexagon/misc.c
@@ -231,6 +231,14 @@ static void check(int val, int expect)
     }
 }
 
+static void check64(long long val, long long expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%016llx != 0x%016llx\n", val, expect);
+        err++;
+    }
+}
+
 uint32_t init[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
 uint32_t array[10];
 
@@ -264,6 +272,16 @@ static long long creg_pair(int x, int y)
     return retval;
 }
 
+static long long decbin(long long x, long long y, int *pred)
+{
+    long long retval;
+    asm ("%0 = decbin(%2, %3)\n\t"
+         "%1 = p0\n\t"
+         : "=r"(retval), "=r"(*pred)
+         : "r"(x), "r"(y));
+    return retval;
+}
+
 /* Check that predicates are auto-and'ed in a packet */
 static int auto_and(void)
 {
@@ -282,6 +300,8 @@ static int auto_and(void)
 
 int main()
 {
+    long long res64;
+    int pred;
 
     memcpy(array, init, sizeof(array));
     S4_storerhnew_rr(array, 4, 0xffff);
@@ -391,6 +411,14 @@ int main()
     res = test_clrtnew(2, 7);
     check(res, 7);
 
+    res64 = decbin(0xf0f1f2f3f4f5f6f7LL, 0x7f6f5f4f3f2f1f0fLL, &pred);
+    check64(res64, 0x357980003700010cLL);
+    check(pred, 0);
+
+    res64 = decbin(0xfLL, 0x1bLL, &pred);
+    check64(res64, 0x78000100LL);
+    check(pred, 1);
+
     res = auto_and();
     check(res, 0);
 
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index dc4eba4f68..35ae3d2369 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1767,6 +1767,7 @@ SH_RRR_ENC(S4_vxsubaddh,        "0001","01-","-","110","ddddd")
 SH_RRR_ENC(S4_vxaddsubhr,       "0001","11-","-","00-","ddddd")
 SH_RRR_ENC(S4_vxsubaddhr,       "0001","11-","-","01-","ddddd")
 SH_RRR_ENC(S4_extractp_rp,      "0001","11-","-","10-","ddddd")
+SH_RRR_ENC(S2_cabacdecbin,      "0001","11-","-","11-","ddddd") /* implicit P0 write */
 
 
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0010 -------- PP------ --------","[#2] Rdd=(Rss,Rtt,Pu)")
diff --git a/target/hexagon/imported/macros.def b/target/hexagon/imported/macros.def
index 56c99b1d64..32ed3bf8fc 100755
--- a/target/hexagon/imported/macros.def
+++ b/target/hexagon/imported/macros.def
@@ -92,6 +92,21 @@ DEF_MACRO(
     /* attribs */
 )
 
+
+DEF_MACRO(
+    fINSERT_RANGE,
+        {
+            int offset=LOWBIT;
+            int width=HIBIT-LOWBIT+1;
+            /* clear bits where new bits go */
+            INREG &= ~(((fCONSTLL(1)<<width)-1)<<offset);
+            /* OR in new bits */
+            INREG |= ((INVAL & ((fCONSTLL(1)<<width)-1)) << offset);
+        },
+    /* attribs */
+)
+
+
 DEF_MACRO(
     f8BITSOF,
     ( (VAL) ? 0xff : 0x00),
diff --git a/target/hexagon/imported/shift.idef b/target/hexagon/imported/shift.idef
index e328ab7329..b32c4e04d1 100644
--- a/target/hexagon/imported/shift.idef
+++ b/target/hexagon/imported/shift.idef
@@ -1029,6 +1029,53 @@ Q6INSN(S4_clbpaddi,"Rd32=add(clb(Rss32),#s6)",ATTRIBS(A_ARCHV2),
 { RdV = (fMAX(fCL1_8(RssV),fCL1_8(~RssV)))+siV;})
 
 
+
+Q6INSN(S2_cabacdecbin,"Rdd32=decbin(Rss32,Rtt32)",ATTRIBS(A_ARCHV3),"CABAC decode bin",
+{
+    fHIDE(size4u_t state;)
+    fHIDE(size4u_t valMPS;)
+    fHIDE(size4u_t bitpos;)
+    fHIDE(size4u_t range;)
+    fHIDE(size4u_t offset;)
+    fHIDE(size4u_t rLPS;)
+    fHIDE(size4u_t rMPS;)
+
+    state =  fEXTRACTU_RANGE( fGETWORD(1,RttV) ,5,0);
+    valMPS = fEXTRACTU_RANGE( fGETWORD(1,RttV) ,8,8);
+    bitpos = fEXTRACTU_RANGE( fGETWORD(0,RttV) ,4,0);
+    range =  fGETWORD(0,RssV);
+    offset = fGETWORD(1,RssV);
+
+    /* calculate rLPS */
+    range <<= bitpos;
+    offset <<= bitpos;
+    rLPS = rLPS_table_64x4[state][ (range >>29)&3];
+    rLPS  = rLPS << 23;   /* left aligned */
+
+    /* calculate rMPS */
+    rMPS= (range&0xff800000) - rLPS;
+
+    /* most probable region */
+    if (offset < rMPS) {
+        RddV = AC_next_state_MPS_64[state];
+        fINSERT_RANGE(RddV,8,8,valMPS);
+        fINSERT_RANGE(RddV,31,23,(rMPS>>23));
+        fSETWORD(1,RddV,offset);
+        fWRITE_P0(valMPS);
+
+
+    }
+    /* least probable region */
+    else {
+        RddV = AC_next_state_LPS_64[state];
+        fINSERT_RANGE(RddV,8,8,((!state)?(1-valMPS):(valMPS)));
+        fINSERT_RANGE(RddV,31,23,(rLPS>>23));
+        fSETWORD(1,RddV,(offset-rMPS));
+        fWRITE_P0((valMPS^1));
+    }
+})
+
+
 Q6INSN(S2_clb,"Rd32=clb(Rs32)",ATTRIBS(),
 "Count leading bits", {RdV = fMAX(fCL1_4(RsV),fCL1_4(~RsV));})
 
-- 
2.25.1


