Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7347349A236
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:58:21 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB6C-0005xF-Ip
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfN-0002Iw-RT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:47 -0500
Received: from [2607:f8b0:4864:20::d29] (port=46736
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfK-0001ia-It
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:35 -0500
Received: by mail-io1-xd29.google.com with SMTP id e79so21850662iof.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYOIzW6/ZHDz9enhrfWJlbCeES2xGOl72iMdp9Riye4=;
 b=lNFVxgTZ+THyEJ7Cc8cUcGQYskycK9GIBir6c2xol5CEM1Lru44SppMDi3dsSnO/IP
 BcC9dE/LHZkuB24YU1McVbZdyj6/AJ1KAWb/fXTZkW+zydb9JoBF+ab+t1V124Xs5tqc
 s7M6XP9DEz38t5G/FAscEyBA0lmkqXTTdQOD9OtpgiSlRGYrFkHdWaNFMsb4Yz01oLZm
 pjAhpMAYDWxTSmlVI5Yv1tyi/ULImRTX+8jvktD3S3MtZ8Ge912uCJFvqK+7NXrBh8td
 ng7BFZJGdp7TmVbylooNIvDyXNn6QXuwh06X0yfVP5WTiPxhiBpUziHYnY1SKakn+GH5
 7WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RYOIzW6/ZHDz9enhrfWJlbCeES2xGOl72iMdp9Riye4=;
 b=6GeZ992bCVw+HGlzVRs10eslyeODVqz63DNaJFsE+Rfjq0tR7RzJdDaVX5dLol4o9p
 8+hiey2Fq/vfXneqE/7dlpy5OYwSOzB7NFoQQcY7sLJSodKZJB9Yqgs/T1AnzJYpMbKP
 BcO8RMWLVhcWCrMjSqIj3mxyDPBmDBEygBvTtCUDk/QLkSX3EJGPlppwAvNMJkIa8TSE
 tzAsuRsblxdz/W010XmhVNPsvGCT4mfEtGBgAWO+SfbCtG/jM+Hd9MN2v1UhFU4Wdr59
 uZ1ckHUT9AXAs0SE4p5p0f9zqbzWTOUGxrvl1vT0u4lmT/WuX9H/QyRDqxlZBkwUQbpm
 zf6g==
X-Gm-Message-State: AOAM530dGQJU9R35x6rRyuypkYRcPB3S5veEWrifokqN/zEiqOMhvXDG
 lbxWnAMOACRyuw08HM7GUoN6re9848ahdA==
X-Google-Smtp-Source: ABdhPJzHGHHELHPwGaB9lyQwtZAMUjd1qcmuGd+s30BDMrNmG8wddnPcGO7OUN8+5xdKt23lC45f0A==
X-Received: by 2002:a02:77ca:: with SMTP id g193mr7048206jac.166.1643074233002; 
 Mon, 24 Jan 2022 17:30:33 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:32 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/40] bsd-user: Rename arg name for target_cpu_reset to env
Date: Mon, 24 Jan 2022 18:29:46 -0700
Message-Id: <20220125012947.14974-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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

Rename the parameter name for target_cpu_reset's CPUArchState * arg from
cpu to env.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h    | 2 +-
 bsd-user/i386/target_arch_cpu.h   | 4 ++--
 bsd-user/x86_64/target_arch_cpu.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 2f1ab4c6ac2..a52c39f6943 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -213,7 +213,7 @@ static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
     env->regs[0] = 0;
 }
 
-static inline void target_cpu_reset(CPUArchState *cpu)
+static inline void target_cpu_reset(CPUArchState *env)
 {
 }
 
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index b28602adbbd..91849b5804a 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -199,9 +199,9 @@ static inline void target_cpu_clone_regs(CPUX86State *env, target_ulong newsp)
     env->regs[R_EAX] = 0;
 }
 
-static inline void target_cpu_reset(CPUArchState *cpu)
+static inline void target_cpu_reset(CPUArchState *env)
 {
-    cpu_reset(env_cpu(cpu));
+    cpu_reset(env_cpu(env));
 }
 
 #endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5172b230f09..535aa9192da 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -237,9 +237,9 @@ static inline void target_cpu_clone_regs(CPUX86State *env, target_ulong newsp)
     env->regs[R_EAX] = 0;
 }
 
-static inline void target_cpu_reset(CPUArchState *cpu)
+static inline void target_cpu_reset(CPUArchState *env)
 {
-    cpu_reset(env_cpu(cpu));
+    cpu_reset(env_cpu(env));
 }
 
 #endif /* ! _TARGET_ARCH_CPU_H_ */
-- 
2.33.1


