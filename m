Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C163B84A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 03:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozqmX-0001nd-Uk; Mon, 28 Nov 2022 21:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozqmU-0001nB-E3
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 21:55:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozqmS-0007SB-8M
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 21:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669690530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mW0rTrn1NA8EEs7D1p2leeFe6B+wX01rnUkpW3QKH0=;
 b=PZhNlB4BWk9TrTkIsN+SWtB6BYpwEnrkj5Bw7wJ2v2rx39yQRtKWRpAI/EgwbEZvUnxiif
 naOJUku1/hbJhMN3rsTlCAttPHZTH3wFrQW+nAOLlaMoLlr6mgprUWW24Q0XcL7sMMHuZq
 UQ15VCeuKXjpQhkjH7G0aAoyb7Kz/7I=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-Om9ve4b2PV-8a5m9aihsmQ-1; Mon, 28 Nov 2022 21:55:29 -0500
X-MC-Unique: Om9ve4b2PV-8a5m9aihsmQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-142a7a82700so7517728fac.14
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 18:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mW0rTrn1NA8EEs7D1p2leeFe6B+wX01rnUkpW3QKH0=;
 b=bNXuN61kkb9jlIr1vC7OTFh3zthQmvxao1JBhjWWxFUEXm/4REZWTrjhPc0i9H38Nd
 eWs1V+flOjy1K11mYe956MyLbZAbhondJ9YsB+xe0TVbc1ieUGKucPTuyUo9INuU//SM
 3abxaasG8SEJkq6/VtNxQiGdtHWrtHNkK6nJFNgdB6JR2mcGWo4+BPDzn7PnpxORDV0L
 /R1ET1U8ebQFP7YnhoSHNQqH/socmPngGNNcM4PHd8qeZSSs8zsjmeZnSWWAI61YZ8kL
 s3zFw6kW029lhNvGiRgtAqmomJSPJmgaXV1YNLYyVRqO65I6JN4SQ1ZGTBIduHCnHxfV
 sQmQ==
X-Gm-Message-State: ANoB5pn5O20OecbFsbp6d+pG4ZNP3+43sXlCNiPF37WuMzyDFjQ2+acR
 kk/A5tV4muX0XG0O70JAgqH6rejYGhIcTJ8MCpKWjJ1MAE06nqy4b+/bRU9FOmoFNcO/mKGJ2PQ
 LGHKBCdf0Uk1qQK55iN5vA6CTjdsmnNg=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr20024402oab.35.1669690528300; 
 Mon, 28 Nov 2022 18:55:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6rcbpGaaJuOfAD8QYX9Y0QiARI6ACYhUSlnAkqqifdN794qsWJKzRLo2iaGTjgHvoTrvX6ztzVq6RlTIW/9bM=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr20024390oab.35.1669690528104; Mon, 28
 Nov 2022 18:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20221118144915.2009-1-longpeng2@huawei.com>
 <CACGkMEu4R92uX_J43ZKetg3Q1FCTQR1Z7u4Ua3Jx2y7cjxX1Og@mail.gmail.com>
 <45e851db-7633-8942-4baf-5ca608c9dd61@huawei.com>
In-Reply-To: <45e851db-7633-8942-4baf-5ca608c9dd61@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 29 Nov 2022 10:55:17 +0800
Message-ID: <CACGkMEuKa9P+n5Yv7iHpg0ZDqRSnXBzCSBDt+pdnsmSPuA181A@mail.gmail.com>
Subject: Re: [PATCH] vhost: configure all host notifiers in a single MR
 transaction
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 5:08 PM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2022/11/21 12:01, Jason Wang =E5=86=99=E9=81=93:
> > On Fri, Nov 18, 2022 at 10:49 PM Longpeng(Mike) <longpeng2@huawei.com> =
wrote:
> >>
> >> From: Longpeng <longpeng2@huawei.com>
> >>
> >> This allows the vhost device to batch the setup of all its host notifi=
ers.
> >> This significantly reduces the device starting time, e.g. the vhost-vD=
PA
> >> generic device [1] start time reduce from 376ms to 9.1ms for a VM with
> >> 64 vCPUs and 3 vDPA device(64vq per device).
> >
> > Great, I think we need to do this for host_notifiers_mr as well. This
> > helps for the case when the notification area could be mapped directly
> > to guests.
> >
> Batch and commit once for host_notifiers_mrs can reduce the cost from
> 423ms to 32ms, testing on vdpasim_blk (3 devices and 64 vqs per device)
> with doorbell passthrough support.
> I'll append a patch in the next version.

Great.

Thanks

>
> >>
> >> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
> >>
> >> Signed-off-by: Longpeng <longpeng2@huawei.com>
> >> ---
> >>   hw/virtio/vhost.c | 39 ++++++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 38 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index d1c4c20b8c..bf82d9b176 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -1507,6 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
> >>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice =
*vdev)
> >>   {
> >>       BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> >> +    int vq_init_count =3D 0;
> >>       int i, r, e;
> >>
> >>       /* We will pass the notifiers to the kernel, make sure that QEMU
> >> @@ -1518,6 +1519,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev=
 *hdev, VirtIODevice *vdev)
> >>           goto fail;
> >>       }
> >>
> >> +    /*
> >> +     * Batch all the host notifiers in a single transaction to avoid
> >> +     * quadratic time complexity in address_space_update_ioeventfds()=
.
> >> +     */
> >> +    memory_region_transaction_begin();
> >> +
> >>       for (i =3D 0; i < hdev->nvqs; ++i) {
> >>           r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->v=
q_index + i,
> >>                                            true);
> >> @@ -1525,19 +1532,33 @@ int vhost_dev_enable_notifiers(struct vhost_de=
v *hdev, VirtIODevice *vdev)
> >>               error_report("vhost VQ %d notifier binding failed: %d", =
i, -r);
> >>               goto fail_vq;
> >>           }
> >> +
> >> +        vq_init_count++;
> >>       }
> >
> > Nit, the name needs some tweak, it's actually the number of the host
> > notifiers that is initialized. And we can count it out of the loop.
> >
> Ok, I will refer to virtio_device_start_ioeventfd_impl().
>
> >>
> >> +    memory_region_transaction_commit();
> >> +
> >>       return 0;
> >>   fail_vq:
> >> -    while (--i >=3D 0) {
> >> +    for (i =3D 0; i < vq_init_count; i++) {
> >
> > It looks to me there's no need for this change.
> >
> > Others look good.
> >
> > Thanks
> >
> >>           e =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->v=
q_index + i,
> >>                                            false);
> >>           if (e < 0) {
> >>               error_report("vhost VQ %d notifier cleanup error: %d", i=
, -r);
> >>           }
> >>           assert (e >=3D 0);
> >> +    }
> >> +
> >> +    /*
> >> +     * The transaction expects the ioeventfds to be open when it
> >> +     * commits. Do it now, before the cleanup loop.
> >> +     */
> >> +    memory_region_transaction_commit();
> >> +
> >> +    for (i =3D 0; i < vq_init_count; i++) {
> >>           virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_=
index + i);
> >>       }
> >> +
> >>       virtio_device_release_ioeventfd(vdev);
> >>   fail:
> >>       return r;
> >> @@ -1553,6 +1574,12 @@ void vhost_dev_disable_notifiers(struct vhost_d=
ev *hdev, VirtIODevice *vdev)
> >>       BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> >>       int i, r;
> >>
> >> +    /*
> >> +     * Batch all the host notifiers in a single transaction to avoid
> >> +     * quadratic time complexity in address_space_update_ioeventfds()=
.
> >> +     */
> >> +    memory_region_transaction_begin();
> >> +
> >>       for (i =3D 0; i < hdev->nvqs; ++i) {
> >>           r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->v=
q_index + i,
> >>                                            false);
> >> @@ -1560,8 +1587,18 @@ void vhost_dev_disable_notifiers(struct vhost_d=
ev *hdev, VirtIODevice *vdev)
> >>               error_report("vhost VQ %d notifier cleanup failed: %d", =
i, -r);
> >>           }
> >>           assert (r >=3D 0);
> >> +    }
> >> +
> >> +    /*
> >> +     * The transaction expects the ioeventfds to be open when it
> >> +     * commits. Do it now, before the cleanup loop.
> >> +     */
> >> +    memory_region_transaction_commit();
> >> +
> >> +    for (i =3D 0; i < hdev->nvqs; ++i) {
> >>           virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_=
index + i);
> >>       }
> >> +
> >>       virtio_device_release_ioeventfd(vdev);
> >>   }
> >>
> >> --
> >> 2.23.0
> >>
> >
> > .
>


