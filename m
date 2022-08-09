Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E758D534
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:13:58 +0200 (CEST)
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKNB-0001b9-Tf
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLKLS-0008Df-3t
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLKLO-0005Cm-Hp
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660032725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPFJ2OMm2Zb8LYeqyS+TasMgmdIcHkuBJct/lAMevYI=;
 b=dL2FBTDkRjqwz42XDsbCui4eeKmmqKUJws/QJwRDM4I0tiKRZ1qtIeghFlVNNIh/jGTvSa
 bxyjXiasB2dzNeStGcpb5WeAYoRxKZAhHFw1fZqVWnCPB5GQX46rwPIZEpoST0EwhZfGT+
 J30k80kdm3khXfOvjXJw1nNotRGSZiI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-qcS8hurbPkyz6fcerstQ-g-1; Tue, 09 Aug 2022 04:12:02 -0400
X-MC-Unique: qcS8hurbPkyz6fcerstQ-g-1
Received: by mail-lf1-f72.google.com with SMTP id
 v16-20020a056512049000b0048d0d86c689so286040lfq.15
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 01:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPFJ2OMm2Zb8LYeqyS+TasMgmdIcHkuBJct/lAMevYI=;
 b=Ovj6Cu1dHiJQWiq4vgKQBDGZr8IIVaPvq5SkK13RVAh3kD2JEOm4E/4UIo03Ei2Eg7
 vP4iMFz8Tm5IiEQOE/i9kGTLU6OjV9tJx0Uj30du1LIsWQs44qK4hzinQakJfdQ2+H6R
 nB3294OztN+SuYx1Ql5sskghSaNDOJvnWtbInL1dBD5ykTMCEprvVa7cAU1p64MK+28Z
 LP5zUWajbeYaHJsH6xXGqxZ/HwHN86SH+qqa4cL6uMLF7/vE0IP3K8usL6kPfTAH4nGU
 +89vic2XkixTrE7EYt2NgzD1uPk2Nkl/xLVlS3cZg+okFDOckxbo4oXuGEePbqcQ2Dvh
 wnyQ==
X-Gm-Message-State: ACgBeo0TkJ9rbMIAaBFxRXb66365iXaRYt3OlZofiIvOxjO0NUZW8BJa
 sqqwFwJ8Y5jSxkbKdg4qJ7xtbeUNBUR2nWl/39EdIuSeRsHKbNTuEMKo3JWXMPFVSBqufNqG0vH
 Psss5YGdJv53N6PcVHogjwti0birFIeU=
X-Received: by 2002:a19:8c13:0:b0:48d:d87:b6e1 with SMTP id
 o19-20020a198c13000000b0048d0d87b6e1mr966005lfd.238.1660032720941; 
 Tue, 09 Aug 2022 01:12:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6SbVQEalCTwkV1xKh/uWZqbVZ/9A4DkXdnyHVuTU8MPAiALDf43JghJfkXERJxYdLWe8KtV4AonGikKDUvV1o=
X-Received: by 2002:a19:8c13:0:b0:48d:d87:b6e1 with SMTP id
 o19-20020a198c13000000b0048d0d87b6e1mr965993lfd.238.1660032720681; Tue, 09
 Aug 2022 01:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220809025010.200289-1-chen.zhang@intel.com>
In-Reply-To: <20220809025010.200289-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 16:11:49 +0800
Message-ID: <CACGkMEuWcLuGBfJ3zyEw2qi8=C80f13Tt1_t1fJj1D4k8PNRiw@mail.gmail.com>
Subject: Re: [PATCH V3] net/colo.c: Fix the pointer issue reported by Coverity.
To: Zhang Chen <chen.zhang@intel.com>
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

On Tue, Aug 9, 2022 at 11:05 AM Zhang Chen <chen.zhang@intel.com> wrote:
>
> When enable the virtio-net-pci, guest network packet will
> load the vnet_hdr. In COLO status, the primary VM's network
> packet maybe redirect to another VM, it need filter-redirect
> enable the vnet_hdr flag at the same time, COLO-proxy will
> correctly parse the original network packet. If have any
> misconfiguration here, the vnet_hdr_len is wrong for parse
> the packet, the data+offset will point to wrong place.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo.c | 18 ++++++++++--------
>  net/colo.h |  1 +
>  2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/net/colo.c b/net/colo.c
> index 6b0ff562ad..4f1b4a61f6 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -44,21 +44,23 @@ int parse_packet_early(Packet *pkt)
>  {
>      int network_length;
>      static const uint8_t vlan[] = {0x81, 0x00};
> -    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> +    uint8_t *data = pkt->data;
>      uint16_t l3_proto;
>      ssize_t l2hdr_len;
>
> -    if (data == NULL) {
> -        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> +    assert(data);
> +
> +    /* Check the received vnet_hdr_len then add the offset */
> +    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr)) ||

Virtio-net starts to support RSS so it means the vnet_hdr size could
be greater than virtio_net_hdr now.

Or did you actually mean "<" here?

Thanks

> +        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
> +        + pkt->vnet_hdr_len)) {
> +        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
>                                          "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
>          return 1;
>      }
> -    l2hdr_len = eth_get_l2_hdr_length(data);
> +    data += pkt->vnet_hdr_len;
>
> -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> -        return 1;
> -    }
> +    l2hdr_len = eth_get_l2_hdr_length(data);
>
>      /*
>       * TODO: support vlan.
> diff --git a/net/colo.h b/net/colo.h
> index 8b3e8d5a83..22fc3031f7 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,7 @@
>  #include "qemu/jhash.h"
>  #include "qemu/timer.h"
>  #include "net/eth.h"
> +#include "standard-headers/linux/virtio_net.h"
>
>  #define HASHTABLE_MAX_SIZE 16384
>
> --
> 2.25.1
>


