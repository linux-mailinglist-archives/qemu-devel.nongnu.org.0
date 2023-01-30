Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738468157D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWNq-0007M2-Vt; Mon, 30 Jan 2023 10:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMWNX-0007KH-7t
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMWNU-0001qO-4U
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675093646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vp+nFoD9x+nITaawjconKj0TTggVsnNnCrAcdJMUur4=;
 b=iKqI/F8sX+nJZIRXWBSflK2FtXfqi9k8m0K3UtbMds+1xfiospSpZ4dT6FfxqoGr0279cX
 XgncWQ7gsUEuOLkBTAaKe7TidZt4j91eV7VDHigRf0fPoYJaPRh/fi9tEC7a3Jy+MV7dEl
 bELkTKJMcbKnOKY+MtAuCvZf5JobUFc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-nEh8rqkxOvyanRTVU8icOA-1; Mon, 30 Jan 2023 10:47:24 -0500
X-MC-Unique: nEh8rqkxOvyanRTVU8icOA-1
Received: by mail-ed1-f72.google.com with SMTP id
 t26-20020aa7d71a000000b004a244cc7ee8so2345082edq.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 07:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vp+nFoD9x+nITaawjconKj0TTggVsnNnCrAcdJMUur4=;
 b=VFm8NIwUOD0U8nArnDdKUa763wTOEdCSNlZf7ze0Mg3u1B9atmlnik+17PDqWE/Ar/
 Ef9vJ+sp2L3ry5CYbrRXQYuEmx4SWqm+YQn2zxknv6RiOGGpUfSFXn5MNlxzDIFLETuN
 kbNBgJ3yJOWGoz1z7haScoGoAGOHjolkzO0hAWgv9rDpatYDbD3jrekqIry1BJamfaZP
 1IQHcQ8wou/8AZDhDm/7TgRM537H4nUGzzwl5P1G2UTKWcKwnZEFB6mdUS8NU5mEhki6
 GwnHjP6ZoW4WXcNQrZTJ09EF5MqhTxvP4zz9u4gwUiAGAcwH8Jq0KIeVlAKeLcQwBRDa
 RLFg==
X-Gm-Message-State: AFqh2kqnB0ziEVUbhfmzEfzM5IhLv5HszlFEAGhNI/rsiSAcoezE8w9K
 Qgp9OYr3oZ7jWiH0Bscwj/CfZciZtuiniuHJlZ6PVovN8H9YJxjDzlEydCdQeUD/1swnia3JMGB
 1XjYVC+5eVnXFzCU=
X-Received: by 2002:a17:906:3f94:b0:861:4671:a834 with SMTP id
 b20-20020a1709063f9400b008614671a834mr48566788ejj.71.1675093643037; 
 Mon, 30 Jan 2023 07:47:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxg4fmQvd7fMqVxj6NzFpMu6+MYiCW4ehfq9Un0fXDgt34rhsgJu7kojOXmwypxVYShczrcw==
X-Received: by 2002:a17:906:3f94:b0:861:4671:a834 with SMTP id
 b20-20020a1709063f9400b008614671a834mr48566767ejj.71.1675093642798; 
 Mon, 30 Jan 2023 07:47:22 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 dn10-20020a05640222ea00b00482b3d0e1absm6953335edb.87.2023.01.30.07.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:47:22 -0800 (PST)
Date: Mon, 30 Jan 2023 10:47:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v4 20/28] net: Strip virtio-net header when dumping
Message-ID: <20230130104410-mutt-send-email-mst@kernel.org>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
 <20230130134715.76604-21-akihiko.odaki@daynix.com>
 <20230130101211-mutt-send-email-mst@kernel.org>
 <2b7d65e9-5928-8038-34f2-03fc2ee6a819@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b7d65e9-5928-8038-34f2-03fc2ee6a819@daynix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 31, 2023 at 12:36:38AM +0900, Akihiko Odaki wrote:
> On 2023/01/31 0:12, Michael S. Tsirkin wrote:
> > On Mon, Jan 30, 2023 at 10:47:07PM +0900, Akihiko Odaki wrote:
> > > filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
> > > virtio-net header. Having virtio-net header in such PCAP file breaks
> > > PCAP unconsumable. Unfortunately currently there is no LinkType for
> > > virtio-net so for now strip virtio-net header to convert the output to
> > > Ethernet.
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > 
> > Probably means you need to calculate checksums and split gso too right?
> 
> It was not necessary in my case as I used Wireshark and it tolerates wrong
> checksums and large packets (it even says "Checksum incorrect [maybe caused
> by 'TCP checksum offload'?]"). It was even more helpful to have raw packets
> instead of transformed packets for debugging purposes. Perhaps an option to
> transform packets may be added later if a need arises.

I think we should add LINKTYPE_VIRTIO. Very useful to debug a host of
checksum/segmentation issues. Want to hack it up?

> > 
> > > ---
> > >   include/net/net.h |  6 ++++++
> > >   net/dump.c        | 11 +++++++----
> > >   net/net.c         | 18 ++++++++++++++++++
> > >   net/tap.c         | 16 ++++++++++++++++
> > >   4 files changed, 47 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/include/net/net.h b/include/net/net.h
> > > index dc20b31e9f..4b2d72b3fc 100644
> > > --- a/include/net/net.h
> > > +++ b/include/net/net.h
> > > @@ -56,8 +56,10 @@ typedef RxFilterInfo *(QueryRxFilter)(NetClientState *);
> > >   typedef bool (HasUfo)(NetClientState *);
> > >   typedef bool (HasVnetHdr)(NetClientState *);
> > >   typedef bool (HasVnetHdrLen)(NetClientState *, int);
> > > +typedef bool (GetUsingVnetHdr)(NetClientState *);
> > >   typedef void (UsingVnetHdr)(NetClientState *, bool);
> > >   typedef void (SetOffload)(NetClientState *, int, int, int, int, int);
> > > +typedef int (GetVnetHdrLen)(NetClientState *);
> > >   typedef void (SetVnetHdrLen)(NetClientState *, int);
> > >   typedef int (SetVnetLE)(NetClientState *, bool);
> > >   typedef int (SetVnetBE)(NetClientState *, bool);
> > > @@ -84,8 +86,10 @@ typedef struct NetClientInfo {
> > >       HasUfo *has_ufo;
> > >       HasVnetHdr *has_vnet_hdr;
> > >       HasVnetHdrLen *has_vnet_hdr_len;
> > > +    GetUsingVnetHdr *get_using_vnet_hdr;
> > >       UsingVnetHdr *using_vnet_hdr;
> > >       SetOffload *set_offload;
> > > +    GetVnetHdrLen *get_vnet_hdr_len;
> > >       SetVnetHdrLen *set_vnet_hdr_len;
> > >       SetVnetLE *set_vnet_le;
> > >       SetVnetBE *set_vnet_be;
> > > @@ -183,9 +187,11 @@ void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
> > >   bool qemu_has_ufo(NetClientState *nc);
> > >   bool qemu_has_vnet_hdr(NetClientState *nc);
> > >   bool qemu_has_vnet_hdr_len(NetClientState *nc, int len);
> > > +bool qemu_get_using_vnet_hdr(NetClientState *nc);
> > >   void qemu_using_vnet_hdr(NetClientState *nc, bool enable);
> > >   void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
> > >                         int ecn, int ufo);
> > > +int qemu_get_vnet_hdr_len(NetClientState *nc);
> > >   void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
> > >   int qemu_set_vnet_le(NetClientState *nc, bool is_le);
> > >   int qemu_set_vnet_be(NetClientState *nc, bool is_be);
> > > diff --git a/net/dump.c b/net/dump.c
> > > index 6a63b15359..7d05f16ca7 100644
> > > --- a/net/dump.c
> > > +++ b/net/dump.c
> > > @@ -61,12 +61,13 @@ struct pcap_sf_pkthdr {
> > >       uint32_t len;
> > >   };
> > > -static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
> > > +static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt,
> > > +                                int offset)
> > >   {
> > >       struct pcap_sf_pkthdr hdr;
> > >       int64_t ts;
> > >       int caplen;
> > > -    size_t size = iov_size(iov, cnt);
> > > +    size_t size = iov_size(iov, cnt) - offset;
> > >       struct iovec dumpiov[cnt + 1];
> > >       /* Early return in case of previous error. */
> > > @@ -84,7 +85,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
> > >       dumpiov[0].iov_base = &hdr;
> > >       dumpiov[0].iov_len = sizeof(hdr);
> > > -    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
> > > +    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, offset, caplen);
> > >       if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
> > >           error_report("network dump write error - stopping dump");
> > > @@ -153,8 +154,10 @@ static ssize_t filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
> > >                                          int iovcnt, NetPacketSent *sent_cb)
> > >   {
> > >       NetFilterDumpState *nfds = FILTER_DUMP(nf);
> > > +    int offset = qemu_get_using_vnet_hdr(nf->netdev) ?
> > > +                 qemu_get_vnet_hdr_len(nf->netdev) : 0;
> > > -    dump_receive_iov(&nfds->ds, iov, iovcnt);
> > > +    dump_receive_iov(&nfds->ds, iov, iovcnt, offset);
> > >       return 0;
> > >   }
> > > diff --git a/net/net.c b/net/net.c
> > > index 2d01472998..03f17de5fc 100644
> > > --- a/net/net.c
> > > +++ b/net/net.c
> > > @@ -513,6 +513,15 @@ bool qemu_has_vnet_hdr_len(NetClientState *nc, int len)
> > >       return nc->info->has_vnet_hdr_len(nc, len);
> > >   }
> > > +bool qemu_get_using_vnet_hdr(NetClientState *nc)
> > > +{
> > > +    if (!nc || !nc->info->get_using_vnet_hdr) {
> > > +        return false;
> > > +    }
> > > +
> > > +    return nc->info->get_using_vnet_hdr(nc);
> > > +}
> > > +
> > >   void qemu_using_vnet_hdr(NetClientState *nc, bool enable)
> > >   {
> > >       if (!nc || !nc->info->using_vnet_hdr) {
> > > @@ -532,6 +541,15 @@ void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
> > >       nc->info->set_offload(nc, csum, tso4, tso6, ecn, ufo);
> > >   }
> > > +int qemu_get_vnet_hdr_len(NetClientState *nc)
> > > +{
> > > +    if (!nc || !nc->info->get_vnet_hdr_len) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    return nc->info->get_vnet_hdr_len(nc);
> > > +}
> > > +
> > >   void qemu_set_vnet_hdr_len(NetClientState *nc, int len)
> > >   {
> > >       if (!nc || !nc->info->set_vnet_hdr_len) {
> > > diff --git a/net/tap.c b/net/tap.c
> > > index 7d7bc1dc5f..1bf085d422 100644
> > > --- a/net/tap.c
> > > +++ b/net/tap.c
> > > @@ -255,6 +255,13 @@ static bool tap_has_vnet_hdr_len(NetClientState *nc, int len)
> > >       return !!tap_probe_vnet_hdr_len(s->fd, len);
> > >   }
> > > +static int tap_get_vnet_hdr_len(NetClientState *nc)
> > > +{
> > > +    TAPState *s = DO_UPCAST(TAPState, nc, nc);
> > > +
> > > +    return s->host_vnet_hdr_len;
> > > +}
> > > +
> > >   static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
> > >   {
> > >       TAPState *s = DO_UPCAST(TAPState, nc, nc);
> > > @@ -268,6 +275,13 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
> > >       s->host_vnet_hdr_len = len;
> > >   }
> > > +static bool tap_get_using_vnet_hdr(NetClientState *nc)
> > > +{
> > > +    TAPState *s = DO_UPCAST(TAPState, nc, nc);
> > > +
> > > +    return s->using_vnet_hdr;
> > > +}
> > > +
> > >   static void tap_using_vnet_hdr(NetClientState *nc, bool using_vnet_hdr)
> > >   {
> > >       TAPState *s = DO_UPCAST(TAPState, nc, nc);
> > > @@ -372,8 +386,10 @@ static NetClientInfo net_tap_info = {
> > >       .has_ufo = tap_has_ufo,
> > >       .has_vnet_hdr = tap_has_vnet_hdr,
> > >       .has_vnet_hdr_len = tap_has_vnet_hdr_len,
> > > +    .get_using_vnet_hdr = tap_get_using_vnet_hdr,
> > >       .using_vnet_hdr = tap_using_vnet_hdr,
> > >       .set_offload = tap_set_offload,
> > > +    .get_vnet_hdr_len = tap_get_vnet_hdr_len,
> > >       .set_vnet_hdr_len = tap_set_vnet_hdr_len,
> > >       .set_vnet_le = tap_set_vnet_le,
> > >       .set_vnet_be = tap_set_vnet_be,
> > > -- 
> > > 2.39.1
> > 


