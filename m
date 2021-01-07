Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6F2EE71A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:42:45 +0100 (CET)
Received: from localhost ([::1]:42502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc7I-0001af-Pv
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh8-0001SF-Ns
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:42 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh5-0001ex-Ds
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:42 -0500
Received: by mail-pj1-x102f.google.com with SMTP id n3so4520168pjm.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LKGM21omgiw4s8pLH3F/GfWnbD4CM5oKLWF8kPN/DI=;
 b=w+Cadi1KQHdDgjJRX2UQLdOmf4ewiBf6v7wCbXmfCui05ngrBnB8LNRf26DbtlR9yd
 u7Paz5g/ujm/3vvLui1nS1E0gifbvPr9zXrF/fzSwEtbpgqzy/Xr6slpDfSBah8a9Hwq
 doh3KCSGvMHlxrrSbC4QVVEyRSDN38xLOzulc32UJuNpARNLRuwlCoaINTZfJ6lZpYCf
 eKUZZpZCo5HerXjPpjUt1rRuTAXzWSIatfrR53hr5eej0EL5RQG7UvybxgMQXvC/9xoH
 L6GIt5veRINjF/8eyNnq+MmHLBOb+wTv90OGQhnnoJ0zEg3os/PZH1UaIlNPM3rbF55p
 lGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LKGM21omgiw4s8pLH3F/GfWnbD4CM5oKLWF8kPN/DI=;
 b=WodLDqw4d7OCOqH4xYSfgH0bi3HSULmXfabVYkBZ09EqHkmpssNeAPmueYF9ZuG8RD
 isEcg9rRYfDTjgYQogjj9+EXXfDLaiGTHN0IkSpo/Og4u74jMxh+qRuYt6SWk3H73cLT
 QoyhkKfXkpt0MNM5CapkHC8fZOvT3Bv7nbo1JgyNbybxXAzbU8UzPbLKlilQD5Uq1uIK
 PxRQgJ+2/GcmrhulWkeOdWn6rOINf3okSEgtBuW1jCIYH26ehcagmLQw6c9DwyMaCyGv
 PLdi9L/cpQnYgUhVEl9LUEfR6D3eqMA3NmQcs8Q/42ylVzyqKDKNSaJjqROoRJ73ks4F
 uDkg==
X-Gm-Message-State: AOAM532+nKxsi6Rbqq/DjsWmX6f73z0FS5oxBLAL3ARckXmQ/W2mynf/
 WDjApvZ2XzEPiNQLkb0JST6sGfy8BbMwvg==
X-Google-Smtp-Source: ABdhPJwIbZWWZyLPFGL7mGZEmGtzppdnIS/WVca8ew3qTrDOW8BvGVSNHsHxIq3k/Z4+D8KMqva7Lw==
X-Received: by 2002:a17:90b:360c:: with SMTP id
 ml12mr212479pjb.36.1610050537856; 
 Thu, 07 Jan 2021 12:15:37 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/47] tcg/aarch64: Use B not BL for tcg_out_goto_long
Date: Thu,  7 Jan 2021 10:14:27 -1000
Message-Id: <20210107201448.1152301-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
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


