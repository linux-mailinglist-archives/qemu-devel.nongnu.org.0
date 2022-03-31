Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555824ED0F0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:35:49 +0200 (CEST)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZimx-00058X-Vd
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:35:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVb-00069Q-Sd; Wed, 30 Mar 2022 20:17:55 -0400
Received: from [2607:f8b0:4864:20::233] (port=43843
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVZ-0003J0-Ev; Wed, 30 Mar 2022 20:17:51 -0400
Received: by mail-oi1-x233.google.com with SMTP id w127so23754902oig.10;
 Wed, 30 Mar 2022 17:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUCQrHFagL1zcxCWHXjLIdmlTK1pUrFFJANtan0A590=;
 b=MQnVoJrNVo0co+ckchZuPPuMEzEJ2+tWI5vR4BZ10xGavDiSwZ68XUCwOtJ6Tb+rL0
 xk3kiHEYHiCyVSdb1ag5U3su7CDMZaCEoErUV9YJB6nzafM9TAT5LPfK2wYna9qf2e7z
 JvkmJD/48Gby9OQg7pZw6KAbK3xYkA1sVJw48cqUo/+UKuW4wvVbR7IVyK3lQgIXY01J
 yU1tokL1ZD14H+Z5lRk2qAe0Fm1e6m3r2iNoa1WfQpk2ubL9BPiDHz8TCEXNfXXViAfC
 2rRmtDK/Tl6hi+x9lWFZP3A11Qai0QCPaZt8zFSIVe0c640USFVvsX0IPdHhMuC0tbF2
 6f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUCQrHFagL1zcxCWHXjLIdmlTK1pUrFFJANtan0A590=;
 b=RKg4+TLxx1PW792kJTTup93tUmKm8yai/0NlBE0gi2j5JG3wM9omb9bNGg9/t497WB
 ZlUT2Tz//lEOPDCFE+Y1RwdU90HURZ+VmXD8OuzMPtsPoWCrqunExO/IhRkmQMA7KZou
 wP0Eg4yUA4FheGoxozbqzObViZj4FYF06XXV3UEOZPfJHYMWSLTkHOuY5pPG4KCqXvtK
 Xqei1EXf6AGYnBzn8Aj1ej7T+dhJRtHcFiJVXD1++k7XopUOTPmOrPTCnpLXdw0soitK
 /KgSFWVugJT47qt9xYI232/1ikN5JWwm74YJzyQ58+LRrgi1FjVOZ+5gWCbrw2HecMen
 ZZOg==
X-Gm-Message-State: AOAM530OZhfNsRvo6EUL3r4qHjvertbFC1XUjX3gnBXQO2Qac7YR9vot
 /fMHSq+mOqp4CpBGlWSY3Y+KwTqetZA=
X-Google-Smtp-Source: ABdhPJyt1Y1Q+DQ2ndwyUmTy5hlGzYyodTN/wO4prd3EsNUELgk8lw81nAc/gAFQQsBmRShhQMBXTg==
X-Received: by 2002:a05:6808:179a:b0:2ef:8a55:b947 with SMTP id
 bg26-20020a056808179a00b002ef8a55b947mr1526142oib.95.1648685868041; 
 Wed, 30 Mar 2022 17:17:48 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm11149190oif.22.2022.03.30.17.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:17:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] target/ppc: init 'sregs' in kvmppc_put_books_sregs()
Date: Wed, 30 Mar 2022 21:17:16 -0300
Message-Id: <20220331001717.616938-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331001717.616938-1-danielhb413@gmail.com>
References: <20220331001717.616938-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 42814e1b97..9a2ee761d2 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -851,7 +851,7 @@ static int kvm_put_vpa(CPUState *cs)
 int kvmppc_put_books_sregs(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
-    struct kvm_sregs sregs;
+    struct kvm_sregs sregs = { };
     int i;
 
     sregs.pvr = env->spr[SPR_PVR];
-- 
2.35.1


