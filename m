Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89511515FC9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:11:18 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrYr-0003bj-Lq
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI6-0004gr-JX
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI5-00083i-6u
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y14so9363704pfe.10
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjrjylQ1BROO/szmSr2u/qgefotDd4xpG3+xntl3yXw=;
 b=K+WmoVS9DJOPGxNnWnKxMbkR6TN1rKXHg6Ngimp/CnahjDGKS79iSIH7liIbT1pcg4
 Bfok/aDliL461jqtqVBqxHZLidIAKVzhdSIKt1fSXWdSboGFt9OBXTYsXzy9600hG7di
 0jHDcKRo6cYwam661y11SQXSftG+YYvUbKTcFXZmeILrgW9qF8hlllBlUpN+BsRZDR0T
 uWbh3+YkNgjtnMMxTO0asJV/RyJwJkWl+hcakHyFC0g3+172pKsiQcaO1iIvioBZFOXe
 +2nCeonDP4Uxo7kr1N4asfBSsbZ7dKo7huKqV87xgESs3O14juDEbppaC2usC8LMrvzJ
 elLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjrjylQ1BROO/szmSr2u/qgefotDd4xpG3+xntl3yXw=;
 b=MFlXo4bGYHbZNGwQAK+fEnahA+gSjFgHXlgGoSOhceaRrBVanI7JOWm4n6gTulBjOU
 JAA7QziOHVLdG0zSAMYwcLlOqaEntEcOUP0kVHcIlxpobIKZ6AOVN0R6gPHlFnVH83kH
 hG7cKkKqYr2i7TGxnbbHTMb050IgD8VOfHda5G6rWoOEaotpyZkcE+OsMMxdTABtc+oe
 aqOg/3ZVbJtxfrWXJH3ijQmETn1AV0cK8wQLQ1RXVaFTHTfFSyvj4uaP3KAaScObs4XG
 uz0leP8xNxEkQoD7lbO6wUpPykZEvVJBCQdbKtDBRMMo5TQlFh4AAJNn6IjOTXreOVbu
 ifyA==
X-Gm-Message-State: AOAM532+tgMGSPyynr8VNrgq3fX6s1e465qs2A5EeQ1sWsf8KjTTeYVn
 3pbOpzdJW/1u7dvetiVMcHWosQOwbkMl9g==
X-Google-Smtp-Source: ABdhPJw4ad1yKv+fLGJtwiEJyemyplNEJKw9wpzy44uRQrWUZL/kFuFoCUTK0yJQvE52kp7nISG/GA==
X-Received: by 2002:a63:164f:0:b0:3a2:ced0:3327 with SMTP id
 15-20020a63164f000000b003a2ced03327mr3812001pgw.425.1651341235862; 
 Sat, 30 Apr 2022 10:53:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/17] target/m68k: Implement FTRAPcc
Date: Sat, 30 Apr 2022 10:53:38 -0700
Message-Id: <20220430175342.370628-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0cd7ef89e3..a3141d7f77 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5567,6 +5567,35 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    gen_fcc_cond(&c, s, cond);
+    do_trapcc(s, &c);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6190,6 +6219,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f278, fff8, FPU);
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.34.1


