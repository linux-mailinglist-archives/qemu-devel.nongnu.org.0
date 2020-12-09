Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0FC2D4AEF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:50:39 +0100 (CET)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5Ty-0007QK-Os
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4Yj-00076n-A1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:51:30 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4Yh-0004x0-Nf
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:51:29 -0500
Received: by mail-io1-xd42.google.com with SMTP id r9so2695755ioo.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6FLeCYhF1dNhRIFet9DSj48YiEpydkRS9PCgrsqW1vs=;
 b=ZINO15jFpHUDmaMIAEmiQEx6VLTOJanLLM1efd17w2y+0XZQ/Aq5jW52CSxVotB3IR
 nYoERS6m6/bHJEnCgp3VnD4sQJokOGw5i38yA2tDcRs0Pa4+OqyPTrbnGdgPbAe47wbG
 zOe1xjvI6J+I8BKB9LsYXLkIKBIipZvKwcyA5VoyYtLmIrud5dWF4PP13K0pDSkruK6r
 Zb+2MmbdwQrHkBkS81I2xHcEDRSspkhlaUYV7mGD2pyXAj5R76dvWQhh0doUYSzel5Q2
 xyudLCmug00MtKZC62LU2c7AHQEQpXPwsntX47hATXAORwU9eZ2yl3QP887ymKMjZx0m
 9JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FLeCYhF1dNhRIFet9DSj48YiEpydkRS9PCgrsqW1vs=;
 b=i1Jttyc/wOvRnCjphjxqpCiuTnbwkowTO7ac+MxQiLl65U1T/OsmeelW8bNyBUFqjh
 /KwOO2mrBGMyfN/O2tmifT86fbOL7EQ7zzN3baVU9y4v5iPjEXKm5XJjKIDR3sZeuuZe
 A7AL0joVtbHaZlg3PWuZkMoRYRucoqUiM1O3GLoGe8dUojeRBe5q60QIVwBYM+OzTSZj
 VyEcGawbkwlqVyaIM5nO9xiejYD+uj3vwtw9hJooXey3PfYiPnNlQQa4i9/0eeBRH2VO
 7XOQcp9C/N+qqcJmtK9SNftE/HGiZq1fBoyAbzN4Yk8F4RDTDywtzA4rY8XaJcz2kH6v
 hp6w==
X-Gm-Message-State: AOAM5311fekTR54DC25epRP/4ezoImJiu5YBFY443SATHWJDNr8gfOec
 hKzrVhPQIgkUoTxBbUt+loTfXfCL9U3TPMouDLU=
X-Google-Smtp-Source: ABdhPJy0PPAj+gRn+U0x4/NQW1p9qkGvBEwZztC63mGUbA6QzapitRoHJ4oVNQWF23ialhp1iJgZpKgD6RqH2V95M+U=
X-Received: by 2002:a02:b70d:: with SMTP id g13mr4928119jam.46.1607539886680; 
 Wed, 09 Dec 2020 10:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-10-david@redhat.com>
In-Reply-To: <20201208163950.29617-10-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 19:51:15 +0100
Message-ID: <CAM9Jb+jCXpx3vwXj4AGxVtHt8Cw6RbXafRmd8Er_KTXyyux7iA@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] virtio-mem: Require only coordinated discards
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We implement the RamDiscardMgr interface and only require coordinated
> discarding of RAM to work.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/virtio-mem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index f419a758f3..99d0712195 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -687,7 +687,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> -    if (ram_block_discard_require(true)) {
> +    if (ram_block_coordinated_discard_require(true)) {
>          error_setg(errp, "Discarding RAM is disabled");
>          return;
>      }
> @@ -695,7 +695,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>      ret = ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb));
>      if (ret) {
>          error_setg_errno(errp, -ret, "Unexpected error discarding RAM");
> -        ram_block_discard_require(false);
> +        ram_block_coordinated_discard_require(false);
>          return;
>      }
>
> @@ -738,7 +738,7 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
>      virtio_del_queue(vdev, 0);
>      virtio_cleanup(vdev);
>      g_free(vmem->bitmap);
> -    ram_block_discard_require(false);
> +    ram_block_coordinated_discard_require(false);
>  }
>
>  static int virtio_mem_discard_range_cb(const VirtIOMEM *vmem, void *arg,

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

