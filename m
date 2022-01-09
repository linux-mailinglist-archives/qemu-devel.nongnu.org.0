Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B189B488A88
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:26:17 +0100 (CET)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b1M-0005eE-Qz
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:26:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auv-0005OD-0u
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:38 -0500
Received: from [2607:f8b0:4864:20::12b] (port=43636
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aut-00076C-Nl
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:36 -0500
Received: by mail-il1-x12b.google.com with SMTP id d3so9259607ilr.10
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rYbOaGywm/gXp+KUiOApi+gy1fj4x1kM6ZqHK5ccGBE=;
 b=kdr7OHNd0H9bEHLo905dqlkvCy2I1C9PXVh2f0JVEkfy6T28GaIE3JywFDH1vY6n/8
 tvdNNI1yvcK07OeRZhZqj4OiGghQZ+WIwRLJ+EnyIl02CnjRF1i4nisW4bn330xUt5yo
 2t+icccQh6RJ9/WBWywS6G7ThkmJY5fOEPhVdTeILC3UKe9ExGfpMne01jz0uzXgIblO
 JIPnk6y9QY3JOefZEUyd1I1qwXFDmd6PmpzwYmygFO61OBeJbMBrw7ETxsLr7eM/x6KO
 crDy8BmxccecuGKnZwKnp6Bc9R2WA75S6LFS3gRAECjJZdQ3P6LrziruZ2w0ogfsBL3F
 bFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYbOaGywm/gXp+KUiOApi+gy1fj4x1kM6ZqHK5ccGBE=;
 b=QeQQBmvOIbZMjdTK3ajjNAZJyKmCbtxa77o7HWFFeoGEkuEi2ghHi62xdZuBfj5Rnr
 IAWh0eARTtii3fGQ5zTwoMw5+TluI/y3e6fmS6co15uu3EQUvb7X40LtR0g9YFosQntV
 5noZQxZ0RPBY/gDpy9YOVhSlo8e4R9rqDNSUTwOdnUvGKLJxPowbyBVLHAIFp5OYTWlZ
 /vJ8fusE2MWshGF9d6ym+lzQDfmbnL6dEdevEqbZQj0zDtWWZ19gWDuvzW2AfjPKvVfk
 gZMHy2AsmUB+OW2SkjpEHFdLLH3A+M68jYQI/dK09TiMX6sc89TP7YwiBB09QyQ+HmFn
 PuTA==
X-Gm-Message-State: AOAM5310bywbuVsM+493VS3Jm48zDHMPVgCFiNgnMkqOdaWYQr/9v0V2
 TkvGilvWm+z2AKXGL76p5LRGuj98M2Psgz9H
X-Google-Smtp-Source: ABdhPJyTnNFXsutbWUNR0i6pqLTMqiNA8o8Z+Hz1F1GbpkunHExtzPt1RpSlvC+XVnkQALU2gQFGgA==
X-Received: by 2002:a05:6e02:1a84:: with SMTP id
 k4mr31563316ilv.29.1641745174371; 
 Sun, 09 Jan 2022 08:19:34 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/30] bsd-user/arm/target_arch_cpu.h: Correct code pointer
Date: Sun,  9 Jan 2022 09:18:59 -0700
Message-Id: <20220109161923.85683-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code has moved in FreeBSD since the emulator was started, update the
comment to reflect that change. Remove now-redundant comment saying the
same thing (but incorrectly).

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 05b19ce6119..905f13aa1b9 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)
                     int32_t syscall_nr = n;
                     int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
 
-                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
+                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
                     if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
                         syscall_nr = env->regs[0];
                         arg1 = env->regs[1];
-- 
2.33.1


