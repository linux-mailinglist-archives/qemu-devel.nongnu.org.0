Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D02C68F9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:53:12 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig3b-0002xb-Dh
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifwI-0005Qd-BL
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifwF-0007Bl-41
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606491934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sd0E8yhPS9sOpXUGXJKqr6MO/jbGaC/7eqQsrFk2V/8=;
 b=N1cFpre6U6wJCuTEGGxDlVfwQziauhAcHpY7efdEtcQhw/aRP8XhrJvoO/n4KjaegGkJe+
 CcvgwX53ZZEbmuzZlt2gZf7OXWJ4eeSz9cJ8HBA8mZDYU5ekbDH12Xt5D1zajHTs6Wvq9q
 r5xN0yx/8b7XNdcIVk1WIngb3O9k5DM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-KYi6YeIzO0-FoVIZmhQLxg-1; Fri, 27 Nov 2020 10:45:32 -0500
X-MC-Unique: KYi6YeIzO0-FoVIZmhQLxg-1
Received: by mail-wm1-f70.google.com with SMTP id y187so3345104wmy.3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sd0E8yhPS9sOpXUGXJKqr6MO/jbGaC/7eqQsrFk2V/8=;
 b=KLwTFfb45EKEu1JSMAu3hWpfW13iA1mn+gD8Jig9sHk2BVD6mBQSdQ+Hk5Gz9rA5ht
 GPbXTdeosiJaNG7Qy+P8/UnK/HcCAghGzGWDb+U++KnPaVZXzgG/QpVwn+9eLxQffIP2
 KjDbwgwr2eeoX0AILh3D3fcCyxkwlB0/UKIkgLf4D3GKraNxzmipwm92wsH4vsGK7KYv
 +ZBLf7g5nGeMqTDktN14Yy3cOP8viw4nwFcgrcPT7MQXT5WrlP4yz8NwlTilcphvOHEb
 4bXwGzjiBtWVZV8wp08mBX0B/i/tyy6ACfJ38w18BMyWXmIXC5yH3MK9bzjZDut+fAXX
 MMhw==
X-Gm-Message-State: AOAM530+E3BRldfgDakSJQy9HNAY/nA26lcR1Zp7QYJiz7XlDP72zLnb
 tPuOFCnWxuxj3yTaMP0fJ1s86iXC/jMjpUNJgFv89S0e1buFJbaB/rjD8MkU8i3P+OwMsCoGSnC
 /f4LGT/pqUFndtjQ=
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr9692681wme.127.1606491931453; 
 Fri, 27 Nov 2020 07:45:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFebGGMlLbTcj0V8Eb5R6XIGIaf06YPw/f/xj1yjINE8v6/Kpwxdp2T3RRMGk8aQBngGL/Sg==
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr9692656wme.127.1606491931311; 
 Fri, 27 Nov 2020 07:45:31 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j8sm15408707wrx.11.2020.11.27.07.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:45:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2 1/2] net: Do not accept packets bigger then
 NET_BUFSIZE
Date: Fri, 27 Nov 2020 16:45:23 +0100
Message-Id: <20201127154524.1902024-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127154524.1902024-1-philmd@redhat.com>
References: <20201127154524.1902024-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not allow qemu_send_packet*() and qemu_net_queue_send()
functions to accept packets bigger then NET_BUFSIZE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
We have to put a limit somewhere. NET_BUFSIZE is defined as:

 /* Maximum GSO packet size (64k) plus plenty of room for
  * the ethernet and virtio_net headers
  */
 #define NET_BUFSIZE (4096 + 65536)

If we do want to accept bigger packets (i.e. multiple GSO packets
in a IOV), we could use INT32_MAX as limit...
---
 net/net.c   | 4 ++++
 net/queue.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/net/net.c b/net/net.c
index 6a2c3d95670..f29bfac2b11 100644
--- a/net/net.c
+++ b/net/net.c
@@ -644,6 +644,10 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
     qemu_hexdump(stdout, "net", buf, size);
 #endif
 
+    if (size > NET_BUFSIZE) {
+        return -1;
+    }
+
     if (sender->link_down || !sender->peer) {
         return size;
     }
diff --git a/net/queue.c b/net/queue.c
index 19e32c80fda..221a1c87961 100644
--- a/net/queue.c
+++ b/net/queue.c
@@ -191,6 +191,10 @@ ssize_t qemu_net_queue_send(NetQueue *queue,
 {
     ssize_t ret;
 
+    if (size > NET_BUFSIZE) {
+        return -1;
+    }
+
     if (queue->delivering || !qemu_can_send_packet(sender)) {
         qemu_net_queue_append(queue, sender, flags, data, size, sent_cb);
         return 0;
-- 
2.26.2


