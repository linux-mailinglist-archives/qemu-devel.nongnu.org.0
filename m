Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00433E9C4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:34:59 +0100 (CET)
Received: from localhost ([::1]:38952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPli-0000RE-4E
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe9-0003mA-06
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe7-00007Y-Eu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id bf3so848315edb.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=p/MLTxeMfbETxV9ik8tSzu3enBcQaEzeh7XBZdElKyw=;
 b=ac81lsF39C6zWWoNcl1GlU0y1qy2QJA5z8flh/m75x/O8CjfH2/lFPJNW5SG/+FxyH
 GB/AmZkz78y1fLJVq7lwHPuBmPomdamBeWMig6BsPMTCxQWDv3IglxZBshRgIU//xN2g
 3o29bre0b9RhL2CC5S9Iov0e7CPkvEk/TrGtiDqNH3O4iHXy3Vz2qFccVC4ya87NCzlx
 OhZgjkzzyvGPIofTbKfsIZapmdNAFN1sI0hbM4miC4+9jGaozzbEwyPMdhfVPJ5zCj9R
 vse0d7UUwekveXHkn1RJCtrqhqSQBfnkf8pkdy+pDVa+fk3LL8LsfsRgf9+ba7nGE7zn
 L6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=p/MLTxeMfbETxV9ik8tSzu3enBcQaEzeh7XBZdElKyw=;
 b=PesXYL2DyJuaSIZXvTe7sl6JaFo2HfL2Nr538xg/0sL9WaQNoVaIxxAVPtmghYvQyB
 ShBlAXSTvq83XqvdaESn4rOz10LqzvDSyEMMqKJXceLYGaYpfNPpr6qryuFOjuUDe11c
 bM1cY0c2H0bWQLy+K6jODS0y4i45mgNpryfgrEHdzTbrUOLdVccServcibgZQBbuebMx
 scPG4glYpD0+ypTjSScLgcUGnp+mXh+yWfBNTeLpn2prl2E3otN7GO9IfHOUv0SfxOsx
 Sef/rmGnt7SAajkKgZURVIUHfsoYFCQq/fs4m1+OuCKmoeduysX4kbo0mcVw28F/0Ctt
 5y5A==
X-Gm-Message-State: AOAM532tIWYJ1Mc4hjmJeQx5Cd4R7Qmnd76RMNBk1IRwaiiE+b+ezvgo
 qTRS2qTGz53c0M5FXzfJOy4=
X-Google-Smtp-Source: ABdhPJytTjzVoklcyp5+MN3BrKkr/y+gWNzl2oabBklAgEyqY0aIwbedalNWokV7WJKSm0jt0VfvLQ==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr39909160edt.152.1615962426369; 
 Tue, 16 Mar 2021 23:27:06 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:06 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 04/12] hw/net: virtio-net: Initialize nc->do_not_pad to true
Date: Wed, 17 Mar 2021 14:26:30 +0800
Message-Id: <20210317062638.72626-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For virtio-net, there is no need to pad the Ethernet frame size to
60 bytes before sending to it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 96a3cc8357..66b9ff4511 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3314,6 +3314,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
                               object_get_typename(OBJECT(dev)), dev->id, n);
     }
 
+    for (i = 0; i < n->max_queues; i++) {
+        n->nic->ncs[i].do_not_pad = true;
+    }
+
     peer_test_vnet_hdr(n);
     if (peer_has_vnet_hdr(n)) {
         for (i = 0; i < n->max_queues; i++) {
-- 
2.17.1


