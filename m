Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E064ECE8E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:07:37 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfXV-00074q-1w
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:07:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUz-0003Tn-Ed; Wed, 30 Mar 2022 17:05:01 -0400
Received: from [2001:4860:4864:20::2b] (port=39092
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUx-0003Ji-UO; Wed, 30 Mar 2022 17:05:01 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-deb9295679so16093303fac.6; 
 Wed, 30 Mar 2022 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCeHPx+YPPizP4RoU57Q+beNMp8uzlcZWD496c9+7uY=;
 b=hk8RE61HY9/HDl6oEX+MeJ3qFwPPoe2cODHKVEhWQ6ePZplxN5G2idEZgzyEgwk3Jo
 FEIHeIgnsxn7HxAY13iulWmcX/GgdyzB0Zemu6t4NMSWWLWxHnZyasNde7IgHDkWuZ4S
 BEUJC67FDWEHK/4ScfYO3NseOj3EL08GjXCqwFaUVcO+vVjDzwoROuR69+4i5UZYL9Bm
 p2jr3hZAlkKAl+mMJPs1JBqK9gMsmpHRZHwgrtxgGPGtTPRq9zmTsynhd6TIrMwohfyR
 bmh21TOoghlE0hANN9U4WJv3VPFpSR1ANZMfO8zn5LI5fZX0Mw4MwM+SxfpM8UJ8MVHo
 ar1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zCeHPx+YPPizP4RoU57Q+beNMp8uzlcZWD496c9+7uY=;
 b=nj0NuI28phh9hNjkmSgrwRC30qbCQGiUB44CoakNH7ILN5T6y+H0k4pdagCmNv/czA
 Lmv7qzR8AegxloHR8fkQWDXefF33tgVloYYJ76BDL0j7MQrD746vmz7rXzL0MQG+anQc
 xTNmupZbiL7+eVkyKPWHUP/5GqDi4AWleQ6MND8/zegJ7MjgKwjjT3Ew5Qk2WH5ch3IU
 whlKv72u8f2flyAubJWe9BpVcTmQi4zWghWNNWctOaePU78gpz0cNgSSfkk+bQTIA8yB
 SctTeB3U4cl0Z7bdpmsYUcciB6FfQpli7zDPE/G/pD/sFUe7m6Nmb0t3Aq243xMdC8U2
 7g4Q==
X-Gm-Message-State: AOAM533s0a9/IeZeTEZ09gO/h8RfcjZaFQGF8AeWFfybczB5/rPsJxFq
 muBx07MiiZRIv4jmC+M/+tEmXwcyvIc=
X-Google-Smtp-Source: ABdhPJwRxYP8KvWiWE9GJN8fYLWpk8A7HJNATnl5Ts4Itx3+dm/FIGNT3sDO4MO5Bm88c1wl44TAKA==
X-Received: by 2002:a05:6870:d24c:b0:de:243b:7ac3 with SMTP id
 h12-20020a056870d24c00b000de243b7ac3mr903425oac.97.1648674298260; 
 Wed, 30 Mar 2022 14:04:58 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05687044d300b000de4e33171csm9988617oai.34.2022.03.30.14.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:04:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/ppc: init 'sregs' in kvmppc_put_books_sregs()
Date: Wed, 30 Mar 2022 18:04:42 -0300
Message-Id: <20220330210443.597500-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330210443.597500-1-danielhb413@gmail.com>
References: <20220330210443.597500-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 9fb13b23d8..657e735f9d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -852,7 +852,7 @@ static int kvm_put_vpa(CPUState *cs)
 int kvmppc_put_books_sregs(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
-    struct kvm_sregs sregs;
+    struct kvm_sregs sregs = {0};
     int i;
 
     sregs.pvr = env->spr[SPR_PVR];
-- 
2.35.1


