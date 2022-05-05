Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FD51C908
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:30:46 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhBV-0002HL-7m
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYY-0002mR-2M; Thu, 05 May 2022 14:50:30 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:45669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYQ-0004QF-4M; Thu, 05 May 2022 14:50:29 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so5080760fac.12; 
 Thu, 05 May 2022 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smaERNTnj8VuQqy/NB3WV2AHxA7pkgB+yEo/MlXNzKE=;
 b=ELU5s3pKEBp9RWG/H2U83ZtUFnVuKlfuUSk/ZtCksu9I4YUjJ9YwbJ5hrIPiyKmiDx
 uA/wfPmTvdG/he2Q8kn8Ya4z0RY6s1d/CdjF6WZx2aImcRWbnLS2akGB4FQBc8YXbV6e
 0BRLz2R8aH/wRnaEsQdENlsDnVulnNiKdDViP3bkmOjNlzaCQ2EnSRmZ7uTBRNvB4ANx
 YQEmlXuz2P+lCCv/gPUEbmt6eSoqi1qrv93UC/LskUwP1vfl+f0NNJZxDPwMeP8SMWyg
 vVEjwsJlTgg+gZk2Oo1rT/fHbVfGdcaVp4ed91uXfSKREo7VVmVjYPVYQdGQRnSTHbWt
 dZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smaERNTnj8VuQqy/NB3WV2AHxA7pkgB+yEo/MlXNzKE=;
 b=DlLN9Jl6ILfKkc8XgSrk700v128E8e3h808dqIPlX/HuzxuY74iRSq9YzEIJ42vcrQ
 prWfvxhABwsdAyMfRLnVDWEn6tamoY/TAhKf/j0uBU/xt6TT8l7masjyBKVZ9xpfJjRO
 Mu9IeUhVK0N2GOqUlxwuWe5vGZ5MDelKM+37JCeWv+81xsaeyW+ssn3eL2liwmXE9k0b
 xi+2g7fFTVNznDlgFDFlEphrm6RH6tWJKgKBpoWClDXpJMQosTzsGp11mtxjQR98iOC3
 UwS3JKnTwa0BCt3lMTLBMqgTRZi4Zt/hE6llgz1HMlHE3vu8hViLGc7TZOoNAAKwU/kD
 FnpA==
X-Gm-Message-State: AOAM532gwkX25l4bqSSQOCp2CqRHFWNfrJTrSD2ctbLTgJpYr7Fyu7gg
 9M0K5wKZtUMu4Hp2FlzUPGzu6C7zYiQ=
X-Google-Smtp-Source: ABdhPJxz9VN1xqM1jUwpwgTZmYlNP3oS8LtL4oe/K5oVjscgzxOCGwF4A9KWQ9BZy6lY47FLt4C9mg==
X-Received: by 2002:a05:6871:a5:b0:d4:41d7:d341 with SMTP id
 u37-20020a05687100a500b000d441d7d341mr3022669oaa.6.1651776620254; 
 Thu, 05 May 2022 11:50:20 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Subject: [PULL 05/30] target/ppc: Fix BookE debug interrupt generation
Date: Thu,  5 May 2022 15:49:13 -0300
Message-Id: <20220505184938.351866-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
Event" and chapter 8.4.5 "Instruction Complete Debug Event":

  "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
  are set ... Branch taken debug events are not recognized if MSR[DE]
  is cleared when the branch instruction executes."

  "An instruction complete debug event occurs when any instruction
  completes execution so long as MSR[DE] and DBCR0[ICMP] are both
  set ... Instruction complete debug events are not recognized if
  MSR[DE] is cleared at the time of the instruction execution."

Current codes do not check MSR.DE bit before setting HFLAGS_SE and
HFLAGS_BE flag, which would cause the immediate debug interrupt to
be generated, e.g.: when DBCR0.ICMP bit is set by guest software
and MSR.DE is not set.

[1] https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Message-Id: <20220421011729.1148727-1-bmeng.cn@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper_regs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 9a691d6833..77bc57415c 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
 
     if (ppc_flags & POWERPC_FLAG_DE) {
         target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
-        if (dbcr0 & DBCR0_ICMP) {
+        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
             hflags |= 1 << HFLAGS_SE;
         }
-        if (dbcr0 & DBCR0_BRT) {
+        if ((dbcr0 & DBCR0_BRT) && msr_de) {
             hflags |= 1 << HFLAGS_BE;
         }
     } else {
-- 
2.32.0


