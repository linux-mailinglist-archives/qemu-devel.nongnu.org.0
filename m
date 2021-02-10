Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4CE315ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:17:59 +0100 (CET)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dCg-0001Py-TV
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-0003pO-Sl
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:06 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxs-000816-99
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:04 -0500
Received: by mail-pj1-x1032.google.com with SMTP id fa16so108196pjb.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=ZXIo0Pjr+pFWmqC9A4VgXWJ3DQndk1+CuM37zd/Jnw9ZxgX0Tx00jTvI6lfB35cnJ8
 SxvmN9QLDlx4uVZW2Br5D/yKbXy3nHrkhHS4N1emkwum9Le2szPIFoKDRzFqixTL4wUt
 IdvdKTVIc8WLMxJwfRcv5VTEmEMXwkofaH0g81apXDySf1duPHIaF+COnghnu0djU+Ad
 WTJ+oRGaWuXIV6MTj5jyDW0qU4syCIUJvpftzOnK9wMx5O+ufWbdMjRqf+1Qr484bwsJ
 JR1KkriUwMjJPNi1scj6ZAyFaAZv3IEpxc1DV2SFQFDUYBIBzczFJc2QOOKN5/oYtAPG
 Lu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=s8PiETUaQ3IdaIvoV8V7074WOncXvzv52OH11NEUId/WcZ7u9sQ1llN03RedJsBMic
 1NzT2Gqcow12G2SWjg6tCUP0KsJpsHABT/L3D7E8f4kr7rxTuIgZjxkQlRsjrp7rXpzU
 zau88A0utlicW0WNpcicig6pBd2KIblWmAurXhH8n0n1a3MaR7UEBqgYO8MDuDSLRy7E
 Hb2E+aV4BFcwdkS54Znp/YahMyT9Sh99gQ6RUEVFj/gYqTxTifSZ/TRkO7me7CP18DFB
 Q+5rmpbaMFnGWZuHHDn7bXbIEFtf3Pp70UVd+D6VmX56uQyBS6OLeZ6voSujgsn+PgmR
 X6jA==
X-Gm-Message-State: AOAM531umKa9pgTb2FlDrSS/ryLTimAqcCdwPmjR0jIoW0LUgwUQDHD6
 V2TEvXGXi3F1674xzXEr5IDV9GNYOc7eyA==
X-Google-Smtp-Source: ABdhPJwbx+LqICNiKN/OkhysZfUSg7jtXS5y5aeJQetSjnCymwIOtapUuh2hsGwTAO/gEjltDoIO5A==
X-Received: by 2002:a17:902:bb95:b029:dc:e7b:fd6e with SMTP id
 m21-20020a170902bb95b02900dc0e7bfd6emr508299pls.12.1612915357562; 
 Tue, 09 Feb 2021 16:02:37 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/31] linux-user: Fix guest_addr_valid vs reserved_va
Date: Tue,  9 Feb 2021 16:02:02 -0800
Message-Id: <20210210000223.884088-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


