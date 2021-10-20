Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA7434A05
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:28:50 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9m5-0003MY-IL
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iS-00058j-DU
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iQ-00040c-KB
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V3zgkgL9B3Vw0keIC20IKijqN9D0BqQFsfEDVquxzJQ=;
 b=TlXjfYLWXtEQsGQIA7O4fh1Ka/w4wSXCrhpiHqpJ9C5BiA7xTZElRPx2uTVH5P74LBMCHj
 oVvuh7mtanAhUrp801nC+Is2CESlVaTpiMREgg02uvL2ws/XUKbMJLVOFCdspiWvY8uDRU
 3igFLzyQiGrZBGMRGpUCDMZBCzOS7rs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384--SYae-lqNFmbf-ZHalrjCg-1; Wed, 20 Oct 2021 06:20:54 -0400
X-MC-Unique: -SYae-lqNFmbf-ZHalrjCg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so17491493edj.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V3zgkgL9B3Vw0keIC20IKijqN9D0BqQFsfEDVquxzJQ=;
 b=OHHFn4t6YBmYq1fn4a7FQcgDafWMr972dqJCDoW8YYNRHbbdCCKofO442IDeH4q1Yt
 ibPWshSlR00RfRnsWdztRaTFGZECMYYzmy8m7U5sEdXrdF37V0xSOLLuY+UjgCwqnWIA
 bV1bugfgZf8ADawdH9oHtgfeD/4cXpZuvi7Oyo7BbSpuIuAHGI4p31xK4u6SVifVni/1
 aW3PBYyMJ/TDt44Td/nAN5nezwXIx3GCXdjJecrNWyq7f407aYtH5XHhFsP/2tXxPfX2
 uiNuT0PlHP14Pz8J3AhL0pu0QPzVfBhjmJGaindtELa9VeNZZ3J1HoYmQhhtE8AHxMDB
 PJlQ==
X-Gm-Message-State: AOAM531GZC4cD+EY6vP8rT0vBnUSSaXF3Tseh7nTEBYZqpI2VRTSDK7n
 mWij9gmK+oEBepw5xCUavV3LEAvEPhfiS3vjV5n+TLOcIYPGr9cBvNXg3wkbq0eRB68ErPL4q7J
 xx8NKqcF05VxXkbyV+aJlX6GWtG0UVaO4pgDAw/8bAETPJpbeuOsGCNLYyu0c
X-Received: by 2002:a17:907:e94:: with SMTP id
 ho20mr45952457ejc.243.1634725253379; 
 Wed, 20 Oct 2021 03:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVcy2vx3AjDaLv03O049q5gKnoxEg/JBe+VhIycZ8qzdi9ovNxUYHD75o3YlHVSxNvWKFq0A==
X-Received: by 2002:a17:907:e94:: with SMTP id
 ho20mr45952441ejc.243.1634725253187; 
 Wed, 20 Oct 2021 03:20:53 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id s24sm937248edy.38.2021.10.20.03.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:52 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 35/44] net: introduce control client
Message-ID: <20211020101844.988480-36-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch introduces a boolean for the device has control queue which
can accepts control command via network queue.

The first user would be the control virtqueue support for vhost.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-6-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/net.h |  5 +++++
 net/net.c         | 24 +++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 986288eb07..523136c7ac 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -105,6 +105,7 @@ struct NetClientState {
     int vnet_hdr_len;
     bool is_netdev;
     bool do_not_pad; /* do not pad to the minimum ethernet frame length */
+    bool is_datapath;
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
@@ -136,6 +137,10 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
                                     NetClientState *peer,
                                     const char *model,
                                     const char *name);
+NetClientState *qemu_new_net_control_client(NetClientInfo *info,
+                                        NetClientState *peer,
+                                        const char *model,
+                                        const char *name);
 NICState *qemu_new_nic(NetClientInfo *info,
                        NICConf *conf,
                        const char *model,
diff --git a/net/net.c b/net/net.c
index 52c99196c6..f0d14dbfc1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -239,7 +239,8 @@ static void qemu_net_client_setup(NetClientState *nc,
                                   NetClientState *peer,
                                   const char *model,
                                   const char *name,
-                                  NetClientDestructor *destructor)
+                                  NetClientDestructor *destructor,
+                                  bool is_datapath)
 {
     nc->info = info;
     nc->model = g_strdup(model);
@@ -258,6 +259,7 @@ static void qemu_net_client_setup(NetClientState *nc,
 
     nc->incoming_queue = qemu_new_net_queue(qemu_deliver_packet_iov, nc);
     nc->destructor = destructor;
+    nc->is_datapath = is_datapath;
     QTAILQ_INIT(&nc->filters);
 }
 
@@ -272,7 +274,23 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
 
     nc = g_malloc0(info->size);
     qemu_net_client_setup(nc, info, peer, model, name,
-                          qemu_net_client_destructor);
+                          qemu_net_client_destructor, true);
+
+    return nc;
+}
+
+NetClientState *qemu_new_net_control_client(NetClientInfo *info,
+                                            NetClientState *peer,
+                                            const char *model,
+                                            const char *name)
+{
+    NetClientState *nc;
+
+    assert(info->size >= sizeof(NetClientState));
+
+    nc = g_malloc0(info->size);
+    qemu_net_client_setup(nc, info, peer, model, name,
+                          qemu_net_client_destructor, false);
 
     return nc;
 }
@@ -297,7 +315,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
 
     for (i = 0; i < queues; i++) {
         qemu_net_client_setup(&nic->ncs[i], info, peers[i], model, name,
-                              NULL);
+                              NULL, true);
         nic->ncs[i].queue_index = i;
     }
 
-- 
MST


