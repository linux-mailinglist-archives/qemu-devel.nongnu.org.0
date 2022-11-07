Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32B6202D0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:58:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxT-00027O-UP; Mon, 07 Nov 2022 17:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxR-00023i-L8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxQ-00040w-6H
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfH2mXgywnYC2kputq4S7gjRrDkltol0CBs+dWJ0/XM=;
 b=CexkEg+HrUqjYp9AZ6r0Rll+joF8Fm81a92eIO23B4ai7o/v1OlDcEkG3cC/acR+h+doKi
 BQxSbux8adsZ36dlImt0ltDOOvC+m4z5+zdfuLVcTLTeICe2yVKFdGIzDvKRHI6pLj+FDP
 qCETA2zT2I9DWQkq4JPLQmG5P/vZErM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-bA74DqmZMwmCNl8IMXiQUg-1; Mon, 07 Nov 2022 17:51:06 -0500
X-MC-Unique: bA74DqmZMwmCNl8IMXiQUg-1
Received: by mail-qv1-f72.google.com with SMTP id
 mi12-20020a056214558c00b004bb63393567so8668274qvb.21
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CfH2mXgywnYC2kputq4S7gjRrDkltol0CBs+dWJ0/XM=;
 b=Nqe5nbL/fPnkclyjKFN+//ektmrG9Bji9SCaDa2pR8hZvOCuPEFRsppBZqhsZJylbD
 xYpKSTaLRzxKhRtiiPl5JQnRYHDjUevOwAbyhoOpGTvmS6EetcaWXECucH0BJC2nTSMO
 yQ5aCnIY6yyLmH1Uk8jHdrJCa6c799i+j15hBM/E6r2HBHj5CwMOKI3WAXbegsKG78qZ
 kMQlFmJXOMUyWLoYKuf75Uub6gc5FAJJvO2bi9ZlBvgrbt7zqlbjwatE8RXhizLh5DPQ
 TKtUWyNs+mtEQ4yO7O5VVrWsRTNQOkIDOQln3z4ok38WKJ5Z615l+AGaH+/mkieGUe5P
 BoPw==
X-Gm-Message-State: ACrzQf08iXuXoa/kCSMgwZK9PedZQEvW60lACL2YwwUgl1y/46uZoCf2
 VqzcTug2TgddVHMF/6p5Ahmt0r56MdoUVnF9IkJF1qxKX9ZtZK4X0Bo2ddZC8UeN1ZxW2IXlkWj
 3ZltMj8pp5155Hmxe41GEqub6NZJAKQvN8ioV7IzkgUoGpD4R2RhCrQQICWSw
X-Received: by 2002:ac8:1208:0:b0:3a5:3ae2:dba6 with SMTP id
 x8-20020ac81208000000b003a53ae2dba6mr758981qti.484.1667861465799; 
 Mon, 07 Nov 2022 14:51:05 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5JRdNpCsHruEULmCclIblDHaMn932WCVX7uxhhaISaX4u2p64+56xas57UQqf/WWM5r/YDzQ==
X-Received: by 2002:ac8:1208:0:b0:3a5:3ae2:dba6 with SMTP id
 x8-20020ac81208000000b003a53ae2dba6mr758974qti.484.1667861465453; 
 Mon, 07 Nov 2022 14:51:05 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a084c00b006fa4cefccd6sm7676951qku.13.2022.11.07.14.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:05 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v4 43/83] vhost-user: Fix out of order vring host notification
 handling
Message-ID: <20221107224600.934080-44-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
index 03415b6c95..d256ce589b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1543,6 +1543,11 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 
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


