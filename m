Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D84144A1C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:59:14 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6Eb-000065-4P
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65u-0005s1-6u
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65s-0002on-Vm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:14 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38250)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu65s-0002oY-QP
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:12 -0500
Received: by mail-pg1-x52c.google.com with SMTP id a33so2641028pgm.5
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lpOSEVgn1nYSDoRmP2S6TPZlPRGf7XKMhZlo+r1VEs=;
 b=W6HYfoh9wZpjjRwHL+rySq01JXTftRX1I3SA0TJzJS3WU0y++XAWshbawoTcwXdd/8
 ryyBNolrFPzZZnFPR24JCxeVW6SukwM3ZjXqUIcA9EtBksYBipck9xKhj6c68y3MEouK
 2C75lnyYcL+WqqqnSmFgULSCuVHKP3d+Ucie1ZtOjI2irHsI9xQ5YIWyPsuK7m4Sc4Eo
 RL6qWsk/AEyhhpAOPNoeh7rmIxo4d0aq8kvu7IqnThLDfsuRPQ5teCgMTB6CP21bGMln
 mWT52vPxpHxlJkKcX3oF8CaSCv0rDW5fQ1cMNAcpkVXgFtYunGRPFFZd/GLJl8C7B3Ep
 thsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lpOSEVgn1nYSDoRmP2S6TPZlPRGf7XKMhZlo+r1VEs=;
 b=RXdYsGixBIKJ8U4PhL4nuXPZsB4/Zm0glZEYj/d2T9GieZ06NZ0Va4mvBaAv174W6/
 7B3VIpr18DEHPMUDCGwtkWJwXYnSg4l+8LymmqhgVR08LoyElA33lPeUJCmtATDbSz53
 kpPqzYBLmun29rpYEKWRUXln54wahE7mXzBXL0rNO+JQb/6i5SLx6CB//tx60fvtzldt
 moO5ajBLHT8V2hvS9Y8QUqWDONh21YRg71txy0SwBNTMcl3ee5q9xiT6ilfQY6jOjKNt
 0sgBrFVE8le3dwelTLpNCRcXYi5uN+gU6ptT4B7imbEl3uXg/pvLkdwy2N2/E1LSeBKl
 LxKw==
X-Gm-Message-State: APjAAAVrAZe+Mq5NtTKOgQma5qsIy/mbGKAouzT3o1wKJknyOLpCJK19
 ZvP1WLPQw9pjZyw/euvytYihX3rrMcA=
X-Google-Smtp-Source: APXvYqzhfjeY5g9CF8AF493zrLcX+dCMRX7gqrX3hJM6PnRlbdwi8DCikqR9aadvgNh9wgIfy/6+ig==
X-Received: by 2002:a63:5512:: with SMTP id j18mr8440190pgb.189.1579661411592; 
 Tue, 21 Jan 2020 18:50:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id c22sm44149883pfo.50.2020.01.21.18.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:50:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] cputlb: Split out tlb_mmu_flush_locked
Date: Tue, 21 Jan 2020 16:49:42 -1000
Message-Id: <20200122024946.28484-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122024946.28484-1-richard.henderson@linaro.org>
References: <20200122024946.28484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will want to be able to flush a tlb without resizing.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bffca0e7e7..28cfff1556 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -228,12 +228,8 @@ static void tlb_mmu_resize_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast)
     }
 }
 
-static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
+static void tlb_mmu_flush_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast)
 {
-    CPUTLBDesc *desc = &env_tlb(env)->d[mmu_idx];
-    CPUTLBDescFast *fast = &env_tlb(env)->f[mmu_idx];
-
-    tlb_mmu_resize_locked(desc, fast);
     desc->n_used_entries = 0;
     desc->large_page_addr = -1;
     desc->large_page_mask = -1;
@@ -242,6 +238,15 @@ static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
     memset(desc->vtable, -1, sizeof(desc->vtable));
 }
 
+static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
+{
+    CPUTLBDesc *desc = &env_tlb(env)->d[mmu_idx];
+    CPUTLBDescFast *fast = &env_tlb(env)->f[mmu_idx];
+
+    tlb_mmu_resize_locked(desc, fast);
+    tlb_mmu_flush_locked(desc, fast);
+}
+
 static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t mmu_idx)
 {
     env_tlb(env)->d[mmu_idx].n_used_entries++;
-- 
2.20.1


