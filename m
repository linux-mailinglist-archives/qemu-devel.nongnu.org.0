Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B832BA4E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:05:40 +0100 (CET)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXkZ-0008Ox-6S
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXjM-0007n9-C0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:04:24 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:57021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXjJ-0005dX-BJ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:04:24 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhUDj-1llOMW00El-00eZas; Wed, 03 Mar 2021 21:04:15 +0100
Subject: Re: [PATCH v2 36/42] esp: add maxlen parameter to get_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-37-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b9614c56-43fa-40d8-d07b-01a5b3b2498f@vivier.eu>
Date: Wed, 3 Mar 2021 21:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-37-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AfuLQJGTp6DXnzxmlKz4m+KXuy40ljUo3TcEu2tLtccK+KD/NaZ
 G/8tgDvkeEZTadIgubBnnFk6TnU7IVri3TELLchZ6ncpDwX14VWgu1dRL80VOMoYwMi85eu
 /hRxI1BJbRSeeZcGMO+Z2yrPMs3Vx3sE8e3QKpqCRXERjF4kl0e2MpYLSsdGNoF2ftXXew6
 j4a7kDEAoGcLpxQfW408g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y+lnxJFk/eY=:IEGw6QMpY8Du+et/sjgMLz
 nUA91pHXMk0o6B/xgsnzNO9tuO4AWMeXsWUxrYO6AvRfEJGuvZ3mqbjPv5tFrG+fjUu6PVPl3
 9Tct5NMJbJ/ySj9M6pBelnjPY9ePheXQYRrfoofJck7KdHnTwG3QlHxAc1GIQ3cVcImrvXxlT
 FhIsNa+AtmPuAqkcFUf95kw+pgvWEXA7GxO+vJj1ohyBKAEhF/H7u5ELlDtdw+EEM4wb/aJKG
 7O8ZbPJJtZ4ygnsvx3tIn+b9xm4t2eKVU+U6gncElHP8yTDKjrLRlh0G3FPFt/56po+DbaX+u
 f7VG7VogtuVHx3csJ0x7BmhriDXa4riPP5gi+huL0dVYQpH17MphT4tkA5UN4x7dEty7tJjgs
 HNnwFthac4cM52S3egnVycITe/khO7EcdhAycxi5jf0i7BSN2IeoT213cEdxETOarMkHcaq7P
 fqJRPSr9yQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
> Some guests use a mixture of DMA and non-DMA transfers in combination with the
> SATN and stop command to transfer message out phase and command phase bytes to
> the target. Prepare for the next commit by adding a maxlen parameter to
> get_cmd() to allow partial transfers.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 617fdcb3ed..058b482fda 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -194,7 +194,7 @@ static int esp_select(ESPState *s)
>      return 0;
>  }
>  
> -static uint32_t get_cmd(ESPState *s)
> +static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>  {
>      uint8_t *buf = s->cmdbuf;
>      uint32_t dmalen;
> @@ -202,8 +202,8 @@ static uint32_t get_cmd(ESPState *s)
>  
>      target = s->wregs[ESP_WBUSID] & BUSID_DID;
>      if (s->dma) {
> -        dmalen = esp_get_tc(s);
> -        if (dmalen > ESP_CMDBUF_SZ) {
> +        dmalen = MIN(esp_get_tc(s), maxlen);
> +        if (dmalen == 0) {
>              return 0;
>          }
>          if (s->dma_memory_read) {
> @@ -216,12 +216,14 @@ static uint32_t get_cmd(ESPState *s)
>              return 0;
>          }
>      } else {
> -        dmalen = s->ti_size;
> -        if (dmalen > TI_BUFSZ) {
> +        dmalen = MIN(s->ti_size, maxlen);
> +        if (dmalen == 0) {
>              return 0;
>          }
>          memcpy(buf, s->ti_buf, dmalen);
> -        buf[0] = buf[2] >> 5;
> +        if (dmalen >= 3) {
> +            buf[0] = buf[2] >> 5;
> +        }
>      }
>      trace_esp_get_cmd(dmalen, target);
>  
> @@ -290,7 +292,7 @@ static void handle_satn(ESPState *s)
>          return;
>      }
>      s->pdma_cb = satn_pdma_cb;
> -    cmdlen = get_cmd(s);
> +    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
>      if (cmdlen > 0) {
>          s->cmdlen = cmdlen;
>          do_cmd(s);
> @@ -320,7 +322,7 @@ static void handle_s_without_atn(ESPState *s)
>          return;
>      }
>      s->pdma_cb = s_without_satn_pdma_cb;
> -    cmdlen = get_cmd(s);
> +    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
>      if (cmdlen > 0) {
>          s->cmdlen = cmdlen;
>          do_busid_cmd(s, s->cmdbuf, 0);
> @@ -355,7 +357,7 @@ static void handle_satn_stop(ESPState *s)
>          return;
>      }
>      s->pdma_cb = satn_stop_pdma_cb;
> -    cmdlen = get_cmd(s);
> +    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
>      if (cmdlen > 0) {
>          trace_esp_handle_satn_stop(s->cmdlen);
>          s->cmdlen = cmdlen;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

