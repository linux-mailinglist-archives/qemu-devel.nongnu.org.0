Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A565B62B247
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 05:21:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov9tz-0004dq-Qj; Tue, 15 Nov 2022 23:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ov9tx-0004dR-R8
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 23:19:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ov9tv-0005tH-S7
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 23:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668572390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=affmViKJ097WeEnUj66Ajgyu//xZ1I5d2ln3nHfVzb8=;
 b=aAoTo+7T7UhSJzLJCWjUbo42+WGhS+qD9+FZGdT443DP8gD2BJZArVr43R47v+S49pjhtN
 RK8JvJeIRFrswoq7aOkxdxjoT+yRIRP7HzAOqDG04+FBV6XQDEjUJYEz8JmmqiTA4ZjJOT
 sTAUC+arIOHWQlxCa+5SO+vqBGCeIqM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-DaTolcUtN3anVgfdTMKMPA-1; Tue, 15 Nov 2022 23:19:47 -0500
X-MC-Unique: DaTolcUtN3anVgfdTMKMPA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-13ba8947e4cso7572910fac.6
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 20:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=affmViKJ097WeEnUj66Ajgyu//xZ1I5d2ln3nHfVzb8=;
 b=Q1jY2V8XVURi8i0YMxhqbpkHtUWom3MpRNR8NPytKLpYWZT0fjgyNRttpMzEaU/RSZ
 Xqg9jt1PladiII3LDLT8hBjHNOEw9NZ7nEVK8rbmJSGEtkYhtjFg8IhQ2e29Q5isk5ck
 5oxP75hTJILomSr1LBGv4uedTRDZu/JvTEQd/eKwE6tXWWY+FTpDGYVHuCIS+TRrcxO/
 uP+TywHdqTlw9AC5envTRkndJgjE5zPfao3qmzwQt2uJ8iJPbBSiptjYIV7vb1zpvCeg
 roNtz14VB70U1h+FlYx2A29AaDF5h476PGMVMOxOUwXlHpxk8RJTDcXDEHoJjPPxn06h
 +WnQ==
X-Gm-Message-State: ANoB5pkNe15T5dDhz4m/AHF4nDqIwNslsNuyR2KOY6wkBm0Dt4fR+noy
 3d9dPn9CJh3pqhwjuCwJVGm1tla374kErs3zNHpxDPPxwEMb556Ybn3R7HZgmjQSPrHCqu8sdmE
 aA5y/5co1NeurrP5qCCQwmbKcGbB+RfM=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr737435oij.35.1668572386470; 
 Tue, 15 Nov 2022 20:19:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6naCBzuCv23NMNyuutTEAd4yeNrW+pi+csTxOmW4BwNFlk8u/g8OKdImQ1oHdZ9MsTo8KYoCXPdKAp+9sNd8g=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr737430oij.35.1668572386250; Tue, 15 Nov
 2022 20:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <010001d8f94b$13bd5bf0$3b3813d0$@fiebig.nl>
In-Reply-To: <010001d8f94b$13bd5bf0$3b3813d0$@fiebig.nl>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Nov 2022 12:19:35 +0800
Message-ID: <CACGkMEtZCZf-qEhqzMATk1skV0_ZmfDsQu=46qbmoCpd_LUN+g@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 16, 2022 at 7:43 AM Tobias Fiebig <tobias@fiebig.nl> wrote:
>
> Heho,
> Just to keep you in the loop; Just applied the patch, but things didn't really get better; I am currently doing a 'make clean; make' for good measure (had built head first), and will also double-check that there is no accidental use of system-qemu libs.
>
> If that still doesn't show an effect, I'll hold tcpdump to the wire again.
>
> With best regards,
> Tobias

It might be also helpful to dump mss saw by Qemu to see if it really
changes or differs a lot from 1500.

Thanks

>
> -----Original Message-----
> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: Tuesday, 15 November 2022 17:37
> To: qemu-devel@nongnu.org
> Cc: jasowang@redhat.com; qemu-stable@nongnu.org; Stefan Hajnoczi <stefanha@redhat.com>; Russell King - ARM Linux <linux@armlinux.org.uk>; Tobias Fiebig <tobias+git@fiebig.nl>
> Subject: [PATCH for-7.2] rtl8139: honor large send MSS value
>
> The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a Large-Send MSS value where the driver specifies the MSS. See the datasheet here:
> http://realtek.info/pdf/rtl8139cp.pdf
>
> The code ignores this value and uses a hardcoded MSS of 1500 bytes instead. When the MTU is less than 1500 bytes the hardcoded value results in IP fragmentation and poor performance.
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
> ---
>  hw/net/rtl8139.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> Tobias: Please test this fix. Thanks!
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c index e6643e3c9d..ecc4dcb07f 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -77,7 +77,6 @@
>      ( ( input ) & ( size - 1 )  )
>
>  #define ETHER_TYPE_LEN 2
> -#define ETH_MTU     1500
>
>  #define VLAN_TCI_LEN 2
>  #define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN) @@ -2151,8 +2150,8 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>
>                  int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;
>
> -                DPRINTF("+++ C+ mode offloaded task TSO MTU=%d IP data %d "
> -                    "frame data %d specified MSS=%d\n", ETH_MTU,
> +                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
> +                    "frame data %d specified MSS=%d\n",
>                      ip_data_len, saved_size - ETH_HLEN, large_send_mss);
>
>                  int tcp_send_offset = 0; @@ -2177,9 +2176,13 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
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
>


