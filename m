Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28619665401
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 06:51:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFU1D-0002ST-Sd; Wed, 11 Jan 2023 00:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pFU1C-0002SK-KG
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:51:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pFU1A-0004F0-EY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673416279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJN4O6ZbL/LTa+g1gA9yIfOEF0lP60Ee7isPnTi7RTM=;
 b=V1Kw8cxbRg/0FHvCJRJgZYfDBBTmI9J8BPygcihpmChK5oWT3bCjvefpSxoV9xfqpQr5Av
 wHcF/Ay0mzlJLYkbI5WjHeLTmOPEctEO78+Lr/vrQmXHPseDYFPOiHuxwIt43PGtU19bJ5
 bneAdAb30Uc50euOWrn+ukrr/ubybr0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-fatgUqkpM-OSEk615rT1uw-1; Wed, 11 Jan 2023 00:51:18 -0500
X-MC-Unique: fatgUqkpM-OSEk615rT1uw-1
Received: by mail-ot1-f70.google.com with SMTP id
 c7-20020a9d6c87000000b006834828052cso6967607otr.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 21:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJN4O6ZbL/LTa+g1gA9yIfOEF0lP60Ee7isPnTi7RTM=;
 b=e3h4MUMdkmJLOU4h5LsnukmjUzGerzFYQFrEEq4d7mxS+2jrVdK933u+wO3ZKEcCj9
 VXXNPFft0JqgSXVrkfBZlyFi5b3N6FH3/Z/LFCwfYWgAYWNHBbKkVHUihobmZr+0vS7w
 2db4IgBCFp1j5mIL4o5aUSjqRqFGGXh8QsQ+o5hp89aId661m1rn2TCC/2jh5O5Fhwhd
 G7XUlfOxfZHbDVNtVZA6oxlG818H2QEHc4609vI/rondrjaVpMJ4HF69oQT7NvFpQaM+
 jvLXXAdKDJObVPVydqyo/FCzWmjYAlzMprEecWgXwe4/RJzumjMumuBCeXRr2BPrzrjH
 jX/g==
X-Gm-Message-State: AFqh2kp7H2uSMxXPM+rr/VEgCznen7kUGHvPZuXpzttF66zLT6L62D7/
 o+/k+3S6hliQ0fhGzO40nf27vZ0QBCzfSV+j80aJ5aFdkS8EmYtmshPhxAGK6GgQiUkB4AyZGJd
 koLBUBMC3yWZwkIiP0eKCJU4RehX54b0=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr673821oab.280.1673416277882; 
 Tue, 10 Jan 2023 21:51:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstqxp1LYhD0Fo00tz0r/1sdT5oAB4Ufq4DVCqwPVnBOrl62QnApsPq4Zhn4DvJQhsg2xuLkLl5Mr4/aCj/Xz4=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr673810oab.280.1673416277641; Tue, 10
 Jan 2023 21:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
 <PH0PR12MB548141C98FA3C7593E4B3C40DCFC9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548141C98FA3C7593E4B3C40DCFC9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Jan 2023 13:51:06 +0800
Message-ID: <CACGkMEvriASFy1JTXHPrnP2O99B+mjYY+NMB9x9dHbiG0J7Y3w@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
To: Parav Pandit <parav@nvidia.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <elic@nvidia.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jan 11, 2023 at 12:40 PM Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, January 10, 2023 11:35 PM
> >
> > On Tue, Jan 10, 2023 at 11:02 AM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > Hi Jason,
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, December 5, 2022 10:25 PM
> > >
> > > >
> > > > A dumb question, any reason we need bother with virtio-net? It look=
s
> > > > to me it's not a must and would complicate migration compatibility.
> > >
> > > Virtio net vdpa device is processing the descriptors out of order.
> > > This vdpa device doesn=E2=80=99t offer IN_ORDER flag.
> > >
> > > And when a VQ is suspended it cannot complete these descriptors as so=
me
> > dummy zero length completions.
> > > The guest VM is flooded with [1].
> >
> > Yes, but any reason for the device to do out-of-order for RX?
> >
> For some devices it is more optimal to process them out of order.
> And its not limited to RX.

TX should be fine, since the device can anyhow pretend to send all
packets, so we won't have any in-flight descriptors.

>
> > >
> > > So it is needed for the devices that doesn=E2=80=99t offer IN_ORDER f=
eature.
> > >
> > > [1]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
e
> > > e/drivers/net/virtio_net.c?h=3Dv6.2-rc3#n1252
> >
> > It is only enabled in a debug kernel which should be harmless?
> it is KERN_DEBUG log level. Its is not debug kernel, just the debug log l=
evel.

Ok, but the production environment should not use that level anyhow.

> And regardless, generating zero length packets for debug kernel is even m=
ore confusing.

Note that it is allowed in the virtio-spec[1] (we probably can fix
that in the driver) and we have pr_debug() all over this drivers and
other places. It doesn't cause any side effects except for the
debugging purpose.

So I think having inflight tracking is useful, but I'm not sure it's
worth bothering with virtio-net (or worth to bothering now):

- zero length is allowed
- it only helps for debugging
- may cause issues for migration compatibility
- requires new infrastructure to be invented

Thanks

[1] spec said

"
Note: len is particularly useful for drivers using untrusted buffers:
if a driver does not know exactly how much has been written by the
device, the driver would have to zero the buffer in advance to ensure
no data leakage occurs.
"


