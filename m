Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36072422F3A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:29:58 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoGL-0003Lz-6u
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvu-0002Qq-1U
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvs-0007a9-8X
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5Ob6Qrwd+OTuC9y1hEz99v/MrcHnJwVa3TGabDbl64=;
 b=Yd6tZi/wEPpUOtFF8Ajc/GqmXlWnhG5g1O7TJMkbRo5JrHKYqrvEBlFfwwv4dPbwX0neh1
 AfL9Lcxxjb3vs6buPs76X1+JRUTMq8RWn4agZQM6EucZdH1uS7UxPvbpi6hewJcj6+quWV
 Sb8VVrE/sNcLeeYmMD6tx7ZhDfrY5T0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-YFxdVa1RM122XAmanfdrrA-1; Tue, 05 Oct 2021 12:04:42 -0400
X-MC-Unique: YFxdVa1RM122XAmanfdrrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f11-20020a7bcd0b000000b0030d72d5d0bcso1461320wmj.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L5Ob6Qrwd+OTuC9y1hEz99v/MrcHnJwVa3TGabDbl64=;
 b=Eu0L+Cd74Ja+MtPxBC/z/Gi+pCiayGAluVt9oJr/fWj7Q6RFJ733Db34/SA6lEsSSy
 tWao7Y89673q+X69uoXTvWme+rsCM1UZaliCIP8LM378lFB4klzn6A2t/419eGN3T773
 nDk1S4blABEsw7IXVsc0TbFBB0Y0C8Wm2BnU1rI2BwDd92caUjofjrza0yUNuqNKWF+F
 mCFOZZmXe6UElcDjajlDTuDhjwnxOKsFHsymMSHVWdFVc/BUbQp2HmPpE9M9hWSVkiMF
 hwtWwK3E6leEO9UlHQxrTjGpruaiuOXUAe7yJm9oT5PAQvHFcJUpdS2vtz6aXflMFbvN
 ShXw==
X-Gm-Message-State: AOAM53132FLRnHcly4BnpOf4ztWQFe2CGUQJXOn/DYgpNxhR849ZQiM9
 JFCGo/WhHJJZJlNz2wMkAGS4gYeQE0edo1g9/An/YpLX1kUGKZcZ+Zs0HoXWx3a9WYps7m/9496
 RXwwdk0MMQ8n77mUhk3SjEI6X+qRgeYJWh1qlOM4kgxKpX4e3RGPoIDR/+TyM
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr4324195wmp.165.1633449879852; 
 Tue, 05 Oct 2021 09:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmhgQ9kCeqUCiazAL07wrkzA67YiGl2yW/gx474MkTcjTfQVbR1qjUFtL5HRiNP+Nl8gplzA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr4324148wmp.165.1633449879484; 
 Tue, 05 Oct 2021 09:04:39 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id w5sm17777657wra.87.2021.10.05.09.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:38 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 53/57] virtio-balloon: Fix page-poison subsection name
Message-ID: <20211005155946.513818-54-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The subsection name for page-poison was typo'd as:

  vitio-balloon-device/page-poison

Note the missing 'r' in virtio.

When we have a machine type that enables page poison, and the guest
enables it (which needs a new kernel), things fail rather unpredictably.

The fallout from this is that most of the other subsections fail to
load, including things like the feature bits in the device, one
possible fallout is that the physical addresses of the queues
then get aligned differently and we fail with an error about
last_avail_idx being wrong.
It's not obvious to me why this doesn't produce a more obvious failure,
but virtio's vmstate loading is a bit open-coded.

Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210914131716.102851-1-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 5a69dce35d..c6962fcbfe 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
 };
 
 static const VMStateDescription vmstate_virtio_balloon_page_poison = {
-    .name = "vitio-balloon-device/page-poison",
+    .name = "virtio-balloon-device/page-poison",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = virtio_balloon_page_poison_support,
-- 
MST


