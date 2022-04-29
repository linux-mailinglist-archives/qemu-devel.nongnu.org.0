Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB33514FBA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:39:02 +0200 (CEST)
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkShx-0004Yf-NV
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkST9-0002RV-3M
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkST6-0006BV-Td
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:42 -0400
Received: by mail-ed1-x534.google.com with SMTP id p18so9463060edr.7
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZzZIa+wMsezUpmbBheVj3PgXH3GAuO1nd48y4UFRh/8=;
 b=lXjhHOKkp9OOaBlFvWxAa1xtYi3gCjunZ1qMoBdkzy9lrT/8msSG57hOvGsT/WY+yv
 FEhkNydlIblqTXMJhZcFAEi6sDOvfn7UrYATGThd5ohuhVgabPvBQIbUsC4SxMnyb0Sw
 VSEDvVWG6m7k94aOU80JUgtT8nq6tHa9NGtT4glEA3SR8g/Hn7b5255toeydn/Q7+QQv
 eEmi3tw9MrmUl743QuKP7tajk1xgGZwlvDTrcCGbvGsOhrOtSWRrsf1A0tNipJBMhvq2
 ui/TdD92KpmcMvUgxnRPvHLiqZD/4B25ywmk1CJ4ufPx6OMSHKXWE9+UsQQdryfP8Zli
 Bv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZzZIa+wMsezUpmbBheVj3PgXH3GAuO1nd48y4UFRh/8=;
 b=VIfs28lhpk225FoBMfOwrvoLMiv/mH+e9jCFYoooG2EK7rfbP5tUpgaN4ygrgRv29V
 vBEx9Yc9Wr1kWSMx39XQyg6cRs87lZZnVuRxRtvT0sC32JkNnPc/AWJ/X/jdVmzuJdhN
 4peAXdqfhQXbcxO4MK6qm211OI558D/YY7LHdtzjjGRQ+ciCK0tNjqRfswjWH+O6nqcI
 3uPtKwFpVeLhiI3CE7+82iQwb8tgo5sVD8JuLtNl0QZCA5kdOG00bESje8sWw474xpOR
 yHPVTqwWa0Mu5AMV1TVT2DvDll5IeLbv7gVYSple68TbfNx8KxDn7t8oiPy9tRWluBCA
 lxfQ==
X-Gm-Message-State: AOAM533tW0bm0RWVRiv5HuyCT5JEymhyxyJhwmAAqjvK6ITPcr82k9DL
 36hE0J+yT31E5NqKsxpi3xX2Vez8MQQqaA==
X-Google-Smtp-Source: ABdhPJzH2tQyz/rjjdB4qyu+edYtho+R24EnO9lrh/SdNKKOUAxIa7eWgVvsgc6HqiW4FFVl4S1PNw==
X-Received: by 2002:a05:6402:2949:b0:425:a52a:28c5 with SMTP id
 ed9-20020a056402294900b00425a52a28c5mr41446356edb.389.1651245812738; 
 Fri, 29 Apr 2022 08:23:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/25] meson: use have_vhost_* variables to pick sources
Date: Fri, 29 Apr 2022 17:23:10 +0200
Message-Id: <20220429152312.335715-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index 4545905360..9486270e8a 100644
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



