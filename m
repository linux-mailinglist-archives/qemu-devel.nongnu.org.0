Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC866EDD10
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMa-0006Kq-25; Tue, 25 Apr 2023 03:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMN-0006HS-D4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDML-0006bW-R8
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqT5dEfAVqgbT8QGYta7E3XoDIDCT9JGPTtaSzwWys0=;
 b=fIX1ioePIq8ihtXBG5Rp77It51oqLUxmomRacgGyEPs2HmoqMFxVVr0HzaiHSJTY9hNTZF
 JvYnlx4B97w3miMebVyfw6l5Al8awiDR1sX1kIvnXqaj+dreQuFQcgOF57NCZ0NAb69bhA
 gbl25mNgBLi4yP3I/llRo3VRC9sLD/Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-IyFYZdAaOYWlpx11G1uK9w-1; Tue, 25 Apr 2023 03:45:07 -0400
X-MC-Unique: IyFYZdAaOYWlpx11G1uK9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb303so1927018f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408705; x=1685000705;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqT5dEfAVqgbT8QGYta7E3XoDIDCT9JGPTtaSzwWys0=;
 b=TeEsL5fK2TASBaQHtflGRObCZ62oUD6/4rY2MFp/IGu6Cg687skjpieec6rseDJR3r
 o5A5YqtGDWlIw11Rl1hj8LOzuRY1dlsNqkqJkYrtGeS/T8k498W5HdyxbS1B7esDl1Hf
 FidvIBrbx04kb7KllxXjOqSjifuvgsJEaOfa4Z9zN40fIJ7tNQ+GksejNgO2tApVAPJ5
 UADtsGvk2e2vNnO4Rb4VQsUZeYUHBkyvpnEdZ13PfbnRN2yIfMTz6M3SUmbSL7InIl8V
 OEXIzrOwo9zws0kqTtFST0Mra8pj96dURUNhdRy05TvHd6dAMzrFSSD/omPO3tct5FaC
 IzUg==
X-Gm-Message-State: AAQBX9co4wf7LodQNzvRYkv/lCWTQmuTEe2OuQRr2ZioBYVz9pzuA7/8
 QV9Tp7nIKqsTXVegnfK7J4wNCakhWRWmX5HYGsDQK79zKopKgcOfdqxBTwIGT6qGTtrjTPQeYjj
 TVCCyLQC9JijMSqVv1ZibIX/vLYH3GpM7cXjiq7Toll8FTsodBCqnV55gbAqfZkp4xxJS
X-Received: by 2002:adf:ec41:0:b0:2fb:599b:181e with SMTP id
 w1-20020adfec41000000b002fb599b181emr9475051wrn.63.1682408705336; 
 Tue, 25 Apr 2023 00:45:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrD6cBr+VMJ+rK4vmTj0BxR2+idXyagIya0lE1sewPKU+pWlQBAqtfVCb6wQnN7cskrhU6rQ==
X-Received: by 2002:adf:ec41:0:b0:2fb:599b:181e with SMTP id
 w1-20020adfec41000000b002fb599b181emr9475030wrn.63.1682408705048; 
 Tue, 25 Apr 2023 00:45:05 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm3069194wrr.43.2023.04.25.00.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:04 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 05/31] vhost: Drop unused eventfd_add|del hooks
Message-ID: <560a997535937df2ea3716ba56bcbe38be37682f.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

These hooks were introduced in:

80a1ea3748 ("memory: move ioeventfd ops to MemoryListener", 2012-02-29)

But they seem to be never used.  Drop them.

Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20230306193209.516011-1-peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index a266396576..746d130c74 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1291,18 +1291,6 @@ void vhost_virtqueue_stop(struct vhost_dev *dev,
                        0, virtio_queue_get_desc_size(vdev, idx));
 }
 
-static void vhost_eventfd_add(MemoryListener *listener,
-                              MemoryRegionSection *section,
-                              bool match_data, uint64_t data, EventNotifier *e)
-{
-}
-
-static void vhost_eventfd_del(MemoryListener *listener,
-                              MemoryRegionSection *section,
-                              bool match_data, uint64_t data, EventNotifier *e)
-{
-}
-
 static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
                                                 int n, uint32_t timeout)
 {
@@ -1457,8 +1445,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
         .log_sync = vhost_log_sync,
         .log_global_start = vhost_log_global_start,
         .log_global_stop = vhost_log_global_stop,
-        .eventfd_add = vhost_eventfd_add,
-        .eventfd_del = vhost_eventfd_del,
         .priority = 10
     };
 
-- 
MST


