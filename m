Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB0681C03
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFt-0007vQ-R0; Mon, 30 Jan 2023 15:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFk-0007Uk-Mq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:52 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFj-0005D8-6X
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:48 -0500
Received: by mail-pg1-x531.google.com with SMTP id d10so8558876pgm.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTUZLEFCfr7lT34+spBSQV2zfVIDOr8BydY/0R/vz+U=;
 b=jxbcnqzXENm8yzrOogANceQlBCWzYok3tfiBo56TQvyE6Z2/E9Yjc/hCIS8kxq2c43
 /JZZ2de4ciQEKf4smuInNuAHbUP/b0Zlkjq0DZDtcOtFMSYdiOdcHyBRm6i7S+MvGNrR
 9epROmX2lHPjnB1YyNVZVniChUwyApYLP7yYjARJExadQuzel+HsQ4KujvYSVz3KyQ9E
 I/2K3vFf3lvPf3WT4hr7MJZUSwlKLgbL8yJ2ZDY8GEzO6vtxKcjByAJJRacQ+VltqCot
 rn1QlJHY+bwFFvklNbgHfFWldpfxUCRam4Ee6VqBSexpJv9xvZZNoQF8lUzPJjedDYG+
 rCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTUZLEFCfr7lT34+spBSQV2zfVIDOr8BydY/0R/vz+U=;
 b=jPji0Nvzkwt6lejSSkXN7K9euYY/iXbKugI1U+RiSjJovcw1Ypqec9INJSbWc3uW4w
 DQsJcPi3dctJfwlgq3Je3/OG1NYAkRiKUMU+FrHMTjddP+dcxvpMi5/gbXkTyT89AkTd
 2n9r80/ivvV0PciGOCXGg0lkcnnaO7t66/OPxl4eIoSuK6IT5QiOrtIHtEYEOBM6ydjl
 IvwmBcpM0tbdEK4JToEKPL3sUkzjFO+Xiyc4Au+LOyQS2Q6RZgB+Dv/88HzoObqMEs1p
 m3qrzRmQVSAHZlD0UTSyA6Q0rah8HVDIOpO61qSu/bbpvPtRGraWpDTfwSo9H0EQl/QG
 KHPA==
X-Gm-Message-State: AO0yUKUgFYx1ryawZh1gio/cMTHNaL90Q1EM8yqmA0QTiwEZjHyFbB4/
 l9wR72OqDxuQWiZthRAqmdTZ9gq+1ViW+bVT
X-Google-Smtp-Source: AK7set+eAKZP26vNr6Q94Zq8GLPJzcX9bGtZ9mZKQpXvam6s0PCc6rrWB4EEV9DOBrUMAAN7LTgDBQ==
X-Received: by 2002:a05:6a00:1f0d:b0:593:b470:aeda with SMTP id
 be13-20020a056a001f0d00b00593b470aedamr5261352pfb.29.1675112385638; 
 Mon, 30 Jan 2023 12:59:45 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 03/27] accel/tcg: Use more accurate max_insns for tb_overflow
Date: Mon, 30 Jan 2023 10:59:11 -1000
Message-Id: <20230130205935.1157347-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 08a816bffe..250647eb49 100644
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


