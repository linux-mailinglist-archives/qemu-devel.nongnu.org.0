Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DC30E312
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:08:30 +0100 (CET)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NVt-0003gT-42
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NON-0007JH-Ke
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOF-0001Z3-2I
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id a20so235012pjs.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=v9GoRtutR3idBBXtfxTizd1A4cp0GGn00gTm2PA31jYYWTUZgAfwlPmtI9VD2jFGTC
 s2kp7kkjbYvTWeljhoQduJ+r+Kbbos+BLNjft6lIYWYrZmAfpthfrhsJn5Vnq1eEcr2W
 tsHRqJM5D2sLgAZp5AQr7dsFf2JebIvaA0FbtEDHn38R1fUQhe2gEEf/uTWh1UAs/67Y
 lI5dW6cRUGqPrH0zfydeALs8a/JnLC30bsP9nPjCdQHC035DZtaUMoUdtHogzEIVKdv5
 fZr1suxFvQ86+1LM8GHX8KawmriRIrEKEu4NTiVBWTAmfq3ORyl6K7ZSSp8TdMdYN5OV
 hupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=rdx+Kvt5YyVr9ZBlE7KOTTCbYFOdxtzOKJaCJcy7JENx5v2GoIn8zbOIDVBdXSOTxI
 itg4iLGikR6KYBGIH37aYIjU0DVZOlodaXIsWnxkMvx4nBtye4Essy0aJCO2WMU2F0dT
 vWRoPw/TO5I2tc1KAS3SdgMj55UAUpD3WOcl6/CFC8UUXHiUn3jKTjhgBzonLCjM6frt
 fVJ0JPMGGQmGguYYiFji5khjCMuqd4PagwjhtRDBdTBKZeM9XZo5YMmGsUETnbpRR5SL
 +lYKsLF8R4HTJO+tUHhZmNUdoD+GNNiOi+IqI/aUrN5txfvIu7QD4xI1eAsup/zUX25E
 yQXw==
X-Gm-Message-State: AOAM533Do6oK2MUPkWgbZFtYP1zUCiP2hU+JUEuw5XRFbNjUha2S4b1N
 aOPguGG4YdYwko6zJq4/fbwQVSwV9LE+gomt
X-Google-Smtp-Source: ABdhPJzOhrL9qCTvowqFC18MxhboRcJ22GsnR8oTAEYjqXjK7tCQnvsM5fJd5fWbbK3SDhAnBzqvHw==
X-Received: by 2002:a17:90a:5601:: with SMTP id
 r1mr4390757pjf.236.1612378833161; 
 Wed, 03 Feb 2021 11:00:33 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/31] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Wed,  3 Feb 2021 08:59:48 -1000
Message-Id: <20210203190010.759771-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b..4e6ef3d542 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,13 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
     uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
-- 
2.25.1


