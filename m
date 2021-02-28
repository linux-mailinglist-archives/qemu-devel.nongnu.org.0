Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1732757B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:09:08 +0100 (CET)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGW7X-0007ef-Lu
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPw-0005s5-3I
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:04 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPn-0007mf-EW
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:03 -0500
Received: by mail-pf1-x430.google.com with SMTP id 201so10276447pfw.5
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lNlZW0IHz764sQsnKZvud5t74gVw8oF3THem8nh74y4=;
 b=S13mTC+SP4xsr5wKupFpRYuL/fh4s8qzR+iNDi7qhxm8pNLf3Y1VO+Lnljm3lSQ/Fb
 +FYvjUP5yzTEDPeSKHJCX/asnSnft38CLB0NgTnkm1laNYFBxYoAIikZGxBY6sMT3thp
 E4ru1oupGRnloK5yKENFNtc2Iokmz/FdBhVtrOWRrXvWb2D5nBAwHLVv/EzS3GKtjpPp
 e1hd5CU67BPLdVNBSfnLTjIRdo7jG1GswhRckgZSsUi2znW9Wkw8IOsTQ5tZTGLTEU+6
 72v+gZTE+xnsvBz4Z1qp6kkHgX2v8Vzs+OmbE48vaQ72Z0n1z03p3Elgeudcm27n98I/
 jNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lNlZW0IHz764sQsnKZvud5t74gVw8oF3THem8nh74y4=;
 b=ml/XaXHQkcAWbZP2nM1S52I67mBT1Q51EbgQn8zZ9vc9JSQsM6eYeVDxzPYzzJ8EEn
 rseaQ8ZGTDtXN8+3UI1xiL4DRYJA2XQIu/BPia0jPZvLTfPVbNZ08pUl/WPKY153YY2k
 4g4oVd+oIncs5bsCn92MRV7U6GtRdZDkH3QGn8e7EfGqjrdInzZoAfYpEoHTuIsEDZ4T
 ReWfYkhH+YvEdw9Xaxvwki+VbZpsMcHvHFaOnD0ZL38bRbDcClpmAbJ3HYVw1z310AkG
 hAHRVqkVvDdjEKB5DVUUS8TS8mvCxqJr83bQlBE58cVI0wHckqB9Q+5H/SSO87ZBKpnQ
 iqyw==
X-Gm-Message-State: AOAM532DKlVokwsORCGAp5E+AA3vpzwK0V3r5NG+s36fzaCS0hoD3suN
 IK3pTKRsW0gbwyzVNNgAPqSmAsmYieZUXQ==
X-Google-Smtp-Source: ABdhPJy98X4RNJBQVP0nWjv1y8Fmt7sMYZ95EUGTKImLsgo45sUqOrLZHy+lHHXewelERjZS5jgRXQ==
X-Received: by 2002:a65:5288:: with SMTP id y8mr10558188pgp.105.1614554634087; 
 Sun, 28 Feb 2021 15:23:54 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 38/50] target/i386: Remove user stub for cpu_vmexit
Date: Sun, 28 Feb 2021 15:23:09 -0800
Message-Id: <20210228232321.322053-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is only called from tcg/sysemu/.
There is no need for a stub in tcg/user/.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h     | 4 +++-
 target/i386/tcg/user/svm_stubs.c | 6 ------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 3d47cb83cd..e848c3b4b9 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -81,10 +81,12 @@ extern const uint8_t parity_table[256];
 /* misc_helper.c */
 void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
 
-/* svm_helper.c */
+/* sysemu/svm_helper.c */
+#ifndef CONFIG_USER_ONLY
 void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
                               uint64_t exit_info_1, uintptr_t retaddr);
 void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1);
+#endif
 
 /* seg_helper.c */
 void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
index 48a43bdcea..db818f89a8 100644
--- a/target/i386/tcg/user/svm_stubs.c
+++ b/target/i386/tcg/user/svm_stubs.c
@@ -22,12 +22,6 @@
 #include "exec/helper-proto.h"
 #include "tcg/helper-tcg.h"
 
-void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
-                uintptr_t retaddr)
-{
-    assert(0);
-}
-
 void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
                                    uint64_t param, uintptr_t retaddr)
 {
-- 
2.25.1


