Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD106AB3C5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuj-0006DN-HJ; Sun, 05 Mar 2023 19:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyty-0004WS-62
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:32 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytw-0006mq-6M
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:29 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x11so3972600pln.12
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=me2W+fTlJlqj7feis7BNDFbPcNy0iYOrCgDuOWs04xQ=;
 b=B9WIvpWTjoMqXTS4kt2QFXmBo9Ub/KK/9RIJcH206+7AlM7qCdAnG+/0GsHg9r1oDf
 jPNGs3/NB9aE5zJC9HuQgNVdG3J6YiFtQ+HA+JZXYK33fYMf7Vo6fNiBT1hmFJQb6x4a
 OBKeAI1Ae3CoC37kvZrVuNLdWMAgZGIqsfNfI5U4fJ42ff/jDZagiH64YB/Zx6lVu2mB
 ZcFuMuyliLxwfL/NU1sGgAfGUjz5skHGBZ4A1k2yaRoOpQsm3ps43DsknWSvU79d5n5m
 vvht5+rgjRIXr4euH3njaKtFd1TUjQnYiDwC1jKQ2OB9drCWMMwLX/tCNx/VLsHXarGW
 24Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=me2W+fTlJlqj7feis7BNDFbPcNy0iYOrCgDuOWs04xQ=;
 b=VtCvuHdNuVJsqYu3+56qTR4c4SccdlFgQ04/gSeQufrfMIxdWQqGVRknHDwT1CgXKY
 1f2yZ3/oOgHfHrUGXZmD+OutI2vlw1kfIGd9191Mzyb5LNZ/KfijsMdRDnbGsficKRw5
 yvbrbOA3kJ6k+baRpPI8TK4Q1y1sxNpQvhG53bzBPOdqP0L64y98Kbhc0Yhdmdf+JWLn
 IDASZWn+o/33pa7xoXCsOm+UNz1SOry0p5wQAo9mjdytBj1P3t4RBllUBujUNyG/8Cb8
 YoCeIrP4jMwINqdBTnK2aGDCSQquUh6JAVOmePONKUnJ8WMFxUGJ9K3BT0IzhKZhenl2
 opvw==
X-Gm-Message-State: AO0yUKXW3ZF2kgqpEWhiYpaFAuKOy8dH/LyaRqWbESZZtqMICCy8YM1Y
 88L8mbwk0isJRx/ohAwD06iQP3BAbDcZvgvdQG+QVg==
X-Google-Smtp-Source: AK7set9G77/UvPQLoTBY+18dsYrdl6U6KdM9MDy09ZefU3AJmMDJM5vMLmIEBk/z556HAen6Xej/JQ==
X-Received: by 2002:a17:90b:3a88:b0:237:b702:4958 with SMTP id
 om8-20020a17090b3a8800b00237b7024958mr9678830pjb.38.1678063225904; 
 Sun, 05 Mar 2023 16:40:25 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 34/84] target/cris: Drop addr from dec10_ind_move_m_pr
Date: Sun,  5 Mar 2023 16:39:04 -0800
Message-Id: <20230306003954.1866998-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This variable is not used, only allocated and freed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate_v10.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 5e9d1c0fe8..4f03548365 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -800,12 +800,11 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
 static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
 {
     unsigned int insn_len = 2, rd = dc->dst;
-    TCGv t, addr;
+    TCGv t;
 
     LOG_DIS("move.%d $p%d, [$r%d]\n", dc->size, dc->dst, dc->src);
     cris_lock_irq(dc);
 
-    addr = tcg_temp_new();
     t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, 4, t);
     if (rd == 15) {
@@ -816,7 +815,6 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_PR[rd], t);
         dc->cpustate_changed = 1;
     }
-    tcg_temp_free(addr);
     tcg_temp_free(t);
     return insn_len;
 }
-- 
2.34.1


