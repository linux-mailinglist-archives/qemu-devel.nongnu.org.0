Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C361368B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:39:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU1L-0007Ym-K7; Mon, 31 Oct 2022 08:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opU0s-0006J4-Ou
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:35:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opU0r-00052R-9E
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkF+SCblyXcNQKarHtp1viFvsuetH0NT2rsz6W3c7zU=;
 b=HN7nzh09SVCOeHPEIVd2yGgW6mvXR2ccJRagIVkb0UfqCKdkJIQBfkVMyMBPuZJKo1uREg
 yWnd2B9Ry9Dg3C+31qmpAuYMtKLv3yTb3YV0CbuF5U0Av26CmX0v5R5JeUjgRvCEkiZarf
 aBMSlFslrdRNlcl6FVJAeUxaGI039w4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-KEg4M4H6MeC_lAu2jbAKhQ-1; Mon, 31 Oct 2022 08:35:31 -0400
X-MC-Unique: KEg4M4H6MeC_lAu2jbAKhQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o13-20020adfa10d000000b00232c00377a0so3024469wro.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rkF+SCblyXcNQKarHtp1viFvsuetH0NT2rsz6W3c7zU=;
 b=syabMT+LOw+dwm/F4GqbQoyiAhXztiO3SXb0ST4/Be0S6uwiM3OPlgzwC3/AmYSDar
 Bfkgp323QMQjGcgZYbhcRAwoDoRRGkgdsI4RehQxYSEec6qyqyqnmR8N/+uEzQNZVbZh
 2j4M9NvJJdtu5uMPE2qEkgmFteHhv9yTTfMRbl53KQfVMibFsqqpM0Pd9A8c7SFHvmjC
 tFyKkBaan1d06LOk1RnI0GO7uwAF0lkseQPFivXvga2JZ8A0aD1kmjj2YsVQIKtrESsh
 TlB9XMuuWX417rOFNnyB4/7XaXCyVcJtyqKD+lBY+H7ZD7QNzP8kkaeT01Qf1v6h6smc
 0BvQ==
X-Gm-Message-State: ACrzQf2yd2wdlgMibx/72NLfwDYcao5TMhcIxu8QJEubhQ13u6rp7bHP
 C0rYf+JHKnw1yAo1pXYt5HIwXf/UIwtyvWENrjSd/35UDgIRIBhu25OjFrz7Q1juxZZioHu8tOZ
 A5FnGnNTIjA4RgWw=
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr8019853wri.138.1667219730310; 
 Mon, 31 Oct 2022 05:35:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FCYKRvNJ6kn+RE2JcQzlYXvnwloMICcelMfl2q9F667IEkGS9VFWWIZxdGtlblS/79G80WA==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr8019843wri.138.1667219730087; 
 Mon, 31 Oct 2022 05:35:30 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00228d52b935asm7046128wrq.71.2022.10.31.05.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:35:29 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:35:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 4/4] vhost: convert byte order on avail_event read
Message-ID: <20221031083449-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-5-eperezma@redhat.com>
 <a08bc5b7-8481-49f7-c4fb-a4c780783e5b@linaro.org>
 <CAJaqyWerZzwFK01+rrdp-dHqFAmrUx-3PYfK+VGY3zGRDOwJBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWerZzwFK01+rrdp-dHqFAmrUx-3PYfK+VGY3zGRDOwJBw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 09:29:53AM +0100, Eugenio Perez Martin wrote:
> On Sat, Oct 29, 2022 at 12:53 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > On 28/10/22 18:02, Eugenio Pérez wrote:
> > > This causes errors on virtio modern devices on big endian hosts
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > index 18a49e1ecb..3131903edd 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -231,7 +231,8 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> > >           size_t num = svq->vring.num;
> > >           uint16_t *avail_event = (uint16_t *)&svq->vring.used->ring[num];
> > >
> >
> >    uint16_t avail_event = virtio_lduw_p(svq->vdev,
> >                                         &svq->vring.used->ring[num]);
> >    needs_kick = vring_need_event(avail_event,
> >                                  svq->shadow_avail_idx,
> >                                  svq->shadow_avail_idx - 1);
> >
> 
> It would work, but just because all vrings must be little endian for
> the moment. If we support legacy drivers on a big endian host and
> guest in the future, it would not work.
> 
> virtio_ld and virtio_st handle the conversions between the guest and
> the emulated device in qemu, but this conversion is between qemu
> shadow vring and the vdpa device (assuming modern, little endian for
> the moment).
> 
> Right now the feature set must be the same, but it could not be that
> way in the future.
> 
> Thanks!


I don't think this works  legacy and virtio data path are similar but
not similar enough to allow switches through svq alone.


> > > -        needs_kick = vring_need_event(*avail_event, svq->shadow_avail_idx,
> > > +        needs_kick = vring_need_event(le16_to_cpu(*avail_event),
> > > +                                      svq->shadow_avail_idx,
> > >                                         svq->shadow_avail_idx - 1);
> > >       } else {
> > >           needs_kick = !(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY);
> >


