Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4824C6623
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:52:44 +0100 (CET)
Received: from localhost ([::1]:43590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcht-0004ZI-6W
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nOcgO-00039Q-T5
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nOcgL-0005G2-4c
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646041863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+J8V+8Xl1jcIuKWgbCvyl8e8/iVunVHbxFDRIAnh54M=;
 b=X2WVaIh3bJ0T1Nkrdcj2SCc7C+SHjwv9j1TDG7uVIJBk5NRZOHU+EBqYB1Wj+DTrEA+JEf
 vVEt/akmg+pFjTx5KDWIYOPxs9+vj/P55LtJUas9s3dX05r/8QkTwcfe6RzB/OI7oipLOY
 jRspg9wMbgtHXKbelmGrSf6sPhiCbG4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-YI0Qk8hJM-ajzFB4OgfccQ-1; Mon, 28 Feb 2022 04:51:02 -0500
X-MC-Unique: YI0Qk8hJM-ajzFB4OgfccQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so6170310wmc.8
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 01:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+J8V+8Xl1jcIuKWgbCvyl8e8/iVunVHbxFDRIAnh54M=;
 b=Gr+OC+erR/4vArGhu39NlUuXNEyIkI30u7x+Tcf56k02lvWfdl9IXvxROHuDLubYEH
 BSE5PC5xB0MuZ3LmjJLgBirqpPuAU9+04IQ4u156v5ZtUvxtiWMHWYJ6kex9kOxVeell
 hPAFB9OnrL+L/MT7PkKi+70hnmQB7C6hi04dY3310EX7OjXObrurtAxqeibuVvtXn/S1
 wRMQcIbZE+m+X0dSn9c61T2mE4dbwGIuACwbjx2CbnR26k7HLeUjgRR+U/zlMdVSZFyM
 XImwKAtWrEpnniAN93Qn7AyZrimZa2MZuVbGYG9Dn5zw+lHVfaZ6oO0NKYIDu10qKaOu
 1ujQ==
X-Gm-Message-State: AOAM5319FA2BABnPiJ0frLB2NpVlfieEwoBbucKlEiefQW5Daeu56Ykh
 J3exQ28Q+rlaKEJhWmrmnMpBU+NGErQKhY2exRQt8rthpyaxgyW9EJV0ONhCULlX9/Rf+rThil5
 3Dzmz8y6kzlnf1pFxJbWle2En0pCknqKCvs1f07sylUV7PFp/9ew/SHO2dDl61JVtvrk=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr15205983wrs.620.1646041861160; 
 Mon, 28 Feb 2022 01:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHUM4QsPLsu/+5L/U33nRZ3iLIvJMv213l9NjRbc0624yTOhGljnW/BCwnMBOHHNRs7kDGSg==
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr15205964wrs.620.1646041860881; 
 Mon, 28 Feb 2022 01:51:00 -0800 (PST)
Received: from step1.redhat.com (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156]) by smtp.gmail.com with ESMTPSA id
 m11-20020adffe4b000000b001edbdaac445sm13331546wrs.90.2022.02.28.01.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:51:00 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-vsock: detach the virqueue element in case of error
Date: Mon, 28 Feb 2022 10:50:58 +0100
Message-Id: <20220228095058.27899-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: VictorV <vv474172261@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu-stable@nongnu.org, stefanha@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In vhost_vsock_common_send_transport_reset(), if an element popped from
the virtqueue is invalid, we should call virtqueue_detach_element() to
detach it from the virtqueue before freeing its memory.

Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
Cc: qemu-stable@nongnu.org
Reported-by: VictorV <vv474172261@gmail.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vsock-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f3771274e..ed706681ac 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -153,19 +153,23 @@ static void vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
     if (elem->out_num) {
         error_report("invalid vhost-vsock event virtqueue element with "
                      "out buffers");
-        goto out;
+        goto err;
     }
 
     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
                      &event, sizeof(event)) != sizeof(event)) {
         error_report("vhost-vsock event virtqueue element is too short");
-        goto out;
+        goto err;
     }
 
     virtqueue_push(vq, elem, sizeof(event));
     virtio_notify(VIRTIO_DEVICE(vvc), vq);
 
-out:
+    g_free(elem);
+    return;
+
+err:
+    virtqueue_detach_element(vq, elem, 0);
     g_free(elem);
 }
 
-- 
2.35.1


