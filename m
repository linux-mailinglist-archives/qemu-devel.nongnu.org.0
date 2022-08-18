Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AA597FE3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 10:13:58 +0200 (CEST)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOaf7-0007SU-KB
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 04:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOaVq-0002Tb-1L
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOaVl-0004hu-TZ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660809857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gCTqGdVUru1OhtZrjR4HqjAzI4ZR3gnn8L86oUuPxDI=;
 b=fXyBZ+pvYUwFerHyh87+82e/9wfgjHEqfnQRevMkpeYOL5/fdPpFO32Ph2kyfpyUpUHgkf
 C9GFbDr+7WXFVqVVRlB+tC9xuxLERaIiTxss2ZTRezzIc2EEmh/YS4gOgR6tjSrPVjz5Em
 zK2vzSbV6JJr3yBEbaEbef9SkwZ0XcQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-gXbWLlzlNeOvKmZf0xKHcg-1; Thu, 18 Aug 2022 04:04:15 -0400
X-MC-Unique: gXbWLlzlNeOvKmZf0xKHcg-1
Received: by mail-lf1-f71.google.com with SMTP id
 j10-20020a056512028a00b0048af6cf0bcbso285247lfp.11
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 01:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gCTqGdVUru1OhtZrjR4HqjAzI4ZR3gnn8L86oUuPxDI=;
 b=cqcewIumSGytpK5h1CYVydjRJvtxHnLjDLXI93JlDXWg88aT2di2J04Hr3xVOD9x4B
 5R8Nhp88yCelJnUKXHx9kmiCzLPorDUHUuTB9o2uPfBdsG8ms/iXLmwq17hfMyXagN24
 b8QhMa0LVdlKdKXIylzhEYEw4TcBl39pOuH8Azj+0cpHxdMnGjUXh1TPyd+C1ZiYs9WE
 XwaTuAswBW9qAcoabTACEJniQQR6sX50DQag3uET/dJahfcquLKp3omM/liIvtFxp3zR
 mfyf55oh1qWW3DxewSIyCnrhTE6/c6GEmVDF74VqspywJTpo1rrgLrfLYYEKVI55wmZu
 zsmQ==
X-Gm-Message-State: ACgBeo36lp4GVzpgkPsv/novnq7n3ft/PmKxYUrYCORQKSazTvanmqbR
 c/zcbqxkFnI1tefLnYwXoRPBw91JArqzGz6ua1JhB8mHlGtfykpWNjwSSQomPIYJHAZuGLbjqwH
 MQebxpwd7ppAZbhtqASo5UYJm0/yv/sw=
X-Received: by 2002:a2e:a418:0:b0:261:9a96:a5c2 with SMTP id
 p24-20020a2ea418000000b002619a96a5c2mr543853ljn.487.1660809854090; 
 Thu, 18 Aug 2022 01:04:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6pKVTgXeRJ3ruNTfl392WYa74OMk+OQpWT7A62d/9WrGp83uItCxHLFqpOM8Zj0xsPrG8viYXisM0s/fggHno=
X-Received: by 2002:a2e:a418:0:b0:261:9a96:a5c2 with SMTP id
 p24-20020a2ea418000000b002619a96a5c2mr543847ljn.487.1660809853859; Thu, 18
 Aug 2022 01:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220809084854.217943-1-chen.zhang@intel.com>
 <MWHPR11MB0031A51C861DF8C6CB520E909B6A9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031A51C861DF8C6CB520E909B6A9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 18 Aug 2022 16:04:02 +0800
Message-ID: <CACGkMEteTx2szBPHMPL3UkDxRnf_9DUP3WRD+hxwCo5EgiLjjg@mail.gmail.com>
Subject: Re: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
 Coverity.
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 17, 2022 at 3:45 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
> Ping....  Jason and Peter, any comments for this patch?
>
> Thanks
> Chen
>
> > -----Original Message-----
> > From: Zhang, Chen <chen.zhang@intel.com>
> > Sent: Tuesday, August 9, 2022 4:49 PM
> > To: Jason Wang <jasowang@redhat.com>; Peter Maydell
> > <peter.maydell@linaro.org>; Li Zhijian <lizhijian@fujitsu.com>; qemu-dev
> > <qemu-devel@nongnu.org>
> > Cc: Zhang, Chen <chen.zhang@intel.com>
> > Subject: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
> > Coverity.
> >
> > When enabled the virtio-net-pci, guest network packet will load the vnet_hdr.
> > In COLO status, the primary VM's network packet maybe redirect to another
> > VM, it need filter-redirect enable the vnet_hdr flag at the same time, COLO-
> > proxy will correctly parse the original network packet. If have any
> > misconfiguration here, the vnet_hdr_len is wrong for parse the packet, the
> > data+offset will point to wrong place.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/colo.c | 18 ++++++++++--------
> >  net/colo.h |  1 +
> >  2 files changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/net/colo.c b/net/colo.c
> > index 6b0ff562ad..2b5568fff4 100644
> > --- a/net/colo.c
> > +++ b/net/colo.c
> > @@ -44,21 +44,23 @@ int parse_packet_early(Packet *pkt)  {
> >      int network_length;
> >      static const uint8_t vlan[] = {0x81, 0x00};
> > -    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> > +    uint8_t *data = pkt->data;
> >      uint16_t l3_proto;
> >      ssize_t l2hdr_len;
> >
> > -    if (data == NULL) {
> > -        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> > +    assert(data);
> > +
> > +    /* Check the received vnet_hdr_len then add the offset */
> > +    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr_v1_hash)) ||
> > +        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
> > +        + pkt->vnet_hdr_len)) {
> > +        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
> >                                          "pkt->vnet_hdr_len", pkt->vnet_hdr_len);

Nit: I think we need to be verbose here, e.g put the pkt_size here at least.

Thanks

> >          return 1;
> >      }
> > -    l2hdr_len = eth_get_l2_hdr_length(data);
> > +    data += pkt->vnet_hdr_len;
> >
> > -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> > -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> > -        return 1;
> > -    }
> > +    l2hdr_len = eth_get_l2_hdr_length(data);
> >
> >      /*
> >       * TODO: support vlan.
> > diff --git a/net/colo.h b/net/colo.h
> > index 8b3e8d5a83..22fc3031f7 100644
> > --- a/net/colo.h
> > +++ b/net/colo.h
> > @@ -18,6 +18,7 @@
> >  #include "qemu/jhash.h"
> >  #include "qemu/timer.h"
> >  #include "net/eth.h"
> > +#include "standard-headers/linux/virtio_net.h"
> >
> >  #define HASHTABLE_MAX_SIZE 16384
> >
> > --
> > 2.25.1
>


