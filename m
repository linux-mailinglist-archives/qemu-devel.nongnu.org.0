Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A7D51C8EB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:26:18 +0200 (CEST)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmh7A-0003qN-FN
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYW-0002ir-Mq; Thu, 05 May 2022 14:50:28 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYP-0004NN-34; Thu, 05 May 2022 14:50:28 -0400
Received: by mail-oi1-x230.google.com with SMTP id m11so5238858oib.11;
 Thu, 05 May 2022 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSsF244vZwVV0oKrilhMtJ2vlWLa4NxggLes2MVhJig=;
 b=dUuFytaMw++zSDaS9Bw2yTrgumuTHSikepaL6yYNGdrxFsJuGOyAk9nYLErZEkyenG
 qO2LrpxRKop1l1D1XTk+IZ0RvcPwAZIE1Tvf5Fa3HxU16cby27Owdto6Y6dgHQivhBbm
 OpXMfie5iaCgMCBGB2bbbHRGURxFfPV8dCnAI38C8/J8c/WsIgki+cRlafq4c9nznJ00
 1FciT6yGu8bLFj3bk3A1oRRi31vE7z7JEuEpG4t8RL5HktDrnC72VZfATI4unzkf9QRS
 N+xzE4YIkLCzw/xOFaCA61hC4oNPiuzQwnN0MVVUEuhsI3cJ6vk+wrr3pjLzJYKOClqD
 IHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSsF244vZwVV0oKrilhMtJ2vlWLa4NxggLes2MVhJig=;
 b=zCw6LDqNPp8GePtEq0gtlzAqq5nq59RidqZyW2sUtLIL1d69ksGyZWFBfOAIj1OcRn
 EYjOh8irF6il2i3Ma4ASWtlcHFIQtGU9cm2GDseoa32A6GNlqOjG6KYeUQviUCcUnFc3
 CcxmYEyYPiBH7L7FydlMq1Q9sysQjdYCrm//Kb+vN6fOW0qb6LfP34czpziipNAcajtv
 NGnzqN4rtkK2fmtbR0nEikjObgzTddJ5CbmVyYa4hTvh4bM5hwvlUULOALqJwbhpoa74
 NsWyVhny8rEQyqA6ExlJsrnx0VfZK3BW6H9MzpwrzHCPFAOvDac0P8QuQ7Q83iBHVMwS
 wMUw==
X-Gm-Message-State: AOAM5332msqsHHWyCKr0EtqCk/2ccYPx0lvQAcAXN9IykcfFK8hAbOkq
 wN6Fj3R9+ef00d5tm5zoPf0InJkFrts=
X-Google-Smtp-Source: ABdhPJySpGsr0FOHdX1pd7oizkFaR5X9B18EJrRDxy8J9jIbPskxuiwPtb2XfJFaaxmTLQpxDYJzBg==
X-Received: by 2002:a05:6808:120f:b0:325:bc53:2150 with SMTP id
 a15-20020a056808120f00b00325bc532150mr3263700oil.139.1651776613505; 
 Thu, 05 May 2022 11:50:13 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 03/30] target/ppc: init 'sregs' in kvmppc_put_books_sregs()
Date: Thu,  5 May 2022 15:49:11 -0300
Message-Id: <20220505184938.351866-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Init 'sregs' to avoid Valgrind complaints about uninitialized bytes
from kvmppc_put_books_sregs():

==54059== Thread 3:
==54059== Syscall param ioctl(generic) points to uninitialised byte(s)
==54059==    at 0x55864E4: ioctl (in /usr/lib64/libc.so.6)
==54059==    by 0xD1FA23: kvm_vcpu_ioctl (kvm-all.c:3053)
==54059==    by 0xAFB18B: kvmppc_put_books_sregs (kvm.c:891)
==54059==    by 0xAFB47B: kvm_arch_put_registers (kvm.c:949)
==54059==    by 0xD1EDA7: do_kvm_cpu_synchronize_post_init (kvm-all.c:2766)
==54059==    by 0x481AF3: process_queued_cpu_work (cpus-common.c:343)
==54059==    by 0x4EF247: qemu_wait_io_event_common (cpus.c:412)
==54059==    by 0x4EF343: qemu_wait_io_event (cpus.c:436)
==54059==    by 0xD21E83: kvm_vcpu_thread_fn (kvm-accel-ops.c:54)
==54059==    by 0xFFEBF3: qemu_thread_start (qemu-thread-posix.c:556)
==54059==    by 0x54E6DC3: start_thread (in /usr/lib64/libc.so.6)
==54059==    by 0x5596C9F: clone (in /usr/lib64/libc.so.6)
==54059==  Address 0x799d1cc is on thread 3's stack
==54059==  in frame #2, created by kvmppc_put_books_sregs (kvm.c:851)
==54059==  Uninitialised value was created by a stack allocation
==54059==    at 0xAFAEB0: kvmppc_put_books_sregs (kvm.c:851)

This happens because Valgrind does not consider the 'sregs'
initialization done by kvm_vcpu_ioctl() at the end of the function.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220331001717.616938-4-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 69094ddb7a..c4180b7270 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -850,7 +850,7 @@ static int kvm_put_vpa(CPUState *cs)
 int kvmppc_put_books_sregs(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
-    struct kvm_sregs sregs;
+    struct kvm_sregs sregs = { };
     int i;
 
     sregs.pvr = env->spr[SPR_PVR];
-- 
2.32.0


