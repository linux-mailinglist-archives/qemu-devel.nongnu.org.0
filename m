Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81558D596
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:44:29 +0200 (CEST)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKqi-0005ha-6Q
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLKp8-0003xP-8t
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLKp4-0001Ph-5T
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660034565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNwhbJU6DJlM87VquBLyDPJbIDHgH0tzlVG2NDzMw38=;
 b=T/jIlNt605U2/IYHf/v/lb6v13HEbPZIHAR4kMjyxDMxwMVapF+1YC92G0akGalVsmnUvr
 6c7128L5BgNuUMBi2AnaL1aONrgufn/2NmaTJZ2YMIGy2lZ6L9T+17l9Uy8BXRztTTWnsi
 p0cMbm19EbNR7DaLKYHd5OtvdpIivlc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-pDCOt5LZOvq0YCvnutsexg-1; Tue, 09 Aug 2022 04:42:43 -0400
X-MC-Unique: pDCOt5LZOvq0YCvnutsexg-1
Received: by mail-lf1-f70.google.com with SMTP id
 e19-20020a05651236d300b0048d16bfadecso129659lfs.21
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 01:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZNwhbJU6DJlM87VquBLyDPJbIDHgH0tzlVG2NDzMw38=;
 b=6OopD0AyAq7/wa5flHuuhqUB0TfCtqloxb0+1GWzJi7qHaD9WftGrBFENQWia3S2La
 FvYKh/6b7i4EgDuUCrUMWFrsrkFlB2WfR8GT+/QR/G39yO+n68QwbabmOSSGgel9V4VZ
 9p1u5mGSftneTx1xjDuP8z96JOvZ2KQw53Z3yzLMVKDb3RH5N0cLreu7q2LsyF1BgZDB
 rBm7eDmJeCA1/sFsfffsZXN80OF78AY9g1o6qRiHo3uaJVb7YI/cYcfzHemO20aeXApF
 F84S0uSdLz94+1lljoyKhVwx2XCwd2N4UtxPuRDAbIwOlTHCtVgxE27AfpaUXvRNWisz
 v66A==
X-Gm-Message-State: ACgBeo27a2exrty+p5M7C3SlavUtrQyI9QvTXh6LoxTqaX0JjbEWe6wO
 n6sscwzSyCMPsro/GjtJTDM5HUrqeMplHA8tq5Hze5sg0RwN06UMR7iqw1+PB8iIhueFl25Hg7A
 3ulKtX6F9/FM7u7ILMPOiDiePgZUc9bo=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr7365342ljk.243.1660034562248; 
 Tue, 09 Aug 2022 01:42:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR67UAT3ciPD6M7+2RoF9XutLXaTh4tNLHnUfxBOU9jD1M2yqjY6TP8+T7t96HPSq0RmS6o2ZZoO2PrhCCPw6zA=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr7365337ljk.243.1660034562027; Tue, 09
 Aug 2022 01:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220809025010.200289-1-chen.zhang@intel.com>
 <CACGkMEuWcLuGBfJ3zyEw2qi8=C80f13Tt1_t1fJj1D4k8PNRiw@mail.gmail.com>
 <MWHPR11MB0031AF520C6EEA63C544D5EE9B629@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031AF520C6EEA63C544D5EE9B629@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 16:42:31 +0800
Message-ID: <CACGkMEsm9CQ3hhVt37kGMDbRgCnbStsJ1O0VXLc6r4FLJe_tiA@mail.gmail.com>
Subject: Re: [PATCH V3] net/colo.c: Fix the pointer issue reported by Coverity.
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 9, 2022 at 4:29 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, August 9, 2022 4:12 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>; Li Zhijian
> > <lizhijian@fujitsu.com>; qemu-dev <qemu-devel@nongnu.org>
> > Subject: Re: [PATCH V3] net/colo.c: Fix the pointer issue reported by Coverity.
> >
> > On Tue, Aug 9, 2022 at 11:05 AM Zhang Chen <chen.zhang@intel.com> wrote:
> > >
> > > When enable the virtio-net-pci, guest network packet will load the
> > > vnet_hdr. In COLO status, the primary VM's network packet maybe
> > > redirect to another VM, it need filter-redirect enable the vnet_hdr
> > > flag at the same time, COLO-proxy will correctly parse the original
> > > network packet. If have any misconfiguration here, the vnet_hdr_len is
> > > wrong for parse the packet, the data+offset will point to wrong place.
> > >
> > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > ---
> > >  net/colo.c | 18 ++++++++++--------
> > >  net/colo.h |  1 +
> > >  2 files changed, 11 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/net/colo.c b/net/colo.c
> > > index 6b0ff562ad..4f1b4a61f6 100644
> > > --- a/net/colo.c
> > > +++ b/net/colo.c
> > > @@ -44,21 +44,23 @@ int parse_packet_early(Packet *pkt)  {
> > >      int network_length;
> > >      static const uint8_t vlan[] = {0x81, 0x00};
> > > -    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> > > +    uint8_t *data = pkt->data;
> > >      uint16_t l3_proto;
> > >      ssize_t l2hdr_len;
> > >
> > > -    if (data == NULL) {
> > > -        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> > > +    assert(data);
> > > +
> > > +    /* Check the received vnet_hdr_len then add the offset */
> > > +    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr)) ||
> >
> > Virtio-net starts to support RSS so it means the vnet_hdr size could be greater
> > than virtio_net_hdr now.
> >
> > Or did you actually mean "<" here?
>
> No, I just try to avoid overflow with a maliciously over-large
> vnet_hdr_len value as Peter's comments.
> If enabled the RSS, how to get the maximum of vnet_hdr size?

With hash_report the maximum is sizeof(virtio_net_hdr_v1_hash). But it
might be extended in the future.

We can probably start from it.

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> > > +        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
> > > +        + pkt->vnet_hdr_len)) {
> > > +        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
> > >                                          "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
> > >          return 1;
> > >      }
> > > -    l2hdr_len = eth_get_l2_hdr_length(data);
> > > +    data += pkt->vnet_hdr_len;
> > >
> > > -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> > > -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> > > -        return 1;
> > > -    }
> > > +    l2hdr_len = eth_get_l2_hdr_length(data);
> > >
> > >      /*
> > >       * TODO: support vlan.
> > > diff --git a/net/colo.h b/net/colo.h
> > > index 8b3e8d5a83..22fc3031f7 100644
> > > --- a/net/colo.h
> > > +++ b/net/colo.h
> > > @@ -18,6 +18,7 @@
> > >  #include "qemu/jhash.h"
> > >  #include "qemu/timer.h"
> > >  #include "net/eth.h"
> > > +#include "standard-headers/linux/virtio_net.h"
> > >
> > >  #define HASHTABLE_MAX_SIZE 16384
> > >
> > > --
> > > 2.25.1
> > >
>


