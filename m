Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA731CE0D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:29:27 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3E6-0005Wr-He
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32R-00078G-SC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:24 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32C-0002Nh-CH
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id l17so9578795wmq.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tJYREiEwDxpVe67h98x1We/4+RbYF4snD5TK+jsNzDU=;
 b=PAsxD+68PmDbV+rVh4t8l5yttLhmWueHh1Ekx6CpHORu2B8z1YsJmqJ0cDqcjQEDEJ
 ll5RcOZvks19hdmCdAR9T0SfxBBzYdJEEawJjezXtWVJQGWXwX+9G9O3yH9tiQZ56wa5
 xjkgHDaB9w2Zf60SrNFccVx365YMsX9lkRcK0TFv1lOnECLH9N6lYP1d/pFXTDfGWIh8
 TGr8i5YRPuNBR2KANoiiA2Gsw3ipxjMhJhAOC+NIm70M+zzrXudSE9P09W+Ygt03ZABw
 bGg+LPZ4P+VuRvrY+kXLVwlXY+wg38URn/Er+zRQ4B4cXOUIv/TrxPN/rWXguuGn2HQK
 u6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tJYREiEwDxpVe67h98x1We/4+RbYF4snD5TK+jsNzDU=;
 b=j/LkY4HJWtmy3uumEvALx2YJf6TNARbtB1ggNrTsg/FJZA9qjdjXJVEK1XyD+rRxiK
 m4MEaY5bsvLedehwA2cWi0SAgsC2G3CuhBXBsPEBEhHYZSOkigvvWcT5usGHPqddEeLc
 9OOYnSDa3Cg5ssfPHCw9cewcew5G5yryfGLkC8+bGBHqkTct0DlKBzLyLBFJsQ2WeOsp
 OcX8WiMqaxOCy9EWSy1BRk8CyueD6foBZ21xHY+vZ7M+VM8llH3/6EHA7hirprFB/qDe
 LUP67wVSDEuqkbFCHpOKXZkzCXEZX9mLeGY3cltnSp5nm8HK5VMT3Sx4rGGSlTaIZsOG
 GfnQ==
X-Gm-Message-State: AOAM531ZMvPElsreWpCqxXWgy/BiCevLo1raiBT3pdEWMr5aKeoxx1Ix
 5haav6bpK0kJOPTvim6VZVX1WtpFPcIK9g==
X-Google-Smtp-Source: ABdhPJxFpSGP6TQ4iZWSQlKAGIX6+lg7bnSRKF7bpoDOXkUkYhh/z7Y5amrn7UHvyHVQJV0lDoiULA==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr3732159wmj.182.1613492226949; 
 Tue, 16 Feb 2021 08:17:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/40] linux-user: Fix guest_addr_valid vs reserved_va
Date: Tue, 16 Feb 2021 16:16:28 +0000
Message-Id: <20210216161658.29881-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d5429..e62f4fba001 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-#define guest_addr_valid(x) (1)
-#else
-#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-#endif
+static inline bool guest_addr_valid(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-- 
2.20.1


