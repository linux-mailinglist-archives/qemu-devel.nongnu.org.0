Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFA702FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:35:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZHc-0006lI-9r; Mon, 15 May 2023 10:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGK-0006gR-NX
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:21 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGH-0004qA-AG
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:20 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aaf2ede38fso124252995ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161196; x=1686753196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bi+7zXX3SkE4OXmw+QtVLrvmyt1/y9mkItKgRCmaxGs=;
 b=XLwuMQtnYBpwgEHJkTvUHakQ85jtbPvCc1zbaZLotBlJ3FItgfHJMKcZq+zhfkwrTU
 wjm6zBDqUGVuowwev3/3Ta28ICwknQ9qCNCjstTGtbjWMiSxNOF5ruvvbF2UUJWD32Hg
 N71mQ3XsFd0ujfl30QeVnbc5fbEF512bKggeZgwh5sFhVNivQtQ8VJCwBXTLvFJsjx3V
 GYqndc0kRFhRoXABR+YjFICby1Witqu+HPKEtkOgUSE5fjLCz5CMc7qZJlBvnHanq/IA
 djSdNKpg8tTv7rbwF+ANLa1fqHmiozfdVM3nmr6sspalNoyddES69DKe/8htPL5QfAXy
 flSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161196; x=1686753196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bi+7zXX3SkE4OXmw+QtVLrvmyt1/y9mkItKgRCmaxGs=;
 b=M3SUIO1j+3BJhMJuogkREnuReDroVSXCWHIK5qMMPJH46CJT1G3kRGb5EeFA3LoECo
 XQNgnMj/zLkjUJ1Gqehxs8FdBdAX5JLWfP8qXsWQ8TrtNiuqZuVk8yH8b+3elFk50wRx
 1RKA/83zlltgyWRNW638sq2nO0Ya7FaNi6+BjUZ9Jbrd6A/+VtkAX9u6gKHX/JfuAeNd
 QpTfUXkKTrzsq7zWXhKQGXo0mTPNPMamQfzMsdWwGJB6DiFKwBBIike1h4NoFgMjiigG
 E3amfvZy9JYDfl6WQaytZnXX7VRDgyWgROP9tPieAsRw82aOlACGZglVFCbDOpZsgt90
 fwhA==
X-Gm-Message-State: AC+VfDxZj4y5av47RijaulOC3iCeTM8bVr7z6PzNv7nstQ8QWukMaCgr
 dp7B5S63EtyoTtB1QMV7YPTO/2Q9orlcke5Xru8=
X-Google-Smtp-Source: ACHHUZ6PiuIYQxwAVrA0AtXiOgT/o0lrgUhJFlef5yw2GVgq4Fnl12ayqnmJ0ch7kKzvJPmTvvu4wA==
X-Received: by 2002:a17:902:ee8a:b0:1ac:6c26:c32f with SMTP id
 a10-20020a170902ee8a00b001ac6c26c32fmr29497059pld.46.1684161195895; 
 Mon, 15 May 2023 07:33:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 01/54] include/exec/memop: Add MO_ATOM_*
Date: Mon, 15 May 2023 07:32:20 -0700
Message-Id: <20230515143313.734053-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This field may be used to describe the precise atomicity requirements
of the guest, which may then be used to constrain the methods by which
it may be emulated by the host.

For instance, the AArch64 LDP (32-bit) instruction changes semantics
with ARMv8.4 LSE2, from

  MO_64 | MO_ATOM_IFALIGN_PAIR
  (64-bits, single-copy atomic only on 4 byte units,
   nonatomic if not aligned by 4),

to

  MO_64 | MO_ATOM_WITHIN16
  (64-bits, single-copy atomic within a 16 byte block)

The former may be implemented with two 4 byte loads, or a single 8 byte
load if that happens to be efficient on the host.  The latter may not
be implemented with two 4 byte loads and may also require a helper when
misaligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Fold MO_ATMAX_* into MO_ATOM_* to make two MO_ATOM_*_PAIR cases.
    This avoids the creation of combinations that will not be implemented.
    Dump the new field.
    Reviews dropped.
---
 include/exec/memop.h | 37 +++++++++++++++++++++++++++++++++++++
 tcg/tcg.c            | 27 +++++++++++++++++++++------
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 07f5f88188..a86dc6743a 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -72,6 +72,43 @@ typedef enum MemOp {
     MO_ALIGN_64 = 6 << MO_ASHIFT,
     MO_ALIGN    = MO_AMASK,
 
+    /*
+     * MO_ATOM_* describes the atomicity requirements of the operation:
+     * MO_ATOM_IFALIGN: the operation must be single-copy atomic if it
+     *    is aligned; if unaligned there is no atomicity.
+     * MO_ATOM_IFALIGN_PAIR: the entire operation may be considered to
+     *    be a pair of half-sized operations which are packed together
+     *    for convenience, with single-copy atomicity on each half if
+     *    the half is aligned.
+     *    This is the atomicity e.g. of Arm pre-FEAT_LSE2 LDP.
+     * MO_ATOM_WITHIN16: the operation is single-copy atomic, even if it
+     *    is unaligned, so long as it does not cross a 16-byte boundary;
+     *    if it crosses a 16-byte boundary there is no atomicity.
+     *    This is the atomicity e.g. of Arm FEAT_LSE2 LDR.
+     * MO_ATOM_WITHIN16_PAIR: the entire operation is single-copy atomic,
+     *    if it happens to be within a 16-byte boundary, otherwise it
+     *    devolves to a pair of half-sized MO_ATOM_WITHIN16 operations.
+     *    Depending on alignment, one or both will be single-copy atomic.
+     *    This is the atomicity e.g. of Arm FEAT_LSE2 LDP.
+     * MO_ATOM_SUBALIGN: the operation is single-copy atomic by parts
+     *    by the alignment.  E.g. if the address is 0 mod 4, then each
+     *    4-byte subobject is single-copy atomic.
+     *    This is the atomicity e.g. of IBM Power.
+     * MO_ATOM_NONE: the operation has no atomicity requirements.
+     *
+     * Note the default (i.e. 0) value is single-copy atomic to the
+     * size of the operation, if aligned.  This retains the behaviour
+     * from before this field was introduced.
+     */
+    MO_ATOM_SHIFT         = 8,
+    MO_ATOM_IFALIGN       = 0 << MO_ATOM_SHIFT,
+    MO_ATOM_IFALIGN_PAIR  = 1 << MO_ATOM_SHIFT,
+    MO_ATOM_WITHIN16      = 2 << MO_ATOM_SHIFT,
+    MO_ATOM_WITHIN16_PAIR = 3 << MO_ATOM_SHIFT,
+    MO_ATOM_SUBALIGN      = 4 << MO_ATOM_SHIFT,
+    MO_ATOM_NONE          = 5 << MO_ATOM_SHIFT,
+    MO_ATOM_MASK          = 7 << MO_ATOM_SHIFT,
+
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
     MO_UW    = MO_16,
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1231c8ab4c..ea5975805e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2195,6 +2195,15 @@ static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
     [MO_ALIGN_64 >> MO_ASHIFT] = "al64+",
 };
 
+static const char * const atom_name[(MO_ATOM_MASK >> MO_ATOM_SHIFT) + 1] = {
+    [MO_ATOM_IFALIGN >> MO_ATOM_SHIFT] = "",
+    [MO_ATOM_IFALIGN_PAIR >> MO_ATOM_SHIFT] = "pair+",
+    [MO_ATOM_WITHIN16 >> MO_ATOM_SHIFT] = "w16+",
+    [MO_ATOM_WITHIN16_PAIR >> MO_ATOM_SHIFT] = "w16p+",
+    [MO_ATOM_SUBALIGN >> MO_ATOM_SHIFT] = "sub+",
+    [MO_ATOM_NONE >> MO_ATOM_SHIFT] = "noat+",
+};
+
 static const char bswap_flag_name[][6] = {
     [TCG_BSWAP_IZ] = "iz",
     [TCG_BSWAP_OZ] = "oz",
@@ -2330,17 +2339,23 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             case INDEX_op_qemu_ld_i64:
             case INDEX_op_qemu_st_i64:
                 {
+                    const char *s_al, *s_op, *s_at = NULL;
                     MemOpIdx oi = op->args[k++];
                     MemOp op = get_memop(oi);
                     unsigned ix = get_mmuidx(oi);
 
-                    if (op & ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {
-                        col += ne_fprintf(f, ",$0x%x,%u", op, ix);
+                    s_al = alignment_name[(op & MO_AMASK) >> MO_ASHIFT];
+                    s_op = ldst_name[op & (MO_BSWAP | MO_SSIZE)];
+                    s_at = atom_name[(op & MO_ATOM_MASK) >> MO_ATOM_SHIFT];
+                    op &= ~(MO_AMASK | MO_BSWAP | MO_SSIZE | MO_ATOM_MASK);
+
+                    /* If all fields are accounted for, print symbolically. */
+                    if (!op && s_al && s_op && s_at) {
+                        col += ne_fprintf(f, ",%s%s%s,%u",
+                                          s_at, s_al, s_op, ix);
                     } else {
-                        const char *s_al, *s_op;
-                        s_al = alignment_name[(op & MO_AMASK) >> MO_ASHIFT];
-                        s_op = ldst_name[op & (MO_BSWAP | MO_SSIZE)];
-                        col += ne_fprintf(f, ",%s%s,%u", s_al, s_op, ix);
+                        op = get_memop(oi);
+                        col += ne_fprintf(f, ",$0x%x,%u", op, ix);
                     }
                     i = 1;
                 }
-- 
2.34.1


