Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155CE39A546
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:04:54 +0200 (CEST)
Received: from localhost ([::1]:35512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopq0-0000yG-Ua
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkf-0008Ow-IK
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkb-0006sz-Mc
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so1345793wri.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1HGwW18TMom6V5l1tSNExxNgCY2lniDgLOtuVE6oASQ=;
 b=BbpPOUxVlrgQ+aHjxZlWfiQxnjVFN01Nd3KWpSmRUbatZJU3QuyGc4sjVCW7gkMUmI
 1abfIhaC8xGiLSLQjzM1e54PRVlR4+NGSdGqHWiKEjXE9dNX9u4rHLMsjVQ8F2HSePcy
 bTJz7KJuFpOvRtGk/ptIlj4fDzUS9e80/k92WRSgVVWKj0wEzO5tTo6pVoOTmqZNYU/t
 YTcmQmao9UxlvkLNzw5Bo+YGtOieVUuoyCxJzXf6x1Hd6goKlrwoAOuxgOAF2/OQVU8u
 TDYiBpX2wFDc0M1t0rxge3xP57F7Q35Rk8NsAXqg27o79CoIxgtNInoaOut0EoEEye0W
 LglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HGwW18TMom6V5l1tSNExxNgCY2lniDgLOtuVE6oASQ=;
 b=pfKq5Kd/INcq1JskvkL9mjkINtaVwn7L9XE5knYx8Wi0lROKHDfnFqupQw98x9RAyQ
 zNxpIxX1SuqVcCJpekW6lB1CSiExuV7ZbnYdLLX3WqECAfyN5+dD9p5RVJSWcl90HUcM
 dPPnV27vfgIcE5OKmtJJ7FuAOlSa//EPRiBGhCIW9qo23MAaqeoEUxDrYtLt/ZoJuKwV
 9XdFLcJaMRESyNh90bzSHVb/N07NJXWXSILwrrOZRhb6NqgIo+pJlCelnLShkyzuoa7j
 Wcoce6LtZqc8n0Zh/H89THAV55fqNdobeT1WH+W7VXQyvnVDpDMJR1hGWyemboTAF7gC
 dUKA==
X-Gm-Message-State: AOAM530DeYVXsqQUsC4WSym5SmXhKOzks+0pBFkdIbIseF/de/Ou/Q83
 sWM4gGG3uut1ntEUUK6c6xoqBdng4QHNkIzE
X-Google-Smtp-Source: ABdhPJwNUFKY7fDBbIrPO7+lJSXkn0lC18G3FP7yP3Bd7jij6ijlmfIOtPlOj7VFIFn0N/xNanaetg==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr682702wrv.100.1622735956096;
 Thu, 03 Jun 2021 08:59:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/45] target/arm: fold do_raise_exception into raise_exception
Date: Thu,  3 Jun 2021 16:58:32 +0100
Message-Id: <20210603155904.26021-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jamie Iles <jamie@nuviainc.com>

Now that there are no other users of do_raise_exception, fold it into
raise_exception.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 1a95972bcc5..4132f5e430f 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -27,8 +27,8 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-static CPUState *do_raise_exception(CPUARMState *env, uint32_t excp,
-                                    uint32_t syndrome, uint32_t target_el)
+void raise_exception(CPUARMState *env, uint32_t excp,
+                     uint32_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -49,14 +49,6 @@ static CPUState *do_raise_exception(CPUARMState *env, uint32_t excp,
     cs->exception_index = excp;
     env->exception.syndrome = syndrome;
     env->exception.target_el = target_el;
-
-    return cs;
-}
-
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
-{
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
     cpu_loop_exit(cs);
 }
 
-- 
2.20.1


