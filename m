Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7E31A4EA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:03:32 +0100 (CET)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdj1-0004nl-GC
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVU-0001fl-NV
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:32 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVH-0007mw-SD
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:32 -0500
Received: by mail-pf1-x434.google.com with SMTP id m6so81876pfk.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=ov1xpKiYchnKJNCRkQiuG0GwRW/R1/TQvoHkpfqt3fWL8c3kh1O+J89GJLV2j336jk
 ynGY+0vJyq3Zdtl1gLqSB03nrslhcfOQeBRb4FCYRWDnH0XKJLRS00NXqFSnj2m28u4a
 IU4dE9s04IJMEqmkS2wM3EZziwl7XZfnqt5TZxVrIYY4rWXziZyq/+Twjxaq3T9yOchi
 oDA6Uqiry3JrfAHajOZgTW/SF4NXzEOLLbfiJn+/AMBh4s6iVJuSyBpW2H0BzkjDdyPk
 yNFxHYSdcMkPKXTIAM1UH7UJcse9dev9AJCQKglDmn90tftvtOx26cy/LavWLwNLmxgk
 XDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=lR0EyGKRtbQHf+AFPHl+rmFawWsLNCPSrCYPKl4fiPE/Ms6nTpP9isMeq6+p0sOgNh
 AfUDw3AUBKhyE+C99s2fNevIMKAoIAXoVs2NjaVpggLnGD0c5mEW0o3i+xJm1Pd7d2Ws
 I4ZiInrUTuQ/sFdj7cSGeB3SBGFDsJmRIhMHMbDLMaNnmyLOBWrTR8bBiDBQZYOOfEPD
 28KUyAKcbPRHbPV5U1W3Srb3MyuxNqYCOcglJqB4u/JlgNqTTQLYQIuNbLMYk6xNJGW1
 45E9MYr2gHptxVI0brWeBfIGV5exJD1cWJTcHEj7VAPUwOB22XowBeVx/QRUbkAJ0xeH
 9H9A==
X-Gm-Message-State: AOAM530m8icKNtZ5OVrUg6eFzcGfWqGpE6+z2RPbruLAzc4bC4OZX9Cm
 3sRUf6HUKBzAkbGxmRfsVUrpQHwAurL1LQ==
X-Google-Smtp-Source: ABdhPJysVp6xkRoUR2TmZT1anpUdaMzr0sDQYqNnKBbY5+pAznWryT9g6XrORD1YUICbYvNMOUcW3w==
X-Received: by 2002:a65:4942:: with SMTP id q2mr1629888pgs.34.1613155758222;
 Fri, 12 Feb 2021 10:49:18 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/31] linux-user: Fix guest_addr_valid vs reserved_va
Date: Fri, 12 Feb 2021 10:48:41 -0800
Message-Id: <20210212184902.1251044-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d542..e62f4fba00 100644
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
2.25.1


