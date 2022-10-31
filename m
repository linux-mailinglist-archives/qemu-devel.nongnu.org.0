Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA82613191
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:17:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPyr-0004GQ-Ow; Mon, 31 Oct 2022 04:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opPyp-0004FR-6B
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opPyn-0006vA-GE
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667204228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zemxudhpWNq/8wTw2p3KWiAHcdZK7DAp42H4oj5YVlE=;
 b=SXkui31LtqHnrwj1/bF5CJONb5i3ClGW/EMw/TkqalZ5XJ5sfWFTFhGNh6xHBdMh74kEVA
 J2RCuBOX+B1cUOWfuNrO4FNkvlbbN+jEjx+qrjgYLSSLTJhbyioxXB++iG/r2ibyhlR7Iq
 ++da54l0DXvyMapAJJUbERM46LenkTc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-KmyZI-GjOyWlHk_y-U25mw-1; Mon, 31 Oct 2022 04:17:06 -0400
X-MC-Unique: KmyZI-GjOyWlHk_y-U25mw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a1c3b07000000b003c5e6b44ebaso3146430wma.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zemxudhpWNq/8wTw2p3KWiAHcdZK7DAp42H4oj5YVlE=;
 b=LkJe1Op5Qu795eXJMau9vX9wud4w+LHn1z79wibF2qoGLWpzNrkgPqbZzlEcf5gMoo
 ztCx3fCOuHRSqEzCygaW3biiUvJij1kI0eG9hgGwv6PKIJTos+Dkfs0adpi3WZtyaPjB
 8UjrA+TZ0SvEoWZlG3KvPmrESrH4+1uEZQsiCrWv+kYnHXea7QIfjBqoV0D81707vWAt
 bdM4E2G1A5tTYpYpgWL2EROTKin0YlpwoTzCt9SaY8SWVS31TvfxZfWZVSA0TIun+1ST
 BIJ9pfhZ4MRg3Wf1w82DeUwxAiIMxA7x26VXxaEEDV5bL0xY0GZAuSivl0fSms0QjAFi
 taXw==
X-Gm-Message-State: ACrzQf1asyWHLUiBrLiBC9+Q3zRCJfaZSObQeCbl8x0ry+sdbwWiNk8G
 bfIsmcPx0CROBy5a2HirJe+0PFWSaJg18DC12Xr7yc2xDmT7eqK2cVrXkXuFMswsbPhR4U63NnM
 8hKgiGHMwISDtz5I=
X-Received: by 2002:adf:fe8e:0:b0:236:6860:e55a with SMTP id
 l14-20020adffe8e000000b002366860e55amr6834250wrr.105.1667204225556; 
 Mon, 31 Oct 2022 01:17:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5aeH19nE1i4I1XnQ8CTt0B21vU7zRQYOL7jwXPXVna3s0SkoWVTdCVx4a2XCuPDiMTnXNVtw==
X-Received: by 2002:adf:fe8e:0:b0:236:6860:e55a with SMTP id
 l14-20020adffe8e000000b002366860e55amr6834237wrr.105.1667204225346; 
 Mon, 31 Oct 2022 01:17:05 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v10-20020adfedca000000b002366a624bd4sm6233739wro.28.2022.10.31.01.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 01:17:04 -0700 (PDT)
Date: Mon, 31 Oct 2022 04:17:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Message-ID: <20221031041527-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 12:48:43AM +0200, Philippe Mathieu-Daudé wrote:
> On 28/10/22 18:02, Eugenio Pérez wrote:
> > This causes errors on virtio modern devices on big endian hosts
> > 
> > Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > index 70766ea740..467099f5d9 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
> >   {
> >       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> >           uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
> > -        *used_event = svq->shadow_used_idx;
> > +        *used_event = cpu_to_le16(svq->shadow_used_idx);
> 
> This looks correct, but what about:
> 
>            virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);


Philippe thanks for review but this comment isn't all that clear.
I think you meant something like:
	this won't handle endian-ness for legacy virtio devices
	on BE correctly. I think  virtio_stw_p would be better.

which would make sense.

Yes contributors should document motivation for changes but so
should reviewers.
	

> >       } else {
> >           svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> >       }


