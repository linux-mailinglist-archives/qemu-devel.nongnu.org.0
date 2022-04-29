Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41B514FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:41:11 +0200 (CEST)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSk2-0002Yy-V1
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSTA-0002SB-21
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:44 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkST7-0006Be-1M
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id z99so9467581ede.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsqERVld/Vgbjv/4b6J7clpMk83aXIOS3f77wbhSlQ0=;
 b=kbKxR095oUYab7R6g4q3jh3EzhScaTbF1nXSZ/qvN2YwIu/wFcUY7r1fUQ3liDOxkE
 E3ljJvFlLy8kEkb/W0yTDjdacZkXJ6KE16M/CXElyLAokPRaCZmg71dFFqYx4dfNpD4t
 2jwSEKLgNypvcr51Qd2xG1KP7YGFjj8FK8nSWrm1wsfmGHDriydLdI97w7NNF5uowuuf
 6w3aOV6MjZRylU6vlXvImqAPus4pgbcosWgMK5qPNUu3AraKBUcdd8by0wLREYda63Q+
 3aPaTrBzfM4BsvOuJPacrzUm1UNBCunrg5d/sSQ6NNP+RM41kFnmmgeq1EbLH/lB2XQQ
 zGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fsqERVld/Vgbjv/4b6J7clpMk83aXIOS3f77wbhSlQ0=;
 b=mteoGh89MOhOuSjfqSb3yCMRZs7W/r5mC2gQYVrhhCPMtY0z/bLFX/HLtQJBT62dmx
 dU4eVR2JAeOpHcQZ534sBHz/U4mhR8u63SLo+xLwgkjJvJCawyRqIjzSweNr+AR8FXIa
 nlPaP0OoCFysm6NQw5o+yHvMYiZw68mxZyBXq5ej8dkbAMWrscbzEzHdRZJbZVGOGdCq
 ZU7XupWU0GKqe1g8gZoHB8hhj3oSOaSaWu3oYVdcTOvVE8MvvyaMuQTmg2dPHqwceeWn
 QteBzr/XTTS16fJr5iG27mIe7p0x/Mz/vhd8OLE8Ybet99wRzopdXQLGBgPwdpHq2yX1
 WCRA==
X-Gm-Message-State: AOAM531Jqgsz7r6IUtNWHwg5/GLqjSM9+qgQkB1EbbBn2ddR2INDMQ6r
 jtcSGLpVCzasCELytQEbgMKQeLIAhMKLqA==
X-Google-Smtp-Source: ABdhPJzsisWNgu3+r2kQ2e3lCnN9zYVhmXYCIkMHjGdlFeIkj9/1IO9Ic4T1wnkZdFuUypPQVCkzaQ==
X-Received: by 2002:a05:6402:516:b0:425:c896:b1b8 with SMTP id
 m22-20020a056402051600b00425c896b1b8mr35923485edv.212.1651245814117; 
 Fri, 29 Apr 2022 08:23:34 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/25] pc: remove -soundhw pcspk
Date: Fri, 29 Apr 2022 17:23:12 +0200
Message-Id: <20220429152312.335715-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The pcspk device is the only user of the init_isa function, and the only
-soundhw option which does not create a new device (it hacks into the
PCSpkState by hand).  Remove it, since it was deprecated.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/pcspk.c           | 10 ----------
 hw/audio/soundhw.c         | 27 ++++-----------------------
 include/hw/audio/soundhw.h |  3 ---
 3 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index dfc7ebca4e..daf92a4ce1 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -245,18 +245,8 @@ static const TypeInfo pcspk_info = {
     .class_init     = pcspk_class_initfn,
 };
 
-static int pcspk_audio_init_soundhw(ISABus *bus)
-{
-    PCSpkState *s = pcspk_state;
-
-    warn_report("'-soundhw pcspk' is deprecated, "
-                "please set a backend using '-machine pcspk-audiodev=<name>' instead");
-    return pcspk_audio_init(s);
-}
-
 static void pcspk_register(void)
 {
     type_register_static(&pcspk_info);
-    isa_register_soundhw("pcspk", "PC speaker", pcspk_audio_init_soundhw);
 }
 type_init(pcspk_register)
diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index 173b674ff5..f7d94d7dfa 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -36,26 +36,12 @@ struct soundhw {
     const char *typename;
     int enabled;
     int isa;
-    union {
-        int (*init_isa) (ISABus *bus);
-        int (*init_pci) (PCIBus *bus);
-    } init;
+    int (*init_pci) (PCIBus *bus);
 };
 
 static struct soundhw soundhw[9];
 static int soundhw_count;
 
-void isa_register_soundhw(const char *name, const char *descr,
-                          int (*init_isa)(ISABus *bus))
-{
-    assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
-    soundhw[soundhw_count].name = name;
-    soundhw[soundhw_count].descr = descr;
-    soundhw[soundhw_count].isa = 1;
-    soundhw[soundhw_count].init.init_isa = init_isa;
-    soundhw_count++;
-}
-
 void pci_register_soundhw(const char *name, const char *descr,
                           int (*init_pci)(PCIBus *bus))
 {
@@ -63,7 +49,7 @@ void pci_register_soundhw(const char *name, const char *descr,
     soundhw[soundhw_count].name = name;
     soundhw[soundhw_count].descr = descr;
     soundhw[soundhw_count].isa = 0;
-    soundhw[soundhw_count].init.init_pci = init_pci;
+    soundhw[soundhw_count].init_pci = init_pci;
     soundhw_count++;
 }
 
@@ -158,18 +144,13 @@ void soundhw_init(void)
                 } else {
                     pci_create_simple(pci_bus, -1, c->typename);
                 }
-            } else if (c->isa) {
-                if (!isa_bus) {
-                    error_report("ISA bus not available for %s", c->name);
-                    exit(1);
-                }
-                c->init.init_isa(isa_bus);
             } else {
+                assert(!c->isa);
                 if (!pci_bus) {
                     error_report("PCI bus not available for %s", c->name);
                     exit(1);
                 }
-                c->init.init_pci(pci_bus);
+                c->init_pci(pci_bus);
             }
         }
     }
diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
index f09a297854..e68685fcda 100644
--- a/include/hw/audio/soundhw.h
+++ b/include/hw/audio/soundhw.h
@@ -1,9 +1,6 @@
 #ifndef HW_SOUNDHW_H
 #define HW_SOUNDHW_H
 
-void isa_register_soundhw(const char *name, const char *descr,
-                          int (*init_isa)(ISABus *bus));
-
 void pci_register_soundhw(const char *name, const char *descr,
                           int (*init_pci)(PCIBus *bus));
 void deprecated_register_soundhw(const char *name, const char *descr,
-- 
2.35.1


