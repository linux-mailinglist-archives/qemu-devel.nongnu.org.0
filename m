Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8B461756
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:01:06 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhDM-0002i4-RK
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:01:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh46-0003g8-PK
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh42-00031K-QV
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVLwpiU67LdLjERzs2TvjGxNupilX2wDR1L6Rld+HNM=;
 b=DFhAPJ21K599KOtNDfVzyHECs3SKvnoQnI3/lM4vGzmJ0fjlHyZzskcXwTWL3Yz7eaEf0p
 aa4v3u/cpK3r0U2KFg2F+BBHxiz2nfNnpvV2HakCkFvI6iNsYYlMLufrL5nXfWshnERlAZ
 aYxo4yQLHloJ08VRhT8cHp7G3JPugSk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-JC9zig1lP8azrROHiNvrXQ-1; Mon, 29 Nov 2021 08:51:23 -0500
X-MC-Unique: JC9zig1lP8azrROHiNvrXQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m12-20020a056402430c00b003e9f10bbb7dso13749473edc.18
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LVLwpiU67LdLjERzs2TvjGxNupilX2wDR1L6Rld+HNM=;
 b=uv+Iz11eB1GX9ABG2xBmlV2yWReCQ6eLQ4uW8SGeEWGyoZ+nnooealDxtIArQawiux
 VPhY3l5M5VRQERelVujLm2UPsTGnX6YA3ip0Z5QBe2EGzoF9PDGscfsPIo3T1LOe2GnP
 97vSs9+aZ3x0vHZ1TnWrU8IP3UtZz95Yc+l7Q2W1Zbv7tXWN/kpYWZYdTRYJUiAgycuH
 1BYW4sgmeUM1DLLhzfALal6eQ2QTV0aTjMpoOJVPGw79JNu7353vmFkF2ZxvBQBlcmQv
 8u3x8oaXpak6AournxyU/xwiCbdDc5OW4M97lP4xg+RDT2+gdOgUsdGvl5fCJsDkzfm3
 9oDQ==
X-Gm-Message-State: AOAM530w++ivE4fToC7tPwi5T+RewIBbq+bPRVhmPQ4I4IEfVhcjfjVU
 EbMrBanoTc7scpq/wpGyq6MHvz2pB5U9kh8mCPcLkmIdVlk5e1lVltA0WsmdHqxMS6KCRjZaagt
 /d+ctytPqOLwZV4ia5tErx2vPszYtpgxjDcv3pVwiXfg/uRtCph8ADSnnPNSm
X-Received: by 2002:a05:6402:268e:: with SMTP id
 w14mr74523036edd.48.1638193882239; 
 Mon, 29 Nov 2021 05:51:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBxhuEs9BCa5i6xnr43doK12VIxHW7paqq/mrxBikhH4Y1vwNPjd9V0Ja3gup2uyG0PvnW2Q==
X-Received: by 2002:a05:6402:268e:: with SMTP id
 w14mr74523007edd.48.1638193882093; 
 Mon, 29 Nov 2021 05:51:22 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id sa17sm7888222ejc.123.2021.11.29.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:21 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] virtio-balloon: process all in sgs for free_page_vq
Message-ID: <20211129135053.560225-5-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We only process the first in sg which may lead to the bitmap of the
pages belongs to following sgs were not cleared. This may result more
pages to be migrated. Fixing this by process all in sgs for
free_page_vq.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211129030841.3611-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-balloon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index c6962fcbfe..17de2558cb 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtQueue *vq = dev->free_page_vq;
     bool ret = true;
+    int i;
 
     while (dev->block_iothread) {
         qemu_cond_wait(&dev->free_page_cond, &dev->free_page_lock);
@@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     }
 
     if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
-        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
-                                  elem->in_sg[0].iov_len);
+        for (i = 0; i < elem->in_num; i++) {
+            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
+                                      elem->in_sg[i].iov_len);
+        }
     }
 
 out:
-- 
MST


