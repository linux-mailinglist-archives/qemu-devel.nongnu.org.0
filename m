Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E4663D4B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFAKv-0004DV-1z; Tue, 10 Jan 2023 03:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFAKP-0004Ca-1B
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFAKM-0002Va-JI
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673340589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vIShYGO9WdhQiPZm0PFpeZZ+9VyMKYo36UihVeQYZBU=;
 b=EB7jikET1OYahw3MJoDtxe9yo33nZcgssr2FEfZs1pogiXeDrYDbwO8TjVAVlRQfI2oank
 rgOy1JlHYW+P6b78fenf12y9JkGb9ZUlEPGEmtQxCq8fb1j5w7LQ4GgSbsHmgz7msiICtz
 Ym42AFWdrOfQgcAVYExhKYAztLm8LUo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-_QqqIiw0OtmJwW-gaDBTSQ-1; Tue, 10 Jan 2023 03:49:48 -0500
X-MC-Unique: _QqqIiw0OtmJwW-gaDBTSQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h18-20020a05640250d200b004758e655ebeso7087876edb.11
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vIShYGO9WdhQiPZm0PFpeZZ+9VyMKYo36UihVeQYZBU=;
 b=tsIFdIwjDkg8nchWzZBd7cwg5/seuF4x4VLelKEIcZHM7/GhfLO0IgoddOKrfZGs7t
 GvpejBd0A9dc37Zp43zqzwS0HR3bL0j/WZc4Xp8RUFhZ7anhwAhSHB9ZMyWNsNBqgl74
 n6lt4UnqE5cXfeOzMr05kRqzVZr0WxBsJ926J0Hw5XethreAafPUlwaaIFJUNJQaFflp
 pTOBp41XFGp6LdBLqfxhEPKLLHykzjdt6GhpyUWZRox543XZ1DuBxk78lJ38GlteOkeN
 Az/M5bCJwphd3gQehdQSGdrfATSgi54gvf+2QJ0CcSWeMUM/t6GIQ/AeOi4uLH+PqzvD
 6EEQ==
X-Gm-Message-State: AFqh2kpVn74OFZR5TpPPrOz3izednWfP2Vr+eA1IUuviKdIHonRGvfDe
 DKAcbO9oP11zIp2ybg2chR61pMnouH1P/u3pFg9vEJDy2tlN9mlFqkqTV21Z75xymvOQVpDCfbO
 OCv66ol6ucePSllGLowYEx2xHfowPMex8isL1bHafGto/VUOr0+GJr90e195wJ/UNWuk=
X-Received: by 2002:a17:906:d047:b0:78d:f454:ba46 with SMTP id
 bo7-20020a170906d04700b0078df454ba46mr57065402ejb.69.1673340585805; 
 Tue, 10 Jan 2023 00:49:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFCQxzKIjSG3msbgqLaAm8konSJmyKvYAYGhlAhMcCRlbY7B7GNhmKRKl8Hp49d/mDB05U8g==
X-Received: by 2002:a17:906:d047:b0:78d:f454:ba46 with SMTP id
 bo7-20020a170906d04700b0078df454ba46mr57065387ejb.69.1673340585472; 
 Tue, 10 Jan 2023 00:49:45 -0800 (PST)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007c0b28b85c5sm4650208ejt.138.2023.01.10.00.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:49:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] mips: always include nanomips disassembler
Date: Tue, 10 Jan 2023 09:49:42 +0100
Message-Id: <20230110084942.299460-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the nanomips disassembler is not C++ code anymore, it need not
depend on link_language == cpp.  Always include it and remove the
CONFIG_NANOMIPS_DIS symbol.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 disas/meson.build     | 3 +--
 include/exec/poison.h | 1 -
 meson.build           | 7 +------
 target/mips/cpu.c     | 2 --
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/disas/meson.build b/disas/meson.build
index 1977f5cd92ef..c865bdd8827f 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -4,8 +4,7 @@ common_ss.add(when: 'CONFIG_HEXAGON_DIS', if_true: files('hexagon.c'))
 common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
-common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
-common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.c'))
+common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c', 'nanomips.c'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
diff --git a/include/exec/poison.h b/include/exec/poison.h
index f0959bc84ef5..140daa4a85a4 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -74,7 +74,6 @@
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
-#pragma GCC poison CONFIG_NANOMIPS_DIS
 #pragma GCC poison CONFIG_NIOS2_DIS
 #pragma GCC poison CONFIG_PPC_DIS
 #pragma GCC poison CONFIG_RISCV_DIS
diff --git a/meson.build b/meson.build
index 175517eafde8..bfb461d1efac 100644
--- a/meson.build
+++ b/meson.build
@@ -2478,7 +2478,7 @@ disassemblers = {
   'x86_64' : ['CONFIG_I386_DIS'],
   'm68k' : ['CONFIG_M68K_DIS'],
   'microblaze' : ['CONFIG_MICROBLAZE_DIS'],
-  'mips' : ['CONFIG_MIPS_DIS'],
+  'mips' : [ 'CONFIG_MIPS_DIS'],
   'nios2' : ['CONFIG_NIOS2_DIS'],
   'or1k' : ['CONFIG_OPENRISC_DIS'],
   'ppc' : ['CONFIG_PPC_DIS'],
@@ -2490,11 +2490,6 @@ disassemblers = {
   'xtensa' : ['CONFIG_XTENSA_DIS'],
   'loongarch' : ['CONFIG_LOONGARCH_DIS'],
 }
-if link_language == 'cpp'
-  disassemblers += {
-    'mips' : [ 'CONFIG_MIPS_DIS', 'CONFIG_NANOMIPS_DIS'],
-  }
-endif
 
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c614b04607a2..a216cb0df072 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -439,9 +439,7 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
         info->print_insn = print_insn_little_mips;
 #endif
     } else {
-#if defined(CONFIG_NANOMIPS_DIS)
         info->print_insn = print_insn_nanomips;
-#endif
     }
 }
 
-- 
2.38.1


