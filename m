Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26531CDE4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:22:45 +0100 (CET)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC37c-0004n0-6G
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32G-00070M-SO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC328-0002M3-11
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id w4so9549885wmi.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tBK1n8R/KslhmMsEEVJsYPxuw4cYZfG8sn9avPhfmns=;
 b=s6E0owQtttnWplm49oB+sVQUyVvAEVkOVTNAnASyQNQU/5C0d+LZ/TvCkVkw41LcFs
 QmbSp3lewXB+3wAHzSPkE0lQZOKgykLS6wYj23qCZl8oj3x3wq5O2zei3yISNL6XztlX
 ZW3DPCqirEnKaOkaxazg/3cPZpAlr8vXdHlLUC4DFiMDe0bLtGUjjT7g5I6FaSdDnMbI
 fxbbZeuCtlUmH47//dbAIhTBVIKhKXy/WSlnTRc3gDMErk/WWKNfTj6Olkf4kKEekiOE
 i8pQEeRb6eh4ptJ9s3S8UNL4UPWES5yuejXGRs4Ty5Vv0G5Wx1YRT4ByheXPD+QgUcMx
 PU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBK1n8R/KslhmMsEEVJsYPxuw4cYZfG8sn9avPhfmns=;
 b=CusbIslnII2KCz9so3h8ZffQIQj84Qj5vj0G5/Xf/30iC/1BBjfxghUZO+VZTOH5m+
 iTtgv5SS/j8U/b/pv2ccu4xs1g0Y/xviV5M+trlqZV8cfnaltgs3nOErzOPgdZ405i1y
 kwTmXTAhn1/dSHrnyCHNnMXLpce8jsm9+796Vw0qJiJSO47flmswQsV3GqYyMncARZxY
 R8tNr/NDrSF6BcmlFMVI0vwZRmydTxB4+Vm7cfyx++ChCELFj6BmVZzleRV+fecOvhYG
 ZhLVA/RG5Db4nz8SQlEpKa/Es+76QHvQDNiTVa9gxD/58JOnL5j3MH4HwqEe3twWJFDH
 myug==
X-Gm-Message-State: AOAM532RfUkuqcvw4QgAurpY12U1bRS81G5/Ny8UvQ1p2zUBn3pVU/C3
 mh1qhI8Y+JoTjFYCyS7TRrwCzqN76pDRJA==
X-Google-Smtp-Source: ABdhPJy4w0PHkB0pP5Tkiro6/Yj2S5D5Skwh5s+jWobkVyz68are/r42tUj2++GjSIG4AfM047CQUg==
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr1301843wmi.82.1613492222076; 
 Tue, 16 Feb 2021 08:17:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/40] linux-user: Introduce PAGE_ANON
Date: Tue, 16 Feb 2021 16:16:20 +0000
Message-Id: <20210216161658.29881-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Record whether the backing page is anonymous, or if it has file
backing.  This will allow us to get close to the Linux AArch64
ABI for MTE, which allows tag memory only on ram-backed VMAs.

The real ABI allows tag memory on files, when those files are
on ram-backed filesystems, such as tmpfs.  We will not be able
to implement that in QEMU linux-user.

Thankfully, anonymous memory for malloc arenas is the primary
consumer of this feature, so this restricted version should
still be of use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 linux-user/mmap.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 6421892830c..aedf5345449 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -267,6 +267,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_WRITE_INV 0x0020
 /* For use with page_set_flags: page is being replaced; target_data cleared. */
 #define PAGE_RESET     0x0040
+/* For linux-user, indicates that the page is MAP_ANON. */
+#define PAGE_ANON      0x0080
 
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index ac0624f31ac..c52b60482e1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    if (flags & MAP_ANONYMOUS) {
+        page_flags |= PAGE_ANON;
+    }
     page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
-- 
2.20.1


