Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FBC4838E7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:52:41 +0100 (CET)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4WC0-0005Ac-8f
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:52:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7c-0004Jt-L9; Mon, 03 Jan 2022 17:48:08 -0500
Received: from [2607:f8b0:4864:20::733] (port=44760
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7b-0001HH-3D; Mon, 03 Jan 2022 17:48:08 -0500
Received: by mail-qk1-x733.google.com with SMTP id l11so33110585qke.11;
 Mon, 03 Jan 2022 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mEJ52DjcGZ77H9RLGxNugn3Xq43tGiUJ7ZTvhWHmtPQ=;
 b=EVdcMirjf6nhw4j17PZMBvHACfsJ4izafsTJkTdycZ1VpD+ioSYKWGsnn5+P2Akrrr
 Gmo/Fvc+pRvnGx5pyVXZuxvnSgbgRReGbbk5fCNwhgSeQr4s7UsnMv4Wko8bx/almgnJ
 cq5LA/rFJasxaVnN+UWphrcs2Rusf4yHHjPG75popbHQ36XXAbMsrbeOWUEbNIxHmrPE
 Ti0ZcNIWT2wRKjvIqToXO0+Q5OB1gwIHr/Tk6ZkgDtQmwxWX/Yq9Fs4C+R4epOXJmZAK
 CTbIrbmxS+scIVWZ5GmUmSl6ydXgeKmIWyRoYxCinORrbw9QiqYXgkMNijOqNjEmyHn4
 tHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mEJ52DjcGZ77H9RLGxNugn3Xq43tGiUJ7ZTvhWHmtPQ=;
 b=6cHPiIOyF5E3dVqOpVzA27rHML/DvDYDxFFoPKtuy3W5g6AfF8Ae/XCMVJPb1a9+zH
 WIqXdKnIAiHGb8/d/POytC7hmO68uQPACJpPNWlSIoosg6f2cOuJKNWiALVP52AXFIJU
 PnFnzPoBGFG9Hgz2n86HiSLgXl7Ka7C2OpSXXQPAOmLmTQfBFofYlydZ+DPWgIUZPSwD
 SrNzBGWk4hBPKoKPkun2sYG8cqT4m1ael9DmH+hT7Nn9KIXzCUeLH+xE2ih/cgyKcF5m
 wLhev3v/tDS4VCZ8B8lEMwCMFJMJpw6W7I7+Lj0o+fuyBdidvd+5eJsFxzMcIa4pD2uP
 ZudA==
X-Gm-Message-State: AOAM530fg4m+QjRpb1vY7UreJprlG/d6Mlz/2XFeuqW63+Ai3hmOigEZ
 NcriSYkEja+b0CkE0GTF0DoeiO5d72o=
X-Google-Smtp-Source: ABdhPJwd6Z5nAInxgg64/9OMlS6aZsOfpAVOsFlz7fsZUbzhg1xbfaOUhAe2wwVQgWoCt/mMNxBRTQ==
X-Received: by 2002:a05:620a:3710:: with SMTP id
 de16mr34937020qkb.247.1641250085954; 
 Mon, 03 Jan 2022 14:48:05 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id t123sm22917176qkb.135.2022.01.03.14.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:48:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] target/ppc: do not call hreg_compute_hflags() in
 helper_store_mmcr0()
Date: Mon,  3 Jan 2022 19:47:46 -0300
Message-Id: <20220103224746.167831-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103224746.167831-1-danielhb413@gmail.com>
References: <20220103224746.167831-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MMCR0 writes will change only MMCR0 bits which are used to calculate
HFLAGS_PMCC0, HFLAGS_PMCC1 and HFLAGS_INSN_CNT hflags. No other machine
register will be changed during this operation. This means that
hreg_compute_hflags() is overkill for what we need to do.

pmu_update_summaries() is already updating HFLAGS_INSN_CNT without
calling hreg_compure_hflags(). Let's do the same for the other 2 MMCR0
hflags.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 73713ca2a3..236e8e66e9 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -224,12 +224,17 @@ static void pmu_update_overflow_timers(CPUPPCState *env)
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
+    bool hflags_pmcc0 = (value & MMCR0_PMCC0) != 0;
+    bool hflags_pmcc1 = (value & MMCR0_PMCC1) != 0;
+
     pmu_update_cycles(env);
 
     env->spr[SPR_POWER_MMCR0] = value;
 
     /* MMCR0 writes can change HFLAGS_PMCC[01] and HFLAGS_INSN_CNT */
-    hreg_compute_hflags(env);
+    env->hflags = deposit32(env->hflags, HFLAGS_PMCC0, 1, hflags_pmcc0);
+    env->hflags = deposit32(env->hflags, HFLAGS_PMCC1, 1, hflags_pmcc1);
+
     pmu_update_summaries(env);
 
     /* Update cycle overflow timers with the current MMCR0 state */
-- 
2.33.1


