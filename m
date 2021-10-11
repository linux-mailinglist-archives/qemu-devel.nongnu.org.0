Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613ED42944B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:10:43 +0200 (CEST)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxsu-0006oZ-4h
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZxgP-0006vX-K2
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:57:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZxgN-0006AD-Pl
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:57:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id v17so57679989wrv.9
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8QeImzhxeArYxA8dgfjiuewMOTyjc4+cRdvgVAToBmc=;
 b=Bxx3JVpH0HCdmEprt/m4I119EFgT3lCTuZjatAMPuOiAaCU1FBjaZn91kWWXnol/rd
 ht55MEZsEn8uVXfqmDpc+OkOUBXVS/+uywuqeSoaJ6Diq3d1H0eeYaewSRt4cJjLvGjg
 ADIlrvHiWKgFxZ+sFTwT7z7p3e1voGXurpfgmpAHHPmSRU+LlOp0QU6w3enTY+pcCK1s
 mjtPN8x/v/DMO/lKVNGDCk+Ylh7SGx7vERGhn8jwjc4oegMKIeFxfI0ybaVwx94gjxyA
 WVMDga3NX/hStAgn6rfTgFZ6VCkUTXkZy267lG9gR4EmVlX41Rd8f+igo5g1dg3ht+CE
 Pw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8QeImzhxeArYxA8dgfjiuewMOTyjc4+cRdvgVAToBmc=;
 b=gZw2NUvVoWbAj0aDyywgb2H8Mm36xm5ZZRTl6eJSDj4IF534bvs7g3HpwbPUPvvnnZ
 LldG8+UbgtzWOY8gZCTZIFHfKu+pQiCC1zxLslzYvU5COeIo0iLSHxp3fkRQ7zAYbrGZ
 wQ1S85ZjwtQ+igfYk3pV+n6bz6/U0rZYDniiDMLx8LxYBBPIn2PsQvs/hdmgbfIDj/LI
 W/mG6H7sTQTL/rgGay5vKCnAnKRc77J5lrPiZnfvzu227NxskLqBmDVfIqirSEFDZYAy
 B5XyRifRrgYEXA/stSW2wYLxrhXIHX2T+xQVFRpQvJvRJd7S6s4qvlfK2UZaOMXGwveh
 dwVg==
X-Gm-Message-State: AOAM533iDU7WmdburJUztMO07da587vqtH1FpJbCTcrnVfdi56XpGz72
 /SK8Oqnfytl1RiBohL4Amn0dyA==
X-Google-Smtp-Source: ABdhPJx6IAnzoD9zdYofOLLY95BPWefRs4hrb5KjZTUZgUUnH/ZA3vK9NAv12JM7SrlBqiPqXiwc8w==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr25963921wri.155.1633967861786; 
 Mon, 11 Oct 2021 08:57:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm8499360wrb.36.2021.10.11.08.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 08:57:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D35EB1FF96;
 Mon, 11 Oct 2021 16:57:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/s390x: move tcg_gen_insn_start to
 s390x_tr_insn_start
Date: Mon, 11 Oct 2021 16:57:29 +0100
Message-Id: <20211011155729.3222362-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use INDEX_op_insn_start to make the start of instruction
boundaries. If we don't do it in the .insn_start hook things get
confused especially now plugins want to use that marking to identify
the start of instructions and will bomb out if it sees instrumented
ops before the first instruction boundary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/translate.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f284870cd2..fe145ff2eb 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6380,9 +6380,6 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     /* Search for the insn in the table.  */
     insn = extract_insn(env, s);
 
-    /* Emit insn_start now that we know the ILEN.  */
-    tcg_gen_insn_start(s->base.pc_next, s->cc_op, s->ilen);
-
     /* Not found means unimplemented/illegal opcode.  */
     if (insn == NULL) {
         qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
@@ -6550,8 +6547,30 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
 {
 }
 
+/*
+ * We just enough partial instruction decoding here to calculate the
+ * length of the instruction so we can drop the INDEX_op_insn_start
+ * before anything else is emitted in the TCGOp stream.
+ *
+ * See extract_insn for the full decode.
+ */
 static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
+    CPUS390XState *env = cs->env_ptr;
+    DisasContext *s = container_of(dcbase, DisasContext, base);
+    uint64_t insn, pc = s->base.pc_next;
+    int op, ilen;
+
+    if (unlikely(s->ex_value)) {
+        ilen = s->ex_value & 0xf;
+    } else {
+        insn = ld_code2(env, s, pc);  /* FIXME: don't reload same pc twice */
+        op = (insn >> 8) & 0xff;
+        ilen = get_ilen(op);
+    }
+
+    /* Emit insn_start now that we know the ILEN.  */
+    tcg_gen_insn_start(s->base.pc_next, s->cc_op, ilen);
 }
 
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
-- 
2.30.2


