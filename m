Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F111401A19
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:45:41 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNC8C-0006E4-E4
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC6A-0004fz-DO
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC68-0005ju-Or
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630925011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydqzmpwIS7w421UnF6h3bFe+Afko4IEnGxAHt+H+82o=;
 b=b4J2YUHOQqYRG+psoc24G3Poaf5im/8BqqHkepiiRrNxuVmGYzhHrgDZ6Uzye3QU0R3MUr
 C0+vgdJayLVNefsFHoRE1ZQEUQu7sPekLdO+KNTmSHgdFNlmlMwnaiag6DuS8wyYuGVV4f
 VHyqq9QTrdEaPUOhnEFFzhl41QzbBEg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-WwpQsdEANmGodZfCQQu5ZA-1; Mon, 06 Sep 2021 06:43:30 -0400
X-MC-Unique: WwpQsdEANmGodZfCQQu5ZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so2183928wma.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydqzmpwIS7w421UnF6h3bFe+Afko4IEnGxAHt+H+82o=;
 b=PAAMagyUVXhJzTQjZEh9rAOjagPTDtqpYN8fVfbkIN8i3u/mFNn6Ld1yTQOJvImweC
 FNSbiFxoneeTmZ+25T2PdqaTdJJTshvOayZ/vmHkl7hOW9zm3vFFKKGQJkxbUu8p0njZ
 d3I0KzGE+Wdiu91Sg/GxLTiYezs4lLhvj1d9gMVp5R3XbUTsXpXFhT91Juqeiin92Jnf
 dl9kPhWL2AwCju3rVoKBEWoyHQoOgbqR2/GJAToKAL9DqgTUOxC55V0rbKGXsfncpDcL
 OW3QeizZq1IfPB5Jr8xCWO56ZKgQsy+cer/V1yuqkRLMlBIRx+TuJA2mOnfEXyDaAtow
 wrDQ==
X-Gm-Message-State: AOAM532JmfOxMqI3+UzVYRrLZaWZwDWl4sJxI7ZE8LhxsSnCDc1V5RIp
 P+Ocsd0XSeSSrryqKvaVmSr/NcsGBb/QtG2qGYK2sZf2X7h2i2qzPo6Yph6sEDFwcJaTQLQe3nW
 g1cFbRaKrSq2OGDWdboDeaf/4HGXrPYZdvJs6FuzeLEHWDrsg7+nIWP7HjQzYk60B
X-Received: by 2002:adf:ce85:: with SMTP id r5mr12649801wrn.323.1630925009293; 
 Mon, 06 Sep 2021 03:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHy4hCuzzCoHmbyOxXuF8aQv4fJfICXV4BR/P+IflP/4frkx1GgFT9uF0tP+AARXyUtB+1Jg==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr12649777wrn.323.1630925009082; 
 Mon, 06 Sep 2021 03:43:29 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c15sm6889020wmr.8.2021.09.06.03.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 03:43:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/virtio: Acquire RCU read lock in
 virtqueue_packed_drop_all()
Date: Mon,  6 Sep 2021 12:43:17 +0200
Message-Id: <20210906104318.1569967-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906104318.1569967-1-philmd@redhat.com>
References: <20210906104318.1569967-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vring_get_region_caches() must be called with the RCU read lock
acquired. virtqueue_packed_drop_all() does not, and uses the
'caches' pointer. Fix that by using the RCU_READ_LOCK_GUARD()
macro.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 97f60017466..7d3bf9091ee 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1704,6 +1704,8 @@ static unsigned int virtqueue_packed_drop_all(VirtQueue *vq)
     VirtIODevice *vdev = vq->vdev;
     VRingPackedDesc desc;
 
+    RCU_READ_LOCK_GUARD();
+
     caches = vring_get_region_caches(vq);
     if (!caches) {
         return 0;
-- 
2.31.1


