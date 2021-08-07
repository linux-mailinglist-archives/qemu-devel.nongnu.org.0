Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EBE3E375D
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:10:50 +0200 (CEST)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUWn-00069I-Dx
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6X-0000Jg-OW
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:42 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6W-0005Uq-9M
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:41 -0400
Received: by mail-io1-xd33.google.com with SMTP id e186so17979869iof.12
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rfVpKk3K/d551DVmXRmKm6XBuSrm0xhas2vhvUMjkyQ=;
 b=bAo7jySbQTl8v/QAkuQVEWlDLujUZg2yjniRljOyWDd2izsMFyV+cDe0Txd9busFPP
 ZtotqlM12EvrMrtcedIr2TnTJmsrKGlTFdEZR50Hq35B/duxJezTyqUsYUNOSn4Xj9Xk
 gdBmFmpkvNVJcXRNBY22vbw8GXRsHX7QgPzpDCmpeWAalh+GVcxc8yLmbbN5enFmS2+z
 QZhYLooXJW1hYnhOU4ttfgoHnA3bNV+PxxIYm/0MqKDvDrO8Q+BwWNf/QpYufd8Q9vLH
 gRCFdtcviDWlKUow25/c2vp7S29R4MJFiF9YeeCOpRPZtYU5bQy+5NRQmOETxuUYieGu
 KHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfVpKk3K/d551DVmXRmKm6XBuSrm0xhas2vhvUMjkyQ=;
 b=bESv46Oxdb8tzpdvGknFAdVbozXm/HwHpBzJtd0tQOAA+SeYUuPWNANX4wrXzKu5Gr
 LDKsGP5be9K1VbuUlvX484jR+APjt0/U0+hW1ctc1crfBFrT2mM5VQKrlhAhW3U5avCv
 ztMtgmikY765dTUikztB4KSvHVc9UzPRTT62Z8x4gScGEec0Zh7V5cePQbQnA5vuzfYB
 K9j+6AB/flCTkcvIjT7u+/4rRH0Rl79x+yn7oLrGSu86J2/J2WawoH2chHomAI7RMtgT
 3WPdS6xAGxYFceRncHQIlM3HsZg0VI/yCBdjMADrjG8ws1gCbolBxJbURnhAIN0MXq8U
 yWdA==
X-Gm-Message-State: AOAM530JcgU2zVc3Nq+rOJQfyMtQR/LLyEM/pq/+VdAMLbA2udLKG0Q7
 V81ozEj4PisWGbalTpgEyK7sERWeopssDLFs
X-Google-Smtp-Source: ABdhPJxx5St20//8fsIDfTjQf/PZ65vNOgoDV25nxo+VfQa4yhEzcxiacC6tXpRenPYuJFboYJFMBg==
X-Received: by 2002:a05:6e02:550:: with SMTP id
 i16mr19385ils.207.1628372619045; 
 Sat, 07 Aug 2021 14:43:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 48/49] bsd-user: Implement cpu_copy() helper routine
Date: Sat,  7 Aug 2021 15:42:41 -0600
Message-Id: <20210807214242.82385-49-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Justin Hibbits <chmeeedalf@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

cpu_copy shouldbe called when processes are creating new threads. It
copies the current state of the CPU to a new cpu state needed for the
new thread.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
---
 bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 2b0716d245..1de5dc189b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -196,6 +196,36 @@ void init_task_state(TaskState *ts)
     ts->sigqueue_table[i].next = NULL;
 }
 
+CPUArchState *cpu_copy(CPUArchState *env)
+{
+    CPUState *cpu = env_cpu(env);
+    CPUState *new_cpu = cpu_create(cpu_type);
+    CPUArchState *new_env = new_cpu->env_ptr;
+    CPUBreakpoint *bp;
+    CPUWatchpoint *wp;
+
+    /* Reset non arch specific state */
+    cpu_reset(new_cpu);
+
+    memcpy(new_env, env, sizeof(CPUArchState));
+
+    /*
+     * Clone all break/watchpoints.
+     * Note: Once we support ptrace with hw-debug register access, make sure
+     * BP_CPU break/watchpoints are handled correctly on clone.
+     */
+    QTAILQ_INIT(&cpu->breakpoints);
+    QTAILQ_INIT(&cpu->watchpoints);
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+    }
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
+    }
+
+    return new_env;
+}
+
 void gemu_log(const char *fmt, ...)
 {
     va_list ap;
-- 
2.32.0


