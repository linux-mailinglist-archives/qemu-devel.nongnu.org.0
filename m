Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392853F8D59
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:53:16 +0200 (CEST)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJYx-000463-7S
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9i-0005pA-30
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9g-0007OI-Hc
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629998827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6H+L02mu2VtYZ9Ci4vq9bPbkxedEevnpYIa7Jf3+z/I=;
 b=iKXJ1XPrErwt0ac40In1fs3GgTd5BZFzrs0hWJVRMBeVRc+IW5w/Ozd2nV/tBtg/XaY7OS
 JmQ9ugppX5QfqP4gCUZo11ure1O4xoJnGBA6nIiyzpZ9vsDh81NBySyEOox491pAedJbpI
 Rl23tyL9YDeYkYlQFyOfVq2K0H5lQag=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-8G1BImrqP-2R5jE6VgXbIg-1; Thu, 26 Aug 2021 13:27:06 -0400
X-MC-Unique: 8G1BImrqP-2R5jE6VgXbIg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso1069585wri.18
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6H+L02mu2VtYZ9Ci4vq9bPbkxedEevnpYIa7Jf3+z/I=;
 b=NpKYAahOO7uzfeaju+HdT0VwmwBiZMSiezQ4RZ8ghXZwNBdUTw6cMUu6X/ze/Jhfbw
 9yRrHSVr43EUmciv5tyaeYOU/rVMxJOqLiKY75xgcW/E0+ZDBpR9R7mU0pRUtTFYByf0
 4O46dsKJtmJ7Ye1+wZ1ixSHeeihAsMaOmxMZRtLGOFC8pbtRF82FQpXrhbWq1dWYgvrg
 rgvWXdwzLiH6RgQCb8NzUJcs5yZ9zBJYGewbRWEbgWr3o0q3WxWGSWOyyAwto9JJQ7Cy
 v5ntjk0wCrtavo5lwEObUp05mmUs307iN39FmjIrhSYsWBGR6gEB1Pt+MavlnHi2WYXg
 siLw==
X-Gm-Message-State: AOAM533QHSKVM0JReDeNIu64gMhNBRf86RIaqIF8Kiiy2EDA+1C8q2JZ
 8Zb+0HwXHPIKqUpY9mIGPDLpoWp6S6gdMh4PeX8xjtftOlAthGDWHwzmNhf5ZMNIfr2JClQn0wZ
 Mv+VbjhEb3c5oUGSPsTKOqkpdBSmDJTuDaZV3WvDbonYA2c7xNsDwDHyliMfZBVEY
X-Received: by 2002:a1c:2042:: with SMTP id g63mr15507757wmg.27.1629998824996; 
 Thu, 26 Aug 2021 10:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvQGEW9fnsUvH7lMnEtqbSRyVAYs06PBOgNAaQkgzx/G8LWn12Eva/kw5BO1E2Kyw/aObfaA==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr15507729wmg.27.1629998824766; 
 Thu, 26 Aug 2021 10:27:04 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o12sm3774338wro.51.2021.08.26.10.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:27:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/virtio: Document virtio_queue_packed_empty_rcu is
 called within RCU
Date: Thu, 26 Aug 2021 19:26:56 +0200
Message-Id: <20210826172658.2116840-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826172658.2116840-1-philmd@redhat.com>
References: <20210826172658.2116840-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While virtio_queue_packed_empty_rcu() uses the '_rcu' suffix,
it is not obvious it is called within rcu_read_lock(). All other
functions from this file called with the RCU locked have a comment
describing it. Document this one similarly for consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a7..a5214bca612 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -634,6 +634,7 @@ static int virtio_queue_split_empty(VirtQueue *vq)
     return empty;
 }
 
+/* Called within rcu_read_lock().  */
 static int virtio_queue_packed_empty_rcu(VirtQueue *vq)
 {
     struct VRingPackedDesc desc;
-- 
2.31.1


