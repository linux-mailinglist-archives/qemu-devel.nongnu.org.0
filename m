Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C33A3B88A7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:43:36 +0200 (CEST)
Received: from localhost ([::1]:58068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfBO-0002uR-BN
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0r-0005PF-Bt
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0p-00024V-4n
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id s14so3383874pfg.0
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EuLUTgtrIq55E1MmI7/EbN0xfKvn2I2h2MjVLgAIedQ=;
 b=UrOWh+BK3L8ETRDsP8Ny8m/0mTdoevAuICl3w6B7WefVtUFRDoawh8Amb81zHoohfY
 9LwI+4N0jm2IWPzZJfXQdPX5o1P8qYOl5HAg/zqmyxhuJOg9Joavv0upY9+ls/YYm749
 7r/KGdbr6PcQ6umWu0ZxG91l/NHCVQImpTKUGrR+xPC/uozb4n3Yj4NuhrnhME+ZAA8a
 IRH40ySPVuQmIsXwkXDLBSidRdEWtJ1apzFRgjWb7D8NK0Y+FfnbB7QuAY5ek04ZZDrO
 BHSifbV5MUatkfpmHNhsBheiqFwBxHPiHb8AAjYcYNe+lnTq8AKICwcRLeOliriivJkb
 uXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuLUTgtrIq55E1MmI7/EbN0xfKvn2I2h2MjVLgAIedQ=;
 b=fn246X42lWFPEAF53RNfDsRbDIVWTmNaS+tGncOVnIw/iFPVgZCK6El9hCJ1rqq1BA
 QZakMB4lTM8y9BVZ07USTFRcpxSucvV+ady6TUIBWBTz2ELsPuSysy4/UobZ/BXGCb49
 t5+RJSzr9Qg3JeO+oyoz1MQsNzhuS7n0Hz1GhO3Q0Q9eSOSm3V1qREmYJ7G7pjGd/nrr
 h7KoAIoSojX6tFIpkgPvIMbxfrARbkeGkrHQZIxlO/CPwXpdK0yO6n17HQqhdQVFalna
 AD/QcVFirpd4NDiVdX0K7EsPiXPr+N6lU8F8dLH82cwYCuINy3v9mUOoeRkDqxdO8nzQ
 sdkg==
X-Gm-Message-State: AOAM531x0IxxY7zCKiRKvZfXd7OhHimzlioOBB6UdcCDqLJh9gBFM0NA
 Nz5BuI4jXSr17+hMgfuF0Q+bRbyLmf8UMg==
X-Google-Smtp-Source: ABdhPJxTaYeqW6CSS6EOL2pnGJiC/BmH8PA9no6iq2yte8A3p1jrdvggYX16iL5hl37cubqn9D12ZQ==
X-Received: by 2002:aa7:9a5e:0:b029:305:5d37:7622 with SMTP id
 x30-20020aa79a5e0000b02903055d377622mr6682982pfj.2.1625077957884; 
 Wed, 30 Jun 2021 11:32:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/28] target/nios2: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:15 -0700
Message-Id: <20210630183226.3290849-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 930f3d3395..17742cebc7 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -150,24 +150,11 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-static bool use_goto_tb(DisasContext *dc, uint32_t dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 {
     const TranslationBlock *tb = dc->base.tb;
 
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_R[R_PC], dest);
         tcg_gen_exit_tb(tb, n);
-- 
2.25.1


