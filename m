Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BF512D31
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:41:01 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njylo-00026B-Hk
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2F-0000TE-6K
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2C-00058I-TQ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:54 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g6so7638984ejw.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUsUzSQHyxKD1UsgzavpnogZrGGe+ChKRf/EREH9irg=;
 b=WJwhIcy8oNmQzus71WDUtBB4VKXelrlKlvNt65PHFLYTFddWTvKk6fki3+1le3ahFX
 hxoOMgGnyI00DoD5aIhxMIviqBiP72ehhNJ40nlHyiKPKl3DktGN1Y1JCKbOItHuawER
 R4iJDMa7ajAaW03X4lMzpT1wFpv4MAO9D/8WSmkn7DrQxTMk8tuJhugVX/IU8jEHQs4T
 W0KtJYRgQyFXeBrP07sqD+QlClMFW9WL+IFLnLCYwa34Xv2ZEQ+9qJfGPWNwevsYh2bJ
 MLeP/F7VSJ6pGap/LPfCzWv+g5PzF4zYDvGnCrObjOmugblEjAL4NHt+qhKZ4rbnQ5eI
 5sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aUsUzSQHyxKD1UsgzavpnogZrGGe+ChKRf/EREH9irg=;
 b=1iJYD1YwyYavuiBQK1rthozLyZu7aklMVuH1t1ZfYgbPFIg3coQMpPElr/wPHJsc6l
 eiUFCYgu/xCoWD6gfdOtvWyUVIbQ6iB3I8sHhbZAE+lKQNVW18CfTu97E76Mnozo/Om/
 g/7IiTbclxTSHWHxk2HcwjlOmNOQSzjcqcYQcjx5yB0YLmoadM0C+mNWAtHuJW6YlRd7
 Al6H5Vaz9sUiVK6TgAFkzmnap6WzgRs/mMA3nZ8fQZiTxhFzLRFUJ9z/VL94V+AUmG6w
 wlCnwrjCWPkExPGp1aB/D77sXIdozGILffroXLLSSOtBmE1Gx2oBkvYgRlULDoy2D69l
 KQbw==
X-Gm-Message-State: AOAM532u2jfkrwJ8As0tdAnMxp6N2Qty/4Yuuf8qZUHBcLUO7kvIJ6Yp
 vLdNeYO9CnV+8fBjScj42WAGmnlPZE6gDQ==
X-Google-Smtp-Source: ABdhPJyXi89TRZ8TxiXp9beaFKBxnIdISUNOc6FZviJPMYn9qiVHx14z8CL6GuR57o9onBbQHkGyrQ==
X-Received: by 2002:a17:907:969f:b0:6f3:dede:f2d2 with SMTP id
 hd31-20020a170907969f00b006f3dedef2d2mr1703286ejc.511.1651128831338; 
 Wed, 27 Apr 2022 23:53:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] meson: remove CONFIG_XEN_PCI_PASSTHROUGH from
 config-target.h
Date: Thu, 28 Apr 2022 08:53:33 +0200
Message-Id: <20220428065335.189795-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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

CONFIG_XEN_PCI_PASSTHROUGH is just a global configuration option;
it is never used in the source files, so there is no need to put
CONFIG_XEN_PCI_PASSTHROUGH in config-target.h or even in config-host.h.

This inaccuracy was copied over from the configure script in commit
8a19980e3f ("configure: move accelerator logic to meson", 2020-10-03).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/xen/meson.build | 20 ++++++++++++--------
 meson.build        |  2 --
 2 files changed, 12 insertions(+), 10 deletions(-)

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
index 9f2a12e1cf..ab1ac9b959 100644
--- a/meson.build
+++ b/meson.build
@@ -2242,8 +2242,6 @@ foreach target : target_dirs
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



