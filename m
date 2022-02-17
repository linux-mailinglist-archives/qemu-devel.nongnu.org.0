Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324AC4B98B9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:04:48 +0100 (CET)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKZuI-0005zW-NR
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:04:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nKZs1-0005Il-5t
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nKZrw-0005do-Va
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645077739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ43gSmtVUJMmgA5fIQo+GYRl7d1tlzDB8+T6/5SR7g=;
 b=MJh2w0/GJamhfY4UKhPti7KohjDvnqgu37GPWcU6umEQrESkwkHKvZyhUM7HjXSaOwLS10
 o4U8YGiIulVdaS3ODzqA8fbkCZ8g+2BqqyO6ZgwXz359xt2JuZdizRcuHNoWfD1xIU4j7W
 i4L2QRIVcrgZkaqpB86R9JiLg7IbuHQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-YaVTedRCOe29CCz5sE68Bw-1; Thu, 17 Feb 2022 01:02:18 -0500
X-MC-Unique: YaVTedRCOe29CCz5sE68Bw-1
Received: by mail-yb1-f197.google.com with SMTP id
 128-20020a251286000000b0062234a636b0so8798122ybs.16
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 22:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AJ43gSmtVUJMmgA5fIQo+GYRl7d1tlzDB8+T6/5SR7g=;
 b=JHTuwDpyv8FiDmSDHohi3h/tYhuG/hGI82ZPM5IR/ujvSfFiOqqaGnimKh+JkXf+WM
 FJZnAu3MPuQM8+NML3coj4ZC6m41VMdbiKOqKAgtbhIdvKRD0+VAtV0QCQJ7OcVs2lKh
 AdaCO2ZNcIMHEoTdHK0ND31N2fAmgyivznH8ANTFKc7NZjLdi4haMyzHBOAdKNkY5FSH
 haTvcQrFOf+ooX64S08VmHLqNqGqCGHbv5R+cBOslxqjbSIifj+hCu9HVOVEJZokU+xo
 0+/B+WPvsmHVAC+RirTU6xMzYBRy0wUZdFuBbMWLL9OYJGlkLWzaSFd66gxvKguOmRBv
 ZAig==
X-Gm-Message-State: AOAM532wl7DiDX3fxb1drzC96gwmxZIjUIgktfAOOYwVkzlZAZlgv+Tm
 FFhlrsp1FBbuqqF6bIcMEOhgYvUEH7fehEPZUqQhweyBSOhameBLRUL0PJkT2CIh2x1xSc+Vliz
 m6Q+kuzLqJaV7CJ8DSL0QL1pOR1XYsTE=
X-Received: by 2002:a81:c54a:0:b0:2d6:435a:5875 with SMTP id
 o10-20020a81c54a000000b002d6435a5875mr1188502ywj.181.1645077737485; 
 Wed, 16 Feb 2022 22:02:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWDR785zTtcjGEoamEsKqFytogOfPdl/ew1QqgL/zFAsqSiEZOt7izL9dDH41YrCUJp0By1t1R65bKo1jhMYY=
X-Received: by 2002:a81:c54a:0:b0:2d6:435a:5875 with SMTP id
 o10-20020a81c54a000000b002d6435a5875mr1188475ywj.181.1645077737156; Wed, 16
 Feb 2022 22:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
 <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
 <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
 <CAJaqyWcvWjPas0=xp+U-c-kG+e6k73jg=C4phFD7S-tZY=niSQ@mail.gmail.com>
In-Reply-To: <CAJaqyWcvWjPas0=xp+U-c-kG+e6k73jg=C4phFD7S-tZY=niSQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Feb 2022 14:02:05 +0800
Message-ID: <CACGkMEtbd9RsE9f-HLnwmhJEFsK++uBHnqG4N0c6qJG0PxDdzw@mail.gmail.com>
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:54 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Feb 8, 2022 at 9:25 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:45, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > > On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > >>> SVQ is able to log the dirty bits by itself, so let's use it to not
> > >>> block migration.
> > >>>
> > >>> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SV=
Q is
> > >>> enabled. Even if the device supports it, the reports would be nonse=
nse
> > >>> because SVQ memory is in the qemu region.
> > >>>
> > >>> The log region is still allocated. Future changes might skip that, =
but
> > >>> this series is already long enough.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> ---
> > >>>    hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
> > >>>    1 file changed, 20 insertions(+)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >>> index fb0a338baa..75090d65e8 100644
> > >>> --- a/hw/virtio/vhost-vdpa.c
> > >>> +++ b/hw/virtio/vhost-vdpa.c
> > >>> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vho=
st_dev *dev, uint64_t *features)
> > >>>        if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > >>>            /* Filter only features that SVQ can offer to guest */
> > >>>            vhost_svq_valid_guest_features(features);
> > >>> +
> > >>> +        /* Add SVQ logging capabilities */
> > >>> +        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > >>>        }
> > >>>
> > >>>        return ret;
> > >>> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vh=
ost_dev *dev,
> > >>>
> > >>>        if (v->shadow_vqs_enabled) {
> > >>>            uint64_t dev_features, svq_features, acked_features;
> > >>> +        uint8_t status =3D 0;
> > >>>            bool ok;
> > >>>
> > >>> +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &statu=
s);
> > >>> +        if (unlikely(ret)) {
> > >>> +            return ret;
> > >>> +        }
> > >>> +
> > >>> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> > >>> +            /*
> > >>> +             * vhost is trying to enable or disable _F_LOG, and th=
e device
> > >>> +             * would report wrong dirty pages. SVQ handles it.
> > >>> +             */
> > >>
> > >> I fail to understand this comment, I'd think there's no way to disab=
le
> > >> dirty page tracking for SVQ.
> > >>
> > > vhost_log_global_{start,stop} are called at the beginning and end of
> > > migration. To inform the device that it should start logging, they se=
t
> > > or clean VHOST_F_LOG_ALL at vhost_dev_set_log.
> >
> >
> > Yes, but for SVQ, we can't disable dirty page tracking, isn't it? The
> > only thing is to ignore or filter out the F_LOG_ALL and pretend to be
> > enabled and disabled.
> >
>
> Yes, that's what this patch does.
>
> >
> > >
> > > While SVQ does not use VHOST_F_LOG_ALL, it exports the feature bit so
> > > vhost does not block migration. Maybe we need to look for another way
> > > to do this?
> >
> >
> > I'm fine with filtering since it's much more simpler, but I fail to
> > understand why we need to check DRIVER_OK.
> >
>
> Ok maybe I can make that part more clear,
>
> Since both operations use vhost_vdpa_set_features we must just filter
> the one that actually sets or removes VHOST_F_LOG_ALL, without
> affecting other features.
>
> In practice, that means to not forward the set features after
> DRIVER_OK. The device is not expecting them anymore.

I wonder what happens if we don't do this.

So kernel had this check:

        /*
         * It's not allowed to change the features after they have
         * been negotiated.
         */
if (ops->get_status(vdpa) & VIRTIO_CONFIG_S_FEATURES_OK)
        return -EBUSY;

So is it FEATURES_OK actually?

For this patch, I wonder if the thing we need to do is to see whether
it is a enable/disable F_LOG_ALL and simply return.

Thanks

>
> Does that make more sense?
>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > Thanks!
> > >
> > >> Thanks
> > >>
> > >>
> > >>> +            return 0;
> > >>> +        }
> > >>> +
> > >>> +        /* We must not ack _F_LOG if SVQ is enabled */
> > >>> +        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > >>> +
> > >>>            ret =3D vhost_vdpa_get_dev_features(dev, &dev_features);
> > >>>            if (ret !=3D 0) {
> > >>>                error_report("Can't get vdpa device features, got (%=
d)", ret);
> >
>


