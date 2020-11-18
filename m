Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F02B7911
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:48:36 +0100 (CET)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ8l-0007H7-7r
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIya-0002A5-57
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyY-0005WF-9Z
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+PuKfLUpB50oOMefJm/RuJkzqe63XbJCDC2Z/lmLEM=;
 b=g+pLHKBGOHVncgZMRcYY+bIabGzCdeAn4peWgPUKnucJAe7ZVMHxk0MBeWVGiSUTl9Y2Mq
 bnK0dwld94fBJ10ocSEagWMPQUSyGxc63KhnjDXOEl0z3KVB6zIQ4mWXwu0qIcVRGQMMhE
 V7x8yQmRvWz2fEjKw2huslW8eLVwGlM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308--teDCaViPd2Jr6n50-qHkg-1; Wed, 18 Nov 2020 03:37:59 -0500
X-MC-Unique: -teDCaViPd2Jr6n50-qHkg-1
Received: by mail-wr1-f71.google.com with SMTP id x16so631338wrn.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+PuKfLUpB50oOMefJm/RuJkzqe63XbJCDC2Z/lmLEM=;
 b=uTsULyO4L8o8qhZXSkBEh6G6nVBfdwCevvLT+zc/TCvTCmn3rDYWGmphksxGnQ6wQM
 R95adHwRuHnvDMfwTy3ACgb7F8Tjfvrcmi8uZeEw3+rzun/JaunGgNfo7uMbEomvl7dH
 TrOlmTXSpeKU1fSb7txSbI8pGoTuixeEUs42aVVFYkEJZFJq8UxgjRWq3e5eFD0JSz5T
 kDTgdvtLzIX269P7YEBqLeA66B3jjC76di05oG+laV1eQxGWFXqQmUyK4VMSnqm0Zuw0
 BYlO0crPD4O+23we2vYx0Nngp0ZfNCEA2Bv7x4VDD0/aNdkVD5lRyd4c8W2ior9G7jqO
 gjsQ==
X-Gm-Message-State: AOAM530wkYE7WSKn3gqf3ZuGzavg8vxh6oQH+H28/JPx/Z+6hbPjvwJY
 l+VmW86i7mPwkJ4278ALUl/ZJGzrOsllE0d4wqPH4Hl+5dy+91/1S8oAUl2jwYExB2jTCfXTuz+
 Gsak+YBZ9DDNIO/m2KTiIMDWMjiq+1qS2JnPUFJFlTrxQ0JQRZXTWMMLVaF5rH4cxrR0=
X-Received: by 2002:adf:9461:: with SMTP id 88mr3511269wrq.171.1605688678317; 
 Wed, 18 Nov 2020 00:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw08vRikOjSkxOc4MmFeBBIIVgVqemc/nnR7ZvQLHStqDOMMVhi3uKglFgGAExRZybD1DM6Mg==
X-Received: by 2002:adf:9461:: with SMTP id 88mr3511239wrq.171.1605688678035; 
 Wed, 18 Nov 2020 00:37:58 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id 8sm933622wmg.28.2020.11.18.00.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:57 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/27] failover: Remove unused parameter
Date: Wed, 18 Nov 2020 09:37:26 +0100
Message-Id: <20201118083748.1328-6-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 786d313330..3f658d6246 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -855,9 +855,7 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     return dev;
 }
 
-static DeviceState *virtio_connect_failover_devices(VirtIONet *n,
-                                                    DeviceState *dev,
-                                                    Error **errp)
+static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
 {
     DeviceState *prim_dev = NULL;
     Error *err = NULL;
@@ -928,7 +926,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->primary_should_be_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_connect_failover_devices(n, n->qdev, &err);
+            n->primary_dev = virtio_connect_failover_devices(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3164,7 +3162,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->primary_should_be_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_connect_failover_devices(n, n->qdev, &err);
+        n->primary_dev = virtio_connect_failover_devices(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
2.26.2


