Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5A451C8D1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:18:16 +0200 (CEST)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgzP-0000HS-80
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYS-0002YI-P3; Thu, 05 May 2022 14:50:24 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:37830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYO-0004Ot-JW; Thu, 05 May 2022 14:50:24 -0400
Received: by mail-oi1-x234.google.com with SMTP id r1so5261781oie.4;
 Thu, 05 May 2022 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qo46eIt3CY06YeK+ivE+F/5vS7XIdMDSLi7s453OL4k=;
 b=ItDw4IVbwSN4BwuKpmxLQ1qCW05iymhTgOXVjmq0ZCWEkydrAm44vQpcYB704qoROs
 oaeWji7sKqWW+9+iY9cE8scLLPmi6WjK8HNm8gAJh7RlPkjfEdoY7ajRHdQng0IdI9tL
 CnpMBFqmmuXCoAvBWhluRDfKICkBoyMzJDp1iR6jap7uvpqE4tBEn6Y9tMyg7PHTTJSd
 geNMTAjVJOPe/rjcaEtE6WbOkwG6SiTJ7eA66Dj2jp+/6/GwR2Rqghl3L6+guc6/t5CH
 Wi1EHrbpo5r6vKF9mbA/dNm9jnkmt8ldyOh35xtueBH5CI/pKS2n8H4JiSvZio6ZOgNF
 1imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qo46eIt3CY06YeK+ivE+F/5vS7XIdMDSLi7s453OL4k=;
 b=DSbBAXoCSLUdXXjeGiECwSS03bL6ZcejEbW/QyLw3iA2UKXr4RTgUyV3+jFdVosZ3x
 wlKivhSPcPSNVfdAfav6vnRj2u2AvhBu6iovTMa7HiYNEyc+jGxbKPemPIZuv9L5gU0o
 olzFyHrunaWLLViUNjHZrFrq8b+PsNfVXmEj3FaEEangC37/7nnaFa9BuB0WX6QwVKg9
 Noo4FHUuNpLWiF5QFsO4i5F6ZcgfqtQoKR9PAJ/e1wK89XAF2xCs6i/MM162yOTVG8ru
 2d9ijuQckWFD+taqnIbVr04oNPrUixp1FyT8AEXRwtn8JuoRgJv+ToVShVHPNlXGqoKP
 f0BA==
X-Gm-Message-State: AOAM532FMaQDgffbplHJ3G8xsmkXkSETdb44K2GxJJ1mE1hMW/bGsU85
 m+aRZ4rcnn9GCLNUQoi8lKeKb2zghco=
X-Google-Smtp-Source: ABdhPJwrgUN/APIg+P86Iw1YQNnKormX7g2ieZjtQjTZvPjBnzewPbHXwpqxXBRrFYlV8LkflYNZKA==
X-Received: by 2002:a05:6808:220c:b0:325:c254:9b0a with SMTP id
 bd12-20020a056808220c00b00325c2549b0amr3045215oib.239.1651776616487; 
 Thu, 05 May 2022 11:50:16 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 04/30] target/ppc: init 'rmmu_info' in kvm_get_radix_page_info()
Date: Thu,  5 May 2022 15:49:12 -0300
Message-Id: <20220505184938.351866-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220331001717.616938-5-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index c4180b7270..7a777a4d0c 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -266,7 +266,7 @@ struct ppc_radix_page_info *kvm_get_radix_page_info(void)
 {
     KVMState *s = KVM_STATE(current_accel());
     struct ppc_radix_page_info *radix_page_info;
-    struct kvm_ppc_rmmu_info rmmu_info;
+    struct kvm_ppc_rmmu_info rmmu_info = { };
     int i;
 
     if (!kvm_check_extension(s, KVM_CAP_PPC_MMU_RADIX)) {
-- 
2.32.0


