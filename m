Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785F2EB1E9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:01:42 +0100 (CET)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqeL-0004Kj-1r
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0d-0002RZ-2f
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:40 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0a-0006cb-4q
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:38 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s15so50189plr.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LKGM21omgiw4s8pLH3F/GfWnbD4CM5oKLWF8kPN/DI=;
 b=QjnMf5B8ZV2KCJxA2jhoccW4MDB/cum8xjbFaHV7+zBV4Hnjx5Uep7b9QQsll7XfHe
 LUyTwFN3dfD0CmxcttiZqJ6JbRYMkETQGif2pHaB1t+F+2fohO412YuIDzWVwr/56Wgx
 HMmk+XuoSFwbCjJ7pHh0SfA4sF0/9fgwyrHCir0G1xWG69dKGCfJq3uVj3GOhUaoNal0
 jCW9nPvQSZPLrBUN5va7gL1Sgn6zr4RLkaVKLLoVv9s3u/2nhBbvhiz+y6yf7giSmh1e
 syE8NL2dXGbD7zkOxo30h0CYRLXnzPIKtc7QF18g2fscLR0SH/AaYUQRZESwqURMQrnI
 hQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LKGM21omgiw4s8pLH3F/GfWnbD4CM5oKLWF8kPN/DI=;
 b=ckVNvPwQzuliGC6eWeVEragAvc9nNRCwqlytjlzdHAzDVrQeSJ4LgBR/ZjqJXtqD9+
 kpjx6VTiCLyVY6NrUAHfxYR6ImK6l3jZS9cbd68NNyIg3DMjlt3DxazJXPTeQZh1tRXV
 Aa44PRrBYebmyMstRcWa7pgtgKlzMrxZKA55xaoVsgnmr093b5LBA6V3/Gnj1wC9geOc
 UCOzHpxZRpTy8cbyfQ5ki2foeLa0V3HZ+PA9/ch5fAuizJ2AdsKITjpCOIvGMsvafbgx
 GdjMypVAaDoLaJyT4y0OYKpdhyd2KptPVGY0C9mCBj6tijo5BlR7+DeJmdA16pgXfdgA
 k+Sg==
X-Gm-Message-State: AOAM532oPDuQ3vPQRBXqm/5BHrZKG8WxHATUYPUA+QmIt4GhWJxK1PAz
 5iE4kPmHeOwanIJJz/mLoUoBWN5e3BByhQ==
X-Google-Smtp-Source: ABdhPJzuICLeYVTwSNYeeCDZRupu7NZlBwSwC+mbdlJBTSLLK8i2IUe2eHndfP/skwnmDMx2Ec9jkw==
X-Received: by 2002:a17:90a:df12:: with SMTP id
 gp18mr246719pjb.43.1609867233891; 
 Tue, 05 Jan 2021 09:20:33 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/43] tcg/aarch64: Use B not BL for tcg_out_goto_long
Date: Tue,  5 Jan 2021 07:19:29 -1000
Message-Id: <20210105171950.415486-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A typo generated a branch-and-link insn instead of plain branch.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fea784cf75..bd888bc66d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1317,7 +1317,7 @@ static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
 {
     ptrdiff_t offset = target - s->code_ptr;
     if (offset == sextract64(offset, 0, 26)) {
-        tcg_out_insn(s, 3206, BL, offset);
+        tcg_out_insn(s, 3206, B, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
         tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
-- 
2.25.1


