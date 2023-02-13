Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D982F693C99
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROws-0002B5-5D; Sun, 12 Feb 2023 21:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwq-0002Ah-A5
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwo-0006tV-Nw
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHOT9wZeB+0b4Ejcrcd0vvTrtjiS44Q0GkTx2lSsIMo=;
 b=QTc/BcXmCALjXE2qXkENGxicdKZNmJZHrRoNbWfKxdom02h8uAuL8e4x0HLDc9abGau7mV
 7uAHEj8nwg1eBpFVNjQUgEHxU4dqnpLlY0Vp6jASGuIwvIoRN0GcZpn58IV2i1axEuLCQ3
 cSGvnyyvO99MUonF7pg9+zZEk2AGxLo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-oIu7OI1CPQeUBG2l6suU4w-1; Sun, 12 Feb 2023 21:52:04 -0500
X-MC-Unique: oIu7OI1CPQeUBG2l6suU4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so5441707wmq.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHOT9wZeB+0b4Ejcrcd0vvTrtjiS44Q0GkTx2lSsIMo=;
 b=LENaNBqhcFfd+l1znvjvRzmNTwA20lkbO8H2HZyOU5M6MCfXHGfQejnneXvIf/7Cu1
 M/ElMBmNDmoujOSYx/+aSNS/huASJWQDdBAcDxt3H8vmOrWMt0Vy4Oi0mdK0T0Y8lGA6
 06NEcBIN8hvLJgx2T7kyqmvOPNiK4FpqU7XuVPzQUHpslNFFLTjK1digF89l9fm+LU20
 jpwdtk6oVBTn19pk/zTRz0pwxIv0UI5WgTNCnYH83bM8eBiaCTKUj+Qqr2SGcPA0AzB4
 EDsDcdVeu2F50mZuT0g6t0HGYVt98hBT137wfBpid3j1VrvZq3xcCZdoS4VKoJw5d+Uf
 85Ng==
X-Gm-Message-State: AO0yUKU5o+/Wip2+vD1Dgam4sqMLubEVpkxXIzO3CIwBCjXGskROGiAr
 C4UPn8iy1JhGx/yu6Rrdlc6Fn5oDO2Av52FG/SV80EsG9M3wxCl1YCggivbsSoxKwbEGf/TlMw1
 gGuhwKNdH+ZNy85SM0NsdqGlGz/Bz7xPNgXLgU77OHVSDn1si9frc1BrTE9R8XSSjn0j5D/Dx
X-Received: by 2002:a5d:4e10:0:b0:2bf:e5cc:91c1 with SMTP id
 p16-20020a5d4e10000000b002bfe5cc91c1mr18791514wrt.52.1676256722993; 
 Sun, 12 Feb 2023 18:52:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZUvoGO8d5b9/7tMfXpFX/Wth0Q2LoQ0rqE3qpN9qVxe3b+muIwr58Yxf6rIMemoBgrsYs6Q==
X-Received: by 2002:a5d:4e10:0:b0:2bf:e5cc:91c1 with SMTP id
 p16-20020a5d4e10000000b002bfe5cc91c1mr18791498wrt.52.1676256722720; 
 Sun, 12 Feb 2023 18:52:02 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b002be505ab59asm9439807wrp.97.2023.02.12.18.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 06/22] migration: Simplify ram_find_and_save_block()
Date: Mon, 13 Feb 2023 03:51:34 +0100
Message-Id: <20230213025150.71537-7-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will need later that find_dirty_block() return errors, so
simplify the loop.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b966e148c2..dd809fec1f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2542,7 +2542,6 @@ static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     int pages = 0;
-    bool again, found;
 
     /* No dirty page as there is zero RAM */
     if (!ram_bytes_total()) {
@@ -2564,18 +2563,17 @@ static int ram_find_and_save_block(RAMState *rs)
     pss_init(pss, rs->last_seen_block, rs->last_page);
 
     do {
-        again = true;
-        found = get_queued_page(rs, pss);
-
-        if (!found) {
+        if (!get_queued_page(rs, pss)) {
             /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, pss, &again);
+            bool again = true;
+            if (!find_dirty_block(rs, pss, &again)) {
+                if (!again) {
+                    break;
+                }
+            }
         }
-
-        if (found) {
-            pages = ram_save_host_page(rs, pss);
-        }
-    } while (!pages && again);
+        pages = ram_save_host_page(rs, pss);
+    } while (!pages);
 
     rs->last_seen_block = pss->block;
     rs->last_page = pss->page;
-- 
2.39.1


