Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D81508363
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:27:14 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5g9-00049P-2c
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh5ZU-0001I3-Re; Wed, 20 Apr 2022 04:20:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh5ZS-0003HH-TZ; Wed, 20 Apr 2022 04:20:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id g9so952767pgc.10;
 Wed, 20 Apr 2022 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hb3bq7oL126iOLWFWT8GvAlmoKeU1g46jYyc5j9GT2Q=;
 b=CJgRR67Fgxk06E3IyLXAgCV3RKL6lhr/zUBteqE3pbuCKRPYxvQGBoLYSxHtRQlsQf
 QuycqNdrRRC+YP9wAB6Sem0o072f6pAJbyftivIDgoyfA+vvj03GiuR69wUOSN59JpYp
 wUDYY5SBBqwugrUVQL2d15n/9UoxJ2wvYpDiGLmmXso/iObkluD0LaWN2Kl/zinwptRt
 i3CDR1tRyLxGTiphPnpRJHUBgER3uAEwsno1jOBzVxvJWd7aIIMVy/Bzmi5w2rCrc2Jf
 sCqqFzz1bzezc0ME6pUPOSegmAakHeQj4ubcYAcH4Pd8LOFKPjIvdwriY4hsOWPGDBE4
 tk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hb3bq7oL126iOLWFWT8GvAlmoKeU1g46jYyc5j9GT2Q=;
 b=TM7Rbrn8yGxWyYUgkCgHIU5TmDQF0WmCOvRdQVYehGe8YTn0TXtJf66RV4l5Vdb8Ln
 apyIJ0TWN1cCZVozaoIv+5oNKAK/SpFyopux/53e8cArnm74NFV6o1/m7eRPIdiV2+1J
 29xhVqtGdYI40M7sDfmSx/0glJydnYtrPAEfK2SJb/2+2CP57OIOU1x5AeQq49IB+nQ4
 U1aOz7ZliMf6daAXkq8j1MmUiil9ON0cGk7VBYHA7irWpLl/PTzzsremAci0pM4WW4Aj
 y7BPBw2fW5IMZH+bPCwPjElRIYLcV6OGXh2xw2ijZ+V5vMYeJIM/nJGrEJDqak+ROTtY
 OdRg==
X-Gm-Message-State: AOAM533f5QMxhBgFCy2FAyL8qpk2DTuN2bjfsJZj/SUKM7TjLVRsavG7
 YfCH5Z2eR34nLr8VPxGwXb8=
X-Google-Smtp-Source: ABdhPJwwiuvrF/bRX6Sfqylv+s/JubhRJVnx8RUtFpapyJh8XlsHaO8eMZUf2sBWdjrq/ANGS47RRA==
X-Received: by 2002:a05:6a00:711:b0:4fa:daf1:94c1 with SMTP id
 17-20020a056a00071100b004fadaf194c1mr21912131pfl.52.1650442816583; 
 Wed, 20 Apr 2022 01:20:16 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 16-20020a621410000000b0050aca5f79f5sm1736067pfu.97.2022.04.20.01.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:20:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: Fix BookE debug interrupt generation
Date: Wed, 20 Apr 2022 16:20:06 +0800
Message-Id: <20220420082006.1096031-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per PowerISA v2.07 [1], Book III-E, chapter 7.6 "Interrupt definitions"

"When in Internal Debug Mode with MSR.DE=0, then Instruction Complete
and Branch Taken debug events cannot occur, and no DBSR status bits
are set and no subsequent imprecise Debug interrupt will occur."

Current codes do not check MSR.DE bit before setting HFLAGS_SE and
HFLAGS_BE flag, which would cause the immediate debug interrupt to
be generated, e.g.: when DBCR0.ICMP bit is set by guest software
and MSR.DE is not set.

[1] https://ibm.ent.box.com/s/jd5w15gz301s5b5dt375mshpq9c3lh4u

Signed-off-by: Bin Meng <bin.meng@windriver.com>
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
2.25.1


