Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D216E643D6D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2S45-0008Jf-4W; Tue, 06 Dec 2022 02:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2S3p-0008JW-Kf
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:08:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2S3m-0000li-Ff
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670310489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLwJfALFXHw/E/EZqWV3PMsye7xju4ss338dHSGFdDE=;
 b=K0+LfBAtMk2WwCR2lVN46NzgedIzmfxi80sYk1wZLl28XWpKRmOaIpI69i6tWyXCYns7tC
 yH544AaC09qNOC6HkMKOjTtN5QStQsY/8Y8i4EGtlNs8Tb1hcZyFMFm4JzwiDd8QW1NXxm
 Dh8B0XrKdkChNJh9vKgFIiW+HARMlvg=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-Fq0TyrDjNGqDbfBF9nQeXw-1; Tue, 06 Dec 2022 02:08:06 -0500
X-MC-Unique: Fq0TyrDjNGqDbfBF9nQeXw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1446f190493so3350060fac.9
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLwJfALFXHw/E/EZqWV3PMsye7xju4ss338dHSGFdDE=;
 b=8OG2tJiLT0pyVdtkrc1sMWjLOqSZyWCi59j5MVGW5c7b73PKz02HzhSNB0EZbPkERw
 BLoiob/WFaPX7Ye0sk+vn9DKkhP/VNU6tscDGUcDenaBWVL8OPtKApqt8lrHGsUeVAVt
 mOCiw1DYy8/+cq6QbFlcFuw5d4bTeYf6QbS+3/r4GceINfyGoo8wzF8mJ2UX2+r9Cfuc
 xyui87lGQ1j2QbsAdVt8JoifYpY7wAncObHWsPRKpsdTQd0JeO3UK3yZrqKJ+miX6Cyx
 B2/or+xg5YlIKSnF0W28l3kt8V3v3xOdYRU29JL8PXBJsN6GWYsPyO6qIGJlHP6IP8g4
 1vQA==
X-Gm-Message-State: ANoB5pnAZ0GN78UVCTHb/BNcFM5Hxc3iYhgbtNKXbMLcSNLQ8ZgjYhzA
 A6uA12BRIKrm9E25Yjrkeu+eIsMywlnBYXvFcWuWaxFIlvm8IjejqwRFAK5PSey4AxePwsWduPB
 ECEYlpluSrEeA7Ef3bTytAOZuKRZykG4=
X-Received: by 2002:a9d:832:0:b0:670:5283:dd3e with SMTP id
 47-20020a9d0832000000b006705283dd3emr2217308oty.201.1670310485715; 
 Mon, 05 Dec 2022 23:08:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5zeaN/NGIvrBrWHfR90eraGJiYNmgTB7RJPAHUY52TEZWyjIwNMTuy3qnmwcRYAG7v9eOtbXJBo5xhIOeI+ck=
X-Received: by 2002:a9d:832:0:b0:670:5283:dd3e with SMTP id
 47-20020a9d0832000000b006705283dd3emr2217304oty.201.1670310485507; Mon, 05
 Dec 2022 23:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Dec 2022 15:07:54 +0800
Message-ID: <CACGkMEvQov+eGr8D7FAG5FYOvj8VQ=gEvomrnU5_2R0d55gSLQ@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 00/13] vDPA-net inflight descriptors migration
 with SVQ
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Dec 6, 2022 at 1:04 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The state of the descriptors (avail or used) may not be recoverable just
> looking at the guest memory.  Out of order used descriptor may override
> previous avail ones in the descriptor table or avail vring.
>
> Currently we're not migrating this status in net devices because virtio-n=
et,
> vhost-kernel etc use the descriptors in order,

Note that this might not be the truth (when zerocopy is enabled).

> so the information always
> recoverable from guest's memory.  However, vDPA devices may use them out =
of
> order, and other kind of devices like block need this support.
>
> Shadow virtqueue is able to track these and resend them at the destinatio=
n.

As discussed, there's a bootstrap issue here:

When SVQ needs to be enabled on demand, do we still need another way
to get inflight ones without the help of SVQ?

Thanks

> Add them to the virtio-net migration description so they are not lose in =
the
> process.
>
> This is a very early RFC just to validate the first draft so expect lefto=
vers.
> To fetch and request the descriptors from a device without SVQ need to be
> implemented on top. Some other notable pending items are:
> * Do not send the descriptors actually recoverable from the guest memory.
> * Properly version the migrate data.
> * Properly abstract the descriptors access from virtio-net to SVQ.
> * Do not use VirtQueueElementOld but migrate directly VirtQueueElement.
> * Replace lots of assertions with runtime conditionals.
> * Other TODOs in the patch message or code changes.
>
> Thanks.
>
> Eugenio P=C3=A9rez (13):
>   vhost: add available descriptor list in SVQ
>   vhost: iterate only available descriptors at SVQ stop
>   vhost: merge avail list and next avail descriptors detach
>   vhost: add vhost_svq_save_inflight
>   virtio: Specify uint32_t as VirtQueueElementOld members type
>   virtio: refactor qemu_get_virtqueue_element
>   virtio: refactor qemu_put_virtqueue_element
>   virtio: expose VirtQueueElementOld
>   virtio: add vmstate_virtqueue_element_old
>   virtio-net: Migrate vhost inflight descriptors
>   virtio-net: save inflight descriptors at vhost shutdown
>   vhost: expose vhost_svq_add_element
>   vdpa: Recover inflight descriptors
>
>  hw/virtio/vhost-shadow-virtqueue.h |   9 ++
>  include/hw/virtio/virtio-net.h     |   2 +
>  include/hw/virtio/virtio.h         |  32 ++++++
>  include/migration/vmstate.h        |  22 ++++
>  hw/net/vhost_net.c                 |  56 ++++++++++
>  hw/net/virtio-net.c                | 129 +++++++++++++++++++++++
>  hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++--
>  hw/virtio/vhost-vdpa.c             |  11 --
>  hw/virtio/virtio.c                 | 162 ++++++++++++++++++-----------
>  9 files changed, 392 insertions(+), 83 deletions(-)
>
> --
> 2.31.1
>
>


