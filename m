Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B3616826
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKh-0000ks-E0; Wed, 02 Nov 2022 12:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKJ-0000QW-Ij
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKI-00037t-1y
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mk4Sl4LbuMKont5xSBz6TsoGXbpWs8ZwHVKOV5dhnZU=;
 b=KI70OVRxy86JtBPJ9lLs6q0Yw8XgbnizHxwJKgIIgufrF4KZ9vy4Pv4IJ1sWDKzmvkFQAo
 aPpXl+7J1CLCN+BYLXHxNRkOhMn2LnfX7wRBSoqqEtVfqkBiqfQKNckC9JZdg7ZMDmZQg6
 3J9+rTgHmfxcTNk2OL+bNTbDdPvMjnA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-GMB7RvHRPrqvuzJxNAP6Ng-1; Wed, 02 Nov 2022 12:10:48 -0400
X-MC-Unique: GMB7RvHRPrqvuzJxNAP6Ng-1
Received: by mail-wm1-f72.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1260572wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mk4Sl4LbuMKont5xSBz6TsoGXbpWs8ZwHVKOV5dhnZU=;
 b=nhCkADldMg6cN66NdNe4h1IFoRXwi0waMCXk6hbUx2s0GZpSTJNcS6WPACirrte7qj
 c29+Vct0dwkylFzi5XBXKhEpybzpKCGJ/vEaz7iXc/xhIzT4sfbpx5vItyiAcyAqLUVF
 p3lXUGRphp9iKPzjzSr08E/n3IN5qMnh+UNEET6eEt12U6UeI7XJKO8yFHswnsJULhm9
 cU+RY2Ka73R5wJ1JqHWXQfJ3PYfNB85Mf+SZXZjd9VVxbbtidxSRysF7ApcDncm2edRl
 LCsloR8vvlDah4Zfzp+NGRUvg0Yed4eVjWUQmKGBay5GJUAsXj4rSCnuZ6fHja2b+tra
 Uabg==
X-Gm-Message-State: ACrzQf1S3Q3uJBQB56gX7OSt8iD5w9duA0QIEw2LCyZrYItevMq07w2Q
 Eth8DUmPs92ba8FHIRWlGblgkzg2UkWxkuBxOrrs3f6nwWw13nwKp91IozspHXaGJAki/QLzE3T
 yuu9bAlXr3fVbvbSgUTgEreKDLIcY05zLQ5xfVnFpwzgciiWCbqWl1cpDza1x
X-Received: by 2002:a1c:4b14:0:b0:3cf:801e:47b1 with SMTP id
 y20-20020a1c4b14000000b003cf801e47b1mr6042416wma.75.1667405446827; 
 Wed, 02 Nov 2022 09:10:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65aI5y1XrthbEy/F7O2tdMdt5S8LI8UKkpXTOVyE+rc+8MdNRChJXkrwFeikgtG9lIjkBhMg==
X-Received: by 2002:a1c:4b14:0:b0:3cf:801e:47b1 with SMTP id
 y20-20020a1c4b14000000b003cf801e47b1mr6042388wma.75.1667405446518; 
 Wed, 02 Nov 2022 09:10:46 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 dn12-20020a05600c654c00b003cf537ec2efsm2870301wmb.36.2022.11.02.09.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:46 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 51/82] vhost-user: Fix out of order vring host notification
 handling
Message-ID: <20221102160336.616599-52-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yajun Wu <yajunw@nvidia.com>

vhost backend sends host notification for every VQ. If backend creates
VQs in parallel, the VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG may
arrive to QEMU in different order than incremental queue index order.

For example VQ 1's message arrive earlier than VQ 0's:
After alloc VhostUserHostNotifier for VQ 1. GPtrArray becomes

    [ nil, VQ1 pointer ]

After alloc VhostUserHostNotifier for VQ 0. GPtrArray becomes

    [ VQ0 pointer, nil, VQ1 pointer ]

This is wrong. fetch_notifier will return NULL for VQ 1 in
vhost_user_get_vring_base, causes host notifier miss removal(leak).

The fix is to remove current element from GPtrArray, make the right
position for element to insert.

Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNotifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

Message-Id: <20221018023651.1359420-1-yajunw@nvidia.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bb5164b753..abe23d4ebe 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1593,6 +1593,11 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 
     n = g_ptr_array_index(u->notifiers, idx);
     if (!n) {
+        /*
+         * In case notification arrive out-of-order,
+         * make room for current index.
+         */
+        g_ptr_array_remove_index(u->notifiers, idx);
         n = g_new0(VhostUserHostNotifier, 1);
         n->idx = idx;
         g_ptr_array_insert(u->notifiers, idx, n);
-- 
MST


