Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52AB615F36
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 10:14:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9nh-0002Ne-O9; Wed, 02 Nov 2022 05:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq9nf-0002MI-1t
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:12:43 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq9nd-0000zJ-0e
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:12:42 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g24so15987715plq.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4yyyElQDSV8BnJ18BbBez/2Y1uNzC2NbopBlpNdfYzw=;
 b=jDhAMdDwTi/gc9PsN10r/u+oDqKZ19WDvtZMNR9am/L4T2pDlQPCHxYwTmRkMAKSYL
 s0+itnt6fUVs4VkRgpYWAIB115IJvz/JX4nXVrcNxzKPm0LLuIu5PNnCgRCLDV1DWzSq
 MAlI+3tfJpbfiXVutk9fHIvnt8nBK3CG8LBZmvl+FnQIkX/Dz/F4XDCmCg3InJBRdgja
 Vg8pHzuJRN8hP75IwJQ9sR0a0iRYG/txqhSdiMTFmfN/foTPCA0WUR4qtRjUUYq/Rs8T
 piACgJ2zWygQtdWGUDMI4Z122G19H9YqQIlANemvTNJRSXM9kktOSiuHZKr3INDL/n4v
 lYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4yyyElQDSV8BnJ18BbBez/2Y1uNzC2NbopBlpNdfYzw=;
 b=ZEXP1Br4mnk/0Cr8oQb+/YUitI7fBPVWSvsVtV8yINogHrHgUNqBI7TikMSauFEzMV
 PIQ5ZH4sbdTB/bvxcR/pQLjSfLu+lSNBYxxGlypfsqHU0TUKo8jyk0kZFNIR6Ro1Kex3
 b2tABH3cVnkipnKQZQ13pFzWXvN/LX7Pg8wqSHajwX2kMpjgovSr9Vql/qinWYOvCsOB
 7emdLgthQ3R1grIAShOAavT5DQtQh/uHvFtkytTCVq05zXKcZdM+DflsbFHpSTozt+Xb
 CRQUTdqsjZsAncnXeuqX4+QFJvU7jqwRpsJII3F7VIgkzIC1Zt3LNrH8jnN+jk1ril0/
 qb6Q==
X-Gm-Message-State: ACrzQf0sYS9AIl0N7XK1A0YAdkH0IC7mvkrPz3QmD4QrGhNi/RBklb55
 SG3aySsoKRhFXJCUW4MCeQ+BqByL3rFgmhDK
X-Google-Smtp-Source: AMsMyM77Sd0IyW5C3b0TMKUGUOjECZNwmlKSnwH7FKCjaRzq4TneR9YMc+uErA4AtIPLQRImFQpA+A==
X-Received: by 2002:a17:90a:e413:b0:213:c581:8634 with SMTP id
 hv19-20020a17090ae41300b00213c5818634mr19692784pjb.185.1667380359086; 
 Wed, 02 Nov 2022 02:12:39 -0700 (PDT)
Received: from stoup.. (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 w65-20020a628244000000b0053b723a74f7sm519261pfd.90.2022.11.02.02.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 02:12:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net,
 Andreas Gustafsson <gson@gson.org>
Subject: [PATCH] target/i386: Fix test for paging enabled
Date: Wed,  2 Nov 2022 20:12:32 +1100
Message-Id: <20221102091232.1092552-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If CR0.PG is unset, pg_mode will be zero, but that is not the
only condition for which pg_mode will be zero.  Restore the
correct test for paging enabled.

Fixes: 98281984a37 ("target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1269
Reported-by: Andreas Gustafsson <gson@gson.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index d51b5d7431..405a5d414a 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -553,12 +553,12 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
         break;
 
     default:
-        in.cr3 = env->cr[3];
-        in.mmu_idx = mmu_idx;
-        in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
-        in.pg_mode = get_pg_mode(env);
+        if (likely(env->cr[0] & CR0_PG_MASK)) {
+            in.cr3 = env->cr[3];
+            in.mmu_idx = mmu_idx;
+            in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
+            in.pg_mode = get_pg_mode(env);
 
-        if (likely(in.pg_mode)) {
             if (in.pg_mode & PG_MODE_LMA) {
                 /* test virtual address sign extension */
                 int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
-- 
2.34.1


