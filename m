Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A135F89
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:47:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYXC1-0007VY-Ku
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:47:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1p-0007an-Us
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1n-00025E-Si
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:55912 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYX1n-0007o4-Hs
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 98D211A21FA;
	Wed,  5 Jun 2019 16:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 6A5911A21BE;
	Wed,  5 Jun 2019 16:35:32 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:35:15 +0200
Message-Id: <1559745316-1454-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 5/6] tests/tcg: target/mips: Amend and
 rearrange MSA wrappers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Amend and rearrange MSA wrappers to follow the same organization as
in MSA tests.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tests/tcg/mips/include/wrappers_msa.h | 402 ++++++++++++++++++++++------------
 1 file changed, 265 insertions(+), 137 deletions(-)

diff --git a/tests/tcg/mips/include/wrappers_msa.h b/tests/tcg/mips/include/wrappers_msa.h
index 6feda36..284952a 100644
--- a/tests/tcg/mips/include/wrappers_msa.h
+++ b/tests/tcg/mips/include/wrappers_msa.h
@@ -55,21 +55,6 @@ static inline void do_msa_##suffix(const void *input,                  \
    );                                                                  \
 }
 
-DO_MSA__WD__WS(NLOC_B, nloc.b)
-DO_MSA__WD__WS(NLOC_H, nloc.h)
-DO_MSA__WD__WS(NLOC_W, nloc.w)
-DO_MSA__WD__WS(NLOC_D, nloc.d)
-
-DO_MSA__WD__WS(NLZC_B, nlzc.b)
-DO_MSA__WD__WS(NLZC_H, nlzc.h)
-DO_MSA__WD__WS(NLZC_W, nlzc.w)
-DO_MSA__WD__WS(NLZC_D, nlzc.d)
-
-DO_MSA__WD__WS(PCNT_B, pcnt.b)
-DO_MSA__WD__WS(PCNT_H, pcnt.h)
-DO_MSA__WD__WS(PCNT_W, pcnt.w)
-DO_MSA__WD__WS(PCNT_D, pcnt.d)
-
 
 #define DO_MSA__WD__WS_WT(suffix, mnemonic)                            \
 static inline void do_msa_##suffix(const void *input1,                 \
@@ -126,85 +111,54 @@ static inline void do_msa_##suffix(void *input1, void *input2,         \
    );                                                                  \
 }
 
-DO_MSA__WD__WS_WT(ILVEV_B, ilvev.b)
-DO_MSA__WD__WS_WT(ILVEV_H, ilvev.h)
-DO_MSA__WD__WS_WT(ILVEV_W, ilvev.w)
-DO_MSA__WD__WS_WT(ILVEV_D, ilvev.d)
-
-DO_MSA__WD__WS_WT(ILVOD_B, ilvod.b)
-DO_MSA__WD__WS_WT(ILVOD_H, ilvod.h)
-DO_MSA__WD__WS_WT(ILVOD_W, ilvod.w)
-DO_MSA__WD__WS_WT(ILVOD_D, ilvod.d)
-
-DO_MSA__WD__WS_WT(ILVL_B, ilvl.b)
-DO_MSA__WD__WS_WT(ILVL_H, ilvl.h)
-DO_MSA__WD__WS_WT(ILVL_W, ilvl.w)
-DO_MSA__WD__WS_WT(ILVL_D, ilvl.d)
 
-DO_MSA__WD__WS_WT(ILVR_B, ilvr.b)
-DO_MSA__WD__WS_WT(ILVR_H, ilvr.h)
-DO_MSA__WD__WS_WT(ILVR_W, ilvr.w)
-DO_MSA__WD__WS_WT(ILVR_D, ilvr.d)
+/*
+ * Bit Count
+ * ---------
+ */
 
-DO_MSA__WD__WS_WT(AND_V, and.v)
-DO_MSA__WD__WS_WT(NOR_V, nor.v)
-DO_MSA__WD__WS_WT(OR_V, or.v)
-DO_MSA__WD__WS_WT(XOR_V, xor.v)
+DO_MSA__WD__WS(NLOC_B, nloc.b)
+DO_MSA__WD__WS(NLOC_H, nloc.h)
+DO_MSA__WD__WS(NLOC_W, nloc.w)
+DO_MSA__WD__WS(NLOC_D, nloc.d)
 
-DO_MSA__WD__WS_WT(CEQ_B, ceq.b)
-DO_MSA__WD__WS_WT(CEQ_H, ceq.h)
-DO_MSA__WD__WS_WT(CEQ_W, ceq.w)
-DO_MSA__WD__WS_WT(CEQ_D, ceq.d)
+DO_MSA__WD__WS(NLZC_B, nlzc.b)
+DO_MSA__WD__WS(NLZC_H, nlzc.h)
+DO_MSA__WD__WS(NLZC_W, nlzc.w)
+DO_MSA__WD__WS(NLZC_D, nlzc.d)
 
-DO_MSA__WD__WS_WT(CLE_S_B, cle_s.b)
-DO_MSA__WD__WS_WT(CLE_S_H, cle_s.h)
-DO_MSA__WD__WS_WT(CLE_S_W, cle_s.w)
-DO_MSA__WD__WS_WT(CLE_S_D, cle_s.d)
+DO_MSA__WD__WS(PCNT_B, pcnt.b)
+DO_MSA__WD__WS(PCNT_H, pcnt.h)
+DO_MSA__WD__WS(PCNT_W, pcnt.w)
+DO_MSA__WD__WS(PCNT_D, pcnt.d)
 
-DO_MSA__WD__WS_WT(CLE_U_B, cle_u.b)
-DO_MSA__WD__WS_WT(CLE_U_H, cle_u.h)
-DO_MSA__WD__WS_WT(CLE_U_W, cle_u.w)
-DO_MSA__WD__WS_WT(CLE_U_D, cle_u.d)
 
-DO_MSA__WD__WS_WT(CLT_S_B, clt_s.b)
-DO_MSA__WD__WS_WT(CLT_S_H, clt_s.h)
-DO_MSA__WD__WS_WT(CLT_S_W, clt_s.w)
-DO_MSA__WD__WS_WT(CLT_S_D, clt_s.d)
+/*
+ * Bit move
+ * --------
+ */
 
-DO_MSA__WD__WS_WT(CLT_U_B, clt_u.b)
-DO_MSA__WD__WS_WT(CLT_U_H, clt_u.h)
-DO_MSA__WD__WS_WT(CLT_U_W, clt_u.w)
-DO_MSA__WD__WS_WT(CLT_U_D, clt_u.d)
 
-DO_MSA__WD__WS_WT(MAX_A_B, max_a.b)
-DO_MSA__WD__WS_WT(MAX_A_H, max_a.h)
-DO_MSA__WD__WS_WT(MAX_A_W, max_a.w)
-DO_MSA__WD__WS_WT(MAX_A_D, max_a.d)
+DO_MSA__WD__WS(BINSL_B, binsl.b)
+DO_MSA__WD__WS(BINSL_H, binsl.h)
+DO_MSA__WD__WS(BINSL_W, binsl.w)
+DO_MSA__WD__WS(BINSL_D, binsl.d)
 
-DO_MSA__WD__WS_WT(MIN_A_B, min_a.b)
-DO_MSA__WD__WS_WT(MIN_A_H, min_a.h)
-DO_MSA__WD__WS_WT(MIN_A_W, min_a.w)
-DO_MSA__WD__WS_WT(MIN_A_D, min_a.d)
+DO_MSA__WD__WS(BINSR_B, binsr.b)
+DO_MSA__WD__WS(BINSR_H, binsr.h)
+DO_MSA__WD__WS(BINSR_W, binsr.w)
+DO_MSA__WD__WS(BINSR_D, binsr.d)
 
-DO_MSA__WD__WS_WT(MAX_S_B, max_s.b)
-DO_MSA__WD__WS_WT(MAX_S_H, max_s.h)
-DO_MSA__WD__WS_WT(MAX_S_W, max_s.w)
-DO_MSA__WD__WS_WT(MAX_S_D, max_s.d)
+DO_MSA__WD__WS_WT(BMZ_V, bmz.v)
 
-DO_MSA__WD__WS_WT(MIN_S_B, min_s.b)
-DO_MSA__WD__WS_WT(MIN_S_H, min_s.h)
-DO_MSA__WD__WS_WT(MIN_S_W, min_s.w)
-DO_MSA__WD__WS_WT(MIN_S_D, min_s.d)
+DO_MSA__WD__WS_WT(BMNZ_V, bmnz.v)
 
-DO_MSA__WD__WS_WT(MAX_U_B, max_u.b)
-DO_MSA__WD__WS_WT(MAX_U_H, max_u.h)
-DO_MSA__WD__WS_WT(MAX_U_W, max_u.w)
-DO_MSA__WD__WS_WT(MAX_U_D, max_u.d)
+DO_MSA__WD__WS_WT(BSEL_V, bsel.v)
 
-DO_MSA__WD__WS_WT(MIN_U_B, min_u.b)
-DO_MSA__WD__WS_WT(MIN_U_H, min_u.h)
-DO_MSA__WD__WS_WT(MIN_U_W, min_u.w)
-DO_MSA__WD__WS_WT(MIN_U_D, min_u.d)
+/*
+ * Bit Set
+ * -------
+ */
 
 DO_MSA__WD__WS_WT(BCLR_B, bclr.b)
 DO_MSA__WD__WS_WT(BCLR_H, bclr.h)
@@ -221,45 +175,36 @@ DO_MSA__WD__WS_WT(BNEG_H, bneg.h)
 DO_MSA__WD__WS_WT(BNEG_W, bneg.w)
 DO_MSA__WD__WS_WT(BNEG_D, bneg.d)
 
-DO_MSA__WD__WS_WT(PCKEV_B, pckev.b)
-DO_MSA__WD__WS_WT(PCKEV_H, pckev.h)
-DO_MSA__WD__WS_WT(PCKEV_W, pckev.w)
-DO_MSA__WD__WS_WT(PCKEV_D, pckev.d)
 
-DO_MSA__WD__WS_WT(PCKOD_B, pckod.b)
-DO_MSA__WD__WS_WT(PCKOD_H, pckod.h)
-DO_MSA__WD__WS_WT(PCKOD_W, pckod.w)
-DO_MSA__WD__WS_WT(PCKOD_D, pckod.d)
 
-DO_MSA__WD__WS_WT(VSHF_B, vshf.b)
-DO_MSA__WD__WS_WT(VSHF_H, vshf.h)
-DO_MSA__WD__WS_WT(VSHF_W, vshf.w)
-DO_MSA__WD__WS_WT(VSHF_D, vshf.d)
+/*
+ * Fixed Multiply
+ * --------------
+ */
 
-DO_MSA__WD__WS_WT(SLL_B, sll.b)
-DO_MSA__WD__WS_WT(SLL_H, sll.h)
-DO_MSA__WD__WS_WT(SLL_W, sll.w)
-DO_MSA__WD__WS_WT(SLL_D, sll.d)
+DO_MSA__WD__WS_WT(MADD_Q_H, madd_q.h)
+DO_MSA__WD__WS_WT(MADD_Q_W, madd_q.w)
 
-DO_MSA__WD__WS_WT(SRA_B, sra.b)
-DO_MSA__WD__WS_WT(SRA_H, sra.h)
-DO_MSA__WD__WS_WT(SRA_W, sra.w)
-DO_MSA__WD__WS_WT(SRA_D, sra.d)
+DO_MSA__WD__WS_WT(MADDR_Q_H, maddr_q.h)
+DO_MSA__WD__WS_WT(MADDR_Q_W, maddr_q.w)
 
-DO_MSA__WD__WS_WT(SRAR_B, srar.b)
-DO_MSA__WD__WS_WT(SRAR_H, srar.h)
-DO_MSA__WD__WS_WT(SRAR_W, srar.w)
-DO_MSA__WD__WS_WT(SRAR_D, srar.d)
+DO_MSA__WD__WS_WT(MSUB_Q_H, msub_q.h)
+DO_MSA__WD__WS_WT(MSUB_Q_W, msub_q.w)
 
-DO_MSA__WD__WS_WT(SRL_B, srl.b)
-DO_MSA__WD__WS_WT(SRL_H, srl.h)
-DO_MSA__WD__WS_WT(SRL_W, srl.w)
-DO_MSA__WD__WS_WT(SRL_D, srl.d)
+DO_MSA__WD__WS_WT(MSUBR_Q_H, msubr_q.h)
+DO_MSA__WD__WS_WT(MSUBR_Q_W, msubr_q.w)
 
-DO_MSA__WD__WS_WT(SRLR_B, srlr.b)
-DO_MSA__WD__WS_WT(SRLR_H, srlr.h)
-DO_MSA__WD__WS_WT(SRLR_W, srlr.w)
-DO_MSA__WD__WS_WT(SRLR_D, srlr.d)
+DO_MSA__WD__WS_WT(MUL_Q_H, mul_q.h)
+DO_MSA__WD__WS_WT(MUL_Q_W, mul_q.w)
+
+DO_MSA__WD__WS_WT(MULR_Q_H, mulr_q.h)
+DO_MSA__WD__WS_WT(MULR_Q_W, mulr_q.w)
+
+
+/*
+ * Int Add
+ * -------
+ */
 
 DO_MSA__WD__WS_WT(ADD_A_B, add_a.b)
 DO_MSA__WD__WS_WT(ADD_A_H, add_a.h)
@@ -294,6 +239,12 @@ DO_MSA__WD__WS_WT(HADD_U_H, hadd_u.h)
 DO_MSA__WD__WS_WT(HADD_U_W, hadd_u.w)
 DO_MSA__WD__WS_WT(HADD_U_D, hadd_u.d)
 
+
+/*
+ * Int Average
+ * -----------
+ */
+
 DO_MSA__WD__WS_WT(AVER_S_B, aver_s.b)
 DO_MSA__WD__WS_WT(AVER_S_H, aver_s.h)
 DO_MSA__WD__WS_WT(AVER_S_W, aver_s.w)
@@ -314,6 +265,43 @@ DO_MSA__WD__WS_WT(AVE_U_H, ave_u.h)
 DO_MSA__WD__WS_WT(AVE_U_W, ave_u.w)
 DO_MSA__WD__WS_WT(AVE_U_D, ave_u.d)
 
+
+/*
+ * Int Compare
+ * -----------
+ */
+
+DO_MSA__WD__WS_WT(CEQ_B, ceq.b)
+DO_MSA__WD__WS_WT(CEQ_H, ceq.h)
+DO_MSA__WD__WS_WT(CEQ_W, ceq.w)
+DO_MSA__WD__WS_WT(CEQ_D, ceq.d)
+
+DO_MSA__WD__WS_WT(CLE_S_B, cle_s.b)
+DO_MSA__WD__WS_WT(CLE_S_H, cle_s.h)
+DO_MSA__WD__WS_WT(CLE_S_W, cle_s.w)
+DO_MSA__WD__WS_WT(CLE_S_D, cle_s.d)
+
+DO_MSA__WD__WS_WT(CLE_U_B, cle_u.b)
+DO_MSA__WD__WS_WT(CLE_U_H, cle_u.h)
+DO_MSA__WD__WS_WT(CLE_U_W, cle_u.w)
+DO_MSA__WD__WS_WT(CLE_U_D, cle_u.d)
+
+DO_MSA__WD__WS_WT(CLT_S_B, clt_s.b)
+DO_MSA__WD__WS_WT(CLT_S_H, clt_s.h)
+DO_MSA__WD__WS_WT(CLT_S_W, clt_s.w)
+DO_MSA__WD__WS_WT(CLT_S_D, clt_s.d)
+
+DO_MSA__WD__WS_WT(CLT_U_B, clt_u.b)
+DO_MSA__WD__WS_WT(CLT_U_H, clt_u.h)
+DO_MSA__WD__WS_WT(CLT_U_W, clt_u.w)
+DO_MSA__WD__WS_WT(CLT_U_D, clt_u.d)
+
+
+/*
+ * Int Divide
+ * ----------
+ */
+
 DO_MSA__WD__WS_WT(DIV_S_B, div_s.b)
 DO_MSA__WD__WS_WT(DIV_S_H, div_s.h)
 DO_MSA__WD__WS_WT(DIV_S_W, div_s.w)
@@ -324,6 +312,12 @@ DO_MSA__WD__WS_WT(DIV_U_H, div_u.h)
 DO_MSA__WD__WS_WT(DIV_U_W, div_u.w)
 DO_MSA__WD__WS_WT(DIV_U_D, div_u.d)
 
+
+/*
+ * Int Dot Product
+ * ---------------
+ */
+
 DO_MSA__WD__WS_WT(DOTP_S_H, dotp_s.h)
 DO_MSA__WD__WS_WT(DOTP_S_W, dotp_s.w)
 DO_MSA__WD__WS_WT(DOTP_S_D, dotp_s.d)
@@ -332,6 +326,48 @@ DO_MSA__WD__WS_WT(DOTP_U_H, dotp_u.h)
 DO_MSA__WD__WS_WT(DOTP_U_W, dotp_u.w)
 DO_MSA__WD__WS_WT(DOTP_U_D, dotp_u.d)
 
+
+/*
+ * Int Max Min
+ * -----------
+ */
+
+DO_MSA__WD__WS_WT(MAX_A_B, max_a.b)
+DO_MSA__WD__WS_WT(MAX_A_H, max_a.h)
+DO_MSA__WD__WS_WT(MAX_A_W, max_a.w)
+DO_MSA__WD__WS_WT(MAX_A_D, max_a.d)
+
+DO_MSA__WD__WS_WT(MIN_A_B, min_a.b)
+DO_MSA__WD__WS_WT(MIN_A_H, min_a.h)
+DO_MSA__WD__WS_WT(MIN_A_W, min_a.w)
+DO_MSA__WD__WS_WT(MIN_A_D, min_a.d)
+
+DO_MSA__WD__WS_WT(MAX_S_B, max_s.b)
+DO_MSA__WD__WS_WT(MAX_S_H, max_s.h)
+DO_MSA__WD__WS_WT(MAX_S_W, max_s.w)
+DO_MSA__WD__WS_WT(MAX_S_D, max_s.d)
+
+DO_MSA__WD__WS_WT(MIN_S_B, min_s.b)
+DO_MSA__WD__WS_WT(MIN_S_H, min_s.h)
+DO_MSA__WD__WS_WT(MIN_S_W, min_s.w)
+DO_MSA__WD__WS_WT(MIN_S_D, min_s.d)
+
+DO_MSA__WD__WS_WT(MAX_U_B, max_u.b)
+DO_MSA__WD__WS_WT(MAX_U_H, max_u.h)
+DO_MSA__WD__WS_WT(MAX_U_W, max_u.w)
+DO_MSA__WD__WS_WT(MAX_U_D, max_u.d)
+
+DO_MSA__WD__WS_WT(MIN_U_B, min_u.b)
+DO_MSA__WD__WS_WT(MIN_U_H, min_u.h)
+DO_MSA__WD__WS_WT(MIN_U_W, min_u.w)
+DO_MSA__WD__WS_WT(MIN_U_D, min_u.d)
+
+
+/*
+ * Int Modulo
+ * ----------
+ */
+
 DO_MSA__WD__WS_WT(MOD_S_B, mod_s.b)
 DO_MSA__WD__WS_WT(MOD_S_H, mod_s.h)
 DO_MSA__WD__WS_WT(MOD_S_W, mod_s.w)
@@ -342,16 +378,43 @@ DO_MSA__WD__WS_WT(MOD_U_H, mod_u.h)
 DO_MSA__WD__WS_WT(MOD_U_W, mod_u.w)
 DO_MSA__WD__WS_WT(MOD_U_D, mod_u.d)
 
-DO_MSA__WD__WS_WT(MUL_Q_H, mul_q.h)
-DO_MSA__WD__WS_WT(MUL_Q_W, mul_q.w)
-DO_MSA__WD__WS_WT(MULR_Q_H, mulr_q.h)
-DO_MSA__WD__WS_WT(MULR_Q_W, mulr_q.w)
+
+/*
+ * Int Multiply
+ * ------------
+ */
+
+DO_MSA__WD__WS_WT(MADDV_B, maddv.b)
+DO_MSA__WD__WS_WT(MADDV_H, maddv.h)
+DO_MSA__WD__WS_WT(MADDV_W, maddv.w)
+DO_MSA__WD__WS_WT(MADDV_D, maddv.d)
+
+DO_MSA__WD__WS_WT(MSUBV_B, msubv.b)
+DO_MSA__WD__WS_WT(MSUBV_H, msubv.h)
+DO_MSA__WD__WS_WT(MSUBV_W, msubv.w)
+DO_MSA__WD__WS_WT(MSUBV_D, msubv.d)
 
 DO_MSA__WD__WS_WT(MULV_B, mulv.b)
 DO_MSA__WD__WS_WT(MULV_H, mulv.h)
 DO_MSA__WD__WS_WT(MULV_W, mulv.w)
 DO_MSA__WD__WS_WT(MULV_D, mulv.d)
 
+
+/*
+ * Int Subtract
+ * ------------
+ */
+
+DO_MSA__WD__WS_WT(ASUB_S_B, asub_s.b)
+DO_MSA__WD__WS_WT(ASUB_S_H, asub_s.h)
+DO_MSA__WD__WS_WT(ASUB_S_W, asub_s.w)
+DO_MSA__WD__WS_WT(ASUB_S_D, asub_s.d)
+
+DO_MSA__WD__WS_WT(ASUB_U_B, asub_u.b)
+DO_MSA__WD__WS_WT(ASUB_U_H, asub_u.h)
+DO_MSA__WD__WS_WT(ASUB_U_W, asub_u.w)
+DO_MSA__WD__WS_WT(ASUB_U_D, asub_u.d)
+
 DO_MSA__WD__WS_WT(SUBV_B, subv.b)
 DO_MSA__WD__WS_WT(SUBV_H, subv.h)
 DO_MSA__WD__WS_WT(SUBV_W, subv.w)
@@ -367,16 +430,6 @@ DO_MSA__WD__WS_WT(SUBS_U_H, subs_u.h)
 DO_MSA__WD__WS_WT(SUBS_U_W, subs_u.w)
 DO_MSA__WD__WS_WT(SUBS_U_D, subs_u.d)
 
-DO_MSA__WD__WS_WT(ASUB_S_B, asub_s.b)
-DO_MSA__WD__WS_WT(ASUB_S_H, asub_s.h)
-DO_MSA__WD__WS_WT(ASUB_S_W, asub_s.w)
-DO_MSA__WD__WS_WT(ASUB_S_D, asub_s.d)
-
-DO_MSA__WD__WS_WT(ASUB_U_B, asub_u.b)
-DO_MSA__WD__WS_WT(ASUB_U_H, asub_u.h)
-DO_MSA__WD__WS_WT(ASUB_U_W, asub_u.w)
-DO_MSA__WD__WS_WT(ASUB_U_D, asub_u.d)
-
 DO_MSA__WD__WS_WT(SUBSUU_S_B, subsuu_s.b)
 DO_MSA__WD__WS_WT(SUBSUU_S_H, subsuu_s.h)
 DO_MSA__WD__WS_WT(SUBSUU_S_W, subsuu_s.w)
@@ -396,21 +449,96 @@ DO_MSA__WD__WS_WT(HSUB_U_W, hsub_u.w)
 DO_MSA__WD__WS_WT(HSUB_U_D, hsub_u.d)
 
 
+/*
+ * Interleave
+ * ----------
+ */
 
-DO_MSA__WD__WS_WT(BMNZ_V, bmnz.v)
-DO_MSA__WD__WS_WT(BMZ_V, bmz.v)
+DO_MSA__WD__WS_WT(ILVEV_B, ilvev.b)
+DO_MSA__WD__WS_WT(ILVEV_H, ilvev.h)
+DO_MSA__WD__WS_WT(ILVEV_W, ilvev.w)
+DO_MSA__WD__WS_WT(ILVEV_D, ilvev.d)
+
+DO_MSA__WD__WS_WT(ILVOD_B, ilvod.b)
+DO_MSA__WD__WS_WT(ILVOD_H, ilvod.h)
+DO_MSA__WD__WS_WT(ILVOD_W, ilvod.w)
+DO_MSA__WD__WS_WT(ILVOD_D, ilvod.d)
+
+DO_MSA__WD__WS_WT(ILVL_B, ilvl.b)
+DO_MSA__WD__WS_WT(ILVL_H, ilvl.h)
+DO_MSA__WD__WS_WT(ILVL_W, ilvl.w)
+DO_MSA__WD__WS_WT(ILVL_D, ilvl.d)
 
-DO_MSA__WD__WS_WT(FMAX_W, fmax.w)
-DO_MSA__WD__WS_WT(FMAX_D, fmax.d)
+DO_MSA__WD__WS_WT(ILVR_B, ilvr.b)
+DO_MSA__WD__WS_WT(ILVR_H, ilvr.h)
+DO_MSA__WD__WS_WT(ILVR_W, ilvr.w)
+DO_MSA__WD__WS_WT(ILVR_D, ilvr.d)
 
-DO_MSA__WD__WS_WT(FMAX_A_W, fmax_a.w)
-DO_MSA__WD__WS_WT(FMAX_A_D, fmax_a.d)
 
-DO_MSA__WD__WS_WT(FMIN_W, fmin.w)
-DO_MSA__WD__WS_WT(FMIN_D, fmin.d)
+/*
+ * Logic
+ * -----
+ */
+
+DO_MSA__WD__WS_WT(AND_V, and.v)
+
+DO_MSA__WD__WS_WT(NOR_V, nor.v)
 
-DO_MSA__WD__WS_WT(FMIN_A_W, fmin_a.w)
-DO_MSA__WD__WS_WT(FMIN_A_D, fmin_a.d)
+DO_MSA__WD__WS_WT(OR_V, or.v)
+
+DO_MSA__WD__WS_WT(XOR_V, xor.v)
+
+
+/*
+ * Pack
+ * ----
+ */
+
+DO_MSA__WD__WS_WT(PCKEV_B, pckev.b)
+DO_MSA__WD__WS_WT(PCKEV_H, pckev.h)
+DO_MSA__WD__WS_WT(PCKEV_W, pckev.w)
+DO_MSA__WD__WS_WT(PCKEV_D, pckev.d)
+
+DO_MSA__WD__WS_WT(PCKOD_B, pckod.b)
+DO_MSA__WD__WS_WT(PCKOD_H, pckod.h)
+DO_MSA__WD__WS_WT(PCKOD_W, pckod.w)
+DO_MSA__WD__WS_WT(PCKOD_D, pckod.d)
+
+DO_MSA__WD__WS_WT(VSHF_B, vshf.b)
+DO_MSA__WD__WS_WT(VSHF_H, vshf.h)
+DO_MSA__WD__WS_WT(VSHF_W, vshf.w)
+DO_MSA__WD__WS_WT(VSHF_D, vshf.d)
+
+
+/*
+ * Shift
+ * -----
+ */
+
+DO_MSA__WD__WS_WT(SLL_B, sll.b)
+DO_MSA__WD__WS_WT(SLL_H, sll.h)
+DO_MSA__WD__WS_WT(SLL_W, sll.w)
+DO_MSA__WD__WS_WT(SLL_D, sll.d)
+
+DO_MSA__WD__WS_WT(SRA_B, sra.b)
+DO_MSA__WD__WS_WT(SRA_H, sra.h)
+DO_MSA__WD__WS_WT(SRA_W, sra.w)
+DO_MSA__WD__WS_WT(SRA_D, sra.d)
+
+DO_MSA__WD__WS_WT(SRAR_B, srar.b)
+DO_MSA__WD__WS_WT(SRAR_H, srar.h)
+DO_MSA__WD__WS_WT(SRAR_W, srar.w)
+DO_MSA__WD__WS_WT(SRAR_D, srar.d)
+
+DO_MSA__WD__WS_WT(SRL_B, srl.b)
+DO_MSA__WD__WS_WT(SRL_H, srl.h)
+DO_MSA__WD__WS_WT(SRL_W, srl.w)
+DO_MSA__WD__WS_WT(SRL_D, srl.d)
+
+DO_MSA__WD__WS_WT(SRLR_B, srlr.b)
+DO_MSA__WD__WS_WT(SRLR_H, srlr.h)
+DO_MSA__WD__WS_WT(SRLR_W, srlr.w)
+DO_MSA__WD__WS_WT(SRLR_D, srlr.d)
 
 
 #endif
-- 
2.7.4


