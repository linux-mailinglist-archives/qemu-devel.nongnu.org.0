Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3606521D5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7cv6-00024J-2q; Tue, 20 Dec 2022 08:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7cuz-00023M-5b
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7cuw-0007o9-VS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671543865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82cX4KANAk9/Ybww6C007Al20pM9ndgKzkoxQXvhrPg=;
 b=ggsEQT3pbtiGB/hqP12jVb4gG7LlnLQyqxk6IqnHwzkcTwB9UeaLWpNN56e4DWkZS/aFXN
 8AloGkOz61ape3F/iRn/eM3dKXHYQoSUZq3Mva+i/UFYNCCCLkvvZfZLhcSyeCaEdzLW9o
 xenap2gMLGDQBwmPRgjjXAQXipg3r1Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-e4tAlzEBNQm84fKrk1hMGQ-1; Tue, 20 Dec 2022 08:44:23 -0500
X-MC-Unique: e4tAlzEBNQm84fKrk1hMGQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 y11-20020ad457cb000000b004c6fafdde42so7034134qvx.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 05:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=82cX4KANAk9/Ybww6C007Al20pM9ndgKzkoxQXvhrPg=;
 b=ZuSWFIkoWikYr9kSbakoMHukz79VG1l5OASpgL/0A3aetHzOzbWgSiblrFeafh1wuy
 alvYBSDNxuuviQ2xfxF5TB/TyxVITf+n/qRipUXQd+i0S4Vo5+yUTSYuckVyTdEemQuR
 tJzk9Hhc4TiwneDaFjWmILu+JhbfUvZ8QUC5pk2EBGu28nPd+ySkFxAuSZSQxdzBWY0P
 jPWwaK4aUqTqGpK7BvKRLZiqAb9N3DXh3q3UqdH88qtcagP6Oazf3O1rQbd60S2vrrxY
 9amVajSa/dddeaxbnc6DH1XrMfjMv0mgD3kJ1yiGGbieeVxL9T5RxjP84JYf8ZhXJMtA
 lSwg==
X-Gm-Message-State: AFqh2krMO06Z4B89BgMtb6/2R3mWAKPKLcrR1W+/JUwN/Ku2CSrVeOUF
 xyBOwRENu0N6JnN9ldaJPlLDB/a/kkkaelJvpilJkiDp5dXx/Ihqopka1EGsTdWmczKHb28AIL6
 Sx7ug7PunV2gFaPM=
X-Received: by 2002:a05:622a:198d:b0:3a9:9cbb:7cdf with SMTP id
 u13-20020a05622a198d00b003a99cbb7cdfmr5630048qtc.40.1671543863326; 
 Tue, 20 Dec 2022 05:44:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuEBnhxuRccFC6+Xi76WgU+Qbb9hJh7yFCLO8FmI6kpqzWd7jfeVjlEbGqX5EjQVgAIMhO8Jg==
X-Received: by 2002:a05:622a:198d:b0:3a9:9cbb:7cdf with SMTP id
 u13-20020a05622a198d00b003a99cbb7cdfmr5630021qtc.40.1671543863090; 
 Tue, 20 Dec 2022 05:44:23 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 u9-20020a37ab09000000b006fcaa1eab0esm8739892qke.123.2022.12.20.05.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:44:22 -0800 (PST)
Date: Tue, 20 Dec 2022 08:44:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v2 2/4] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device
 model has it
Message-ID: <20221220084406-mutt-send-email-mst@kernel.org>
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-3-eperezma@redhat.com>
 <CACGkMEsbib_drMeDecQeHw2ND+s7T2zMOtcQMEtFBzW-0yV=hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEsbib_drMeDecQeHw2ND+s7T2zMOtcQMEtFBzW-0yV=hA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 30, 2022 at 02:58:35PM +0800, Jason Wang wrote:
> On Fri, Nov 25, 2022 at 1:33 AM Eugenio Pérez <eperezma@redhat.com> wrote:
> >
> > Status part of the emulated feature. It will follow device model, so we
> > must copy it as long as NIC device model has it set.
> >
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> >  hw/net/virtio-net.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index eed629766f..bf71ef33e8 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -183,6 +183,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >              memcpy(netcfg.mac, n->mac, ETH_ALEN);
> >          }
> >
> > +        netcfg.status |= (n->status & VIRTIO_NET_S_ANNOUNCE);
> 
> Do we need to care about the endian here? We use:
> 
>     virtio_stw_p(vdev, &netcfg.status, n->status);
> 
> At the beginning of this function.
> 
> Thanks


Didn't see this answered.

> >          memcpy(config, &netcfg, n->config_size);
> >      }
> >  }
> > --
> > 2.31.1
> >


