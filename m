Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DED65315D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yma-0004uk-CL; Wed, 21 Dec 2022 08:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymX-0004mn-47
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymV-0004B8-FB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eBOwj6JDM1U7pLSucgaE+caCjlxPIqE+hIWrIrT6Stg=;
 b=iDfQrJE6OeRPhBfXk98VofoD4i0Nt9+TCf2zFtNd6w+3wE+B+sDbvSc9cG0QTraBX8VUOT
 Hhr+TC4aVzOkjw/BrokrGfVUGorKUI8RheY7xxnoY6WqRIDVAL9LgO8gkRUpTxGc64/C2E
 mbxRsr/LHlkw/cD6rRsZRVjeaYEe+G0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-bWHiOPDJP4qKy5sPy0Vqow-1; Wed, 21 Dec 2022 08:05:06 -0500
X-MC-Unique: bWHiOPDJP4qKy5sPy0Vqow-1
Received: by mail-wm1-f72.google.com with SMTP id
 h64-20020a1c2143000000b003d65ff910e1so927619wmh.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBOwj6JDM1U7pLSucgaE+caCjlxPIqE+hIWrIrT6Stg=;
 b=cqDLESvgIzsg/lszSupF7t6TEsZwk0j9/X3A/ihh1IzET+YYztEBrOiKeI+e4ZwpoB
 f7rfqkoJ1yFkJpqGGNPbWysHlg5wF6cDSRM7SYtof0lYeBuIOPpa08b6rDU9XrPsfV9c
 jHHzngdqbjpabxVS9o7Yixdhcw7TPSgvtoZyzGGokieJo2ITWVziWjzsTH/Z3a1ZxCZ9
 Ch5Mc3Ebnw+5t3g3D5Ek1vz7sIlMJR/Eb1hRe70lLuh9Up4gWgi2GoOn2mXKJzctgH+2
 0Hg/pFBgPOXXOfeBgVrV3OO8VtBQAKNFlFGFrsWmuSvIa7ZiZZajUlHLAVJlyYEJC1dD
 BHUA==
X-Gm-Message-State: AFqh2kp2+D3in7J1hfJRTJeoXHh6UHOLHiiIwGDJpPQ0mfQlJ1hD2nCt
 vMZu5zyoOTZx0tY2jtOeUiJooEwr5JSpYiYjpHyTsUTMaW5TJxOcS0fzCJTzXqHKwZ6/zEOuUuN
 r/+UqJIosbPGIW33xBirrknkLd0x/zDOoLte8/LshYJE/mHyN4brngMoJE5fw
X-Received: by 2002:a05:600c:ace:b0:3d1:fe0a:f134 with SMTP id
 c14-20020a05600c0ace00b003d1fe0af134mr1620307wmr.19.1671627903968; 
 Wed, 21 Dec 2022 05:05:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuUOuVZriEKDf3EfliyeuLfsZxrO4hejnSxb0hTsizKfqSMvHIdQZy6hP45ttyhDR5FMoOTjQ==
X-Received: by 2002:a05:600c:ace:b0:3d1:fe0a:f134 with SMTP id
 c14-20020a05600c0ace00b003d1fe0af134mr1620290wmr.19.1671627903747; 
 Wed, 21 Dec 2022 05:05:03 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c4e5300b003cf6a55d8e8sm2326520wmq.7.2022.12.21.05.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:02 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Longpeng <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 11/41] vdpa-dev: mark the device as unmigratable
Message-ID: <20221221130339.1234592-12-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Longpeng <longpeng2@huawei.com>

The generic vDPA device doesn't support migration currently, so
mark it as unmigratable temporarily.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221215134944.2809-5-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vdpa-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index dbc4f8001d..db6ba61152 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -327,6 +327,7 @@ static Property vhost_vdpa_device_properties[] = {
 
 static const VMStateDescription vmstate_vhost_vdpa_device = {
     .name = "vhost-vdpa-device",
+    .unmigratable = 1,
     .minimum_version_id = 1,
     .version_id = 1,
     .fields = (VMStateField[]) {
-- 
MST


