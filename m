Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F137A562
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:00:07 +0200 (CEST)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ7S-000402-P6
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPqJ-0006KN-Oq
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPqF-0002KS-0x
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVG2n9XotM2KhddIex7o7vuIKhUEP78KP392Bahm1XY=;
 b=fPO8ehbYI3s7evotaTUEcLj9wqA/kH/gS84nEka7f6dgKPVyDg/RS56UYklR5FyORFS6cl
 SAX0fOeqqzIPi9W90lByTgxbrffnrQBga8ik83E6uGlpvVXnta8pg10GWbEJmNEiuvYNbQ
 c2Ct3ZrxqOgdlCS56U2urazoWrsG6xo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-nKcxaUAaNRSDtRoQ2S-MkA-1; Tue, 11 May 2021 06:42:14 -0400
X-MC-Unique: nKcxaUAaNRSDtRoQ2S-MkA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso8564084wrg.23
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVG2n9XotM2KhddIex7o7vuIKhUEP78KP392Bahm1XY=;
 b=hYf55i2mZjZict/yqRKA4I6IyutvtRDR0HKafdXPDCy6I7XFqwcNRhC2ISK9VPB6kO
 8XayS1Y8PcUwprOT44Ecz8RHePeq3/22tKd01cNiBAuaU9ZAnPqySmxScxkhKZrUJbgT
 4L95w1kq1/lT+pg5b2urP2N0Pagl1DGW7c+hV1a4ugSvf6Zt1YDknWeH4demdNndVPoh
 hcfsRKcfiB61IMV7SLRg7G34RAtXPQvKWOVJsdVWRzoc0lo+pq5Pg8IpUI5XV2SMwiq1
 XjYsEeIz2PnkWKNZVQxmXBLXag2JeomNH875brCTnwkGTeiJEieIZIG2CzgdVZ3nIor8
 Z6sw==
X-Gm-Message-State: AOAM53029wR7CI9h3Tvpe1puNQYslzHZc4bzMDTGzys3MnePYnIoh2z4
 oKYMhBDc+TxYxbTNPS3e4C3D3/IBl7bpAEVTkzesVnIvD6v5ARYouHhs+dR8Wa3iukgGNO/8GBe
 j88QYiz9YrnMuKz/Mv9RoPBoh5Cz7lC2hRmGqcccNjUgz5LV7xi+ozrcXENJveKqQ
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr37706222wrt.164.1620729732763; 
 Tue, 11 May 2021 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqXkOs+visRNo76+/+kYzrI/MSr5X+AGkyAdK8wmYBSilwONUYlx/BMa7vx3Q39/CT9fGfPg==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr37706196wrt.164.1620729732569; 
 Tue, 11 May 2021 03:42:12 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v15sm3101362wmj.39.2021.05.11.03.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:42:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtio-net: Constify VirtIOFeature feature_sizes[]
Date: Tue, 11 May 2021 12:41:57 +0200
Message-Id: <20210511104157.2880306-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
References: <20210511104157.2880306-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff45118..6b7e8dd04ef 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -89,7 +89,7 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
     {.flags = 1ULL << VIRTIO_NET_F_STATUS,
-- 
2.26.3


