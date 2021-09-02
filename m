Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25033FF1D4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:53:05 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpxY-0004Zz-AH
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvU-0001ro-In
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvR-0000KH-VG
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630601452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VN2G/4wJSGOaP1i/981uZGnXCojQFUj+WUAJBtOHkIY=;
 b=VJDZdsSaDTIp0DUcQTZHWkHy6kry6e1nlF+LVtk/sUocMGlodknSGNT9NezZu40+qmofOC
 ahKWiZTKWeYZ4Q1JFPCtxU09sGI6CRhkBvNWrp2Y9+Q5lCEbis4s4jRSa8B+5lEHGhfC23
 ukgCKAt9GA9n04wMV5ooVVm9Lb6ADX0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-AkvlXLCDPhW4fcgCSD2k9A-1; Thu, 02 Sep 2021 12:50:51 -0400
X-MC-Unique: AkvlXLCDPhW4fcgCSD2k9A-1
Received: by mail-wr1-f70.google.com with SMTP id
 h6-20020a5d4fc6000000b00157503046afso749772wrw.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VN2G/4wJSGOaP1i/981uZGnXCojQFUj+WUAJBtOHkIY=;
 b=PnrAYT/aD6fIrWk000VfFHFM4aSNsQzxvSiyZ4tYld4Wb2ouTB4RHS0BO3qUVWSsJ0
 5Ci2eW8ikQIEr5O06gMtil+MHVL0sco3jQNxp8J/88RFAslJwjmedq4DGcNYY/iDKZ19
 edaNwxewVI64vH0bd1fd/r7EMdWg2xqqFRrsQMsInhL7VklskTcNcXU5JbteS6mCmwTe
 ToNR1QXoHgYN1/2TtKO7ymtA4E57FHEnuvPCikiQMvAF/LwnfyKTd4IGmCQClfadtwF8
 UxAAfx5bf68mWUfRlo19/jxKhjsjbcZotyk79RLIUl4VZpxBAWT6f5bYHUeqoCkab/wX
 qrEw==
X-Gm-Message-State: AOAM530WqQ28bD94WxYLylPm4TLyjr1T9pf6bhdeKGRA2ifR1nT1kVb9
 BLJYdz8lJGFWf8o6yCaICIP/6c81HljndeSo7pxAb46KkMQcbVWbo2GXFM8yUpo7vb8JR8EeEi2
 lpb0CQdsFoYN39U8iMQE3RlfECgwU9oclcel05o+cYlMsSA50r4Cvr1Gzccdvwjbk
X-Received: by 2002:adf:910b:: with SMTP id j11mr5126814wrj.114.1630601450260; 
 Thu, 02 Sep 2021 09:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwea8iZWd3qA+Endbq2SjCFcM8b7KRnOUYgTlw5Dootfy65if7i4AgBT9x2JXBQc1DO38984A==
X-Received: by 2002:adf:910b:: with SMTP id j11mr5126787wrj.114.1630601450033; 
 Thu, 02 Sep 2021 09:50:50 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 w29sm2347646wra.88.2021.09.02.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:50:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/virtio: Comment virtqueue_flush() must be called
 with RCU read lock
Date: Thu,  2 Sep 2021 18:50:36 +0200
Message-Id: <20210902165039.432786-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902165039.432786-1-philmd@redhat.com>
References: <20210902165039.432786-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio.h | 7 +++++++
 hw/virtio/virtio.c         | 1 +
 2 files changed, 8 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb750..c1c5f6e53c8 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -186,6 +186,13 @@ void virtio_delete_queue(VirtQueue *vq);
 
 void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
                     unsigned int len);
+/**
+ * virtqueue_flush:
+ * @vq: The #VirtQueue
+ * @count: Number of elements to flush
+ *
+ * Must be called within RCU critical section.
+ */
 void virtqueue_flush(VirtQueue *vq, unsigned int count);
 void virtqueue_detach_element(VirtQueue *vq, const VirtQueueElement *elem,
                               unsigned int len);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a5214bca612..b37344bb5e1 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -898,6 +898,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
     }
 }
 
+/* Called within rcu_read_lock().  */
 void virtqueue_flush(VirtQueue *vq, unsigned int count)
 {
     if (virtio_device_disabled(vq->vdev)) {
-- 
2.31.1


