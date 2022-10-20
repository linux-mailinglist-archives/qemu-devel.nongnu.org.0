Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0D46065D7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:32:21 +0200 (CEST)
Received: from localhost ([::1]:42490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYSx-0000EN-4m
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:32:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYOr-000601-Nj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYx-0001Sp-NE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:23 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYm-00011E-AN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so2031891wmq.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M8RG143PJXPQVf539pt3PLUS07qWkCCSapBYXnZhIwQ=;
 b=Xa8Wnmn6eBqUQhWBKMQYmu5vIV9UI8KV6IexR8lc8AMwzzJDMyLzEl6oWc0inMobIc
 YvdfwEo86/GjXFAoLdnEmz3Ba3ybKMhHvWS2TOKELvL5zPSTOC1Csiye0+764ykc08+i
 2QfCKHKQTZvKI3+yJrx7MWTImxC9iOy+7+rgPZ8yvjfwJELi852wzVJMjHzXx/v6Z4cn
 iWjDQumvKv2+RHFnHv4XAdysT7mdzLmrSZjaQBMnFk2bI8Ltreme98g0lOND5WlrSqiX
 ky6XIePVv3SMAdEM4+yHYQfUWeWJCdoXriAOUijNCAgvsczMWRA8Ov2ZlMhTIAoVtFDd
 G4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8RG143PJXPQVf539pt3PLUS07qWkCCSapBYXnZhIwQ=;
 b=WBG/R1ENiqcFHEeBkEWVxNV4UhSvji2G4GHnqY7qTGhX8EmUUbceQDo3yyDbLLPCIE
 WyPqa2jqxD3UnVESJRQ69FLAbtfnhWcYDwblyVYwhNDw6sDZw4cWOPzpS3VG/L4T0BjF
 g1pPzCn+a8rxcB8pWLyS42ke3UKMH9FURb+fUdl2rNUq18nr6GKeVq3KGObTodJto35i
 Vg6Sj/QL++ePvpURV/wtsox1WGy2LAkQbTJP/1RhXrFmj7DjdS7rjSUfh5dh05wnQsme
 u/J7II9Izge9GVDMsGSSS44qHfW0U02vdC6CZzSjZZFtoqeLDVmMsU0DmGULgMemQ1c6
 X0lA==
X-Gm-Message-State: ACrzQf0zB5jsE91Ge1OI/wK7pWwnjAzcrIxsau7Ja1lTO7N12MebR0yP
 QI+y5t9pGsSgraHlflxo9nQIy2wmSmKjHg==
X-Google-Smtp-Source: AMsMyM5HXM+IpHbvK//lP6i2rgXUPmuop+rWHFwLRrWVfCeeqEM4D7JPW6fUtssMAYds3cAxuy6oHw==
X-Received: by 2002:a05:600c:214d:b0:3c7:1182:4874 with SMTP id
 v13-20020a05600c214d00b003c711824874mr1217256wml.4.1666268522933; 
 Thu, 20 Oct 2022 05:22:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] target/arm: Move be test for regime into
 S1TranslateResult
Date: Thu, 20 Oct 2022 13:21:33 +0100
Message-Id: <20221020122146.3177980-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8fa0088d98d..c58788ac693 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -19,6 +19,7 @@ typedef struct S1Translate {
     bool in_secure;
     bool in_debug;
     bool out_secure;
+    bool out_be;
     hwaddr out_phys;
 } S1Translate;
 
@@ -277,6 +278,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 
     ptw->out_secure = is_secure;
     ptw->out_phys = addr;
+    ptw->out_be = regime_translation_big_endian(env, ptw->in_mmu_idx);
     return true;
 }
 
@@ -296,7 +298,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     addr = ptw->out_phys;
     attrs.secure = ptw->out_secure;
     as = arm_addressspace(cs, attrs);
-    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
+    if (ptw->out_be) {
         data = address_space_ldl_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldl_le(as, addr, attrs, &result);
@@ -324,7 +326,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     addr = ptw->out_phys;
     attrs.secure = ptw->out_secure;
     as = arm_addressspace(cs, attrs);
-    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
+    if (ptw->out_be) {
         data = address_space_ldq_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldq_le(as, addr, attrs, &result);
-- 
2.25.1


