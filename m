Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7A3C1616
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:35:46 +0200 (CEST)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W41-0002V8-6B
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn5-0000wo-Vc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:16 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn4-0008I4-EG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:15 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t10so2957656eds.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eIukGr2J9NCvld4Y1RkmikhmY84DuLDUkpsuXTN/Hs8=;
 b=tDFvm1Hnv5DTO0spvl2eq34e963+eZ9Wh8rmGAplUG9Wdam8Sylzy05CD1qWhow/tx
 2mbzP1QqMheWxWdBbS4aG3SQ5gCUUKpVw9FeNa/+4rwzYf3KAXGSv4lsm+uCHIovFhXw
 4gkrONVbu7CepE8Z8ViKiMEwqKEGSm7qZNG+kxlcZRRP+Wb/sZHEwiZCfXNA/BNVDj/0
 edVsGq+rmj/NhNMjXQ8ioMXcc/e8MprORtCy1sBlFxYL6ZxA10uBeJS2Udhg7H99NTWn
 rqlIwdrum/lR9Qy0exwuZtDRfJ2ZmclTrxQqxdzRfypnZoLr4xJBofzpJJqGn/1eT/UN
 4gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eIukGr2J9NCvld4Y1RkmikhmY84DuLDUkpsuXTN/Hs8=;
 b=QNCgLWvqSPuBPn8Fq5BmJUh131Zkb5AUVMRCOL5+gyWpgHv9ZsGCl9/BbGMyCfE8V9
 3YNXQ9QT7eipNRxqaFAgRWkMnDnjSyagRSuu2MggqDo3n1OwDVfBBiWznz25rUaMIk09
 8/WZdIMKoEBdoijLtGqfwGecfPP/+x6TXsD1GEN2csQokPW708bcV2PtB5TG3FG/IHYK
 EWqaRfgXc0GBUY4lCF1MU2gwf/EU885inQgvDi9YzyfdYxbAq7BWYO0dAC4eWm2klzht
 aLnTmrHEUPQZDMel1lZ/4gqdIRuEFGngVGfhhN2ppKBAaH7dgOUvdx1PEwLsMCebTnDm
 8FOQ==
X-Gm-Message-State: AOAM531hhjkyghifUZwTn1WCbiRr93nRM9GFJYvkH5mXC82td1+2DFTm
 GOCN+bwnRiPCD0MFUgjZc/U5dJF+IYo=
X-Google-Smtp-Source: ABdhPJwAtTmYGM4CFz9xfDa6ujy5NcuMY8suN5kggx4BvWyx2Mv/Azsynw/AZnhJspxwQxZ9VsV01Q==
X-Received: by 2002:aa7:da0c:: with SMTP id r12mr34368664eds.49.1625757493233; 
 Thu, 08 Jul 2021 08:18:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/48] accel: build tcg modular
Date: Thu,  8 Jul 2021 17:17:33 +0200
Message-Id: <20210708151748.408754-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Build tcg accel ops as module.
Which is only a small fraction of tcg.
Also only x86 for now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-30-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/meson.build |  5 ++++-
 meson.build           | 14 +++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 1236ac7b91..0ae9180282 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,8 +15,11 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
+))
+
+tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops.c',
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
-  'tcg-accel-ops-rr.c'
+  'tcg-accel-ops-rr.c',
 ))
diff --git a/meson.build b/meson.build
index c943e44975..d9aa2d7820 100644
--- a/meson.build
+++ b/meson.build
@@ -92,6 +92,8 @@ if cpu in ['x86', 'x86_64']
   }
 endif
 
+modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
 if get_option('install_blobs')
@@ -1531,6 +1533,11 @@ foreach target : target_dirs
       elif sym == 'CONFIG_XEN' and have_xen_pci_passthrough
         config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
+      if target in modular_tcg
+        config_target += { 'CONFIG_TCG_MODULAR': 'y' }
+      else
+        config_target += { 'CONFIG_TCG_BUILTIN': 'y' }
+      endif
       accel_kconfig += [ sym + '=y' ]
     endif
   endforeach
@@ -2002,6 +2009,7 @@ util_ss = ss.source_set()
 
 # accel modules
 qtest_module_ss = ss.source_set()
+tcg_module_ss = ss.source_set()
 
 modules = {}
 target_modules = {}
@@ -2242,7 +2250,11 @@ subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
 
 # accel modules
-target_modules += { 'accel' : { 'qtest': qtest_module_ss }}
+tcg_real_module_ss = ss.source_set()
+tcg_real_module_ss.add_all(when: 'CONFIG_TCG_MODULAR', if_true: tcg_module_ss)
+specific_ss.add_all(when: 'CONFIG_TCG_BUILTIN', if_true: tcg_module_ss)
+target_modules += { 'accel' : { 'qtest': qtest_module_ss,
+                                'tcg': tcg_real_module_ss }}
 
 ########################
 # Library dependencies #
-- 
2.31.1



