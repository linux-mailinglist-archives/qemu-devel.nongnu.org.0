Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE70511658
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:34:42 +0200 (CEST)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfwP-0003jE-EP
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuK-0000qG-N4
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:38 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuI-0001oU-4K
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:31 -0400
Received: by mail-ej1-x631.google.com with SMTP id bv19so2788098ejb.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dI4QUL68g98m6gN/IHVwAh/Pz9XOOQumqChvJ9IcdoQ=;
 b=ZY7jA/N+mjlBmLfSSPW2h6w0FG3FprhdhRjMHgMK6dG5cIb6f3oey9s81oz/bgUDJs
 52yXCgNHbUWNDu0Nn+v1zQ8w9aaVFjRf+76RwBpiqUB+yhv0KrSFZm1togyHfhWbsRrC
 1lGE/24NooH01TEIxe3A7oiqBBlnEcQMiW3Dzt5X9yoeP47BiBqawVPzOm6C3M4SN6LQ
 bMEOI7teSHGpJwUnhXAZt+DEGoqg8phtuQ/GTNmxlEfKc2dBlQzlGuoPmurRHOzZMz8J
 lLT7klzb6iYWvVHsk4qP+up34c1vaZHR2l9kgTxbUgKGWqeGwz3ssXCjAwKUHf1OkAt5
 rahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dI4QUL68g98m6gN/IHVwAh/Pz9XOOQumqChvJ9IcdoQ=;
 b=28F2+16YyG5buzVNYWP4NxWBA+5dNMAEGVjh+r8p6sIeur4VtMXihaC4TMoSQel+wk
 59B9QrbbNaDUfVAtQtW/X44k1vtbPBjH1WD65HGgXfeO/xeCb88RYyDJqFEQrpfzPlyt
 d9U2qZN7KjLGHz83dQ2NnNFtftOxIwCpO2UBXhhGXGw954HxAS1KhXMbJTCI3BgH4SjI
 enJisXXCVmQdUTKZlLTIqiH1hNO9OUENVSgYVSuadBhp0x6VNphTNLHP22tsYTOhh9CJ
 JXQwO3b2qzwGeg5GNbSN4DeG86THw2+b/CAd0LtgrAVtH7wTZjov5CFu2/vH1MZOrww/
 dxEQ==
X-Gm-Message-State: AOAM532+hNLo35KcejCXK5ipP/i8fHcaKeQ/cmq6tlNClQOzXoxtPVfx
 1EkuJm9TqSXd1j6HxUhTafUXOci+JiALgw==
X-Google-Smtp-Source: ABdhPJzqE4H9zjblr/8xwKZPHHnAaItU9t/J+G0OLAQNh763TiPJIKmw5YhNZFODG9FwzF1jIk/Ubw==
X-Received: by 2002:a17:907:97cd:b0:6f3:aeb8:6002 with SMTP id
 js13-20020a17090797cd00b006f3aeb86002mr7883145ejc.530.1651059148557; 
 Wed, 27 Apr 2022 04:32:28 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b006f3a7ffbb0esm3099216ejd.70.2022.04.27.04.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:32:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/6] pc: remove -soundhw pcspk
Date: Wed, 27 Apr 2022 13:32:20 +0200
Message-Id: <20220427113225.112521-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427113225.112521-1-pbonzini@redhat.com>
References: <20220427113225.112521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: mkletzan@redhat.com, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pcspk device is the only user of isa_register_soundhw, and the only
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



