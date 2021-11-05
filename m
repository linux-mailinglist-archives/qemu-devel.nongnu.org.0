Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B11445F1A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:22:09 +0100 (CET)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqjw-00030p-8a
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqhS-0001Wx-0n
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqhQ-0002Ji-5r
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636085971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixTaPGpTPpNflt5o2hNEeEgk3SmnoDTcTZnPS2pgKUs=;
 b=R54BPi1oHlTaILIxVn7CcT6vV4464nbQC1i94RxkuAVSnZE66b3qNCT96ZlIpzKs/qqHpB
 7RaBhg5MWc7rXg9Nr4ic1L7/3IfUis98x0Dz5l7rl+x2ipjr7sLbaT60AGwu1y0RZee9p9
 vFTeJJFpG24PHT+DKV2pHIi94hDSnhM=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-LylGlXxNMT6rZ3bpKw_0IA-1; Fri, 05 Nov 2021 00:19:26 -0400
X-MC-Unique: LylGlXxNMT6rZ3bpKw_0IA-1
Received: by mail-lj1-f198.google.com with SMTP id
 v23-20020a2e87d7000000b0021768392240so2725433ljj.23
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 21:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ixTaPGpTPpNflt5o2hNEeEgk3SmnoDTcTZnPS2pgKUs=;
 b=4cgVkD/chu1oCitzlqN1VO/OxxXeQsItKh9P5h/XLYYXDElH5utS8Bpzqv89Eehuqj
 Ycb9sjZxRjo/aIUyESvZpG9VYFTmAM30hWOEf+WSHBWmJaozxCvz1FelIKr0KnA2xZgv
 LqosvEY5LMIZ/Meee90CAVEEIR+Jrae/Ay+eoxnYeFO2deBatgO/N/Eaha4+Gu6kkUNX
 r5bMdYkGClkaluG9xIV83attnQu4Pb7w/Uk4mZPpOFhJFP7JF0MHvp2nOG30LRaBRmgb
 5t3tn96IfLalbH+2pozVwoiurjSXi7AgVr0W41A1vbLM22ETdhJ+KeUUo0jM1W8kXCJC
 MU5g==
X-Gm-Message-State: AOAM531BqU5XoQnpzXXnZNIeaYhBJQCldIUWMEzdJyETSp2OyBKvZE70
 XdvM9H2JdQlz/nDufs6qReYaw/Q3umPPPxE8ypDHcmrEQRF4YEx6AiUbjVGTY0txaYXcLj/AJsl
 3WyKF67MwhSKGVDr7DGehXTDdXVzJ1bM=
X-Received: by 2002:ac2:4e68:: with SMTP id y8mr53288257lfs.348.1636085964877; 
 Thu, 04 Nov 2021 21:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/5HcmLfYIkJZp5AM9beAijdm0w+LFALRBKwVMghzXyNgLv3LQgSq3HwYArMOM4ogw9KzeNlZWrgJ8SaAuQWg=
X-Received: by 2002:ac2:4e68:: with SMTP id y8mr53288237lfs.348.1636085964613; 
 Thu, 04 Nov 2021 21:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211104085625.2054959-1-eperezma@redhat.com>
 <20211104085625.2054959-3-eperezma@redhat.com>
In-Reply-To: <20211104085625.2054959-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Nov 2021 12:19:13 +0800
Message-ID: <CACGkMEt66kJSJTjJZA1dre=Zv8-_pqa=cBtAd67nOh4j7AUJbQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] vhost: Fix last vq queue index of devices with no
 cvq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 4:56 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The -1 assumes that cvq device model is accounted in data_queue_pairs,
> if cvq does not exists, but it's actually the opposite: Devices with
> !cvq are ok but devices with cvq does not add the last queue to
> data_queue_pairs.
>
> This is not a problem to vhost-net, but it is to vhost-vdpa:
> * Devices with cvq gets initialized at last data vq device model, not
> at cvq one.
> * Devices with !cvq never gets initialized, since last_index is the
> first queue of the last device model.
>
> Because of that, the right change in last_index is to actually add the
> cvq, not to remove the missing one.
>
> This is not a problem to vhost-net, but it is to vhost-vdpa, which
> device model trust to reach the last index to finish starting the
> device.
>
> Also, as the previous commit, rename it to index_end.
>
> Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff, with ctrl_vq=
=3Don
> and ctrl_vq=3Doff.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virt=
io device")
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/vhost_net.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 29f2c4212f..30379d2ca4 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -326,11 +326,11 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
>      VirtIONet *n =3D VIRTIO_NET(dev);
>      int nvhosts =3D data_queue_pairs + cvq;
>      struct vhost_net *net;
> -    int r, e, i, last_index =3D data_queue_pairs * 2;
> +    int r, e, i, index_end =3D data_queue_pairs * 2;
>      NetClientState *peer;
>
> -    if (!cvq) {
> -        last_index -=3D 1;
> +    if (cvq) {
> +        index_end +=3D 1;
>      }
>
>      if (!k->set_guest_notifiers) {
> @@ -347,7 +347,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState=
 *ncs,
>          }
>
>          net =3D get_vhost_net(peer);
> -        vhost_net_set_vq_index(net, i * 2, last_index);
> +        vhost_net_set_vq_index(net, i * 2, index_end);
>
>          /* Suppress the masking guest notifiers on vhost user
>           * because vhost user doesn't interrupt masking/unmasking
> --
> 2.27.0
>


