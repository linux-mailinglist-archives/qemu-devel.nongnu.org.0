Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC3443DC4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 08:41:08 +0100 (CET)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miAtP-0006j4-GO
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 03:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miAs6-0005Cw-UU
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miAs3-00010i-Pz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635925182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqnZkhfScNDZDzH+Ssx8muto8vWUJowv2jYg7AU2uns=;
 b=MjQdDJWkwdhQeuSCTVnLbdZ2uyV0cULbSwYgjBWIu8m4KfLBhx5b6bvSNKgmvjV7N7GrQq
 1D1T80zJyrqCLItWZT3KECG1xSzNB7CWE9mNfPm9Ps0Loa5TxSGqaDpEa1pFpX9Tls5UMK
 VuT4N+4qZT2d1uWCsVHLmON78jHitQE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-tUqJV-kYPRa8o-dZQ2O-jA-1; Wed, 03 Nov 2021 03:39:41 -0400
X-MC-Unique: tUqJV-kYPRa8o-dZQ2O-jA-1
Received: by mail-qk1-f197.google.com with SMTP id
 j6-20020a05620a288600b0045e5d85ca17so1578142qkp.16
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 00:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MqnZkhfScNDZDzH+Ssx8muto8vWUJowv2jYg7AU2uns=;
 b=MIJVbaeg4znQhJMVw42iWpHr+CeLuT9uV33ADJwQe1V69nfFfJbbqdT0T4aBjvbWan
 LHWEk4kCy4Nrzb8e2ZKyCWKhcBXHWuR0kIToNWcYX+DpLOdCF4LHOQSGTV9ONlZMRR6H
 HbBpOFWIuTHBPLz8syoALaStzZfbSKg7uiAQ3ZJ1V6lEhU1DHgj3vtIDljWelpijVUQJ
 t0rWeZ/k45zvAoJl0HeMuM1uXRPdxThpL4xULLzEi0lpPvbHNUJgXPpuVzhV5AX6crP9
 JrBSwWzUjEf348a3s4O7TXzG80GqiQ82w8wLY1Wr4pE2QjdDp9G6qGtrJD93V0lMt9D+
 3NyA==
X-Gm-Message-State: AOAM5308y7dG3bAIB5OXLjgK4JWslgeoHoaFxNtJNKC3jtAakOPi/oaJ
 D1B9fec4Iy+7sYvo+XETq4Za4tUFU0iBu9+9Ei9DGAxXUqhjlRyO610tlukPsS3zEfHbccfbpJh
 IbKxzgvf09bRBpbPrZk6t1TRlmDhGa7s=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr43535322qtm.401.1635925181228; 
 Wed, 03 Nov 2021 00:39:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIxxk/WccgwPcU2TRnV2uwuMk7EHhtzHACibE+C3ZFGP6dugUhemcZLxPiPUy2FJgFDQ1malH66GdX61dKV/w=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr43535303qtm.401.1635925181009; 
 Wed, 03 Nov 2021 00:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211102114059.1917341-1-eperezma@redhat.com>
 <20211102114059.1917341-2-eperezma@redhat.com>
 <CACGkMEuv2csSn6NJAN_mh3yXC4rXXQ8YD4EA9T+WmmeM8Y3R6Q@mail.gmail.com>
In-Reply-To: <CACGkMEuv2csSn6NJAN_mh3yXC4rXXQ8YD4EA9T+WmmeM8Y3R6Q@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 3 Nov 2021 08:39:04 +0100
Message-ID: <CAJaqyWcDCs5By_W5JYJ=93kW0VLF0CQ=vu3AKF_6uAbJrE0LEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] vhost: Fix last queue index of devices with no cvq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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

On Wed, Nov 3, 2021 at 3:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Nov 2, 2021 at 7:41 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > The -1 assumes that all devices with no cvq have an spare vq allocated
> > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This is an invalid
> > device by the standard, so just stick to the right number of device
> > models.
> >
> > This is not a problem to vhost-net, but it is to vhost-vdpa, which
> > device model trust to reach the last index to finish starting the
> > device.
> >
> > Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff.
> >
> > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the vi=
rtio device")
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 0d888f29a6..a859cc943d 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -329,10 +329,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >      int r, e, i, last_index =3D data_queue_pairs * 2;
> >      NetClientState *peer;
> >
> > -    if (!cvq) {
> > -        last_index -=3D 1;
> > -    }
> > -
>
> So I think the math is wrong at least from the perspective of virtio:
> If we had a device with 1 queue pair without cvq, last_index is 2 but
> should be 1.
>

At this moment, last_index is the last queue index. By the
vhost_vdpa_dev_start test:

    if (dev->vq_index + dev->nvqs !=3D dev->last_index)
--

I'd say that last_index should remain that way so device models with
arbitrary number of virtqueues are better supported. I'd rename
last_index to last_queue_index though.

So with *this* patch applied, yes, last_index is 2 if (!cvq), 4 if
multiqueue & !cvq, ... It's the way virtio_vdpa works at this moment
regarding dev->vq_index and dev->last_index: everything uses virtqueue
as base as far as I can see.

If we want to work with devices, we should include a new field in
vhost_dev like "dev_index", and rename "last_index" to
"last_dev_index". But I'd say it is better to keep using virtqueues as
the base.

> Another thing is that it may break the device with cvq. If we have a
> device with 1 queue pair + cvq, last_index is 2.
>
> We will start the device before cvq vhost_net is initialized. Since
> for the first vhost_net device (first queue pair) we meet the:
>
> dev->vq_index + dev->nvqs =3D=3D dev->last_index (0 + 2 =3D=3D 2).
>
> Then we set DRIVER_OK before initializing cvq.
>

This part is totally right.

If we stick with s/last_index/last_vq_index/, the right patch should
be to ADD one index for cvq to last_index, so the patch should
actually be if(cvq) { last_index +=3D 1; }.

Does it make sense to both renaming last_index to last_queue_index and
to replace the conditional that way?

Thanks!

> Thanks
>
> >      if (!k->set_guest_notifiers) {
> >          error_report("binding does not support guest notifiers");
> >          return -ENOSYS;
> > --
> > 2.27.0
> >
>


