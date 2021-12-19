Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D805B47A0E9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:25:09 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx7c-0003jY-18
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:25:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0E-0006Xo-85
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:30 -0500
Received: from [2a00:1450:4864:20::536] (port=41687
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0C-0005yY-T4
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:29 -0500
Received: by mail-ed1-x536.google.com with SMTP id g14so27758047edb.8
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrAIemtb4192qfSOVxsRbeF+XjROxaOak0qG0wpLn8A=;
 b=AKAiAlrmhNUV8Qk/NB+gigdmQhiu8Wo84Z1vhMA1aLeM6la+rmnABjWghr2wVPO1wL
 fm2m5Mq6DzrSGNtXK3QS1VZMZ2GDYCMJwCWpBaMkwB96LNEX8zOyXWIVcCnTExx4kW3k
 2qdLFbf2tFE+QmJcK1guk0+OCZ/+RTo5VDeu6JOjGJLH4nfDIwbLSu//RkgEbtcR6iP9
 a2TO+cYMEnY9ShXy+rsTarzFIGFmfCYj9KS111q4mR6nq6KNpF5PUoM+2lYbmR0EHqn6
 RYJ/ExgHkAUukXCRuTkKGn1KpAsRdhWW9TqhA1q2I+ZFt2GGg6KcTXO1hzFA/er0Li8c
 g59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rrAIemtb4192qfSOVxsRbeF+XjROxaOak0qG0wpLn8A=;
 b=knhrIpoQlfnagHSwbtDdFEFlOT3wYyzGLhCpPeSWWVl+JtpQ4B78KY2M3kU3Jz29R9
 kHW9RuBptIDAJeJ6goy4qtbRsAdTh8NF9vPUC8G/eWU0SGY7S2Jjckkx8dtEnkkau8hm
 refNGmRXSotuX2p69kof+GO095Qjn4OhAlCoWLd9nqizqjUtoWqZC2sq9M3feyMbFClX
 vq3lD0YBVBCS33l7g2MesmivrRhmPYbf73j8RmF4I/hOVVDpZZzOmpCkQ++Rcyzb1j6r
 gVE4H1cjNKp2uxxEswJyyOkEqrLfH8e1L+nKo7KEJORNLGrItzd3M6t4WWp9ase7pzDa
 3DIw==
X-Gm-Message-State: AOAM533BJ3Zl7xxswtjd/SK5jkgXWTmSw0tUUwqHcZZ9DH0BECF1Qnl7
 iZp2If3QcfjlQRnkkvxMLBNJ/KsXRxc=
X-Google-Smtp-Source: ABdhPJxBcl5Q2fkgMqPZbI3sCm3tHm4t4sXWclyjim8Ifa9aouPT9yB26+NCsUu2Kr72+JNvkfyDqQ==
X-Received: by 2002:a17:907:8a07:: with SMTP id
 sc7mr1077205ejc.738.1639923447624; 
 Sun, 19 Dec 2021 06:17:27 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] cpu: remove unnecessary #ifdef CONFIG_TCG
Date: Sun, 19 Dec 2021 15:17:06 +0100
Message-Id: <20211219141711.248066-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

"if (tcg_enabled())" allows elision of the code inside it; we only need
the prototype to exist, so that the code compile even for the --disable-tcg
case.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpu.c                  | 5 -----
 include/exec/cpu-all.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/cpu.c b/cpu.c
index 9bce67ef55..945dd3dded 100644
--- a/cpu.c
+++ b/cpu.c
@@ -137,12 +137,10 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     if (!accel_cpu_realizefn(cpu, errp)) {
         return;
     }
-#ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
         tcg_exec_realizefn(cpu, errp);
     }
-#endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
@@ -169,12 +167,9 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
     }
 #endif
-#ifdef CONFIG_TCG
-    /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
         tcg_exec_unrealizefn(cpu);
     }
-#endif /* CONFIG_TCG */
 
     cpu_list_remove(cpu);
 }
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 3c8e24292b..bb37239efa 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -437,12 +437,10 @@ void dump_opcount_info(GString *buf);
 
 #endif /* !CONFIG_USER_ONLY */
 
-#ifdef CONFIG_TCG
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
 void tcg_exec_realizefn(CPUState *cpu, Error **errp);
 void tcg_exec_unrealizefn(CPUState *cpu);
-#endif /* CONFIG_TCG */
 
 /* Returns: 0 on success, -1 on error */
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-- 
2.33.1



