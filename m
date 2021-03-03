Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A870C32BC44
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:49:07 +0100 (CET)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZMg-0004o5-Md
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZKy-0002q6-Vk; Wed, 03 Mar 2021 16:47:20 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZKx-00024I-6Y; Wed, 03 Mar 2021 16:47:20 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e23so6324653wmh.3;
 Wed, 03 Mar 2021 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
 b=ob9T/IF8pG3omCkUey8hZX6Zx7f/qFNS8f64yw1AyRwFuSD076C682sM2erR4ocbQU
 JI/mwJBIvoQcvXgqXFvxtE6Mh59PC+5MAfHCa1hGm/7Bum2WBheuFYXSCbXb34FUBAz9
 EIshU88rrJBoDZXaFDDoD+WeCdTEYl+gx6LwgbO6YLUBRUbNlAd4ab6DynTVnLdtJQfm
 /mVCqTPvrwKM5u+F4e77Z2QaGYlBJ+nQRmbeQrSZw8+LH4j3tTdtz5/UNqikv2JiCLCx
 JgS00huMSB/2//7895ClqsbrdoWElh45WFNh+k28SaTDiTu8PQIvcC9/awgn+lxzgR1O
 bbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
 b=HcIjvyTYdnLpCX7i38GWNwUwuhzTQIxUg93IYOpJ3L9Q3g9wJx+Mvh0foaUrxLgRCe
 AL2WRNyqkEN3eBEZm5+eFTo5JYa4T8axr1/1IVOzIJjPxSd1xsazXh9JBOrvtXJy2oRd
 F+yBcrHzZzNyJlrkWpzyv7IdUVhqGjg9PqngJ0l2LpwNgqOqt/612qad8QPvf/gLvHbU
 erjkRUPc/063OB+FvBXgj9wWDkUQXJHPS7hlkEC+Gdkk5+1vbcL9IhecAzxSVseYyane
 Z+X0wpE81kc21ivQmwsRLcHu+p69Sz3IHbBSWrIg82GLkqd8MLj+OxOkCXvUmm8ZQ2yb
 ryEw==
X-Gm-Message-State: AOAM531GVW3f8/F+5pxWjGT4XQu61tuUuK6zm1iZGs1Gg6v6Z9iTcLZb
 d+BiBfEJJC4IYEtODKPj2mBS93Q3xak=
X-Google-Smtp-Source: ABdhPJybBxHmtOr0x6nDcz7UdD4f4F8QSQ9xmJkLn/T5NNXJUmDS9ipEVS2QHUW3kivntBbKi86dRA==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr838511wmo.188.1614808036119; 
 Wed, 03 Mar 2021 13:47:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r20sm7030784wmd.18.2021.03.03.13.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:47:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/28] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
Date: Wed,  3 Mar 2021 22:46:41 +0100
Message-Id: <20210303214708.1727801-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu model is the single device available in user-mode.
Since we want to restrict some fields to user-mode emulation,
we prefer to set the vmsd field of CPUClass, rather than the
DeviceClass one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.c      | 2 +-
 target/cris/cpu.c       | 2 +-
 target/hppa/cpu.c       | 2 +-
 target/m68k/cpu.c       | 2 +-
 target/microblaze/cpu.c | 2 +-
 target/openrisc/cpu.c   | 2 +-
 target/sh4/cpu.c        | 2 +-
 target/unicore32/cpu.c  | 2 +-
 target/xtensa/cpu.c     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 27192b62e22..faabffe0796 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -237,7 +237,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_alpha_cpu;
+    cc->vmsd = &vmstate_alpha_cpu;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed983380fca..29a865b75d2 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -293,7 +293,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_cris_cpu;
+    cc->vmsd = &vmstate_cris_cpu;
 #endif
 
     cc->gdb_num_core_regs = 49;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d8fad52d1fe..4f142de6e45 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -162,7 +162,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_hppa_cpu;
+    cc->vmsd = &vmstate_hppa_cpu;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->gdb_num_core_regs = 128;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 37d2ed9dc79..c98fb1e33be 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -533,7 +533,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_m68k_cpu;
+    cc->vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 433ba202037..335dfdc734e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -387,7 +387,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
-    dc->vmsd = &vmstate_mb_cpu;
+    cc->vmsd = &vmstate_mb_cpu;
 #endif
     device_class_set_props(dc, mb_properties);
     cc->gdb_num_core_regs = 32 + 27;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2c64842f46b..79d246d1930 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -204,7 +204,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_openrisc_cpu;
+    cc->vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
     cc->disas_set_info = openrisc_disas_set_info;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f8..bd44de53729 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -262,7 +262,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_num_core_regs = 59;
 
-    dc->vmsd = &vmstate_sh_cpu;
+    cc->vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 0258884f845..12894ffac6a 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -146,7 +146,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_uc32_cpu;
+    cc->vmsd = &vmstate_uc32_cpu;
     cc->tcg_ops = &uc32_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c1..6bedd5b97b8 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -218,7 +218,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    dc->vmsd = &vmstate_xtensa_cpu;
+    cc->vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
-- 
2.26.2


