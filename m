Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81B488067
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:23:20 +0100 (CET)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60Rz-0007AL-Ly
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:23:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609r-0004G5-1e
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609p-0002Mo-90
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNzO3BmzKsU9XDhTDAgKzBlwWRwUQVLphv/ivYXligU=;
 b=R/9iLsWg9ItSaTWx49MtWnMnLBpPaErtcdQ7byEZOOHUIwkXFCAnAoE26Zznyu436SK5ie
 GkNhQjRoZCJugLi81opJJjy4AopQxYaavdB0DCg9TnDe/s6MXeTkA1yfqCJ/Y/5e8OA6sm
 qIIjrZOEEghuoNsOk5Nt2yBmksFZrgY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-01qoKQhvMmq3DDKtzPEO1Q-1; Fri, 07 Jan 2022 20:04:31 -0500
X-MC-Unique: 01qoKQhvMmq3DDKtzPEO1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so5631124wma.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mNzO3BmzKsU9XDhTDAgKzBlwWRwUQVLphv/ivYXligU=;
 b=uG7n2CHqt/L1qY0Kz5ReVbjHhV/zw4p0zx2I/+di0EOeRVF9Jp5NBrZ6oyg7j3rvD1
 lBFe1HIT2Iy/sfiuEvTgJCYvdMUdyD8sloYc4Zf47MGszZRv4xlcArT4eU9KsYmAHHLM
 VuhLnXeoik/th9JRG2Uw6v4H8NpuiILSdTLoWBP0bOiW4OkjD/JFtlLGxOsdrweaEB6a
 cRexZ5DLY7D3bP1D9ED3TYoNkzntjwaLhE1Z9S4k3Gr9XX0JLBraosVexeAjwXB8NDjD
 G63TU0bZJypWK1lbUeKb1gzOE9Mvb2H9I5Ku9TOLYUHoARUp1Iwqe5HtBUceVvecCsdU
 SBNQ==
X-Gm-Message-State: AOAM5306cLzIM5JYvhi5sU172r7Z2mjsbantQoTuq5RAjJLvWf/mp45H
 zkQ49Q+5lby6rzA0mq6hztjB+OsO+a5WaBbfMyDrcQMUtqmA4Pva//IUIGoCrg8L3yG94Fj7Pp+
 MMZ4FCySgcPW9GWI2eEFrqD0qFox2DcmcZKWCfTZBaGvFdgdsTADXyzyRPx/7
X-Received: by 2002:a5d:4486:: with SMTP id j6mr53940813wrq.160.1641603870106; 
 Fri, 07 Jan 2022 17:04:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypdkmXhqVTE2ZOp5dWE/3Yhmk5XOMUkui7k/0XPe9Wjsq2pNueJ4LivkrEqDZK7HUDdfDd6w==
X-Received: by 2002:a5d:4486:: with SMTP id j6mr53940805wrq.160.1641603869944; 
 Fri, 07 Jan 2022 17:04:29 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id e5sm214917wrq.116.2022.01.07.17.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:29 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 18/55] vhost-backend: stick to -errno error return convention
Message-ID: <20220108003423.15830-19-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Almost all VhostOps methods in kernel_ops follow the convention of
returning negated errno on error.

Adjust the only one that doesn't.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-7-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/vhost-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 44f7dbb243..e409a865ae 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -47,7 +47,7 @@ static int vhost_kernel_cleanup(struct vhost_dev *dev)
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_KERNEL);
 
-    return close(fd);
+    return close(fd) < 0 ? -errno : 0;
 }
 
 static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
-- 
MST


