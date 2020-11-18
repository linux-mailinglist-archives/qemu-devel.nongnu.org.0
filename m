Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238AC2B798A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:54:32 +0100 (CET)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJEV-0007ps-4a
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyl-0002dQ-SJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyj-0005Yl-Rs
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpPV6GUv7MN9+cQxrkR8TqpocJUitSTRT5ASK8zHguw=;
 b=N4ROP/LABr/b972FDC95WKU72glk4X7ipelp7AIaaB2+i0V0FSnIQLHRGR2FTzyi//Lc7e
 OHeHRpY4E+r6YWa//k70az21NYCPdMO05RMpAl23OJ6c5BUAKyQCgYETQbzu+2tPAdQJAL
 y/QmZUNR8RRdYtig5FGtAwtoDs82DMc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-vnhOhaNMP8aoX7go_0Gxng-1; Wed, 18 Nov 2020 03:38:11 -0500
X-MC-Unique: vnhOhaNMP8aoX7go_0Gxng-1
Received: by mail-wr1-f71.google.com with SMTP id c8so625389wrh.16
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OpPV6GUv7MN9+cQxrkR8TqpocJUitSTRT5ASK8zHguw=;
 b=bnX1ZyvNHXDBlXRHI7Lxr7J9szIx10ZbDjp/9J4V58ggrKiFbTiLgbc5MBqfnHql8Y
 65S8v0dL0xONa0mKfgFjTHDoQe0pqcjuzUQt5MW9CaSLwG0ieYZe7ftpSjFTL6DGXXU3
 nBhkDZoGZjFjmd7paouC4h55UlsoCCsnz5UWHW7+ciBFi7OW7hoYeZKgH/vb8SLL4K02
 EUNw8xIn+BgTndEntzlB/lnmn4o3mNgrTG70TEYiFmuf7LP3gE+daND/6u2RKCjz+Koj
 KydsEUsxcnmGCJ1XI4txw8O14uu96kRRrE2or38sZibX6fsINPrxpdXQ3j04sjxhMIMK
 F5ww==
X-Gm-Message-State: AOAM5322s5YKdg/fa6LVAkTMxQ4JnB1czhPr+aaxajJv0IolqSWyVQyH
 DWuIxJzJhzDgRl7zKiyAxdbYpCaJKVR7EQ7jNSchBlIvMkZdB+TuQqop6/nb2YLrOasmjwmnwkA
 LcQtaFObYsa8CTPuLJLf7pCUAph/7JXirzQWRH7c88KiBboa4/YcJntYf++grb7lHYIo=
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr2996730wmk.125.1605688690375; 
 Wed, 18 Nov 2020 00:38:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaQOMM7u5WldRdiktXiyw16zMlbf76OP2irMIqu/ainWZyL22RIgbb5Lu6rEmpqucUNtAuSQ==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr2996706wmk.125.1605688690208; 
 Wed, 18 Nov 2020 00:38:10 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id j127sm2543460wma.31.2020.11.18.00.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:09 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/27] failover: Remove memory leak
Date: Wed, 18 Nov 2020 09:37:34 +0100
Message-Id: <20201118083748.1328-14-quintela@redhat.com>
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

Two things, at this point:

* n->primary_device_id has to be set, otherwise
  virtio_net_find_primary don't work.  So we have a leak here.

* it has to be exactly the same that prim_dev->id because what
  qdev_find_recursive() does is just compare this two values.

So remove the unneeded assignment and leaky bits.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6e5a56a230..70fa372c08 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -854,9 +854,7 @@ static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
     Error *err = NULL;
 
     prim_dev = virtio_net_find_primary(n, &err);
-    if (prim_dev) {
-        n->primary_device_id = g_strdup(prim_dev->id);
-    } else {
+    if (!prim_dev) {
         error_propagate(errp, err);
     }
 
-- 
2.26.2


