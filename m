Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11059C44B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:41:41 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAUe-0004Bo-E3
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lo-0000KL-6y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LX-0000jk-K2
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id bf22so11327735pjb.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=b1YKmTdBto+hHkmTMtKDsXucA8L6l9ByKCghI8Y/k9s=;
 b=IhVOKYk4Y+Hw+0a6QIxuejfY7D7alY1/bXIydPEhrliNVEn4+4FiW8Ad9otuFa7QNV
 4HpzXaG6CZusyKdHIMtlz0pfUrexULtt1QB4wfjWnMxxoK2L+bbGQ2xCqsvNJ7LLuNfe
 ds3BWeCxzmjAhdJWPna+H2YbtWsRf4nO+9pZUNiYVqC1CNlvIuIOJgBmG/QTk1cAQT20
 fhdZ9yP2/L0VIoimrAnqtA2L2kieFjswSzxIMDumeeRe4Y4RaNdauf9MElJUPbXw5+2r
 WxgXR23qNJ+X47AhmaUvZ6IMSgC/wzV4lkFWejGIH85HRXfe/rSeTRJnTclu+fPFqtfU
 6hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=b1YKmTdBto+hHkmTMtKDsXucA8L6l9ByKCghI8Y/k9s=;
 b=fEe3LsiXJpMZtPF0KYykYiKfCkbDWTzPcBO1/5/8Pvln4970tU4jHnMFUgYzvMi9Ey
 qHSotJVtSpBnzMmLTRaxy6AtMwUKOsG03B9HlifKWMxKF/WZyW/TNv/PnimHiYul9bm8
 AIfOzGDafKflGjIXMxTpqwXg0QwjkpusvDkR2zlpM0GgmnLfcDhV3T926HLa1+jrunDc
 2/gApnSbpDo4MkwqXoGtrlPLLeqjQlJZhWjgVGQe9ViOA6o5RL6n1DC+NaEIoZtvubcC
 N3B37pMAmdVPiewKk58ow0A+fod4gzxnpkDXKgrwP3to17E5iXjAKCRTOXVRIgDtpj8w
 VSAg==
X-Gm-Message-State: ACgBeo21+mN2/AiAXqAG8AlbyciCnr8l93S5Ic62Q/qnVePqmCXYG9hQ
 YQRS6H2udFSSu0qaeGFu7USYu+vMP3yhgg==
X-Google-Smtp-Source: AA6agR4YnL9GG2IsOP6dpQ+0FzB45mBUX/QtkRnJvj4hp45wtu+UewRrEy2nuALeJDG7tS1XgtbJDw==
X-Received: by 2002:a17:90a:d585:b0:1f4:f9a5:22a9 with SMTP id
 v5-20020a17090ad58500b001f4f9a522a9mr29733222pju.49.1661182090817; 
 Mon, 22 Aug 2022 08:28:10 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 32/66] target/arm: Remove env argument from
 combined_attrs_fwb
Date: Mon, 22 Aug 2022 08:27:07 -0700
Message-Id: <20220822152741.1617527-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 680139b478..5c6e5eea88 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2171,8 +2171,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     switch (s2.attrs) {
     case 7:
@@ -2245,7 +2244,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
 
     /* Combine memory type and cacheability attributes */
     if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
+        ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
         ret.attrs = combined_attrs_nofwb(env, s1, s2);
     }
-- 
2.34.1


