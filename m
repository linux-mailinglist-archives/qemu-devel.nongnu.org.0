Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E455D3294B7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 23:16:39 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqqE-0003hF-VQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 17:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqhp-0003mZ-SC
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:07:59 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqhk-0003JZ-7H
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:07:57 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVMqF-1lOiXO2ulr-00SKmr; Mon, 01 Mar 2021 23:07:45 +0100
Subject: Re: [PATCH v2 16/42] esp: use pdma_origin directly in
 esp_pdma_read()/esp_pdma_write()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-17-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f92a6eda-10b2-a59b-e46e-168ef7245fc4@vivier.eu>
Date: Mon, 1 Mar 2021 23:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-17-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xJ3LHVgIcnXXnEmERtWgnYQ7Yx1mFoW/SSU2NiJCHeT6MjHiwOm
 SsKn6LwJLVl/Sc6G3WsNl0pNrLurEbXB3W2iEhGnpsuLdr8t6TJiHctO3XmOEDKof2RwTmy
 SrT2UW+iltF9P8/knk+kefVpihqbh1Of/cyRodgcG4ZW3GYuB1Yr4vP4DMz6CGuACE8fTbK
 EJuRef47+80N+uB/Vdlrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iZiJ3mRRn/Q=:S2t4J+Nm2WRHIC/mRgBvS0
 9IMeE1dok44+REQh8Q+DKefGh/EguISvmNUm62flAetq9iKcYLw8yPVXu000/McyF1kwseGJn
 +gaSUuy47ipgKRPrOgt8CPYN+5Y9GBdIrx9JhgLFzQiuByFEGIux4d4ZJu598VS44z42bD8xr
 ML7j10Ze0RlwZJLF3IaRxuy0Kr/9Dm8bf7x96OBr9Y7OnO1acSLXjQRyV7AisIP/GKbTu7FcO
 gSTToSCUwbtwsHS/OkYmCK/7pYy5Vb/mHaUgqIEcOzxAs0SHrzR9R2xU9ktyasEq+GtNQq9rK
 pFr4cRPoSK2D5QhfYAs0AxVttXvS9A465wyYqEP2OSMCbyYgjji2i+PEp2lEZBaunc7FGhPbf
 RXcwAhRNMbZghI+ZIF4EA2MWmHiUB/Up/PYdSyuyR6L+Ddlo0E7ow8vO9Fm9f6RCzniL4YQos
 cP41fYOXEA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> This is the first step in removing get_pdma_buf() from esp.c.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index b0cba889a9..cfeba2feb0 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -153,16 +153,38 @@ static uint8_t *get_pdma_buf(ESPState *s)
>  
>  static uint8_t esp_pdma_read(ESPState *s)
>  {
> -    uint8_t *buf = get_pdma_buf(s);
> -
> -    return buf[s->pdma_cur++];
> +    switch (s->pdma_origin) {
> +    case PDMA:
> +        return s->pdma_buf[s->pdma_cur++];
> +    case TI:
> +        return s->ti_buf[s->pdma_cur++];
> +    case CMD:
> +        return s->cmdbuf[s->pdma_cur++];
> +    case ASYNC:
> +        return s->async_buf[s->pdma_cur++];
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
>  
>  static void esp_pdma_write(ESPState *s, uint8_t val)
>  {
> -    uint8_t *buf = get_pdma_buf(s);
> -
> -    buf[s->pdma_cur++] = val;
> +    switch (s->pdma_origin) {
> +    case PDMA:
> +        s->pdma_buf[s->pdma_cur++] = val;
> +        break;
> +    case TI:
> +        s->ti_buf[s->pdma_cur++] = val;
> +        break;
> +    case CMD:
> +        s->cmdbuf[s->pdma_cur++] = val;
> +        break;
> +    case ASYNC:
> +        s->async_buf[s->pdma_cur++] = val;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
>  
>  static int get_cmd_cb(ESPState *s)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

