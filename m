Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65793698C54
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7i-0003nU-Dl; Thu, 16 Feb 2023 00:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7f-0003ln-SX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:00 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7e-0005C0-Bk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:47:59 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso4751086pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwzhgiW7ITrxyd3SSfKf1YS1o/7m69672MVumGKkbhc=;
 b=OsDhWQvRTDlaXx4+osPMx5z+xX15hix/wXxVqMvk3M9wUA1Re83C3h4I+2i+bt0YpT
 WNBQWuozrYNRSSQKxynymKm8imFC+IrFUTIrWXKPftI4hm/aR4H/DZhrQeOQAOzgFEm2
 X74Vd9m1rvp8TCTHRUEmc4OX3onJy8XCs7rIkLp3sYb8B9ids9O/akQgxq1GbJGsit8N
 ZEI7Dc4sVvhe3a0/TieHgNj9vHT1sYvcu3XAhXANojrnODL09EArstXuyyuAUjQpbH3y
 5uRcgggQrVyiMDiYX56GeExKQwSMOAR2xQIyxhYWmpUW94rAAuCZ3jjsBcXnfEPjFPzs
 E3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwzhgiW7ITrxyd3SSfKf1YS1o/7m69672MVumGKkbhc=;
 b=gCwNPsOlNlsGWd7OpUwrlnJK3nKZRKJ2/KsZdurDgCvOn6TVJx7wFeggjHzjCCP+bN
 dtvKtrOJ3VFA5GvU5AihN6W1Gsik9RDAgMGKqLWpFBHeEzvAiWf9Hs9arPnBiTuJw5Se
 Z/jr38ynTnBbHyl780QvrDJ3qEyr7E82iToEr4tNDxvWX0ve7bd63YJZA53WJ2igqJj5
 Wc65um/cx+53HF2Tz9lnPfJAjUd3IWr1goUDXDzctslEH2c5FM+WTSMEeD8+76JACfdT
 vLgTirT/3uhWHEEiAcrueLdVM+dIwmFzVkvZ01dEAb81KufZfC7TttPGDr4NM9dky5Pi
 1loQ==
X-Gm-Message-State: AO0yUKWXWNT5hjtHUyqlh0+Yu1uWqPwyrHUeMKECpn2MtnSBEXrJ/pzZ
 RaOhYcjcSccdPU9W6G3+38D9A29YO0Un30JC+N4=
X-Google-Smtp-Source: AK7set9y8QSPcCvshcrSuZlOdocWD7+l+hK22V4HeR3nXJ1pXXz8t3Qs4DThKyGExQoOq3dPZzyuCg==
X-Received: by 2002:a05:6a20:12ca:b0:b8:66d3:30aa with SMTP id
 v10-20020a056a2012ca00b000b866d330aamr5436650pzg.50.1676526476980; 
 Wed, 15 Feb 2023 21:47:56 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:47:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 03/15] linux-user/sparc: Tidy syscall error return
Date: Wed, 15 Feb 2023 19:45:04 -1000
Message-Id: <20230216054516.1267305-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reduce ifdefs with #define syscall_cc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index d31ea057db..051a292ce5 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,10 +149,13 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+/* Avoid ifdefs below for the abi32 and abi64 paths. */
 #ifdef TARGET_ABI32
 #define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
+#define syscall_cc         psr
 #else
 #define TARGET_TT_SYSCALL  (TT_TRAP + 0x6d) /* tl0_linux64 */
+#define syscall_cc         xcc
 #endif
 
 void cpu_loop (CPUSPARCState *env)
@@ -183,18 +186,10 @@ void cpu_loop (CPUSPARCState *env)
                 break;
             }
             if ((abi_ulong)ret >= (abi_ulong)(-515)) {
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc |= PSR_CARRY;
-#else
-                env->psr |= PSR_CARRY;
-#endif
+                env->syscall_cc |= PSR_CARRY;
                 ret = -ret;
             } else {
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc &= ~PSR_CARRY;
-#else
-                env->psr &= ~PSR_CARRY;
-#endif
+                env->syscall_cc &= ~PSR_CARRY;
             }
             env->regwptr[0] = ret;
             /* next instruction */
-- 
2.34.1


