Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A3D4882A6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:59:34 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66i2-0001wZ-33
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:04:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-0005hH-AO
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:05 -0500
Received: from [2607:f8b0:4864:20::102c] (port=41628
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LS-00047P-Tv
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:56 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so8976310pjp.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y8sDBwJK1V/FhZ8YD28+6vGDo+RSEHHSakaI/hkSLk4=;
 b=Xwa2EcwPFc9kSL5RT4ODi22Ne/isCDG/9zDT2bXsJsj2zTAmn24FCik8D+JnrsJyNC
 +4OLykoDqzIHEpvuQGAO+fqGHEv+xYH84lGQ39B8D6QCc6UFJSoW72tXHLWy1HOZcl2u
 UPKHn8Tt/ymtPLdnY8L33BuxPJIBHJYL66JpSSk2WBJeglXMlEUFcr9I1enkSVJjaYoS
 Q/8JaNYfyhryWbaOnICf6iKnGI3CqrCZ4HMsB47nsHIq0RCRYh0sA6TKc+zOT9pEwuy9
 j9qIMIuCm8fNhM8pBZRqfN1h7gEpsYzwRKzzK8qqhh8/TuVHGFdMdkDp3b3X9YA+z4FW
 +mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8sDBwJK1V/FhZ8YD28+6vGDo+RSEHHSakaI/hkSLk4=;
 b=J9UXyOo4MdzzbUmAETv34SwEXm6dnbL0If86ISkW4FF+VyM9EW0QmQXCu68hNRHcVz
 oNoVvmsoK64dYGzMiMolsqD0H7BiJiNletAg5vtCbFxmACABAUQ2QATXPNp8Sxh+EZt7
 o1oOH1vIH6UemfIUfgCV5JCVu5ehUQh6g4AaGWGUyjwn/q8zFxa31gYN+tPjLMcfQPUS
 W5e1Rt3vWfO5BXrCyWKEhvSkRNKPWpJsFiMey5w4hlKDhYwKZrR63ooLWwsXhQCYWWB/
 VEztV2WBoy/GqUk8vvoNAGIPCku0BUhkOCt0HajKSUlBcmXFCllqqVQ1FM98U4v2Tmvq
 hr+w==
X-Gm-Message-State: AOAM531mlGoJT+jKmAzcyoHwOW2lo9nL3njcm4+pli0KnkFkJEeyfYOM
 phL/IUU7opmXa7VRvtwn4MPdndKZxxKJ2g==
X-Google-Smtp-Source: ABdhPJyDrNafMSd0FSB13kIRGeBBd/7uvMcgOuYh0yTMxkf9fvbz4/iQP6TU/VJjJXfBb6aRAdmYFg==
X-Received: by 2002:a17:90b:1651:: with SMTP id
 il17mr19575999pjb.190.1641623813755; 
 Fri, 07 Jan 2022 22:36:53 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] tcg/mips: Unify TCG_GUEST_BASE_REG tests
Date: Fri,  7 Jan 2022 22:36:37 -0800
Message-Id: <20220108063644.478043-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In tcg_out_qemu_ld/st, we already check for guest_base matching int16_t.
Mirror that when setting up TCG_GUEST_BASE_REG in the prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 1bfe6aea0e..46616784f8 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2677,7 +2677,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     }
 
 #ifndef CONFIG_SOFTMMU
-    if (guest_base) {
+    if (guest_base != (int16_t)guest_base) {
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
-- 
2.25.1


