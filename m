Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39A2B7987
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:53:34 +0100 (CET)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJDZ-0005mr-6J
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyg-0002PT-C9
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyd-0005Wz-D7
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYZSLRqC9j22vej73kBvhYsMjfvpg2Ebg2eTVplCMaA=;
 b=Lqy7I+re+ALTwlgOAVW2UU2/l1nVtIXQHi8Uij2Wznls5nPaGIabCEEf9RjUpBPWjNo12Y
 uXsBBj+hoG45EC9DoU2XxfSbVUnITNMyy8rQ4+mb8q7Ct8KXNSM7gj3a/1ojQ1vRqwRay0
 H8fCPHUrWDZaQhw15NEsvwqmg09DBbw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-QMSZ24hFMUG-xleIB9pslQ-1; Wed, 18 Nov 2020 03:38:05 -0500
X-MC-Unique: QMSZ24hFMUG-xleIB9pslQ-1
Received: by mail-wr1-f70.google.com with SMTP id y2so638668wrl.3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYZSLRqC9j22vej73kBvhYsMjfvpg2Ebg2eTVplCMaA=;
 b=X2RBI7zy7wM7m7JXqVcgz72ba9ltutnG8vV2gkvRAYiRa54I94ObUaoIr5qIQ87lWk
 uo/oK86HF7XDn4Ru3m4eT/WocuJDbql+DHSwIy7TDrs3RwbXcr8fyRw/JKgXE3jIP7+f
 ddWkW5Wt8OEd9TMI1C+YRxVv9A/wHbK2oNGJnz56KhN1986kBevfIBBDrVcLrBD534EP
 xinmui7HNpFQ+HkZxus2OzGnLg0pi864qA5VACR+2issQT2VdrX4utBp5VzKSvBnQWN0
 LI9HYVtmM+m7EcRRCr661BsBYhgJ5tKZJhORKxDqFOIbgAIPbM1ia84ViHsLNQVoZkMN
 OTOw==
X-Gm-Message-State: AOAM53332m0UPkIIoT2grs7RcLp5RGLNXe3t6J5WagOmmVY2h2dCjeD5
 0t8f2PC/uYjscZBFDdm2nsGqraS+1d7EzldXsbXe7Hu88wSJnGXB9Yq50AjqYJcDKyWP+IKaEKI
 afYr9l2bWTBYRkUhFa+77D8evtRBrOe0DTpB0u7E/NLgTCYGDayv4rYENrj/XUFB/Hz8=
X-Received: by 2002:a1c:230e:: with SMTP id j14mr3078585wmj.187.1605688681279; 
 Wed, 18 Nov 2020 00:38:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqcNcrHunvk746Z/7+wiD0eqwDrrG8AH3R4NC/f6ZeJVV2cZ2wb0YXFSy+inZDwc5aCDIGMQ==
X-Received: by 2002:a1c:230e:: with SMTP id j14mr3078559wmj.187.1605688681065; 
 Wed, 18 Nov 2020 00:38:01 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id d128sm2609088wmc.7.2020.11.18.00.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/27] failover: qdev_device_add() returns err or dev set
Date: Wed, 18 Nov 2020 09:37:28 +0100
Message-Id: <20201118083748.1328-8-quintela@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Never both.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6ca85627d8..3e82108d42 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -803,13 +803,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         if (err) {
             qemu_opts_del(n->primary_device_opts);
         }
-        if (n->primary_dev) {
-            if (err) {
-                qdev_unplug(n->primary_dev, &err);
-                qdev_set_id(n->primary_dev, "");
-
-            }
-        }
     } else {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
-- 
2.26.2


