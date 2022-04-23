Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9950CA56
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:05:31 +0200 (CEST)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFS5-0004wt-CF
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFR-0007JX-7Z
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFP-00059E-ID
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:24 -0400
Received: by mail-ej1-x630.google.com with SMTP id t11so21110146eju.13
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XytWFLn4SuwfgOxb33+SYDso2NGsYvL0Z7yTVxZuTjE=;
 b=JqnsTCKl8AR+phI3SAWGo9latRy4OmPwod8S3fobVCrdwJZZ7Zz3KD6NdHmZn1+kde
 IBscrCpW0ztVhgZCnWV1qPvDZL32BtJYdVWeTzn7iv0HWLj1mvPpeDLjUH4LsChg8LLt
 cbaQdgwMOUPDUTcnIJ0qlquRebRDjjZYPrt8euqoEUr79ivzvxWrPPLyvUKP1cOWvvjM
 qqrXY6L3km1m4WSpa/RDv0k2/S/04Qk3ykOA8s7KXlfrvtYC/BC6i5l8HVgFLDqViRrV
 T2PKv0eTi0cnb6HKSgze5Kuqnw1MoHffPARKMQBrvs6NbEredvv5JhCOXKSJSLbR9zve
 /dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XytWFLn4SuwfgOxb33+SYDso2NGsYvL0Z7yTVxZuTjE=;
 b=QrPyC2dGkzZ3RIYZP/4Hm/04J0XF7R6+K5YYasM+uTXNHevZUdodaBmoes+zbRQYaB
 DTJ+rZvCi+6VzPvIbxQ9zmR9wPaiaTuVgoORhjomJFS4AHlexN+4usL0emJDM9QGewpw
 gtK22JkbX2CfnP5GLTfKbpN8kcHl6zL7DerJhTgL/a8CQc5CrGJTVSfel5mZ4/vK7+z1
 nalK3qgtDNeiORZ7Xy1MJlLDoedoxyPBfQGXOKM8Uimk8RS/LGnwfrFmKJ2EJEqyA2vS
 vEMU0jEGURS5VmtoFZ1BLPi8oV3LZb+UrzDuroUapGyvwi51rEfN20yXR5ThuQ/SIbkj
 0+Kw==
X-Gm-Message-State: AOAM530jI7R8Oo+kLQojB4JALi7hK4bkdkgieYtJmcCgZAxkOB8gzoPL
 yEOnvqxg57zFv78XJTdKgWgSM03epIA7Ig==
X-Google-Smtp-Source: ABdhPJx0lAAwbEQ+/L0NNrMM1V3Hfi2o/UJrfMziHGmkshVZ4BSnTrH6jDQneguEBeExtnvjc5gNWA==
X-Received: by 2002:a17:907:7d8b:b0:6ef:f0c9:9498 with SMTP id
 oz11-20020a1709077d8b00b006eff0c99498mr8175703ejc.706.1650718342233; 
 Sat, 23 Apr 2022 05:52:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/34] meson: remove CONFIG_XEN_PCI_PASSTHROUGH from
 config-target.h
Date: Sat, 23 Apr 2022 14:51:29 +0200
Message-Id: <20220423125151.27821-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_XEN_PCI_PASSTHROUGH is just a global configuration option;
it is never used in the source files, so there is no need to put
CONFIG_XEN_PCI_PASSTHROUGH in config-target.h or even in config-host.h.

This inaccuracy was copied over from the configure script in commit
8a19980e3f ("configure: move accelerator logic to meson", 2020-10-03).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v1->v2: remove CONFIG_XEN_PCI_PASSTHROUGH symbol

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
index e6015fcae4..19032a829b 100644
--- a/meson.build
+++ b/meson.build
@@ -2240,8 +2240,6 @@ foreach target : target_dirs
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



