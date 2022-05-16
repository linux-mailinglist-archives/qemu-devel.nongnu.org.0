Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667D52935B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:08:13 +0200 (CEST)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqist-0004Jh-UN
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl3-00047l-94
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl1-0007D5-Mk
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHGGaFTQEvvsEKv7hmkjH6Y6C6gtUrxY2Yx4FiVtqx4=;
 b=N6/3hT1Le980h+Ak5z0WJdmOGVCqyfKlz194ScaJYvtriaPMeE608Kd4NpeTbp3LJvFOHy
 VEQGeFfOZSKkK2pZ9N8Xwk/D61xz4EWX4rB66iKElNp7qKKzjlNoz7uVFMt2u9hWnxwZZ9
 /Jo0Dha6yWGBbdLBxNd2L+nzvN1dGKk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-DY8CTYmDNsOizj-gyTD8Xg-1; Mon, 16 May 2022 16:55:52 -0400
X-MC-Unique: DY8CTYmDNsOizj-gyTD8Xg-1
Received: by mail-ej1-f72.google.com with SMTP id
 jx8-20020a170906ca4800b006f88b28f2f6so6351602ejb.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UHGGaFTQEvvsEKv7hmkjH6Y6C6gtUrxY2Yx4FiVtqx4=;
 b=r89j6WOUpLeMbLof00dCV5aP1/JCRTti/MDoysRtIdIADmkg5srQdyHLEHaYolk018
 TJ2y5cvpUIYwxTIU3nSDAGtccelSaex97TlFiF/7gOtn3jIRaR9WFXN70edeGGuM9TAX
 WY4I0pqQ1XCgnmfdmwetJ7AB3iRyvhEGN5LYCbcZFbiALxEeBXhwlEY/O66ll6kJ0Tzw
 PSBgADrB74EKVFWQwbhyt5X40smTgmtJHVzi+OgkzKK56EXu4qzsV8MYHp5CoNN+dAlg
 BASnXxQFR5c8T2yDYFSDsArD01KFHVaHWkksTD1BFHHLBZQ0bEDzTc0J0SphSaFMgVtD
 s95w==
X-Gm-Message-State: AOAM532GY0Qu2RnamKfqXULZFpUTWwAeX2+zNqT4ZM7m5mqMHzl227vi
 yC/yVVKMliEPmZRPsNX499OuTg6n573Ox+blg46zYThO6jvYR9C62L2CPZUWKIhr6Qve72nwveT
 CneZLyYhLfx76BSXzwMsnJZrEgGuszzsiVD5RdvlqfMe+gIqA5pdRZRdbdSbK
X-Received: by 2002:a17:907:7ea7:b0:6f4:7a72:da92 with SMTP id
 qb39-20020a1709077ea700b006f47a72da92mr16569399ejc.348.1652734551158; 
 Mon, 16 May 2022 13:55:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmqzpL4S4YKjjvBKH2xte7SAYjpabQn5qBWcOU9RiA7tgI7LREmES2/l7q9/wkL2pcG3NRbQ==
X-Received: by 2002:a17:907:7ea7:b0:6f4:7a72:da92 with SMTP id
 qb39-20020a1709077ea700b006f47a72da92mr16569387ejc.348.1652734550953; 
 Mon, 16 May 2022 13:55:50 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c94b000000b00428a42815aasm5768998edt.0.2022.05.16.13.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:50 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 82/86] vhost-net: fix improper cleanup in vhost_net_start
Message-ID: <20220516204913.542894-83-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Si-Wei Liu <si-wei.liu@oracle.com>

vhost_net_start() missed a corresponding stop_one() upon error from
vhost_set_vring_enable(). While at it, make the error handling for
err_start more robust. No real issue was found due to this though.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-5-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index df0f050548..ccac5b7a64 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -381,6 +381,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
+                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
@@ -390,7 +391,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
 err_start:
     while (--i >= 0) {
-        peer = qemu_get_peer(ncs , i);
+        peer = qemu_get_peer(ncs, i < data_queue_pairs ?
+                                  i : n->max_queue_pairs);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
     e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
-- 
MST


