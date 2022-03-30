Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A364ECE91
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:10:07 +0200 (CEST)
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfZu-0003ZF-Au
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:10:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfV1-0003bR-90; Wed, 30 Mar 2022 17:05:03 -0400
Received: from [2001:4860:4864:20::2f] (port=43158
 helo=mail-oa1-x2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUz-0003Jw-RS; Wed, 30 Mar 2022 17:05:02 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so10889967fac.10; 
 Wed, 30 Mar 2022 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lL7H2QIk1rs7GW6yHadg7JRxQ47pjPye7VdUjbYVtaU=;
 b=HznvaKMIC4K7QhhDxQJO4jf/D0/UnTAexrd6bgAWselWDFvl4nLo2CHXkRmKv2iv55
 /xCHoeTLgxoMnoOdKX/jd6k91DJQNOzjj/uZwJUstSHD5J7lL6Y8LzOFWsAF9MXUdW5F
 7BqGsiI8u5kxEIR5Ad/CDC02d0/MWwV1hRiYzZVf9TOcu1b82kMV/+WvQgBWcUZUm6xk
 hvaT+OnH+1Ti0hvxQ0kMHCCeXwei8RDFKGMNLOc64yZdpFqBPkWvdQxjaaUcCUde0lix
 EgAT16xr7fPYPXK9UtuYpDR1RJQetkOo8l2bT9FgWsD+lfONfWDaELz2gUI5lcUExMhh
 a1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lL7H2QIk1rs7GW6yHadg7JRxQ47pjPye7VdUjbYVtaU=;
 b=zKnoXFUZKBW+ra9CgFOzYby/luC19v9nyoKb86H9BSrbq0WLoSVFawG/6hKJRGosS5
 ToJE/feg/WkSjtbDDejertKsTb0H9rTYsZN9pbC28UbqM8Cn3xydBUft9A/lWYOXRuv6
 o3+Whz3JxihSlszKvDA7sUm41EN6d+xhNti6FznRHLdh061WagWXGWAIYoG89wN1QUG6
 xxd/d2SE+TviRimQXbV2XVT9nIBgcHVCcIdhD71ufTW8zy+zec425U1+iFJIOwxtlnU7
 UDNgPHA6j2xED5H5dMRfFueS4JlO8HBhtW5nvQwI8PFdVLKQ6a9ffIXqMqqNzuqAbiVg
 3nMg==
X-Gm-Message-State: AOAM5312DWAwIUmUT1tuI0bHc8D01Uxm4jwJcctO8PJbDdRtyhkHg9FA
 qw9NU3lhqunwerbB77cmOKFgLQJZtns=
X-Google-Smtp-Source: ABdhPJwRHzx/7AYf8ZGD08jsWoooxc4dh6CBsXGrFvpdpubxYEUdtzfRb/sGhk0CD00scL0JorjJ+w==
X-Received: by 2002:a05:6870:1683:b0:dd:cdf2:47d6 with SMTP id
 j3-20020a056870168300b000ddcdf247d6mr978821oae.50.1648674300289; 
 Wed, 30 Mar 2022 14:05:00 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05687044d300b000de4e33171csm9988617oai.34.2022.03.30.14.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:05:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/ppc: init 'rmmu_info' in kvm_get_radix_page_info()
Date: Wed, 30 Mar 2022 18:04:43 -0300
Message-Id: <20220330210443.597500-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330210443.597500-1-danielhb413@gmail.com>
References: <20220330210443.597500-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2f
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

Init the struct to avoid Valgrind complaints about unitialized bytes,
such as this one:

==39549== Syscall param ioctl(generic) points to uninitialised byte(s)
==39549==    at 0x55864E4: ioctl (in /usr/lib64/libc.so.6)
==39549==    by 0xD1F7EF: kvm_vm_ioctl (kvm-all.c:3035)
==39549==    by 0xAF8F5B: kvm_get_radix_page_info (kvm.c:276)
==39549==    by 0xB00533: kvmppc_host_cpu_class_init (kvm.c:2369)
==39549==    by 0xD3DCE7: type_initialize (object.c:366)
==39549==    by 0xD3FACF: object_class_foreach_tramp (object.c:1071)
==39549==    by 0x502757B: g_hash_table_foreach (in /usr/lib64/libglib-2.0.so.0.7000.5)
==39549==    by 0xD3FC1B: object_class_foreach (object.c:1093)
==39549==    by 0xB0141F: kvm_ppc_register_host_cpu_type (kvm.c:2613)
==39549==    by 0xAF87E7: kvm_arch_init (kvm.c:157)
==39549==    by 0xD1E2A7: kvm_init (kvm-all.c:2595)
==39549==    by 0x8E6E93: accel_init_machine (accel-softmmu.c:39)
==39549==  Address 0x1fff00e208 is on thread 1's stack
==39549==  in frame #2, created by kvm_get_radix_page_info (kvm.c:267)
==39549==  Uninitialised value was created by a stack allocation
==39549==    at 0xAF8EE8: kvm_get_radix_page_info (kvm.c:267)

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 657e735f9d..f22cf75ade 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -267,7 +267,7 @@ struct ppc_radix_page_info *kvm_get_radix_page_info(void)
 {
     KVMState *s = KVM_STATE(current_accel());
     struct ppc_radix_page_info *radix_page_info;
-    struct kvm_ppc_rmmu_info rmmu_info;
+    struct kvm_ppc_rmmu_info rmmu_info = {0};
     int i;
 
     if (!kvm_check_extension(s, KVM_CAP_PPC_MMU_RADIX)) {
-- 
2.35.1


