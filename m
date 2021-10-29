Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7B43F6D3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:52:07 +0200 (CEST)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKoA-0007p5-E1
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdn-0002Zs-TX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdh-0000NQ-OY
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id gn3so6377245pjb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94vBg5DwrKjzYyc2SPZ2xHl0Qntly4eUJLdtjM2QYhE=;
 b=EFvuCQf7bwDhPujdAHJj7zLgu03KSX9ztFCbmuYqc+PstihIU6GR5uZHN9FmGxg3Wi
 HntpobfWaQOp4c02bDDKNz4PIawuAECmu+vMOuTd/PLvTZPsXDkzt9qX3iZmcTqJSJS0
 czRqeW/X5BrpgDfwS/uDF2PXO7l97ZMO6dfanWd51QYt3BN7o78ab1u7fxxVNpdwnwXP
 LW7bmA3c2VBGeTESBO6uXBwznjIg+JzM1Gw11eBfJeCq7VpiEnE3Ak8xQjo0/wI9mUyA
 ISS1WHg+4Sr8vcb6aoSAB4DKfLBsySVWhd3IYySx7H0LZ0g0YO7y3vNy9RKpNdAnwdvb
 40VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94vBg5DwrKjzYyc2SPZ2xHl0Qntly4eUJLdtjM2QYhE=;
 b=dO2dqPg+oq9MaGPYuo8w1eC+SjXs8av7rbF2nTyGM5wu6Y96v5gB7Oyg0RuM3QGeP0
 DjDKUWRNovmVsBT4LzaJqmigW+BZhdKygPquadCmmbdQAdfu04K7LENYN6U0VjPQ6E7P
 g1clizZOjx+LYib6Q9xkT7aFhY03SVX+ZKNiAKDkFQG0+EyNVUnqXdvCjIhgVxoJJusn
 hwXdrMNNR/mQIEWlh/YL0+cUD+Cd/gZbDoCKodAPgKPtzTsZ2IuN3uLKk4S9XPUiP43q
 z3LbQIXbs9ZMMjXXLxITiwkog+hf0h51bpfYU40u4MJMVlXAcP88+7HR4AbDHAqOxKf4
 ZyEw==
X-Gm-Message-State: AOAM5307k/kKHpcjZgSvv0ac2851OQU/BEwfOriw7wGrLCwTG6+fE4H/
 4K/KQR38ay3D1+EUXUZYx4YE8oieZd7Bmw==
X-Google-Smtp-Source: ABdhPJw4nPxjheBg7Q1lm83MmLIbuGvcx+GUmYOUbrisCZ7scK94YzMChGswFMvwGo8I6Kwp09pORA==
X-Received: by 2002:a17:90b:4f88:: with SMTP id
 qe8mr17311357pjb.51.1635482231440; 
 Thu, 28 Oct 2021 21:37:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 50/60] tcg/optimize: Use fold_xi_to_x for mul
Date: Thu, 28 Oct 2021 21:33:19 -0700
Message-Id: <20211029043329.1518029-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the identity function for low-part multiply.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 6d795954f2..907049fb06 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1461,7 +1461,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xi_to_i(ctx, op, 0)) {
+        fold_xi_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 1)) {
         return true;
     }
     return false;
-- 
2.25.1


