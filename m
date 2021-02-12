Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CAA31A4F2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:06:15 +0100 (CET)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdle-0006Is-KK
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVN-0001am-TK
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:25 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVH-0007ms-SS
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:25 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l18so152561pji.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=fgYAreW46BfTrD1g6OYtT16Z4CahP/7wRBBPS7YgTWoAfmp40oEwkMsBNywXZOvPN4
 o378e4kvTITvxq+JXtGYSd8iLM/N1rbnQX94BTwjRHz3SeJ61ong/oVhQ/IBfWUkruGr
 /gjEI1PAOVgzYH6WDa3G720/Wytc3wQuKhmnWvwPH3sSHc6r8BK3AG3giRDyNeZcINid
 heSEXfYDRPK/RoIpcU4u3llLVqCiOWXVAzMJA+GMQmlHlGb7KZIf/8C1ICjtG3qxjEJJ
 dblkpvI3h/x+xbxRoxxgkDHak/nkxLWo7Yito8z7bmmFG0JN7u34gFxvhNgTcs/nhqGu
 UaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=bRoGfqwwEiAFTfR8C8Bsvgkp5m37SyZ40EDxtIUKOanjtO8ZTSRm56l7vAPUaJ8Ay1
 6PEOR2b1qpiMVAP8AwzmK0WFx0HwwJdZv3wzTSsXTK9xWR3HT53ajk7DUaeVVInQ7+bJ
 mIDBUch1n4pHSaUabLel6M+RnhGiO3sc908Kycd5R/MYHkWyGcikD1XOWbQDDW5Qdvxk
 AlWXZx46plG8sHe+GvbEbF+//KESQP+4qMTu63NSODfLh8y16F9Hnxvry5PPRs77MVi2
 wSeNAUCrgWQDDafB7/77AwYSx2QbhcUXX8h2NQ6CNaxfZWq9dUKbqge1K39pZJ/qk5NU
 whyA==
X-Gm-Message-State: AOAM531MP0EYzbk+I5nekk/XohF4Zb5aba64th29zBA3qUKi9W053t1B
 KctqajJxN6Qclp9SDbriY7OQ5U5VTVOASQ==
X-Google-Smtp-Source: ABdhPJxqF9zcrEgDoxUXG+mxd5NR1rbsqaEL9G/rCxJHcUSMLufRiXaLj/8mvAacni8fwF4syASiPQ==
X-Received: by 2002:a17:903:1d0:b029:df:d098:f1cb with SMTP id
 e16-20020a17090301d0b02900dfd098f1cbmr4004610plh.49.1613155755370; 
 Fri, 12 Feb 2021 10:49:15 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/31] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Fri, 12 Feb 2021 10:48:40 -0800
Message-Id: <20210212184902.1251044-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


