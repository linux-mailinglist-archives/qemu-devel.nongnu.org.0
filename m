Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EE5E8BE2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:49:19 +0200 (CEST)
Received: from localhost ([::1]:35352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3eo-00075I-Da
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oc3aW-0003yL-OM; Sat, 24 Sep 2022 07:44:52 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oc3aU-0003Op-RP; Sat, 24 Sep 2022 07:44:52 -0400
Received: by mail-pf1-x433.google.com with SMTP id d82so2412383pfd.10;
 Sat, 24 Sep 2022 04:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=t0nXltUZsjmvLizuBGbOvf6q/S7z1mPB3mkUTRWdV0U=;
 b=dZxpPAaHshLSVQTGvF+jyHajgHS1fsucFYkcUQ07skp/AUmLZE/8ksZp+bWD4zjLlk
 TM0XqMFj0NQtVveaIiLPJC49cWTiLUNhe+0DxoTOmaBMlb8jGx73oFiwarTs8ORcJNtt
 g8EbMg8oULLu0276sxyDvf9haV2+xAYvszh7sOSRyl5GQ+JEgywr1HTz5wRHcg3Ik5FZ
 OHs8InJV1f1w8ydgdfQWB+S9zHmkS/usWNgF5nYNeoyvtrAyR6oWj64x8z7WC2zjHbJx
 YJCu1UuneIMeN0f+YNFFr6Cg3bXs9w5ujyUctfzPv9+4cVwliNh986SMUkwQXuhuqWW8
 evjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=t0nXltUZsjmvLizuBGbOvf6q/S7z1mPB3mkUTRWdV0U=;
 b=mpmy8LN6VBk1MmhgO4MKBw9ojZHTHVlstMAEP2UZv2HdeYdEVKqWUnxWLSq3uNs6kQ
 ek3+s7XT6ItqwNxvMKEmAFFJjruHkzh2dyhEAQyT8J6W5bJLK4/NjN7UCiwVvjFHHPac
 0vKN8iDQc9Of+WJddgEGp4MdIUZDCdhwYnVz6odvmTSE+MwXBAzBgl3fDM0Iasjj1/80
 QwVuhsAAjR9ThTxhCFJ+/JBaWUG/cwyelDCxM+hnV6kYoR1pttqpbDLP41PwFzFJlNY0
 wSBax7CE0LrSQoPHqkPv+KmVfdjhr1UwarCmIgblUlOheqqkCWqnTjxuLGYvvd3oGiF4
 i0TA==
X-Gm-Message-State: ACrzQf3j+B1CD6AsN4zbAllGhP9FxisY0Nt6LSCZwgGrDQ4XJBGorfYJ
 IELO6jV7iqvCA68ggqw/6gA=
X-Google-Smtp-Source: AMsMyM4Rh+MI+GmldEtM4W16DTFNtgzIPa7Jrng28tPTMzYVQ05fVLjF6yBDwpV9MWmjj9Il6f9gkg==
X-Received: by 2002:a63:ba05:0:b0:43b:e89b:da2b with SMTP id
 k5-20020a63ba05000000b0043be89bda2bmr11584222pgf.209.1664019888453; 
 Sat, 24 Sep 2022 04:44:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au.
 [27.32.155.116]) by smtp.gmail.com with ESMTPSA id
 m3-20020a17090a2c0300b001fdbb2e38acsm3264447pjd.5.2022.09.24.04.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 04:44:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: restore powerpc_excp_booke doorbell interrupts
Date: Sat, 24 Sep 2022 21:44:36 +1000
Message-Id: <20220924114436.1422786-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This partially reverts commit 9dc20cc37db9 ("target/ppc: Simplify
powerpc_excp_booke"), which removed DOORI and DOORCI interrupts.
Without this patch, a -cpu e5500 -smp 2 machine booting Linux
crashes with:

  qemu: fatal: Invalid PowerPC exception 36. Aborting

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 214acf5ac4..43f2480e94 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1247,6 +1247,12 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
         break;
+    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
+        break;
+    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
+        srr0 = SPR_BOOKE_CSRR0;
+        srr1 = SPR_BOOKE_CSRR1;
+        break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
         if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
-- 
2.37.2


