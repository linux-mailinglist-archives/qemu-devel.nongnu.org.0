Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAEC5140E2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 05:40:44 +0200 (CEST)
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkHUp-0000cX-At
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 23:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkHP5-0002QG-3g
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 23:34:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkHP3-0002RH-Es
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 23:34:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 15so5560603pgf.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 20:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XE6VlfMYlfE/3yLrLBtsEwY5zghvp90cbL5X7mMVwi0=;
 b=BZ24z1oidTTQHebrwffPilSf23aMhT6iQfb3rCkTVnu0lK6sDLx+0/PYl+KbECO0w3
 1t4JNyW6rnbbEF0TIfHCJ/jh4QJ6o7Qg1YAbs4oQnzSFUoCbYziBzf0FgfZOnHPvmvOu
 fT4OSPJc3lngYwLJHL6NIAFornEk812NzYYNR4blEPLyb2zddqVVk8G2FgQKF5lF+ym8
 RiDmjpF9exYz2SY7AByg1w5p+0+lJp++QXwwi9vQnQsA/yW87Xxqe3kXXVs3OZRGCRtS
 hTwF9UTpMGG0DjfOqrRFrxc8K9rX2b3t8L9Q/Cs0CvSbSZq6ZLuqrDQ2kPxQoY+/7zJB
 wKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XE6VlfMYlfE/3yLrLBtsEwY5zghvp90cbL5X7mMVwi0=;
 b=AAouUFRWYLMcvrkEy0w74jumvxUV6tJtPztJ1YHVGGbGx1XnS//akUgCYaB+0pE+Co
 utaxPj40429kYAYtzEd5h8ZVY7nRwyRKfWnjxv6K0NRPQqDnfrOeaCfNJ3PsR0MkXoFy
 U0zMFPv3EFzO70Xc16CgegboqlAjiKZDslt2gsKlb0Tyt14gx6fL1hDTLbK/DzSRhjki
 mDL21xGbg3hYm01dsyy9JoV3i9RRtfT+odJX1kbTh2dCxaaO1XcHSfoqcpRq0tY/OM4p
 UHAg0FXsiB+DIAOAS9e5qqddtDY68HTIHts/lIEVT0urefqZo8RG9p9hEXWaCgVom22E
 nlog==
X-Gm-Message-State: AOAM532aYefFXkwUe5qR/jKE2ldsrx5uC22zvOvj2TsPdumnSQKOoXSL
 NyIkW9LoBA6N5KzW6KH7mrwbNg==
X-Google-Smtp-Source: ABdhPJyUvjuh/hixm1ou2mAZ+KmwIBg3usaud5Rq0DktWzzrHoq0/2Xn+QQwQiYy+j1iX0x/yMUC+Q==
X-Received: by 2002:a63:6982:0:b0:3aa:a7c9:3913 with SMTP id
 e124-20020a636982000000b003aaa7c93913mr30442913pgc.295.1651203284127; 
 Thu, 28 Apr 2022 20:34:44 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a071600b001d9781de67fsm8195568pjl.31.2022.04.28.20.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 20:34:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH 2/4] target/riscv: Fix hstatus.GVA bit setting for traps taken
 from HS-mode
Date: Fri, 29 Apr 2022 09:04:07 +0530
Message-Id: <20220429033409.258707-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429033409.258707-1-apatel@ventanamicro.com>
References: <20220429033409.258707-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, QEMU does not set hstatus.GVA bit for traps taken from
HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
on QEMU. This was working previously.

This patch updates riscv_cpu_do_interrupt() to fix the above issue.

Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097..d83579accf 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode */
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
                 htval = env->guest_phys_fault_addr;
-                write_gva = false;
             }
             env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
         }
-- 
2.34.1


