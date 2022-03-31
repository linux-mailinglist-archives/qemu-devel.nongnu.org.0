Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8648A4ED0EA
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:34:00 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZilD-0002NN-KY
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:33:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVh-0006AJ-5Q; Wed, 30 Mar 2022 20:17:58 -0400
Received: from [2001:4860:4864:20::35] (port=42704
 helo=mail-oa1-x35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVf-0003PW-QV; Wed, 30 Mar 2022 20:17:56 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso23729620fac.9; 
 Wed, 30 Mar 2022 17:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91ShIgpwNWCBuBbxRpeNrUDy7Nsh7D/rbmK6SUKEBDs=;
 b=R6BjLQJTxu3+vmuAE2E3R3JPGlZDeoNNla2eRTpMKW1UZUpTvanoeoKa9zqp9iF/cN
 ySCjWXygkBdPh4QUdAS2w5mar7iakDvgMA6ws2Rv2QYZHoNPMuulUcF82ePCu6OIzCEG
 SG2h22zz4WKZgSCBhAoHDOc8sGxeZLByZ2kvyF6uDTLe2/BIEEgIGvfdN1tU+fcEsg31
 oh0qOs4S4g6goxUyPDwLBbQQRD9YLA9mq0lRYW5cbNKpEiprRj9lUZv6egjIdGGw/Uy5
 xX2Py7cV2M2PG5vclb4Fmakqy/DXwal8h0/7R5DLSkRtVTvzJOc+HE4EOncPSo2cuevx
 tcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=91ShIgpwNWCBuBbxRpeNrUDy7Nsh7D/rbmK6SUKEBDs=;
 b=2u1t06iuApzLA2/XEStULK/QCfqu7xoMkDlDRFAD1CGALo0ZjxHB8JboLPufVq8cCT
 zHLS4OeK8+8gxJDjGMYabmi9e4YPrc2ijp3XaSgiBCUB1CAb8gXUM+fpWzDwJh7u2EEq
 f/JaKTH9hij3lPH6B/73IAWGUj7CjxvA9fh5NOBUCItWMJM/m4aJDgjxykguRIYIUxn5
 CygQAiBFj1jCiIW4QR4Wi3B9Vj109Ntr8uvXTY6zAWF2WpbJYa7bwfaJnOG2yr5s3sff
 CzLIYEWGY1GUuMKjYLBBhjO4bu0GErHWptyBYcr3R8JNL9CUyf2YuZ2xFwuZtX01TdYe
 D7LA==
X-Gm-Message-State: AOAM53377MY9c12w4QOw5zsNjO17w8mU6x/jnT1Exmo7TK7b8LkRYx/6
 D9hiNQ2CufxCNhj3mZWmnbxTb1RseFc=
X-Google-Smtp-Source: ABdhPJwUU8g+NxJe0iPLXzYsYBk7x6RO/MkJdJ1Z1syDJ50gKC+qcEd4MDqgq26zqZAX8NUPCZ652w==
X-Received: by 2002:a05:6870:9611:b0:df:200f:a6dd with SMTP id
 d17-20020a056870961100b000df200fa6ddmr1319646oaq.299.1648685870660; 
 Wed, 30 Mar 2022 17:17:50 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm11149190oif.22.2022.03.30.17.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:17:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] target/ppc: init 'rmmu_info' in
 kvm_get_radix_page_info()
Date: Wed, 30 Mar 2022 21:17:17 -0300
Message-Id: <20220331001717.616938-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331001717.616938-1-danielhb413@gmail.com>
References: <20220331001717.616938-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::35
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 9a2ee761d2..a3130013b3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -267,7 +267,7 @@ struct ppc_radix_page_info *kvm_get_radix_page_info(void)
 {
     KVMState *s = KVM_STATE(current_accel());
     struct ppc_radix_page_info *radix_page_info;
-    struct kvm_ppc_rmmu_info rmmu_info;
+    struct kvm_ppc_rmmu_info rmmu_info = { };
     int i;
 
     if (!kvm_check_extension(s, KVM_CAP_PPC_MMU_RADIX)) {
-- 
2.35.1


