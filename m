Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227D3A4B4A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:39:12 +0200 (CEST)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqk3-00044L-Gy
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqex-0004IV-Aj
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:55 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqev-0006Rc-Is
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w14-20020a17090aea0eb029016e9e0e7983so179152pjy.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxSlL47QCgmK8Iv/OFfxyjnBl/oZ5mr2j/ZWvknI6kU=;
 b=nxsIGjv92sdm8ViNINgPIcps2G1dt9JkIDKiyAaCsZGZ9RGvK/C8s2pScqcKGNbyxo
 dHR2qmJU3vFQ2zT3Pt3uXnIcdufx0YMLRMDfOp4CmBjKjCNEnssMQeJrvYKZp7lg3cpx
 FmGE5xuW5+9fmBpxQa0SqTeKYG7MPn64ieGywBWK99rJ97UGsxg3binbqC6e5osSwXsZ
 OyLuIQ36kcrch5CfbDhfIH9O5KeBUVrDma021Iv6UBXhOfiBeftJgLAr98U7w2Br+GsF
 anVs8AZENYJ3xz751aqqxEPTWP3RDQjZRprIZDcponY0E6dJ0NPJyocI/pqkNn0FMLZx
 0ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxSlL47QCgmK8Iv/OFfxyjnBl/oZ5mr2j/ZWvknI6kU=;
 b=WTKQD4xlbOq7o9VgYeerlh4aXdLCr8vIo7cnLHr9G2mYJxe9iDgmTc+GaBZC0Xc5vm
 70QxLstmlDvyWtkjkNP+gopllj9EpT/tKWPjgZ//dyFEMmeQMzc4dbjtNDpB2YB0BHjz
 EqYPKl6p2DrJ4eD03F3qcGCy5mjHC8Z5ScZsT9sAlPrBHvRTWLcBGb2UoJUOJvOUs1wL
 CQLi0qxNnkxkAmQUa38ecnG2Jo3GdS9x2VeJJpxNqp+mSDz4w94v+X8EK1dkS/NyjGvf
 vE5BFmaepq21mfyPeEQDmhxcB99J4X5YcmJdMatgLVsFJz51hb9s9SmkqcdKaSfR98vL
 w4nw==
X-Gm-Message-State: AOAM5311aBEQiREh77sL4aqSy68mgx/L17BMcnxJPNUIXtgUJslbySst
 qu/5v5K0MHdioGXCbJGOQMuTOWzOn/z9rQ==
X-Google-Smtp-Source: ABdhPJxJAWi9rxrTqpJ00g4zdeCI0i5U5cbBviW3wGCr4cMHnR/mYvmIcHGGYmHv6pYyBPm4/18Pqw==
X-Received: by 2002:a17:90a:bb97:: with SMTP id
 v23mr6637529pjr.148.1623454432236; 
 Fri, 11 Jun 2021 16:33:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] qemu/compiler: Remove QEMU_GENERIC
Date: Fri, 11 Jun 2021 16:33:46 -0700
Message-Id: <20210611233347.653129-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@liaro.org>

All previous users now use C11 _Generic.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
---
 include/qemu/compiler.h | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 091c45248b..5766d61589 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -173,46 +173,6 @@
 #define QEMU_ALWAYS_INLINE
 #endif
 
-/* Implement C11 _Generic via GCC builtins.  Example:
- *
- *    QEMU_GENERIC(x, (float, sinf), (long double, sinl), sin) (x)
- *
- * The first argument is the discriminator.  The last is the default value.
- * The middle ones are tuples in "(type, expansion)" format.
- */
-
-/* First, find out the number of generic cases.  */
-#define QEMU_GENERIC(x, ...) \
-    QEMU_GENERIC_(typeof(x), __VA_ARGS__, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-/* There will be extra arguments, but they are not used.  */
-#define QEMU_GENERIC_(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, count, ...) \
-    QEMU_GENERIC##count(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9)
-
-/* Two more helper macros, this time to extract items from a parenthesized
- * list.
- */
-#define QEMU_FIRST_(a, b) a
-#define QEMU_SECOND_(a, b) b
-
-/* ... and a final one for the common part of the "recursion".  */
-#define QEMU_GENERIC_IF(x, type_then, else_)                                   \
-    __builtin_choose_expr(__builtin_types_compatible_p(x,                      \
-                                                       QEMU_FIRST_ type_then), \
-                          QEMU_SECOND_ type_then, else_)
-
-/* CPP poor man's "recursion".  */
-#define QEMU_GENERIC1(x, a0, ...) (a0)
-#define QEMU_GENERIC2(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC1(x, __VA_ARGS__))
-#define QEMU_GENERIC3(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC2(x, __VA_ARGS__))
-#define QEMU_GENERIC4(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC3(x, __VA_ARGS__))
-#define QEMU_GENERIC5(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC4(x, __VA_ARGS__))
-#define QEMU_GENERIC6(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC5(x, __VA_ARGS__))
-#define QEMU_GENERIC7(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC6(x, __VA_ARGS__))
-#define QEMU_GENERIC8(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC7(x, __VA_ARGS__))
-#define QEMU_GENERIC9(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC8(x, __VA_ARGS__))
-#define QEMU_GENERIC10(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC9(x, __VA_ARGS__))
-
 /**
  * qemu_build_not_reached()
  *
-- 
2.25.1


