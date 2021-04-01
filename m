Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC4350D6E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:06:15 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRob0-00008V-Ll
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoPD-0001jY-5W
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:54:03 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2902)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoPA-0004rM-AK
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249240; x=1648785240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PByR/cYS6KFdNFEq52sZ49yBLzls1beE6lZrPCoXo1M=;
 b=bghDgP+jCM5CSUpUYURtzGQpN724kSlJkioVwEwCq2R6GXChxlTvXdq5
 B6lJ1naK75d4DVmksRjMKvTFaA545JA1zDlwujR2Bxh/fx8DJ83373xAA
 dhushoVMZ4NVbPkl0LMZgv3zp7AxV7EU1bfF8Ol6FGA0LQxsPhZoPf5Ra 4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:53:43 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0978D1019; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/21] Hexagon (target/hexagon) bit reverse (brev)
 addressing
Date: Wed, 31 Mar 2021 22:53:30 -0500
Message-Id: <1617249213-22667-19-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
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
    L2_loadrub_pbr          Rd32 = memub(Rx32++Mu2:brev)
    L2_loadrb_pbr           Rd32 = memb(Rx32++Mu2:brev)
    L2_loadruh_pbr          Rd32 = memuh(Rx32++Mu2:brev)
    L2_loadrh_pbr           Rd32 = memh(Rx32++Mu2:brev)
    L2_loadri_pbr           Rd32 = memw(Rx32++Mu2:brev)
    L2_loadrd_pbr           Rdd32 = memd(Rx32++Mu2:brev)
    S2_storerb_pbr          memb(Rx32++Mu2:brev).=.Rt32
    S2_storerh_pbr          memh(Rx32++Mu2:brev).=.Rt32
    S2_storerf_pbr          memh(Rx32++Mu2:brev).=.Rt.H32
    S2_storeri_pbr          memw(Rx32++Mu2:brev).=.Rt32
    S2_storerd_pbr          memd(Rx32++Mu2:brev).=.Rt32
    S2_storerinew_pbr       memw(Rx32++Mu2:brev).=.Nt8.new
    S2_storerbnew_pbr       memw(Rx32++Mu2:brev).=.Nt8.new
    S2_storerhnew_pbr       memw(Rx32++Mu2:brev).=.Nt8.new

Test cases in tests/tcg/hexagon/brev.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              |  28 +++++
 target/hexagon/helper.h               |   1 +
 target/hexagon/imported/encode_pp.def |   4 +
 target/hexagon/imported/ldst.idef     |   2 +
 target/hexagon/imported/macros.def    |   6 ++
 target/hexagon/macros.h               |   1 +
 target/hexagon/op_helper.c            |   8 ++
 tests/tcg/hexagon/Makefile.target     |   1 +
 tests/tcg/hexagon/brev.c              | 190 ++++++++++++++++++++++++++++++++++
 9 files changed, 241 insertions(+)
 create mode 100644 tests/tcg/hexagon/brev.c

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index e673298..143f656 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -37,6 +37,7 @@
  *     _sp       stack pointer relative            r0 = memw(r29+#12)
  *     _ap       absolute set                      r0 = memw(r1=##variable)
  *     _pr       post increment register           r0 = memw(r1++m1)
+ *     _pbr      post increment bit reverse        r0 = memw(r1++m1:brev)
  *     _pi       post increment immediate          r0 = memb(r1++#1)
  *     _pci      post increment circular immediate r0 = memw(r1++#4:circ(m0))
  *     _pcr      post increment circular register  r0 = memw(r1++I:circ(m0))
@@ -53,6 +54,11 @@
         fEA_REG(RxV); \
         fPM_M(RxV, MuV); \
     } while (0)
+#define GET_EA_pbr \
+    do { \
+        gen_helper_fbrev(EA, RxV); \
+        tcg_gen_add_tl(RxV, RxV, MuV); \
+    } while (0)
 #define GET_EA_pi \
     do { \
         fEA_REG(RxV); \
@@ -128,16 +134,22 @@
       fGEN_TCG_LOAD_pcr(3, fLOAD(1, 8, u, EA, RddV))
 
 #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
+#define fGEN_TCG_L2_loadrub_pbr(SHORTCODE)     SHORTCODE
 #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrb_pbr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
+#define fGEN_TCG_L2_loadruh_pbr(SHORTCODE)     SHORTCODE
 #define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrh_pbr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadri_pbr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadri_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadrd_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrd_pbr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrd_pi(SHORTCODE)       SHORTCODE
 
 /*
@@ -265,41 +277,57 @@
         tcg_temp_free(BYTE); \
     } while (0)
 
+#define fGEN_TCG_S2_storerb_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerb_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerb_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, RtV)))
 
+#define fGEN_TCG_S2_storerh_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerh_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerh_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, RtV)))
 
+#define fGEN_TCG_S2_storerf_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerf_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerf_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(1, RtV)))
 
+#define fGEN_TCG_S2_storeri_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storeri_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storeri_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, RtV))
 
+#define fGEN_TCG_S2_storerd_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerd_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerd_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(3, fSTORE(1, 8, EA, RttV))
 
+#define fGEN_TCG_S2_storerbnew_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerbnew_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerbnew_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, NtN)))
 
+#define fGEN_TCG_S2_storerhnew_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerhnew_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerhnew_pcr(SHORTCODE) \
     fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, NtN)))
 
+#define fGEN_TCG_S2_storerinew_pbr(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerinew_pci(SHORTCODE) \
     fGEN_TCG_STORE(SHORTCODE)
 #define fGEN_TCG_S2_storerinew_pcr(SHORTCODE) \
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index e4bc4ab..75b15ad 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -26,6 +26,7 @@ DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
 #endif
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
+DEF_HELPER_FLAGS_1(fbrev, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
 DEF_HELPER_2(sfinvsqrta, i64, env, f32)
 DEF_HELPER_4(vacsh_val, s64, env, s64, s64, s64)
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 68b435e..4464926 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -301,6 +301,7 @@ DEF_CLASS32(ICLASS_LD" 101- -------- PP1----- --------",LD_ADDR_POST_IMMED_PRED_
 DEF_CLASS32(ICLASS_LD" 110- -------- PP-0---- 0-------",LD_ADDR_POST_REG)
 DEF_CLASS32(ICLASS_LD" 110- -------- PP-1---- --------",LD_ADDR_ABS_PLUS_REG_V4)
 DEF_CLASS32(ICLASS_LD" 100- -------- PP----1- --------",LD_ADDR_POST_CREG_V2)
+DEF_CLASS32(ICLASS_LD" 111- -------- PP------ 0-------",LD_ADDR_POST_BREV_REG)
 DEF_CLASS32(ICLASS_LD" 111- -------- PP------ 1-------",LD_ADDR_PRED_ABS_V4)
 
 DEF_FIELD32(ICLASS_LD" !!!- -------- PP------ --------",LD_Amode,"Amode")
@@ -315,6 +316,7 @@ DEF_ENC32(L4_load##TAG##_ap,   ICLASS_LD" 1 01 "OPC"  eeeee  PP01IIII  -IIddddd"
 DEF_ENC32(L2_load##TAG##_pr,   ICLASS_LD" 1 10 "OPC"  xxxxx  PPu0----  0--ddddd")\
 DEF_ENC32(L4_load##TAG##_ur,   ICLASS_LD" 1 10 "OPC"  ttttt  PPi1IIII  iIIddddd")\
 DEF_ENC32(L2_load##TAG##_pcr,  ICLASS_LD" 1 00 "OPC"  xxxxx  PPu0--1-  0--ddddd")\
+DEF_ENC32(L2_load##TAG##_pbr,  ICLASS_LD" 1 11 "OPC"  xxxxx  PPu0----  0--ddddd")
 
 
 #define STD_LDX_ENC(TAG,OPC) \
@@ -412,6 +414,7 @@ DEF_CLASS32(ICLASS_ST" 1111 -------- PP------ 1-------",ST_ADDR_PRED_ABS_V4)
 DEF_CLASS32(ICLASS_ST" 1101 -------- PP------ 0-------",ST_ADDR_POST_REG)
 DEF_CLASS32(ICLASS_ST" 1101 -------- PP------ 1-------",ST_ADDR_ABS_PLUS_REG_V4)
 DEF_CLASS32(ICLASS_ST" 1001 -------- PP------ ------1-",ST_ADDR_POST_CREG_V2)
+DEF_CLASS32(ICLASS_ST" 1111 -------- PP------ 0-------",ST_ADDR_POST_BREV_REG)
 DEF_CLASS32(ICLASS_ST" 0--0 1------- PP------ --------",ST_MISC_STORELIKE)
 DEF_CLASS32(ICLASS_ST" 1--0 0------- PP------ --------",ST_MISC_BUSOP)
 DEF_CLASS32(ICLASS_ST" 0--0 0------- PP------ --------",ST_MISC_CACHEOP)
@@ -425,6 +428,7 @@ DEF_ENC32(S4_store##TAG##_ap,   ICLASS_ST" 1 01 "OPC"  eeeee  PP0"SRC"  1-IIIIII
 DEF_ENC32(S2_store##TAG##_pr,   ICLASS_ST" 1 10 "OPC"  xxxxx  PPu"SRC"  0-------")\
 DEF_ENC32(S4_store##TAG##_ur,   ICLASS_ST" 1 10 "OPC"  uuuuu  PPi"SRC"  1iIIIIII")\
 DEF_ENC32(S2_store##TAG##_pcr,  ICLASS_ST" 1 00 "OPC"  xxxxx  PPu"SRC"  0-----1-")\
+DEF_ENC32(S2_store##TAG##_pbr,  ICLASS_ST" 1 11 "OPC"  xxxxx  PPu"SRC"  0-------")
 
 
 #define STD_PST_ENC(TAG,OPC,SRC) \
diff --git a/target/hexagon/imported/ldst.idef b/target/hexagon/imported/ldst.idef
index 6ce0635..fe7e018 100644
--- a/target/hexagon/imported/ldst.idef
+++ b/target/hexagon/imported/ldst.idef
@@ -25,6 +25,7 @@ Q6INSN(L2_##TAG##_io,  OPER"(Rs32+#s11:"SHFT")",          ATTRIB,DESCR,{fIMMEXT(
 Q6INSN(L4_##TAG##_ur,  OPER"(Rt32<<#u2+#U6)",             ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IRs(UiV,RtV,uiV); SEMANTICS;})\
 Q6INSN(L4_##TAG##_ap,  OPER"(Re32=#U6)",                  ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IMM(UiV); SEMANTICS; ReV=UiV; })\
 Q6INSN(L2_##TAG##_pr,  OPER"(Rx32++Mu2)",                 ATTRIB,DESCR,{fEA_REG(RxV); fPM_M(RxV,MuV); SEMANTICS;})\
+Q6INSN(L2_##TAG##_pbr, OPER"(Rx32++Mu2:brev)",            ATTRIB,DESCR,{fEA_BREVR(RxV); fPM_M(RxV,MuV); SEMANTICS;})\
 Q6INSN(L2_##TAG##_pi,  OPER"(Rx32++#s4:"SHFT")",          ATTRIB,DESCR,{fEA_REG(RxV); fPM_I(RxV,siV); SEMANTICS;})\
 Q6INSN(L2_##TAG##_pci, OPER"(Rx32++#s4:"SHFT":circ(Mu2))",ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRI(RxV,siV,MuV); SEMANTICS;})\
 Q6INSN(L2_##TAG##_pcr, OPER"(Rx32++I:circ(Mu2))",  ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRR(RxV,fREAD_IREG(MuV)<<SCALE,MuV); SEMANTICS;})
@@ -44,6 +45,7 @@ Q6INSN(S2_##TAG##_pi,  OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(
 Q6INSN(S4_##TAG##_ap,  OPER"(Re32=#U6)="DEST,             ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IMM(UiV); SEMANTICS; ReV=UiV; })\
 Q6INSN(S2_##TAG##_pr,  OPER"(Rx32++Mu2)="DEST,            ATTRIB,DESCR,{fEA_REG(RxV); fPM_M(RxV,MuV); SEMANTICS; })\
 Q6INSN(S4_##TAG##_ur,  OPER"(Ru32<<#u2+#U6)="DEST,            ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IRs(UiV,RuV,uiV); SEMANTICS;})\
+Q6INSN(S2_##TAG##_pbr, OPER"(Rx32++Mu2:brev)="DEST,       ATTRIB,DESCR,{fEA_BREVR(RxV); fPM_M(RxV,MuV); SEMANTICS; })\
 Q6INSN(S2_##TAG##_pci, OPER"(Rx32++#s4:"SHFT":circ(Mu2))="DEST,  ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRI(RxV,siV,MuV); SEMANTICS;})\
 Q6INSN(S2_##TAG##_pcr, OPER"(Rx32++I:circ(Mu2))="DEST,  ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRR(RxV,fREAD_IREG(MuV)<<SCALE,MuV); SEMANTICS;})
 
diff --git a/target/hexagon/imported/macros.def b/target/hexagon/imported/macros.def
index 25f57b6..56c99b1 100755
--- a/target/hexagon/imported/macros.def
+++ b/target/hexagon/imported/macros.def
@@ -819,6 +819,12 @@ DEF_MACRO(
 )
 
 DEF_MACRO(
+    fEA_BREVR, /* Calculate EA with bit reversed bottom of REGISTER */
+    EA=fbrev(REG),
+    ()
+)
+
+DEF_MACRO(
     fEA_GPI, /* Calculate EA with Global Poitner + Immediate */
     do { EA=fREAD_GP()+IMM; fGP_DOCHKPAGECROSS(fREAD_GP(),EA); } while (0),
     ()
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index ba8450b..4d26abe 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -481,6 +481,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
 #ifdef QEMU_GENERATE
 #define fEA_IMM(IMM) tcg_gen_movi_tl(EA, IMM)
 #define fEA_REG(REG) tcg_gen_mov_tl(EA, REG)
+#define fEA_BREVR(REG)      gen_helper_fbrev(EA, REG)
 #define fPM_I(REG, IMM)     tcg_gen_addi_tl(REG, REG, IMM)
 #define fPM_M(REG, MVAL)    tcg_gen_add_tl(REG, REG, MVAL)
 #define fPM_CIRI(REG, IMM, MVAL) \
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 13602c8..c0093e7 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -295,6 +295,14 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
     return new_ptr;
 }
 
+uint32_t HELPER(fbrev)(uint32_t addr)
+{
+    /*
+     *  Bit reverse the low 16 bits of the address
+     */
+    return deposit32(addr, 0, 16, revbit16(addr));
+}
+
 static float32 build_float32(uint8_t sign, uint32_t exp, uint32_t mant)
 {
     return make_float32(
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 81f73c0..98cd4ab 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -42,6 +42,7 @@ HEX_TESTS += dual_stores
 HEX_TESTS += multi_result
 HEX_TESTS += mem_noshuf
 HEX_TESTS += circ
+HEX_TESTS += brev
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 
diff --git a/tests/tcg/hexagon/brev.c b/tests/tcg/hexagon/brev.c
new file mode 100644
index 0000000..9736a24
--- /dev/null
+++ b/tests/tcg/hexagon/brev.c
@@ -0,0 +1,190 @@
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
+#include <stdio.h>
+#include <string.h>
+
+int err;
+
+#define NBITS          8
+#define SIZE           (1 << NBITS)
+
+long long     dbuf[SIZE] __attribute__((aligned(1 << 16))) = {0};
+int           wbuf[SIZE] __attribute__((aligned(1 << 16))) = {0};
+short         hbuf[SIZE] __attribute__((aligned(1 << 16))) = {0};
+unsigned char bbuf[SIZE] __attribute__((aligned(1 << 16))) = {0};
+
+/*
+ * We use the C preporcessor to deal with the combinations of types
+ */
+
+#define BREV_LOAD(SZ, RES, ADDR, INC) \
+    __asm__( \
+        "m0 = %2\n\t" \
+        "%0 = mem" #SZ "(%1++m0:brev)\n\t" \
+        : "=r"(RES), "+r"(ADDR) \
+        : "r"(INC) \
+        : "m0")
+
+#define BREV_LOAD_b(RES, ADDR, INC) \
+    BREV_LOAD(b, RES, ADDR, INC)
+#define BREV_LOAD_ub(RES, ADDR, INC) \
+    BREV_LOAD(ub, RES, ADDR, INC)
+#define BREV_LOAD_h(RES, ADDR, INC) \
+    BREV_LOAD(h, RES, ADDR, INC)
+#define BREV_LOAD_uh(RES, ADDR, INC) \
+    BREV_LOAD(uh, RES, ADDR, INC)
+#define BREV_LOAD_w(RES, ADDR, INC) \
+    BREV_LOAD(w, RES, ADDR, INC)
+#define BREV_LOAD_d(RES, ADDR, INC) \
+    BREV_LOAD(d, RES, ADDR, INC)
+
+#define BREV_STORE(SZ, PART, ADDR, VAL, INC) \
+    __asm__( \
+        "m0 = %2\n\t" \
+        "mem" #SZ "(%0++m0:brev) = %1" PART "\n\t" \
+        : "+r"(ADDR) \
+        : "r"(VAL), "r"(INC) \
+        : "m0", "memory")
+
+#define BREV_STORE_b(ADDR, VAL, INC) \
+    BREV_STORE(b, "", ADDR, VAL, INC)
+#define BREV_STORE_h(ADDR, VAL, INC) \
+    BREV_STORE(h, "", ADDR, VAL, INC)
+#define BREV_STORE_f(ADDR, VAL, INC) \
+    BREV_STORE(h, ".H", ADDR, VAL, INC)
+#define BREV_STORE_w(ADDR, VAL, INC) \
+    BREV_STORE(w, "", ADDR, VAL, INC)
+#define BREV_STORE_d(ADDR, VAL, INC) \
+    BREV_STORE(d, "", ADDR, VAL, INC)
+
+#define BREV_STORE_NEW(SZ, ADDR, VAL, INC) \
+    __asm__( \
+        "m0 = %2\n\t" \
+        "{\n\t" \
+        "    r5 = %1\n\t" \
+        "    mem" #SZ "(%0++m0:brev) = r5.new\n\t" \
+        "}\n\t" \
+        : "+r"(ADDR) \
+        : "r"(VAL), "r"(INC) \
+        : "r5", "m0", "memory")
+
+#define BREV_STORE_bnew(ADDR, VAL, INC) \
+    BREV_STORE_NEW(b, ADDR, VAL, INC)
+#define BREV_STORE_hnew(ADDR, VAL, INC) \
+    BREV_STORE_NEW(h, ADDR, VAL, INC)
+#define BREV_STORE_wnew(ADDR, VAL, INC) \
+    BREV_STORE_NEW(w, ADDR, VAL, INC)
+
+int bitreverse(int x)
+{
+    int result = 0;
+    int i;
+    for (i = 0; i < NBITS; i++) {
+        result <<= 1;
+        result |= x & 1;
+        x >>= 1;
+    }
+    return result;
+}
+
+int sext8(int x)
+{
+    return (x << 24) >> 24;
+}
+
+void check(int i, long long result, long long expect)
+{
+    if (result != expect) {
+        printf("ERROR(%d): 0x%04llx != 0x%04llx\n", i, result, expect);
+        err++;
+    }
+}
+
+#define TEST_BREV_LOAD(SZ, TYPE, BUF, SHIFT, EXP) \
+    do { \
+        p = BUF; \
+        for (i = 0; i < SIZE; i++) { \
+            TYPE result; \
+            BREV_LOAD_##SZ(result, p, 1 << (SHIFT - NBITS)); \
+            check(i, result, EXP); \
+        } \
+    } while (0)
+
+#define TEST_BREV_STORE(SZ, TYPE, BUF, VAL, SHIFT) \
+    do { \
+        p = BUF; \
+        memset(BUF, 0xff, sizeof(BUF)); \
+        for (i = 0; i < SIZE; i++) { \
+            BREV_STORE_##SZ(p, (TYPE)(VAL), 1 << (SHIFT - NBITS)); \
+        } \
+        for (i = 0; i < SIZE; i++) { \
+            check(i, BUF[i], bitreverse(i)); \
+        } \
+    } while (0)
+
+#define TEST_BREV_STORE_NEW(SZ, BUF, SHIFT) \
+    do { \
+        p = BUF; \
+        memset(BUF, 0xff, sizeof(BUF)); \
+        for (i = 0; i < SIZE; i++) { \
+            BREV_STORE_##SZ(p, i, 1 << (SHIFT - NBITS)); \
+        } \
+        for (i = 0; i < SIZE; i++) { \
+            check(i, BUF[i], bitreverse(i)); \
+        } \
+    } while (0)
+
+/*
+ * We'll set high_half[i] = i << 16 for use in the .H form of store
+ * which stores from the high half of the word.
+ */
+int high_half[SIZE];
+
+int main()
+{
+    void *p;
+    int i;
+
+    for (i = 0; i < SIZE; i++) {
+        bbuf[i] = bitreverse(i);
+        hbuf[i] = bitreverse(i);
+        wbuf[i] = bitreverse(i);
+        dbuf[i] = bitreverse(i);
+        high_half[i] = i << 16;
+    }
+
+    TEST_BREV_LOAD(b,  int,       bbuf, 16, sext8(i));
+    TEST_BREV_LOAD(ub, int,       bbuf, 16, i);
+    TEST_BREV_LOAD(h,  int,       hbuf, 15, i);
+    TEST_BREV_LOAD(uh, int,       hbuf, 15, i);
+    TEST_BREV_LOAD(w,  int,       wbuf, 14, i);
+    TEST_BREV_LOAD(d,  long long, dbuf, 13, i);
+
+    TEST_BREV_STORE(b, int,       bbuf, i,            16);
+    TEST_BREV_STORE(h, int,       hbuf, i,            15);
+    TEST_BREV_STORE(f, int,       hbuf, high_half[i], 15);
+    TEST_BREV_STORE(w, int,       wbuf, i,            14);
+    TEST_BREV_STORE(d, long long, dbuf, i,            13);
+
+    TEST_BREV_STORE_NEW(bnew, bbuf, 16);
+    TEST_BREV_STORE_NEW(hnew, hbuf, 15);
+    TEST_BREV_STORE_NEW(wnew, wbuf, 14);
+
+    puts(err ? "FAIL" : "PASS");
+    return err ? 1 : 0;
+}
-- 
2.7.4


