Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45E362194
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:00:21 +0200 (CEST)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXP1A-0003yw-5P
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwq-0007Jm-1y
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwo-0004z2-Eo
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso3060841wmq.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/ScmGNLIKtp3C9GZkcmISznCjlb972d3f+b6c16HTs=;
 b=koTvjzYQFxb6Pi3OcHgnhbwe+9TZv/D0dhLdyUxXdicxAEiMnadKN9toJP3XsiBUCv
 FsRE2ISJ37KLyTIfJ+D7V/pCS4eNQCnazUCezhFyyyGOXTwLXolXPhGPA0CMjo9lyaIM
 Fxfr3s0xQlEN86dBKpabj+/2RkEH6Eja2JNbDrhBs+VdR6/wmNc8g0w0zeW41mL5Yo07
 Edfn7+ys3DP/0AUmDq4WPkyVUumV+EC/WcNqmpHfCQ1eSDmEZqSS6ErxjWpdp4WPy+jh
 Kyu//iWc5WUBxAlDevs5OLLjE015XiQ5AcOccLV8oTyhwcFwOJGqFdfLMAgjNhANk0Z6
 R6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/ScmGNLIKtp3C9GZkcmISznCjlb972d3f+b6c16HTs=;
 b=GjT6SzyCUxjR1wYAwoxOhDNrpxx6OnwxWM2FsrT4DcN6Ig9xeUh84KF8IgLeul4BqL
 9vLp1zr5tb/qIj6e2hzW0XkCfJ1wT0gFQ+BR9o9qOmaxSYnl9pJnh62qCYP3e+KPM5rq
 28usvaf67hs8ntJpNt5FFGuaEPkErPnfm05YF0xZI2F7CTYc9F55FUmqljAlnok2xE0n
 +mODkYpEl8fyBKrrCahUgfa6KSwNumiPAZT2bRXi+uCCU2gavQzaeyBR/7nuYih2x+bY
 ei9Kakgx0zfIQY+ZTkl8ppbN1fadPb7X1m1T8sVyZWMOmijohhJproQiYwU55nt6y6nc
 LIoA==
X-Gm-Message-State: AOAM532VLxVeezklu8YKqna6ldchvm9LpsvyjSFpRqFzH/WXHJNkq8sQ
 PQoosd8VkDepKu7WR+dVnxsL72Ia9nR31Hxn
X-Google-Smtp-Source: ABdhPJxGuWbFj2hQFHFR+TNE5PxgyLKsHoCJ+79w5vAwzhvajpCYYjJDDvxkyByfkgnRmG8MH6YkRg==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr8132216wmq.6.1618581349218; 
 Fri, 16 Apr 2021 06:55:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 6/6] include/disas/dis-asm.h: Handle being included
 outside 'extern "C"'
Date: Fri, 16 Apr 2021 14:55:43 +0100
Message-Id: <20210416135543.20382-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make dis-asm.h handle being included outside an 'extern "C"' block;
this allows us to remove the 'extern "C"' blocks that our two C++
files that include it are using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


