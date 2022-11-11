Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A1626167
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYrr-0007oe-0p; Fri, 11 Nov 2022 13:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYrg-0007mg-Aj
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:34:56 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYre-0007Nu-M2
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:34:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id k8so7556557wrh.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4e6Eni3qQrLsasdgaGetPChuPB8kPgudPLx+PRHc34=;
 b=GXNd1DgohE14lgLwodrub+y1G5c+qiajvd6NcQKUQC1iP3bvA2j9n7QtNx4aC6Pp2s
 vPr49Z1UkB+yH5mN9r7kWTPjcADEDqqBgK9NoMhqZPfkfM/bz1OReTJEOHevXgXliPRK
 n8Pvcl/XRyAO8HD7jGQT7pfMMQMhtwHu38fXiVajMfMgtgAY3BdjYbDw5700bFor15fK
 mdV67ag1gGLK1ThBdWsekMpkKf+rGo8vKFAgwgv6bUqv75Fb8/4KRPIQiEJY3nmWRbu5
 3e57zO7LYRAgWFqcaUglvUf8YMSIRr3LN9xM3NRrBcIr4Bhd+0vtpF5pYTYYuPlAkTRr
 FyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4e6Eni3qQrLsasdgaGetPChuPB8kPgudPLx+PRHc34=;
 b=RAjhicrGfn4Bem+/PYjIJuQwFD22mNCC3bQwWi0UrrAEpljTZUDmRa87E4YGTCeYFK
 1Zk/Pt+cx1d8ztI1QFudNjkqhBFEKBKSGm1pdGdZTwl/ONBF52ZzmPsC6VNGgRs47Cp0
 rusdho4XAHGUjfYdLd3XLQWALiYMN0pf66qqQ9t09FRcUeu5lHLiAWvdDIAAsxLwY4fX
 mpsTZcM58i4H+LBRwGPC/W/5cQ5ghO7RopQVCTvL+ynQeU8xabuzlie2InEK+aIT2ng9
 j2PjUUZpffJw0ogcJEdL9BdaWkPGDefhREc0vnQucFvwkB5CSqwh7ocHPLKQJOsrJJNX
 /csA==
X-Gm-Message-State: ANoB5plDRIXo28oJNDQMt25bkzKU2tvkpDfzvaXKDydSuTvwt6FI1xXx
 eaGERFF+RHrxooBM0YauqhiGjg==
X-Google-Smtp-Source: AA0mqf7xbbsaShLQM4OOziyI5pxrBsX0JdxJhVszye/ecyw9WKkQoXLxPX9viNUyfUZ6DmAcVGXfGQ==
X-Received: by 2002:adf:a3cb:0:b0:22e:4b62:7ca6 with SMTP id
 m11-20020adfa3cb000000b0022e4b627ca6mr1892051wrb.441.1668191691793; 
 Fri, 11 Nov 2022 10:34:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i9-20020adfefc9000000b00228dbf15072sm2543164wrp.62.2022.11.11.10.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:34:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8E581FFC2;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH  v5 11/20] target/sparc: initialise MemTxAttrs for CPU access
Date: Fri, 11 Nov 2022 18:25:26 +0000
Message-Id: <20221111182535.64844-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Both of the TLB fill functions and the cpu_sparc_get_phys_page deal
with CPU based access. Use the new MEMTXATTRS_CPU constructor to
ensure the correct CPU id is filled in should it ever be needed by any
devices later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/sparc/mmu_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 919448a494..eeb52b5ee6 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -212,7 +212,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     target_ulong vaddr;
     target_ulong page_size;
     int error_code = 0, prot, access_index;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
 
     /*
      * TODO: If we ever need tlb_vaddr_to_host for this target,
@@ -771,7 +771,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     target_ulong vaddr;
     hwaddr paddr;
     target_ulong page_size;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     int error_code = 0, prot, access_index;
 
     address &= TARGET_PAGE_MASK;
@@ -890,7 +890,7 @@ static int cpu_sparc_get_phys_page(CPUSPARCState *env, hwaddr *phys,
 {
     target_ulong page_size;
     int prot, access_index;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(env_cpu(env));
 
     return get_physical_address(env, phys, &prot, &access_index, &attrs, addr,
                                 rw, mmu_idx, &page_size);
-- 
2.34.1


