Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC93EA304
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:37:58 +0200 (CEST)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE861-0005bs-5w
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mE85F-0004xK-N4
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mE85E-0002za-08
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628764626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqXkac0PJ3PPfliHtqctQUaS/yYmbr11ahAPHvjeP3E=;
 b=HtZgjh6GqkFhzYAvA+8H462TI4JaMB4OZDPNbRFPDXeh3nuBPQsR9ils7YzpwFqanJnGVl
 MTpK9iURkPnziuUoWtIPeTcqmkUtM8rQpCe6OgfTCwL5eH+M3XiJw+H7hvp/j/WS7wFNP3
 0Dp6l1pO++oThXhiM/3zhTW7/Y2d1SQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-K3KKhi5qMx2GYs6Nf8wt-A-1; Thu, 12 Aug 2021 06:37:05 -0400
X-MC-Unique: K3KKhi5qMx2GYs6Nf8wt-A-1
Received: by mail-ed1-f71.google.com with SMTP id
 u4-20020a50eac40000b02903bddc52675eso2843598edp.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 03:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pqXkac0PJ3PPfliHtqctQUaS/yYmbr11ahAPHvjeP3E=;
 b=MwcyGjWTtcGyB/ble8XGlwHzQuWSW3n/Kv+opnugTvfuIVBzpdq5pfIrlhoO7+FJIN
 k5RqQXDis7mWPOq259C4hw9Q6gsQdcRLCcHhqKXG+MwmijqyMAcZ+4uhAVXHoXucIkIb
 c0b/Nc2phDGxqMUwLsw9g+oHuAn4eCYVfcShF0PLUYyXTo+MnzHLOcO5JuIPzCj+57Yx
 ZYPaRvUijy2A41by5bAYvUyfN5W22KFMKl2IgZ4y50r2wg0Tz1FpTaGDGANcyxXiX0yX
 g7kPFMUlcdM5gNibogG5yN57tExeCi/QB5yruprH4IFwckP6DDZsRZCdPyCSCuts5t2U
 rOAQ==
X-Gm-Message-State: AOAM53112w56BkNp66eXsztef3oEEZlJyk/QlNPUpxWmTxUz/2JL1D6Y
 kos3No1PBAqmNywT+N+8A24HGyJtLFA1/+Dw8Mensrox5jSVvGuGFYn1mFM5Wv1lF9jSKNKZJsN
 1NtaUbuHqoRJRNYM=
X-Received: by 2002:a50:935c:: with SMTP id n28mr4637988eda.287.1628764624483; 
 Thu, 12 Aug 2021 03:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+Z1ESiQLzx0G6zb7SGd4+RKCzpM+YXCZGQ8XqHGGFXUl+RtXNOFXtNY1DYYU77AZchVTNzQ==
X-Received: by 2002:a50:935c:: with SMTP id n28mr4637979eda.287.1628764624345; 
 Thu, 12 Aug 2021 03:37:04 -0700 (PDT)
Received: from steredhat (host-79-36-51-142.retail.telecomitalia.it.
 [79.36.51.142])
 by smtp.gmail.com with ESMTPSA id z10sm645333ejg.3.2021.08.12.03.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:37:04 -0700 (PDT)
Date: Thu, 12 Aug 2021 12:36:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yajun Wu <yajunw@nvidia.com>
Subject: Re: [PATCH] hw/virtio: Fix leak of host-notifier memory-region
Message-ID: <20210812103657.jgdtu45pjni4i3j7@steredhat>
References: <1628732246-34765-1-git-send-email-yajunw@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1628732246-34765-1-git-send-email-yajunw@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 04:37:26AM +0300, Yajun Wu via wrote:
>If call virtio_queue_set_host_notifier_mr fails, should free
>host-notifier memory-region.
>

We can add:
Fixes: 44866521bd ("vhost-user: support registering external host notifiers")
>Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>---
> hw/virtio/vhost-user.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>index aec6cc1..3ae5297 100644
>--- a/hw/virtio/vhost-user.c
>+++ b/hw/virtio/vhost-user.c
>@@ -1474,6 +1474,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>     g_free(name);
>
>     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
>+        object_unparent(OBJECT(&n->mr));
>         munmap(addr, page_size);
>         return -1;
>     }
>-- 
>1.8.3.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


