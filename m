Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782596C81BE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:48:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfcta-0008Q6-5v; Fri, 24 Mar 2023 04:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfctQ-0008Pr-P5
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfcpB-0006LS-9V
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679646655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuIrjUNCTFtIz5pUJTCwMi/je8IvxtTr0C8jJaP5XKM=;
 b=LzmsDPJcH7f0TWNwnLTMBERGDhG2ocQEtyiBT6QsiRKlE+nNyCQW/BrLfSgqowRUgNkIY9
 HPT2/8jBDvXFN5z6Gc90+HXKnupcV3jyucJs157/fADcyChdyCR51Ne18G0ITtJwf0ZKeO
 sVUNdKFHWlEOF+YDMxDg9FampgG040s=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-X37ofDasM4227jp8Xt9fjg-1; Fri, 24 Mar 2023 04:30:54 -0400
X-MC-Unique: X37ofDasM4227jp8Xt9fjg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1777dadbde5so599892fac.7
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679646653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuIrjUNCTFtIz5pUJTCwMi/je8IvxtTr0C8jJaP5XKM=;
 b=Ei6MR7Yg0fJHYP8MxSiuDseE1fcEqtR8FYmz4I4tpVoc6ekyC5nJEiumNd3YJjEqQz
 NNT85khZqRFwq7T+jEQ3DoLICP4h3duCAGoS65oDONpvQDaq2GTw28/SXcLm8eJrlOIe
 D0VwJ8RkkL0f9SbwnmD7gUfQBuP5Vlv3zVNdtD/GPaaZbnqpEFGE7FknsRZFdrhqjBs1
 2yI5cX0+O9mTIxTi8U14ldeu1fQA40pSqcfCtPk4oyN8xNxiVpL9y2Ru6wspCAIWuxds
 E8PG4BQ6kM8DiliL8oGakUTFnccTzdg+YVfCseUtDRQ1qSDp7Z3skIK5SkKRaLg7c4nM
 M76g==
X-Gm-Message-State: AO0yUKVhAbOycsvWXnfGONK3Sg8KAPWWAg3PfH1xFxeT2Sdbo97eVAqY
 MfwiLEG08aOjSEdNXmte7Bi4fgiefklTnkHxkYm7A1unN0ELMe+a2bGGJhIU/xZ40t8PFpt3J1O
 2lwxGVudjXixGj7o7WP8X9vqRCx1NiyQ=
X-Received: by 2002:a05:6871:4983:b0:17e:e3b2:6d99 with SMTP id
 tx3-20020a056871498300b0017ee3b26d99mr101852oab.9.1679646653613; 
 Fri, 24 Mar 2023 01:30:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set+P8EkQxrUcY3CnxwXIhrGW/GNL3mgbzxSCug7rJjX16qoW6gTSN9+NpVoy6S5FCsO3rm5xeQ5sPVwfC/xD8SA=
X-Received: by 2002:a05:6871:4983:b0:17e:e3b2:6d99 with SMTP id
 tx3-20020a056871498300b0017ee3b26d99mr101792oab.9.1679646648470; Fri, 24 Mar
 2023 01:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230316122653.10770-1-akihiko.odaki@daynix.com>
 <21ae4db0-2adc-ad01-c06e-2f4a8d8ee172@daynix.com>
In-Reply-To: <21ae4db0-2adc-ad01-c06e-2f4a8d8ee172@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Mar 2023 16:30:37 +0800
Message-ID: <CACGkMEsuS5XR=UP188bT6Jv=3-t3=+eMLfv-y8NpuXr_C=V4Zg@mail.gmail.com>
Subject: Re: [PATCH for 8.0] hw/net/net_tx_pkt: Align l3_hdr
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
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

On Thu, Mar 23, 2023 at 4:53=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> Hi Jason,
>
> I have sent some patches for igb and packet abstractions. They are fixes
> intended to be included in 8.0 so please have a look at them.

I gave some comments and If possible please post them with a series
then Sriram can rebase on top.

Thanks

>
> Regards,
> Akihiko Odaki
>
> On 2023/03/16 21:26, Akihiko Odaki wrote:
> > Align the l3_hdr member of NetTxPkt by defining it as a union of
> > ip_header, ip6_header, and an array of octets.
> >
> > Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1544
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> >   hw/net/net_tx_pkt.c | 21 +++++++++++----------
> >   1 file changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> > index efe80b1a80..8dc8568ba2 100644
> > --- a/hw/net/net_tx_pkt.c
> > +++ b/hw/net/net_tx_pkt.c
> > @@ -43,7 +43,11 @@ struct NetTxPkt {
> >       struct iovec *vec;
> >
> >       uint8_t l2_hdr[ETH_MAX_L2_HDR_LEN];
> > -    uint8_t l3_hdr[ETH_MAX_IP_DGRAM_LEN];
> > +    union {
> > +        struct ip_header ip;
> > +        struct ip6_header ip6;
> > +        uint8_t octets[ETH_MAX_IP_DGRAM_LEN];
> > +    } l3_hdr;
> >
> >       uint32_t payload_len;
> >
> > @@ -89,16 +93,14 @@ void net_tx_pkt_update_ip_hdr_checksum(struct NetTx=
Pkt *pkt)
> >   {
> >       uint16_t csum;
> >       assert(pkt);
> > -    struct ip_header *ip_hdr;
> > -    ip_hdr =3D pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base;
> >
> > -    ip_hdr->ip_len =3D cpu_to_be16(pkt->payload_len +
> > +    pkt->l3_hdr.ip.ip_len =3D cpu_to_be16(pkt->payload_len +
> >           pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len);
> >
> > -    ip_hdr->ip_sum =3D 0;
> > -    csum =3D net_raw_checksum((uint8_t *)ip_hdr,
> > +    pkt->l3_hdr.ip.ip_sum =3D 0;
> > +    csum =3D net_raw_checksum(pkt->l3_hdr.octets,
> >           pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len);
> > -    ip_hdr->ip_sum =3D cpu_to_be16(csum);
> > +    pkt->l3_hdr.ip.ip_sum =3D cpu_to_be16(csum);
> >   }
> >
> >   void net_tx_pkt_update_ip_checksums(struct NetTxPkt *pkt)
> > @@ -832,15 +834,14 @@ void net_tx_pkt_fix_ip6_payload_len(struct NetTxP=
kt *pkt)
> >   {
> >       struct iovec *l2 =3D &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
> >       if (eth_get_l3_proto(l2, 1, l2->iov_len) =3D=3D ETH_P_IPV6) {
> > -        struct ip6_header *ip6 =3D (struct ip6_header *) pkt->l3_hdr;
> >           /*
> >            * TODO: if qemu would support >64K packets - add jumbo optio=
n check
> >            * something like that:
> >            * 'if (ip6->ip6_plen =3D=3D 0 && !has_jumbo_option(ip6)) {'
> >            */
> > -        if (ip6->ip6_plen =3D=3D 0) {
> > +        if (pkt->l3_hdr.ip6.ip6_plen =3D=3D 0) {
> >               if (pkt->payload_len <=3D ETH_MAX_IP_DGRAM_LEN) {
> > -                ip6->ip6_plen =3D htons(pkt->payload_len);
> > +                pkt->l3_hdr.ip6.ip6_plen =3D htons(pkt->payload_len);
> >               }
> >               /*
> >                * TODO: if qemu would support >64K packets
>


