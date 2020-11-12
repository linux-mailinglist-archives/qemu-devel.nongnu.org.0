Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917C2B023C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:48:06 +0100 (CET)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9D3-0002iC-8T
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kd9C5-0002Gu-Kp
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:47:05 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kd9C3-00086q-JF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:47:05 -0500
Received: by mail-wm1-x344.google.com with SMTP id h62so4873746wme.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=htgjkcVsMZNIrHt2+g/ErSOItfgqIHCyrEHFvj1N9QE=;
 b=yTilNaVTQPxUyc4dvjWRYaUT1QUGbQYzfPiQmu+N757XlcNwkYqWEwaZdqiGqd1nqA
 bCHxJEEjPUClQN3f2txb7JBLI7DjTwTEZ9jzfi2X1EfFAMeWfItfYBwl9jUJApXVkcHF
 95AoYXmbEEKWcEEipeKVM3PsW4s3OmDmsXmViV8cnw6b+XD3GTiGnO03z6DcRRF3eHs9
 FGgEUjl4rCoyIIlyvbdjMOXorT7Yh1Lhi/5YOwetghqQC+DrdTnx6QYvoV5l7ngwQDMX
 RaB9bRhERbpLc/n/VGmkEqRfC7wmzpoZq6XY5P7fTF1yLasURGyymi8upVMScQv8rpLK
 ve/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=htgjkcVsMZNIrHt2+g/ErSOItfgqIHCyrEHFvj1N9QE=;
 b=LZa1hcP24Q01JDCP0qDhpgp+xxa2o37pO5wjRaiQyldemnL2qGL9C3JiCCji5RHbvT
 TGIqPyVc4iyJ+IdrnnTjCrVSebmLKP6hJUSBePa/p8KO+11YlAWQSjgQqxG7l+/SeuG7
 /G3k8QXn82dWacAVuvM1wXUFK7xf4MdV/vDrwkkFr/iIqQaRT95+soM3JwHR5etPWujD
 4lqO9SU5i+Qr72XJaaOnVSKyg383h12Hvm7AiSMaQYfPnQqT6CD0bIbksAMuE17bzuY6
 /p10Mo4o0ZYfCKF4h9A4kwS+8A8fpYhv8tjoc6x/QZ3CfSG13cxWRQEeOadPC6fOtWNZ
 huzg==
X-Gm-Message-State: AOAM5304uP2JIb2Ks9iKy/Q2gdC/2z6NwIk+Y+bl8iAUJaJNgRKQZ8xS
 3rwsj+gXmzbvP2qdtCF1OCkGqq5+DKgVDQ==
X-Google-Smtp-Source: ABdhPJxR0jcoBvymkUxaxMaDn6TpXMNOy1VwImhgJU63LJ4NBGi4slxIpsDylw+edxZ/1iMIDjy/VQ==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr8792852wmj.77.1605174421279;
 Thu, 12 Nov 2020 01:47:01 -0800 (PST)
Received: from f2.Home (bzq-79-177-41-59.red.bezeqint.net. [79.177.41.59])
 by smtp.gmail.com with ESMTPSA id u16sm5923764wrn.55.2020.11.12.01.46.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Nov 2020 01:47:00 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	jasowang@redhat.com
Subject: [PATCH] virtio-net: purge queued rx packets on queue deletion
Date: Thu, 12 Nov 2020 11:46:53 +0200
Message-Id: <20201112094653.20255-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::344;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 net/net.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/net.c b/net/net.c
index 7a2a0fb5ac..a95b417300 100644
--- a/net/net.c
+++ b/net/net.c
@@ -411,10 +411,14 @@ void qemu_del_nic(NICState *nic)
 
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
2.17.1


