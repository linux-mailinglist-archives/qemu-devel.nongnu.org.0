Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40002B7961
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:51:42 +0100 (CET)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJBl-0003J8-VO
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyz-0003CU-Je
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyx-0005eS-QM
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DjcrFX/SZO4uvLCdwPo4LksdrvbzrZYiF03v5Y6+HI=;
 b=Np/SjMYygLCp+UpzV64mPhWdOAf5YBXoGaspzrogpqWe9D/pU7ABSsyfAEMMBp0jy2OKUA
 OCVM1KJh0bpHOnroRHnYstF/ErCxa5n1IF0Mc/15P+NnohdfhrSOaXaro7YZYkAdpnVc/6
 bf/i1XWxWrfiWXBKbPoObnqS44MdGAc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-U502-uvYMKqa1PEdtDOPIQ-1; Wed, 18 Nov 2020 03:38:25 -0500
X-MC-Unique: U502-uvYMKqa1PEdtDOPIQ-1
Received: by mail-wr1-f69.google.com with SMTP id z13so623054wrm.19
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DjcrFX/SZO4uvLCdwPo4LksdrvbzrZYiF03v5Y6+HI=;
 b=pChE7wkoryLzNpWZAqKU7w/q+/OOQJDpvudYvuxV+CaqqBuJjOurD+EcRyuKyVn2Vy
 MauofsZ2V/P5e3AYfunXZ6NerZxclXBG5JqjuI4LMtpC+oWoGx6QshiBkYRCcWg4Unsu
 VP2BE1iqYvMdGEr0ywfpZSIcby6Msrkt/Ivm5rt4VIRee+rAwmCqED4+3XB8jW2Te5W9
 RUfr1oSq4nYC25s6vpaSJsxQ++6JrNBN5WDVNseCrfFktzRKWwkqzcOfyZNqKpuoo+BL
 6k5L/ASlHR7G4f6dcWAigD3lK+NsWC2Zw4haySxgk7OuRXcud7OPZsPMoXLkZ/ZaTJoA
 xnrg==
X-Gm-Message-State: AOAM530bzadi6fHUq/QMsvQcMxlXAinFtC6/2LtT+AEb7PZtQY4DhIv0
 5Q6uyivIzbvofE1FSoAktJTQpVTvIS0eU0E0TfnwViEgod5Pe4X+nXfhWOFIyaRvKgktiFoFY6B
 oZjKCm+p5o9eVttXvkFwyj8E97SdTKEsM/wnbV889Ls/pki1gRG/FG2VmD0dNSlOY76Q=
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr3591060wrt.160.1605688703991; 
 Wed, 18 Nov 2020 00:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoFJ94NUG8U4bR1G0spCYEErKHYzj6y+uE92z8wl5NuEigOrll6XDEr5v0chcxMtgmQJW4Lw==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr3591032wrt.160.1605688703708; 
 Wed, 18 Nov 2020 00:38:23 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id a14sm2330119wmj.40.2020.11.18.00.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/27] failover: remove failover_find_primary_device()
 error parameter
Date: Wed, 18 Nov 2020 09:37:43 +0100
Message-Id: <20201118083748.1328-23-quintela@redhat.com>
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

It can never give one error.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c708c03cf6..b994796734 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -832,7 +832,7 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
  * @n: VirtIONet device
  * @errp: returns an error if this function fails
  */
-static DeviceState *failover_find_primary_device(VirtIONet *n, Error **errp)
+static DeviceState *failover_find_primary_device(VirtIONet *n)
 {
     Error *err = NULL;
 
@@ -897,10 +897,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = failover_find_primary_device(n, &err);
-            if (err) {
-                goto out_err;
-            }
+            n->primary_dev = failover_find_primary_device(n);
             failover_add_primary(n, &err);
             if (err) {
                 goto out_err;
@@ -3121,7 +3118,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = failover_find_primary_device(n, &err);
+        n->primary_dev = failover_find_primary_device(n);
         if (!n->primary_dev) {
             return;
         }
-- 
2.26.2


