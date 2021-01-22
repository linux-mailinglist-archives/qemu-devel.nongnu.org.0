Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F0300D9B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:22:18 +0100 (CET)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32wj-0001pR-44
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l32s7-0004tx-1c
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l32s4-00079t-MW
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611346648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1G/4/UsOyPUPs1m+fVOynF8vETUSHixEfJHwjU1gz4=;
 b=XA9FaUoC0BuA8nOlVGRn/10mmcoWuSgxOI0CYVw3IfbFbe8KgamtnKPGkwuRwASJG+DI5M
 JJwMISo9dFHm7mwCuq8I+a3j7/7Rf1DfXAAE0WfeUvdqyBLdTNM8WEvmwbMC16HKV8jjRh
 cuUfmb3PRydTpqtPs1hezTCkLgslfhg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-NG8UMk1zP3W6ipXhEpc07w-1; Fri, 22 Jan 2021 15:17:23 -0500
X-MC-Unique: NG8UMk1zP3W6ipXhEpc07w-1
Received: by mail-qv1-f70.google.com with SMTP id k16so4702465qve.19
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i1G/4/UsOyPUPs1m+fVOynF8vETUSHixEfJHwjU1gz4=;
 b=fIIdw2vmFaC5cMvGaf1f3Id2YqRj0uCj6cHnAymhvGKZuWXqmnU9QSI+ZW/NV1HMOB
 u3RjU0dRQCOSBMuhVQ05Kqz6SumDxsax897ULJJ3XjYqHs6G1UCWKulLA31IbgnTwOKE
 PmMmXGYYZcGudC95+3K3rpt49AwLYIo4D6Y7EzlEkd4Xvdy4KzAlrfgzD70P7XHo6aN3
 Q8uniuo+H1FhuIUO6yDiyZAvHNewDBs8YwcbSEc3W7zcgykgoRMPgoc0RSrBAoUL4WjQ
 00FqNazo6H3FgAu9/3V8ttM/hScHOqskFFz5JZbfFJxl3huIGRKUa28PG7saISE5TI7T
 qScg==
X-Gm-Message-State: AOAM533hCDgYFtRJAAzdTe9TojxTyrxk5qfefDY5VRerErA7Wkn5MZgJ
 qCUgnQMNIrHz2KovrY3ud9CFXz/C7LyMhljUgCA4LqB46hUgm7+GJ45K6qxWfvolFhg09ghviFm
 Ckv6XVk2y49hwPTc=
X-Received: by 2002:a0c:a8e7:: with SMTP id h39mr6079029qvc.45.1611346642806; 
 Fri, 22 Jan 2021 12:17:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8NpeA6926sOU37JIMa0XAHxloM/ez+jM77gJl3tmHxAVKiBzngZFo3VUdTATeCqQsBxCPlQ==
X-Received: by 2002:a0c:a8e7:: with SMTP id h39mr6079010qvc.45.1611346642540; 
 Fri, 22 Jan 2021 12:17:22 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id y15sm6426211qto.51.2021.01.22.12.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:17:21 -0800 (PST)
Date: Fri, 22 Jan 2021 15:17:20 -0500
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] virtio: Add corresponding memory_listener_unregister to
 unrealize
Message-ID: <20210122201720.GJ260413@xz-x1>
References: <20210122200851.345259-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210122200851.345259-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Stable <qemu-stable@nongnu.org>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 09:08:51PM +0100, Eugenio Pérez wrote:
> Cannot destroy address spaces of IOMMU-aware virtio devices without it,
> since they can contain memory listeners.
> 
> Fixes: c611c76417f ("virtio: add MemoryListener to cache ring translations")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1912846
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index b308026596..67efd2c301 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3680,6 +3680,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(dev);
>  
> +    memory_listener_unregister(&vdev->listener);
>      virtio_bus_device_unplugged(vdev);
>  
>      if (vdc->unrealize != NULL) {
> -- 
> 2.27.0
> 

Reviewed-by: Peter Xu <peterx@redhat.com>

CC stable, assuming that's what we need too.

Thanks,

-- 
Peter Xu


