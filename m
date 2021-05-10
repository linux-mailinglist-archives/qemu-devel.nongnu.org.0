Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7296378C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:41:58 +0200 (CEST)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5ET-0003dv-PH
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zB-0006JR-NX
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z7-0003HB-On
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11040499wmy.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OR9pef3HduyOmvWH82pNcRMO4dLmxiN0+TVKetu9P78=;
 b=K2oagKTxhtSLw/i+ufp40hNXRveWuaKvXfLyPvThCK4+y+etStfDhYHtnKG8wmNYae
 DRfOxLcjRT65ICBMUWRgismjDoMS51EkcDOGJ8ZTInfgM8CPgf6xeXggiFJNAZ9O4+Lb
 zgVswkzGr2eH4sQMX8fdoBdRnw496zNcQH+v/BV3DOslysj7HgYaTa+ZKhQa06Wqlk2/
 cvXyBvWWXdUN0KWMmpsVOmFACa9CFFBXuDRefk8svl5S63uSMAWzPmoRPjGPltIzrAj+
 Fdda1xXaaLxwF72WGW26uxtHqZv6VQilmjKsczznyXRqlzECyPNBbD9WnZD/VZ72NRAi
 MhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OR9pef3HduyOmvWH82pNcRMO4dLmxiN0+TVKetu9P78=;
 b=lyAsWaeIE8ByavexHsuHYqKGVVQJ8RUs9r1A7IZEPmRcDxgV1spqff0WzP9xXMM9qB
 ZBy0tAQ848gjbDzyIsXzY5hnnS/H81dsA8jUpx2YJ5gd1KQFi62/czr4oZkdC8vXwPAz
 cW/4L23F+u/SR97GHoGDMMvUjpZPjMH/Xj2otLnyMTTnp1P/mWeIxP96DcDGTYr/AtvT
 CkFQR2lHTHppt3rk0i//xyuUsOVo7Q+BA/dw0Chhzq2+WrRf6BIUHtJ7Rw4/wrYblqZs
 n0MrENOjpS/OTKTzGjToYLD17gukeL0Qzbseacl0WAEG5ZFHzo7R5J5vEIknOv8iqdEd
 +gwg==
X-Gm-Message-State: AOAM531icx+FKLXA/mtvg/6U4U1E95QF9Rwgipt7WORABg0ysWjfFSl2
 xUQXMTkr8zit8buMYFe1pQ87yaoQHrHeWQ==
X-Google-Smtp-Source: ABdhPJymbjcAYViTMyUQdvmVZpVzBqGKIApq8YFcoRVYuPEa5v20ASKUlW8lnqdLl8+sdyzudU0rYg==
X-Received: by 2002:a05:600c:4998:: with SMTP id
 h24mr36808508wmp.10.1620649564379; 
 Mon, 10 May 2021 05:26:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] include/disas/dis-asm.h: Handle being included outside
 'extern "C"'
Date: Mon, 10 May 2021 13:25:43 +0100
Message-Id: <20210510122548.28638-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Make dis-asm.h handle being included outside an 'extern "C"' block;
this allows us to remove the 'extern "C"' blocks that our two C++
files that include it are using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/dis-asm.h | 12 ++++++++++--
 disas/arm-a64.cc        |  2 --
 disas/nanomips.cpp      |  2 --
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 13fa1edd411..4701445e806 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -9,6 +9,12 @@
 #ifndef DISAS_DIS_ASM_H
 #define DISAS_DIS_ASM_H
 
+#include "qemu/bswap.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 typedef void *PTR;
 typedef uint64_t bfd_vma;
 typedef int64_t bfd_signed_vma;
@@ -479,8 +485,6 @@ bool cap_disas_plugin(disassemble_info *info, uint64_t pc, size_t size);
 
 /* from libbfd */
 
-#include "qemu/bswap.h"
-
 static inline bfd_vma bfd_getl64(const bfd_byte *addr)
 {
     return ldq_le_p(addr);
@@ -508,4 +512,8 @@ static inline bfd_vma bfd_getb16(const bfd_byte *addr)
 
 typedef bool bfd_boolean;
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif /* DISAS_DIS_ASM_H */
diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index 27613d4b256..a1402a2e071 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -18,9 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-extern "C" {
 #include "disas/dis-asm.h"
-}
 
 #include "vixl/a64/disasm-a64.h"
 
diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 8ddef897f0d..9be8df75dd6 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -28,9 +28,7 @@
  */
 
 #include "qemu/osdep.h"
-extern "C" {
 #include "disas/dis-asm.h"
-}
 
 #include <cstring>
 #include <stdexcept>
-- 
2.20.1


