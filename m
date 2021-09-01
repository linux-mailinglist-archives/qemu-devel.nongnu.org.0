Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398A3FDDF1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:46:21 +0200 (CEST)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRVM-0008NQ-Dm
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEA-0003V5-OP
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:14 -0400
Received: from relay.sw.ru ([185.231.240.75]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OZ-3v
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=5pJA9oGAe27FBZ4nSv7x8XsZMxFH8WYlk01sKS0/9bA=; b=rwxIrtoYGPFK
 lm/y3etCqbw9oBOJF65Nns7XSKNPrpWhThCxti00TkIbGrRFZulN5tcq8TYRAXFblhOXQHLE8gVt/
 zA1J2ZcIegOaaNtDcca0bxCheaxueNsEC/AAy2eFnpWXWVub/WYVoAGJ9HpI2FH1ZYmaW33YUL3SC
 0IvYI=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-Nt; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 4/8] virtio-serial: Add tracking of the virtio guest
 feature bits
Date: Wed,  1 Sep 2021 12:08:00 +0300
Message-Id: <20210901090804.7139-5-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracking of the VIRTIO_CONSOLE_F_EMERG_WRITE acknowledged by
the guest.

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/char/virtio-serial-bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index dd6bc27..b5f9f42 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1159,8 +1159,9 @@ static const VMStateDescription vmstate_virtio_console = {
 static Property virtio_serial_properties[] = {
     DEFINE_PROP_UINT32("max_ports", VirtIOSerial, serial.max_virtserial_ports,
                                                   31),
-    DEFINE_PROP_BIT64("emergency-write", VirtIOSerial, host_features,
-                      VIRTIO_CONSOLE_F_EMERG_WRITE, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("emergency-write", VirtIOSerial, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_CONSOLE_F_EMERG_WRITE, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
1.8.3.1


