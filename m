Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB111483741
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:57:15 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SWA-00061e-VV
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSz-0007WW-CE; Mon, 03 Jan 2022 13:53:57 -0500
Received: from [2607:f8b0:4864:20::f35] (port=43732
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSx-0006HY-Si; Mon, 03 Jan 2022 13:53:57 -0500
Received: by mail-qv1-xf35.google.com with SMTP id fq10so31801524qvb.10;
 Mon, 03 Jan 2022 10:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V3YTg3Mut9jhi/NXD0xJNr/90t1QA5jizZEVU//o/q4=;
 b=ejxFk90e00DOtcUcy4eJqGOULioc89fBxifgcmxi2LqcOjF7XfG4RUa6Vt3hA30V95
 /gdlWM6yDpH3dduuydtVCMoRHMoqZQW1wOCbbKuGKsbYDMkbUf1oQeyuEj0LbOFrzd1Z
 iY0c1C/AlvBga1tJZPwdKbSdQ/01YuFTJOxQfy6NLkdnpVXF5ivhVQ9KUej3+xy8og1h
 rl/6deZsRlbKhq9gltXcu5uK4RoVWy+EaJnD/RqBGxwqvILNrZvREaGZ0OXqvfo3d3uS
 Ba0TwJOcBQAFkBlgRltWgSZeVtBrk/Ad4i6y1ko01yR1o6UhiZzxtEWsLUlrtkxH1NHf
 jhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V3YTg3Mut9jhi/NXD0xJNr/90t1QA5jizZEVU//o/q4=;
 b=qxMMqYdQMRR6v3GQCiokd0i57u5y4oxRkkrJJvOevzuSdU+ANptfEA8rAz1vPIAud9
 9JXmTFiFuaJFHmrx2NywEwnbp2JJ6k07osklFNNNu7hT5++DX+G7G+PAcw0af+RlErN0
 wNCnvmjpM4c7DYWgRzRWURpES+h4lWjqV82CceQ+cil033zoAbAw/lt/ziSITBuosjCF
 E82ZHYM7qZqHMmGOCZG9Uw83tPrJo3URLUguR6egscX7DsKbJVv+3JiV3wdTXi27mPpH
 yVUzj+Wa/uJVQSCCCCiox4VSU0N7L8Sq59VxzMzR/tP30XK2pgaHNAnsSn7fGqSJ6/in
 CUTg==
X-Gm-Message-State: AOAM531xVI/cL+xGCtUhfvgfvH53Q9AoPEUTl7zmaAu1Eq5u3EfFsYjc
 HE8YdZ0CmYz8s2uTlXCCkaqa2Tp0mjM=
X-Google-Smtp-Source: ABdhPJyzCZ6gSaj+KXPjAh2TreHqVLE6khWrmX8HQSgZomMEIR1JeHH8gqnoJwYX87+c2ECSbDIxHQ==
X-Received: by 2002:a05:6214:c82:: with SMTP id
 r2mr12350244qvr.51.1641236034631; 
 Mon, 03 Jan 2022 10:53:54 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id w9sm29002867qko.71.2022.01.03.10.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 10:53:54 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/ppc: do not call hreg_compute_hflags() in
 helper_store_mmcr0()
Date: Mon,  3 Jan 2022 15:53:32 -0300
Message-Id: <20220103185332.117878-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103185332.117878-1-danielhb413@gmail.com>
References: <20220103185332.117878-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 73713ca2a3..69342413bd 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -224,12 +224,17 @@ static void pmu_update_overflow_timers(CPUPPCState *env)
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
+    uint32_t hflags_pmcc0 = (value & MMCR0_PMCC0) != 0;
+    uint32_t hflags_pmcc1 = (value & MMCR0_PMCC1) != 0;
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


