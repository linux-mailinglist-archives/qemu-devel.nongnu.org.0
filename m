Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71E41C573
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:21:46 +0200 (CEST)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZWq-00045j-5Z
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI6-00071o-0r
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:30 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI4-0006G2-Ae
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:29 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so2733454otb.10
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeHNvhPeuZfmulgUe9ozzImEdGk/YkGYzR1u2KyMGGs=;
 b=tzfUPuFwDIZC0sVrkWiKzmHYuihHmgcxLqmwPO47eI1S3wIuU/Nl/TiVQxlYIRxjA6
 YGTlZ+qYXatq4nCdERPHrzhmPxK+ayunz887oXnMOKzUSfRy68jxg2OMqkXWCJf9Dcfo
 78JozUtLxzpq6qJdxjuPEFeDPLWaAJu8jTHlQWPYHb6HNnwm9rdMb1lvMz+qbX0VvO3E
 /SCvrLcVZFlTzWKbZDoj/QwEvj4jc98L2v68pDRSO2tc1nnV6GniHKjFRlWdSLMVbQBi
 i+IRduT5I8hWe0FmnxoSm0xsxOiine6lHA0eRTwuBfO7IAjMJQ7pQ5ihvD5m1jkue+qE
 C8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeHNvhPeuZfmulgUe9ozzImEdGk/YkGYzR1u2KyMGGs=;
 b=oKx0XIDNVWvosj9a41m+Hgb8deEPUtLTBjUJcHKU6g7ifTK1pHN9FkjysWOzGIlOfF
 PFxOcfnv6cu+0XPW4iKPxEIKUXcoLTyZbhBFaFfWngvZZjdpAuiUfP+ITBS1C+nMAzxk
 hj190RNts5NGH+5F579AIkhdJPp76eoGOiZCmEeOaDDCiyA9QtRvxIsf6ubvw2UJXmly
 GycR5KIbeYfDB8ncmEK8vIjL+kB9SyB24A70hawmDZVfKCXMAQcjOhklsf5DBZYpNfgY
 smdV3ANwWfPpsAzNsBvKh6hl9wIOrFYIlnr9DRYrvQZ3RjxpIA7B61S0PeGJRwyvPdyU
 GGOg==
X-Gm-Message-State: AOAM5335C8GwUHfTS6Iz7nc24pQLTiQVFf73FB++EDFuwXkQYXBWWc4z
 1XA1WeXFv/s79jzVgbR1Hzm0LPXgpvKprw==
X-Google-Smtp-Source: ABdhPJyJW+2srd5sookvSB3O24eVSu1o7S7uIiNDr1iGB4Zd1+H7JWGr6MtmkEgfTZm+4VLoGAg5zw==
X-Received: by 2002:a05:6830:4095:: with SMTP id
 x21mr4655146ott.352.1632920786837; 
 Wed, 29 Sep 2021 06:06:26 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/26] linux-user/microblaze: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:40 -0400
Message-Id: <20210929130553.121567-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/target_signal.h |  2 ++
 linux-user/microblaze/signal.c        | 24 +++++++++++++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index 1c326296de..e8b510f6b1 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -21,4 +21,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MICROBLAZE_TARGET_SIGNAL_H */
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index b822679d18..8ebb6a1b7d 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -161,17 +161,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Kernel does not use SA_RESTORER. */
 
-    /* addi r12, r0, __NR_sigreturn */
-    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, frame->tramp + 0);
-    /* brki r14, 0x8 */
-    __put_user(0xb9cc0008U, frame->tramp + 1);
-
     /*
      * Return from sighandler will jump to the tramp.
      * Negative 8 offset because return is rtsd r15, 8
      */
-    env->regs[15] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp) - 8;
+    env->regs[15] = default_rt_sigreturn - 8;
 
     /* Set up registers for signal handler */
     env->regs[1] = frame_addr;
@@ -220,3 +214,19 @@ long do_rt_sigreturn(CPUMBState *env)
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * addi r12, r0, __NR_rt_sigreturn
+     * brki r14, 0x8
+     */
+    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, tramp);
+    __put_user(0xb9cc0008U, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


