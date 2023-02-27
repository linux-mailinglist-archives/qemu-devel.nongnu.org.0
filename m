Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A6B6A3C02
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWMn-0001Nv-1w; Mon, 27 Feb 2023 00:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMW-00087B-Lc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:49 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMP-00074i-RB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id y11so1419682plg.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
 b=wqCQ2XqRqzMwN4CQ1dMPlJbwaxJMem8BYVNyRiptWNHYpZxnGZeVHhk43Xi4vzKBrI
 CUpIExMkypOscQNrlsDv090uQq0bnoJjvnBXcJ1KF43910HLsXYnN+vvdaRHOxlK58Vc
 rlRyFHxYDH7UXsLf0t3TqLyfX1HnowEAljpUYrqY5NRJudz3SrBK5YAzo6L8ZraZFzTd
 YioOkzvnQotfLB7lh4GOfujgB9BanYK5Dgve/G7GIJU+PpEmsrIRU3IsoNzZ4sw1j7Tl
 Nx1kQDJiaSCKUDlbQ2xossFWsnn8RnXdY7qFOMUO1qWedArYZes1DZjV6IcqJT6XIFJy
 U0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
 b=sYiYb7mazbWWbUO3YaAaHEKijTgcil3G402io50F5IT9f8uyuN41tsmxLHEjo1ktRo
 YaHVavd+RM+Zm1jhz2fh9DFZVJY5ZBnbUedePJj8uihd9hehLgeoDwq+Sa0KfZYz17km
 Kz0UBGFcUlL1NkSQiECVE/peHkQ4Va1ml5+EreKrweWBOad2E97LkXLOHnklwyD8j8Ru
 r+d8Imjnau9b1QJ3oKIBH86+ka5aaqIEquGn8ty9FV1ViS7m33AZQ9erFqOZsxBaxT4l
 acyJnvbP8mdbYRDvWI288Y0MbRFn7yGj026Smhz6TrTH3OchzEqxTNkImAz9MWlEW43a
 zfxg==
X-Gm-Message-State: AO0yUKWpS1clX5ZwLTV+hUXYTqSk/hYlSvF0Sjpq771W11jde9RsGmbv
 fJFDpk7KF/gNFxPVOYK3M67RGYIoRBeHOzgVWP0=
X-Google-Smtp-Source: AK7set+cHZgZ9smcIv6j8Un9B93wLmCFNoFSWI6wVkFonR3TZr73cTl22mtuaWd/H5zgiuis1RoBIA==
X-Received: by 2002:a17:903:2903:b0:19d:2542:96b7 with SMTP id
 lh3-20020a170903290300b0019d254296b7mr339748plb.39.1677476858650; 
 Sun, 26 Feb 2023 21:47:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 43/70] target/ppc: Fix gen_tlbsx_booke206
Date: Sun, 26 Feb 2023 19:42:06 -1000
Message-Id: <20230227054233.390271-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Fix incorrect read from rD.
Avoid adding 0 when rA == 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f74f3b8f0d..52b812a01f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5867,12 +5867,10 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
     CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
-        tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
+        tcg_gen_add_tl(t0, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
     } else {
-        t0 = tcg_const_tl(0);
+        t0 = cpu_gpr[rB(ctx->opcode)];
     }
-
-    tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
     gen_helper_booke206_tlbsx(cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
-- 
2.34.1


