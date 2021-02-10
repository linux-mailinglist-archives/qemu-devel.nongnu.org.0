Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897D4315AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:08:58 +0100 (CET)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d3x-0000Wy-In
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxx-0003Ta-Ib
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:45 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxj-0007yC-Sm
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:45 -0500
Received: by mail-pf1-x433.google.com with SMTP id x136so113468pfc.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=iHwUSitKkkqRg/cEK7QIqKtVCkLf0qdGpfvdrLaMWBIMKYIMcryRHDovoDQY1RHO0H
 tn6rcTGRuuEPviIJefVdgV59r1CfDSfhGbFnsJKdt77/SyLD2f0gG1UnX1HelIO0Bb3G
 9WjrDzvPEjK32LRgdq2ttyS69t2N5LmceWZDYLUjw1ZD9iJsRx1usw9SYp1GIlZyb899
 26OAJFgEPxSwiJIMJqNulLfUtjHoxRPteWUnjunzdThNyUVdv6GHFAVfWwZwddwplMNu
 7lSJJLSOFRhUra3d63WXdqOAuRpour7fWUzuhcH0ixg1CPK32MuWRinZCujn/H/hZIRE
 4bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=oEPXkJsnCdBLslOaRAZqTJmXbVQQM1Z6E4KYGby8TEzuxq4F0UEMu2bojtPAGojhEv
 kVNuZ7o3ZUupyWTfyI1FeNOHGB7wqk41MO7iNGfiuMvQ0TcFxoLY2sAIJfSVv6so+O69
 ltJmjdcd92hyHS+mhHBEkzCrZO3bFiYS+paOa7w4PLgClfi/uh1u/4uX/+zCkv9SD/Z6
 2t62ykrnLkmGXTTRtP+hhiAehPvDCFLnMEQIUhiaiopArSCRAG0uV2dQ4v6ZIqeVAjbI
 LI9oP+iT0tffL2i3FXJT8svf5JPYSpWsm0z7mm4I8yMInNVTHRIpryW0RVltEywlNcB5
 sLPg==
X-Gm-Message-State: AOAM530UmJtZrOJ0uUBo4iziUaUYr2tbDdF1ORqIngU0EJBcpYnRo9rx
 I1r1DHQr5ZVmzIpvi2Odsv8hxuERYqQsVg==
X-Google-Smtp-Source: ABdhPJzUfacau3iAnb1eRgqipHXI5wjNDouzb5MhSBANgBzyMdHWCvyDsxBiMWEn3jBy5nuh+0d07Q==
X-Received: by 2002:a05:6a00:1a44:b029:1d6:4170:ee0b with SMTP id
 h4-20020a056a001a44b02901d64170ee0bmr379528pfv.57.1612915350611; 
 Tue, 09 Feb 2021 16:02:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/31] exec: Use uintptr_t in cpu_ldst.h
Date: Tue,  9 Feb 2021 16:01:56 -0800
Message-Id: <20210210000223.884088-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f..3f9063aade 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,14 +70,14 @@ typedef uint64_t abi_ptr;
 #endif
 
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
+#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
 #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
 #define guest_addr_valid(x) (1)
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
+#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline int guest_range_valid(unsigned long start, unsigned long len)
 {
@@ -85,7 +85,7 @@ static inline int guest_range_valid(unsigned long start, unsigned long len)
 }
 
 #define h2g_nocheck(x) ({ \
-    unsigned long __ret = (unsigned long)(x) - guest_base; \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
 })
 
-- 
2.25.1


