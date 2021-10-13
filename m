Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134D42B300
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:58:24 +0200 (CEST)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUTG-0007Q0-7T
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHm-0004js-Vk
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:31 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHl-0004xs-A0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t11so792793plq.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i46GtS4jZvhz3YUTttQkHHMj47qcgxPUFuoIgSOj1ts=;
 b=GUNFYTYx3wLIBXQBW01WeRgG4vY+HfoQAvfDeRRgcebJD0dJL6kdZGxRZ1T+H1tfft
 fmhE4zablTTrTg/JacqEYIA7dr7mEXmTGHpfW7Lg2zqJOnZWndW/c+J/XOAlb305tuTY
 GdkaYf3eCUs1uN0I9T/jGVvza59Dn4jOn7P9rFaDkV6jnbv1OHucHOz+gBtye35G3RtK
 Aib0W086b1eetQjXDc3+Bz12ws7GzdvBNrOUVQxRoeHb2QkYW/NtBTyWjr9PQ4fkQKZA
 5BHnKRCklDNqIeT4DbNdwjxc69RmJJuKrl9f6YnnGpK9jlhrSo83gfD6Y7dNMUDjQHxV
 ewDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i46GtS4jZvhz3YUTttQkHHMj47qcgxPUFuoIgSOj1ts=;
 b=R3EQseosIqwV9jhldc1avgrssvk1BQ3vvacu+4zm7BssZ9AHgiUHk6kj7zcDIEYvp/
 WVucp7+E65TnvMwKOeidS8HirBnmLx3QsI1fzwjyTukvBgy0JQPOvZ+wUAw5b2JBzYJr
 kz1XvHTo8Fb8lD1wkyOQyk2VdGrlfvxWMtmxOKdlzG7WLEPEy84/eIVrZ/gaHifldGLb
 KLR7WhmgZBS377vKcI3NcJ/23iZHQQ+2wHDVlhMeCWqJ0SSQ0HS2DxG2q4srcOpZCljC
 nmZBOlRBYX5Ut18mDTIxqqZpDTW9mUO7dnlyPFhgZmRp6Fp8+bA3PoAx94+VCwS2A2LE
 0udQ==
X-Gm-Message-State: AOAM532T6m7yD90iaqYUBleL3vMio3PtH8FcCeiYE72wrHZh2X/9MtyU
 hvGFV29sQhK9JcDWRWEolZXFO94z57Sy7A==
X-Google-Smtp-Source: ABdhPJwsA01duK0BIpcVJV0jGDxccJd02Dr2LCEmPSLdUnRPHrJdaiYJRF/bsEENwvgF+X1t5FU+Lg==
X-Received: by 2002:a17:90a:eb07:: with SMTP id
 j7mr10562376pjz.20.1634093187903; 
 Tue, 12 Oct 2021 19:46:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/48] target/i386: Use MO_128 for 16 byte atomics
Date: Tue, 12 Oct 2021 19:45:37 -0700
Message-Id: <20211013024607.731881-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 0fd696f9c1..a207e624cb 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -136,7 +136,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
 
         int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+        MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
         Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
 
         if (int128_eq(oldv, cmpv)) {
-- 
2.25.1


