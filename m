Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188CF4349D7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:11:18 +0200 (CEST)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9V7-0007Ys-4v
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iP-0004ww-Du
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iM-0003wV-T2
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTgVRpCR0nUBmFYLzdqJBENq3kGLdgdi4jGn1zHZWuU=;
 b=S4eY6elapz1l6enAli5N44Owp7WH958PzoJ0izDPgp7XyOYtNEqNYZHZbJMb3UP96JhUs0
 XzpCzqo3dU4A+oq1+QM1AWZuzwa3nbjglqNJnP3lygvclIBg9J3tWt2zz0dWk6TDQ8TLsQ
 DeOHqFvpu2p3vatq35I6uvG4GeizybQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-wYlXZztlObqytxEpUoJiug-1; Wed, 20 Oct 2021 06:20:52 -0400
X-MC-Unique: wYlXZztlObqytxEpUoJiug-1
Received: by mail-ed1-f70.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso20542749edn.4
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UTgVRpCR0nUBmFYLzdqJBENq3kGLdgdi4jGn1zHZWuU=;
 b=PZ73w9DEitPPqdzpARvcvjsfZeZ50/u3v7pMq2wF3aVi9fZahrq2KD1KrGuLl9XdGO
 clBnPzd2xEjjJrTvFmOGqOzAWDHYUqfwUG4yXwZeVpM5Vc4rRK3Wqe6JNYmzUZrD4lUN
 jx7St61rtCLbJiSZ13GjFduhFsEs+8w9BVgihrnk5n3dR9DbxXn7ekRcWYfocZUftp6h
 iVTzm7yCDzQwf1eU5o0lpV5zDrGyOTi85DOhh0ZLzK4GgqES95ecctUpiNCclpP+Uvc7
 SLCVGwV/vnd0wlOGLP47C/r8iYZqj61KFeA5FJLNubrEmTWCLfA9wE8B76d8d96LHnKr
 E5vg==
X-Gm-Message-State: AOAM533zVq1FG/tDa2zydhTDQLrMYUWAlYvC5sBKMoiHaQiczuKwwKMZ
 LrqV9ASrcVxetZZ2y5mg3wEuaeRqlltdWEZyqtg094FQr8xwEWWLBWg97a5Y58HbwZfvMybdzCt
 bq7XflnrKMcmdaw70bdnbtwh/oI8zcJ+2EIBcBCUJ07k09zv4coURrRDY9AwQ
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr60301147edc.227.1634725250815; 
 Wed, 20 Oct 2021 03:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEUPs8r6vEptz0MxgP6AxxNrexTFjrycgOrlcu0tFgVAHiOPXMLpLo+sUiCdB/jNZBNfvLCQ==
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr60301128edc.227.1634725250652; 
 Wed, 20 Oct 2021 03:20:50 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id v21sm803031ejk.92.2021.10.20.03.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:50 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 34/44] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
Message-ID: <20211020101844.988480-35-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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

This patch switches to let net_vhost_vdpa_init() to return
NetClientState *. This is used for the callers to allocate multiqueue
NetClientState for multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-5-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fd4ff5a0fb..151f60184d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -169,8 +169,10 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
-static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
-                               const char *name, int vdpa_device_fd)
+static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
+                                           const char *device,
+                                           const char *name,
+                                           int vdpa_device_fd)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -184,15 +186,17 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
         qemu_del_net_client(nc);
+        return NULL;
     }
-    return ret;
+    return nc;
 }
 
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
-    int vdpa_device_fd, ret;
+    int vdpa_device_fd;
+    NetClientState *nc;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -202,10 +206,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
-    if (ret) {
+    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
+    if (!nc) {
         qemu_close(vdpa_device_fd);
+        return -1;
     }
 
-    return ret;
+    return 0;
 }
-- 
MST


