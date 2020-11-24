Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF72C1B9B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 03:48:56 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khONz-0003j1-2Z
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 21:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJs-0008I2-KL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJp-000286-Qd
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606185876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=TqgxUaXyEV8ciQ2FOlVVvP861BSBMhvXtjEUk93f3EM=;
 b=CZMI4ivkBMHTu6++DhlomBNy2te5NQqTEGVoc2KSG1WSjAhW5CLH7tBZqjtWNpncbCSctr
 agfPlPxzCnipxNWl8HmdaFPMz4Kmf/01YwAJ6Ff7AmjWqxCWvrZP71JDpC6f/EhO8WEkJg
 OsGaJWQrhpA4nruL7GApTt7VA6r+Gtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-ONs6ZSMFONOdxu9Rdj2WoQ-1; Mon, 23 Nov 2020 21:44:34 -0500
X-MC-Unique: ONs6ZSMFONOdxu9Rdj2WoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BD73107AFA5;
 Tue, 24 Nov 2020 02:44:33 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5D4A5D9CA;
 Tue, 24 Nov 2020 02:44:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 3/5] net: purge queued rx packets on queue deletion
Date: Tue, 24 Nov 2020 10:44:21 +0800
Message-Id: <1606185863-25996-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
References: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

https://bugzilla.redhat.com/show_bug.cgi?id=1829272
When deleting queue pair, purge pending RX packets if any.
Example of problematic flow:
1. Bring up q35 VM with tap (vhost off) and virtio-net or e1000e
2. Run ping flood to the VM NIC ( 1 ms interval)
3. Hot unplug the NIC device (device_del)
   During unplug process one or more packets come, the NIC
   can't receive, tap disables read_poll
4. Hot plug the device (device_add) with the same netdev
The tap stays with read_poll disabled and does not receive
any packets anymore (tap_send never triggered)

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/net.c b/net/net.c
index 6362d30..6a2c3d9 100644
--- a/net/net.c
+++ b/net/net.c
@@ -412,10 +412,14 @@ void qemu_del_nic(NICState *nic)
 
     qemu_macaddr_set_free(&nic->conf->macaddr);
 
-    /* If this is a peer NIC and peer has already been deleted, free it now. */
-    if (nic->peer_deleted) {
-        for (i = 0; i < queues; i++) {
-            qemu_free_net_client(qemu_get_subqueue(nic, i)->peer);
+    for (i = 0; i < queues; i++) {
+        NetClientState *nc = qemu_get_subqueue(nic, i);
+        /* If this is a peer NIC and peer has already been deleted, free it now. */
+        if (nic->peer_deleted) {
+            qemu_free_net_client(nc->peer);
+        } else if (nc->peer) {
+            /* if there are RX packets pending, complete them */
+            qemu_purge_queued_packets(nc->peer);
         }
     }
 
-- 
2.7.4


