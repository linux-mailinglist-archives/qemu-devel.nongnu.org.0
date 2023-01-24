Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B87678C66
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kc-00016F-1s; Mon, 23 Jan 2023 19:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kZ-0000zP-Sd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:19 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kX-0001yR-9K
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id a18so559306plm.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mN9cAMzgJVhB9gjvwFWE29O2HsMxPZwiEF+AaYdvZqg=;
 b=iUOr2gxPtjgQ5rX94H68LLu0v0+vSNkJcOqIinvyBPsiQVY2TGTJJZ1QONkfMpnI1J
 cTfVhvUyyHE3c15c88dNtSOdYL6nApIrH3GWMf/F0i0WCD8FpUDW2ptEQWMGfQO2vwFn
 0JtN6VgmsoOh0W+Xr2cfKIejLyMZkk0z3iKYk8a7z2/ChR2qpDrAN/Vtra2WIjc5AuKw
 G51UZMHtZy7ieD0pTTxmoKyHaXbqSaldhuynbowLr5MX3DrKiP3QTzuTRxniYEzSwwis
 nr7sbtEHUiljenhaW8Mo5DJV0wDGskuxIUHv45DxHJd8TSH6lsdLsVyx8Ue9C/TlYpSJ
 gERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mN9cAMzgJVhB9gjvwFWE29O2HsMxPZwiEF+AaYdvZqg=;
 b=a35En8eH+K2YtLmrBSXo3lcPYQFcDNosf3P+zf1utUfI8FRWrC06tEtJiUjLeVJTkE
 0CmXtAGsub/W4KZGDUfnQvbxsY0/lhl919OY3UL/KNiSC4CpL/RG8HgpuE293BgRH+F4
 AEeThvaI8UgjM1cFeVfa1UrJ/FdBYgq+gkTl5dB2kN+1VKxka2sJi0MbvANSJgpGTRoP
 fD/CLMsLkBJmFJoF0df4PLFiGOzjRElI960gH+SIzve0vliLh3EqSUL6vtNo8YB/poXO
 kAe23D00nk8vddKOxe24N5nAkF+LK5oMhnuzMgXmdPnW4OtFT0JAo9GqUzUhYEYXUEm9
 rDHA==
X-Gm-Message-State: AFqh2ko4F60/zIkSHrpjPQpJsDDZF0/S5T3Z2engGGACnVVfLH8IWnWp
 lbvepA4TjlKt0N0Z+jybJYxWGgq4xxiX52Y7
X-Google-Smtp-Source: AMrXdXvbwhuX46VKmJaFxWIyy5KPppcXXM68AKXDjbJTgLaiMlKv1lgUcOkrhi4Sh8M9OSlJQiTbWQ==
X-Received: by 2002:a05:6a20:4295:b0:b8:9c66:cd64 with SMTP id
 o21-20020a056a20429500b000b89c66cd64mr34076018pzj.14.1674518475853; 
 Mon, 23 Jan 2023 16:01:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
Date: Mon, 23 Jan 2023 14:00:22 -1000
Message-Id: <20230124000027.3565716-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eaa47f6b62..3205339957 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -32,12 +32,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address,
-                               MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2854,12 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1


