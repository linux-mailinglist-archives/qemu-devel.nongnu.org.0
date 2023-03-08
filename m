Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2A6AFBDE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM3-0003S5-24; Tue, 07 Mar 2023 20:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLm-0002yR-NK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLl-0001dt-DJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5puY1+aX+yn6M9yjqvoNhyMx/KFthsrofWTajhTdp4=;
 b=Nn2Nt8eU96D6WOedP4K0KvvjVdN1oWFUohVjS+IIbpIn5fcGUfJfdQbsiA+nFSy6alXfdu
 /m7I97hTI0vCfpnER7BtlKXxxevkMVUw+x51C5ieBKdhd/wXVfbL7pbuo5bnW6Oq+R4/OB
 VbRpMsVR+cap5JCvXxm4YyP+adqUrGo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-NPm0RcupNsSg17arWMaKfg-1; Tue, 07 Mar 2023 20:12:11 -0500
X-MC-Unique: NPm0RcupNsSg17arWMaKfg-1
Received: by mail-ed1-f71.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so11980650eda.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237930;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5puY1+aX+yn6M9yjqvoNhyMx/KFthsrofWTajhTdp4=;
 b=hnZyp4E9Sy/90EYN2bnRM0o2cZiCU9foypQ444uvwxCYDIEJbMS6S+BCRBcJ/bV+El
 joAgYk9ebzTigEC7rf9H5d7HGILI79a2wiTX7l8+bOxvDmndwJku/LN9gItQ/FJLku4K
 LsX6c5pSLsMI9r1trKx4KYVce8EkJ3Gqy4u2Ev2V3binJ5FEW5ug4BUsXlO1FmVgF/av
 H8BUN+g9GfPd4WFQfGYYeDPBuWbdPe2skl8UJn2AfoH6drR9jc0+HiO8RGjcGnzEGgji
 lOwiFXp/6UddRjX7Jw24ELVDMZLWBDIfdC7D9VLSTIvVUVWPa54GPa1uGKGiu34Bi2cQ
 RywQ==
X-Gm-Message-State: AO0yUKXRYvpAnL3+jacXRbEkf8vPuQHBUClcrPS8hWOZmwuggTxWkxLC
 EtpR01zPDM/NMDpG8HyHvr2H8ekftFNb536+/lXyNK/neoyZ01qhCqaR0pUMbUSOtEb4PqBPUp2
 emG4PwtQZoT9sarafMO8bVpIcwZS2rHWqf1Tl7cNgjwhLXrj9X1i/UAbUoNpcQ6QGvI1I
X-Received: by 2002:a17:906:2802:b0:86f:e30c:72c1 with SMTP id
 r2-20020a170906280200b0086fe30c72c1mr15555023ejc.8.1678237930275; 
 Tue, 07 Mar 2023 17:12:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9Yj7Ja3ONILcoUNtLbNSt9WAQeMb+4fd+diXRSw3hT4jnFHPUWM8xZlHv9JpGBcwpG4lMh0w==
X-Received: by 2002:a17:906:2802:b0:86f:e30c:72c1 with SMTP id
 r2-20020a170906280200b0086fe30c72c1mr15555009ejc.8.1678237930086; 
 Tue, 07 Mar 2023 17:12:10 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906170f00b008c6c47f59c1sm6701514eje.48.2023.03.07.17.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:09 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: [PULL 26/73] vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices
Message-ID: <ab7337e3b2378a1cc28806eaf31bb72ba9e046d6.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

vhost-vdpa devices can return this feature now that blockers have been
set in case some features are not met.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230303172445.1089785-15-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 48ffb67a34..bc6bad23d5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1294,10 +1294,9 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
-    struct vhost_vdpa *v = dev->opaque;
     int ret = vhost_vdpa_get_dev_features(dev, features);
 
-    if (ret == 0 && v->shadow_vqs_enabled) {
+    if (ret == 0) {
         /* Add SVQ logging capabilities */
         *features |= BIT_ULL(VHOST_F_LOG_ALL);
     }
-- 
MST


