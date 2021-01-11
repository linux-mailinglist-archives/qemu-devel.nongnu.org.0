Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E29F2F1F60
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:31:01 +0100 (CET)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2u4-0006G5-7h
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ry-0006Cr-Mh
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:58 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rr-0006T3-8L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id e2so318725plt.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3EgLd6X/0agUdbULg+xeQ+A6feCfdo22IS1O1cQHk+s=;
 b=W/912atkVSpxgETV5g5kzwGkqmDJ/rSYF0QyMHjRD0ee8kXwfitHLXkATfjMCrK7/f
 qw7oc8mZ4W7E8qnJy/tAG+oSV9DPrNvznHGeGjSnz+KcnOj0uFnWX96l4J4mb6nJRLnB
 njQ+f3CzXnlzmSJuDAH4XjOmUtL8bZMYTdWRaCUoKgt+o1xjZQUjFWfrF1MJhpJInA67
 miC/Ax/gkMJN2KI3iPAIxvW+B86EjYW9Zf/3zQdfTismeMQU/uLnbZTyBmTzv3Plcvth
 jsuc1WtpWBIq/J7u3RmPky1O27F1dCXKj2d6veN7aBVEGfV9WgZCsVAfpHJ2jKBlg3h8
 Z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EgLd6X/0agUdbULg+xeQ+A6feCfdo22IS1O1cQHk+s=;
 b=hsXVHZ7qXIYOQp4vHInFjgi880JBkQw1CCPfTf0BrbAaPmWMpgQeUSKTKdoIg6NOPw
 7b8vc7TpejD2WrMSdHuhHbQz07eVPHyUuanNZ15YD26vWLbo7e1kibpjyuqgWXKue/nh
 ZC6h3IhLJyZnedq7UrEXWwyF03ykC03vdakzobDisbwnn0JhPYKmRo0wVA+iVanpNZZb
 U0uIbOQ993y/J/98nB6UMfj4wqGyx8G2RIeh731mSozdO/q9jfZl0Cmb8wjSeETjlCAm
 axBWt73nRzmXfG/RAPYOT2vXi9TZz6Ty7fkYq+3zEoY6n4z+5W2q0j2mBGTNLxSc9m2X
 gtiA==
X-Gm-Message-State: AOAM533GzzPgmKnphoj4OiZhHkNOAHwLfNOczWFUpjgHrDlqMLV9qB4H
 8N1sM6jfyKuoE3JvJqK8ZH4L40dz8WgZvw==
X-Google-Smtp-Source: ABdhPJyWq9mCDaK9z3RNY9hnLtwzlX5O8/z70RXQvNYv8vFwbUPGjqoWOKf98QXA5cjxzj6aUzqf5w==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr317770pjb.48.1610391706203; 
 Mon, 11 Jan 2021 11:01:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/30] target/arm: Enforce alignment for RFE
Date: Mon, 11 Jan 2021 09:01:00 -1000
Message-Id: <20210111190113.303726-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dbe74e2c34..a0d543ec1f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8304,10 +8304,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1


