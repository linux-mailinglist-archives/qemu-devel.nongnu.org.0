Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DC2D32F2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:03:44 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjD5-0008Ru-52
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilH-0005Jp-Ll
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmil6-0004wu-1R
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DyhXDtuex14GnTmqS7jV7i/02scrPG/xS6z1km7MojI=;
 b=Uz1G6zTwohkND2H0rpqjJcllgoArAa5JGzcC+Xth4s1eyfgOblkmnJD+XFJqD0MLL45joI
 gmghYFX3lafwBZGAk+opW/LHLc0aSSIMbG0LsK40w3sQCu1R/kTI5d7BTczt0EgTanCOrl
 4Lzb2aJsn/oi5tOulhM9GYSdsTB5+X4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-3gFCyTplPNGlEoqzARDFAw-1; Tue, 08 Dec 2020 14:34:42 -0500
X-MC-Unique: 3gFCyTplPNGlEoqzARDFAw-1
Received: by mail-wr1-f71.google.com with SMTP id b5so6568427wrp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DyhXDtuex14GnTmqS7jV7i/02scrPG/xS6z1km7MojI=;
 b=OwSocld2pdlxLFdabGhm+cewLR00isJf4gkrFoAWEvpOP8SWzDjG+A7hr7VbycuaLY
 +Q6fSAAypxU5/Cag8K4jpkv79uQaSWuLPlVenQmc4Co3KUsBiJhYsjJ7TrdgJmj00fkq
 PqrD8A2kJIHx3EFh8IzOgHQn1UU65CV7fLO3kvs35kgIOq3PDXljBXlVI1nf8roa6DoE
 BI5yOxJvndizyd9wH02EFgzJsOlu2gsg2666OMm/NYrwCU/17U+owXBMJdDehfL5REVT
 FyMJi4XT7qm+loV4j/8l4dXfi8H/8ODQKBYKubJeNVCQz60B7I/17j/xMzZT/4OBXJov
 KqEQ==
X-Gm-Message-State: AOAM531EumrNCiT09/3iv0TkWhzbSlZVw/4S2T5B7tKVK513VU1dc5EI
 P1o3BSzMGPfZKryA7Uqy6ygLJmDzhunJqs4lAT1bTKR8dLlMdw2E0PT0BfGg/bmqA6SWcDoVx1i
 WpnPcYD8l07jVigOuBEZI9twtJ2R2BXEYxNr1XoT91Nr34BvOFzWVxWyOjk1I
X-Received: by 2002:adf:e704:: with SMTP id c4mr17925237wrm.355.1607456081598; 
 Tue, 08 Dec 2020 11:34:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiMfAkJTzySaHTRvmnZ1MlauY46rvYH0lJGB5s9zW20u6do5euZ2J1kJ3Qc2lcsphVG3BjNg==
X-Received: by 2002:adf:e704:: with SMTP id c4mr17925218wrm.355.1607456081394; 
 Tue, 08 Dec 2020 11:34:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id o13sm4924595wmc.44.2020.12.08.11.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:40 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/66] failover: Remove unused parameter
Message-ID: <20201208193307.646726-21-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-6-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


