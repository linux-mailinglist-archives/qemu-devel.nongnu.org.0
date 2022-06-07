Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8D541D34
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:11:38 +0200 (CEST)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhQH-0006s3-5T
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Z-00077L-LF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5U-0001JY-Qa
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f65so6779229pgc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cs+FpLBc0ayQh/IFdv2ROEUbtJo92UQIPCLnKIxQZ6k=;
 b=ntEBiMT71L5CDVs0otSt3lsAjjuU8P/2cIbA99lmygx/p9nPzC4vd16KjHy+Vv0uv6
 UZoLZ3NQxrwoD+eaxAqIjZd0nx2Dr0Z7T2OPCnWXJrAuU+GE37LCAzKn6+kFNO9dEuoa
 ff16gPLbjWWP71WIMf4ujr2A5/VxBZCkWab1SKoDEIMxdKTickTpehDCfXN98Q2SO3vW
 M44h+I4JzMtPDByyScWhiV85LD28CZJYHIjLFAv8nSHz+ymQTFWrAlL1pwvcRWDOKwzK
 hHkPR9Zz4amDioWWNcEjJVUif4V6s+cGsGLdIueN6ihOt0rTRB9P93SsOEO5Yz+lEC+R
 J6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cs+FpLBc0ayQh/IFdv2ROEUbtJo92UQIPCLnKIxQZ6k=;
 b=z/WCzFvM2N79frEG29v/yj1x0sgFtXoW/5cZetUis45IiGhc/H5n+ANUckvRu6vVe1
 rZkw8X1nWdnw7dqTHso1L16wnLAA0RmGZlpSPFw855UFNWxV3dXLaWGqyHj4tll3VzAF
 zyU7mHXJe8luvtl2/qQYHCEOlUSnnBTN3cyn4vNloxdZW9hj6HXIeM/7Ki4aRLT+eR8b
 8Ac94LE4kLRTisOmVPwO0KMw5NdxqB8RshcD+ZMGm4GQNTXgIgBXwl7J9ZZuN80c8SbF
 x4vXhTNsF0MsfJVNQC1vNnT+i4+B6ksDKH/U4CdDUp3VGXiJbmLQ4zpJQA6Zwl4zB+FH
 R9JQ==
X-Gm-Message-State: AOAM532ifUJQsUP05amPQ4uuTWdgN+zphd8Tvr9S0Ev6DHYbdpxNOvyp
 3veQw4ariFipEh8x18WCr691TXpI4CKcBQ==
X-Google-Smtp-Source: ABdhPJwcpZv7gB089rnQ9dWEbaMNRghlk/YXfoUY7KMQL2dHQ25n1hBaxzF/rcEcf3ZeWNy1vCpvBA==
X-Received: by 2002:a65:4c41:0:b0:3f5:cf9f:283b with SMTP id
 l1-20020a654c41000000b003f5cf9f283bmr27229206pgr.301.1654634763515; 
 Tue, 07 Jun 2022 13:46:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/53] accel/stubs: Add tcg stub for probe_access_flags
Date: Tue,  7 Jun 2022 13:45:09 -0700
Message-Id: <20220607204557.658541-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/stubs/tcg-stub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index ea4a0dd2fb..6ce8a34228 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -21,6 +21,13 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
 
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t retaddr)
+{
+     g_assert_not_reached();
+}
+
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-- 
2.34.1


