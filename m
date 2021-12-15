Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52F4757B0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:22:34 +0100 (CET)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSMj-0004KO-S3
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiZ-0006nL-Bk
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:03 -0500
Received: from [2a00:1450:4864:20::431] (port=46875
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0008QL-KG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:03 -0500
Received: by mail-wr1-x431.google.com with SMTP id i22so7568276wrb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WnLnjL7txGvuWh5pOnws/qxampi6HwwdnoH/cJfxyxo=;
 b=kSkQDIV7bp7qciXWC6mrW6w1PTZkY5WH/2UnoBYvzD3WXYCFcAUwTMGiaogComQMUz
 h7YdgofuTdPuI6ySHMqDbUHatUvnfP8h/sE0Pn4D2D2xmkLL8FbB2fHYVAmMmXAgdRhm
 wHvaNDnWe4HVI5FngJ+fwcSnjcFJetMzkPWoqgfD9yd0Ogs85su/n32PT9MhAwNSmowg
 941PkEygxcczqeutIG9sDWILtsLcRfNvncHRIFHxwBxE7966t8K1tfjZDBOlTM53tBNr
 T0QlbglQaGWNPhUApQeEtUpD0kepwLcffiZlAegZShvqsdUwVQm0vbaIYc8N7jYtF2II
 1WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnLnjL7txGvuWh5pOnws/qxampi6HwwdnoH/cJfxyxo=;
 b=CiYjkBwj+p+7qaMAEw43hwpjY66E27KbSq+U2eHNl3Gdk9wFaj+I7XuLggoXc2+iCi
 jF/HLQEOtSz8j5BV5n0iEVMbsi1InbL2ZEQafed3uOTEuwFGsR5pQVtfyWKvuButCFRz
 0HHMl3uKRKrlw5xk7FV7FKKPdON+UAGaqjo3kqgyAX86k/c50RojApTXXGqiwPvXrkUo
 fE5gHxSNfrzof+DthJJVC5rbb5jkfOL+dh9T5BBrXgSFVTgWYQPW7wLH0WnMMdS3GF5q
 0j+rL802u6XKetBK6gNgkWG4yGcpQgXw7/dYJa+ClIO1tfuY2WYFadYzv9h+eA5JvxTq
 W/0g==
X-Gm-Message-State: AOAM533vqKhD3zsCalHtjRnBXnbdWVpw+vH/XgTAfvCl7nFzagCckdsG
 eyRJloPOFqNhOQvrgVOO/h1st9CNmCnGaQ==
X-Google-Smtp-Source: ABdhPJxYbpTykmfL85OHQVs7efP8uMP0tLvtFu2/tBXaBC9oQm3sLScVe5JlUsn4WhpWwcHlnprJaA==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr3797769wrw.218.1639564856599; 
 Wed, 15 Dec 2021 02:40:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] target/arm: Hoist pc_next to a local variable in
 arm_tr_translate_insn
Date: Wed, 15 Dec 2021 10:40:26 +0000
Message-Id: <20211215104049.2030475-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 98f59259284..c721b2ce42c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9548,17 +9548,18 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
     if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 4;
+        dc->base.pc_next = pc + 4;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_ldl_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
+    dc->pc_curr = pc;
+    insn = arm_ldl_code(env, &dc->base, pc, dc->sctlr_b);
     dc->insn = insn;
-    dc->base.pc_next += 4;
+    dc->base.pc_next = pc + 4;
     disas_arm_insn(dc, insn);
 
     arm_post_translate_insn(dc);
-- 
2.25.1


