Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53D203898
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 16:00:34 +0200 (CEST)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnMzx-0001cH-AX
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 10:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnMvq-0005R1-Cl
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:56:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46362
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnMvn-0007j1-Rb
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592834175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Xw2C1XUgrirkNPuyAqcced0++6Fj15FoEHfU1wvSfz0=;
 b=ibNtFSKL+fNfasU6dpG/Bq6gfDVjWIqD8iKz1rcAo/fXQ9wySEXeNpspEgz6kETwOI0BZ6
 VYJ9IPCaJ+Ta7xBAPf5MMMhHElpEl8jyG+or2kpJtlnlpGWnDrirTQIZe/tYnIFyR6R0YS
 Ylz02dv5IeekR0yTVEfnhonPSmF81GI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-giRmH-TmOFOAgamSLUVq2Q-1; Mon, 22 Jun 2020 09:56:10 -0400
X-MC-Unique: giRmH-TmOFOAgamSLUVq2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C5CA57094
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 13:56:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF8E010013D7;
 Mon, 22 Jun 2020 13:56:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D9C59D92; Mon, 22 Jun 2020 15:56:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] vga: build qxl as module
Date: Mon, 22 Jun 2020 15:55:59 +0200
Message-Id: <20200622135601.12433-6-kraxel@redhat.com>
In-Reply-To: <20200622135601.12433-1-kraxel@redhat.com>
References: <20200622135601.12433-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First step in making spice support modular.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/core/qdev.c           | 2 ++
 hw/Makefile.objs         | 1 +
 hw/display/Makefile.objs | 5 ++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index e77f40db675c..fe3dec9595cd 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -175,6 +175,8 @@ static struct {
     { .type = "ccid-card-passthru",    .mod = "usb-smartcard"         },
     { .type = "ccid-card-emulated",    .mod = "usb-smartcard"         },
     { .type = "usb-redir",             .mod = "usb-redirect"          },
+    { .type = "qxl-vga",               .mod = "display-qxl"           },
+    { .type = "qxl",                   .mod = "display-qxl"           },
 };
 
 static bool qdev_module_loaded_all;
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index af8fd9a510ed..14b7ea4eb62e 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -43,5 +43,6 @@ devices-dirs-y += smbios/
 endif
 
 common-obj-y += $(devices-dirs-y)
+common-obj-m += display/
 common-obj-m += usb/
 obj-y += $(devices-dirs-y)
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 77a7d622bd2d..76b3571e4902 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -44,7 +44,10 @@ common-obj-$(CONFIG_ARTIST) += artist.o
 
 obj-$(CONFIG_VGA) += vga.o
 
-common-obj-$(CONFIG_QXL) += qxl.o qxl-logger.o qxl-render.o
+ifeq ($(CONFIG_QXL),y)
+common-obj-m += qxl.mo
+qxl.mo-objs = qxl.o qxl-logger.o qxl-render.o
+endif
 
 obj-$(CONFIG_VIRTIO_GPU) += virtio-gpu-base.o virtio-gpu.o virtio-gpu-3d.o
 obj-$(CONFIG_VHOST_USER_GPU) += vhost-user-gpu.o
-- 
2.18.4


