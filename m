Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE69378C40
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:27:39 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg50c-0008HL-C4
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yx-0005XR-Bc
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yv-00038q-3M
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n2so16476754wrm.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=toJACPBD+agquDJNeNcjG7zq9jkLnO9aVFHB2e+yE4E=;
 b=FhSqu6T1mT/f9nwoF7e6KsBelEk847slEF/6uxSahdZeMEQ4BMbwNYSK4kYeuYMl5e
 J8ZBb5aF4SMNgpiWc/aPqGbYgoSd5n4cVLx58yOvbX4ZOOlXys5b8f/ab6/rytLxxtmx
 Cxj8b2GRsxT0kYko53IwRUe8Lea18yHaqc/GJ27mrrOH9+08cIZpEfVWg8NXxYhdL4Qc
 cJwRFu+Ijd6Jth1537B2QnnrbXGevIyiYSKqWLiUewI9SWstopBaUXq8Gsa6TOFF+Xw4
 r1tkxpYPAWf0lMNZqccJo0eNIyYw5izqWNuII5tD312XcvFwzHKsa4Td4Z0+D9R1A+5+
 Zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=toJACPBD+agquDJNeNcjG7zq9jkLnO9aVFHB2e+yE4E=;
 b=Nry/liVyhNzlkFk625umyqyteoqGHCHgXnuH33EqmcdA1Ty+G1gCrWDXyyrm3JYVni
 LpW2XFNnYf2SyztdNsDysID8SEf/7vi9IncCP91/O4JrfHubwzedfDqWquUMLtxLcpCz
 sS6rF94g5Xe2fzhrf99XRkMsrHHH3lzJXbnH0ue8EqDyHzfe7V+P6qA9oX9/w3Eqlh3E
 T+IhOm6bLPyj7pC3Lrh9YrrX1vI/wXrXll0kDUvwVLresYH76ha+LdilO72aKEBOf0up
 7B8UpNVxwlCIsSrPK5+u6jgJkxjFSqD4G+GY4hom7Lo4orxmihevEQ6LpkxERyPxzUZk
 toOA==
X-Gm-Message-State: AOAM5325nyCdQ1rObtk0BLIm4tng/zJTDkA2xKHowmTVMp4fHfgMwU81
 YJybS0wPNps+/jR7lMC3Sn8clPFq2aMotw==
X-Google-Smtp-Source: ABdhPJyivbZZOKUrjhULpFnGL85Kq1RWyPWZh8mCvOWAEl6ZfaGjEj+g/NWl1A2Al5fQwZ5zq8k0yA==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr30388590wrj.407.1620649551510; 
 Mon, 10 May 2021 05:25:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
Date: Mon, 10 May 2021 13:25:24 +0100
Message-Id: <20210510122548.28638-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

These three features are already enabled by TCG, but are missing
their hwcap bits.  Update HWCAP2 from linux v5.12.

Cc: qemu-stable@nongnu.org (for 6.0.1)
Buglink: https://bugs.launchpad.net/bugs/1926044
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210427214108.88503-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fde..fc9c4f12be9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -586,6 +586,16 @@ enum {
     ARM_HWCAP2_A64_SVESM4       = 1 << 6,
     ARM_HWCAP2_A64_FLAGM2       = 1 << 7,
     ARM_HWCAP2_A64_FRINT        = 1 << 8,
+    ARM_HWCAP2_A64_SVEI8MM      = 1 << 9,
+    ARM_HWCAP2_A64_SVEF32MM     = 1 << 10,
+    ARM_HWCAP2_A64_SVEF64MM     = 1 << 11,
+    ARM_HWCAP2_A64_SVEBF16      = 1 << 12,
+    ARM_HWCAP2_A64_I8MM         = 1 << 13,
+    ARM_HWCAP2_A64_BF16         = 1 << 14,
+    ARM_HWCAP2_A64_DGH          = 1 << 15,
+    ARM_HWCAP2_A64_RNG          = 1 << 16,
+    ARM_HWCAP2_A64_BTI          = 1 << 17,
+    ARM_HWCAP2_A64_MTE          = 1 << 18,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -640,6 +650,9 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
+    GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
+    GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
 
     return hwcaps;
 }
-- 
2.20.1


