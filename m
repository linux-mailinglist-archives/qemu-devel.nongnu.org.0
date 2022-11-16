Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5C62B226
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 05:14:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov9oL-0001zA-13; Tue, 15 Nov 2022 23:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ov9oI-0001yc-Fy
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 23:14:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ov9oG-0004do-6f
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 23:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668572039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJJLAVeeM3pJpDiaMm8KBuLSBMWpTbeWjMx1MqRUKWk=;
 b=EqqLr/TuMWW1ow/SSWmuKEXYg8WdwzWD45dxpzUzf2QuGFYnu6dq7HSswGWXwf/txp+sWS
 kMmwTvPlPzEkdU50OTSuHb6zi/bc85D20i9Vq3Kj/3zP8OlVsvRMzo3YxWI4jP7s3trvK2
 BgInkWB0laZDNg9qMB9ZjA41oMDuOBc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-rqn__1IPO8WGudXg8F3wAA-1; Tue, 15 Nov 2022 23:13:57 -0500
X-MC-Unique: rqn__1IPO8WGudXg8F3wAA-1
Received: by mail-oi1-f198.google.com with SMTP id
 bj30-20020a056808199e00b0035a0734664bso5470084oib.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 20:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJJLAVeeM3pJpDiaMm8KBuLSBMWpTbeWjMx1MqRUKWk=;
 b=bb/KRerSEJPl82nl1eSF8jDWBWyVawTyrueMDDT/QLvbGlRMvb5JD9Gj44uuMezuK/
 RTTaRbyAX4OEuk+CU25A6ef36U0vU8ErLZ0ib/r+FpBoUXZrWtea4opPtYrdxzBZdvDj
 nWJQUb2sU3/YWWC+ThRa/1+TACYz9WbvyLxgcR4elPUQ1AuVna+ge6yfKMWxu2FcvS0p
 KYT/NU8xcOb5NXMppVIq4fapTBxiKZuGz3zIpGSSedmonWdfpBKFy5hCYtelLUxsimFS
 0dzyo80jGma3JUQF7+Knoi4Vtq3LbEbjfklmSZsCy84REknmFi8cP4orv1Rag7p4sFFH
 olEw==
X-Gm-Message-State: ANoB5pneXh/dgNwRaEqE4irmJmM+ITgszGinF1qq9Ia5rNSuv8kNQc9Z
 92K9Q3L5uD84/3JDhQe0pxQTrR9bVsAmib51IqfdmeVRJMn/WY835EnQCTIj1/efK9v/KeqgFKy
 0BIKgYMzbq+qZCtpyyZRbo9sl3UwtAcw=
X-Received: by 2002:a05:6808:3cd:b0:359:f5eb:82ec with SMTP id
 o13-20020a05680803cd00b00359f5eb82ecmr678248oie.280.1668572036817; 
 Tue, 15 Nov 2022 20:13:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Ni0pW7Qe5C9Nzk424k5XfVKQQmA2c72otNfvdXdDFIIVYVry1Sj03+TLBF5Ofy5Y8Hc6SPVAGqz45U1XQty8=
X-Received: by 2002:a05:6808:3cd:b0:359:f5eb:82ec with SMTP id
 o13-20020a05680803cd00b00359f5eb82ecmr678240oie.280.1668572036530; Tue, 15
 Nov 2022 20:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
In-Reply-To: <20221115163659.1595865-1-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Nov 2022 12:13:45 +0800
Message-ID: <CACGkMEt=XYBGKBhU2XG37hTk7SzLPF+zLf_mCFw20NsuW-SXMQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Tobias Fiebig <tobias+git@fiebig.nl>
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

On Wed, Nov 16, 2022 at 12:37 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
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
>  hw/net/rtl8139.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> Tobias: Please test this fix. Thanks!
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index e6643e3c9d..ecc4dcb07f 100644
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
> @@ -2151,8 +2150,8 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>
>                  int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;
>
> -                DPRINTF("+++ C+ mode offloaded task TSO MTU=%d IP data %d "
> -                    "frame data %d specified MSS=%d\n", ETH_MTU,
> +                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
> +                    "frame data %d specified MSS=%d\n",
>                      ip_data_len, saved_size - ETH_HLEN, large_send_mss);
>
>                  int tcp_send_offset = 0;
> @@ -2177,9 +2176,13 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                      goto skip_offload;
>                  }
>
> -                /* ETH_MTU = ip header len + tcp header len + payload */
> +                /* MSS too small? */
> +                if (tcp_hlen + hlen >= large_send_mss) {
> +                    goto skip_offload;
> +                }
> +
>                  int tcp_data_len = ip_data_len - tcp_hlen;
> -                int tcp_chunk_size = ETH_MTU - hlen - tcp_hlen;
> +                int tcp_chunk_size = large_send_mss - hlen - tcp_hlen;
>
>                  DPRINTF("+++ C+ mode TSO IP data len %d TCP hlen %d TCP "
>                      "data len %d TCP chunk size %d\n", ip_data_len,
> --
> 2.38.1
>


