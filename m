Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D632AC64
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:53:07 +0100 (CET)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCx0-0005t8-Hs
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCrc-0001mf-Ib
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:47:32 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCra-00086V-PC
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:47:32 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLi4W-1lYsEm2diC-00HhVX; Tue, 02 Mar 2021 22:47:24 +0100
Subject: Re: [PATCH v2 23/42] esp: use ti_wptr/ti_rptr to manage the current
 FIFO position for PDMA
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-24-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f8ba17b1-dfd6-4fd0-af1d-609fb3555c2d@vivier.eu>
Date: Tue, 2 Mar 2021 22:47:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-24-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ySwN7myhkpVZjSI8B1kEDL72beLYO+VOYXlC/Ig00OWqBr3JWUL
 lM0GMfeZKmOjXQRJBD+3tEWoDOkBR+PbGYds/wtFqPjN0BCJ9dUAgQmjWGDECYMvliUbcKh
 1J8LrkVju+zIWTI7j1IuPHzXAqBAYD2XHimXVfmuvmeGbHy9leBXMKT8NTfg3G4gks3J6mT
 2UaYwSKhTP2M3LkzQktRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3T8wdfC5d4M=:0NermTZhW7YxgaiakwTjmT
 x2OFzYUToQv5LciAivaI+sxvzjwIXj1YRApOsRYNUdNEXug6jk6CC1EvyBEJefog492OGXKPm
 nHAQ+pKS7HiBGpoafLIBFW5RlJMd/5VxG/AtBEyJ9MQYPWlwOEEGJubYQEKtwTmhNvv2Emui+
 TY/CDoD39Wl3JsdEYlIRUok+MGFVmC6mrRxdydcGYsrDYL/DBe9hByIHnh9H01f3h0UEzLIEz
 eg4dzjK+iCXLWZKmhP+D3OA0n0GFxQ8JjOLYvBR3WU9v3B8vRTARG8fMkrHBQiOabHmAfjkMa
 tny9r8cq4d5491zGLXhKb6IxuSg6GowYgOJwGVeRgsCQKRxm1/vLKazQvNKYtiufC+nmbDBNv
 ljoq49U7YkHsBfazNbAsHr89HWRuqLnBjwXymsdX02Dls/gIuZ6gC10nuDNIXKANgWBwlxn3M
 Bz6QmQg67g==
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> This eliminates the last user of the PDMA-specific pdma_cur variable which can
> now be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 23 ++++++++---------------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 691a2f4bdc..50503a6f53 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -127,11 +127,9 @@ static uint32_t esp_get_stc(ESPState *s)
>      return dmalen;
>  }
>  
> -static void set_pdma(ESPState *s, enum pdma_origin_id origin,
> -                     uint32_t index, uint32_t len)
> +static void set_pdma(ESPState *s, enum pdma_origin_id origin, uint32_t len)
>  {
>      s->pdma_origin = origin;
> -    s->pdma_cur = index;
>      s->pdma_len = len;
>  }
>  
> @@ -146,11 +144,10 @@ static uint8_t esp_pdma_read(ESPState *s)
>  
>      switch (s->pdma_origin) {
>      case TI:
> -        val = s->ti_buf[s->pdma_cur++];
> +        val = s->ti_buf[s->ti_rptr++];
>          break;
>      case CMD:
>          val = s->cmdbuf[s->cmdlen++];
> -        s->pdma_cur++;
>          break;
>      case ASYNC:
>          val = s->async_buf[0];
> @@ -158,7 +155,6 @@ static uint8_t esp_pdma_read(ESPState *s)
>              s->async_len--;
>              s->async_buf++;
>          }
> -        s->pdma_cur++;
>          break;
>      default:
>          g_assert_not_reached();
> @@ -182,11 +178,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>  
>      switch (s->pdma_origin) {
>      case TI:
> -        s->ti_buf[s->pdma_cur++] = val;
> +        s->ti_buf[s->ti_wptr++] = val;
>          break;
>      case CMD:
>          s->cmdbuf[s->cmdlen++] = val;
> -        s->pdma_cur++;
>          break;
>      case ASYNC:
>          s->async_buf[0] = val;
> @@ -194,7 +189,6 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>              s->async_len--;
>              s->async_buf++;
>          }
> -        s->pdma_cur++;
>          break;
>      default:
>          g_assert_not_reached();
> @@ -249,7 +243,7 @@ static uint32_t get_cmd(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
>          } else {
> -            set_pdma(s, CMD, 0, dmalen);
> +            set_pdma(s, CMD, dmalen);
>              esp_raise_drq(s);
>              return 0;
>          }
> @@ -412,7 +406,7 @@ static void write_response(ESPState *s)
>              s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
>              s->rregs[ESP_RSEQ] = SEQ_CD;
>          } else {
> -            set_pdma(s, TI, 0, 2);
> +            set_pdma(s, TI, 2);
>              s->pdma_cb = write_response_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -480,7 +474,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
>          } else {
> -            set_pdma(s, CMD, s->cmdlen, len);
> +            set_pdma(s, CMD, len);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -503,7 +497,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, ASYNC, 0, len);
> +            set_pdma(s, ASYNC, len);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -512,7 +506,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_write) {
>              s->dma_memory_write(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, ASYNC, 0, len);
> +            set_pdma(s, ASYNC, len);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -858,7 +852,6 @@ static const VMStateDescription vmstate_esp_pdma = {
>      .fields = (VMStateField[]) {
>          VMSTATE_INT32(pdma_origin, ESPState),
>          VMSTATE_UINT32(pdma_len, ESPState),
> -        VMSTATE_UINT32(pdma_cur, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 578d936214..5908d59a0a 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -58,7 +58,6 @@ struct ESPState {
>      void (*dma_cb)(ESPState *s);
>      int pdma_origin;
>      uint32_t pdma_len;
> -    uint32_t pdma_cur;
>      void (*pdma_cb)(ESPState *s);
>  
>      uint8_t mig_version_id;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

