Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69E400D3D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:54:51 +0200 (CEST)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdcg-0006oM-LK
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdM0-0007Og-1M
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLy-0001l1-IS
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zCB7vIb7x0G7L9EN7GtILOvYbJbo5hiB2KP6eTMzDhg=;
 b=LNEAdwUIuOchtAomrGcEW+fl19HBFSa64lPKeEXQGikrbvpTHKyWEqOz+yhTQ2BG5b8kuU
 o8+aky8E6FAUo3WNOZBUnNWhBvw29GdCKam+o0TzgOMjoN8cr9mMZKBxNkw3CDzg11WoRy
 efwNuyBb3N4w9RjrOnE7nCTK5E/p25o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-36_xIl4OOfSSGiBtOWx8gg-1; Sat, 04 Sep 2021 17:37:32 -0400
X-MC-Unique: 36_xIl4OOfSSGiBtOWx8gg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g17-20020a056402425100b003cd5ba2852fso1509671edb.1
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zCB7vIb7x0G7L9EN7GtILOvYbJbo5hiB2KP6eTMzDhg=;
 b=W+WRahnuEse3WcBdlkgGxqwhOuZ59LvuuQxpJxqVbGzczN1JGWDWARLZwRTB3SUqzX
 V/YqZ5CVToE72lJlnHJbhyqcFHw48NZ73H5WL9/8tKqsWO4B4vayD+CzaXpK2jFe7+P4
 W3VZOa3MowB2PIyEh5wXUuINQKtoNN/JlpUKmaM1kM7qs3guHBdSYxSb5+TyUaQqzMMz
 s158DVobDugFv/XNSApLyiDCz7kMcWdRruv+dctGrCmJGe+70dLqcfcoivdMQLFpiVmt
 nIN2AWo8f6CNY6abcpYOZx/KXDxjDAr77cP+jCn/Yt4F3ujbcYPM++aDgWJzCyfVSg9X
 JK4Q==
X-Gm-Message-State: AOAM533FshBqHLjSE21R9dk0qdBkb9mT5dpvpxsYL1l0OKSTcS+qCFk1
 oTyAczcFI5lI2Y3jHHzVwkm0vnMs50yfiSyfDjhvrhPeio5iRx/3DKmhm3Lm1zTK269FiGhhbwi
 ZHFQlrKy4GYuiBuVUu4MXwXJw1+VyCoh6MdIF/AliO99HCvXRp6sAN7NlmHyX
X-Received: by 2002:a17:907:2677:: with SMTP id
 ci23mr5788541ejc.429.1630791451338; 
 Sat, 04 Sep 2021 14:37:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYipNLk8sxvZlwfjYEwHMRV9QGtoGJh2soKCkwqAc509hFYc6GPClXJqI21NLO9qCI/aXd/A==
X-Received: by 2002:a17:907:2677:: with SMTP id
 ci23mr5788524ejc.429.1630791451144; 
 Sat, 04 Sep 2021 14:37:31 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id d16sm1912186edu.8.2021.09.04.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:30 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/35] vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
Message-ID: <20210904213506.486886-32-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

The previous vhost_net_cleanup is sufficient for freeing, calling
vhost_vdpa_del() in this case will lead an extra round of free. Note
that this kind of "double free" is safe since vhost_dev_cleanup() zero
the whole structure.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-8-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 5c09cacd5a..3213e69d63 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -81,16 +81,6 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static void vhost_vdpa_del(NetClientState *ncs)
-{
-    VhostVDPAState *s;
-    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
-    s = DO_UPCAST(VhostVDPAState, nc, ncs);
-    if (s->vhost_net) {
-        vhost_net_cleanup(s->vhost_net);
-    }
-}
-
 static int vhost_vdpa_add(NetClientState *ncs, void *be)
 {
     VhostNetOptions options;
@@ -121,7 +111,6 @@ err:
     if (net) {
         vhost_net_cleanup(net);
     }
-    vhost_vdpa_del(ncs);
     return -1;
 }
 
-- 
MST


