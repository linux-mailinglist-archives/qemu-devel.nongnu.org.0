Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E113339D1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:20:11 +0100 (CET)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvwo-0007KQ-5l
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvp9-0000qD-U0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:15 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvp7-0006md-Ti
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:15 -0500
Received: by mail-ej1-x632.google.com with SMTP id ci14so37434023ejc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lkRZyfD9QooRn1+sjjF0FxwBKOhdL98WsYjA2hcSBME=;
 b=Rg6KB72/zM9bDZISWRtAjiKON4Vy8QJGZ1pU2sUXHXsbMmPus6g6oY5LQABxqR8Imf
 ORmfWTN4SEEgndXT5eRLqymzQ68GpR6bh4iExTOhJixERQAYJfQ/EAhHDpbpuJj9QvaT
 r4tfOINTfBHFZWeOXxXbbOPmR+WArjJEw8nQdMOG+HAlWpNMSm80Vj6XQKR11fC7Uxb4
 bELOQcbbkxuqR0O/ir0Dy8MO1An85ZCTIF2hxSkDpUyNJizdgUJuLgEMTdbqq+6z2eyo
 t6cQ0VCZPVR0T3SH293VOdJhYxm+iMmkHuMo6WR8SqUazZDV/BfuyZP9NEgjYxWzro8L
 by3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkRZyfD9QooRn1+sjjF0FxwBKOhdL98WsYjA2hcSBME=;
 b=EGtb0CtmJ4dGsAboudTWf2W2FsZBP2rI8li9ccxFWwzSQlISRuymXu3/2bWQoDUnmk
 6ya6+kLRIsNf92mJRREqyNJneuJbjNMB4T23CKWLysYkBbnfXjqB1JffzGyoOAZITsjM
 W19ZxRDUNHLjmS6AqtBuyWLolWLRfKlqDAXt1Z+A2429p8EV1yaTfr1b6ukgOIxhB/Rc
 pmYPQrQFsJIIZIOWj72OcDvZoD15an5L/fV8GQXpZLBb+4CK5njQHfMX6G9MkwTQWMKJ
 KoZ3tEHB09cr9YHBe+YrSvlUMINetfV0vdsOrhRjTmmUwjeF/quMiKjmsnNWu5N7dd26
 eHLA==
X-Gm-Message-State: AOAM5319PK056fZGj5MbqgVGlYJSSA+4PTV9uduTYI/ebuMM0lmIB/3h
 9hZKWAQlHgZBifa0uXIWFrSSCywFtT0=
X-Google-Smtp-Source: ABdhPJyOrP9gc1Ik0L0BmVMsg2L/PRepO2fvcCklEqkx8UQM4sGr4dLrnbcbh5JUx6s6IAzJmIcICQ==
X-Received: by 2002:a17:906:2710:: with SMTP id
 z16mr2887292ejc.176.1615371131890; 
 Wed, 10 Mar 2021 02:12:11 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 01/10] net: Use 'struct iovec' in
 qemu_send_packet_async_with_flags()
Date: Wed, 10 Mar 2021 18:11:48 +0800
Message-Id: <20210310101157.15136-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Directly use iovec structure in qemu_send_packet_async_with_flags()
by inlining filter_receive() and using qemu_net_queue_send_iov()
instead of qemu_net_queue_send().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210303191205.1656980-2-philmd@redhat.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 net/net.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/net/net.c b/net/net.c
index 32d71c1172..bb1d455005 100644
--- a/net/net.c
+++ b/net/net.c
@@ -582,22 +582,6 @@ static ssize_t filter_receive_iov(NetClientState *nc,
     return ret;
 }
 
-static ssize_t filter_receive(NetClientState *nc,
-                              NetFilterDirection direction,
-                              NetClientState *sender,
-                              unsigned flags,
-                              const uint8_t *data,
-                              size_t size,
-                              NetPacketSent *sent_cb)
-{
-    struct iovec iov = {
-        .iov_base = (void *)data,
-        .iov_len = size
-    };
-
-    return filter_receive_iov(nc, direction, sender, flags, &iov, 1, sent_cb);
-}
-
 void qemu_purge_queued_packets(NetClientState *nc)
 {
     if (!nc->peer) {
@@ -639,6 +623,13 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
 {
     NetQueue *queue;
     int ret;
+    int iovcnt = 1;
+    struct iovec iov[] = {
+        [0] = {
+            .iov_base = (void *)buf,
+            .iov_len = size,
+        },
+    };
 
 #ifdef DEBUG_NET
     printf("qemu_send_packet_async:\n");
@@ -650,21 +641,21 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
     }
 
     /* Let filters handle the packet first */
-    ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
-                         sender, flags, buf, size, sent_cb);
+    ret = filter_receive_iov(sender, NET_FILTER_DIRECTION_TX,
+                             sender, flags, iov, iovcnt, sent_cb);
     if (ret) {
         return ret;
     }
 
-    ret = filter_receive(sender->peer, NET_FILTER_DIRECTION_RX,
-                         sender, flags, buf, size, sent_cb);
+    ret = filter_receive_iov(sender->peer, NET_FILTER_DIRECTION_RX,
+                             sender, flags, iov, iovcnt, sent_cb);
     if (ret) {
         return ret;
     }
 
     queue = sender->peer->incoming_queue;
 
-    return qemu_net_queue_send(queue, sender, flags, buf, size, sent_cb);
+    return qemu_net_queue_send_iov(queue, sender, flags, iov, iovcnt, sent_cb);
 }
 
 ssize_t qemu_send_packet_async(NetClientState *sender,
-- 
2.17.1


