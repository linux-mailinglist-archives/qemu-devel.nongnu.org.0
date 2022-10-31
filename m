Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F8613671
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTzK-0002yz-CU; Mon, 31 Oct 2022 08:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opTyp-0002nx-AK
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opTyn-00042W-Du
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxzwQNDITHzZdsQo2QhCq1SGicLDaVMAZXaPLuFp+nw=;
 b=Qo1+/fYPgqB3G+XUxDh8w3SZ0neVoHFN6c8SPfafwOE7CIj2beP15ONhmQtnhPAuhUQH7G
 0btfD8fJwAqqO7qjdn1OYJuJPicsx16pezdg08rsqXHLp0Mn/y2CgHkDBkwq/NJUKWsR36
 Q1kjOxJ3i68mV0guYpDNEaQDpqOkVXA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-qPhPFJQzMlm5VX6xCRvKFQ-1; Mon, 31 Oct 2022 08:33:23 -0400
X-MC-Unique: qPhPFJQzMlm5VX6xCRvKFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso5249105wme.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SxzwQNDITHzZdsQo2QhCq1SGicLDaVMAZXaPLuFp+nw=;
 b=rlm/AFXzzqgnuxjQ0RVBPk1Yerv2xaJr0etUdBfUtY218YQ66p4wx2+nRisgHt/Nhn
 aJ47B+cM6mxEW1tiZK6Nt30i+dU4iyxbodqkhk48vTLeM2XdDRP5B7yFmC9uU+8hCuFu
 KVEdhE1Dk+2sO2N4rWDEdEDBAWS/4DOAns1vUoykD8STvMctDFjnJGOR3QFHq2TMPN3E
 hEajGG/NlOlO6Jbh5B3CrbnJJpVYMk41rXKJvNimVfMd6qxADFczZqum5K7r8JXaZZqM
 go3TWbGavNtraD5ndrZx3xF8MVEv+ttHZTey/IXuckRJkrCm7E8P6hRP4tTosG0cFYID
 ja3A==
X-Gm-Message-State: ACrzQf0GqjCXh8sYUZIEsp3wI6aK+Tzc38Zll6gN1IXyWBXDTsUzLycZ
 W4QRB8cvXxN1jnJ94A5b84Y03vC9LWpMqIOh/EpMC8YFM7msi0Mu6ldb+if7vRhLl1CiWYdwZ4o
 6C0kXS5R2HLF96JM=
X-Received: by 2002:adf:cd87:0:b0:236:6999:240 with SMTP id
 q7-20020adfcd87000000b0023669990240mr7947482wrj.97.1667219601877; 
 Mon, 31 Oct 2022 05:33:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WjBsSF5fTdtqOj+rmUwlmli2AUyX4w2MXKkEDPPowped6rTWq11KW2f2gQwjVyRZ7X7zbbg==
X-Received: by 2002:adf:cd87:0:b0:236:6999:240 with SMTP id
 q7-20020adfcd87000000b0023669990240mr7947462wrj.97.1667219601591; 
 Mon, 31 Oct 2022 05:33:21 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003cf568a736csm5195140wmq.20.2022.10.31.05.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:33:21 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:33:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Message-ID: <20221031083210-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
 <CAJaqyWdj2OPyjZ1s9jK1botrVEHd2+K+Q783soLtmf5WVnArFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdj2OPyjZ1s9jK1botrVEHd2+K+Q783soLtmf5WVnArFg@mail.gmail.com>
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

On Mon, Oct 31, 2022 at 09:54:34AM +0100, Eugenio Perez Martin wrote:
> On Sat, Oct 29, 2022 at 12:48 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > On 28/10/22 18:02, Eugenio Pérez wrote:
> > > This causes errors on virtio modern devices on big endian hosts
> > >
> > > Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > index 70766ea740..467099f5d9 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
> > >   {
> > >       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > >           uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
> > > -        *used_event = svq->shadow_used_idx;
> > > +        *used_event = cpu_to_le16(svq->shadow_used_idx);
> >
> > This looks correct, but what about:
> >
> >             virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);
> >
> 
> Hi Philippe,
> 
> I think this has the same answer as [1], the endianness conversion
> from the guest to the host may not be the same as the one needed from
> qemu SVQ to the vdpa device. Please let me know if it is not the case.
> 
> Thanks!
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg06081.html

So considering legacy, i do not belive you can make a legacy
device on top of modern one using SVQ alone.

So I'd say SVQ should follow virtio endian-ness, not LE.


> > >       } else {
> > >           svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > >       }
> >


