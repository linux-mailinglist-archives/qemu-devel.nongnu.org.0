Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B356550CAA8
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:34:59 +0200 (CEST)
Received: from localhost ([::1]:40624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFuc-00060Y-Mo
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFG6-0007YO-Np
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFG3-0005ET-KS
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:06 -0400
Received: by mail-ej1-x635.google.com with SMTP id y20so21164108eju.7
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NMMht5ergvHlMH690NYrKkg4t00Bp8kaavqfbrCsGQE=;
 b=qYtcioSNIzsbSMumUNbUQEbaDRjXpJEk2Ac1PVGRk8daWmGSjkT4WFo3Yw0ZlqHmSE
 4doPQ4OTE1Gvx2X7heS/1vYDUZ7LuzgNPoXmsx0UYSspkCFBHCoMeJcx2M1qHzYWqNus
 M3QTxQcHMQVtEOZ3YVIx1ydYFT2xT8vq7Lg8zCftBicrn2WjhjUTDkJ9h8v3DlG275qI
 yA8fg/oliRJr6l73Djj5WDnIHCaePk8FVu+C/4vpsl4e3apDROjxXONu+9Dvo0EQRCxb
 YGwcjrM1S6mGl+XjJCJQE4IMGCIRCLew0eDdSMKkcFoV13H251WVp+EChMyq8czCuj62
 wxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NMMht5ergvHlMH690NYrKkg4t00Bp8kaavqfbrCsGQE=;
 b=HjNRnXqOj3nDt3CFoKa53WUvGwyFc4nNmhdod6m3FhKFWP9STUZBoGDT6aGn/6m8iW
 /6PDhf16uJbUgO3GwnacDmIZSVznZuWX6asgZ3yv9dbeUud6sie2V3ZFktlHUldyGfX/
 AU/u5EmPdRGf97UeAx8wLpxHEQdOPUWg9WZj59gzoBC/yOruKQGIiu6bICunfXYvVWsh
 7snex6IMx2r1HnRN8R1reM4MLD/GANb7BXYKsPnpprwGiWmoq37Vq0maz6WZImAL1Ibb
 262KHjN+Nk9CaEhuBKL2yccrKimGHWrLFoGWVlxaXHcDEd476g7SdI4wwD18D3YNEi84
 de2w==
X-Gm-Message-State: AOAM532mACsC0QwVMzSnUQtt+ROfdOyvVCcxg3PBoAIE7eNdGifTDODr
 UJCWrfMz8j+rUAklXyeWdlaj6Wa8WVRc1A==
X-Google-Smtp-Source: ABdhPJzFGbssJAwgx8eBrkP3ri8FFNau2fmuJT/0b2mSTKbLPspwZ1og3b+SKtlHo7SL8nSpMii6cA==
X-Received: by 2002:a17:907:7d8b:b0:6ef:f0c9:9498 with SMTP id
 oz11-20020a1709077d8b00b006eff0c99498mr8177762ejc.706.1650718382042; 
 Sat, 23 Apr 2022 05:53:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:53:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/34] meson: use have_vhost_* variables to pick sources
Date: Sat, 23 Apr 2022 14:51:50 +0200
Message-Id: <20220423125151.27821-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Kconfig.host            |  3 ---
 backends/meson.build    |  8 ++++++--
 hw/net/meson.build      |  8 ++++++--
 hw/virtio/Kconfig       |  3 ---
 hw/virtio/meson.build   | 25 ++++++++++++++++---------
 meson.build             |  1 +
 net/meson.build         | 12 +++++++-----
 tests/qtest/meson.build |  4 +++-
 8 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/Kconfig.host b/Kconfig.host
index 60b9c07b5e..1165c4eacd 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -22,15 +22,12 @@ config TPM
 
 config VHOST_USER
     bool
-    select VHOST
 
 config VHOST_VDPA
     bool
-    select VHOST
 
 config VHOST_KERNEL
     bool
-    select VHOST
 
 config VIRTFS
     bool
diff --git a/backends/meson.build b/backends/meson.build
index 535c3ca7dd..b1884a88ec 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -12,9 +12,13 @@ softmmu_ss.add([files(
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('hostmem-file.c'))
 softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-memfd.c'))
-softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vhost-user.c'))
+if have_vhost_user
+  softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('vhost-user.c'))
+endif
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
-softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
+if have_vhost_user_crypto
+  softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost-user.c'))
+endif
 softmmu_ss.add(when: gio, if_true: files('dbus-vmstate.c'))
 softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
 
diff --git a/hw/net/meson.build b/hw/net/meson.build
index 685b75badb..ebac261542 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -46,8 +46,12 @@ specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'
 softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
 
-softmmu_ss.add(when: ['CONFIG_VIRTIO_NET', 'CONFIG_VHOST_NET'], if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
+if have_vhost_net
+  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
+  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
+else
+  softmmu_ss.add(files('vhost_net-stub.c'))
+endif
 
 softmmu_ss.add(when: 'CONFIG_ETSEC', if_true: files(
   'fsl_etsec/etsec.c',
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index f8e235f814..e9ecae1f50 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -1,6 +1,3 @@
-config VHOST
-    bool
-
 config VIRTIO
     bool
 
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index f371404b04..7e8877fd64 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -2,18 +2,22 @@ softmmu_virtio_ss = ss.source_set()
 softmmu_virtio_ss.add(files('virtio-bus.c'))
 softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virtio-pci.c'))
 softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'))
-softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
-
-softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
-softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
-
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
-virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
+
+if have_vhost
+  virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
+  if have_vhost_user
+    virtio_ss.add(files('vhost-user.c'))
+  endif
+  if have_vhost_vdpa
+    virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
+  endif
+else
+  softmmu_virtio_ss.add(files('vhost-stub.c'))
+endif
+
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
@@ -54,3 +58,6 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: virtio_ss)
+softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
diff --git a/meson.build b/meson.build
index 259c8d9174..da8ba8f159 100644
--- a/meson.build
+++ b/meson.build
@@ -319,6 +319,7 @@ have_vhost_kernel = 'CONFIG_VHOST_KERNEL' in config_host
 have_vhost_net_user = 'CONFIG_VHOST_NET_USER' in config_host
 have_vhost_net_vdpa = 'CONFIG_VHOST_NET_VDPA' in config_host
 have_vhost_net = 'CONFIG_VHOST_NET' in config_host
+have_vhost = have_vhost_user or have_vhost_vdpa or have_vhost_kernel
 have_vhost_user_crypto = 'CONFIG_VHOST_CRYPTO' in config_host
 
 # Target-specific libraries and flags
diff --git a/net/meson.build b/net/meson.build
index 847bc2ac85..c965e83b26 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -26,10 +26,10 @@ softmmu_ss.add(when: vde, if_true: files('vde.c'))
 if have_netmap
   softmmu_ss.add(files('netmap.c'))
 endif
-vhost_user_ss = ss.source_set()
-vhost_user_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
-softmmu_ss.add_all(when: 'CONFIG_VHOST_NET_USER', if_true: vhost_user_ss)
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
+if have_vhost_net_user
+  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
+  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
+endif
 
 softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('tap-linux.c'))
 softmmu_ss.add(when: 'CONFIG_BSD', if_true: files('tap-bsd.c'))
@@ -40,6 +40,8 @@ if not config_host.has_key('CONFIG_LINUX') and not config_host.has_key('CONFIG_B
 endif
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
-softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
+if have_vhost_net_vdpa
+  softmmu_ss.add(files('vhost-vdpa.c'))
+endif
 
 subdir('can')
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6b9807c183..ca12b313e1 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -263,7 +263,9 @@ qos_test_ss.add(
 if have_virtfs
   qos_test_ss.add(files('virtio-9p-test.c'))
 endif
-qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user-test.c'))
+if have_vhost_user
+  qos_test_ss.add(files('vhost-user-test.c'))
+endif
 if have_tools and have_vhost_user_blk_server
   qos_test_ss.add(files('vhost-user-blk-test.c'))
 endif
-- 
2.35.1



