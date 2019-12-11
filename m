Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87511AD6F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 15:28:09 +0100 (CET)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if2yE-0000r4-9N
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 09:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2vE-00076B-3f
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2vD-0005NG-3I
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:24:59 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1if2vC-0005MC-T1
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:24:59 -0500
Received: by mail-wm1-x343.google.com with SMTP id b11so7305254wmj.4
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8hK4OmxbRe74okeViqqk8QWGsS7awYMg615kR03rjI=;
 b=q9JX01ZpYzSX+ZiU9W7RiB0KJj8CQXR+Cn4W3GdXBwgxNKtmXkr8iJRVgdgVMNIleh
 3kygUOT0ZyBTjgRpFFYDdTNMuHzu81xTbnmQ7NXqYzPbFTXu7+bgxP9SPD5nHAu3Tcrs
 iP2EJH9hI+lj46AS/8pS8B1Da+9ZWbOwVq6aftzIMZCIFPVRCA2DLGzZUxDz4e/23AVm
 VCHFaJuI8nbmI+tch+rJIKs6u3agQVXSY67qdGafNU9GhW4myIIUyEeaDHZ+KvNyPemU
 +gVzdxTtJGKmhvlXgqP/d8/cjVBdoDfbsVYZd52Dv7M3+jYZTWRoSgRz7Km3EPM+HUfB
 3sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X8hK4OmxbRe74okeViqqk8QWGsS7awYMg615kR03rjI=;
 b=ZkKxhMJ8N0J7cKk+riRuLb8Wawcjk3S5oICp4fZFs24seBBc6TdQADl101Na7whVV+
 GZnrV5BDTemWbQaGUlV+nC6+iKJQKr9AET/hyRfrJRCv45Qz08ncnJVDQxmgPiat7uIy
 BlqWXUSZ4WVKeY/4nMUijLAK2IHhxrIQlYNuQCTs45D2x2LDtEEGarDwLGkQPdDwwyQ0
 0S6KcgiI+OrqaZxjYHAxrD2zEAyeZk2Ff1o38M4DgIqoNtNfVPra4EhtyFpbv2pxqVU0
 fpGzykvuzHuv5qg8XvYHjGxuSx6Pag2qDNf10zXdIKIdjbZ+FIzLX71VxoDpXinksRUR
 Xp3w==
X-Gm-Message-State: APjAAAUOkq6JDtEqS/3o48SsSksNC4sWV3GEDEpM+td55jhOTa0c6AKz
 bTsjVUefPrYKQw0KK8XQPz54gokC
X-Google-Smtp-Source: APXvYqz2kerJEsLYxSigGFjDoeoBwFJG6tBMqTSTi4vvs2LOE6qOUSoXXU5Ef+gHTwjlInau7p+4YQ==
X-Received: by 2002:a1c:9e0d:: with SMTP id h13mr71941wme.110.1576074297670;
 Wed, 11 Dec 2019 06:24:57 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id l22sm2340980wmj.42.2019.12.11.06.24.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 06:24:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: simplify vhost condition with Kconfig
Date: Wed, 11 Dec 2019 15:24:56 +0100
Message-Id: <1576074296-53617-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
 hw/virtio/Kconfig       | 3 +++
 hw/virtio/Makefile.objs | 4 ++--
 3 files changed, 10 insertions(+), 2 deletions(-)

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


