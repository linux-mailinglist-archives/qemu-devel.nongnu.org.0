Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C614A04AE
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:54:36 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb4d-0000t3-Un
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafj-0000cW-PW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:51 -0500
Received: from [2607:f8b0:4864:20::d35] (port=37859
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafe-0001a0-SK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:51 -0500
Received: by mail-io1-xd35.google.com with SMTP id n17so9711625iod.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4FRMcODA3Yw9ipRGV2deCv5GoQkPWInOh9N0fcX/6E=;
 b=tnmcn5JbKC7RrwS20rhduMINKhyivRaNITtiRiTQzbcJRtWeVhLHGjdYeqkwtqlHDU
 EzofFOKK01TgAt4lEB+rSL36siQuO5c1lZwbNy9r8r4Y4I9Nrx0koYqqLd+hWZduCkkz
 Li2XvI29uBt1+EZl4xMEmUunnQ48TYXdZeZayFof2cb/N1yqrZcpOp5uJ4gg87TecuV1
 RJ7hu2IWtXcwMNI3oFmhI9adFSnbnPsnpF7YeQxJzrX8INOaut86zIgW8NFKcDD911vz
 9iTfk0PTv6Zs/Vj2IVqjEo3s/8Y7+HehGWIKfKPC+1ZJw13rnoVpzPBpX87m3peiiRnC
 uVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4FRMcODA3Yw9ipRGV2deCv5GoQkPWInOh9N0fcX/6E=;
 b=gntcTvkCJJmWBSoqbPFN+4RGK58B3tm6ham4uBfwFOySo9QvgpdVuRGrKVoa5G/ubg
 S9Rc56ziP5dIbQAfgmxSz0QkstW2Y+25y66pjKk55ERBqbrkdD6drqTkmslC1DX3YYg6
 Hyo8cqdFZnm/mVKJqpaP2g0AA82kv5JhsB94dHCou8IPC0umjJFoQqH3sLrfk4zfi09b
 KTXFFORo42E0uQWXeahl01XkyOvdVSPAS8rUtVSZPEV7yIt4aRrEF721zWytGMgybEii
 zXdsRROy9MPdF3KpiKKUvOuPsR70jXeBp0c/ugPvLOBEz2033iWcHXNRbTImBvJD/gM2
 0iOg==
X-Gm-Message-State: AOAM532agMeawcGJWjlCljVCyk+wCp7VstWoSjbfhI74fiwnoyf8P7lD
 nL35dDUU5WXyJe9AA1bFvfGSucpWTLrqAQ==
X-Google-Smtp-Source: ABdhPJx59YwmwOuatQtpjOnK8VMZ8A8agPvMP3++LKsASEmRmN6k/tT6oYxQY9mm6EhnXhod3RDlew==
X-Received: by 2002:a02:ba14:: with SMTP id z20mr236481jan.102.1643412495451; 
 Fri, 28 Jan 2022 15:28:15 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:15 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/40] bsd-user/arm/target_arch_cpu.h: Correct code pointer
Date: Fri, 28 Jan 2022 16:27:38 -0700
Message-Id: <20220128232805.86191-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The code has moved in FreeBSD since the emulator was started, update the
comment to reflect that change.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


