Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC97A63191F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 05:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owyEu-0004Jv-5X; Sun, 20 Nov 2022 23:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owyEn-0004Im-IH
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owyEl-0004x7-HQ
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669004209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iglJ7cPNpF9mt78mgwoSUTUPaWRrUVsFSfMbsBUVRZQ=;
 b=PAo2lgYfXNi+hPeZaQtKJZQ3LZhSbDqRFb54on53clO4V4aAKiYOF60n2QHMNmiLyady4e
 5Sumnm+GSVYBhCLF+Q0+A5RrpbZEEFKJLrT0wcXtzViAtofAWcE2/7pOrjSv9B3TEHxruD
 l/sO3JpXIyAR5qmDkD9sdGplM4C4HsE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-Blwb56jCMvuAi9G6eRwJfQ-1; Sun, 20 Nov 2022 23:16:47 -0500
X-MC-Unique: Blwb56jCMvuAi9G6eRwJfQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 t15-20020a0568301e2f00b0066ceaf260d1so4676569otr.3
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 20:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iglJ7cPNpF9mt78mgwoSUTUPaWRrUVsFSfMbsBUVRZQ=;
 b=5P5zTl7Jc8ctlVqALBqf9Zff71E64aO0MCHlVzsqoNLSszgUJ061EiKzN3JwquYCJS
 iuADT4H3BFLQNUYEvD/h/nwWyPj9E1AT8Ozyj6dPH7o4XSgtETcywQSnvrq7P2GogrZ4
 TPrvxebxGXwZqTUNU417XA9vyx7CqDBUUuCqAkjwX8xma6I4lwGNRoWnrc7lY6QB4EaC
 4cUea3pAfpzxpspGYh5JdTXA/wOOOJ12E1eiIYZgCRXaW1soZRmnj3poLs69VJSDThTs
 gljWMd7pjgHIW+TiJA2RIvuXG2RQgCddYZjheat+IHsMZzNDd/QdogmSdV5OHwK+JMZz
 dJsQ==
X-Gm-Message-State: ANoB5pn9gyM9uizh4+KUA14e8cXSOT2Rz6HRceFyctm7QQQeKnDss1Df
 4S0HDnWmcy5rFLCXgvtrIEx1jNTrGOWC6UnK8JyvwxDF6MpS9bwMCcTR9VMxbfx/4wj7W2V1UYZ
 LH2vb+5MBJzfz/pR0zKiU8o17rahM6sk=
X-Received: by 2002:a05:6808:220b:b0:359:f5eb:82ec with SMTP id
 bd11-20020a056808220b00b00359f5eb82ecmr7857513oib.280.1669004206365; 
 Sun, 20 Nov 2022 20:16:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mkqB3LXNby33YQ4z8p/QQuHMDUZEd2Lf/uq4eBrf+CqZkdFodLx9XlqrTQMA42TMygETLlNeOIPNRlSqOfTY=
X-Received: by 2002:a05:6808:220b:b0:359:f5eb:82ec with SMTP id
 bd11-20020a056808220b00b00359f5eb82ecmr7857504oib.280.1669004205969; Sun, 20
 Nov 2022 20:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-4-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-4-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Nov 2022 12:16:34 +0800
Message-ID: <CACGkMEsXN6_NojBKht5LSeztKi4ZDsvjYvURzHoLA8-YgoAbvQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Tobias Fiebig <tobias+git@fiebig.nl>,
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Nov 18, 2022 at 12:56 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a
> Large-Send MSS value where the driver specifies the MSS. See the
> datasheet here:
> http://realtek.info/pdf/rtl8139cp.pdf
>
> The code ignores this value and uses a hardcoded MSS of 1500 bytes
> instead. When the MTU is less than 1500 bytes the hardcoded value
> results in IP fragmentation and poor performance.
>
> Use the Large-Send MSS value to correctly size Large-Send packets.
>
> Jason Wang <jasowang@redhat.com> noticed that the Large-Send MSS value
> mask was incorrect so it is adjusted to match the datasheet and Linux
> 8139cp driver.
>
> This issue was discussed in the past here:
> https://lore.kernel.org/all/20161114162505.GD26664@stefanha-x1.localdomain/
>
> Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
> Reported-by: Tobias Fiebig <tobias+git@fiebig.nl>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1312
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/net/rtl8139.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 6dd7a8e6e0..700b1b66b6 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -77,7 +77,6 @@
>      ( ( input ) & ( size - 1 )  )
>
>  #define ETHER_TYPE_LEN 2
> -#define ETH_MTU     1500
>
>  #define VLAN_TCI_LEN 2
>  #define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
> @@ -1934,8 +1933,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>  #define CP_TX_LS (1<<28)
>  /* large send packet flag */
>  #define CP_TX_LGSEN (1<<27)
> -/* large send MSS mask, bits 16...25 */
> -#define CP_TC_LGSEN_MSS_MASK ((1 << 12) - 1)
> +/* large send MSS mask, bits 16...26 */
> +#define CP_TC_LGSEN_MSS_SHIFT 16
> +#define CP_TC_LGSEN_MSS_MASK ((1 << 11) - 1)
>
>  /* IP checksum offload flag */
>  #define CP_TX_IPCS (1<<18)
> @@ -2152,10 +2152,11 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                      goto skip_offload;
>                  }
>
> -                int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;
> +                int large_send_mss = (txdw0 >> CP_TC_LGSEN_MSS_SHIFT) &
> +                                     CP_TC_LGSEN_MSS_MASK;
>
> -                DPRINTF("+++ C+ mode offloaded task TSO MTU=%d IP data %d "
> -                    "frame data %d specified MSS=%d\n", ETH_MTU,
> +                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
> +                    "frame data %d specified MSS=%d\n",
>                      ip_data_len, saved_size - ETH_HLEN, large_send_mss);
>
>                  int tcp_send_offset = 0;
> @@ -2180,25 +2181,22 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                      goto skip_offload;
>                  }
>
> -                /* ETH_MTU = ip header len + tcp header len + payload */
>                  int tcp_data_len = ip_data_len - tcp_hlen;
> -                int tcp_chunk_size = ETH_MTU - hlen - tcp_hlen;
>
>                  DPRINTF("+++ C+ mode TSO IP data len %d TCP hlen %d TCP "
> -                    "data len %d TCP chunk size %d\n", ip_data_len,
> -                    tcp_hlen, tcp_data_len, tcp_chunk_size);
> +                    "data len %d\n", ip_data_len, tcp_hlen, tcp_data_len);
>
>                  /* note the cycle below overwrites IP header data,
>                     but restores it from saved_ip_header before sending packet */
>
>                  int is_last_frame = 0;
>
> -                for (tcp_send_offset = 0; tcp_send_offset < tcp_data_len; tcp_send_offset += tcp_chunk_size)
> +                for (tcp_send_offset = 0; tcp_send_offset < tcp_data_len; tcp_send_offset += large_send_mss)
>                  {
> -                    uint16_t chunk_size = tcp_chunk_size;
> +                    uint16_t chunk_size = large_send_mss;
>
>                      /* check if this is the last frame */
> -                    if (tcp_send_offset + tcp_chunk_size >= tcp_data_len)
> +                    if (tcp_send_offset + large_send_mss >= tcp_data_len)
>                      {
>                          is_last_frame = 1;
>                          chunk_size = tcp_data_len - tcp_send_offset;
> @@ -2247,7 +2245,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                      ip->ip_len = cpu_to_be16(hlen + tcp_hlen + chunk_size);
>
>                      /* increment IP id for subsequent frames */
> -                    ip->ip_id = cpu_to_be16(tcp_send_offset/tcp_chunk_size + be16_to_cpu(ip->ip_id));
> +                    ip->ip_id = cpu_to_be16(tcp_send_offset/large_send_mss + be16_to_cpu(ip->ip_id));
>
>                      ip->ip_sum = 0;
>                      ip->ip_sum = ip_checksum(eth_payload_data, hlen);
> --
> 2.38.1
>


