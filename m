Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47437BE052
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 16:35:43 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD8OL-00032j-4T
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 10:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iD8JI-0000pB-Dk
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iD8JH-00079j-Ca
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:30:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64205)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iD8JH-00079E-7D
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:30:27 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 642E63CA16
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 14:30:26 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id s14so6096517qtn.4
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 07:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uAGWvwzL46HoQu7U/Lqqmx3jnRSuW2YUf+t36wOCjwQ=;
 b=tq2qUgLxaxFY7c1IGaqiUFfCa/iPmCsVLVR0RCleayEV++GmOG0sRngnYKlE7q1WWj
 oBe9picgKX8S1AjJ7aVrXviilBROCqHQUJkCMB8ZTKsP3hTaktESl86s7U3Y8Oo67lpx
 hvMYyPLQajpY/xhaxHdLCERtUgXKZ2xB4al76YT8GdckV28VohlahfxcC0EPbvWXMt10
 y5YHBXS0oiUUwhAtfzg23lFEQ45QBancJCHTOEUlQOJZ3ZgFD3+QnWyt+2MKV09dux1K
 /Xw00JdDTfqc77O7rPiOQVzPQDp0xhqaAaPgHGKM/VzRtO3utMSieCT5ce06i3aokBgd
 s2uQ==
X-Gm-Message-State: APjAAAWO4CL6F+QtYMkHGSHOAwcz2lAUAEPZHU2i2ytoG9B/5BFA1nUc
 4eSHWqjekZI0iwT8E5wrBFYpWGFvDhscp78OIozQghXzuTI5QYoSRjJDsj99cMnXAe8zKzj1865
 NY9WgXzmEFV8VIIk=
X-Received: by 2002:ae9:eb93:: with SMTP id b141mr3937255qkg.36.1569421825129; 
 Wed, 25 Sep 2019 07:30:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4U9gYng4oRZOTCoyWYgFdpd1/h0Zv3jm2GT3fYZ4puUPe5fRfi+jPDnWP7ZsXZJ4qsyA1wA==
X-Received: by 2002:ae9:eb93:: with SMTP id b141mr3937230qkg.36.1569421824907; 
 Wed, 25 Sep 2019 07:30:24 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id c185sm3082503qkg.74.2019.09.25.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 07:30:24 -0700 (PDT)
Date: Wed, 25 Sep 2019 10:30:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] vhost: Fix memory region section comparison
Message-ID: <20190814175535.2023-4-dgilbert@redhat.com>
References: <20190925142910.26529-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925142910.26529-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Using memcmp to compare structures wasn't safe,
as I found out on ARM when I was getting falce miscompares.

Use the helper function for comparing the MRSs.

Fixes: ade6d081fc33948e56e6 ("vhost: Regenerate region list from changed sections list")
Cc: qemu-stable@nongnu.org
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20190814175535.2023-4-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 34accdf615..2386b511f3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -451,8 +451,13 @@ static void vhost_commit(MemoryListener *listener)
         changed = true;
     } else {
         /* Same size, lets check the contents */
-        changed = n_old_sections && memcmp(dev->mem_sections, old_sections,
-                         n_old_sections * sizeof(old_sections[0])) != 0;
+        for (int i = 0; i < n_old_sections; i++) {
+            if (!MemoryRegionSection_eq(&old_sections[i],
+                                        &dev->mem_sections[i])) {
+                changed = true;
+                break;
+            }
+        }
     }
 
     trace_vhost_commit(dev->started, changed);
-- 
MST


