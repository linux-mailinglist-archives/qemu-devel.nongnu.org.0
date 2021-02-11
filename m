Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2F3196A7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:32:23 +0100 (CET)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALRe-0002UD-Ds
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lALPM-000167-6c; Thu, 11 Feb 2021 18:30:00 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lALPK-0001oF-9B; Thu, 11 Feb 2021 18:29:59 -0500
Received: by mail-wr1-x434.google.com with SMTP id n6so5868939wrv.8;
 Thu, 11 Feb 2021 15:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=shsCb7Pl+v73lHkqp1a23fBmY+0MMylaHPDhDrfGoTA=;
 b=Wl4RGeNGDZnn+06H01Adq3MH8tiJVo21sx8jOuxf7v2MNG8eSYOP3wnC32rZsRr5DU
 dwYI/Op22f4wRwX6gcCpN/9jIuF22AWnQXPHxlm3KOkhAc8OLDP4cNpCN/J7q5U07sQD
 UAXFmhvaTjU4Qs2WK6xRALx8IfkUeQYoRBl5J9CRyJKX+WunbLnDu912cO/VgUUgG7ef
 rkG/FNHq14+umincN8pPv2tJIincV4AlhUJFOlzd5xMxAsXw35Fu0c1ZyZoqQDSiZoqM
 Mwg9i/NXAq+OfzjcOX1+7PNatBtakQ7rXzr7fBuoLSIIfN3wIi/Vg2cbt2qB5hvMaaKM
 9EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=shsCb7Pl+v73lHkqp1a23fBmY+0MMylaHPDhDrfGoTA=;
 b=rSEMowCWMc1cUAiDZHRNBrQXd7xg+BoIaTRKglC5Sk15ACNKhHjQbnV63kdgEQgp4L
 99LYXTHhILhNzaeDN9aGz04u291Yiu2GfWTW7CRl2g+wekoeCUwdS0EuoLCUmcEj34fV
 iMQuIQiv9UpTsnuApcC+0C26qITCzGHfrXk67/FbKkYXmqj0RY511mLqV1Lqa74VbEDa
 YbXnaXpLJjJ21urQFTaKX5WyMz8toYTGvlgjGFamdmpikvIy18qZ4LVJcbdzlokW8vwa
 7Uc3TqX9G5rRCmb6ABfaJFC5nMEHWCKdgrIWvQvNLl7jmyZbRat7pTS497TN/EPpOtlJ
 w8UQ==
X-Gm-Message-State: AOAM530+1WTvQ3Zksgouf6V5TH3uQuA4pK6rXgOAQeN/OfcXGqXuPd4e
 LtEnqOxMMjcXFXQ6rMxk3Mg=
X-Google-Smtp-Source: ABdhPJy3D+Sdo8lq4nfMKKro+uHNiUN34oDaYMOuCh5+zB2jJSNDCvl7ubTaxuS91VlUZQejFov7Zg==
X-Received: by 2002:adf:f089:: with SMTP id n9mr217266wro.98.1613086196107;
 Thu, 11 Feb 2021 15:29:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y2sm10665870wmg.13.2021.02.11.15.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:29:55 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/net/allwinner-sun8i-emac: traverse transmit queue
 using TX_CUR_DESC register value
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <20210211220055.19047-3-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eaf1d893-2cae-0871-dae5-dd42ce0e50b4@amsat.org>
Date: Fri, 12 Feb 2021 00:29:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220055.19047-3-nieklinnenbank@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, f4bug@amsat.org, b.galvani@gmail.com,
 qemu-arm@nongnu.org, Pavel.Dovgaluk@ispras.ru, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> Currently the emulated EMAC for sun8i always traverses the transmit queue
> from the head when transferring packets. It searches for a list of consecutive
> descriptors whichs are flagged as ready for processing and transmits their payloads
> accordingly. The controller stops processing once it finds a descriptor that is not
> marked ready.
> 
> While the above behaviour works in most situations, it is not the same as the actual
> EMAC in hardware. Actual hardware uses the TX_CUR_DESC register value to keep track
> of the last position in the transmit queue and continues processing from that position
> when software triggers the start of DMA processing. The currently emulated behaviour can
> lead to packet loss on transmit when software fills the transmit queue with ready
> descriptors that overlap the tail of the circular list.
> 
> This commit modifies the emulated EMAC for sun8i such that it processes
> the transmit queue using the TX_CUR_DESC register in the same way as hardware.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  hw/net/allwinner-sun8i-emac.c | 58 +++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 26 deletions(-)

LGTM but I'd feel safer with another review on top.
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
> index 042768922c..e586c147e5 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -339,35 +339,40 @@ static void allwinner_sun8i_emac_update_irq(AwSun8iEmacState *s)
>      qemu_set_irq(s->irq, (s->int_sta & s->int_en) != 0);
>  }
>  
> -static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
> -                                               FrameDescriptor *desc,
> -                                               size_t min_size)
> +static bool allwinner_sun8i_emac_desc_owned(FrameDescriptor *desc,
> +                                            size_t min_buf_size)
>  {
> -    uint32_t paddr = desc->next;
> +    return (desc->status & DESC_STATUS_CTL) && (min_buf_size == 0 ||
> +           (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_buf_size);
> +}
>  
> -    dma_memory_read(&s->dma_as, paddr, desc, sizeof(*desc));
> +static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
> +                                          FrameDescriptor *desc,
> +                                          uint32_t phys_addr)
> +{
> +    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc));
> +}
>  
> -    if ((desc->status & DESC_STATUS_CTL) &&
> -        (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
> -        return paddr;
> -    } else {
> -        return 0;
> -    }
> +static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
> +                                               FrameDescriptor *desc)
> +{
> +    const uint32_t nxt = desc->next;
> +    allwinner_sun8i_emac_get_desc(s, desc, nxt);
> +    return nxt;
>  }
>  
> -static uint32_t allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
> -                                              FrameDescriptor *desc,
> -                                              uint32_t start_addr,
> -                                              size_t min_size)
> +static uint32_t allwinner_sun8i_emac_find_desc(AwSun8iEmacState *s,
> +                                               FrameDescriptor *desc,
> +                                               uint32_t start_addr,
> +                                               size_t min_size)
>  {
>      uint32_t desc_addr = start_addr;
>  
>      /* Note that the list is a cycle. Last entry points back to the head. */
>      while (desc_addr != 0) {
> -        dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc));
> +        allwinner_sun8i_emac_get_desc(s, desc, desc_addr);
>  
> -        if ((desc->status & DESC_STATUS_CTL) &&
> -            (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
> +        if (allwinner_sun8i_emac_desc_owned(desc, min_size)) {
>              return desc_addr;
>          } else if (desc->next == start_addr) {
>              break;
> @@ -383,14 +388,14 @@ static uint32_t allwinner_sun8i_emac_rx_desc(AwSun8iEmacState *s,
>                                               FrameDescriptor *desc,
>                                               size_t min_size)
>  {
> -    return allwinner_sun8i_emac_get_desc(s, desc, s->rx_desc_curr, min_size);
> +    return allwinner_sun8i_emac_find_desc(s, desc, s->rx_desc_curr, min_size);
>  }
>  
>  static uint32_t allwinner_sun8i_emac_tx_desc(AwSun8iEmacState *s,
> -                                             FrameDescriptor *desc,
> -                                             size_t min_size)
> +                                             FrameDescriptor *desc)
>  {
> -    return allwinner_sun8i_emac_get_desc(s, desc, s->tx_desc_head, min_size);
> +    allwinner_sun8i_emac_get_desc(s, desc, s->tx_desc_curr);
> +    return s->tx_desc_curr;
>  }
>  
>  static void allwinner_sun8i_emac_flush_desc(AwSun8iEmacState *s,
> @@ -470,7 +475,8 @@ static ssize_t allwinner_sun8i_emac_receive(NetClientState *nc,
>          bytes_left -= desc_bytes;
>  
>          /* Move to the next descriptor */
> -        s->rx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc, 64);
> +        s->rx_desc_curr = allwinner_sun8i_emac_find_desc(s, &desc, desc.next,
> +                                                         AW_SUN8I_EMAC_MIN_PKT_SZ);
>          if (!s->rx_desc_curr) {
>              /* Not enough buffer space available */
>              s->int_sta |= INT_STA_RX_BUF_UA;
> @@ -495,10 +501,10 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
>      size_t transmitted = 0;
>      static uint8_t packet_buf[2048];
>  
> -    s->tx_desc_curr = allwinner_sun8i_emac_tx_desc(s, &desc, 0);
> +    s->tx_desc_curr = allwinner_sun8i_emac_tx_desc(s, &desc);
>  
>      /* Read all transmit descriptors */
> -    while (s->tx_desc_curr != 0) {
> +    while (allwinner_sun8i_emac_desc_owned(&desc, 0)) {
>  
>          /* Read from physical memory into packet buffer */
>          bytes = desc.status2 & DESC_STATUS2_BUF_SIZE_MASK;
> @@ -524,7 +530,7 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
>              packet_bytes = 0;
>              transmitted++;
>          }
> -        s->tx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc, 0);
> +        s->tx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc);
>      }
>  
>      /* Raise transmit completed interrupt */
> 


