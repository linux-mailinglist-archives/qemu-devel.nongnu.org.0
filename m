Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04DA63FFE5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymZ-0002dN-VR; Fri, 02 Dec 2022 00:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymY-0002cv-54
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:18 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymW-0003MU-Jl
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:17 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so7349081pjp.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AADJsK1S30bnJazg8/q+dVkIQuSQjRIPsLPoQjmDJDw=;
 b=HL8Dj16w0QVtaIdDTQOGwpSSYnzki2jRcguJIcMZBBcdIwIAzwO0+jNjh3bpfPE81R
 rdORhYoDQR08FVcAofYHriXp7l1D0IERl1htXoq/gbh2AKHmSX6sOiHUc3Da3Dtcoswh
 Uo85wtxv82wYcqepJRkOK5Sz/6VOx14qadEaHW7mNvAlloD6er6487Tytu2bfPKo50Vx
 +Azlnzo5YE/D7rLdotEVP1CFfJu752EwNDPGYbCkE3qO6OR/X2l25l4uClyHZBUD+aaT
 CSY+6J7J+HDrrBH3zZjLP3aTCUf1nWdsp/3tcRjQvhU/J7guUTyL6QLHACNUcJf/Nix0
 RO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AADJsK1S30bnJazg8/q+dVkIQuSQjRIPsLPoQjmDJDw=;
 b=QYmg6xUpsYKQkxqcuIrXJFrlSDW9jDsBb23oi9SFaSdXi874EQobqZ7BKSen+Kv1dg
 YMXuxcjKqjyEdXVTFSyGJJtQJ8PvdHRvfoSpdsOCLsUnLEvuKAUwhHRQ7IdbdTpCxtpF
 XYJIUz75bYd8+raL2e3cmcunbK11xY/60aybpnlexe5G7+kh3280GoZvqrxS8u7c14DS
 v3SgISBw6lW9krr7j2TkL2YxfWh6iGoxAPnjL0reLg1sFJJoBrqLBULihmcv1e8juoao
 nzdqrjnD/qaJR1zQVMxgO0TCYqe0FrqauiN2pMOYNCgINmnB4cyF20SsmR0/1q3xRJ3W
 GzEg==
X-Gm-Message-State: ANoB5plIH6ecLgg1AN+Ozc6dPmKfFe/pxUk9oxg4NLVkOC3GOVkmB47M
 eh8Q+9xDYDsgM612Pvh2GbDkLcNJk487t/tF
X-Google-Smtp-Source: AA0mqf7h5OYYEccM2Wd/uFy5xF19D38e0av+KSBsfm3UlHuoDkJJQKXOsYmxtB8Jj2VkMIjWg8eFrA==
X-Received: by 2002:a17:902:8548:b0:188:6300:57ad with SMTP id
 d8-20020a170902854800b00188630057admr57086391plo.7.1669959615265; 
 Thu, 01 Dec 2022 21:40:15 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/34] tcg: Simplify calls to temp_sync vs mem_coherent
Date: Thu,  1 Dec 2022 21:39:39 -0800
Message-Id: <20221202053958.223890-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The first thing that temp_sync does is check mem_coherent,
so there's no need for the caller to do so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f58013a5a..36a33a122c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4075,12 +4075,8 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
     if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        if (!itsl->mem_coherent) {
-            temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        }
-        if (!itsh->mem_coherent) {
-            temp_sync(s, itsh, s->reserved_regs, 0, 0);
-        }
+        temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        temp_sync(s, itsh, s->reserved_regs, 0, 0);
 #if HOST_BIG_ENDIAN
         TCGTemp *its = itsh;
 #else
-- 
2.34.1


