Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BF3B88B0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:47:23 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfF4-00018l-Py
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0r-0005Rm-UN
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0j-00020K-Ge
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso4331155pjx.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7hAexeBQ5Ar+tSUN9C4Tdw7ktlK4SgTVxbaVoJ2i0s=;
 b=ihCziMj/HTV/Xl6uB6kQNq0V72HiCYO8CxkfPy453TKNlddisyHNuLIwOvXTVDgztH
 JYwznkd+mXm2SuWa3IBZSJN84BIKzIsCRNgskVb8IvYzkoUTI2O+aja5rj+GFmfN6j5W
 etHACZr+JOZBnprXC1w3Dy+Gj5x1pqPUTLT4tf7QuwHs5+GDXBWiMcISv6BOiJryMx42
 zKb1vo+OelWK9tOuAMOxmuNndBB6YBsr3vEJkSFTgeRgLXgZu6fwVcjZdDDZrYBLXgfK
 PYUjdogpDSPHDAaZvu5A8Vz1inNRtAkBb9uozZ6AlGmf44zugTyB0WiJHEtGZ7D29I1p
 ByVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7hAexeBQ5Ar+tSUN9C4Tdw7ktlK4SgTVxbaVoJ2i0s=;
 b=JAPi+JPiEdOeeB1kGAkYYJ0zYanxiJa5I6x1s8DJ70Xd2BvVz9gEX//+OqOKg5pYl6
 05mG0Rxje7pLfCdcfED41X0sRRq3csh/cup8Pdh/8xy2bPDZj/QMPQ5/RhHxn3lirIEV
 NzW9HD8jWjbRKeyoDdKxMehyZwQLEUwOIpL9VGofVNr/aIvj0NpvrTxxV/wAMYafmJQp
 ZONAcyY37PJMNXwplN3G9EjP7y4hDqLlfiXMZnv7PyBbrAE8I+HtbK6xIQyyh4VGTu2i
 GdmqhPCd3VQIbUtqD/n2Bt9K8te7khtLijpzkph0fNl+PP6Gn8jH7w9x+NEfeuy2uou1
 04Nw==
X-Gm-Message-State: AOAM532iCaLGAjHj9cQ9NTPcMYB79vgKY/10ap4b5hpMcWxBPtrkuOca
 FJCzFRn7cnvNJl7i/Q8o8rAkwwXAQuyD4w==
X-Google-Smtp-Source: ABdhPJyNWY98yaewYRf4o2IwqALuHbX3LfljY7P37SQZRvJ13bP2OwxEgKzJgRNuiJMP8Z6wItJsRw==
X-Received: by 2002:a17:90b:3697:: with SMTP id
 mj23mr5658760pjb.118.1625077952128; 
 Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/28] target/arm: Use translator_use_goto_tb for aarch32
Date: Wed, 30 Jun 2021 11:32:05 -0700
Message-Id: <20210630183226.3290849-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8cd31feeaa..87c3c09df5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2509,16 +2509,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           ((s->base.pc_next - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_ptr(void)
 {
     tcg_gen_lookup_and_goto_ptr();
@@ -2530,7 +2520,7 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
-    if (use_goto_tb(s, dest)) {
+    if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


