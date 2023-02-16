Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F8698C61
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7s-0004AM-1o; Thu, 16 Feb 2023 00:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7p-00045f-CR
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:09 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7n-0005Po-QZ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:09 -0500
Received: by mail-pj1-x102a.google.com with SMTP id d2so831418pjd.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEAS/y4KNGAZ69Ie6TWO3D+vLA+vLuj0brYQYKVkagM=;
 b=AgkGz9FMADk2m7a001mZe0XMkPa3ZGm5T8zPPqRqBsSHfbswfzyYFLk9Xzw0S+i19B
 yE/onJreUEu79YZ8PcsAYFb9OMaCtKky5gQEPP8QqlH2Y7gKo53tjBciO4C+rcPpueoS
 e9ERLs3A2ad+sgnfWY1mQr6ftPBwBIsVmUXkTG8bMSVxIo8d2ATmlBfLmyZsdElJUH/J
 4Y3vdO5ZI4xEE4d9KqPpmqGh0SDZ3m4QM9811IKL6d72fxIcJUyts3c4+ngpt42bQfTc
 wh8HB4sVK7SJJl+lsS0j4+QRNoB2+895fxN+jdI8lSfvlF8KS1p8FwOI+Jegt3mF9zRA
 ORnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEAS/y4KNGAZ69Ie6TWO3D+vLA+vLuj0brYQYKVkagM=;
 b=dO94Vl9K79gG7iaLslAoovcGbHo9QBQIAEMkR0miVR+HcczCBZA7zaDURF+Y09k8li
 TmAzF/2k5qfYEaxMn5nGXdC/ie7Gtc77mHdx5z0/5CLy+dlf8W+nW11tTnPoG6rVlm3b
 rVeMybMV3wcRIYJrx+ZifWN5ykgzX7TgoRKP1W88QhdcxTjbsy8ZOtrPbbb49KaXpRpe
 B8ElR1BsYcHM8EO0VldvGmhI49+GPKTzJ8wVglus/XGWXj5A9O6EsMc8JZV02iHtbkGM
 TDJGeeJqdtyx3g5iaRzG4r16/vfvN+YZ6NXZPh4Lc64sM+iYgT86HJLMpw2P2T6cqics
 hERw==
X-Gm-Message-State: AO0yUKUgi5qQ3PUVvqpgcHtPGysY42tAHB3eqNfIxlqh6YSSsBdYhztj
 0+YCbi0OZasS2Mvx52zEHRqMcJKUynDWulwkyAI=
X-Google-Smtp-Source: AK7set/0urbiz/MCsP56iMoyqW9orzTi44xsI1oGBkuIBK10teUyC2d9SGbbf20KsP18Qr/5OzGUxw==
X-Received: by 2002:a05:6a21:32a0:b0:c7:164b:8ab7 with SMTP id
 yt32-20020a056a2132a000b000c7164b8ab7mr1746151pzb.22.1676526486308; 
 Wed, 15 Feb 2023 21:48:06 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 08/15] linux-user/sparc: Handle division by zero traps
Date: Wed, 15 Feb 2023 19:45:09 -1000
Message-Id: <20230216054516.1267305-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In addition to the hw trap vector, there is a software trap
assigned for older sparc without hw division instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c14eaea163..e04c842867 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -211,6 +211,11 @@ void cpu_loop (CPUSPARCState *env)
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
 
+        case TT_TRAP + 0x02: /* div0 */
+        case TT_DIV_ZERO:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            break;
+
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
-- 
2.34.1


