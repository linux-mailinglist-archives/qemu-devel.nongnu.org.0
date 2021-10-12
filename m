Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E4429EA3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:29:54 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCET-0005g5-7T
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maCBz-0002Y5-Va
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maCBy-00043n-Ef
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634023637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M5lqUJgL6bWQErtMrAoObrnnBQsIrh+MTni3XXOl+2c=;
 b=hdtbMKCtuareKTK+Vt2iq4aSJd5iRSy/RBZjg49jQRpjvcWG4UHjSYa7TwwxC1RGgOKg4C
 2okaHEdiDqsPa8MlXK62XKVVBiqfPFrgY8pYxMXb7UcOa4nTTWxOECyH8yDTKVed53rCiB
 4lGVBoJV5yMwOGF8kVsMaKyn0lgNoww=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-YmSs_WgJPp6XdfL3H0ER3Q-1; Tue, 12 Oct 2021 03:27:16 -0400
X-MC-Unique: YmSs_WgJPp6XdfL3H0ER3Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 p13-20020a056402044d00b003db3256e4f2so18187250edw.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 00:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M5lqUJgL6bWQErtMrAoObrnnBQsIrh+MTni3XXOl+2c=;
 b=HOL9aOyzaj5SJl6x/KkzmQgrLQRkkBOnYvUcnzwiMDjtr9YBYUj4blnDYeVsOg2mZ7
 2scSYxeDbcGAqKysGn2QgGw8OS0oh0/PE8hvzP0GqO09oso0Lc8EP2qIQU0tf1HFQIQ2
 NFefKua+2PjSMmwb9EQxmQ4SKMEFkp+btC4TsEooHHNNfmEiFmdvdy4GsICsdabZXP5o
 Dt+rwVuN+eWaMmTgmrBlsYrWHlPAea1go/QqywPbHDmIIKcC8RTey2yqTlJT0jz4KT9A
 YRenuFm3he5VcQRete8N+3ndyIWJpjuDC1hnNtOAsCis7ON8nzq7w/ciLocDozjtEiSq
 kDCw==
X-Gm-Message-State: AOAM532KsVUEVXY5TCaCwXjDosgHn8e7/b2MsfLXbeV/Pc/32HO+5V7+
 VfaG4KT6tz9R6tmtgL5XDvG3wmLhOJvpNuBWcEyNV97hFIUDwe366Oh4NBc+p+LhBGQOMvdYhV9
 1yx4BKSuAlDi7pPo=
X-Received: by 2002:a17:907:8a12:: with SMTP id
 sc18mr28616860ejc.569.1634023635526; 
 Tue, 12 Oct 2021 00:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzah0Y0hhQ7SGqDz8W6kHMZ84i3hMvRWL9YFUBFYC9+6XN/GSeylj3ExqzshtBhIT//Yz2lng==
X-Received: by 2002:a17:907:8a12:: with SMTP id
 sc18mr28616851ejc.569.1634023635377; 
 Tue, 12 Oct 2021 00:27:15 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id ox9sm4419475ejb.66.2021.10.12.00.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 00:27:14 -0700 (PDT)
Date: Tue, 12 Oct 2021 03:27:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] virtio-mem: Don't skip alignment checks when warning
 about block size
Message-ID: <20211012032705-mutt-send-email-mst@kernel.org>
References: <20211011173305.13778-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011173305.13778-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 07:33:05PM +0200, David Hildenbrand wrote:
> If we warn about the block size being smaller than the default, we skip
> some alignment checks.
> 
> This can currently only fail on x86-64, when specifying a block size of
> 1 MiB, however, we detect the THP size of 2 MiB.
> 
> Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/virtio/virtio-mem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index df91e454b2..7ce9901791 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -701,7 +701,8 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>          warn_report("'%s' property is smaller than the default block size (%"
>                      PRIx64 " MiB)", VIRTIO_MEM_BLOCK_SIZE_PROP,
>                      virtio_mem_default_block_size(rb) / MiB);
> -    } else if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
> +    }
> +    if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
>          error_setg(errp, "'%s' property has to be multiples of '%s' (0x%" PRIx64
>                     ")", VIRTIO_MEM_REQUESTED_SIZE_PROP,
>                     VIRTIO_MEM_BLOCK_SIZE_PROP, vmem->block_size);
> -- 
> 2.31.1


