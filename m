Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FE5A0780
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 04:55:51 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR326-0006R7-CQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 22:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR2zu-0003n9-6b
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 22:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR2zo-0002FW-0S
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 22:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661396007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5+pxKydy/Q6rv5eQ6yOLJriX5ic0/iab4WYPmUpaZo=;
 b=gq0hsXRqipjNJuO0E54062K2OK9p8fMgQQBPX12VkTKfnBsZJ6Lbo4gRixS8BPqumYOZ0b
 l9lf7yWluAitCgvsimHZmIAkCISVavWMTA/AaD8tHacL9NtoYQPsXgqyMitmuOWDrOIE7L
 y05CjgG2QgjCGplJRhzZMiPe2imttNY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-128-QJSD2fuiOtGElIPsjRpjBA-1; Wed, 24 Aug 2022 22:53:26 -0400
X-MC-Unique: QJSD2fuiOtGElIPsjRpjBA-1
Received: by mail-lf1-f72.google.com with SMTP id
 j9-20020ac24549000000b00492b0d1dea9so5792447lfm.16
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 19:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=i5+pxKydy/Q6rv5eQ6yOLJriX5ic0/iab4WYPmUpaZo=;
 b=qdCbED27nnJFBbNsm8G6qylOBl+bqJ9r+iAoq46SjwnAsCuzqKRzh5Ope6ltiYxun1
 pU+tkVu+CCJqRlFTmPRKPC9uYCRm0F3p8liHzANQfFGYcxECiZ1Ikop85Q4fgCV+BVDm
 HZFwI+E0KfIGo+yGPhh/ZM7s+330hHSvDC326I8KebvANgFliGTjWulLq+O2R70lPiXb
 Ds0iAmyfMEuHeUiRpH2zYNJFnJ+t9aaclp429xwkqU+yNvow6ux3fYtfK7AYiWpSrxFT
 RCGxVuUy1zxwgsRpHY2sbLJjrYF5dVhvPAT2lSwpPWaWmkuj37GJt9O/0gYApO+EbRM/
 J4uw==
X-Gm-Message-State: ACgBeo2yt92JVeqmF92u4vh07d8f/GuXtRjvIfNjUPhyzPttSnTGcJVb
 xzkTfjZsMsIrgcEwkQ0fuMQ7uFE7eZTA8jqhrhvs33DGAO2xzEQSANILUWRknt0PFwUYINKQ0/2
 c7XKuef4V2VfFlmahIVYwNwrBGPizORc=
X-Received: by 2002:a2e:a812:0:b0:261:8f2d:9530 with SMTP id
 l18-20020a2ea812000000b002618f2d9530mr437814ljq.251.1661396004624; 
 Wed, 24 Aug 2022 19:53:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7qmlV/Ydd6wjN4hlROG5LkO3wZxpyDMClyjoIcfnjhPWOi7LKH+EY36ATdvfqOp+7Mpwd5Df/zHCFOhnW/8DA=
X-Received: by 2002:a2e:a812:0:b0:261:8f2d:9530 with SMTP id
 l18-20020a2ea812000000b002618f2d9530mr437798ljq.251.1661396004358; Wed, 24
 Aug 2022 19:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
In-Reply-To: <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 10:53:13 +0800
Message-ID: <CACGkMEuzxCRn9AqMiu_MJ_6QuQ1n_puEECvXvO3mCNRoYJuemA@mail.gmail.com>
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 25, 2022 at 8:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 8/23/2022 9:27 PM, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >> It was returned as error before. Instead of it, simply update the
> >> corresponding field so qemu can send it in the migration data.
> >>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> ---
> >
> >
> > Looks correct.
> >
> > Adding Si Wei for double check.
> Hmmm, I understand why this change is needed for live migration, but
> this would easily cause userspace out of sync with the kernel for other
> use cases, such as link down or userspace fallback due to vdpa ioctl
> error. Yes, these are edge cases.

Considering 7.2 will start, maybe it's time to fix the root cause
instead of having a workaround like this?

THanks

> Not completely against it, but I
> wonder if there's a way we can limit the change scope to live migration
> case only?
>
> -Siwei
>
> >
> > Thanks
> >
> >
> >>   hw/net/virtio-net.c | 17 ++++++-----------
> >>   1 file changed, 6 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index dd0d056fde..63a8332cd0 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n,
> >> uint8_t cmd,
> >>           return VIRTIO_NET_ERR;
> >>       }
> >>   -    /* Avoid changing the number of queue_pairs for vdpa device in
> >> -     * userspace handler. A future fix is needed to handle the mq
> >> -     * change in userspace handler with vhost-vdpa. Let's disable
> >> -     * the mq handling from userspace for now and only allow get
> >> -     * done through the kernel. Ripples may be seen when falling
> >> -     * back to userspace, but without doing it qemu process would
> >> -     * crash on a recursive entry to virtio_net_set_status().
> >> -     */
> >> +    n->curr_queue_pairs =3D queue_pairs;
> >>       if (nc->peer && nc->peer->info->type =3D=3D
> >> NET_CLIENT_DRIVER_VHOST_VDPA) {
> >> -        return VIRTIO_NET_ERR;
> >> +        /*
> >> +         * Avoid updating the backend for a vdpa device: We're only
> >> interested
> >> +         * in updating the device model queues.
> >> +         */
> >> +        return VIRTIO_NET_OK;
> >>       }
> >> -
> >> -    n->curr_queue_pairs =3D queue_pairs;
> >>       /* stop the backend before changing the number of queue_pairs
> >> to avoid handling a
> >>        * disabled queue */
> >>       virtio_net_set_status(vdev, vdev->status);
> >
>


