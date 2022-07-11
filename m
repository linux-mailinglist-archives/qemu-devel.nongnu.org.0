Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163957063A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:52:24 +0200 (CEST)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAulq-0002Rf-3Q
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvp-0006nu-50
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtve-0002uE-SV
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y22-20020a7bcd96000000b003a2e2725e89so2774666wmj.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y9vQj24+H/subuYvXTmDhTviP3udk/OQzLlUg2NVuHs=;
 b=BJDMN9ZfTw6KR0OPbAAVvWMoTF9ljj+EQTUeSm1/RvbmUKYwk7dR66sEWbhSb3ikrF
 1kXPazJMk5Baa6lfl+uPy0IiBNja36tLTdnSUoNkq9s+ziZ7I7LGqMmyAVk3yY3k6bXP
 5ULBF/RR0pkNda99LVMCUzMY2lTeXFKd8ktOptK9bpbogI2fcVDk/Y+5wpSXXaBEJAME
 NERskgAKY+GY33Tsx5OPsINNNP6uLYh6qTt8awkS2RFezO0KrrBrsdsKRQIt3XWLFLJc
 q6egwmw8RperZEO5biP+LuSrzhWZHxJnm+yG7VFRDb0PZj97+CyfRC/ZnbczWuTnqyIj
 mCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9vQj24+H/subuYvXTmDhTviP3udk/OQzLlUg2NVuHs=;
 b=JOepFcpHYvdu8tFnDQoogvcGm4ItSH9nR1TkO8fp5i+xlSjkUab4Ht2SuePPFvZcX0
 gZ9jgCfLnZarrHlLW0q6dM0jZi2LWWvr07bqRGuHRfD3tNzcXF6UxzeTZRjXsD34An6D
 riMWX/bATrAVkpOBYwfjwFngiMow+wRKtz7xQlljIyE2GqIkPhzfTdZFPKc3ubVXqfXE
 oJiWBGNDNDA7XtLeGTNgk1HErqqXHAhwc7oQvA333HDCZsnOhe8oVmE4uiUOlrQcOw+q
 b8np7N/Q0uBn1mJOXawyoDmPq2mKdaDK9+XD8xFR0vAF2zFNC2njaSVtAy25ylSFckE6
 EdeQ==
X-Gm-Message-State: AJIora+dUFDQ+AY0VsrtkjywLN5FT5VrlqUDwXqMDJqHo8slxHYOG3kx
 +brOwzukAbVJaO0MEXOcAdb5bo1nLmFG+g==
X-Google-Smtp-Source: AGRyM1v6DwA4932m64yHso+KQhFCr9lshhpkGnVzsZkLwQ2viNThZk014EY5IrYsBjO5ipSvA/azyQ==
X-Received: by 2002:a7b:ce04:0:b0:3a1:92e0:d889 with SMTP id
 m4-20020a7bce04000000b003a192e0d889mr15652351wmc.131.1657547901545; 
 Mon, 11 Jul 2022 06:58:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/45] linux-user/aarch64: Add SM bit to SVE signal context
Date: Mon, 11 Jul 2022 14:57:40 +0100
Message-Id: <20220711135750.765803-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Make sure to zero the currently reserved fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-36-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7da0e36c6d4..3cef2f44cf5 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,8 @@ struct target_extra_context {
 struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
-    uint16_t reserved[3];
+    uint16_t flags;
+    uint16_t reserved[2];
     /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
@@ -101,6 +102,8 @@ struct target_sve_context {
 #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
     (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
 
+#define TARGET_SVE_SIG_FLAG_SM  1
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
 {
     int i, j;
 
+    memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
     __put_user(size, &sve->head.size);
     __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
+    }
 
     /* Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian store
-- 
2.25.1


