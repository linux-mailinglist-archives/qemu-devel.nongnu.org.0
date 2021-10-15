Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A442E80F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:48:46 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF9B-0003ex-JT
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcI-0006yK-C9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:47 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcE-0002xM-SJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:45 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n11so5612973plf.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGqZOPjwuoviGfiS5SB/EShJZs+j0SuqFPzdROiPbhU=;
 b=bHyCnYFAxOJGBUQhByKTz2G+C+TKM1+9Twr4BQ50SSIdgcpIQVvnNjjNizrhi9vHUX
 No1gRmsFkRLfVOMn/hUltUj+RX82BMudTBQXRIIjUupe/C0UBvBr+TTgVP4ewFOBTZyg
 BT4F60+TMaMBQUrt8u5fb+VwATekXE6rLfmm58c5X4fD5ACGtdkL/Gh/3gergKeo61EP
 qNvWotd3fgjdcXb0CuIBTcG7R5w6zGyGkzbiDYRXRSzF0NuJm8sU6Rd1aGKAXY59MbUz
 h8MMGs6ANt1k9Ofb6Ovu3Bs7N+lKvYCaUsoHHhnimtkpT9tScRKHapzFggTkEB0W1sxz
 7lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGqZOPjwuoviGfiS5SB/EShJZs+j0SuqFPzdROiPbhU=;
 b=uE33lICWkEKYzRDqNeO8geEli/xWeMmC2HKmccHcg/OxMzD3/atwBTAI5ZNsY76FCj
 8CO+ObbNVPF7ndK8fhh6fE1EmHuIWNGqnokEACGcqem2y0SxG9z68IZ70CqeKNglNSoJ
 LFKZKXKk1Ik7QpEaiVDMerv1hjQ1rdCvoY7+zoRxnR5EMEtmOmTvCzhXe+HC+fbvXVJ1
 NtUTQT8hs26ApIjObgBD48bbaoLKerHnAdKofAbZoZs3KSVi7mufvouOtzJ1NpYMLsgC
 jVhQX3ypFJ1p5vY+dU+o3+rI1TTMufcEkixKQuNzkzTqJ4e4M7+UJeGFrmBNqw30jFEb
 wjDQ==
X-Gm-Message-State: AOAM532xUc1xipTTHxxFBzsBV3u9xHQENX4qHFcEBnkEfLQc4sTEUmly
 s0KbObc4k9M1VQwV6z4SLaCzkGclA6HhAQ==
X-Google-Smtp-Source: ABdhPJxydz6Nn+1x41mzg1aPvKLt6MOOarFyIcE4PGnjiSmHitY5Ansp5Mteo3gNVdk4oA+dbscz9Q==
X-Received: by 2002:a17:90a:ac0a:: with SMTP id
 o10mr24726301pjq.125.1634271281599; 
 Thu, 14 Oct 2021 21:14:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 59/67] accel/tcg: Report unaligned load/store for user-only
Date: Thu, 14 Oct 2021 21:10:45 -0700
Message-Id: <20211015041053.2769193-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new cpu_loop_exit_sigbus for cpu_mmu_lookup.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 92cbffd7c6..7d50dd54f6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -220,9 +220,14 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
     void *ret;
 
-    /* TODO: Enforce guest required alignment.  */
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        cpu_loop_exit_sigbus(env_cpu(env), addr, type, ra);
+    }
 
     ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(ra);
-- 
2.25.1


