Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656FC49A222
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:49:47 +0100 (CET)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAxu-0005kp-GW
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:49:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAew-00026r-N7
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:10 -0500
Received: from [2607:f8b0:4864:20::130] (port=34599
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeu-0001Yg-KR
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:09 -0500
Received: by mail-il1-x130.google.com with SMTP id y17so3992721ilm.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=noTZDMDgxbMiF6g0sA7fOvqo2GF//eMNgPA2d32SWUU=;
 b=4f+n1VBOJvLQPUgh1x1oMJJOngoTGIojOojIInghM1m6ChhVXOL/SFQMBGVwanY/eG
 /sgdWXaPZbZ5k1z7O/oE9TkIzJzdUc8zCsPB3BplyciVrT6ESQL0KcPRLvq+tS/Vx6wy
 T7npvjOucnT8BdisQynzu1mCjr2b7Q3leLfcdnfp1DNYhqZfuBAZR7+ZS329SOZz9iB2
 v/F7hzVoF2V1VSCJMxdCJ+qfaE4oeWwTxVtDMmLSEXxUBXjb6cbGj2J8C6liRWiszzv0
 5ilk/27YqPlffXLofKgR+07fInMi4v+9Mo9HHQQnZYF69YRApAIAN/hHwbGrx6qIPE4U
 lhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noTZDMDgxbMiF6g0sA7fOvqo2GF//eMNgPA2d32SWUU=;
 b=IeOcEZmFvC7OnD9oVlNol07tBChHE3V8yEgP/3ezSJF5+HXAzQWnSUO1o7uBhI68Yu
 RC8e0gryh6PFGpFsEbwzZ2g1LVpyXhpmT92pvoXUJu8sGnzcNinE4ZcFYiBXLAJ1NNXd
 XprT0lG2QFsoCCzqeDD/69pEkrACcxfUPLDWpxgYQW8YrJd5FQNUZokavjLvtOsZEJcz
 78Pm/iXEcUjXhTRa56hY+Ioa490eQQTJEVgB2ZNOpt2mhglQmoQJVxwmjhy5vkukgFTc
 ysn3swMiJAjbdBox2mCmMnuF1gdZYFBe3TXoVUtjtQZ/raYlNnQyeo59/+PjxGB0hHKb
 kVkg==
X-Gm-Message-State: AOAM531qOBf8HX7mg3Spo7yavYHcVLQCd8C0tEctd9rpCMDkxHCRommq
 huDbeByk8rbtVDvQmuLzqHvOPcLzOw8qcQ==
X-Google-Smtp-Source: ABdhPJwOAdnIYgV2t184CBRU6o4XobUnmJhEd7/MYPld/yXllQxyHnOnaPzXfTqBHmyOvsVlReqQwg==
X-Received: by 2002:a05:6e02:1a8d:: with SMTP id
 k13mr10432862ilv.223.1643074207183; 
 Mon, 24 Jan 2022 17:30:07 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:06 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/40] bsd-user/arm/target_arch_cpu.h: Use force_sig_fault
 for EXCP_UDEF
Date: Mon, 24 Jan 2022 18:29:21 -0700
Message-Id: <20220125012947.14974-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use force_sig_fault to implement unknown opcode. This just uninlines
that function, so simplify things by using it. Fold in EXCP_NOCP and
EXCP_INVSTATE, as is done in linux-user. Make a note about slight
differences with FreeBSD in case any of them turn out to be important
later.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 905f13aa1b9..f4b72939b2d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -51,18 +51,19 @@ static inline void target_cpu_loop(CPUARMState *env)
         process_queued_cpu_work(cs);
         switch (trapnr) {
         case EXCP_UDEF:
-            {
-                /* See arm/arm/undefined.c undefinedinstruction(); */
-                info.si_addr = env->regs[15];
-
-                /* illegal instruction */
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                queue_signal(env, info.si_signo, &info);
-
-                /* TODO: What about instruction emulation? */
-            }
+        case EXCP_NOCP:
+        case EXCP_INVSTATE:
+            /*
+             * See arm/arm/undefined.c undefinedinstruction();
+             *
+             * A number of details aren't emulated (they likely don't matter):
+             * o Misaligned PC generates ILL_ILLADR
+             * o Thumb-2 instructions generate ILLADR
+             * o Both modes implement coprocessor instructions, which we don't
+             *   do here. FreeBSD just implements them for the VFP coprocessor
+             *   and special kernel breakpoints, trace points, dtrace, etc.
+             */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->regs[15]);
             break;
         case EXCP_SWI:
             {
-- 
2.33.1


