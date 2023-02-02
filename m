Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C1687C30
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXkx-0004ur-1w; Thu, 02 Feb 2023 06:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNXku-0004na-Ha
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:27:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNXks-0001cm-JT
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675337269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CZgQijwA0qajw7SIhRmzs8wqkKw+lVIs41RnyZdfAU=;
 b=FZSMxpq48F2MC5gNh37oY4eZyVyy78KEH0b9ePQPGcDr/qia6v71YUOffTMY0DJU+7+uH0
 j93fOOdSw8k3/aYiMc0W9w2rLYCyrLjR/jbwUiKhzuWvmYJfrFZKHyUfnkMMqnNjf779x4
 O+/9uGmoZIhqy53h+jGFjTr1ijlImFY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-OWh2tKjmN1qiAI8P7e75fQ-1; Thu, 02 Feb 2023 06:27:46 -0500
X-MC-Unique: OWh2tKjmN1qiAI8P7e75fQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4c8e781bc0aso16956277b3.22
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CZgQijwA0qajw7SIhRmzs8wqkKw+lVIs41RnyZdfAU=;
 b=HS9nML0isfRhY3Dx3lAhymZKNfASl2Ce/8sJnTEuT6vSIFohGD4CHgdlToJZs163pM
 5FovY1OONOMJBTrQFcly9EdOUWZC7Jfc5oVhZlWfxqvOQnwXlWM9/Eyi/Godwl90Ozfz
 uv8XzbEhGk0jOBNN83oCTp/eRZbz2BHMteki84R5c4nkf6/Qi7tB/16dNzO7jWXSwrF2
 QWpbxSfdHOkqPYKOqOhnv2zdLnBb8/hF+VWNbGy0dUgJwu9Urs/FjrltYZO/kbMAlhXt
 u7CTMMs4X2LGsCd+RGAfBOVluVZdgnCXg4HPwW+EBk7CF76AD60zgIyR+lpfyXkhhvw9
 D9cQ==
X-Gm-Message-State: AO0yUKXHX8tAwNzx9u0y+ES8F9TQTZu4LxL+iSTlweC2sjIvW/GmS6DR
 v4Q+tJUAGS+nwDu6RruBvpSqfqm1Y2TXimolYbTTGcx7k4V9ib06Ue6QFurUIrx4VvzHauJDVWd
 YFjCZGo57nb+hLbVDptK0PJgCJQA1G1o=
X-Received: by 2002:a25:e002:0:b0:80b:6391:c7a9 with SMTP id
 x2-20020a25e002000000b0080b6391c7a9mr833249ybg.381.1675337265662; 
 Thu, 02 Feb 2023 03:27:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/qHJmUyEwWrUg/5A7uG8t1OBpWX0P2kVFv5jtEMCLKnahMT37e2pwBmWNYYi+AXeBd6U/1lhrCL3MRg0hlkTg=
X-Received: by 2002:a25:e002:0:b0:80b:6391:c7a9 with SMTP id
 x2-20020a25e002000000b0080b6391c7a9mr833235ybg.381.1675337265456; Thu, 02 Feb
 2023 03:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <17ca79ae-7cda-3d1e-4935-d783ecbe992e@oracle.com>
In-Reply-To: <17ca79ae-7cda-3d1e-4935-d783ecbe992e@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Feb 2023 12:27:09 +0100
Message-ID: <CAJaqyWetxZ1kn--LJ9VZBy0fNgaSnFYjiNDQbU7h4Br0uKR44A@mail.gmail.com>
Subject: Re: [RFC v2 00/13] Dinamycally switch to vhost shadow virtqueues at
 vdpa net migration
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 alvaro.karsz@solid-run.com, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Thu, Feb 2, 2023 at 2:00 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 1/12/2023 9:24 AM, Eugenio P=C3=A9rez wrote:
> > It's possible to migrate vdpa net devices if they are shadowed from the
> >
> > start.  But to always shadow the dataplane is effectively break its hos=
t
> >
> > passthrough, so its not convenient in vDPA scenarios.
> >
> >
> >
> > This series enables dynamically switching to shadow mode only at
> >
> > migration time.  This allow full data virtqueues passthrough all the
> >
> > time qemu is not migrating.
> >
> >
> >
> > Successfully tested with vdpa_sim_net (but it needs some patches, I
> >
> > will send them soon) and qemu emulated device with vp_vdpa with
> >
> > some restrictions:
> >
> > * No CVQ.
> >
> > * VIRTIO_RING_F_STATE patches.
> What are these patches (I'm not sure I follow VIRTIO_RING_F_STATE, is it
> a new feature that other vdpa driver would need for live migration)?
>

Not really,

Since vp_vdpa wraps a virtio-net-pci driver to give it vdpa
capabilities it needs a virtio in-band method to set and fetch the
virtqueue state. Jason sent a proposal some time ago [1], and I
implemented it in qemu's virtio emulated device.

I can send them as a RFC but I didn't worry about making it pretty,
nor I think they should be merged at the moment. vdpa parent drivers
should follow vdpa_sim changes.

Thanks!

[1] https://lists.oasis-open.org/archives/virtio-comment/202103/msg00036.ht=
ml

> -Siwei
>
> >
> > * Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like
> >
> >    DPDK.
> >
> >
> >
> > Comments are welcome, especially in the patcheswith RFC in the message.
> >
> >
> >
> > v2:
> >
> > - Use a migration listener instead of a memory listener to know when
> >
> >    the migration starts.
> >
> > - Add stuff not picked with ASID patches, like enable rings after
> >
> >    driver_ok
> >
> > - Add rewinding on the migration src, not in dst
> >
> > - v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.=
html
> >
> >
> >
> > Eugenio P=C3=A9rez (13):
> >
> >    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
> >
> >    vdpa net: move iova tree creation from init to start
> >
> >    vdpa: copy cvq shadow_data from data vqs, not from x-svq
> >
> >    vdpa: rewind at get_base, not set_base
> >
> >    vdpa net: add migration blocker if cannot migrate cvq
> >
> >    vhost: delay set_vring_ready after DRIVER_OK
> >
> >    vdpa: delay set_vring_ready after DRIVER_OK
> >
> >    vdpa: Negotiate _F_SUSPEND feature
> >
> >    vdpa: add feature_log parameter to vhost_vdpa
> >
> >    vdpa net: allow VHOST_F_LOG_ALL
> >
> >    vdpa: add vdpa net migration state notifier
> >
> >    vdpa: preemptive kick at enable
> >
> >    vdpa: Conditionally expose _F_LOG in vhost_net devices
> >
> >
> >
> >   include/hw/virtio/vhost-backend.h |   4 +
> >
> >   include/hw/virtio/vhost-vdpa.h    |   1 +
> >
> >   hw/net/vhost_net.c                |  25 ++-
> >
> >   hw/virtio/vhost-vdpa.c            |  64 +++++---
> >
> >   hw/virtio/vhost.c                 |   3 +
> >
> >   net/vhost-vdpa.c                  | 247 +++++++++++++++++++++++++----=
-
> >
> >   6 files changed, 278 insertions(+), 66 deletions(-)
> >
> >
> >
>


