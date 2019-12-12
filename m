Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F711C173
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 01:32:45 +0100 (CET)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifCPL-0002fS-P6
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 19:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifCNB-0001yg-Nv
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 19:30:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifCNA-0006dV-J7
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 19:30:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifCNA-0006ac-BK
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 19:30:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id c9so669655wrw.8
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 16:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DS2a2QCtdVIWGG+BHkP4zpaBabvbUNvvEyxZJTw0zzg=;
 b=iUisusc/1KOOyay4cjxqwc2LjOIVmRb0yrFIMQo0ehgof0wd6JxIVejkj2lUJGhsBy
 8Nvm7XDTlI4TuFPaEQRStptuH6aQGeYL5baLybMhlo6LohhNbduadBkvKIg1TRlcL+/l
 xx2xZf8sPbINDgWhZP7d3rDS/XJi5xqJLRXxPxmME9QaifL1nB8Tvc7n0BtVh2CZxb5V
 gj4w+aJtclRdiOAn0dnuyanLG7t1LX+HkjsbGhY2R1hYGTwr/40OxaGviDtEj8AuN7rM
 gvO8IHVuNyRpwJrt7ZjvvlNnF8zaoPcCfsNg3UEQo7FY5wX5LtWDHMwWO+C/NlX56xDe
 u7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DS2a2QCtdVIWGG+BHkP4zpaBabvbUNvvEyxZJTw0zzg=;
 b=MjpZdPTlEtcmPZPSBUjcKOgNnhpzlYybQ3KvxO0+X+R56ICrZxlLWOJ8lfxcx74UPd
 nfpcjB310ZK3zdwrafX5XPGsTqeolx2aPI09JOJEofQ8dyU+f2Sxi+Fr92V346H5X6td
 GXXaBkkx8gH8bbg+L+wPKuxBmU+9Y/DGnEhorNFqGo9DlJA6uDkqkQO0MZIWE1hyzYR5
 EUyLDLBkG5qxKSYdekXW3TneaD0wSj2/BnX9J0lR7s/OuG5pj81E2CnVDKOidWKroYGV
 7nluArKUkB8bU8dxCMT4/XKWg3oQrqDdOyU4kA5zMfUqpFej5VSl7ZCFLAmdEFM0pLqo
 04cw==
X-Gm-Message-State: APjAAAWAxwg5L7O6vj+pYAjkCHhYqKPRZUowmAwz2QuUMybuubslQW9u
 laVZmMr/wDz6mBwV1+hxJD4bnL8J
X-Google-Smtp-Source: APXvYqxcnGLVpaxPpt51xFOUxXLPCC46RjDtN/PDDIawhS87/4/ebW68D6mS2TlpfFOhA/lKtjATkQ==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr2821905wrq.63.1576110626456;
 Wed, 11 Dec 2019 16:30:26 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm4379971wmb.8.2019.12.11.16.30.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 16:30:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: simplify vhost condition with Kconfig
Date: Thu, 12 Dec 2019 01:30:24 +0100
Message-Id: <1576110624-33604-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Kconfig.host            | 5 +++++
 Makefile                | 1 +
 hw/virtio/Kconfig       | 3 +++
 hw/virtio/Makefile.objs | 4 ++--
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Kconfig.host b/Kconfig.host
index bb6e116..55136e0 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -25,6 +25,11 @@ config TPM
 
 config VHOST_USER
     bool
+    select VHOST
+
+config VHOST_KERNEL
+    bool
+    select VHOST
 
 config XEN
     bool
diff --git a/Makefile b/Makefile
index 96e69dd..a74c2f2 100644
--- a/Makefile
+++ b/Makefile
@@ -382,6 +382,7 @@ MINIKCONF_ARGS = \
     CONFIG_OPENGL=$(CONFIG_OPENGL) \
     CONFIG_X11=$(CONFIG_X11) \
     CONFIG_VHOST_USER=$(CONFIG_VHOST_USER) \
+    CONFIG_VHOST_KERNEL=$(CONFIG_VHOST_KERNEL) \
     CONFIG_VIRTFS=$(CONFIG_VIRTFS) \
     CONFIG_LINUX=$(CONFIG_LINUX) \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 3724ff8..f87def2 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -1,3 +1,6 @@
+config VHOST
+    bool
+
 config VIRTIO
     bool
 
diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index e2f70fb..de0f5fc 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -2,8 +2,8 @@ ifeq ($(CONFIG_VIRTIO),y)
 common-obj-y += virtio-bus.o
 obj-y += virtio.o
 
-obj-$(call lor,$(CONFIG_VHOST_USER),$(CONFIG_VHOST_KERNEL)) += vhost.o vhost-backend.o
-common-obj-$(call lnot,$(call lor,$(CONFIG_VHOST_USER),$(CONFIG_VHOST_KERNEL))) += vhost-stub.o
+obj-$(CONFIG_VHOST) += vhost.o vhost-backend.o
+common-obj-$(call lnot,$(CONFIG_VHOST)) += vhost-stub.o
 obj-$(CONFIG_VHOST_USER) += vhost-user.o
 
 common-obj-$(CONFIG_VIRTIO_RNG) += virtio-rng.o
-- 
1.8.3.1


