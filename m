Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A334F43042F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:28:25 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboPw-0003Ns-OS
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDY-0008NT-Jh
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:38 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDR-0001xr-39
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:36 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so11819822pgk.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R6dlxti+/N1vnkKixu8IUh/Zl8M8i7vv7yb2sO8QtGA=;
 b=Nw4nnpUrrNErr/bQDZR8AUtn7/83glNpbtWLC+s2SgRYl4cwSc/36p9lIcgj5oOf7V
 /4s/zVe/65tDMJuKXouPB8yEzTaYTYRAnW1TWfnZAAEqiENmSC7yE7rHs9kecbckzwIC
 oocqwNmxpNXqSdedOqXkZF3TF6MgeWiOnTUguo4Rj0UVy+/voIV1PG7zvNNR2ntXZtlW
 JyqlVFWomCHVn9P7VGQc3uvqm/qfpOkFTRGFVhOXKvQg7iO8oBwJK840h5LZZguezPcf
 LOIpKohVl/TzvuFFmRfvfyls/EBdyZg9o6vJfna9RDFtWI3KrVUzYmHY2LgHlZPQxNch
 zTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6dlxti+/N1vnkKixu8IUh/Zl8M8i7vv7yb2sO8QtGA=;
 b=XVsLQIgl89OipTIDu3p0go73NjUtcoEyFMGZfRqWlPhNR9A/f2HZ/d3oaepCb7cu9j
 MwUIybSHX8JZO5z5EP7LwlONQeP8+coeoPqXnua6Mm2fC4c0qDmC2Riga7xFcz7nLbpl
 nFED8JrSL7TQAJoSC+QBC722iuYfWOHdr3hGRtYHWVo4oz4wj+4D/X5sO/yKCuOB4fDb
 TSRzr/Hlz/GutAIT+PRUuZcWNEh13VJU6DHj+1Npls281epeCv8TzvKc0CHZB46hsrDk
 oebCjoi+x7b3Tt1qJqJnL/2ZmazrbZFE2/o2jQdiBTDl4IYOeScdTpPHpXVsbczUTWXr
 ZLYg==
X-Gm-Message-State: AOAM531LmxD5DHO7P3lF1/KV1o9To56IPt7ieHgi2bSpt/Otf8ChJd2C
 owdFTIM09DVeL2ddJ2/7MbyMaNkl4vj5Sw==
X-Google-Smtp-Source: ABdhPJzJbHoJXuQJGphTcx6rCvuzeabTBK9Du3Bk3pXlp1wz3RCurvmecSZceoccVHboKbQLsBmGCw==
X-Received: by 2002:a63:e116:: with SMTP id z22mr14629750pgh.223.1634408126740; 
 Sat, 16 Oct 2021 11:15:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] target/microblaze: Check CF_NO_GOTO_TB for DISAS_JUMP
Date: Sat, 16 Oct 2021 11:15:01 -0700
Message-Id: <20211016181514.3165661-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using singlestep_enabled as a proxy for whether
translator_use_goto_tb would always return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..7e465b629a 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1779,7 +1779,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         break;
 
     case DISAS_JUMP:
-        if (dc->jmp_dest != -1 && !cs->singlestep_enabled) {
+        if (dc->jmp_dest != -1 && !(tb_cflags(dc->base.tb) & CF_NO_GOTO_TB)) {
             /* Direct jump. */
             tcg_gen_discard_i32(cpu_btarget);
 
@@ -1804,7 +1804,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
             return;
         }
 
-        /* Indirect jump (or direct jump w/ singlestep) */
+        /* Indirect jump (or direct jump w/ goto_tb disabled) */
         tcg_gen_mov_i32(cpu_pc, cpu_btarget);
         tcg_gen_discard_i32(cpu_btarget);
 
-- 
2.25.1


