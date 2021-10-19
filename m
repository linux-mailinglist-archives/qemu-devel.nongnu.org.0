Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D386433513
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:51:13 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcneC-0000R1-5M
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnBB-0000py-N1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnB9-0002lK-TY
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9dVY/FdYgobEPIXwfeyLGyGilitrT6maCqqauzoxr8=;
 b=H6auLDRyHN51G09F6kNJn2rzcB3XbR+CbexCNOO2fivyoZdduiQ0bNkCi0hY2/QyZHMdb6
 ZBZraIDcCKHlbT+cOjo+XJS9HrgN7m/AXVS68Z3m3g4i/LLVJIwnmCXu2UWcsR8eNycM1F
 ZeAK5lObP+zr3sJpg7UX7OjjoaY7JKk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-bnw1rc2KMZiOuoClS_n9nw-1; Tue, 19 Oct 2021 07:21:07 -0400
X-MC-Unique: bnw1rc2KMZiOuoClS_n9nw-1
Received: by mail-ed1-f70.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so17256326edl.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/9dVY/FdYgobEPIXwfeyLGyGilitrT6maCqqauzoxr8=;
 b=ooMLGHeAxSzuZ4VUz9R4PBWyEN1rtgS1bWqhDApNac/jvo2xeTAxE9XQ3lNF5dG/bx
 lQdPs7WOd5o6yI5oNpU5+ZMSnsUli0KY5syr91XYfDv0cEPbexv5tfEk5wmOvsr+V1Nb
 Swci/5RVSrPQsRCGBjXTG4O9SXLrEereUsDkhHzHuYraoSLJeIkCMRCqBz/YRCjnujgX
 MO97bTf5Gi+5elm8EOO2x55DiOlz6ngQ1Qm2RwFDCkuj5BZjL5WmYaSVCeCSEvG/iKBM
 WRG3gVnhlol0Pc7vENRkuh2yIDtb0DjpiTaMVLSK5znqo3noqnH3lTyJI01UV3OLysN/
 Akew==
X-Gm-Message-State: AOAM532bOShdFlOxCZVOWbkWLL2qcDBuu/UQIurJTmaXD0k0PAiPHmJq
 T+eXGxFnMn7p8NN84Oral5CPY9GODCqtdySyPgd399LkApmEo8cgORowbqMffqty5ZCR6wl4UTR
 6OSIm/rUoJTNuQU9+cDeAFuX8jzRxRg3sH22HSM5XQKxEj8mN73QbwaHuqwuc
X-Received: by 2002:a50:e14c:: with SMTP id i12mr52296011edl.125.1634642466058; 
 Tue, 19 Oct 2021 04:21:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjSKTDCl7shTR3Xd/ztKI3yGu/pGFkpkhQKbRxB4xkvX6bMmqNYnq/e0gEHzBeWbJT0MMr/w==
X-Received: by 2002:a50:e14c:: with SMTP id i12mr52295985edl.125.1634642465852; 
 Tue, 19 Oct 2021 04:21:05 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id 91sm8257104ede.56.2021.10.19.04.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:21:05 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:21:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] failover: fix a regression introduced by JSON'ification
 of -device
Message-ID: <20211019111923.679826-30-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

The hide_device helper can be called several times for the same
devices as it shouldn't change any state and should only return an
information.

But not to rely anymore on QemuOpts we have introduced a new field
to store the parameters of the device and don't allow to update it
once it is done.

And as the function is called several times, we ends with:

  warning: Cannot attach more than one primary device to 'virtio0'

That is not only a warning as it prevents to hide the device and breaks
failover.

Fix that by checking the device id.

Now, we fail only if the virtio-net device is really used by two different
devices, for instance:

   -device virtio-net-pci,id=virtio0,failover=on,... \
   -device vfio-pci,id=hostdev0,failover_pair_id=virtio0,... \
   -device e1000e,id=e1000e0,failover_pair_id=virtio0,... \

will exit with:

  Cannot attach more than one primary device to 'virtio0': 'hostdev0' and 'e1000e0'

Fixes: 259a10dbcb4f ("virtio-net: Store failover primary opts pointer locally")
Cc: kwolf@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20211019071532.682717-2-lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/net/virtio-net.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 09e173a558..83642c85b2 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3304,15 +3304,27 @@ static bool failover_hide_primary_device(DeviceListener *listener,
         return false;
     }
 
+    /*
+     * The hide helper can be called several times for a given device.
+     * Check there is only one primary for a virtio-net device but
+     * don't duplicate the qdict several times if it's called for the same
+     * device.
+     */
     if (n->primary_opts) {
-        error_setg(errp, "Cannot attach more than one primary device to '%s'",
-                   n->netclient_name);
-        return false;
+        const char *old, *new;
+        /* devices with failover_pair_id always have an id */
+        old = qdict_get_str(n->primary_opts, "id");
+        new = qdict_get_str(device_opts, "id");
+        if (strcmp(old, new) != 0) {
+            error_setg(errp, "Cannot attach more than one primary device to "
+                       "'%s': '%s' and '%s'", n->netclient_name, old, new);
+            return false;
+        }
+    } else {
+        n->primary_opts = qdict_clone_shallow(device_opts);
+        n->primary_opts_from_json = from_json;
     }
 
-    n->primary_opts = qdict_clone_shallow(device_opts);
-    n->primary_opts_from_json = from_json;
-
     /* failover_primary_hidden is set during feature negotiation */
     return qatomic_read(&n->failover_primary_hidden);
 }
-- 
MST


