Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3986F971E
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 08:03:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvXSj-0003FG-Bw; Sun, 07 May 2023 02:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvXSR-0003DW-G6
 for qemu-devel@nongnu.org; Sun, 07 May 2023 02:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvXSP-00046Z-Lx
 for qemu-devel@nongnu.org; Sun, 07 May 2023 02:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683439275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/NuxEV84EFW4BtQt8cOGI0SMMNOWIYSYFizWcD2jIo=;
 b=UlxTQm19h9MMokLZz1s6pfv3r/8VBk4vxeNtBwln8yCuNBB+xxF34aGRpUorvA7LDqRK1K
 toMHNM/kH8at4L9CyoWvL2MJoZp/h65bL+A+grQQgB7YRcZFbKvfGKAjaUHySj1CeZuVJC
 UQWhH9Bl1l90hft6DWiq6BqOPqXaJP8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-jfYCriU8NsyrCI0uYlBWtA-1; Sun, 07 May 2023 02:01:14 -0400
X-MC-Unique: jfYCriU8NsyrCI0uYlBWtA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f171d38db3so21783615e9.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 23:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683439273; x=1686031273;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/NuxEV84EFW4BtQt8cOGI0SMMNOWIYSYFizWcD2jIo=;
 b=a1p/Gw8HVavuFBesBY9zHp3+FSqdCc8VfNYTK1dpYBF64CEMEnhyZOCO4tBz3+mXrn
 yLYdqrvaPCh1PJ6XEcekljA7ARIzQLu/lH91Qxgj5/uKNVPL9DbMQrzSdmK/GJBDEQ5y
 01Dx066EGg+U9Md2a7V9bBv325o0PQcpPVrNL4emmvgE006u0ShTYvkkkNAeDswvLt4h
 /c3gURH1WeJ3M/sMKoAjpuh0JNU9vP5qR/H4M1dRHsN0fQzqTT6aqqoddXz5Uj/VnQYM
 dp5mFPLcnIjP1vPhmWSursdM3ehnZLjQJDm1Mxy+WvLkLXd0eJn/IviT5LmWkAiO6mF4
 8swQ==
X-Gm-Message-State: AC+VfDxZmQF5ZwrUX45XuN16TXMvcpIMGKbaOjlSqjRKgnH7Z9Y8Vs0D
 G3e2Ea6j89lunVIAjjcflr82SJoiUiZM/A15caob3VsJ/8NfT36z4bJ10X90yH69tKbwmaBwA3K
 TLupeNX6A5Rorn8g=
X-Received: by 2002:a7b:c404:0:b0:3f1:7b8d:38ec with SMTP id
 k4-20020a7bc404000000b003f17b8d38ecmr4494035wmi.35.1683439273196; 
 Sat, 06 May 2023 23:01:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Y5POqvcCoaW0l86aIBfSId3z6WVZ7kNaez6SIQa7GvTYSoB1t+R/Izht6cc2kEaOijfsejg==
X-Received: by 2002:a7b:c404:0:b0:3f1:7b8d:38ec with SMTP id
 k4-20020a7bc404000000b003f17b8d38ecmr4494023wmi.35.1683439272859; 
 Sat, 06 May 2023 23:01:12 -0700 (PDT)
Received: from redhat.com ([2.52.158.28]) by smtp.gmail.com with ESMTPSA id
 b13-20020a05600010cd00b00306299be5a2sm7293466wrx.72.2023.05.06.23.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 23:01:12 -0700 (PDT)
Date: Sun, 7 May 2023 02:01:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Message-ID: <20230507020037-mutt-send-email-mst@kernel.org>
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

On Sat, May 06, 2023 at 10:13:36AM +0800, Xuan Zhuo wrote:
> On Thu,  4 May 2023 12:14:47 +0200, =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com> wrote:
> > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
> > unconditionally vq reset feature as long as the device is emulated.
> > This makes impossible to actually disable the feature, and it causes
> > migration problems from qemu version previous than 7.2.
> >
> > The entire final commit is unneeded as device system already enable or
> > disable the feature properly.
> >
> > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >
> > ---
> > Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
> > enabling and disabling queue_reset virtio-net feature and vhost=on/off
> > on net device backend.
> 
> Do you mean that this feature cannot be closed?
> 
> I tried to close in the guest, it was successful.
> 
> In addition, in this case, could you try to repair the problem instead of
> directly revert.
> 
> Thanks.

What does you patch accomplish though? If it's not needed
let's not do it.

> > ---
> >  hw/net/virtio-net.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 53e1c32643..4ea33b6e2e 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -805,7 +805,6 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> >      }
> >
> >      if (!get_vhost_net(nc->peer)) {
> > -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> >          return features;
> >      }
> >
> > --
> > 2.31.1
> >


