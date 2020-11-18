Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46892B7960
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:51:38 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJBh-000397-PQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyY-00026x-Vd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyX-0005W5-9r
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE+D/DLmVINJcL8aFHcKzDkBgbQT8a1kgkHrYvtFwcE=;
 b=eZ9oo2csLIXcpKtxmPsdMQSNmlxOtEDXoIQ6G5gJqqo7xLyXccIhgkWCk6J634NlxpIRnk
 r5KFWKQ5N5Oypm8MOJFLXc1WWd2uFdeuK25docxjyYJcBQW8cERwvJoHU6BMduSjTX2wH1
 GCOYxf3EmLlhFVQ4Nuk5pp+d3cU7vY0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-FyKtwlCePquyR1n60IPTWw-1; Wed, 18 Nov 2020 03:37:56 -0500
X-MC-Unique: FyKtwlCePquyR1n60IPTWw-1
Received: by mail-wm1-f72.google.com with SMTP id j62so724813wma.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XE+D/DLmVINJcL8aFHcKzDkBgbQT8a1kgkHrYvtFwcE=;
 b=CVVq7WhO3m8KV+T3V3Z5nJFnDo5vSsNI7ibpo6VqWNZ/ZCzmNFjZJ2Cv+nu+OWT7XN
 Dzxdw676tuuWduN4usmtwP77K+VVdQSedmteJI60cKfubO5xqxxvrkziRRxAsBjxTXYB
 CcuuM/cEJyojcAsUJjrzgfOxlS46nZFTQ0QXX5tgG0LRGys4bbs+nSjG5JLlC/3KHVfg
 m0hyZ0efaif7MDvdByk5chav5yhvlNd9L29miMzegG6Gvia1x/Q8h+EYJ2O4Ya0jxXb7
 qQ0WjnX4GmtfH1IC+FRr4DxELmAlXqFtdeWoKt717ZBapFBBX8VCZqm43+lhmJ10Mymq
 McHA==
X-Gm-Message-State: AOAM533p8kecg1km5IhYxJ2ik4jNDLG8Vfg9wy3CS+ejGNeJerelzF9Y
 WKexZFpUei3HzLhnCxnNy5Q86BTxRwMXKj2Bl8FXq5Cdb9ZiyWWQgPhi05S0EONRfV1GAa4+8af
 YdPBgkSQUdXSTwYSqDCcWX/tZiZbmOZ3Mel54eWdrZX+17m8xSK1/9GYULaB+gjkXew4=
X-Received: by 2002:a5d:4690:: with SMTP id u16mr3745873wrq.263.1605688675264; 
 Wed, 18 Nov 2020 00:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydJFfEubJeFTFrpXrsMeGkk0euSzNHh1zJsMsRU1gRTCjNTXTDVJcESWsHOLEXbCLiUSqvIg==
X-Received: by 2002:a5d:4690:: with SMTP id u16mr3745853wrq.263.1605688675071; 
 Wed, 18 Nov 2020 00:37:55 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id t23sm2507042wmn.4.2020.11.18.00.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/27] failover: Use always atomics for
 primary_should_be_hidden
Date: Wed, 18 Nov 2020 09:37:24 +0100
Message-Id: <20201118083748.1328-4-quintela@redhat.com>
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
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1011a524bf..a0fa63e7cb 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3136,7 +3136,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return false;
     }
     qdev_set_parent_bus(n->primary_dev, n->primary_bus, &error_abort);
-    n->primary_should_be_hidden = false;
+    qatomic_set(&n->primary_should_be_hidden, false);
     if (!qemu_opt_set_bool(n->primary_device_opts,
                            "partially_hotplugged", true, errp)) {
         return false;
-- 
2.26.2


