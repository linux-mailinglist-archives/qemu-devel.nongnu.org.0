Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE944C0E11
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 09:11:15 +0100 (CET)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMmjy-0005jV-0U
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 03:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMmfo-0004I8-ML
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMmfk-0000dI-JS
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645603611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SeAK0uxd5XYiqwHT4k1DP1uJOR6CFcVVzPdsL4q4Y48=;
 b=A0sPVBdVOF3tm+ayqcyR6cKXs+CcYV+bqr2vYRV0b/N8cUGS7a8HVvRan8Cns7OZRdZdBP
 Qu1kdIsllV+kZrjCSlcsSGeVwFU0bHJHI/9fZn7+TIOC+YhUP9DWhnzLUs1zztWUaE5H9w
 S9KzEMpXQGFXZNiWN6lrQEdgjQvW9xg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-8RsymeJJOuia4z2paLiWGQ-1; Wed, 23 Feb 2022 03:06:49 -0500
X-MC-Unique: 8RsymeJJOuia4z2paLiWGQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 3-20020a0562140d0300b0042d7c7ac26aso2729601qvh.7
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 00:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SeAK0uxd5XYiqwHT4k1DP1uJOR6CFcVVzPdsL4q4Y48=;
 b=l9XYHQc+wZEOabrcOlrLXmt1arvKQxcEC90ChRWqjCj7UkYbNNuqr8MA2pPe7+VGj3
 7QNOwCKugEYKLxFvJ0uUiokeFU103/jZKQzyEs91XNCg9j/s1SjEsfrIWe6qt41F10bY
 lihQt3aM3yonDWcymfyBUqI56Vwd1/4nzr7vL9dQ2i12yqTrYRUzB3xp891BD8+hiyKX
 LQjnjD9ozB1Oz1w7fYs3Cdj72z7GnGG3y1OgZqT0M3jf4OoX7Nzyx2/y6LmVDb4E79aE
 IorHFon5SWD94a9mJJdEUaqhL1TF6Z3NjvYBGEZF9q4ypRkN+FGzvepmd7PW43i8M0fQ
 dLCA==
X-Gm-Message-State: AOAM533zbzi+sdzSqV2fbvuiIib5TwlZP6v3GbFWQW5O3UWO5H66TjUt
 Ba08zydeJNWVaKehvjU98xrDF92j9hELLADzEULu7704O9OupYi7yile6GlsByegGqFIZ3oNDw0
 mWPElPvbAMjq6hvJxJvtgaWZrWon4tlI=
X-Received: by 2002:a05:622a:1301:b0:2de:82c5:8409 with SMTP id
 v1-20020a05622a130100b002de82c58409mr340439qtk.403.1645603609271; 
 Wed, 23 Feb 2022 00:06:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx09IfIMH/ozu1zdVV0wBk4Fq8/XIPttfMIXq4/6VbfNEDu+lPjTB3RKVdB3MavrMbO1mSn9zK4mCh0dzB+UIY=
X-Received: by 2002:a05:622a:1301:b0:2de:82c5:8409 with SMTP id
 v1-20020a05622a130100b002de82c58409mr340412qtk.403.1645603608971; Wed, 23 Feb
 2022 00:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
 <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
 <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
 <CAJaqyWcvWjPas0=xp+U-c-kG+e6k73jg=C4phFD7S-tZY=niSQ@mail.gmail.com>
 <CACGkMEtbd9RsE9f-HLnwmhJEFsK++uBHnqG4N0c6qJG0PxDdzw@mail.gmail.com>
 <CAJaqyWdhHmD+tB_bY_YEMnBU1p7-LW=LP8f+3e_ZXDcOfSRiNA@mail.gmail.com>
 <0f0204f1-8b7f-a21e-495e-24443a63f026@redhat.com>
 <CAJaqyWfFC4SgxQ4zQeHgtDDJSd0tBa-W4HmtW0UASA2cVDWDUg@mail.gmail.com>
 <CACGkMEukmf35163EDFQ2YQo2g2N0Diby7ffr9=UmOwGPEKj-Eg@mail.gmail.com>
In-Reply-To: <CACGkMEukmf35163EDFQ2YQo2g2N0Diby7ffr9=UmOwGPEKj-Eg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 23 Feb 2022 09:06:13 +0100
Message-ID: <CAJaqyWds=97TjEpORiqhsj57KNxJ482jwcRS8TN59a4aank7-w@mail.gmail.com>
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Feb 23, 2022 at 4:47 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Feb 22, 2022 at 4:06 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Tue, Feb 22, 2022 at 8:41 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2022/2/17 =E4=B8=8B=E5=8D=884:22, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> > > > On Thu, Feb 17, 2022 at 7:02 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > >> On Wed, Feb 16, 2022 at 11:54 PM Eugenio Perez Martin
> > > >> <eperezma@redhat.com> wrote:
> > > >>> On Tue, Feb 8, 2022 at 9:25 AM Jason Wang <jasowang@redhat.com> w=
rote:
> > > >>>>
> > > >>>> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:45, Eugenio Perez Martin =
=E5=86=99=E9=81=93:
> > > >>>>> On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com=
> wrote:
> > > >>>>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez=
 =E5=86=99=E9=81=93:
> > > >>>>>>> SVQ is able to log the dirty bits by itself, so let's use it =
to not
> > > >>>>>>> block migration.
> > > >>>>>>>
> > > >>>>>>> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features=
 if SVQ is
> > > >>>>>>> enabled. Even if the device supports it, the reports would be=
 nonsense
> > > >>>>>>> because SVQ memory is in the qemu region.
> > > >>>>>>>
> > > >>>>>>> The log region is still allocated. Future changes might skip =
that, but
> > > >>>>>>> this series is already long enough.
> > > >>>>>>>
> > > >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >>>>>>> ---
> > > >>>>>>>     hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
> > > >>>>>>>     1 file changed, 20 insertions(+)
> > > >>>>>>>
> > > >>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > >>>>>>> index fb0a338baa..75090d65e8 100644
> > > >>>>>>> --- a/hw/virtio/vhost-vdpa.c
> > > >>>>>>> +++ b/hw/virtio/vhost-vdpa.c
> > > >>>>>>> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(stru=
ct vhost_dev *dev, uint64_t *features)
> > > >>>>>>>         if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > > >>>>>>>             /* Filter only features that SVQ can offer to gue=
st */
> > > >>>>>>>             vhost_svq_valid_guest_features(features);
> > > >>>>>>> +
> > > >>>>>>> +        /* Add SVQ logging capabilities */
> > > >>>>>>> +        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > >>>>>>>         }
> > > >>>>>>>
> > > >>>>>>>         return ret;
> > > >>>>>>> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(str=
uct vhost_dev *dev,
> > > >>>>>>>
> > > >>>>>>>         if (v->shadow_vqs_enabled) {
> > > >>>>>>>             uint64_t dev_features, svq_features, acked_featur=
es;
> > > >>>>>>> +        uint8_t status =3D 0;
> > > >>>>>>>             bool ok;
> > > >>>>>>>
> > > >>>>>>> +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, =
&status);
> > > >>>>>>> +        if (unlikely(ret)) {
> > > >>>>>>> +            return ret;
> > > >>>>>>> +        }
> > > >>>>>>> +
> > > >>>>>>> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> > > >>>>>>> +            /*
> > > >>>>>>> +             * vhost is trying to enable or disable _F_LOG, =
and the device
> > > >>>>>>> +             * would report wrong dirty pages. SVQ handles i=
t.
> > > >>>>>>> +             */
> > > >>>>>> I fail to understand this comment, I'd think there's no way to=
 disable
> > > >>>>>> dirty page tracking for SVQ.
> > > >>>>>>
> > > >>>>> vhost_log_global_{start,stop} are called at the beginning and e=
nd of
> > > >>>>> migration. To inform the device that it should start logging, t=
hey set
> > > >>>>> or clean VHOST_F_LOG_ALL at vhost_dev_set_log.
> > > >>>>
> > > >>>> Yes, but for SVQ, we can't disable dirty page tracking, isn't it=
? The
> > > >>>> only thing is to ignore or filter out the F_LOG_ALL and pretend =
to be
> > > >>>> enabled and disabled.
> > > >>>>
> > > >>> Yes, that's what this patch does.
> > > >>>
> > > >>>>> While SVQ does not use VHOST_F_LOG_ALL, it exports the feature =
bit so
> > > >>>>> vhost does not block migration. Maybe we need to look for anoth=
er way
> > > >>>>> to do this?
> > > >>>>
> > > >>>> I'm fine with filtering since it's much more simpler, but I fail=
 to
> > > >>>> understand why we need to check DRIVER_OK.
> > > >>>>
> > > >>> Ok maybe I can make that part more clear,
> > > >>>
> > > >>> Since both operations use vhost_vdpa_set_features we must just fi=
lter
> > > >>> the one that actually sets or removes VHOST_F_LOG_ALL, without
> > > >>> affecting other features.
> > > >>>
> > > >>> In practice, that means to not forward the set features after
> > > >>> DRIVER_OK. The device is not expecting them anymore.
> > > >> I wonder what happens if we don't do this.
> > > >>
> > > > If we simply delete the check vhost_dev_set_features will return an
> > > > error, failing the start of the migration. More on this below.
> > >
> > >
> > > Ok.
> > >
> > >
> > > >
> > > >> So kernel had this check:
> > > >>
> > > >>          /*
> > > >>           * It's not allowed to change the features after they hav=
e
> > > >>           * been negotiated.
> > > >>           */
> > > >> if (ops->get_status(vdpa) & VIRTIO_CONFIG_S_FEATURES_OK)
> > > >>          return -EBUSY;
> > > >>
> > > >> So is it FEATURES_OK actually?
> > > >>
> > > > Yes, FEATURES_OK seems more appropriate actually so I will switch t=
o
> > > > it for the next version.
> > > >
> > > > But it should be functionally equivalent, since
> > > > vhost.c:vhost_dev_start sets both and the setting of _F_LOG_ALL can=
not
> > > > be concurrent with it.
> > >
> > >
> > > Right.
> > >
> > >
> > > >
> > > >> For this patch, I wonder if the thing we need to do is to see whet=
her
> > > >> it is a enable/disable F_LOG_ALL and simply return.
> > > >>
> > > > Yes, that's the intention of the patch.
> > > >
> > > > We have 4 cases here:
> > > > a) We're being called from vhost_dev_start, with enable_log =3D fal=
se
> > > > b) We're being called from vhost_dev_start, with enable_log =3D tru=
e
> > >
> > >
> > > And this case makes us can't simply return without calling vhost-vdpa=
.
> > >
> >
> > It calls because {FEATURES,DRIVER}_OK is still not set at that point.
> >
> > >
> > > > c) We're being called from vhost_dev_set_log, with enable_log =3D f=
alse
> > > > d) We're being called from vhost_dev_set_log, with enable_log =3D t=
rue
> > > >
> > > > The way to tell the difference between a/b and c/d is to check if
> > > > {FEATURES,DRIVER}_OK is set. And, as you point out in previous mail=
s,
> > > > F_LOG_ALL must be filtered unconditionally since SVQ tracks dirty
> > > > memory through the memory unmapping, so we clear the bit
> > > > unconditionally if we detect that VHOST_SET_FEATURES will be called
> > > > (cases a and b).
> > > >
> > > > Another possibility is to track if features have been set with a bo=
ol
> > > > in vhost_vdpa or something like that. But it seems cleaner to me to
> > > > only store that in the actual device.
> > >
> > >
> > > So I suggest to make sure codes match the comment:
> > >
> > >          if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> > >              /*
> > >               * vhost is trying to enable or disable _F_LOG, and the =
device
> > >               * would report wrong dirty pages. SVQ handles it.
> > >               */
> > >              return 0;
> > >          }
> > >
> > > It would be better to check whether the caller is toggling _F_LOG_ALL=
 in
> > > this case.
> > >
> >
> > How to detect? We can save feature flags and compare, but ignoring all
> > set_features after FEATURES_OK seems simpler to me.
>
> Something like:
>
> (status ^ status_old =3D=3D _F_LOG_ALL) ?
>

s/status/features/ ?

> It helps us to return errors on wrong features set during DRIVER_OK.
>

Do you mean to return errors in case of toggling other features than
_F_LOG_ALL, isn't it? That's interesting actually, but it seems it
forces vhost_vdpa to track acked_features too.

Actually, it seems to me vhost_dev->acked_features will retain the bad
features even on error. I'll investigate it.

Thanks!


> Thanks
>
> >
> > Would changing the comment work? Something like "set_features after
> > _S_FEATURES_OK means vhost is trying to enable or disable _F_LOG, and
> > the device would report wrong dirty pages. SVQ handles it."
> >


