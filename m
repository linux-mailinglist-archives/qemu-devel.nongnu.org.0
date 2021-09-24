Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCB417990
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:17:43 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTopS-0000yC-CJ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY6-0002lP-CB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:46 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXz-0006zu-Pv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:45 -0400
Received: by mail-qk1-x72a.google.com with SMTP id b65so28387831qkc.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxfPZ7H57dcm7rNQ+f9pWEPpiqUmhBqRaotBBFRVjb0=;
 b=vM90U61z9hv+oDAyRUPgTyDwsHvXpznhYBmtvW5yH+XsViEzxYZsj536RuJyNbWYl/
 ods1E4qeFHIJtFTo/G16OA7A7SZBdhpAzbpKbd3VdexDhrNhTHYObaiGcifYJBfdj0NP
 Om0Zo2Nk5iUUoyfYEoDRO/Po6G1Qsp3i6QdPZyE8FeER6o3RGu+AyTP/0R6t8JhKGGtF
 EExfsOVAPx+OInb8rCUPpNwyo8qOou6nX0grkkFzREXBjlMeVPSDHwuyqq25CFay96b1
 63+GtoTTz1jqRZg9fg/iZIQEavbLQwRFDBIr3vmNiLYDf3s4UCxSSEqVRII6Gg7dF8H0
 dKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxfPZ7H57dcm7rNQ+f9pWEPpiqUmhBqRaotBBFRVjb0=;
 b=kKvR0dQQaU7Efrd4B/S7BIFbeq7zInj0aIZDRhQPGbKgPrOYs0B9BTDLe9nRZ/PgGL
 KvHxH+sXLCakFarWwcYGxC3J8ZdvQgFM22Lv2k1IbARlvNIrGz4qtWMfYuacPoX80pF3
 elcwPieM2cuZeDVOHL9UcVnY0EXKKvajgLgyOOfDN1DfFMBVC9Xh+OXoXY26KG30Y9cN
 n6XaEpPqt+0jPKkSF5XG0/Z+LabpvLlMTNRq/6qhZhk8oTJi8PJBGgEiOnvha20sMqUv
 Wec2+t/EVytIPdqo+ioUxBioiTsR9rQWa+T14nDBBJ1vGUBmOaISbnbbYr0cDVSdy6u8
 K0Uw==
X-Gm-Message-State: AOAM533VDkIRAFwwEHUGHBqlVNVrNnH4+0vmapjr6jYu/XUr9Jw/B5So
 DIzDTvhPpPmG4isQWzjRzchyzA7daIMTqw==
X-Google-Smtp-Source: ABdhPJzIWlj1V9xR4tyXRO/kJH/wEJ8dznA+4ojwBYbrB+wDhU4dLVct98MWwcn99ZWGpLpXgN5DZA==
X-Received: by 2002:a37:a904:: with SMTP id s4mr1620915qke.60.1632502778459;
 Fri, 24 Sep 2021 09:59:38 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/27] linux-user/mips: Tidy install_sigtramp
Date: Fri, 24 Sep 2021 12:59:13 -0400
Message-Id: <20210924165926.752809-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value is constant 0, and unused as well -- change to void.
Drop inline marker.  Change tramp type to uint32_t* for clarity.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index d174b3453c..64072779b9 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -87,10 +87,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(uint32_t *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -100,7 +98,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
-- 
2.25.1


