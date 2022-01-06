Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C86486535
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:21:55 +0100 (CET)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SiG-0007hb-ME
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sd1-0003xt-3h
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Scy-0000kZ-Fn
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641474983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDYUVmJkHemLI5KByv30OJoOAnuNT00GDgLmkQC7+Is=;
 b=QXB7msUPjLbNqpLHm1Pt0ctuSt17boocXhgd2P8UPux8vB9Znx+hJTBnjS6Iu7/UbZ6G8H
 Ld6GBZkg67t7s4c7AvQo1dA/FR49j5E/dcw5U0ggMhz6QFjljN4zbiRXkXXq27mql12E1B
 4VBJZMEgiGYcp/s795rqyNd+9fugGQc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-1gTIMxnNPeagePRUgYZrJA-1; Thu, 06 Jan 2022 08:16:22 -0500
X-MC-Unique: 1gTIMxnNPeagePRUgYZrJA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v14-20020adfa1ce000000b001a49d6587ceso1180861wrv.21
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZDYUVmJkHemLI5KByv30OJoOAnuNT00GDgLmkQC7+Is=;
 b=2oApD/xslSYyIR8xwrBuYXVpcOoNmP3MXoMdlwEV3snNeMEAnbNx1CgW9T0Dq7gwLq
 YFGIWPRo3VDQa5ORVDsEMLcM1R5OVCiF8ZsMmCiSXPoIIxXfUQMXGv+xLBxxyvHvXnO5
 4X6OjyRvmbU/ZhunsVOpMq/uf+S27e94xrV0khe/YGiOD/AAvshpiA178UNSA6schez9
 WjJpG6rFQUJV7VENTyfjKpD2BiJJzhgTcDLGBDV+e93VliqAuifjfGfAWJ6cRNLCPCdf
 0VP1iVjaRUwIQN8jEIteZdDoGtnu8BNBP475mIqtY91r85V0fCj7KlfpAeTXOvsB67DM
 H5/w==
X-Gm-Message-State: AOAM533r9O5UFvBylYRcBsbv45Wwf3966medkTSbNrVeWHrMd+hyqbup
 4ixnYa1QzKGOmqmyXdiEjcI0nJN1S+pKp9zYy/SnGUNC8UkPA5nyT+UbxwnouKufXxqJafvUViF
 YJnz3J8tg9VH2X2qV1vqPEzRRmjHBJVXk5Bi/iYE1sjuHeWROqlNWAtJQus/k
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr7098276wmb.99.1641474981056; 
 Thu, 06 Jan 2022 05:16:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDrFmdjz6pfz0Ur0h37d34VIiVz04l/+lhIzncN4XfqVaoMrWYOKnYpuVSmrtfc9aiJANAsg==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr7098261wmb.99.1641474980818; 
 Thu, 06 Jan 2022 05:16:20 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id y1sm2042607wrm.3.2022.01.06.05.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:20 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/52] virtio-mem: Don't skip alignment checks when warning
 about block size
Message-ID: <20220106131534.423671-2-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

If we warn about the block size being smaller than the default, we skip
some alignment checks.

This can currently only fail on x86-64, when specifying a block size of
1 MiB, however, we detect the THP size of 2 MiB.

Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211011173305.13778-1-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a578142b..341c3fa2c1 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -733,7 +733,8 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
         warn_report("'%s' property is smaller than the default block size (%"
                     PRIx64 " MiB)", VIRTIO_MEM_BLOCK_SIZE_PROP,
                     virtio_mem_default_block_size(rb) / MiB);
-    } else if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
+    }
+    if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
         error_setg(errp, "'%s' property has to be multiples of '%s' (0x%" PRIx64
                    ")", VIRTIO_MEM_REQUESTED_SIZE_PROP,
                    VIRTIO_MEM_BLOCK_SIZE_PROP, vmem->block_size);
-- 
MST


