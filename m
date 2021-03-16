Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F633CF84
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:17:05 +0100 (CET)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4sy-0007GI-Iq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pR-0002B2-Hi
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pP-0007oX-So
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id mj10so70622120ejb.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=p/MLTxeMfbETxV9ik8tSzu3enBcQaEzeh7XBZdElKyw=;
 b=DosBdXAbRLpVXIbvw3f35QjOeBFpNLrn1UCxJlEpR7TK9DgzCxH8xQNomb3v7UNymm
 hBT/vVrCaA6ZuLu/kfKa4njoSbmKL2YhHkJoAJdJ/6vzTGnQhnC107Yn9Abolgtqcqxj
 nyi2I2JtMFDtG+uiG8InMAH8ZbKHoKQ0MR1UtWZgpOoueISgEv7csuiuCITa3GOyt9Za
 vztF9J0iOEhbOeVMFlU6z5vhQq9iAQ+8P82PB1YMGI/quJjzUFqk7BItQcuqWJ4tah9i
 pR/IsPW8eUgEPOni9QvjLlA6UGHCrv/BpPZackmbzthNfGDanmzVMNiDaH5lzPGz+dyb
 cipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=p/MLTxeMfbETxV9ik8tSzu3enBcQaEzeh7XBZdElKyw=;
 b=LlUlKmq8S3BaO7yFMpFeD3mtALjZc5AAV2pOWgxaVvEtk5diebN5g9uFwPhvjdRIK1
 bFuN5nmHLo3Q6LLFkTQ86XjDx5pfrlUPNzOIBJ6e5S9hlNRh+TXn1qhFdA6TWXG4+356
 Yf8M2rMz/3PFP0vN67jnkM5U0Tdc10Avy80uctu3XE6jrr6n7f8VRT9X1ttsZrcwJmHI
 Z2XXMgtr5P32aJ8wudSDkTUeNcg5C2Bt/8SmdvRqwkxNEAbtwlDANRjuKwDpTdGEoZPL
 IRtygFzxtbflN89g+cvfSkzGzkUmbWzoDvoqpkqIpk0Tmvg4cPOq3zqit1vd/pr1M+ce
 TGpQ==
X-Gm-Message-State: AOAM530pjMHHvkuSlfWdnogaNN/KFnUHwxabg5B02fcL2DL2ZU835+Yy
 A6Lc5t5fIvmAp8dft9jdLeQ=
X-Google-Smtp-Source: ABdhPJwihCZznnU86yDZyNG1aqxXbaC8fKB+7RjaUzCEHxiwnCaBOQfad4jIb3FH0UqX/916F3P5zw==
X-Received: by 2002:a17:906:a049:: with SMTP id
 bg9mr28326174ejb.186.1615882402677; 
 Tue, 16 Mar 2021 01:13:22 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] hw/net: virtio-net: Initialize nc->do_not_pad to true
Date: Tue, 16 Mar 2021 16:12:46 +0800
Message-Id: <20210316081254.72684-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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


