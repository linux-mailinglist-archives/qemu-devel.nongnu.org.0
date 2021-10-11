Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0E429727
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:54:48 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0Rj-0004iW-Eu
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma0Qc-0003i7-FH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:53:38 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma0Qa-0004un-F6
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:53:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so670345pji.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 11:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyzFYnmTTZxRUyEWhU0BXDzTpJ0CMo8xjc8mo8AYFj0=;
 b=X803CuRAk/0LB3yHJ4riOFOXqCQgf8lrfa5ogRwZgM8qYJEPzg5cuNFX7MxreHXk0R
 zUfMMLlMnYkLZjt7QOnthqd3dwYfkpa9TGSEmBTNfTVaJrazuunWxkgtLq1zPE3IF3R0
 78YL6TR1YBlGKM8XsvoRmILWI4F2PUulnrXBl1kHacjLoK8130VB9pjO3NQFR0pxZ17Z
 r6bPdZFZZdkWslvTGzeuQkTzc2auNMmMHgOIkTekk0s9auEcFuP0Yp+fuZfSjuKRN3jn
 VGeOY8EyScxCPHDsWvdD7aJVAhuzhDhgwFF4Wz/oIW26j256y5PJQ7SKwCbBCDXe7O6l
 ABdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyzFYnmTTZxRUyEWhU0BXDzTpJ0CMo8xjc8mo8AYFj0=;
 b=GHzS11r8LDXAZtlW7z+X7GppKIXBfNWmydpmFvnEOO0QjzLbrMKGe8ZY3gFHHs8yVY
 saXOnfM2AwcLitKReY0c/mxFMgCdYTQQEKQkrfZ2sgsmnIVcYTqUiTzQ2FA6srTvt0iC
 zc/2UKT/qXdxPgi1PaKQc8LtNp3bxB5cQFW5TX2ranFSIeqPwHGYp8fAJkjoWW2Afk2s
 VYHf77vhMkRy46jStJJUqoybNmPCMOu09i85itw+T1ZNrct5l7A2UFsv4LP2yfq5zoP7
 FQEwU3zbyMVfYGGnX7GP3Y7iI5ZolaKItQYFvhLwkj/zS40WM71sWQ43a9e1v5QWovRd
 +4lA==
X-Gm-Message-State: AOAM533BVFSnJ7tOgWRki2psL3aofjPgRlQQecQO8tcIdihCPw0/l3ej
 UWlPKNQ3CwhS2LHoYxR1An8IohTD8AQtmw==
X-Google-Smtp-Source: ABdhPJy6I1Ru5PWSNllCDhRkV32N7AS5D1tVRK77P6l64lIjoTSzxzUps9AGpalDI35XRRXspq6RGQ==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id
 na15mr792389pjb.200.1633978414588; 
 Mon, 11 Oct 2021 11:53:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm8312256pfz.77.2021.10.11.11.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:53:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: move tcg_gen_insn_start to s390x_tr_insn_start
Date: Mon, 11 Oct 2021 11:53:32 -0700
Message-Id: <20211011185332.166763-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use INDEX_op_insn_start to make the start of instruction boundaries.
If we don't do it in the .insn_start hook things get confused especially
now plugins want to use that marking to identify the start of instructions
and will bomb out if it sees instrumented ops before the first instruction
boundary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f284870cd2..a2d6fa5cca 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -138,6 +138,7 @@ struct DisasFields {
 struct DisasContext {
     DisasContextBase base;
     const DisasInsn *insn;
+    TCGOp *insn_start;
     DisasFields fields;
     uint64_t ex_value;
     /*
@@ -6380,8 +6381,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     /* Search for the insn in the table.  */
     insn = extract_insn(env, s);
 
-    /* Emit insn_start now that we know the ILEN.  */
-    tcg_gen_insn_start(s->base.pc_next, s->cc_op, s->ilen);
+    /* Update insn_start now that we know the ILEN.  */
+    tcg_set_insn_start_param(s->insn_start, 2, s->ilen);
 
     /* Not found means unimplemented/illegal opcode.  */
     if (insn == NULL) {
@@ -6552,6 +6553,11 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
 
 static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    /* Delay the set of ilen until we've read the insn. */
+    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op, 0);
+    dc->insn_start = tcg_last_op();
 }
 
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


