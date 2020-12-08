Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945A2D331B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:21:40 +0100 (CET)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjUP-0002qQ-JG
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminS-0007kF-Ss
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminR-0005rW-B6
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOnIWc8QuS0vqpM39al5k9XO8qlC2v1q1F92knb7erU=;
 b=NYs0JCushRi2Yfk1Er0MzaTSmM7Any6NikslAiSez83tZysL35G2jPGwZOMoyN/iKC0lI/
 eBMxXeKcy4gyWSezyAxy8LAgukE5Mnc8SxpT0GrYu8qvnhLB/6S0BfMGLiqQ8xr3HwCIVD
 hXRx0aIwUhYM74ESBD7RIlZQBnwYwSA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-06UTAj8HOWKWFzwCWP9okg-1; Tue, 08 Dec 2020 14:37:10 -0500
X-MC-Unique: 06UTAj8HOWKWFzwCWP9okg-1
Received: by mail-wm1-f69.google.com with SMTP id z12so1269708wmf.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bOnIWc8QuS0vqpM39al5k9XO8qlC2v1q1F92knb7erU=;
 b=efrm+gIs8+0cS6pWpbTGpvz2m+2shKcxG+dWp3RQgHcaNUUdi6j6fn1csd0Bjgihd2
 L18wshhO5q6ilNzegP2aYlvcfJWnL6Ca6fHAX+bhl96IZg9bo399rr07FDhMc4vuj+d1
 0mNrgLsgLyZaupK67QZToXv4w/bPBoCeNLdGOchlVYjHrJw4pNO9RgJw/UIgepkqyfUR
 /LQLc3aS3XYzUm8dxG5Eugz25JOoTkPg2Hkb2fHgHlMMBf3950pJEHcYpGC9BEjd0mtF
 Q+gShC3VHhIk2U64d/Vxx3PLxt6xSxnWZISBlPUqyRravWNaL5wrp90eCli1OaJtKts6
 GLHQ==
X-Gm-Message-State: AOAM533a1SEN//5+KhKXBYCQi5RfK8XmleWExBKjXocyxJuPzDGADGDg
 /dI+NMDWLd/PcRzwcWgHr+mAByqEMjyiLBm2AQRT/US3NNDr7fYoNavAyXo0+EcLjSnPvf8+1ml
 +5vI4EdkYqdk8glhCe5YES72qJwZaGyPIzAgMQjPvcp9UhJ/QawUthFFIDHJh
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr3197444wru.96.1607456228806;
 Tue, 08 Dec 2020 11:37:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3na8QVS0+mSjcGAcixVymgdAvNRDXFN9xMPtijFv05zE9fT5NUZHx6HmjW4xBFL6tjRSwsQ==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr3197414wru.96.1607456228536;
 Tue, 08 Dec 2020 11:37:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w13sm11820806wrt.52.2020.12.08.11.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:07 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 55/66] block/export: avoid g_return_val_if() input validation
Message-ID: <20201208193307.646726-56-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-5-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 block/export/vhost-user-blk-server.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index a3d95ca012..ab2c4d44c4 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -267,7 +267,9 @@ vu_blk_get_config(VuDev *vu_dev, uint8_t *config, uint32_t len)
     VuServer *server = container_of(vu_dev, VuServer, vu_dev);
     VuBlkExport *vexp = container_of(server, VuBlkExport, vu_server);
 
-    g_return_val_if_fail(len <= sizeof(struct virtio_blk_config), -1);
+    if (len > sizeof(struct virtio_blk_config)) {
+        return -1;
+    }
 
     memcpy(config, &vexp->blkcfg, len);
     return 0;
-- 
MST


