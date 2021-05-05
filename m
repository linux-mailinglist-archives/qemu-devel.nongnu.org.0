Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD28374AEC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:59:43 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePYU-0003Ph-I8
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lePQT-000589-SM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:51:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lePQS-0001yM-1l
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:51:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h4so3396609wrt.12
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg4oHiP5yTuClMKy0Md71jLBxmMfsqd53OGzJZO/D38=;
 b=a96Vw6UeVh+zJ4oGNtSRQj40RdWZ+2I587eZqxY2HWcbDQQLkk4poy4uzrnEO7sPBJ
 eGV0BSauRpNZC+YFOvj92dxmhct6L5UnPAUqQttKxuxHF3Rogbs5gPsg8H/b9okEjBfr
 2jSzheshZk1RP5GBZWcxZLUDLYyJ2bZrqATyHW5lY2kNinseGLtXUz1Sj+pVvRv2bJlv
 0YE/DezPpldEWQMwsjevGfNdBupDDmR1x64AD12sCH6hnHbdk8SpVQTjR1ri8vr1w5J3
 tv7zwJjtRvkqfoSPXxkd6bdzO8ZpNpkW0BT+an2HtnPk1aBjmNyYfPs4yIwgqLLBk1kf
 XASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pg4oHiP5yTuClMKy0Md71jLBxmMfsqd53OGzJZO/D38=;
 b=XkUEoTkbtad7fWDJLIuIt3r93E2AK31+HrYfWMlu2L6fZGaaCgVKnsDDs7VH6c6vbX
 JoPtS1ED3qEe3TR1vDlI/ODnLMzvS7817tL0feWpnrbgQNoW2EuVFkMCMQML4MAC0pP2
 h72xYocenjjeJkxSquFqvgMUcyy6haxN7Ws5Hpr7EegOPcM/VvpUoPn4SQ7hc4w8XktW
 gvxf5sNDBX2AIXJcHyZRmXeGpxOmAag0SQ/8kSEaxXpsJlqMW01mYQeymahi6q6dk2dK
 fdLkgfsqbkDGi1Lf5WNUoZVz7/ZlxVk3U+gpWbHmZNhkFXzL7RQaemUDvn+qvQqWKr4k
 ZkEQ==
X-Gm-Message-State: AOAM532EJTyJTAU6UMyw1fy/H/YEBIENcL0ERn5VPwQS4on+8Cmg4pWH
 OFiv2qTHB4zEZ0zOQu5Xy3NpdFrmUCHXKg==
X-Google-Smtp-Source: ABdhPJzoHz26Al9RavXLv94HqnHWxie04eUV0lbL2CkzAgsE74zi7FxNnR7bC27fPUynrP09AUVVGg==
X-Received: by 2002:a05:6000:1143:: with SMTP id
 d3mr1202995wrx.404.1620251481679; 
 Wed, 05 May 2021 14:51:21 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id t17sm691954wmq.12.2021.05.05.14.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:51:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Fix potential integer overflow (CID 1452921)
Date: Wed,  5 May 2021 23:51:19 +0200
Message-Id: <20210505215119.1517465-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the BIT_ULL() macro to ensure we use 64-bit arithmetic.
This fixes the following Coverity issue (OVERFLOW_BEFORE_WIDEN):

  CID 1452921:  Integer handling issues:

    Potentially overflowing expression "1 << w" with type "int"
    (32 bits, signed) is evaluated using 32-bit arithmetic, and
    then used in a context that expects an expression of type
    "uint64_t" (64 bits, unsigned).

Fixes: 074cfcb4dae ("target/mips: Implement hardware page table walker")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/tlb_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 259f780d19f..a150a014ec1 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 
 #include "cpu.h"
 #include "internal.h"
@@ -659,7 +660,7 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
         w = directory_index - 1;
         if (directory_index & 0x1) {
             /* Generate adjacent page from same PTE for odd TLB page */
-            lsb = (1 << w) >> 6;
+            lsb = BIT_ULL(w) >> 6;
             *pw_entrylo0 = entry & ~lsb; /* even page */
             *pw_entrylo1 = entry | lsb; /* odd page */
         } else if (dph) {
-- 
2.26.3


