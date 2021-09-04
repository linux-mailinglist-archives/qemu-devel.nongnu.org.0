Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5342A400D1A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:38:03 +0200 (CEST)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdMQ-0006EF-DK
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKY-0003TM-Rx
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKX-0000jS-CS
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=doYK/spK0f25lGEJlA5QHUXT/MrGzKE697ZoiH7sqDc=;
 b=gLn+XnLCeT737OzuOCAQlL7ld2pDhpBc/0mi3Ez6kl5k4NlMer8asvXVzLio6zG7DvTAkm
 A+JQD6iHyFzFI0akbJGdBYZmuxMIf/ySuIS4kgoOjSal7hUCV+AAiEAQeC6DjYg2tyHvNU
 rAQfI45kSSS54+jN8L8R/j4b2BVx76I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-lfBFxvypPpqu9Oqn905APg-1; Sat, 04 Sep 2021 17:36:03 -0400
X-MC-Unique: lfBFxvypPpqu9Oqn905APg-1
Received: by mail-ej1-f69.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so865101ejy.6
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=doYK/spK0f25lGEJlA5QHUXT/MrGzKE697ZoiH7sqDc=;
 b=mkk/ClPfwuYWoimLzSrlILUnAxAPT8ePuEFABI5KmlsyAOgmdu9Gtgrjys9LQ/o5J6
 hD1UgrjkICkHTfXa4xV5NG6WEk+YAV2G2fMKoxKBgKNBz7L9OYYzX6vzWfWnaP4haMp5
 UVFE8aTTWop/thZ0+PsaCjEFao3QFEida1sysaY5lx6eoHEFFdvCvASiD3NNRiuP9Ag5
 uA8OD8M9hpA4hu/Aiuy6snE3kQjffAOXX6RW3cUrZlQuoobu70MiST15xiu6b2OUTs5G
 OXDzbG3cD1Xd6S91QzBr/N4BISwEbTrlAca4ackjckPjf4fBhDl/vM5/mseYxOruzRev
 Fa5w==
X-Gm-Message-State: AOAM533DRUek9ofZvhZUBuDup1wnvvyR0xyRATuALQUhdtVFCpLaqf9J
 aGulV8hIO1UUCobhoxq5lG8hDFB/eAdLzNv56YH4W+U74vtsC7hVepsZDKSnxYF0E/YGbNC8Urc
 hBynZNl1K9bT0cc5G20TFClPLslsRp5/V3u930N73Bk2xGg7yedKn392Gw0Dx
X-Received: by 2002:a17:906:b18e:: with SMTP id
 w14mr6044199ejy.63.1630791362204; 
 Sat, 04 Sep 2021 14:36:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjqnl++0IXqB1wzzTGxb/qs0Wa02rtRPPHZvBmEqvfUOhJYnQlcf/7pS15pXjtSKCkMU1ffQ==
X-Received: by 2002:a17:906:b18e:: with SMTP id
 w14mr6044181ejy.63.1630791361939; 
 Sat, 04 Sep 2021 14:36:01 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id n13sm1523782ejk.97.2021.09.04.14.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:01 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:35:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/35] hw/virtio: Fix leak of host-notifier memory-region
Message-ID: <20210904213506.486886-3-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yajun Wu <yajunw@nvidia.com>

If call virtio_queue_set_host_notifier_mr fails, should free
host-notifier memory-region.

Fixes: 44866521bd ("vhost-user: support registering external host notifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Message-Id: <1629077555-19907-1-git-send-email-yajunw@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2407836fac..33002300c2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1474,6 +1474,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
+        object_unparent(OBJECT(&n->mr));
         munmap(addr, page_size);
         return -1;
     }
-- 
MST


