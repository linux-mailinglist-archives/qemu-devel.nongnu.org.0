Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B81443497B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:56:25 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Gi-00042r-92
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i2-0004mN-2o
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i0-0003bL-AL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9dVY/FdYgobEPIXwfeyLGyGilitrT6maCqqauzoxr8=;
 b=Sw1fwT5mmtS+YlfwyenCI66dDS+qdo1PTvQ1qLBiCsQTDzWASUYkXFSb2YPhulqwYrmx8w
 urzb75gG0YkDjZbkDgOCBVXlVmOPzQ2LYGJ01+ta7MgVU6Zd0o2Ggks8VkJynDXJ3jUXu3
 ATAMOIaoNGHLYeEMgzhmuwKOFQYibzM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-6QuaIj_2OZauN7-sKlMsUw-1; Wed, 20 Oct 2021 06:20:30 -0400
X-MC-Unique: 6QuaIj_2OZauN7-sKlMsUw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so20550287edb.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/9dVY/FdYgobEPIXwfeyLGyGilitrT6maCqqauzoxr8=;
 b=Q7wE62EhjMazXTt6pfFRSoRLiedizBlkQUkeuKkXECK8RVM3ZqXP5TSQGyvYU9hiFp
 4CHGyB/s1MC6C9Oovo79cPnn7mfwAmhIKG58o+eaIep2cSH8EvZVqhUGfqyL3aCOHfsu
 xcV2esK/yPcjjVR3omXEXJnf6PdhDf3J01PYjHCi/cX4OQtDrvp8Tee2qWWgttgNr6e4
 O/xi8s3b6chFpUsg8QNr0j8fwvICZ7prO5ese+GvGmNntbLo7Cgj5OohM5+nrsGMWShg
 BgFVm8FaT40h+RMIzduvSNOfQoHJFD51MzTCfS/2DbxvFylh2IMd5w2z09dlaDJHRfGX
 zotA==
X-Gm-Message-State: AOAM5333L3knudda+c2oq2va8lnKlsjEOqQEUiyaJRLKJe6Tu3jou2QX
 rhZnN3zENDrNFm/ony/P1yWyWzQty5Vd+kG9GOdXtImbcfpKKNFDxwxfbagdzdzGrUVDlkikaJc
 h84hFZG7wl1PQh2RUWFs+qevtMeBBcodpJqbpHjsJD0W29pQ9N/ytVvILDdIF
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr46167669ejb.10.1634725229028; 
 Wed, 20 Oct 2021 03:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwahFq2ZHFFXrZFt2R4tFM6Fb3G13eUBeu7Ozi1S5ZfZXybYXUaI5RljNWTN3mGFUzAWIHKVA==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr46167640ejb.10.1634725228796; 
 Wed, 20 Oct 2021 03:20:28 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id h10sm931715edf.85.2021.10.20.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:28 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 26/44] failover: fix a regression introduced by
 JSON'ification of -device
Message-ID: <20211020101844.988480-27-mst@redhat.com>
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


