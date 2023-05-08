Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405896FA016
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 08:46:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvuc4-00012z-Lw; Mon, 08 May 2023 02:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvubw-00012m-0L
 for qemu-devel@nongnu.org; Mon, 08 May 2023 02:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvubs-000057-CR
 for qemu-devel@nongnu.org; Mon, 08 May 2023 02:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683528275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S71hY5FGkkTb523gGa8yhfMJhtUcXnqCiSgMrEqUKuE=;
 b=OAVZVRvSsqI2/+/XzusKZaLyUJZkC21vkpUvsOXaREfvk6vKdQghqa+/Lv1HrJXx9wsZQ8
 QxiZlH7tKF/c/Hg9Mbe6pxHvUMNPbX+0hyjKnSPoqt+wG6+YFhvWxxYfYPkbU3LB4lA4MY
 hw0QJSUGD3I5V+EjjKezkSn9UbVkkYc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-qglftHqcPBOJD8OCqM-z-w-1; Mon, 08 May 2023 02:44:34 -0400
X-MC-Unique: qglftHqcPBOJD8OCqM-z-w-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ad819ab909so7154251fa.0
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 23:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683528273; x=1686120273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S71hY5FGkkTb523gGa8yhfMJhtUcXnqCiSgMrEqUKuE=;
 b=OndJpojwPn8/xtH8Zjp2qK8QdaNSQTsCWnL8OQJAyjxToZYePwqADiSDIJmLniLS98
 Yiu6m67Di91pkfb3mdb/Edz2HZpG8EsKLDgnueTW34J4YbJiIfzGrXKv6JHC1QVSFy5F
 n4D4xJnfAQm7TsKQUpkowbOtM8DhsbeFOUC2x/SFIJwJ271QWAs/sq8lMTUTnIUENfry
 Sij4fxkzsD0aF+YUspClRuiLsXtEs7w1X/1BJEQWncCqe7Q4aTjbrV3C3OpfdX2eme9d
 Bs4IDFhWo2PSudxMnCU3jmA8EkSUQXdLyGfPbpHlPz/saCxku6obLf1t2y//ysHQvjTw
 TXyQ==
X-Gm-Message-State: AC+VfDysvOsoGoKl8c2hKIwnN0iQnh/9cU82PvqP145f27U0Z3KHjPrJ
 ebuFTK8RnH3h//gyCIoWV+CRJJIHnz4cUwytNYfIlzQ7sYT4KeflTJjhoXK6jir47D14cJQFf28
 FlFyPnXs1xDUgRODel2OUtotseGVEPbc=
X-Received: by 2002:a2e:8813:0:b0:2ac:6038:ece5 with SMTP id
 x19-20020a2e8813000000b002ac6038ece5mr2520370ljh.49.1683528272810; 
 Sun, 07 May 2023 23:44:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a18ACZBbG9awtDxF/JpkFGhPXIrfzpCMjdHPUr2dbxMCa44HdEZzA/8qQucjuBeixsD+e+1IFSUeGVbEZKoQ=
X-Received: by 2002:a2e:8813:0:b0:2ac:6038:ece5 with SMTP id
 x19-20020a2e8813000000b002ac6038ece5mr2520364ljh.49.1683528272503; Sun, 07
 May 2023 23:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <20230507020037-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230507020037-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 May 2023 14:44:21 +0800
Message-ID: <CACGkMEubjEr_CSxdq86jZsYY8a78L50N03=vnYzgOhKBNH29ag@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, May 7, 2023 at 2:01=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Sat, May 06, 2023 at 10:13:36AM +0800, Xuan Zhuo wrote:
> > On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9rez?=
=3D <eperezma@redhat.com> wrote:
> > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enabl=
es
> > > unconditionally vq reset feature as long as the device is emulated.
> > > This makes impossible to actually disable the feature, and it causes
> > > migration problems from qemu version previous than 7.2.
> > >
> > > The entire final commit is unneeded as device system already enable o=
r
> > > disable the feature properly.
> > >
> > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> > > ---
> > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/featur=
es
> > > enabling and disabling queue_reset virtio-net feature and vhost=3Don/=
off
> > > on net device backend.
> >
> > Do you mean that this feature cannot be closed?
> >
> > I tried to close in the guest, it was successful.
> >
> > In addition, in this case, could you try to repair the problem instead =
of
> > directly revert.
> >
> > Thanks.
>
> What does you patch accomplish though? If it's not needed
> let's not do it.

It looks to me the unconditional set of this feature breaks the
migration of pre 7.2 machines.

Also we probably need to make ring_reset as false by default, or
compat it for pre 7.2 machines.

    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
                      VIRTIO_F_RING_RESET, true)


Thanks

>
> > > ---
> > >  hw/net/virtio-net.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 53e1c32643..4ea33b6e2e 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -805,7 +805,6 @@ static uint64_t virtio_net_get_features(VirtIODev=
ice *vdev, uint64_t features,
> > >      }
> > >
> > >      if (!get_vhost_net(nc->peer)) {
> > > -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> > >          return features;
> > >      }
> > >
> > > --
> > > 2.31.1
> > >
>


