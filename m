Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B71FB546
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 17:00:49 +0200 (CEST)
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlD4y-0004xd-C7
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 11:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCRH-0004rC-C2; Tue, 16 Jun 2020 10:19:47 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCRF-000747-PB; Tue, 16 Jun 2020 10:19:46 -0400
Received: by mail-ot1-x335.google.com with SMTP id m2so16025702otr.12;
 Tue, 16 Jun 2020 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMB5MwLjGYUQmCwqpEn0/VvW/KiFIQ/TwNzYbII5zMw=;
 b=YfwjlYVYuCCddrGwULgmqRJnMgsrSMER3nFxJ76dM3M5aVhg7JmfxqBuIhqctDH0ry
 5MCq2eRcPkN4iGJGPfi4kUSJPQqlavKhgW+QGTlQI0+bWb0wXpyn6V3JFDtu8jGPOUba
 7e6mpx4cZmWjCnIU6vPqJPNjH8lGplz7O42+p2/UvK0C+XH0W788Pp5v1P47om2c5AZW
 ZmJc+SFrJ+fFaI2ncHO4+ooC1DnsdCVm0KTTooQFKXNPfyfraK41Neq6xjWPSNkhbjXF
 sj/Mw7JubY6PLboERVTTPzGjsVYSko5ue9ciIsfLR7Tpcjo4BFggKHwFG24HgNF2P+ml
 XbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dMB5MwLjGYUQmCwqpEn0/VvW/KiFIQ/TwNzYbII5zMw=;
 b=I7qqPMvgokfU/rbjnJtb0YSRlhh/s+SGzbtJPXIW4T6Il3Cp1OQQcFOZr7b3YumF/q
 askXeTqfWZBPET2dQ1Gaz4n/ObQa3w/dVYmg49tgk0/c+8Bk7pCj1XRh+AAOmIhLP+A+
 DmywoiNPgt+5A3T7Rgx1Rqnor5vQc9f+IRCWch9whOq4MBGg8GzZXNmVQMOnexcHkBvV
 R3lY+ZrrECphmkujLgELmxKrmXqJGHax2bgQpXM0QifsRwQ50Bs5wK0UUYUkmQdIfjD8
 vpTNec6+wczA5yt769DEMuk9wb/YpEocYNY4quO+3IKy9OgrTM48LGRMQD2xGn9o+UMW
 binw==
X-Gm-Message-State: AOAM530jBWl0FLyOhzi9hXGWatn33YThPKNWo+0i34GygvIjfpCOYp9y
 G8CnQSduhuekAN6BpODmFoprUNBhIMA=
X-Google-Smtp-Source: ABdhPJzQtMYSb4xZ6tXVSUTBJmy3URMZch/tD66cioMMEQWMeocRL5dEeYhJx5MrMTEfNJ2jKYKaCQ==
X-Received: by 2002:a9d:5c04:: with SMTP id o4mr2482249otk.21.1592317184076;
 Tue, 16 Jun 2020 07:19:44 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id y125sm3033947oiy.9.2020.06.16.07.19.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:43 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 77/78] virtio-balloon: unref the iothread when unrealizing
Date: Tue, 16 Jun 2020 09:15:46 -0500
Message-Id: <20200616141547.24664-78-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, Wei Wang <wei.w.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We took a reference when realizing, so let's drop that reference when
unrealizing.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Cc: qemu-stable@nongnu.org
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20200520100439.19872-4-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 105aef9c9479786d27c1c45c9b0b1fa03dc46be3)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/virtio/virtio-balloon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 64fdd0e332..9762a65600 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -820,6 +820,7 @@ static void virtio_balloon_device_unrealize(DeviceState *dev, Error **errp)
 
     if (s->free_page_bh) {
         qemu_bh_delete(s->free_page_bh);
+        object_unref(OBJECT(s->iothread));
         virtio_balloon_free_page_stop(s);
         precopy_remove_notifier(&s->free_page_report_notify);
     }
-- 
2.17.1


