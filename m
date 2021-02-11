Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C930318BD1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:19:21 +0100 (CET)
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABsO-0006lg-AR
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ2-0008DK-DI
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ0-0008T8-Oi
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id v14so4071490wro.7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C5mj6NRrt0u/DreoETKEeLg2CeSxNg+EEqC7ggdCjng=;
 b=itf6PiAiojqn65r7+GKQsdtqZBz2FHfuvdH5k5NvkQ4MJyqTVj1qDeCBnt2TfxIiHz
 F8zWDpMjqa1+YS74YG+ufegp8dV4k0LUNYoBQquZ8ALJ/Gbc/H+OXAEhVCSyZo7fDTXB
 jw9c1OHi7YmvZv0AIhcKM01SSnzCsh4JKMFgKWBr9sfEBV8yped4wLZb0PDE4PlycVIc
 dYClkclw8+JaM0CTQZY4f+cMWyhmf5DeIkmMLawj7z4awolhT/Kh1k5lG/wD6/akob67
 orpheQfkkUr3VEcDbaHrS+NjKdpdZlQgqG8tOHjcDT4DF/TpFLFZWe8DY+y4+9ni9rjP
 9p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5mj6NRrt0u/DreoETKEeLg2CeSxNg+EEqC7ggdCjng=;
 b=AcRgy+4Zp8ixor8G0iRdm64/YUCShBpxiTLlASyhfMnyOcO65sHnM5kQYlWSP4yLng
 Cd4ZLotbh6aJV+dijrZKvJXfTjBjWr/Y2MdTHbOCihJKC+PDXKe6aeSd9ebcrcIm/JVG
 RHRAbZZL7X+Avg8nNtpMaPzWlLm7uh8/k7hb0bdnnieoldZCAVmKfafZaOrNl+HL+7/h
 EnDrhtYPtPTROsMttJ5XLQ0KK1pw1AyvbCy38P517UNjeWnst0loeGMBdJ3LrZ8Iflvx
 +p17gvBsn2kVW6TtkU6V8u+738JppvtqpypkhqY9DXTeSCrR/egV6C4fHruJl08hDzRv
 V4kA==
X-Gm-Message-State: AOAM5330rDT7WIGACcnuuUbvLWzPS/hL36mkHzlCXCtWpimkfJrsyPjr
 sUbDFX/Filh2Ki5NFAaZFRjMZ/ZZnETvFw==
X-Google-Smtp-Source: ABdhPJxemAGwdzCxfbeZY3UNAbSJi9NDPnHoDlJwMWELDmXSzKhc24NpoFHooBw30UowQ8PaXkjx9Q==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr5770958wrq.51.1613048357431; 
 Thu, 11 Feb 2021 04:59:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/45] exec: Introduce cpu_untagged_addr
Date: Thu, 11 Feb 2021 12:58:35 +0000
Message-Id: <20210211125900.22777-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Provide an identity fallback for target that do not
use tagged addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba001..d9dc1de414a 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,13 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+#ifndef TARGET_TAGGED_ADDRESSES
+static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
+{
+    return x;
+}
+#endif
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-- 
2.20.1


