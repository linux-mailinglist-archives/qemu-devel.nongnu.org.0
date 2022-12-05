Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9008642241
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 05:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p234p-0003t1-5Y; Sun, 04 Dec 2022 23:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p234m-0003sj-U9
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:27:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p234l-0003Wt-0X
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670214450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbcGVI/a8cCCk76/ozHynDG2frE7HgfCuP3yIGq2vb4=;
 b=aFLwIHPEmvPgA8DUyfF82zfrCLZOw9PmortMtp4e1RMd2Tsm8IzuIA7AWzUJXsoHaJ1gHC
 tqwJ+6prnj3yMnCA7W/WP5A1yBviMq0/kXKm5orbhOoENFOheH8XaospsOGmE4EMRP7Fw6
 iJvHZa5vOmhCmwrjUZwNoXWRzYo3GIY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-Rhxrd8XMNgOjyKTXkA4tJg-1; Sun, 04 Dec 2022 23:27:29 -0500
X-MC-Unique: Rhxrd8XMNgOjyKTXkA4tJg-1
Received: by mail-ot1-f70.google.com with SMTP id
 37-20020a9d0c28000000b0066eae0252e4so1576019otr.14
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 20:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbcGVI/a8cCCk76/ozHynDG2frE7HgfCuP3yIGq2vb4=;
 b=NeACOmwpg5CAlQn3Quv0EhZt/ZLXve9UgVYW5x93/ep1CcEdmu9t3aTevRYCh8mUcE
 Ly+zLcmhZToestydXD1D+sZ2yUFgOt1V4ISAqZIHgF9nfCtn71gKuaWMICa9/1FKcd+H
 nsqPeIvyn2lL0e/BdX8W3HS5EvCX9TloeUbrgP2UIU5aQsAnT3c7tQAmj0n0FdfaR5Y7
 LR79k0cXENOskNgDzyS/PRNL7P9eFgN24nr4OBuyOFXyrh84qHTPqPgK37nmMI2uXaGZ
 DgwwOFioiChynPljQx3auy+vk8+aSQiwyroyVr6Y09tIm0dygUAHnAF49yPPnm13UlvV
 gnmg==
X-Gm-Message-State: ANoB5pkoHK+UD8G+/Z3ppI+nqZHsptGgbj5nWyYn753IsPtgyL6KnZBn
 ecthRRtkYVD5GCHeh1TwacL+Ov8M5kl9c4F6m+sbWTpwy+aw+g9rXSBRrXrqJf9qML4qwQt0vxT
 Adl52vBsxZfoayCUf2ZyQqiQJbvlcx3s=
X-Received: by 2002:a05:6808:2093:b0:35b:ded0:4164 with SMTP id
 s19-20020a056808209300b0035bded04164mr8786838oiw.280.1670214448325; 
 Sun, 04 Dec 2022 20:27:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5wH99rP5HEpqy1lkl7BV3O9azdwpuS3E984JqfnRDsMT9JiO/ciZMUsBMo/p5LkOYPRf4UlWLVvo0EDEnASY8=
X-Received: by 2002:a05:6808:2093:b0:35b:ded0:4164 with SMTP id
 s19-20020a056808209300b0035bded04164mr8786832oiw.280.1670214448138; Sun, 04
 Dec 2022 20:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
 <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
 <CAJaqyWfTp6QT1amL_724+UN_APgkG+dM28OEHE99v6aojSPU6A@mail.gmail.com>
 <CACGkMEsVN4jHkLojKekB1OAEvoTzMJzv+m4HNR6T8qJUC9VjTQ@mail.gmail.com>
 <CAJaqyWdX83jFpGy_qZ8d_07fvaVHJk3TqamoS7NVgkqJjX2X8g@mail.gmail.com>
In-Reply-To: <CAJaqyWdX83jFpGy_qZ8d_07fvaVHJk3TqamoS7NVgkqJjX2X8g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 5 Dec 2022 12:27:15 +0800
Message-ID: <CACGkMEs79=D7CEcRV7SEjLBxArerPDaC2eTodCkrCPcq8oj_Tg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
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

On Thu, Dec 1, 2022 at 5:29 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Dec 1, 2022 at 9:39 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 3:07 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Nov 30, 2022 at 8:02 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > Since this capability is emulated by qemu shadowed CVQ cannot for=
ward it
> > > > > to the device. Process all that command within qemu.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 2b4b85d8f8..8172aa8449 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(=
VhostShadowVirtqueue *svq,
> > > > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > > >                               s->cvq_cmd_out_buffer,
> > > > >                               vhost_vdpa_net_cvq_cmd_len());
> > > > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeo=
f(status));
> > > > > -    if (unlikely(dev_written < 0)) {
> > > > > -        goto out;
> > > > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL=
_ANNOUNCE) {
> > > > > +        /*
> > > > > +         * Guest announce capability is emulated by qemu, so don=
t forward to
> > > >
> > > > s/dont/don't/
> > > >
> > >
> > > I'll correct it, thanks!
> > >
> > > > > +         * the device.
> > > > > +         */
> > > > > +        dev_written =3D sizeof(status);
> > > > > +        *s->status =3D VIRTIO_NET_OK;
> > > >
> > > > I wonder if we should avoid negotiating ANNOUNCE with vDPA parents =
if
> > > > we do this?
> > > >
> > >
> > > I can re-check, but the next patch should avoid it.
> >
> > Kind of, it makes sure guest can always see _F_ANNOUNCE. But does it
> > prevent _F_ANNOUNCE from being negotiated?
> >
>
> It should go like:
> * vhost_net_ack_features calls vhost_ack_features with feature_bits =3D
> vdpa_feature_bits and features =3D guest acked features.
> vhost_ack_features stores in hdev->acked_features only the features
> that met features & bit_mask, so it will not store _F_ANNOUNCE.
> * vhost_vdpa_set_features is called from vhost_dev_set_features with
> features =3D dev->acked_features. Both functions can add features by
> themselves (VHOST_F_LOG_ALL, VIRTIO_F_IOMMU_PLATFORM), but no
> _F_ANNOUNCE.
>
> Still untested.

Ok.

>
> > > Even if
> > > negotiated, the parent should never set the announce status bit, sinc=
e
> > > we never tell the device is a destination device.
> >
> > That's the point, do we have such a guarantee? Or I wonder if there's
> > any parent that supports _F_ANNOUNCE if yes, how it is supposed to
> > work?
> >
>
> At the moment it is impossible to work since there is no support for
> config interrupt from the device. Even with config interrupt,
> something external from qemu should make the device enable the status
> bit, since the current migration protocol makes no difference between
> to be a migration destination and to start the device from scratch.
> Unless it enables the bit maliciously or by mistake.
>
> Just for completion, the current method works with no need of vdpa
> device config interrupt support thanks to being 100% emulated in qemu,
> which has the support of injecting config interrupts.

Ok, rethink this feature, I think I can find one use case for
_F_ANNOUNCE, that is, the migration is totally done through the vDPA
device (DPU) itself.

I think we can go forward and revisit this issue in the future.

Thanks

>
> Thanks!
>


