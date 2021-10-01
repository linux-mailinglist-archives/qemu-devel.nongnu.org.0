Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2EA41F174
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:46:36 +0200 (CEST)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKk7-0008HN-LR
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKY4-0006pv-N1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:08 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXu-0007kZ-Kv
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:08 -0400
Received: by mail-qt1-x830.google.com with SMTP id f15so9302057qtv.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/SnMn3cz6aHPIbcUbwKN2ElGsSac37gMdkQcSMJ6WQ=;
 b=Wn6xzyjBTdCRQX4O4ZN+01a/+yBTD9I06VQ/C7SBr4Lb/pdaHgPbMkl/cT2EgaS1TJ
 uTMnwQIt7CGmRYN2oEiWQOHz7bCWIHDDvc8MMyUUGVBPYs3aIJv3TxHA0w4o80wTQLBG
 U+Wcbmm3L31gsLjGH/rdpFCAD/dKDcar2BAlMBY7ExNkOgwPjd+NB7Wk0/cb0hp1Uw6n
 rk8KiJvWwYmkl9NA66ya3/ghK6dzwY6pDaIHCVDZ1TrN9KH2WjeyIPs4Dd3xCUwUcP4R
 MHeoXdPN2w1uKvkTZfHa6tFBL74rneVAvVA9+HvaLlKgoM/jhrJBlUrgj+tDbd3YaroO
 bzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/SnMn3cz6aHPIbcUbwKN2ElGsSac37gMdkQcSMJ6WQ=;
 b=NqoCYUuX2qGmyHj1k7dx8z4vJswYRBP0u3IANskUPcPvfPK6pZxrxtzoicKMR3TrNg
 cUjRUbZdmQdB/EfcEVDKvon9Kix+RtfX2TJ8oA4wCiJvIqZei1AEWBZM7duz+LQi56W+
 d34ITNJB91Ez99ZHVgjmZz+6yfDT9BV6M7gUoKjfoO8Yt3qreSrsL5gGmmcQmGLbxjgB
 SFY+PGiYdKT4CK5Rz+2Fy3E1hyYM7WeY3ElEZ1Ojj5TyaED9kTB9z2TOobhdzIwS1SWF
 VlkSoxajFIYJ2N1KHBsKn5P44dj3P3l85BJOrWudCjCB5+74dSwPnzfZYU55W++UjL1t
 MYoA==
X-Gm-Message-State: AOAM532dFpGGj5mTZMaYFv2u/nTqQbpGi/v1xwi5B/EDTeHUx3v+O25A
 LiuJYifOG+5u19afccLNFt407KFtr52W0A==
X-Google-Smtp-Source: ABdhPJwp6A6yIKiXbsO9FZgDRdRWtS/85/abE7rMoSlI3Y+ed3cTLAHnICgk309vHm5BYEL5PIdCDA==
X-Received: by 2002:ac8:138c:: with SMTP id h12mr13236328qtj.357.1633102437778; 
 Fri, 01 Oct 2021 08:33:57 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] linux-user/nios2: Fix sigmask in setup_rt_frame
Date: Fri,  1 Oct 2021 11:33:45 -0400
Message-Id: <20211001153347.1736014-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not cast the signal mask elements; trust __put_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 20b65aa06e..80e3d42fc9 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -168,8 +168,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     target_save_altstack(&frame->uc.tuc_stack, env);
     rt_setup_ucontext(&frame->uc, env);
     for (i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user((abi_ulong)set->sig[i],
-                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
+        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
     /* Set up to return from userspace; jump to fixed address sigreturn
-- 
2.25.1


