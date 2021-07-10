Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56B3C3529
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:33:33 +0200 (CEST)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Eyy-0008Jj-Ju
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExP-00059C-0W
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExN-0002GZ-CG
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:54 -0400
Received: by mail-pj1-x102b.google.com with SMTP id n11so7433067pjo.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cv9aQndI0rEwp95MS68py3M2LPMGPGCFK/5GDBRseGA=;
 b=kqrb0bDbXJVnVvo4sIaPpp3dDLUb5LWbSCHmDYoKnmuySncdTbzMlK5zxn2la3J/ce
 8H8pq0q+JejMnDcaBW+ALSBMFhlOhmJNuP2gGTtpbLX8aJejyswENN9ZW9Cj1ok+kGSO
 DNMZGIqFQveqxusJd4zQH2POhUNVYfzOSq8GMVrDneAj3iLNaK8jqBJyXpRFC4bw1c5Z
 T+zyf1ou5AXX3wWONV936ZCwXTktRBXkGitMNipz28tsC7BZn6aZgLPEofJXqpgBUQms
 7Yw0TeD357fmB3W5+RyRbqxAf41992xCvqeG8IoZJN61ZzWdrZdcVBkmwtvWnBcEcqv9
 9chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cv9aQndI0rEwp95MS68py3M2LPMGPGCFK/5GDBRseGA=;
 b=Sl/1zlPTXor6utTDhtfp3KvSJaoEkerF9J2QP8Czr3ksWtbpWm8NmzsOiA0H/roWDE
 3Jeyj/+egjUlvdqtpcRLg9L/BUxtbyAxKniuEo8eUfGNPCB7qUvpqsinzLMNXxoXoGWy
 SeaJUaiBOCiWs9cBQvWB+66yGKHyo32FOLNgWJanIO0Uvjno2mYjcVDQHAagyNdxsCfz
 FmHlRkE1WXia0wu5PvitsqLYoSGU69klQyCYjpjcMCd17nD7fx89EXvLDx6MDc46qnjC
 9cr9oCwzAyF9XYwGZAFTLl5es45pAhh8Zl2fFeUjwqqDKwbN0AiHyYHDDitcb/nLWmUQ
 1a5w==
X-Gm-Message-State: AOAM530KiKOM8P+mdjLTqJ4tAWWfSMLvt57bLb/ZUwcF/rvJJDyZ+qdX
 mi0W6VFNsvrhrW3sXQ8qVz4X4BnC1+zUzw==
X-Google-Smtp-Source: ABdhPJxlTcl/E5LQAJyRC8EQmp92kjNJKKwHNQaSLFMTG3wInog7TvuzFpxDe+Z7Y7BRLeVH7X+lBw==
X-Received: by 2002:a17:902:aa49:b029:10d:22fa:13d4 with SMTP id
 c9-20020a170902aa49b029010d22fa13d4mr35660319plr.78.1625931112109; 
 Sat, 10 Jul 2021 08:31:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/41] target/arm: Use DISAS_TOO_MANY for ISB and SB
Date: Sat, 10 Jul 2021 08:31:12 -0700
Message-Id: <20210710153143.1320521-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using gen_goto_tb directly misses the single-step check.
Let the branch or debug exception be emitted by arm_tr_tb_stop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fdf2b3d1c8..6d2867be1d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8904,7 +8904,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
      * self-modifying code correctly and also to take
      * any pending interrupts immediately.
      */
-    gen_goto_tb(s, 0, s->base.pc_next);
+    s->base.is_jmp = DISAS_TOO_MANY;
     return true;
 }
 
@@ -8918,7 +8918,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
      * for TCG; MB and end the TB instead.
      */
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_goto_tb(s, 0, s->base.pc_next);
+    s->base.is_jmp = DISAS_TOO_MANY;
     return true;
 }
 
-- 
2.25.1


