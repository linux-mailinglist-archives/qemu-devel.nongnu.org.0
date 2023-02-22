Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80E69FF79
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:29:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWE-0000MO-Ck; Wed, 22 Feb 2023 18:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWD-0000M4-64
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:25 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWB-0005IW-MK
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:24 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso10509420pjb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e0W3dfgscBZiAke8PH+I6rrjx86D3UgfDKHKsEqF660=;
 b=Ltpso0nmKJOGBFLs3z7zQaNOILBRKogOVRfKAlULMB7Q7ERElbNPPRMP4KtbrDHT8v
 O3iJs6PcvLGuZna5jEFkLXpot/Irnr+P6C8RvXCSifn9hP8Vutb1HV16nXu0CsgdQQlS
 vOqjs0nraxFsn/BSYFmg9yz9uDYrqhTgRDgAFBXXoTmdOiKNKR6gvgkIGrPruSGcAP18
 9kDaC/2pn/PpaGKpkKmWXp3EYYnUrpDs8wNFy+vhEWW8RL+VvTY5tJDXon8LJFDm7srd
 AojtGSJUN5sA37kzkNf78SbLqjf/k693+m/98NF5J4+vQVoiZdJgZOu1io76RMgeIHe5
 OCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0W3dfgscBZiAke8PH+I6rrjx86D3UgfDKHKsEqF660=;
 b=2TUV77F+c//dn8ImoGpLi9paO+g/KHB44DSP2e6uFZBPGxv+Qvamo3SQEooCWmu43h
 bBdyVbW/AzjH3yInP+6qieGuNGoqUJdfK9WWjiL3QUsuvzDJJ6dBrpA8p1SgUn5glZOu
 twbPZaff0hSKE5v68WCwgQuoR7XGB/QHk+A/vlX0rc15FVYpIXgMV1N7v6oLk4dsOZxd
 zZGe4S/xiQaoH7ZCeBaZEhD91pLYe937y50HACS/rWffTPJhH5iQagLFvucMpxvQLZrc
 VhUr0BKm+pPM1sJtGFrroWPqEPos1puPM9jGPiBe9DvApoZGIPI/JGYh6nGBy9Po3BDZ
 AjVQ==
X-Gm-Message-State: AO0yUKVpkxmLpBmg/EpwSC/pNYpP79lbNcZ0FLgVKFL+Mcti4dV9ZPn7
 l3r747Lvuk1HraJpUDuCJqhCpyU3Yefi46+SLvs=
X-Google-Smtp-Source: AK7set+YxZCrTWLP/CGM4CV7Us7Yd0qz4xEb7TBOzWZZU7j2CxAuQlKjTPruZB2mvzNg0k7NJDiE0w==
X-Received: by 2002:a17:90b:4b83:b0:236:7270:ddbf with SMTP id
 lr3-20020a17090b4b8300b002367270ddbfmr10681688pjb.21.1677108441872; 
 Wed, 22 Feb 2023 15:27:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/28] accel/tcg: Use more accurate max_insns for
 tb_overflow
Date: Wed, 22 Feb 2023 13:26:50 -1000
Message-Id: <20230222232715.15034-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
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

Write back the number of insns that we attempt to translate,
so that if we longjmp out we have a more accurate limit for
the next attempt.  This results in fewer restarts when some
limit is consumed by few instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fac1e8c465..62e8f28025 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -78,7 +78,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
-        db->num_insns++;
+        *max_insns = ++db->num_insns;
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-- 
2.34.1


