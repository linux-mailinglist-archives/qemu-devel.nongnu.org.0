Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18267B65D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 16:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKi54-0000ED-Iy; Wed, 25 Jan 2023 10:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pKi50-0000Dg-L7
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:52:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pKi4x-0006Mk-4Z
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674661969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzIiUG0pxgtP6W9XpsukXYGxB4pJxg8WndfMvOqeHCE=;
 b=M+0c3J+STa1Rihe9fvw3PBaE7lUbF6mvzx8bnkJSPM+wd7ZZyV6ZpS7s6Id0XHv5jNX4mp
 UI2exo8L6cWTo4BeXdnrjDjl74AfpDNVdXJX1WQ2uzW3tvwetVPaPq20JRB49+50oh+8Jl
 LQvBhWioHkjwVkgE0SzTW1XNt3dD5Vc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-NT0h22L4OxKfrjvUNkubhA-1; Wed, 25 Jan 2023 10:52:46 -0500
X-MC-Unique: NT0h22L4OxKfrjvUNkubhA-1
Received: by mail-yb1-f198.google.com with SMTP id
 y66-20020a253245000000b007cb4f1e3e57so20058288yby.8
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 07:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AzIiUG0pxgtP6W9XpsukXYGxB4pJxg8WndfMvOqeHCE=;
 b=tQ/7fBMjAIZ3LYCElejpmeX/bj9/+D/pXVMHbnDsshbUvcl5heop9X6ye5c4Wo4HbP
 BRV7oZ9T7t6HLHLHVTFBODCBMnFt/X2Is1WcNQLMc9o3y3oHEfdDEXRFw/+o6JMmOTii
 c4URsvQQvq160nF/pxuSv2rQUv/04XbdQr8++VvoS3a/sfmg9ozkZYwPaAm+ek5kzY7w
 RRYoXgP7zhkxYV/S050dHkq5YHkURYX3ZBaWo5TLU5M9euIhH3RFdh0meblbHCltFUnr
 0zSoPvZWEX4WN3Q20xqI9gwokXWqcTFeCW50oQeHEaMVU8jJHQV4MPbIeOWPdgkysPM6
 ZV0w==
X-Gm-Message-State: AFqh2koSMTdY8s7rr15SHSN7UZAP6PTax++mm/gQoMhGZt1Sp72nGEgo
 +zlAhG1Zm1slYAqPf8bFFfI2S6XSXqOsHZF5I0tIloRmb1zh7oEOmhSjm7505RSkiCYCaapbOtl
 /QVy7l17K0IkxyCkkJW1i2BOjqPhJ6Ns=
X-Received: by 2002:a0d:ff42:0:b0:4e0:8133:2a5a with SMTP id
 p63-20020a0dff42000000b004e081332a5amr3626897ywf.187.1674661965958; 
 Wed, 25 Jan 2023 07:52:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcOYRxXSP11zvAV4i5gUKFqoFYBA+lIvqPdY6ZGuWJlhd6cqwfBg9mpOIcAlJmggy9IDmfR+7HLQSMiFhp1mw=
X-Received: by 2002:a0d:ff42:0:b0:4e0:8133:2a5a with SMTP id
 p63-20020a0dff42000000b004e081332a5amr3626890ywf.187.1674661965779; Wed, 25
 Jan 2023 07:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20230124161159.2182117-1-eperezma@redhat.com>
 <m2y1pq1xy9.fsf@oracle.com>
In-Reply-To: <m2y1pq1xy9.fsf@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 25 Jan 2023 16:52:09 +0100
Message-ID: <CAJaqyWfcftb69Hh5O7gQqUZ6aK+wKsP3p3rquSjbr8avnR-prQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: clear guest_announce feature if no cvq backend
To: David Edmondson <david.edmondson@oracle.com>
Cc: qemu-devel@nongnu.org, leiyang@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, gautam.dawar@amd.com,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Jan 25, 2023 at 4:20 PM David Edmondson
<david.edmondson@oracle.com> wrote:
>
> On Tuesday, 2023-01-24 at 17:11:59 +01, Eugenio P=C3=A9rez wrote:
> > Since GUEST_ANNOUNCE is emulated the feature bit could be set without
> > backend support.  This happens in the vDPA case.
> >
> > However, backend vDPA parent may not have CVQ support.  This causes an
> > incoherent feature set, and the driver may refuse to start.  This
> > happens in virtio-net Linux driver.
>
> Could you now simplify the tests in virtio_net_announce() and
> virtio_net_post_load_device() to look only for the presence of
> GUEST_ANNOUNCE, given that you can now presume that it implies CTRL_VQ?
>

That's a good question. As far as I know qemu emits an error if only
GUEST_ANNOUNCE is given in a purely emulated device.

At this moment vhost-kernel and vhost-vdpa do not handle it, but
vhost-user do. Would it be beneficial to preserve previous behavior
and passthrough the features? I guess not, so I think we could
simplify those functions on top of this series.

> But anyway:
>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>

Thanks for the review!

> > This may be solved differently in the future.  Qemu is able to emulate =
a
> > CVQ just for guest_announce purposes, helping guest to notify the new
> > location with vDPA devices that does not support it.  However, this is
> > left as a TODO as it is way more complex to backport.
> >
> > Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
> > driver and migrating it with x-svq=3Don.
> >
> > Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE i=
n vhost-vdpa")
> > Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/virtio-net.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 3ae909041a..09d5c7a664 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevi=
ce *vdev, uint64_t features,
> >          features |=3D (1ULL << VIRTIO_NET_F_MTU);
> >      }
> >
> > +    /*
> > +     * Since GUEST_ANNOUNCE is emulated the feature bit could be set w=
ithout
> > +     * enabled. This happens in the vDPA case.
> > +     *
> > +     * Make sure the feature set is not incoherent, as the driver coul=
d refuse
> > +     * to start.
> > +     *
> > +     * TODO: QEMU is able to emulate a CVQ just for guest_announce pur=
poses,
> > +     * helping guest to notify the new location with vDPA devices that=
 does not
> > +     * support it.
> > +     */
> > +    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_=
VQ)) {
> > +        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
> > +    }
> > +
> >      return features;
> >  }
> --
> Why stay in college? Why go to night school?
>


