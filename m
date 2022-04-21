Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A750949B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 03:19:28 +0200 (CEST)
Received: from localhost ([::1]:38226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhLTi-0001CG-O9
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 21:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhLS0-0008HF-Dp; Wed, 20 Apr 2022 21:17:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhLRy-0005o4-Jj; Wed, 20 Apr 2022 21:17:40 -0400
Received: by mail-pj1-x1031.google.com with SMTP id u5so445666pjr.5;
 Wed, 20 Apr 2022 18:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eeU9QD3V/RG1+nwj4yczfgPiRc77rBxUrSfUOrbrOI8=;
 b=SXyCshFHvkYu7bTvTytYKx5GDEc+IqlgobAqIoQgMkciIOzU8js0zbbiSQt34BSbDc
 86aaFPzyTZqFaxVbbrwUyy6YwfyQ9hMXz4YeBIY61FrTYQb0HYIxCqkYLyZxfj/De7MH
 AuYQmF6p/QbpkjPpOtJQ/O5T6sIyIH7x1gsf9xNJmHb6recwjTd9fgZEtsqpwspykVeE
 xK1Nb/TK63eMs44RnkARURMDemVZ1sZEo1IkrgfcBGDoUdji3PCwjQ5zQlo8lApFimb7
 6ybZaR1U6Vxm+9Nypv405IhfOZGq3R1Gnu3fydifJz6Sdf86umnKo2LjozqV0AxfB6Pp
 U5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eeU9QD3V/RG1+nwj4yczfgPiRc77rBxUrSfUOrbrOI8=;
 b=HSALAUxPOiZOoXJm3TcXYiFyK+HNwnBsKjzi5NANhFB1UwZ8JkIMvFgaqJfmcsqpsc
 BDkxJ2BCXIt5ekEIFAl/At+urMKuusHQ1O0kHE8wOety5yy6I5Zgsf54exRbnKNtzhH3
 DdTFIFY3xkereE0KZGiYe10P1+WmUBRewjpEHm6uisBmnhj93MS7LuNDA702tV/kTjAT
 t6H/BCnRUF0GYNn74ChRqSWzv1YGPVGNwi8/1H/KmNE40gDAhblN6hR2YewLwsppEX4r
 LQA8ba6WPYO0LshS47DYKSQRKIhWvN2POom2zDZEUMGdQh5MKeHQnaxFLTWxXl6BUdAL
 TzGA==
X-Gm-Message-State: AOAM530eLT0i4gweR+wgDfqdNuRnlZePqJ8ptarYU0w9yxdFPCpm21hl
 sgExrsMaEBrHyCwQxYhHLQM=
X-Google-Smtp-Source: ABdhPJxb4b8XTKhI++3V8QMtBiqQOWrHjoyCOf1LGs0rDnmVO3qXhTz8LwdDVjiIAP4uzIjTuv634Q==
X-Received: by 2002:a17:902:e885:b0:158:e564:8992 with SMTP id
 w5-20020a170902e88500b00158e5648992mr23058748plg.34.1650503856682; 
 Wed, 20 Apr 2022 18:17:36 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm23122330pfu.202.2022.04.20.18.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 18:17:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2] target/ppc: Fix BookE debug interrupt generation
Date: Thu, 21 Apr 2022 09:17:29 +0800
Message-Id: <20220421011729.1148727-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
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
---

Changes in v2:
- update commit message to use E500CORERM instead of PowerISA 2.07

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


