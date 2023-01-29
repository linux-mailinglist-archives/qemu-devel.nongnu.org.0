Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71F67FD1B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 07:24:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM16R-0007xM-Cv; Sun, 29 Jan 2023 01:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pM16I-0007vV-H9
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 01:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pM16G-0005aJ-LX
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 01:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674973415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y9fUE7BDxXRbgO/PBVmwYXutFaF/7xSqi5qxmJOokzI=;
 b=D3x1gHGFfuL9jRpBQIW8Pf0+fof9j9AcK7rQDg+3YEa9M27mZGXIpJfpkluWXHAiWbtYiO
 nksAdq/D+rg9cN2XFJHtqApLyPGGQcxr/+7gEkaZ54d88XOxZNpHLFl/PT9XD44SCPjvOG
 1PXq/QT8sPS65nENWbG0uwZoy0vdZBU=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-26GBi2oZM62ANKx_X18wpw-1; Sun, 29 Jan 2023 01:23:33 -0500
X-MC-Unique: 26GBi2oZM62ANKx_X18wpw-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-15ba18af8d6so3108116fac.23
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 22:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9fUE7BDxXRbgO/PBVmwYXutFaF/7xSqi5qxmJOokzI=;
 b=wt2sncIfcILdudbug87j1JsXWOvAXNkzcQilc2ttJrOaopDEQYn6pRR8hCN7kiH+2h
 6pa3JRiJDEIFujeYQlvw5I07fC3ugKXpYGa2oqlAXk5GsVG3iSAO0TAhHRTc7Lr+5ILf
 8MEG77jyaLa8mvXM6r4zVNrdb1jJWyFmyCut9a7Rq08nGV2cSwTdlQSIrFec20ClQFm3
 0aFGlL9OYGdZYaUUtzhf/JyQMSIzPpdGRKXkRD0VVBhjYoEul1/Zo8hwTlFWWtqtrm/I
 Xr4ci68qYhf6ABhD8r8kbLq0D0tnDJlSy9T4oyBOQfVme1JhbRfgIgcb/RH1J9im97Ae
 DJNg==
X-Gm-Message-State: AFqh2kpzQKByrzh2KBc2ZRNBTxEi2u36kLEP27NTt2YJeP5ONXsPhF5d
 Y7VERK29TboU6R03sj8olA1YEu+MupdcevOMxoRGOPn+d7grPwcASBFk2MCVGsVxOXXDCNdyIik
 LbP+WjmfI74REeTRxuRzcpQ6TPU766cQ=
X-Received: by 2002:a9d:51cd:0:b0:684:d018:10a6 with SMTP id
 d13-20020a9d51cd000000b00684d01810a6mr2320915oth.5.1674973412886; 
 Sat, 28 Jan 2023 22:23:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvXq2KAbQCMJR3opfre/Idh83yRumBBgzkH9cuJ80Ku+JO1krUKS+YpnhzhTBctuCoR4rmMO1xzmxmsG3QOnCs=
X-Received: by 2002:a9d:51cd:0:b0:684:d018:10a6 with SMTP id
 d13-20020a9d51cd000000b00684d01810a6mr2320912oth.5.1674973412683; Sat, 28 Jan
 2023 22:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 29 Jan 2023 14:23:21 +0800
Message-ID: <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Sun, Jan 29, 2023 at 10:52 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> Check whether it is per-queue reset state in virtio_net_flush_tx().
>
> Before per-queue reset, we need to recover async tx resources. At this
> time, virtio_net_flush_tx() is called, but we should not try to send
> new packets, so virtio_net_flush_tx() should check the current
> per-queue reset state.
>
> Fixes: 7dc6be52 ("virtio-net: support queue reset")
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  hw/net/virtio-net.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 3ae909041a..fba6451a50 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>      VirtQueueElement *elem;
>      int32_t num_packets = 0;
>      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> +        virtio_queue_reset_state(q->tx_vq)) {

We have other places that check DRIVER_OK do we need to check queue
reset as well?

E.g:
virtio_net_can_receive()
virtio_net_tx_{timer|bh}()

Thanks

>          return num_packets;
>      }
>
> --
> 2.32.0.3.g01195cf9f
>


