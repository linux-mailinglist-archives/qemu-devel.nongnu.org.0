Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDF401A18
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:45:27 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNC7x-00067T-Qg
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC65-0004eT-1x
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC63-0005fo-MB
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630925006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flP71HjC8jGMU9xA5z+8rAkdDjbRG9SSiS1OKFek9Fk=;
 b=WkkQO/Nj0w5rgEvCXmyfVGrAZQdOwP6DeunO/pEGqJ3Uejv9Nw5q+emNqMGCSGy/N4Jfxz
 POhJG6Yvu1t0NPh7Acs5NTjrT1cTp8HLUE1NfgTikHdrQ3RxyxI8yQtO5AeDOmsItEbgJX
 j7ING6zzKjt/6ROG1NrIBVboyg18R/Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-JdLEfmjBO3CEOFmowj_9JA-1; Mon, 06 Sep 2021 06:43:26 -0400
X-MC-Unique: JdLEfmjBO3CEOFmowj_9JA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so2186045wmp.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=flP71HjC8jGMU9xA5z+8rAkdDjbRG9SSiS1OKFek9Fk=;
 b=a1TCMRNWBflttq6GHGzA44InntNcvtQ817AJtanX+DpHIQgfo6fIjKD2mi2mekj/db
 khkt7yREU3xejm5hyR59R0HwKPaXBBt+OU+GBD08a4H5LOdWOAbEDiJcAMqwYDPCH1O0
 9ia/ljgZti+ryHRFWQrrgcgsOBYziY7c7sGGlEmHuAMg0ed7V7wGtFx3zCGn1Cbl2nq8
 Bg+/GKMlEum+oH/L8HdAZUWKWDmaK3c1C5+qzOgkNwrzkEX0GVZNxKPuqm47/LynJrXv
 jE6f5/IO11AzEr4AXXBfAmHh/yxA4EojLPNXdjsgWUMHqn5KAVOzrPmwmK18RKYj9wVv
 EwMg==
X-Gm-Message-State: AOAM531pJzdQGV/9J9nBbNtN9fw8PcWKNo30VqZYP9RbsszmErpD60S8
 PK5HSc8e6IIauIyVyAIau9q0adFFNJQW/MdfEMEzch+052QZ+N5F8Q+iwilVL5z3gEaeXUMoMfQ
 LanS2mdMW2W20Vq8rM5lvllDR5CZ6Ym9eKB9wcbE5GbGCHBxXrXuG0Ya8euz5jQq1
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr11419752wrw.146.1630925004537; 
 Mon, 06 Sep 2021 03:43:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX5pSkcTBvskmSyos1Xq4rn17eyBB8Dh9wCf2wv3w9XI1PFnJLqFaV/gseZsgrjD8l68SidA==
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr11419720wrw.146.1630925004306; 
 Mon, 06 Sep 2021 03:43:24 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f5sm6823938wmb.47.2021.09.06.03.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 03:43:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] hw/virtio: Comment virtqueue_flush() must be called
 with RCU read lock
Date: Mon,  6 Sep 2021 12:43:16 +0200
Message-Id: <20210906104318.1569967-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
index 3a1f6c520cb..97f60017466 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -896,6 +896,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
     }
 }
 
+/* Called within rcu_read_lock().  */
 void virtqueue_flush(VirtQueue *vq, unsigned int count)
 {
     if (virtio_device_disabled(vq->vdev)) {
-- 
2.31.1


