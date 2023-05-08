Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124946FA01E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 08:49:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvufW-0002gn-ST; Mon, 08 May 2023 02:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvufM-0002gP-MR
 for qemu-devel@nongnu.org; Mon, 08 May 2023 02:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvufK-0001mu-Sl
 for qemu-devel@nongnu.org; Mon, 08 May 2023 02:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683528489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8UIowGOW2libFK/uXTL9z04JfKoS9IvWj7U7vHTSq9M=;
 b=QwGGD/FML7SHUleeyKGLXYQvsBpYUGK2F8SnbFyozZHMJxCgCnWEt0FR9Peg+1BW6jQeTA
 cyZ4ODfFhuCEctYDJYdGBbkA6h67PSN0JQp+QFaYj5hfjA71sm2jD3ACBobMoT+m8nA/Ie
 JvXny9n8EtDM1SaDna5IXlMMrwD1kZU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-YHWfVVjcOEynOUZU62qT4Q-1; Mon, 08 May 2023 02:48:07 -0400
X-MC-Unique: YHWfVVjcOEynOUZU62qT4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso103845535e9.1
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 23:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683528486; x=1686120486;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8UIowGOW2libFK/uXTL9z04JfKoS9IvWj7U7vHTSq9M=;
 b=Z1Nq6aqOigDV+z7rG/tVdHcKn4GzQRHD8og6IR4rlr8XtOyQVqzGkGc2BkAItjkhCt
 WYahqH+JDVU2Wuon/pIADaA+knFvyMz+SeK+TirHUJQCCk7uh3KHULdzi3R0sYiGreDu
 zc+MEZ43hd4VccUr7S3louwv9KvDFtog5yXkZye/ITJpywOVGLHDABGHauw2n9Dsyd38
 PN3QJZTtAXJZkrGPBpTsslJc0J/NZ81UU9Q1lGtDXedUVSha34V4x32pgNnMPNdNjj5j
 W/I/CBmaazLzQWtsMfy1bRvqnHMcU5IPECI4X1bKDSeXWY8ceM6bfE9RC0CHwuQWXsaG
 jGxQ==
X-Gm-Message-State: AC+VfDyuT5segydEroRP+sdzbBFdLwLD7ShZOkGOz9kZ/ZGQs7uIFnfx
 ZQIVbsVo0Ue2A2T57PGaJh/ipb3fVV0aj/5Z1YMZEcnuTQW6dX8k8ZgdL6uviI86bJni5QGN1KI
 lz2jZlt4MGmakjtY=
X-Received: by 2002:a5d:4085:0:b0:307:f75:f581 with SMTP id
 o5-20020a5d4085000000b003070f75f581mr7323017wrp.18.1683528486192; 
 Sun, 07 May 2023 23:48:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cO96Jeb+XyAofM9NTIyNBndaQsLceVIb6UOxOFYkq1lTykB7ybXWIEaCvj5uq110fz9c7sg==
X-Received: by 2002:a5d:4085:0:b0:307:f75:f581 with SMTP id
 o5-20020a5d4085000000b003070f75f581mr7323001wrp.18.1683528485858; 
 Sun, 07 May 2023 23:48:05 -0700 (PDT)
Received: from redhat.com ([31.187.78.15]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm2902413wrj.92.2023.05.07.23.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 23:48:05 -0700 (PDT)
Date: Mon, 8 May 2023 02:48:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Message-ID: <20230508024746-mutt-send-email-mst@kernel.org>
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <20230507020037-mutt-send-email-mst@kernel.org>
 <CACGkMEubjEr_CSxdq86jZsYY8a78L50N03=vnYzgOhKBNH29ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEubjEr_CSxdq86jZsYY8a78L50N03=vnYzgOhKBNH29ag@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 08, 2023 at 02:44:21PM +0800, Jason Wang wrote:
> On Sun, May 7, 2023 at 2:01 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sat, May 06, 2023 at 10:13:36AM +0800, Xuan Zhuo wrote:
> > > On Thu,  4 May 2023 12:14:47 +0200, =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com> wrote:
> > > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
> > > > unconditionally vq reset feature as long as the device is emulated.
> > > > This makes impossible to actually disable the feature, and it causes
> > > > migration problems from qemu version previous than 7.2.
> > > >
> > > > The entire final commit is unneeded as device system already enable or
> > > > disable the feature properly.
> > > >
> > > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > >
> > > > ---
> > > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
> > > > enabling and disabling queue_reset virtio-net feature and vhost=on/off
> > > > on net device backend.
> > >
> > > Do you mean that this feature cannot be closed?
> > >
> > > I tried to close in the guest, it was successful.
> > >
> > > In addition, in this case, could you try to repair the problem instead of
> > > directly revert.
> > >
> > > Thanks.
> >
> > What does you patch accomplish though? If it's not needed
> > let's not do it.
> 
> It looks to me the unconditional set of this feature breaks the
> migration of pre 7.2 machines.
> 
> Also we probably need to make ring_reset as false by default, or
> compat it for pre 7.2 machines.
> 
>     DEFINE_PROP_BIT64("queue_reset", _state, _field, \
>                       VIRTIO_F_RING_RESET, true)
> 
> 
> Thanks

Compat I am guessing. Eugenio?

> >
> > > > ---
> > > >  hw/net/virtio-net.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > index 53e1c32643..4ea33b6e2e 100644
> > > > --- a/hw/net/virtio-net.c
> > > > +++ b/hw/net/virtio-net.c
> > > > @@ -805,7 +805,6 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> > > >      }
> > > >
> > > >      if (!get_vhost_net(nc->peer)) {
> > > > -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> > > >          return features;
> > > >      }
> > > >
> > > > --
> > > > 2.31.1
> > > >
> >


