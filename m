Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2972348759
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:09:26 +0100 (CET)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGNC-0006KS-1q
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG51-0003Qb-KU
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6814)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4s-0002bd-FY
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640630; x=1648176630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DHBS+IU3t5+v+j/qirksZWBS4n5gsUi6TnmyD0fokvk=;
 b=INyKsyw2vctxeCTff0Q3rFd2F5fjY9KwQbaLfBraouxD7W3tNCevm64t
 tdHRTtqdOgKKEp0IZPeDcZtbLOf6D6boXKwbFRVtXclYL0aye5gDH/Pu5
 VxVC77vETXSYyISZldWKyTd+ckF9X4YYKDN4PVw7o1FtkTCo5Sra3CEWz A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 19:50:14 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 24 Mar 2021 19:50:13 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 16BA71742; Wed, 24 Mar 2021 21:50:12 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] Hexagon (target/hexagon) load and unpack bytes
 instructions
Date: Wed, 24 Mar 2021 21:50:08 -0500
Message-Id: <1616640610-17319-14-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following instructions are added
    L2_loadbzw2_io          Rd32 = memubh(Rs32+#s11:1)
    L2_loadbzw4_io          Rdd32 = memubh(Rs32+#s11:1)
    L2_loadbsw2_io          Rd32 = membh(Rs32+#s11:1)
    L2_loadbsw4_io          Rdd32 = membh(Rs32+#s11:1)

    L4_loadbzw2_ur          Rd32 = memubh(Rt32<<#u2+#U6)
    L4_loadbzw4_ur          Rdd32 = memubh(Rt32<<#u2+#U6)
    L4_loadbsw2_ur          Rd32 = membh(Rt32<<#u2+#U6)
    L4_loadbsw4_ur          Rdd32 = membh(Rt32<<#u2+#U6)

    L4_loadbzw2_ap          Rd32 = memubh(Re32=#U6)
    L4_loadbzw4_ap          Rdd32 = memubh(Re32=#U6)
    L4_loadbsw2_ap          Rd32 = membh(Re32=#U6)
    L4_loadbsw4_ap          Rdd32 = membh(Re32=#U6)

    L2_loadbzw2_pr          Rd32 = memubh(Rx32++Mu2)
    L2_loadbzw4_pr          Rdd32 = memubh(Rx32++Mu2)
    L2_loadbsw2_pr          Rd32 = membh(Rx32++Mu2)
    L2_loadbsw4_pr          Rdd32 = membh(Rx32++Mu2)

    L2_loadbzw2_pbr         Rd32 = memubh(Rx32++Mu2:brev)
    L2_loadbzw4_pbr         Rdd32 = memubh(Rx32++Mu2:brev)
    L2_loadbsw2_pbr         Rd32 = membh(Rx32++Mu2:brev)
    L2_loadbsw4_pbr         Rdd32 = membh(Rx32++Mu2:brev)

    L2_loadbzw2_pi          Rd32 = memubh(Rx32++#s4:1)
    L2_loadbzw4_pi          Rdd32 = memubh(Rx32++#s4:1)
    L2_loadbsw2_pi          Rd32 = membh(Rx32++#s4:1)
    L2_loadbsw4_pi          Rdd32 = membh(Rx32++#s4:1)

    L2_loadbzw2_pci         Rd32 = memubh(Rx32++#s4:1:circ(Mu2))
    L2_loadbzw4_pci         Rdd32 = memubh(Rx32++#s4:1:circ(Mu2))
    L2_loadbsw2_pci         Rd32 = membh(Rx32++#s4:1:circ(Mu2))
    L2_loadbsw4_pci         Rdd32 = membh(Rx32++#s4:1:circ(Mu2))

    L2_loadbzw2_pcr         Rd32 = memubh(Rx32++I:circ(Mu2))
    L2_loadbzw4_pcr         Rdd32 = memubh(Rx32++I:circ(Mu2))
    L2_loadbsw2_pcr         Rd32 = membh(Rx32++I:circ(Mu2))
    L2_loadbsw4_pcr         Rdd32 = membh(Rx32++I:circ(Mu2))

Test cases in tests/tcg/hexagon/load_unpack.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              | 118 +++++++++
 target/hexagon/genptr.c               |  13 +
 target/hexagon/imported/encode_pp.def |   6 +
 target/hexagon/imported/ldst.idef     |  43 +++
 target/hexagon/macros.h               |  27 +-
 tests/tcg/hexagon/Makefile.target     |   1 +
 tests/tcg/hexagon/load_unpack.c       | 474 ++++++++++++++++++++++++++++++++++
 7 files changed, 681 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/hexagon/load_unpack.c

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 038e16e..55ba5f2 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -167,6 +167,124 @@
 #define fGEN_TCG_L2_loadrd_pi(SHORTCODE)       SHORTCODE
 
 /*
+ * These instructions load 2 bytes and places them in
+ * two halves of the destination register.
+ * The GET_EA macro determines the addressing mode.
+ * The fGB macro determines whether to zero-extend or
+ * sign-extend.
+ */
+#define fGEN_TCG_loadbXw2(GET_EA, fGB) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        TCGv tmpV = tcg_temp_new(); \
+        TCGv BYTE = tcg_temp_new(); \
+        int i; \
+        GET_EA; \
+        fLOAD(1, 2, u, EA, tmpV); \
+        tcg_gen_movi_tl(RdV, 0); \
+        for (i = 0; i < 2; i++) { \
+            fSETHALF(i, RdV, fGB(i, tmpV)); \
+        } \
+        tcg_temp_free(ireg); \
+        tcg_temp_free(tmp); \
+        tcg_temp_free(tmpV); \
+        tcg_temp_free(BYTE); \
+    } while (0)
+
+#define fGEN_TCG_L2_loadbzw2_io(SHORTCODE) \
+    fGEN_TCG_loadbXw2(fEA_RI(RsV, siV), fGETUBYTE)
+#define fGEN_TCG_L4_loadbzw2_ur(SHORTCODE) \
+    fGEN_TCG_loadbXw2(fEA_IRs(UiV, RtV, uiV), fGETUBYTE)
+#define fGEN_TCG_L2_loadbsw2_io(SHORTCODE) \
+    fGEN_TCG_loadbXw2(fEA_RI(RsV, siV), fGETBYTE)
+#define fGEN_TCG_L4_loadbsw2_ur(SHORTCODE) \
+    fGEN_TCG_loadbXw2(fEA_IRs(UiV, RtV, uiV), fGETBYTE)
+#define fGEN_TCG_L4_loadbzw2_ap(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_ap, fGETUBYTE)
+#define fGEN_TCG_L2_loadbzw2_pr(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pr, fGETUBYTE)
+#define fGEN_TCG_L2_loadbzw2_pbr(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pbr, fGETUBYTE)
+#define fGEN_TCG_L2_loadbzw2_pi(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pi, fGETUBYTE)
+#define fGEN_TCG_L4_loadbsw2_ap(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_ap, fGETBYTE)
+#define fGEN_TCG_L2_loadbsw2_pr(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pr, fGETBYTE)
+#define fGEN_TCG_L2_loadbsw2_pbr(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pbr, fGETBYTE)
+#define fGEN_TCG_L2_loadbsw2_pi(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pi, fGETBYTE)
+#define fGEN_TCG_L2_loadbzw2_pci(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pci, fGETUBYTE)
+#define fGEN_TCG_L2_loadbsw2_pci(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pci, fGETBYTE)
+#define fGEN_TCG_L2_loadbzw2_pcr(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pcr(1), fGETUBYTE)
+#define fGEN_TCG_L2_loadbsw2_pcr(SHORTCODE) \
+    fGEN_TCG_loadbXw2(GET_EA_pcr(1), fGETBYTE)
+
+/*
+ * These instructions load 4 bytes and places them in
+ * four halves of the destination register pair.
+ * The GET_EA macro determines the addressing mode.
+ * The fGB macro determines whether to zero-extend or
+ * sign-extend.
+ */
+#define fGEN_TCG_loadbXw4(GET_EA, fGB) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        TCGv tmpV = tcg_temp_new(); \
+        TCGv BYTE = tcg_temp_new(); \
+        int i; \
+        GET_EA; \
+        fLOAD(1, 4, u, EA, tmpV);  \
+        tcg_gen_movi_i64(RddV, 0); \
+        for (i = 0; i < 4; i++) { \
+            fSETHALF(i, RddV, fGB(i, tmpV));  \
+        }  \
+        tcg_temp_free(ireg); \
+        tcg_temp_free(tmp); \
+        tcg_temp_free(tmpV); \
+        tcg_temp_free(BYTE); \
+    } while (0)
+
+#define fGEN_TCG_L2_loadbzw4_io(SHORTCODE) \
+    fGEN_TCG_loadbXw4(fEA_RI(RsV, siV), fGETUBYTE)
+#define fGEN_TCG_L4_loadbzw4_ur(SHORTCODE) \
+    fGEN_TCG_loadbXw4(fEA_IRs(UiV, RtV, uiV), fGETUBYTE)
+#define fGEN_TCG_L2_loadbsw4_io(SHORTCODE) \
+    fGEN_TCG_loadbXw4(fEA_RI(RsV, siV), fGETBYTE)
+#define fGEN_TCG_L4_loadbsw4_ur(SHORTCODE) \
+    fGEN_TCG_loadbXw4(fEA_IRs(UiV, RtV, uiV), fGETBYTE)
+#define fGEN_TCG_L2_loadbzw4_pci(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pci, fGETUBYTE)
+#define fGEN_TCG_L2_loadbsw4_pci(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pci, fGETBYTE)
+#define fGEN_TCG_L2_loadbzw4_pcr(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pcr(2), fGETUBYTE)
+#define fGEN_TCG_L2_loadbsw4_pcr(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pcr(2), fGETBYTE)
+#define fGEN_TCG_L4_loadbzw4_ap(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_ap, fGETUBYTE)
+#define fGEN_TCG_L2_loadbzw4_pr(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pr, fGETUBYTE)
+#define fGEN_TCG_L2_loadbzw4_pbr(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pbr, fGETUBYTE)
+#define fGEN_TCG_L2_loadbzw4_pi(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pi, fGETUBYTE)
+#define fGEN_TCG_L4_loadbsw4_ap(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_ap, fGETBYTE)
+#define fGEN_TCG_L2_loadbsw4_pr(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pr, fGETBYTE)
+#define fGEN_TCG_L2_loadbsw4_pbr(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pbr, fGETBYTE)
+#define fGEN_TCG_L2_loadbsw4_pi(SHORTCODE) \
+    fGEN_TCG_loadbXw4(GET_EA_pi, fGETBYTE)
+
+/*
  * Predicated loads
  * Here is a primer to understand the tag names
  *
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index aaa2901..3e1d7ba 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -308,6 +308,19 @@ static inline TCGv gen_get_half(TCGv result, int N, TCGv src, bool sign)
     return result;
 }
 
+static inline void gen_set_half(int N, TCGv result, TCGv src)
+{
+    tcg_gen_deposit_tl(result, result, src, N * 16, 16);
+}
+
+static inline void gen_set_half_i64(int N, TCGv_i64 result, TCGv src)
+{
+    TCGv_i64 src64 = tcg_temp_new_i64();
+    tcg_gen_extu_i32_i64(src64, src);
+    tcg_gen_deposit_i64(result, result, src64, N * 16, 16);
+    tcg_temp_free_i64(src64);
+}
+
 static inline void gen_set_byte(int N, TCGv result, TCGv src)
 {
     tcg_gen_deposit_tl(result, result, src, N * 8, 8);
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 4464926..e3582eb 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -342,6 +342,12 @@ DEF_ENC32(L4_pload##TAG##fnew_abs,ICLASS_LD" 1 11 "OPC"  iiiii  PP111tti  1--ddd
 
 
 /*               0 000  misc: dealloc,loadw_locked,dcfetch      */
+STD_LD_ENC(bzw4,"0 101")
+STD_LD_ENC(bzw2,"0 011")
+
+STD_LD_ENC(bsw4,"0 111")
+STD_LD_ENC(bsw2,"0 001")
+
 STD_LD_ENC(rb,  "1 000")
 STD_LD_ENC(rub, "1 001")
 STD_LD_ENC(rh,  "1 010")
diff --git a/target/hexagon/imported/ldst.idef b/target/hexagon/imported/ldst.idef
index fe7e018..95c0470 100644
--- a/target/hexagon/imported/ldst.idef
+++ b/target/hexagon/imported/ldst.idef
@@ -38,6 +38,49 @@ STD_LD_AMODES(loadrh, "Rd32=memh", "Load signed Half integer",ATTRIBS(A_LOAD),"1
 STD_LD_AMODES(loadri, "Rd32=memw", "Load Word",ATTRIBS(A_LOAD),"2",fLOAD(1,4,u,EA,RdV),2)
 STD_LD_AMODES(loadrd, "Rdd32=memd","Load Double integer",ATTRIBS(A_LOAD),"3",fLOAD(1,8,u,EA,RddV),3)
 
+/* These instructions do a load an unpack */
+STD_LD_AMODES(loadbzw2, "Rd32=memubh", "Load Bytes and Vector Zero-Extend (unpack)",
+ATTRIBS(A_LOAD),"1",
+{fHIDE(size2u_t tmpV; int i;)
+ fLOAD(1,2,u,EA,tmpV);
+ for (i=0;i<2;i++) {
+  fSETHALF(i,RdV,fGETUBYTE(i,tmpV));
+ }
+},1)
+
+STD_LD_AMODES(loadbzw4, "Rdd32=memubh", "Load Bytes and Vector Zero-Extend (unpack)",
+ATTRIBS(A_LOAD),"2",
+{fHIDE(size4u_t tmpV; int i;)
+ fLOAD(1,4,u,EA,tmpV);
+ for (i=0;i<4;i++) {
+  fSETHALF(i,RddV,fGETUBYTE(i,tmpV));
+ }
+},2)
+
+
+
+/* These instructions do a load an unpack */
+STD_LD_AMODES(loadbsw2, "Rd32=membh", "Load Bytes and Vector Sign-Extend (unpack)",
+ATTRIBS(A_LOAD),"1",
+{fHIDE(size2u_t tmpV; int i;)
+ fLOAD(1,2,u,EA,tmpV);
+ for (i=0;i<2;i++) {
+  fSETHALF(i,RdV,fGETBYTE(i,tmpV));
+ }
+},1)
+
+STD_LD_AMODES(loadbsw4, "Rdd32=membh", "Load Bytes and Vector Sign-Extend (unpack)",
+ATTRIBS(A_LOAD),"2",
+{fHIDE(size4u_t tmpV; int i;)
+ fLOAD(1,4,u,EA,tmpV);
+ for (i=0;i<4;i++) {
+  fSETHALF(i,RddV,fGETBYTE(i,tmpV));
+ }
+},2)
+
+
+
+
 /* The set of addressing modes standard to all Store instructions */
 #define STD_ST_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SEMANTICS,SCALE)\
 Q6INSN(S2_##TAG##_io,  OPER"(Rs32+#s11:"SHFT")="DEST,     ATTRIB,DESCR,{fIMMEXT(siV); fEA_RI(RsV,siV); SEMANTICS; })\
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index ce2b3d2..e4aec8d 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -477,6 +477,21 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
 #define fCAST8S_16S(A) (int128_exts64(A))
 #define fCAST16S_8S(A) (int128_getlo(A))
 
+#ifdef QEMU_GENERATE
+#define fEA_RI(REG, IMM) tcg_gen_addi_tl(EA, REG, IMM)
+#define fEA_RRs(REG, REG2, SCALE) \
+    do { \
+        TCGv tmp = tcg_temp_new(); \
+        tcg_gen_shli_tl(tmp, REG2, SCALE); \
+        tcg_gen_add_tl(EA, REG, tmp); \
+        tcg_temp_free(tmp); \
+    } while (0)
+#define fEA_IRs(IMM, REG, SCALE) \
+    do { \
+        tcg_gen_shli_tl(EA, REG, SCALE); \
+        tcg_gen_addi_tl(EA, EA, IMM); \
+    } while (0)
+#else
 #define fEA_RI(REG, IMM) \
     do { \
         EA = REG + IMM; \
@@ -489,6 +504,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
     do { \
         EA = IMM + (REG << SCALE); \
     } while (0)
+#endif
 
 #ifdef QEMU_GENERATE
 #define fEA_IMM(IMM) tcg_gen_movi_tl(EA, IMM)
@@ -636,10 +652,18 @@ static inline void gen_fbrev(TCGv result, TCGv src)
 #ifdef QEMU_GENERATE
 #define fGETHALF(N, SRC)  gen_get_half(HALF, N, SRC, true)
 #define fGETUHALF(N, SRC) gen_get_half(HALF, N, SRC, false)
+
+#define SETHALF_FUNC(X) \
+    __builtin_choose_expr(TYPE_TCGV(X), \
+        gen_set_half, \
+        __builtin_choose_expr(TYPE_TCGV_I64(X), \
+            gen_set_half_i64, (void)0))
+#define fSETHALF(N, DST, VAL) SETHALF_FUNC(DST)(N, DST, VAL)
+#define fSETHALFw(N, DST, VAL) gen_set_half(N, DST, VAL)
+#define fSETHALFd(N, DST, VAL) gen_set_half_i64(N, DST, VAL)
 #else
 #define fGETHALF(N, SRC) ((int16_t)((SRC >> ((N) * 16)) & 0xffff))
 #define fGETUHALF(N, SRC) ((uint16_t)((SRC >> ((N) * 16)) & 0xffff))
-#endif
 #define fSETHALF(N, DST, VAL) \
     do { \
         DST = (DST & ~(0x0ffffLL << ((N) * 16))) | \
@@ -647,6 +671,7 @@ static inline void gen_fbrev(TCGv result, TCGv src)
     } while (0)
 #define fSETHALFw fSETHALF
 #define fSETHALFd fSETHALF
+#endif
 
 #ifdef QEMU_GENERATE
 #define GETWORD_FUNC(X) \
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 98cd4ab..5411eee 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -43,6 +43,7 @@ HEX_TESTS += multi_result
 HEX_TESTS += mem_noshuf
 HEX_TESTS += circ
 HEX_TESTS += brev
+HEX_TESTS += load_unpack
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 
diff --git a/tests/tcg/hexagon/load_unpack.c b/tests/tcg/hexagon/load_unpack.c
new file mode 100644
index 0000000..3575a37
--- /dev/null
+++ b/tests/tcg/hexagon/load_unpack.c
@@ -0,0 +1,474 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Test load unpack instructions
+ *
+ * Example
+ *     r0 = memubh(r1+#0)
+ * loads a half word from memory and zero-extends the 2 bytes to form a word
+ *
+ * For each addressing mode, there are 4 tests
+ *     bzw2          unsigned     2 elements
+ *     bsw2          signed       2 elements
+ *     bzw4          unsigned     4 elements
+ *     bsw4          signed       4 elements
+ * There are 8 addressing modes, for a total of 32 instructions to test
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+int err;
+
+char buf[16] __attribute__((aligned(1 << 16)));
+
+void init_buf(void)
+{
+    int i;
+    for (i = 0; i < 16; i++) {
+        int sign = i % 2 == 0 ? 0x80 : 0;
+        buf[i] = sign | (i + 1);
+    }
+}
+
+void __check(int line, long long result, long long expect)
+{
+    if (result != expect) {
+        printf("ERROR at line %d: 0x%08llx != 0x%08llx\n",
+               line, result, expect);
+        err++;
+    }
+}
+
+#define check(RES, EXP) __check(__LINE__, RES, EXP)
+
+void __checkp(int line, void *p, void *expect)
+{
+    if (p != expect) {
+        printf("ERROR at line %d: 0x%p != 0x%p\n", line, p, expect);
+        err++;
+    }
+}
+
+#define checkp(RES, EXP) __checkp(__LINE__, RES, EXP)
+
+/*
+ ****************************************************************************
+ * _io addressing mode (addr + offset)
+ */
+#define BxW_LOAD_io(SZ, RES, ADDR, OFF) \
+    __asm__( \
+        "%0 = mem" #SZ "(%1+#" #OFF ")\n\t" \
+        : "=r"(RES) \
+        : "r"(ADDR))
+#define BxW_LOAD_io_Z(RES, ADDR, OFF) \
+    BxW_LOAD_io(ubh, RES, ADDR, OFF)
+#define BxW_LOAD_io_S(RES, ADDR, OFF) \
+    BxW_LOAD_io(bh, RES, ADDR, OFF)
+
+#define TEST_io(NAME, TYPE, SIGN, SIZE, EXT, EXP1, EXP2, EXP3, EXP4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    init_buf(); \
+    BxW_LOAD_io_##SIGN(result, buf, 0 * (SIZE)); \
+    check(result, (EXP1) | (EXT)); \
+    BxW_LOAD_io_##SIGN(result, buf, 1 * (SIZE)); \
+    check(result, (EXP2) | (EXT)); \
+    BxW_LOAD_io_##SIGN(result, buf, 2 * (SIZE)); \
+    check(result, (EXP3) | (EXT)); \
+    BxW_LOAD_io_##SIGN(result, buf, 3 * (SIZE)); \
+    check(result, (EXP4) | (EXT)); \
+}
+
+
+TEST_io(loadbzw2_io, int, Z, 2, 0x00000000,
+        0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_io(loadbsw2_io, int, S, 2, 0x0000ff00,
+        0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_io(loadbzw4_io, long long, Z,  4, 0x0000000000000000LL,
+        0x0004008300020081LL, 0x0008008700060085LL,
+        0x000c008b000a0089LL, 0x0010008f000e008dLL)
+TEST_io(loadbsw4_io, long long, S,  4, 0x0000ff000000ff00LL,
+        0x0004008300020081LL, 0x0008008700060085LL,
+        0x000c008b000a0089LL, 0x0010008f000e008dLL)
+
+/*
+ ****************************************************************************
+ * _ur addressing mode (index << offset + base)
+ */
+#define BxW_LOAD_ur(SZ, RES, SHIFT, IDX) \
+    __asm__( \
+        "%0 = mem" #SZ "(%1<<#" #SHIFT " + ##buf)\n\t" \
+        : "=r"(RES) \
+        : "r"(IDX))
+#define BxW_LOAD_ur_Z(RES, SHIFT, IDX) \
+    BxW_LOAD_ur(ubh, RES, SHIFT, IDX)
+#define BxW_LOAD_ur_S(RES, SHIFT, IDX) \
+    BxW_LOAD_ur(bh, RES, SHIFT, IDX)
+
+#define TEST_ur(NAME, TYPE, SIGN, SHIFT, EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    init_buf(); \
+    BxW_LOAD_ur_##SIGN(result, (SHIFT), 0); \
+    check(result, (RES1) | (EXT)); \
+    BxW_LOAD_ur_##SIGN(result, (SHIFT), 1); \
+    check(result, (RES2) | (EXT)); \
+    BxW_LOAD_ur_##SIGN(result, (SHIFT), 2); \
+    check(result, (RES3) | (EXT)); \
+    BxW_LOAD_ur_##SIGN(result, (SHIFT), 3); \
+    check(result, (RES4) | (EXT)); \
+} \
+
+TEST_ur(loadbzw2_ur, int, Z, 1, 0x00000000,
+        0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_ur(loadbsw2_ur, int, S, 1, 0x0000ff00,
+        0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_ur(loadbzw4_ur, long long, Z, 2, 0x0000000000000000LL,
+        0x0004008300020081LL, 0x0008008700060085LL,
+        0x000c008b000a0089LL, 0x0010008f000e008dLL)
+TEST_ur(loadbsw4_ur, long long, S, 2, 0x0000ff000000ff00LL,
+        0x0004008300020081LL, 0x0008008700060085LL,
+        0x000c008b000a0089LL, 0x0010008f000e008dLL)
+
+/*
+ ****************************************************************************
+ * _ap addressing mode (addr = base)
+ */
+#define BxW_LOAD_ap(SZ, RES, PTR, ADDR) \
+    __asm__( \
+        "%0 = mem" #SZ "(%1 = ##" #ADDR ")\n\t" \
+        : "=r"(RES), "=r"(PTR))
+#define BxW_LOAD_ap_Z(RES, PTR, ADDR) \
+    BxW_LOAD_ap(ubh, RES, PTR, ADDR)
+#define BxW_LOAD_ap_S(RES, PTR, ADDR) \
+    BxW_LOAD_ap(bh, RES, PTR, ADDR)
+
+#define TEST_ap(NAME, TYPE, SIGN, SIZE, EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    void *ptr; \
+    init_buf(); \
+    BxW_LOAD_ap_##SIGN(result, ptr, (buf + 0 * (SIZE))); \
+    check(result, (RES1) | (EXT)); \
+    checkp(ptr, &buf[0 * (SIZE)]); \
+    BxW_LOAD_ap_##SIGN(result, ptr, (buf + 1 * (SIZE))); \
+    check(result, (RES2) | (EXT)); \
+    checkp(ptr, &buf[1 * (SIZE)]); \
+    BxW_LOAD_ap_##SIGN(result, ptr, (buf + 2 * (SIZE))); \
+    check(result, (RES3) | (EXT)); \
+    checkp(ptr, &buf[2 * (SIZE)]); \
+    BxW_LOAD_ap_##SIGN(result, ptr, (buf + 3 * (SIZE))); \
+    check(result, (RES4) | (EXT)); \
+    checkp(ptr, &buf[3 * (SIZE)]); \
+}
+
+TEST_ap(loadbzw2_ap, int, Z, 2, 0x00000000,
+        0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_ap(loadbsw2_ap, int, S, 2, 0x0000ff00,
+        0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_ap(loadbzw4_ap, long long, Z, 4, 0x0000000000000000LL,
+        0x0004008300020081LL, 0x0008008700060085LL,
+        0x000c008b000a0089LL, 0x0010008f000e008dLL)
+TEST_ap(loadbsw4_ap, long long, S, 4, 0x0000ff000000ff00LL,
+        0x0004008300020081LL, 0x0008008700060085LL,
+        0x000c008b000a0089LL, 0x0010008f000e008dLL)
+
+/*
+ ****************************************************************************
+ * _rp addressing mode (addr ++ modifer-reg)
+ */
+#define BxW_LOAD_pr(SZ, RES, PTR, INC) \
+    __asm__( \
+        "m0 = %2\n\t" \
+        "%0 = mem" #SZ "(%1++m0)\n\t" \
+        : "=r"(RES), "+r"(PTR) \
+        : "r"(INC) \
+        : "m0")
+#define BxW_LOAD_pr_Z(RES, PTR, INC) \
+    BxW_LOAD_pr(ubh, RES, PTR, INC)
+#define BxW_LOAD_pr_S(RES, PTR, INC) \
+    BxW_LOAD_pr(bh, RES, PTR, INC)
+
+#define TEST_pr(NAME, TYPE, SIGN, SIZE, EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    void *ptr = buf; \
+    init_buf(); \
+    BxW_LOAD_pr_##SIGN(result, ptr, (SIZE)); \
+    check(result, (RES1) | (EXT)); \
+    checkp(ptr, &buf[1 * (SIZE)]); \
+    BxW_LOAD_pr_##SIGN(result, ptr, (SIZE)); \
+    check(result, (RES2) | (EXT)); \
+    checkp(ptr, &buf[2 * (SIZE)]); \
+    BxW_LOAD_pr_##SIGN(result, ptr, (SIZE)); \
+    check(result, (RES3) | (EXT)); \
+    checkp(ptr, &buf[3 * (SIZE)]); \
+    BxW_LOAD_pr_##SIGN(result, ptr, (SIZE)); \
+    check(result, (RES4) | (EXT)); \
+    checkp(ptr, &buf[4 * (SIZE)]); \
+}
+
+TEST_pr(loadbzw2_pr, int, Z, 2, 0x00000000,
+    0x00020081, 0x0040083, 0x00060085, 0x00080087)
+TEST_pr(loadbsw2_pr, int, S, 2, 0x0000ff00,
+    0x00020081, 0x0040083, 0x00060085, 0x00080087)
+TEST_pr(loadbzw4_pr, long long, Z, 4, 0x0000000000000000LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x000c008b000a0089LL, 0x0010008f000e008dLL)
+TEST_pr(loadbsw4_pr, long long, S, 4, 0x0000ff000000ff00LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x000c008b000a0089LL, 0x0010008f000e008dLL)
+
+/*
+ ****************************************************************************
+ * _pbr addressing mode (addr ++ modifer-reg:brev)
+ */
+#define BxW_LOAD_pbr(SZ, RES, PTR) \
+    __asm__( \
+        "r4 = #(1 << (16 - 3))\n\t" \
+        "m0 = r4\n\t" \
+        "%0 = mem" #SZ "(%1++m0:brev)\n\t" \
+        : "=r"(RES), "+r"(PTR) \
+        : \
+        : "r4", "m0")
+#define BxW_LOAD_pbr_Z(RES, PTR) \
+    BxW_LOAD_pbr(ubh, RES, PTR)
+#define BxW_LOAD_pbr_S(RES, PTR) \
+    BxW_LOAD_pbr(bh, RES, PTR)
+
+#define TEST_pbr(NAME, TYPE, SIGN, EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    void *ptr = buf; \
+    init_buf(); \
+    BxW_LOAD_pbr_##SIGN(result, ptr); \
+    check(result, (RES1) | (EXT)); \
+    BxW_LOAD_pbr_##SIGN(result, ptr); \
+    check(result, (RES2) | (EXT)); \
+    BxW_LOAD_pbr_##SIGN(result, ptr); \
+    check(result, (RES3) | (EXT)); \
+    BxW_LOAD_pbr_##SIGN(result, ptr); \
+    check(result, (RES4) | (EXT)); \
+}
+
+TEST_pbr(loadbzw2_pbr, int, Z, 0x00000000,
+    0x00020081, 0x00060085, 0x00040083, 0x00080087)
+TEST_pbr(loadbsw2_pbr, int, S, 0x0000ff00,
+    0x00020081, 0x00060085, 0x00040083, 0x00080087)
+TEST_pbr(loadbzw4_pbr, long long, Z, 0x0000000000000000LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x0006008500040083LL, 0x000a008900080087LL)
+TEST_pbr(loadbsw4_pbr, long long, S, 0x0000ff000000ff00LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x0006008500040083LL, 0x000a008900080087LL)
+
+/*
+ ****************************************************************************
+ * _pi addressing mode (addr ++ inc)
+ */
+#define BxW_LOAD_pi(SZ, RES, PTR, INC) \
+    __asm__( \
+        "%0 = mem" #SZ "(%1++#" #INC ")\n\t" \
+        : "=r"(RES), "+r"(PTR))
+#define BxW_LOAD_pi_Z(RES, PTR, INC) \
+    BxW_LOAD_pi(ubh, RES, PTR, INC)
+#define BxW_LOAD_pi_S(RES, PTR, INC) \
+    BxW_LOAD_pi(bh, RES, PTR, INC)
+
+#define TEST_pi(NAME, TYPE, SIGN, INC, EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    void *ptr = buf; \
+    init_buf(); \
+    BxW_LOAD_pi_##SIGN(result, ptr, (INC)); \
+    check(result, (RES1) | (EXT)); \
+    checkp(ptr, &buf[1 * (INC)]); \
+    BxW_LOAD_pi_##SIGN(result, ptr, (INC)); \
+    check(result, (RES2) | (EXT)); \
+    checkp(ptr, &buf[2 * (INC)]); \
+    BxW_LOAD_pi_##SIGN(result, ptr, (INC)); \
+    check(result, (RES3) | (EXT)); \
+    checkp(ptr, &buf[3 * (INC)]); \
+    BxW_LOAD_pi_##SIGN(result, ptr, (INC)); \
+    check(result, (RES4) | (EXT)); \
+    checkp(ptr, &buf[4 * (INC)]); \
+}
+
+TEST_pi(loadbzw2_pi, int, Z, 2, 0x00000000,
+    0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_pi(loadbsw2_pi, int, S, 2, 0x0000ff00,
+    0x00020081, 0x00040083, 0x00060085, 0x00080087)
+TEST_pi(loadbzw4_pi, long long, Z, 4, 0x0000000000000000LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x000c008b000a0089LL, 0x0010008f000e008dLL)
+TEST_pi(loadbsw4_pi, long long, S, 4, 0x0000ff000000ff00LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x000c008b000a0089LL, 0x0010008f000e008dLL)
+
+/*
+ ****************************************************************************
+ * _pci addressing mode (addr ++ inc:circ)
+ */
+#define BxW_LOAD_pci(SZ, RES, PTR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %3\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %2\n\t" \
+        "%0 = mem" #SZ "(%1++#" #INC ":circ(m0))\n\t" \
+        : "=r"(RES), "+r"(PTR) \
+        : "r"(START), "r"(LEN) \
+        : "r4", "m0", "cs0")
+#define BxW_LOAD_pci_Z(RES, PTR, START, LEN, INC) \
+    BxW_LOAD_pci(ubh, RES, PTR, START, LEN, INC)
+#define BxW_LOAD_pci_S(RES, PTR, START, LEN, INC) \
+    BxW_LOAD_pci(bh, RES, PTR, START, LEN, INC)
+
+#define TEST_pci(NAME, TYPE, SIGN, LEN, INC, EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    void *ptr = buf; \
+    init_buf(); \
+    BxW_LOAD_pci_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES1) | (EXT)); \
+    checkp(ptr, &buf[(1 * (INC)) % (LEN)]); \
+    BxW_LOAD_pci_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES2) | (EXT)); \
+    checkp(ptr, &buf[(2 * (INC)) % (LEN)]); \
+    BxW_LOAD_pci_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES3) | (EXT)); \
+    checkp(ptr, &buf[(3 * (INC)) % (LEN)]); \
+    BxW_LOAD_pci_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES4) | (EXT)); \
+    checkp(ptr, &buf[(4 * (INC)) % (LEN)]); \
+}
+
+TEST_pci(loadbzw2_pci, int, Z, 6, 2, 0x00000000,
+    0x00020081, 0x00040083, 0x00060085, 0x00020081)
+TEST_pci(loadbsw2_pci, int, S, 6, 2, 0x0000ff00,
+    0x00020081, 0x00040083, 0x00060085, 0x00020081)
+TEST_pci(loadbzw4_pci, long long, Z, 8, 4, 0x0000000000000000LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x0004008300020081LL, 0x0008008700060085LL)
+TEST_pci(loadbsw4_pci, long long, S, 8, 4, 0x0000ff000000ff00LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x0004008300020081LL, 0x0008008700060085LL)
+
+/*
+ ****************************************************************************
+ * _pcr addressing mode (addr ++ I:circ(modifier-reg))
+ */
+#define BxW_LOAD_pcr(SZ, RES, PTR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %2\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %3\n\t" \
+        "%0 = mem" #SZ "(%1++I:circ(m1))\n\t" \
+        : "=r"(RES), "+r"(PTR) \
+        : "r"((((INC) & 0x7f) << 17) | ((LEN) & 0x1ffff)), \
+          "r"(START) \
+        : "r4", "m1", "cs1")
+#define BxW_LOAD_pcr_Z(RES, PTR, START, LEN, INC) \
+    BxW_LOAD_pcr(ubh, RES, PTR, START, LEN, INC)
+#define BxW_LOAD_pcr_S(RES, PTR, START, LEN, INC) \
+    BxW_LOAD_pcr(bh, RES, PTR, START, LEN, INC)
+
+#define TEST_pcr(NAME, TYPE, SIGN, SIZE, LEN, INC, \
+                 EXT, RES1, RES2, RES3, RES4) \
+void test_##NAME(void) \
+{ \
+    TYPE result; \
+    void *ptr = buf; \
+    init_buf(); \
+    BxW_LOAD_pcr_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES1) | (EXT)); \
+    checkp(ptr, &buf[(1 * (INC) * (SIZE)) % (LEN)]); \
+    BxW_LOAD_pcr_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES2) | (EXT)); \
+    checkp(ptr, &buf[(2 * (INC) * (SIZE)) % (LEN)]); \
+    BxW_LOAD_pcr_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES3) | (EXT)); \
+    checkp(ptr, &buf[(3 * (INC) * (SIZE)) % (LEN)]); \
+    BxW_LOAD_pcr_##SIGN(result, ptr, buf, (LEN), (INC)); \
+    check(result, (RES4) | (EXT)); \
+    checkp(ptr, &buf[(4 * (INC) * (SIZE)) % (LEN)]); \
+}
+
+TEST_pcr(loadbzw2_pcr, int, Z, 2, 8, 2, 0x00000000,
+    0x00020081, 0x00060085, 0x00020081, 0x00060085)
+TEST_pcr(loadbsw2_pcr, int, S, 2, 8, 2, 0x0000ff00,
+    0x00020081, 0x00060085, 0x00020081, 0x00060085)
+TEST_pcr(loadbzw4_pcr, long long, Z, 4, 8, 1, 0x0000000000000000LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x0004008300020081LL, 0x0008008700060085LL)
+TEST_pcr(loadbsw4_pcr, long long, S, 4, 8, 1, 0x0000ff000000ff00LL,
+    0x0004008300020081LL, 0x0008008700060085LL,
+    0x0004008300020081LL, 0x0008008700060085LL)
+
+int main()
+{
+    test_loadbzw2_io();
+    test_loadbsw2_io();
+    test_loadbzw4_io();
+    test_loadbsw4_io();
+
+    test_loadbzw2_ur();
+    test_loadbsw2_ur();
+    test_loadbzw4_ur();
+    test_loadbsw4_ur();
+
+    test_loadbzw2_ap();
+    test_loadbsw2_ap();
+    test_loadbzw4_ap();
+    test_loadbsw4_ap();
+
+    test_loadbzw2_pr();
+    test_loadbsw2_pr();
+    test_loadbzw4_pr();
+    test_loadbsw4_pr();
+
+    test_loadbzw2_pbr();
+    test_loadbsw2_pbr();
+    test_loadbzw4_pbr();
+    test_loadbsw4_pbr();
+
+    test_loadbzw2_pi();
+    test_loadbsw2_pi();
+    test_loadbzw4_pi();
+    test_loadbsw4_pi();
+
+    test_loadbzw2_pci();
+    test_loadbsw2_pci();
+    test_loadbzw4_pci();
+    test_loadbsw4_pci();
+
+    test_loadbzw2_pcr();
+    test_loadbsw2_pcr();
+    test_loadbzw4_pcr();
+    test_loadbsw4_pcr();
+
+    puts(err ? "FAIL" : "PASS");
+    return err ? 1 : 0;
+}
-- 
2.7.4


