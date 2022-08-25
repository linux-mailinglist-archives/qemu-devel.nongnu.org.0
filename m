Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22555A0787
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 05:07:33 +0200 (CEST)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR3DQ-0001VN-DX
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 23:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3Bz-0008Ua-Ar
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3Bv-00049a-LK
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661396758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEX1sKbXoE+9x4S4WQ/ExmrxMBRaou5A5cTjNUnFzGw=;
 b=AozW1Fp4lYPg5djkMBJ8DFJ3EPMW08EjMQvyQmY9kXK+uj5d/YSSoyaHQAXbMh28v3geIG
 ffEcgV4m0GzxZXJoiFs2rNGUSHC8tNT6jD2ja/Ew3BQ/8XTOn6hy1D/7/YesxnWd8jT27v
 NIzNgrYqQ9Z7PWQvBQ3cBDLERiymQP4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-VZz8fd0UPbSJmavxdsMwKQ-1; Wed, 24 Aug 2022 23:05:57 -0400
X-MC-Unique: VZz8fd0UPbSJmavxdsMwKQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 a18-20020a19ca12000000b00492cd7c3f18so4713112lfg.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 20:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=cEX1sKbXoE+9x4S4WQ/ExmrxMBRaou5A5cTjNUnFzGw=;
 b=0r9WKv1nWSrvkR1Zl+FHsA+Ov1B41B2IKeeEM9twOrTdiqIw0ByomlhTpQs0GiAOK2
 UI35gHLKRx53hpeoT4BEMAZ9DEWjyfi9qyyS5BfONdn8a5ksXVTwTJ/CsIvT5w5bTNx6
 kpLdbTTvhaCnWM24qO5txkqfK7HPQ+t85ejpek9BzgKa6a9Zr4UNglAFJsN8JK6SbAEy
 bUscmOh4ge1NyaT3q/DjMr6SzpI+MWmA6RbzntiBVYB8u8FCsjv8csBZSvufCQAZF27D
 gK/WKuyUKwnRXP5ZbH6Nsbn3kO+iUDE1QoUfkfVQNAo1zwtNPbhxIY7YKGxGWtRIVTVc
 wvyg==
X-Gm-Message-State: ACgBeo1RlPV6C/mrvE+Mz5S0SpTibPqvPUrOy7tdpO4Us83wnUU86U7N
 Wp6g/u0zATnkUA5zus+zOdS4fX9N9XeDWLhhsCzq9vuQH8s585cR6DRus2TWYEsLrcT2nB9BcHZ
 nB580eCnNwBavljGP/m8vWhhOjECfj2o=
X-Received: by 2002:a05:6512:15a4:b0:492:e3b4:7a with SMTP id
 bp36-20020a05651215a400b00492e3b4007amr470911lfb.411.1661396756157; 
 Wed, 24 Aug 2022 20:05:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4aW5jgRQk77odGzyQ4+rfhg4PhPhIm3zcsi8kSt614oWIQ+K6PWwT0sIqjv4QrTFy7KaAXYcR36n5Ism8/He8=
X-Received: by 2002:a05:6512:15a4:b0:492:e3b4:7a with SMTP id
 bp36-20020a05651215a400b00492e3b4007amr470892lfb.411.1661396755889; Wed, 24
 Aug 2022 20:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
 <CACGkMEuzxCRn9AqMiu_MJ_6QuQ1n_puEECvXvO3mCNRoYJuemA@mail.gmail.com>
In-Reply-To: <CACGkMEuzxCRn9AqMiu_MJ_6QuQ1n_puEECvXvO3mCNRoYJuemA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 11:05:44 +0800
Message-ID: <CACGkMEsuokKQiE68g0GkEGi30uSk5km96m=achrVK1DFrw77tg@mail.gmail.com>
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

On Thu, Aug 25, 2022 at 10:53 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Aug 25, 2022 at 8:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >
> >
> >
> > On 8/23/2022 9:27 PM, Jason Wang wrote:
> > >
> > > =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > >> It was returned as error before. Instead of it, simply update the
> > >> corresponding field so qemu can send it in the migration data.
> > >>
> > >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >> ---
> > >
> > >
> > > Looks correct.
> > >
> > > Adding Si Wei for double check.
> > Hmmm, I understand why this change is needed for live migration, but
> > this would easily cause userspace out of sync with the kernel for other
> > use cases, such as link down or userspace fallback due to vdpa ioctl
> > error. Yes, these are edge cases.
>
> Considering 7.2 will start, maybe it's time to fix the root cause
> instead of having a workaround like this?

Btw, the patch actually tries its best to limit the behaviour, e.g it
doesn't do the following set_status() stuff. So I think it won't
trigger the issue you mentioned here?

Thanks

>
> THanks
>
> > Not completely against it, but I
> > wonder if there's a way we can limit the change scope to live migration
> > case only?
> >
> > -Siwei
> >
> > >
> > > Thanks
> > >
> > >
> > >>   hw/net/virtio-net.c | 17 ++++++-----------
> > >>   1 file changed, 6 insertions(+), 11 deletions(-)
> > >>
> > >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > >> index dd0d056fde..63a8332cd0 100644
> > >> --- a/hw/net/virtio-net.c
> > >> +++ b/hw/net/virtio-net.c
> > >> @@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n=
,
> > >> uint8_t cmd,
> > >>           return VIRTIO_NET_ERR;
> > >>       }
> > >>   -    /* Avoid changing the number of queue_pairs for vdpa device i=
n
> > >> -     * userspace handler. A future fix is needed to handle the mq
> > >> -     * change in userspace handler with vhost-vdpa. Let's disable
> > >> -     * the mq handling from userspace for now and only allow get
> > >> -     * done through the kernel. Ripples may be seen when falling
> > >> -     * back to userspace, but without doing it qemu process would
> > >> -     * crash on a recursive entry to virtio_net_set_status().
> > >> -     */
> > >> +    n->curr_queue_pairs =3D queue_pairs;
> > >>       if (nc->peer && nc->peer->info->type =3D=3D
> > >> NET_CLIENT_DRIVER_VHOST_VDPA) {
> > >> -        return VIRTIO_NET_ERR;
> > >> +        /*
> > >> +         * Avoid updating the backend for a vdpa device: We're only
> > >> interested
> > >> +         * in updating the device model queues.
> > >> +         */
> > >> +        return VIRTIO_NET_OK;
> > >>       }
> > >> -
> > >> -    n->curr_queue_pairs =3D queue_pairs;
> > >>       /* stop the backend before changing the number of queue_pairs
> > >> to avoid handling a
> > >>        * disabled queue */
> > >>       virtio_net_set_status(vdev, vdev->status);
> > >
> >


