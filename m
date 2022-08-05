Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE09758AFFA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 20:40:48 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK2Fc-0008OV-3P
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 14:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK27C-0002BG-1W; Fri, 05 Aug 2022 14:32:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK279-0000Ud-Da; Fri, 05 Aug 2022 14:32:05 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275HnMqA007265;
 Fri, 5 Aug 2022 18:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=esMkIBD33LWquukdIa5yKTRCkR7YnLBqqMwgGkA7wuU=;
 b=iOW2vMYZxO5bBCe/I+euTf1OPxFdiW/oDhKIv4b1aODlU0eqzKmgDKUxgnHAIOXiR4Rt
 79mO79m4JvuPaeJxjVVySy4BEEuqPoONkSh7tdmVqTo/Vt6sZ+5N5v6sJ9W/+10xWdaA
 /jti9UzqUuaPoGBiWhe5Krnc1RBKtf/LQlCLFkmWQGYzs5ctTrT+Wp9T2KBQ31WclttO
 F3S5H5rQpd44bQQLlVAJ3NF0rmphnOzrOHtdDzfMy2CZE5ffta+GyE14uE/7msCpm5Eh
 h9RUlGteKuV7LIo8dgMZYcE7R4tOQaruVPOULh8v4ts0gjRUC9hUGQpUhXflB22qm/QV SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7xp94gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:31:46 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275IOWxE012726;
 Fri, 5 Aug 2022 18:31:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7xp94fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:31:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275I7G9i009969;
 Fri, 5 Aug 2022 18:31:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3hmuwhyr9b-69
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:31:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275G9IxX31064458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 16:09:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47529A405F;
 Fri,  5 Aug 2022 16:09:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E05CA405C;
 Fri,  5 Aug 2022 16:09:17 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.89.138])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 16:09:17 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/4] target/s390x: Make translator stop before the end of a
 page
Date: Fri,  5 Aug 2022 18:09:12 +0200
Message-Id: <20220805160914.1106091-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220805160914.1106091-1-iii@linux.ibm.com>
References: <20220805160914.1106091-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y0mzTaRgMuLBnqDTrpsnGsh5PP1ovFQm
X-Proofpoint-GUID: CTDEcYTwaac2JXC6XXxPDkVixbXU_P_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_09,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=894 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208050086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 include/exec/translator.h    | 10 ++++++++++
 target/s390x/tcg/translate.c | 35 ++++++++++++++++++++---------------
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..d27f8c33b6 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e2ee005671..0cd0c932fb 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6305,14 +6305,13 @@ static void extract_field(DisasFields *o, const DisasField *f, uint64_t insn)
     o->c[f->indexC] = r;
 }
 
-/* Lookup the insn at the current PC, extracting the operands into O and
-   returning the info struct for the insn.  Returns NULL for invalid insn.  */
+/* Lookup the insn at the current PC, filling the info struct.  */
 
-static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
+static DisasJumpType extract_insn(CPUS390XState *env, DisasContext *s,
+                                  const DisasInsn **info)
 {
     uint64_t insn, pc = s->base.pc_next;
     int op, op2, ilen;
-    const DisasInsn *info;
 
     if (unlikely(s->ex_value)) {
         /* Drop the EX data now, so that it's clear on exception paths.  */
@@ -6325,9 +6324,13 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
         ilen = s->ex_value & 0xf;
         op = insn >> 56;
     } else {
+        assert(s->base.num_insns == 1 || is_same_page(&s->base, pc));
         insn = ld_code2(env, s, pc);
         op = (insn >> 8) & 0xff;
         ilen = get_ilen(op);
+        if (s->base.num_insns > 1 && !is_same_page(&s->base, pc + ilen - 1)) {
+            return DISAS_TOO_MANY;
+        }
         switch (ilen) {
         case 2:
             insn = insn << 48;
@@ -6394,19 +6397,19 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
     s->fields.op2 = op2;
 
     /* Lookup the instruction.  */
-    info = lookup_opc(op << 8 | op2);
-    s->insn = info;
+    *info = lookup_opc(op << 8 | op2);
+    s->insn = *info;
 
     /* If we found it, extract the operands.  */
-    if (info != NULL) {
-        DisasFormat fmt = info->fmt;
+    if (*info != NULL) {
+        DisasFormat fmt = (*info)->fmt;
         int i;
 
         for (i = 0; i < NUM_C_FIELD; ++i) {
             extract_field(&s->fields, &format_info[fmt].op[i], insn);
         }
     }
-    return info;
+    return DISAS_NEXT;
 }
 
 static bool is_afp_reg(int reg)
@@ -6423,12 +6426,17 @@ static bool is_fp_pair(int reg)
 static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 {
     const DisasInsn *insn;
-    DisasJumpType ret = DISAS_NEXT;
+    DisasJumpType ret;
     DisasOps o = {};
     bool icount = false;
 
     /* Search for the insn in the table.  */
-    insn = extract_insn(env, s);
+    ret = extract_insn(env, s, &insn);
+
+    /* This is a subsequent insn that crosses a page boundary.  */
+    if (ret == DISAS_TOO_MANY) {
+        goto out;
+    }
 
     /* Update insn_start now that we know the ILEN.  */
     tcg_set_insn_start_param(s->insn_start, 2, s->ilen);
@@ -6616,10 +6624,7 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        uint64_t page_start;
-
-        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
+        if (!is_same_page(dcbase, dc->base.pc_next) || dc->ex_value) {
             dc->base.is_jmp = DISAS_TOO_MANY;
         }
     }
-- 
2.35.3


