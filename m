Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D373944CF44
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:51:22 +0100 (CET)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzFJ-0003Go-Vy
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:51:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0W-0005io-V2
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:06 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54084 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0U-0001ja-8B
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:04 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S16; 
 Thu, 11 Nov 2021 09:35:47 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 14/30] target/loongarch: Implement privilege
 instructions disassembly
Date: Thu, 11 Nov 2021 09:35:12 +0800
Message-Id: <1636594528-8175-15-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S16
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4ftrW3CrWxur1DtrWrXwb_yoW7trW5pr
 n8K3sxGry7JFn2k3yxJFyYvFWrWrW5XFy7Z3yavas8AFW7J348Jw10v34jvFy7Z3saqr4U
 Za1xZF48Wa18ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/disas.c | 86 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 1501462991..65aa0443bd 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -28,18 +28,28 @@ typedef enum {
     la_codec_2r_im16,
     la_codec_2r_im14,
     la_codec_2r_im12,
+    la_codec_2r_im8,
+    la_codec_r_im14,
     la_codec_r_cd,
     la_codec_r_cj,
     la_codec_code,
     la_codec_whint,
+    la_codec_invtlb,
     la_codec_r_ofs21,
     la_codec_cj_ofs21,
     la_codec_ofs26,
     la_codec_cond,
     la_codec_sel,
+    la_codec_empty,
+    la_codec_r_seq,
 
 } la_codec;
 
+#define la_fmt_empty           "nt"
+#define la_fmt_rd_csr          "nt0,x"
+#define la_fmt_rj_seq          "nt1,x"
+#define la_fmt_invtlb          "ntx,1,2"
+#define la_fmt_rd_rj_csr       "nt0,1,x"
 #define la_fmt_rd_rj           "nt0,1"
 #define la_fmt_rj_rk           "nt1,2"
 #define la_fmt_rd_si20         "nt0,i(x)"
@@ -68,6 +78,7 @@ typedef enum {
 #define la_fmt_d_cd_fj_fk      "K.dtH,4,5"
 #define la_fmt_fd_fj_fk_fa     "nt3,4,5,6"
 #define la_fmt_fd_fj_fk_ca     "nt3,4,5,L"
+#define la_fmt_cop_rj_si12     "ntM,1,i(x)"
 
 typedef struct {
     uint32_t pc;
@@ -88,6 +99,8 @@ const char * const fccregnames[8] = {
 };
 
 /* operand extractors */
+#define IM_5 5
+#define IM_8 8
 #define IM_12 12
 #define IM_14 14
 #define IM_15 15
@@ -170,6 +183,12 @@ static int32_t operand_im12(uint32_t insn)
     return imm > (1 << 11) ? imm - (1 << 12) : imm;
 }
 
+static int32_t operand_im8(uint32_t insn)
+{
+    int32_t imm = (int32_t)((insn >> 10) & 0xff);
+    return imm > (1 << 7) ? imm - (1 << 8) : imm;
+}
+
 static uint32_t operand_cd(uint32_t insn)
 {
     return insn & 0x7;
@@ -191,6 +210,12 @@ static int32_t operand_whint(uint32_t insn)
     return imm > (1 << 14) ? imm - (1 << 15) : imm;
 }
 
+static int32_t operand_invop(uint32_t insn)
+{
+    int32_t imm = (int32_t)(insn & 0x1f);
+    return imm > (1 << 4) ? imm - (1 << 5) : imm;
+}
+
 static int32_t operand_ofs21(uint32_t insn)
 {
     int32_t imm = (((int32_t)insn & 0x1f) << 16) |
@@ -220,6 +245,8 @@ static void decode_insn_operands(la_decode *dec)
 {
     uint32_t insn = dec->insn;
     switch (dec->codec) {
+    case la_codec_empty:
+        break;
     case la_codec_2r:
         dec->r1 = operand_r1(insn);
         dec->r2 = operand_r2(insn);
@@ -291,6 +318,17 @@ static void decode_insn_operands(la_decode *dec)
         dec->imm = operand_im12(insn);
         dec->bit = IM_12;
         break;
+    case la_codec_2r_im8:
+        dec->r1 = operand_r1(insn);
+        dec->r2 = operand_r2(insn);
+        dec->imm = operand_im8(insn);
+        dec->bit = IM_8;
+        break;
+    case la_codec_r_im14:
+        dec->r1 = operand_r1(insn);
+        dec->imm = operand_im14(insn);
+        dec->bit = IM_14;
+        break;
     case la_codec_r_cd:
         dec->r1 = operand_cd(insn);
         dec->r2 = operand_r2(insn);
@@ -299,6 +337,12 @@ static void decode_insn_operands(la_decode *dec)
         dec->r1 = operand_r1(insn);
         dec->r2 = operand_cj(insn);
         break;
+    case la_codec_r_seq:
+        dec->r1 = 0;
+        dec->r2 = operand_r1(insn);
+        dec->imm = operand_im8(insn);
+        dec->bit = IM_8;
+        break;
     case la_codec_code:
         dec->code = operand_code(insn);
         break;
@@ -306,6 +350,12 @@ static void decode_insn_operands(la_decode *dec)
         dec->imm = operand_whint(insn);
         dec->bit = IM_15;
         break;
+    case la_codec_invtlb:
+        dec->imm = operand_invop(insn);
+        dec->bit = IM_5;
+        dec->r2 = operand_r2(insn);
+        dec->r3 = operand_r3(insn);
+        break;
     case la_codec_r_ofs21:
         dec->imm = operand_ofs21(insn);
         dec->bit = IM_21;
@@ -499,6 +549,10 @@ static void format_insn(char *buf, size_t buflen,  const char* name,
         case 'L': /* ca */
             append(buf, fccregnames[dec->r4], buflen);
             break;
+        case 'M': /* cop */
+            snprintf(tmp, sizeof(tmp), "0x%x", (dec->imm2) & 0x1f);
+            append(buf, tmp, buflen);
+            break;
         case 'i': /* sixx d */
             snprintf(tmp, sizeof(tmp), "%d", dec->imm);
             append(buf, tmp, buflen);
@@ -509,6 +563,14 @@ static void format_insn(char *buf, size_t buflen,  const char* name,
             break;
         case 'x': /* sixx x */
             switch (dec->bit) {
+            case IM_5:
+                snprintf(tmp, sizeof(tmp), "0x%x", (dec->imm) & 0x1f);
+                append(buf, tmp, buflen);
+                break;
+            case IM_8:
+                snprintf(tmp, sizeof(tmp), "0x%x", (dec->imm) & 0xff);
+                append(buf, tmp, buflen);
+                break;
             case IM_12:
                 snprintf(tmp, sizeof(tmp), "0x%x", (dec->imm) & 0xfff);
                 append(buf, tmp, buflen);
@@ -916,3 +978,27 @@ INSN(blt,          la_fmt_rj_rd_offs16, la_codec_2r_im16)
 INSN(bge,          la_fmt_rj_rd_offs16, la_codec_2r_im16)
 INSN(bltu,         la_fmt_rj_rd_offs16, la_codec_2r_im16)
 INSN(bgeu,         la_fmt_rj_rd_offs16, la_codec_2r_im16)
+INSN(csrrd,        la_fmt_rd_csr,       la_codec_r_im14)
+INSN(csrwr,        la_fmt_rd_csr,       la_codec_r_im14)
+INSN(csrxchg,      la_fmt_rd_rj_csr,    la_codec_2r_im14)
+INSN(iocsrrd_b,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrrd_h,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrrd_w,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrrd_d,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrwr_b,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrwr_h,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrwr_w,    la_fmt_rd_rj,        la_codec_2r)
+INSN(iocsrwr_d,    la_fmt_rd_rj,        la_codec_2r)
+INSN(cacop,        la_fmt_rd_rj_si,     la_codec_2r_im12)
+INSN(tlbsrch,      la_fmt_empty,        la_codec_empty)
+INSN(tlbrd,        la_fmt_empty,        la_codec_empty)
+INSN(tlbwr,        la_fmt_empty,        la_codec_empty)
+INSN(tlbfill,      la_fmt_empty,        la_codec_empty)
+INSN(tlbclr,       la_fmt_empty,        la_codec_empty)
+INSN(tlbflush,     la_fmt_empty,        la_codec_empty)
+INSN(invtlb,       la_fmt_invtlb,       la_codec_invtlb)
+INSN(lddir,        la_fmt_rd_rj_si,     la_codec_2r_im8)
+INSN(ldpte,        la_fmt_rj_seq,       la_codec_r_seq)
+INSN(ertn,         la_fmt_empty,        la_codec_empty)
+INSN(idle,         la_fmt_whint,        la_codec_whint)
+INSN(dbcl,         la_fmt_code,         la_codec_code)
-- 
2.27.0


