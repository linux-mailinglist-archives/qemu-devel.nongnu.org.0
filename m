Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C6653194
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynm-0006Xo-HZ; Wed, 21 Dec 2022 08:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yn8-0005nG-W9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yn2-0004Js-2Z
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJnSrcam13KzBZFj35ADiCyaClfbWFdWyns/5iKqAtU=;
 b=Tms2vMAxtalETnGgblS+jeHGgo89ufDDDzARHQEamBV0ZxkC+Lsg8SV//ZS3XYJMwFLd2s
 qP8ix2czyNl0lVTTlhJPLHSCTrdKMIEhp+CR6t6P3df2Il/kZ3LZ8M8zySB/EDNqY+c7Nm
 FsNzQthNG187jCUYweMIunNDrqMTZ5U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-hlXO6vV6MieysDDrInwtTQ-1; Wed, 21 Dec 2022 08:05:37 -0500
X-MC-Unique: hlXO6vV6MieysDDrInwtTQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020adfbc47000000b002421f817287so2865217wrh.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fJnSrcam13KzBZFj35ADiCyaClfbWFdWyns/5iKqAtU=;
 b=ymtH5IBkRihcE27L0/nK5GGbbFo3XQDvy2peaYoR4UDJmNBy4/PXLxox3fmMx9caZn
 ylP4IS4o0wL9w2BA2AlxaVFvDiT52B8UQrO8TfzYiDtppDpT9yCM9pm2G4LYnD2sSmKM
 RrbInRsnBV87vq9dbf9+e8oP9vbsvwK18HljykaocPaRZtgJWNEAOPgu5JY2PDax8ebq
 00NJp9C+hjtvQChb9kbPBLAzBYx3V2v1Ug+U/z+QYj15FmsVy4h9cVAE6n0O0+Nq+jwW
 F8pBDX6eJ7paU7lYposQD62clQie++JM6j2ZQlB4KiVtU3DUVG8ENIVfK4FLV2/WMtHT
 Hiqg==
X-Gm-Message-State: AFqh2kruZsB2/xj1lHyyEQp35/0ewGmGz03S43TP15VYwjnKYl/jhG3I
 Rd5ln2wmDDkVn8hQnkbKDqvJyzGynD5pXH/jlYfMVvzROjLZQhWEX1JWDF97s++wpwWQoS4UwiI
 rc6KYtQfFw/gjzhYCB7jq9m8Pc5XQftHqkqN52RgNzcRaBW3hpT1Ek2BAGdAZ
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr1542694wmo.34.1671627935165; 
 Wed, 21 Dec 2022 05:05:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtDn1d/qNdpgvN+Ho3+f+22XTHYXr2kNcw2DVVzS8YzJGfXCtl42MqLS0TqYyzwnU0kU+XAUQ==
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr1542678wmo.34.1671627934882; 
 Wed, 21 Dec 2022 05:05:34 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d4f87000000b00236576c8eddsm15155698wru.12.2022.12.21.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:32 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 19/41] vdpa: allocate SVQ array unconditionally
Message-ID: <20221221130339.1234592-20-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

SVQ may run or not in a device depending on runtime conditions (for
example, if the device can move CVQ to its own group or not).

Allocate the SVQ array unconditionally at startup, since its hard to
move this allocation elsewhere.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-9-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index dd5258919e..b7a624607b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -532,10 +532,6 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
     struct vhost_vdpa *v = dev->opaque;
     size_t idx;
 
-    if (!v->shadow_vqs) {
-        return;
-    }
-
     for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
         vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
     }
-- 
MST


