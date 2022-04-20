Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A909B508CBC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:05:03 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCpC-0006r4-Jc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLh-0001RL-4H
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:33 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLe-0000w8-Ml
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id p18so2792773wru.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxqOzTdzbmYgDPvvFz8BwuvQY09siAutF2++Lp4ib4o=;
 b=QFhJbGSp+6ImLvEm88HTn+CXv8eKgPpYZXiWfnq+9ZfLlOdOH0kNDxeD7KOMuN86i2
 z5oJVqhxMw7U1VbcN7kl0eCnwiJBNnHBe3KZ8pqxcLPmVgf9nEe/7Jj6rscoU9FwJPmv
 pUCGEvJxTrTLR0k9CKoTZPGB24vek8tjJYQFrog4j6mf/xLtdh/E8EhK/zmEWUHDtlMz
 cx38UpSsuaKO7tYQO2H4NdfHPcSB0Z2SBXPblvtLy9gtRtKpyrjlMd9poJC3yp+Y/Uvz
 ZQN4f0P9ltDr9P88C6BlW/xYHiZdBWXJcAH25RoOYOqM+P9bxHyTTmXOIgzDaYwCLM6o
 v/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PxqOzTdzbmYgDPvvFz8BwuvQY09siAutF2++Lp4ib4o=;
 b=TfUIDmQ1SnedxQHwF2KArWAxs1jKKTEaD0CJODI5Ks8cHt5yfjBVow2dsopeLfUzDo
 BY6g0bXHlYWWKMvEcHjkGEVKRCn71yqnZbzm456srvrLhIhVlJK0hIChOyrRk0vR/8Rx
 ETZ8GDnzDFCliQCOEcExno9qqeHB1amzi95j5FkahkQlCMRfR+VYQcmYxEc6aSoBtArG
 vZI4d7XtOBkBDbAuyuj9mAahQi5zf2hj4/sj7Qe4ajAe2mhxy33TuFcOsBKmfgs0E37A
 c4d/gNN4mPXaYq99zyW1DAs06XMG/6uD3uD6db+qO+xVuqf1AdFkR8ebKRy/1VU1yCi4
 POiA==
X-Gm-Message-State: AOAM532YMOqKbYEzsBvXPtASe+Dx+Ir94UWmcEA+GpfDLRUo3YLizCVP
 LDgXCDD16BJWli1p+yqvP3C0I52rzQhXbw==
X-Google-Smtp-Source: ABdhPJxITre6WKg5JLJ98bDM07XY5bpx0FHv81cW5GyY1CqGrjkMfivgs4Zyf43ldpeg28wwuzYbaA==
X-Received: by 2002:a5d:4882:0:b0:207:97dd:111c with SMTP id
 g2-20020a5d4882000000b0020797dd111cmr17194809wrq.115.1650468869370; 
 Wed, 20 Apr 2022 08:34:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/34] meson: move CONFIG_XEN_PCI_PASSTHROUGH to config-host.h
Date: Wed, 20 Apr 2022 17:33:45 +0200
Message-Id: <20220420153407.73926-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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

CONFIG_XEN_PCI_PASSTHROUGH is just a global configuration option; the selection
of the actual files in hw/xen/meson.build is also conditional on CONFIG_XEN,
so there is no need to put CONFIG_XEN_PCI_PASSTHROUGH in config-target.h.

This inaccuracy was copied over from the configure script in commit
8a19980e3f ("configure: move accelerator logic to meson", 2020-10-03).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/xen/meson.build | 20 ++++++++++++--------
 meson.build        |  3 +--
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 076954b89c..08dc1f6857 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -8,13 +8,17 @@ softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
 ))
 
 xen_specific_ss = ss.source_set()
-xen_specific_ss.add(when: 'CONFIG_XEN_PCI_PASSTHROUGH', if_true: files(
-  'xen-host-pci-device.c',
-  'xen_pt.c',
-  'xen_pt_config_init.c',
-  'xen_pt_graphics.c',
-  'xen_pt_load_rom.c',
-  'xen_pt_msi.c',
-), if_false: files('xen_pt_stub.c'))
+if have_xen_pci_passthrough
+  xen_specific_ss.add(files(
+    'xen-host-pci-device.c',
+    'xen_pt.c',
+    'xen_pt_config_init.c',
+    'xen_pt_graphics.c',
+    'xen_pt_load_rom.c',
+    'xen_pt_msi.c',
+  ))
+else
+  xen_specific_ss.add('xen_pt_stub.c')
+endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
diff --git a/meson.build b/meson.build
index b8046efcf1..84156df809 100644
--- a/meson.build
+++ b/meson.build
@@ -1627,6 +1627,7 @@ config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
+config_host_data.set('CONFIG_XEN_PCI_PASSTHROUGH', have_xen_pci_passthrough)
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2228,8 +2229,6 @@ foreach target : target_dirs
       config_all += { sym: 'y' }
       if sym == 'CONFIG_TCG' and tcg_arch == 'tci'
         config_target += { 'CONFIG_TCG_INTERPRETER': 'y' }
-      elif sym == 'CONFIG_XEN' and have_xen_pci_passthrough
-        config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
       if target in modular_tcg
         config_target += { 'CONFIG_TCG_MODULAR': 'y' }
-- 
2.35.1



