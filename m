Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D342B79B3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:58:13 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJI4-00048x-EP
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyn-0002gP-3s
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyl-0005Zl-93
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZitZm1Vwi2HnXMn3z66NARvXR7SABBnylrQjF1/e6gA=;
 b=QP6tIbe81jBobUreHGDiXapKTQE830nskrYnFLUyp7FoDOh2CJvy4uowLa0wiqk8ALoaa3
 IPpyhgfTIbCwn0L5rxCJbTe/yEwoWdk/CvGUfj8TtEwEh3oLRHqoXNwsncR3W5EmmKFIMj
 9zPVQnu+IZLIXBO02aqcXgJMVGpx7GY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-HLgCnaWyN5KNi7lhfMCsaQ-1; Wed, 18 Nov 2020 03:38:12 -0500
X-MC-Unique: HLgCnaWyN5KNi7lhfMCsaQ-1
Received: by mail-wr1-f71.google.com with SMTP id f4so621345wru.21
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZitZm1Vwi2HnXMn3z66NARvXR7SABBnylrQjF1/e6gA=;
 b=axMxBhFcQP+5pWT0plg1dtn5bSUOpN6WX38px7SRU6L+I5NG64H8lIF8NCO0Gw/a97
 OQMfrgtBjIRScFZ4pFBleAtsLd9CpC+JP7VkQPBDPCdydqEwLIrWVWHdxl5wa5kyufcg
 CnIaa+3RMWSuB2V43xn0oMu+YQQoe72QEJlcS+ss81MZWhNGLjL1T8/k4/3+n/88j4xv
 6mimoyG9h0e5gjGUab+J7xT6o+AQYu811zPeKzAQ+gYgIrw215MX2TKRhSF5XAg5JcZm
 wzVEDJohgvTI0sxaVk8IyIOGMUI/pKHoKhDkc8tWGUcvLq4/gPjQ3DOsffjKZDy4ggcO
 EnkQ==
X-Gm-Message-State: AOAM531N4K6aiQDjMnkFW1emZDmJZVfi88xKfcP9GqdAzHoeOV/RmHX5
 +sXM6oTzZOO2U08op0fpEWkHTdUhrztrSgY/R10kv9WIPVVRftzW/3ioucDAYMqfG9Fh7Weel2S
 1DaJ/1VFE/9LvKnYWcsVEOUz9Y+gkzusdEoDfJ1YlEhnUHBQccAvpLsg06vwVXpGppXM=
X-Received: by 2002:a5d:438f:: with SMTP id i15mr3641768wrq.121.1605688688930; 
 Wed, 18 Nov 2020 00:38:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ18jcbOr6Gmtt7X4KYo6tTBzCANLH9k9sFW1+G1gKTfomoE1GlExq1RvLniJpbK7Z6tPG/Q==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr3641748wrq.121.1605688688746; 
 Wed, 18 Nov 2020 00:38:08 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id g20sm2430408wmh.20.2020.11.18.00.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/27] failover: Remove primary_device_dict
Date: Wed, 18 Nov 2020 09:37:33 +0100
Message-Id: <20201118083748.1328-13-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was only used once.  And we have there opts->id, so no need for it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 17 ++++-------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index a055f39dd6..fe353d8299 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -202,7 +202,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    QDict *primary_device_dict;
     DeviceState *primary_dev;
     char *primary_device_id;
     /* primary failover device is hidden*/
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 953d5c2bc8..6e5a56a230 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3186,28 +3186,21 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     if (!device_opts) {
         return -1;
     }
-    n->primary_device_dict = qemu_opts_to_qdict(device_opts,
-                                                n->primary_device_dict);
     standby_id = qemu_opt_get(device_opts, "failover_pair_id");
     if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         match_found = true;
     } else {
         match_found = false;
         hide = false;
-        n->primary_device_dict = NULL;
         goto out;
     }
 
     /* failover_primary_hidden is set during feature negotiation */
     hide = qatomic_read(&n->failover_primary_hidden);
-
-    if (n->primary_device_dict) {
-        g_free(n->primary_device_id);
-        n->primary_device_id = g_strdup(qdict_get_try_str(
-                                            n->primary_device_dict, "id"));
-        if (!n->primary_device_id) {
-            warn_report("primary_device_id not set");
-        }
+    g_free(n->primary_device_id);
+    n->primary_device_id = g_strdup(device_opts->id);
+    if (!n->primary_device_id) {
+        warn_report("primary_device_id not set");
     }
 
 out:
@@ -3396,8 +3389,6 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         device_listener_unregister(&n->primary_listener);
         g_free(n->primary_device_id);
-        qobject_unref(n->primary_device_dict);
-        n->primary_device_dict = NULL;
     }
 
     max_queues = n->multiqueue ? n->max_queues : 1;
-- 
2.26.2


