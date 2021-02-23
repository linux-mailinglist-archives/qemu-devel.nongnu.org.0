Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18D322E78
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:13:21 +0100 (CET)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaJM-0006lo-FR
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCd-0006sj-6J
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCb-0004n6-HR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+g107fz8NyXkf8pQpsEFuy3373s3rquehEYOznfXGs=;
 b=fVAOnn2AQ/PEZP3crDQSRTcOvnjO9gCBx99OBizoScYe4uOs4MKngmrGjsbj8+fmN7fdCu
 LvxqxKiOagfhRA1TJSO35eIQGbov8Oi5R0CTF+E4NeACqZ+ybQFIam0X4LJyx4Vxbpxxzb
 wUwMxaCdNx9t18fOZ+GFf1jgR6HBF/g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-gD5GFgRxMMi5l0M1tH_w0w-1; Tue, 23 Feb 2021 11:03:50 -0500
X-MC-Unique: gD5GFgRxMMi5l0M1tH_w0w-1
Received: by mail-wr1-f70.google.com with SMTP id x14so6884817wrr.13
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O+g107fz8NyXkf8pQpsEFuy3373s3rquehEYOznfXGs=;
 b=kghJzRl310qflZEiQ+DSU4DkJmi5P095jtPmOFzbO5rP6qP+c4tTfeNi6dT+CO1/Q+
 iH30A0rK3Qt5Ru5qpQT915XTvZI44r1bBVGoMkz7cijOPYpPnWonZiYGMXhUSa7W0IdB
 kxG6M0XbM76aQqhKPIJ5YGYaP87Tolp8jXK0Om1B4IjjNHpyfWpcjlQhFyMfsBabgpdb
 ClMpTBBgmteKPmAqdgTrUaweajVStIKAdZwVPBVMmfmnU8EPRmO3ptpCYoFbVfuBHuOS
 D43QXq1dbq+HTcUv+IQUmsrWfhpM69lBw7cTF/mVz88Ekp28WOEv7Y5g7WurW7b2KttR
 VW9w==
X-Gm-Message-State: AOAM533Dc8uvr02IUGG6xNw9xQvXBRvGup7kLLbeVHid+Q7QEwHRxf6G
 VmRhemrE6dFNvaApN3thu195TmdowaeBa+ORQ3wogMxIsC9MwDRJrbm0khhMNFt/dmL+o3x/v+b
 qjOYLd88Sc3Tv1wk4LP26r1RDJkTOnjHiYoNMivu5JrNVuMQWaB21IBr0Oncb
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr25376560wmj.58.1614096227314; 
 Tue, 23 Feb 2021 08:03:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxx9Y8xJCUjuwmL+maY5wtZtTIy6/c4yZ/HZR0oMJF87jv4EGknWfanER/HtVs7MBrDekzO3w==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr25376539wmj.58.1614096227083; 
 Tue, 23 Feb 2021 08:03:47 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id z2sm3150450wml.30.2021.02.23.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:46 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] virtio-net: add missing object_unref()
Message-ID: <20210223160144.1507082-3-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

failover_add_primary() calls qdev_device_add() and doesn't unref
the device. Because of that, when the device is unplugged a reference
is remaining and prevents the cleanup of the object.

This prevents to be able to plugin back the failover primary device,
with errors like:

  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
  (qemu) device_del hostdev0

We can check with "info qtree" and "info pci" that the device has been removed, and then:

  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
  Error: vfio 0000:41:00.0: device is already attached
  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
  qemu-kvm: Duplicate ID 'hostdev0' for device

Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
Cc: quintela@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210212135250.2738750-3-lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/net/virtio-net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5150f295e8..1c5af08dc5 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -862,6 +862,8 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         dev = qdev_device_add(opts, &err);
         if (err) {
             qemu_opts_del(opts);
+        } else {
+            object_unref(OBJECT(dev));
         }
     } else {
         error_setg(errp, "Primary device not found");
-- 
MST


