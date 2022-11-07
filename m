Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3462029A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwm-0001Ne-0H; Mon, 07 Nov 2022 17:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwj-0001Hs-JD
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwh-0003pc-1Q
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=fcRQxaEeJSD9FFWEtvJ4Hv9P/bxLzyXqH14UgoE7sFngR6OLyiDR78T/owqcpFe+5zF2BI
 stp0HteIqEB6BPP4VcudwOD0d5egKcyrGROq/4aA0JemkvvUWefN+vPMa4Q40kk44GKsTR
 6LXOau1D+V/Mf2ErpzoMBpgTkiXXT28=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538-KKyQhzCtMvyDlJotUt3i_w-1; Mon, 07 Nov 2022 17:50:15 -0500
X-MC-Unique: KKyQhzCtMvyDlJotUt3i_w-1
Received: by mail-qv1-f70.google.com with SMTP id
 g12-20020a0cfdcc000000b004ad431ceee0so8493497qvs.7
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=uYYOxgMVLccsPL51NJbylbWPAyrnC72OlIqqzpuXc9hYJQHGQWgoqTnWysUDdFTDYD
 Lwp+WxKP4rE6SqQ3hkLaMRisg9FuFsLLOTYkER7pVQgNmtp1mnZ6LstNGNyliGmeN2zk
 t935Eq+fc+aWYuLF642JLTVMx7LgyrEyrQ5/jUJaY6cgNQ+z/or/fg4ITJ19YdTZxA2m
 ZTbqBSWlYZfZIEDJzbt+sZ7Sn0zJldv1u2z4xLz0QLXoobcFn8aHuRTuGMS8V2RQB45w
 Dn8DyCDTTKNs4YDc+86ZlawdxPhAXYgdBFKrlI7LnJCp0DMEjmbiXuhGJzfm0wHJNSju
 LRjQ==
X-Gm-Message-State: ACrzQf344x7aT9AZjsu403z22W02z//MnQtbVF2uWj44iovfz/X4+/s/
 s7JOwe4rp6LUuVWVMeFzjF82Ti2GFz6nkWDfh+gRAOeNPXtj60rditGaecZmJ2cUtCt7unpAamT
 aCcELgMrvystbyFZ2eqMyeF3CEPsqyZ4H9Hqqje4mXIYzReF7qacnyx+ulFua
X-Received: by 2002:a05:6214:3013:b0:4bb:1be2:f542 with SMTP id
 ke19-20020a056214301300b004bb1be2f542mr47197225qvb.7.1667861415317; 
 Mon, 07 Nov 2022 14:50:15 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6C4+ji6Sk5BzE+miDN88ge20r6i7+RgGGY6rF2XZzEWzZ7s6b48EVicpCwjzyyswj2uqiLuA==
X-Received: by 2002:a05:6214:3013:b0:4bb:1be2:f542 with SMTP id
 ke19-20020a056214301300b004bb1be2f542mr47197207qvb.7.1667861415049; 
 Mon, 07 Nov 2022 14:50:15 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 ge17-20020a05622a5c9100b0039cc64bcb53sm6929717qtb.27.2022.11.07.14.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:14 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 32/83] virtio-pci: support queue enable
Message-ID: <20221107224600.934080-33-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

PCI devices support device specific vq enable.

Based on this function, the driver can re-enable the virtqueue after the
virtqueue is reset.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-7-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d4f2ffe986..855718d586 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1342,6 +1342,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
             proxy->vqs[vdev->queue_sel].reset = 0;
+            virtio_queue_enable(vdev, vdev->queue_sel);
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
-- 
MST


