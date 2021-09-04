Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967A400D35
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:50:40 +0200 (CEST)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdYd-0007EK-C7
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLZ-0005vW-R8
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLY-0001PM-FW
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjJZP5VxMZRko4GDNQkgZ7w7i54b8fphWN/XvBHKOms=;
 b=f984nkc0jAE8KbmF66aG2vHGAJlKCmo+aRGP/jWc9B2R09Y6s/ris0eAPM/xaNTJHPyTa0
 ZVrSLaoPFyBToilUMN9uOQcxt50ePm2Jd45Q9yDAOBbTvmFFQImHAEpt1lWQuN+tKZCuFs
 9Nw1u0x6aRJhn8gJHRaa0UE2aL5s6MU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-z8_8pSRhM2OFNZdWY7cO1A-1; Sat, 04 Sep 2021 17:37:06 -0400
X-MC-Unique: z8_8pSRhM2OFNZdWY7cO1A-1
Received: by mail-ej1-f70.google.com with SMTP id
 x6-20020a170906710600b005c980192a39so866175ejj.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fjJZP5VxMZRko4GDNQkgZ7w7i54b8fphWN/XvBHKOms=;
 b=pqftAYOs90ACAXEvEeQtLXygERjiN/ZWnj578ff81ra9/9ck/9DLitA70WOHMBxTq1
 abErs7quknVWobTcKsSLto5/34ecfRBFkcST8LWBBmnFX15MURGEEm49stxXa4KYva3N
 /+w9jDGKQlTFqfLbwBViKfJeLzXrKR8vS7OAK2bBwC3OcJ/53v73FUSdgWaTd2B+6M95
 RNoqcGyxvzeIQxp7Xim2skKKD7Z5ATMuzjdM/xINcSpMrTwHb7kayE2pmcCQa2SpN39X
 4uqrOq0FXlso+/5oqZQzdb/H5UcnMveoxlm45i2rK65qD2p34deiLTML8sZ9RLmWwMhe
 JTDA==
X-Gm-Message-State: AOAM5317SFSciV9UyasWJfm8dwE/+gIzm6PpoJU1gFb6lFulS509zQKo
 6oKoY9vt+DHXqIk6Ejb5G2B/lsQXbQ6IkQo2ABBO2n0R/1w3JrjMRqkaZ9zHdyVsPl1onGu4USP
 lclJI2LIPuIAH8Qm1G1AtF8R9f49EOyIbJIeCI2OXVJTq3wGr5w/oE7NtLaxJ
X-Received: by 2002:a17:906:308d:: with SMTP id
 13mr5853357ejv.570.1630791425300; 
 Sat, 04 Sep 2021 14:37:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoJ6RQ9T6qMLAtwX62/UCwV1KIvqS1vbspdImDNMkeZDGTe4NH/kVD7CxI7VNy8lvPnp/Now==
X-Received: by 2002:a17:906:308d:: with SMTP id
 13mr5853344ejv.570.1630791425150; 
 Sat, 04 Sep 2021 14:37:05 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id rl23sm1534197ejb.50.2021.09.04.14.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:04 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/35] hw/virtio: Add flatview update in vhost_user_cleanup()
Message-ID: <20210904213506.486886-23-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuwei Zhang <zhangyuwei.9149@bytedance.com>

Qemu will crash on vhost backend unexpected exit and re-connect                                                                          │
in some case due to access released memory.

Signed-off-by: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Message-Id: <20210830123433.45727-1-zhangyuwei.9149@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 360d9bc040..2c8556237f 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2480,7 +2480,7 @@ void vhost_user_cleanup(VhostUserState *user)
     if (!user->chr) {
         return;
     }
-
+    memory_region_transaction_begin();
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         if (user->notifier[i].addr) {
             object_unparent(OBJECT(&user->notifier[i].mr));
@@ -2488,6 +2488,7 @@ void vhost_user_cleanup(VhostUserState *user)
             user->notifier[i].addr = NULL;
         }
     }
+    memory_region_transaction_commit();
     user->chr = NULL;
 }
 
-- 
MST


