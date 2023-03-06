Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C290D6AB3DC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:45:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuh-0005pX-Ab; Sun, 05 Mar 2023 19:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyts-0004UT-6T
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:25 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytq-0006gN-8c
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so8576253plf.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xREb4bgbPINwX5RgnJpEwYA+di3Eou4XHpCG6/4nfXA=;
 b=UAT/c574aWGRapvevvPid3tyzRrFuw+6GVQ9MKdk6x9zm7xLrwU8KhqsXrZJgpiSYg
 lQejJGxcyUlTryg93XhLFLv/7tFCS64yCzlYDddX5CuWp3WIZGwjXhJC9rrsbbU/EJBF
 UYQ1fzCLsP/LQtVkwwQJXHSel9geTAj1yp9zD0D3Sg1iApFlYg2N5g8E6NcXJnfaRmO5
 1h09Jpf4qobhhzgdmvDu1+VHZtt5ieemh3xdTizINowvhgEnBxI9XnaMIJbC89avGxQx
 mLLI2kr1k+sEWG2COyI2dIkaPZsZMcSD8ksq6BHqjwz8abNZHzvKqV+pv1W4elcZUjHR
 N3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xREb4bgbPINwX5RgnJpEwYA+di3Eou4XHpCG6/4nfXA=;
 b=FjhIUgME3TLuHRiOBzQfPEb0uKdfvWv/swRT6+xjAm2nMKP6b4qGN3rgCzObCg+Ufa
 cBoLSDoTdBU0C1GUibhkmY8C5pwAXauWBGjZfKnq4Am9UBB4LGeFN5ESDKfB1sJKYenl
 3Sq4fKPGiN3B0Xoga/O/rgDAKCkqfas6vBFN/MEZZAiJfGXkBhYZK+DV61HbCwnPkoQ0
 dQ2xZt08CNhpqYPpbApDQ32+KsK6GQ13Ij21kToXowGCT1g9ec3SGj+YPbjcHs6Tv5yG
 yolOmj2KZJgNZeGQGeDOZIu+354CMgEZ8IJA29oQdt9JAHhavy+spfV0oUKzdX+/klkW
 D3Lg==
X-Gm-Message-State: AO0yUKWH3cNS/ITigVIv8wmpIgE5GiQ1jFe7O4UfDT6uwDGdhcZ3icHv
 2v5sa0z8Uo+y3HC1L8fTnJt1pTvYiAEfHjNGEjT/4g==
X-Google-Smtp-Source: AK7set/JTCcBjA/wFj/+Mw5ttYIGsCWtd7OIIvg1Nr5VqXziFHj45xpE7/iLmz19u8zBGuF7Ltmhrg==
X-Received: by 2002:a17:90b:3b51:b0:237:e1d2:c662 with SMTP id
 ot17-20020a17090b3b5100b00237e1d2c662mr9742055pjb.14.1678063220903; 
 Sun, 05 Mar 2023 16:40:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 28/84] target/arm: Drop tcg_temp_free from translator.h
Date: Sun,  5 Mar 2023 16:38:58 -0800
Message-Id: <20230306003954.1866998-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a5dd518903..20f3ca7aca 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -331,7 +331,6 @@ static inline void set_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* Clear bits within PSTATE.  */
@@ -344,7 +343,6 @@ static inline void clear_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* If the singlestep state is Active-not-pending, advance to Active-pending. */
-- 
2.34.1


