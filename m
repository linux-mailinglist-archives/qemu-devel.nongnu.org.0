Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B266A2812
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPR-0000Na-MZ; Sat, 25 Feb 2023 04:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPN-0000MG-7a
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPL-0004pG-BP
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so5213045pjb.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 00:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
 b=ZVZ2CbujN6KzFIUGnHL93oFfllzQBsp0iFJ1oeHPFPr2+xlKE3EHIT+qpLyLpq+jah
 M99XB7jaE4FTkWyDytOe4X6DHtZxa1ciTrO2L135G9qu+YXWWsQ3W3iXiT6zG8NminSs
 DyNv1mUcsh+XJgGnsBJWIgdswau1DPT9DoWuuhEPq9YRQRSnWM3nGStaoBKJv9tVu/sQ
 fQstqdZbYqDWe1N6M5eN0P7GMj6/Lh34ahcwiQ47QObJx36djVBZu1YptS1JudGd2Fz4
 m+VkYshcjqJ1AyWNiPuksYc+CjgvzI79eJ20kvX/H3pFISuk7ByvnkgLEQK+eTDC74i7
 1LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
 b=H82MvFkXMVGslXnRumrlCAlNn2AE2ytSpUgqfArmGVDTrY3AsMB1Fw6nH6aSKWRRxT
 qQSmH+B2rxODPsdtCOXk3C6KI3GVArFRcZrGLLymXNeFpTSkndasS9D4+7vXG96z/cA0
 JXfUgLVu95ape5pNpp+pNuMpJg/GC2pbDpF5HeRGcRfd/2BBXqpgH9PC+IjEs1OG6Ue8
 K99gVJ1OSy//LS/JoX18TheM4N58OUTAuROeDPytJ7yNlqliFN0C/zvMEly9ko3TDeN1
 kn29SSX3pOauWuHOvlIewvLo6vnGA5L2JTCuM4yuqnPPc4Abuy1GOBS9yJak8NFDzzfZ
 2OuQ==
X-Gm-Message-State: AO0yUKV3I3KHOj9eQ/Nga/EXhNKXOpIBxQRimwxPRonYriL/WEmeRo3o
 8v7yiDBZYeXENmEKdV5QtX/nGAbtCu9ssAvG+BA=
X-Google-Smtp-Source: AK7set+nLMdgZ9H0TbN/xwwYiduH879DhoO2uqk034zO7EqCCD3Z82lFsyUIAymiEL8yr1CqZGDmfA==
X-Received: by 2002:a05:6a20:1585:b0:c7:13bf:695e with SMTP id
 h5-20020a056a20158500b000c713bf695emr20786108pzj.18.1677315593919; 
 Sat, 25 Feb 2023 00:59:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 03/30] accel/tcg: Use more accurate max_insns for
 tb_overflow
Date: Fri, 24 Feb 2023 22:59:18 -1000
Message-Id: <20230225085945.1798188-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Write back the number of insns that we attempt to translate,
so that if we longjmp out we have a more accurate limit for
the next attempt.  This results in fewer restarts when some
limit is consumed by few instructions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fac1e8c465..62e8f28025 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -78,7 +78,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
-        db->num_insns++;
+        *max_insns = ++db->num_insns;
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-- 
2.34.1


