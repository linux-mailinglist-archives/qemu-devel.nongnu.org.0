Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2C4B1B55
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:36:43 +0100 (CET)
Received: from localhost ([::1]:50008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKrZ-0006mu-Nr
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:36:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmh-0003rb-9l
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:39 -0500
Received: from [2607:f8b0:4864:20::430] (port=33299
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmf-0007Gm-DD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:38 -0500
Received: by mail-pf1-x430.google.com with SMTP id t36so2649569pfg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uh058XUts6HPkXe97baHsy8/Ac7JrSk6cgbCWbIo3VY=;
 b=wdT5wqOHtCK00lz8qk8V6QiN3qsPta+212aIV78F2/wVMq3GHMnJesZDipXC5KqlAF
 vlUHhveWbf6k2jf1clTTVp9cW9F/JCAKSzvRGSJEYkweeS1gyIzXAA3nuuiLL67QVN8l
 nDcrQxZ9XbbcqaoGd2YTpfd6a6+6kZ2xzB7CFT0bO+nz1esH4H7M5HUg2nlUvxShpWrK
 QGxPs/tjoQxXQ0b/HtBvuKt6o2AYIFORKC/2j8RTmbj/q9RvHMGItgYqEXNxX/fJSbfR
 GAwAl2VGAnwNbPbkNSUo9A1alMMpbuMvZa/BE02dnwj2iA27tpKpxLG7WaYQ5/0b715H
 1Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uh058XUts6HPkXe97baHsy8/Ac7JrSk6cgbCWbIo3VY=;
 b=UnXSmSiJgapENL9rMWkkoOjhyEX4DyHRTcd2983tRqxLFuGCkCyXsMqSzr0U9P9szt
 falTs4nt6OVK8U+LzbIn6/w2GZzO4cSW1qnDtKh9laQQk7T4llCLtvr2qWlL6jXukTuU
 ZgNwLuLOpDGhmXqixdM9xCmX0yx6+GVyeJNHkA7oXDf/nTuGDLDwpKf+1mADJiJk2JGr
 0xBdXilSNA1XSKKuelCh2211XqKFXhsDShaxTwtrllLotd5uL+yNQAIMFt8lSlxrfME1
 fT6Zg9PPWxI8jqWRkjdUzvGTS2i2QphUA/NhqyAD5rXW+hCPRyaQJIOViSpzwEXmKbCB
 2iJg==
X-Gm-Message-State: AOAM533WLMCExIeTfBR+ZHN0kcEVYrGbQu6xMNsf9oZICedIFnGETCyx
 OPUjyZR7scyYWbmdZRXncRQqxwMFSJArd/TO
X-Google-Smtp-Source: ABdhPJyx7EI5+r5rW+JBfRTFm//wEK25KEFf80+8Slr0ueGbZXWQEtMZo4raQjSClMF1vYEwisMQsw==
X-Received: by 2002:a63:64c:: with SMTP id 73mr4441615pgg.360.1644543096015;
 Thu, 10 Feb 2022 17:31:36 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/34] common-user/host/sparc64: Fix safe_syscall_base
Date: Fri, 11 Feb 2022 12:30:26 +1100
Message-Id: <20220211013059.17994-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Use the "retl" instead of "ret" instruction alias, since we
do not allocate a register window in this function.

Fix the offset to the first stacked parameter, which lies
beyond the register window save area.

Fixes: 95c021dac835 ("linux-user/host/sparc64: Add safe-syscall.inc.S")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/sparc64/safe-syscall.inc.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/common-user/host/sparc64/safe-syscall.inc.S b/common-user/host/sparc64/safe-syscall.inc.S
index a2f2b9c967..c7be8f2d25 100644
--- a/common-user/host/sparc64/safe-syscall.inc.S
+++ b/common-user/host/sparc64/safe-syscall.inc.S
@@ -24,7 +24,8 @@
         .type   safe_syscall_end, @function
 
 #define STACK_BIAS  2047
-#define PARAM(N)    STACK_BIAS + N*8
+#define WINDOW_SIZE 16 * 8
+#define PARAM(N)    STACK_BIAS + WINDOW_SIZE + N * 8
 
         /*
          * This is the entry point for making a system call. The calling
@@ -74,7 +75,7 @@ safe_syscall_end:
         /* code path for having successfully executed the syscall */
         bcs,pn  %xcc, 1f
          nop
-        ret
+        retl
          nop
 
         /* code path when we didn't execute the syscall */
-- 
2.25.1


