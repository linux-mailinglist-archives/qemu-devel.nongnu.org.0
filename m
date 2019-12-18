Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1311246F5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:37:12 +0100 (CET)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYZi-0002LD-TG
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3K-0006Y1-Li
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3J-00019V-DQ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35429)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3J-00017U-3S
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id g17so2023536wro.2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=waJxQlBb94XR6Ggskx6BDndQcoTTNWF9QTJRASbqMgE=;
 b=DaLHz5W4puy/asKxGWx0ACkDk32e/Sd5YW8FDKPC4wlKsF2xtoBQA/1P8AJqLD/Qiw
 EoEm8zWwGbAM8uw6DEL4JhW70uMhrsudFEg+dK9w8y/9jftGzFybxlFGlfoFBFz4XL33
 9LJfH2gmqNY4zfTLk+CTvqXMC+87T4TprlgYByry1RQg0n215gsmwN0iyUYFzl3U7o9v
 9TWgu0v0ZVcEedsaKkZRruG8cu9SuytiP4wYUJM5FLmRJta/c8JlKv5EpvMc+DSeXY+i
 7ZqIGjXnLA8QYBJ4NknpFd7yFoDMt2cIyhWBpBUVCB4chgTIYB0VQSj6hX6N7kpbfqx6
 co4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=waJxQlBb94XR6Ggskx6BDndQcoTTNWF9QTJRASbqMgE=;
 b=rSWU74Ob4+AjwGNdQ4iU5Z15w6g70ZZ0OwEq/6OYVrhVF3roZykoqj4Cd4K59Af+KV
 GQ+ncKneKG6mDmB+5HnTkTHFMQcZ4DQmCqUD1ytKkTzMgezHTpwkgh3DAzigiKJU2Utr
 ZUqaefCVINm7fsVzchPjNvZ9tmiHLJUqAkroRl5/hHVJfscCdkGu9/tvcuDMl/0X7a8r
 8YDbK1TWQcJ+vyhHzijAv+xkZ+VZjNkxnMAawdfcm6Swf7h7M8oj8ISVEsr9NhgWeejM
 4UMAT0mcFgQtMAZGKKytfMLBPRpXxZHqd/ugauVmucVUVtyRdMF76bwk27J89Gpd/dlK
 Z2ng==
X-Gm-Message-State: APjAAAUbrLEEm/0aMJqNWaHFkFUzKGWbr9AmXyjEBlukPbi2VEj5DNka
 HWurDo5Sgvx6GobTH8pTJyl8mgXv
X-Google-Smtp-Source: APXvYqxBjtQH9Rsg1JeFhwS96pnfu1FIg7A4V0XX37EumhxAfa1DQrHdGrwwy+dYEmNwADQkcDJ+GA==
X-Received: by 2002:adf:c147:: with SMTP id w7mr2498695wre.389.1576670617638; 
 Wed, 18 Dec 2019 04:03:37 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/87] configure: simplify vhost condition with Kconfig
Date: Wed, 18 Dec 2019 13:02:09 +0100
Message-Id: <1576670573-48048-44-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
index fb1728e..531e955 100644
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



