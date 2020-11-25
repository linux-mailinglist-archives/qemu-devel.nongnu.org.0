Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8A2C37F0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:14:47 +0100 (CET)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khmCc-0006qH-TL
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm50-0004pX-Jl
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:54 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4z-00063A-5w
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:54 -0500
Received: by mail-pl1-x642.google.com with SMTP id s2so447045plr.9
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usLpa97UISiu51HArLZeAu/Edm945VN7Y5GLMB1hA7U=;
 b=ztB3+QrxyaDLIZWsrVjXeWUXH/7rMuNkbGaSlsbQKy3nYfu8gthCaloTptR+zarihh
 9JwfEjDS8C+GHluSDCJ+DJtTCi/WgECQUcwEXGXQ41eQKfQYhSKiM9VmQezcgJoB4D4K
 rT3hxHGfWaXLdSnO23V8PdwfU5kSxZ2yR6SWzDuefSzBHHP3b2ZYHnrb+r+f66G+X/nT
 QIsBzeXwkifvzucacKP7G9qxwhlvsdyT71r4R4O6oYMRVcZKoONw4lNXleVeWkr2hHRj
 JxB5Ha6UCG15YMiwZByktriZhguj9+HqV8P2ZOWhMqVsMZUadyNqKeDb8u669UYedCUJ
 EdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usLpa97UISiu51HArLZeAu/Edm945VN7Y5GLMB1hA7U=;
 b=hqOTsi8zCgUiCGtesqvAf8zd3+Ygu15hZzXxzSN3wT5HTMBdTmEtpfyCvdk9OFZu+/
 Tku4FdKlglMNt+iNtk+cc/G8vIBWtG51xYUn7Mq0ty4aSmrdGeeckUm08eEV4N1Db5AL
 tmr07wiKmzMv0K9xzabN7MVzda3S4SDmGJLlvxs7IsxO6A+DeGRukHHnIh771HpMExVm
 SkwUX/mvxxSdOZGRj6C3RtJFs/kydEDpR4Hdyq438a/IE1nMxf6M02EQbmlldGwhmC/V
 aNICobdnFEX6TdOtqv+Y/bbGOBbQC2xp9wE+ddZDB/Q8/GOvcXb1+Y38AvlMNs+FLNNc
 w87Q==
X-Gm-Message-State: AOAM533WGhKNvYS4DqBF20HXiApa+zD9+KiMqCFNoXCmORrAM6gm473p
 pKZBb+EjiuaM38EaweF0J8OwTi9j0boGQw==
X-Google-Smtp-Source: ABdhPJybDGu6JRpDWqHvj+5EKKghhilm+95AGUk6b++q/gP9p+vGWxW6qmklBF6IbZL5Gq51klQX0w==
X-Received: by 2002:a17:902:ac81:b029:da:f96:1b47 with SMTP id
 h1-20020a170902ac81b02900da0f961b47mr669831plr.78.1606277211568; 
 Tue, 24 Nov 2020 20:06:51 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/arm: Enforce alignment for SRS
Date: Tue, 24 Nov 2020 20:06:36 -0800
Message-Id: <20201125040642.2339476-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4406f6a67c..b1f43bfb8f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5124,11 +5124,13 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1


