Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AE696C68
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzi7-0007z9-CF; Tue, 14 Feb 2023 13:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRzhs-0007ym-76
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRzhq-00005J-PR
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676398025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gY0GAokGiU7RquTx03t4V826NV2prFXVl2eWuTSP1D4=;
 b=CIjLTNQS/rlSIRllQ/LYApkO3k4n3UM5M2j+xgFBpmKFLZqknv9GBXdS0DJ4aXNKUNvgd8
 ajkE1aNsKBk7tv7W9gRUZzgDCVbAMeSitthNYZvO8qab5HiyLWwh3XhkxBhdFGiAK1Ln1L
 iChbiH3R9AqP7Um+hdLVreZNDyFwBqs=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-sytrVwNJN_SHvfMHiIwvrA-1; Tue, 14 Feb 2023 13:07:04 -0500
X-MC-Unique: sytrVwNJN_SHvfMHiIwvrA-1
Received: by mail-yb1-f197.google.com with SMTP id
 a4-20020a5b0004000000b006fdc6aaec4fso16763168ybp.20
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gY0GAokGiU7RquTx03t4V826NV2prFXVl2eWuTSP1D4=;
 b=gHKMBxaCqR3efXRkohn0imyn+1wBJNdU8/U4c/bU+BQzYmwdkOVMDG7/oMPpqca34W
 qg60DWM53gVG7rPinxrCjFKGdqaMx93jVHapcQiRd6r/Pnbh77IeDlbJExXD1cfeFxoB
 JvknQQzBsxwsZj1Joy8XinGVUUGkR86BKhY+4Xhg2YiixK0ZjUFH0oNYSLDIms0oN4Eb
 vNTLJ2LIYymbAY+eeWir1QknblZ8Bj1z3eMKSTkl/niOJIpZFMAH4kXUBT3rZF9qHx+s
 WcqQG+4ax4JbPgoVXztOToA0MfgQvWx4sTlnMNJj8oFXeGo8UCKYgBRseF9+/rS5JIOf
 lL6g==
X-Gm-Message-State: AO0yUKU7wgW0fTHqb3wowIFZ9DZrWUGB71P1ULd3F1r5p6tf0r/50Lvm
 FKw63JYwc7iwgUlOF98YyfU/Lc26wNmqtNwGM17ggf07G2ZOPfg//v4RetxUlu8DgXhZX4HT3bv
 xRrY1zqsrNuRW3Qzfy/4UZ/KI1rUra4I=
X-Received: by 2002:a0d:e944:0:b0:52e:db9c:9ef2 with SMTP id
 s65-20020a0de944000000b0052edb9c9ef2mr281346ywe.269.1676398022671; 
 Tue, 14 Feb 2023 10:07:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8iEajEYONGdXU0xraunuaQIT7ssF7ehXkTh9tBtMlC6L0VQbR++NeHdvl+n7w1jcNZOksU9GmPzluJCi1JxBA=
X-Received: by 2002:a0d:e944:0:b0:52e:db9c:9ef2 with SMTP id
 s65-20020a0de944000000b0052edb9c9ef2mr281342ywe.269.1676398022419; Tue, 14
 Feb 2023 10:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-10-eperezma@redhat.com>
 <0434d44b-f742-3cd8-d84c-fa940b59cfd9@oracle.com>
In-Reply-To: <0434d44b-f742-3cd8-d84c-fa940b59cfd9@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 14 Feb 2023 19:06:26 +0100
Message-ID: <CAJaqyWdeiFaD_bU6tR_2bY9emu=70RaJ9pYNAMF+YpypsyXzLg@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] vdpa net: block migration if the device has CVQ
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson <snelson@pensando.io>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>
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

On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 2/8/2023 1:42 AM, Eugenio P=C3=A9rez wrote:
> > Devices with CVQ needs to migrate state beyond vq state.  Leaving this
> > to future series.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index bca13f97fd..309861e56c 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -955,11 +955,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >       }
> >
> >       if (has_cvq) {
> > +        VhostVDPAState *s;
> > +
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                    vdpa_device_fd, i, 1, false,
> >                                    opts->x_svq, iova_range);
> >           if (!nc)
> >               goto err;
> > +
> > +        s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +        error_setg(&s->vhost_vdpa.dev->migration_blocker,
> > +                   "net vdpa cannot migrate with MQ feature");
> Not sure how this can work: migration_blocker is only checked and gets
> added from vhost_dev_init(), which is already done through
> net_vhost_vdpa_init() above. Same question applies to the next patch of
> this series.
>

Good catch, fixing in v3.

Thanks!


