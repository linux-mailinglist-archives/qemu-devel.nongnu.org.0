Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D94876BB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:47:56 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nit-0004xP-Bt
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2y-0000rr-Jq
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2v-0001vl-Uq
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yWWiwVH77KlZ9OPEUiCyLgKjq9lYAjmwlptCwnsdb0=;
 b=GjxsaQJYMwfW7J1tZCDO1LPNhcZvWo8ivdVAWy384sDhUvWAntJmLRsKjsxrZx3oyQhyHN
 yL6t3nkWb9bnSnPFQclLJhIOtHN/9s+EbjbXem+WQaMelIfYXHLwJggTq+m6GRdRWgP24J
 tfWZM0BaoiLZcjlvGOw+8A7CKXUKVTE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-wrCD3D3SPluSY5AnM-n24A-1; Fri, 07 Jan 2022 06:04:32 -0500
X-MC-Unique: wrCD3D3SPluSY5AnM-n24A-1
Received: by mail-wr1-f72.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so2088376wrh.23
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0yWWiwVH77KlZ9OPEUiCyLgKjq9lYAjmwlptCwnsdb0=;
 b=O9hcZtAR8EkpB5j6Eh8MTkN8zX9cUW1QXQUbAhD/CwLkgo2fJ7zwcQKhnE2gq8LF98
 SRthLGfVX32vAgbiUFtwE6p86q13CSTFQI0syTmJ49esm4VZFtXwJg1eSm/JrSJDXzyO
 vrwaytuX+Fn5zrq0hsQ5mn9l/8/HeJSLULYvIJiYI4QTpp3KUXx/ohoGMCoec8i2NwW+
 og1mb6LJJSO+zBQ3mgFML4ytU14EJE1dLVDXH+xNf0h0fuPNVlM/egsPA7+B0Z4j4xsC
 a+cVAKh1ZllhJhXdsMymgp+hPn4yuE2Z0Ey+78XVJ0/q3LjCkxUzriAK8Awuq8P/kHLP
 ZQ5Q==
X-Gm-Message-State: AOAM530rcCIfLO9LeFM97SdnG2UMf0uc2F29Ei1l/i30gR0WiVWdkAfx
 cThXAtrq+l9Nrti5kX0Qlt3GtIATeEDu17PuykYqjE4TXOK29NSichvtAk7PwYrLJyLFKqKELp+
 33CvtsJf4e8lHePtQpvbxdscK/C8LMbFhA1EslXkTUnwhz3w1H3SR5sHEX+Sh
X-Received: by 2002:a5d:65c9:: with SMTP id e9mr919203wrw.181.1641553470977;
 Fri, 07 Jan 2022 03:04:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6ZQXycovL24gf3HoQTMCVmELVNbjo/4AGJWIUuzSyGXJ+wXaVc5DiXE1CUR91mM7JwXj8eA==
X-Received: by 2002:a5d:65c9:: with SMTP id e9mr919184wrw.181.1641553470812;
 Fri, 07 Jan 2022 03:04:30 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id 11sm5972406wrz.63.2022.01.07.03.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:30 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 28/55] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX
 feature for virtio blk device
Message-ID: <20220107102526.39238-29-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, Andy Pei <andy.pei@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andy Pei <andy.pei@intel.com>

Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX for virtio blk device to
avoid guest DMA request sizes which are too large for hardware spec.

Signed-off-by: Andy Pei <andy.pei@intel.com>
Message-Id: <1641202092-149677-1-git-send-email-andy.pei@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ab11ce8252..1a42ae9187 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -252,6 +252,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
     /* Turn on pre-defined features */
+    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
     virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
-- 
MST


