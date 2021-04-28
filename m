Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A936DFE8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:50:34 +0200 (CEST)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqCf-0004Gq-AW
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwx-0005vJ-MZ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwt-0004d9-2l
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:19 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so9591698pjh.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvyPgkJcYXZ6bOSc2nb/SiFpxkxj4N6j6VcfwxXf6c0=;
 b=F5iPEB7hNaVF+SsZHPgoK02I4TEz+fErymRMVqpfEkjnDqa4WB29dKStD8FKwcZi0q
 xaIVS+UnJnjOANgkrIML07VNCQJEUPmrMuYh8o0itwioaQoLTOTMIK2hJVA+bj8LZDE2
 JTaZxGabmIoMo4PcCXNzjY3ZuWIo5vODBf0Tw/d7+/x8bqGVr1K4r+ZPhKoOCeRByeQT
 YxIoAXEKOypHt6pzdfJmJwoYwOqkSerpQzU5CIevWLZu9crsr04zH7Jx9SgrosGuNwqj
 smljolcvR4FTS1SKQrXUusrp/OBLwfiylBrO2dmDBm/I6IfXvT7mKiaNDSt4e3S1mlyE
 h1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvyPgkJcYXZ6bOSc2nb/SiFpxkxj4N6j6VcfwxXf6c0=;
 b=ZqeiinrlSR9xmDzRrvGF1/N56VAj57sGRNuAs+3o2GMZB7N0vhmsg5drUmyseJHq1r
 S9MlcjrHd09gkf2Irbr3TjbehCrBmlEayVF3eNFC/EhfEGBkgcsHPqCQ2bm+XyUTAgif
 ZsovJcxjnV8+XJwbtIiaanQNbNUHI7Nx6UpQf1msfAru0ytzhJgFqHSEmeTozUNYbQyC
 t/l4VbuQRLr/qLYnDAB//371UHhY+p/smexVUoGfT/gshaQ8nvJM5+vuYC67qQ8d8iW4
 TYZaIOCKkEUGui3+JV9CJy3xofZJOO5CEwQ/V3LUyIlB8ImRiSCeQB50abSLN7kV0LBW
 6OqA==
X-Gm-Message-State: AOAM5339+3IJysXvHGq+m1TBqD81wXr3faURmOo0mbqyPlDeezOg3rCS
 1U6xIbalR2iyihnraRDMuoF3UbaBUFCbcg==
X-Google-Smtp-Source: ABdhPJy0AVJXXOrci1lCTtBMomcTk0u6zennrZFBoLHL1y9g8lG/lM5HNUGAsIAWCoso4OjYvbjzGw==
X-Received: by 2002:a17:903:18a:b029:ed:1ded:d180 with SMTP id
 z10-20020a170903018ab02900ed1dedd180mr20114004plg.34.1619638453743; 
 Wed, 28 Apr 2021 12:34:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/15] linux-user/s390x: Use tswap_sigset in setup_rt_frame
Date: Wed, 28 Apr 2021 12:34:00 -0700
Message-Id: <20210428193408.233706-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index f8515dd332..4dde55d4d5 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -182,7 +182,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUS390XState *env)
 {
-    int i;
     rt_sigframe *frame;
     abi_ulong frame_addr;
 
@@ -199,10 +198,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
     save_sigregs(env, &frame->uc.tuc_mcontext);
-    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user((abi_ulong)set->sig[i],
-                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
-    }
+    tswap_sigset(&frame->uc.tuc_sigmask, set);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.25.1


