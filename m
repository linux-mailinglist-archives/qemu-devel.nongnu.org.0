Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888AD32BA5C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:24:06 +0100 (CET)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHY2P-00044S-L1
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHY1K-0003Mj-Mi
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:22:58 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:40611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHY1I-0002x7-UG
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:22:58 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6bPS-1lr3NU3DOI-01840N; Wed, 03 Mar 2021 21:22:50 +0100
Subject: Re: [PATCH v2 42/42] esp: add support for unaligned accesses
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-43-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c17238fc-df51-ee2d-91ce-04f559bebf1d@vivier.eu>
Date: Wed, 3 Mar 2021 21:22:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-43-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8uwFm46xwZaPFSA54Emd9G84eEptV2ztYE4opQYAwDk8dNvhEMw
 OhYvqCXJYheaw8U68VSIEcV6fqi9kup0K6yoq/G6NDZZvlta95NLmgH+osB6EObgQoLXwQy
 G7/SyoTI+FtfIYEaWbaTnPL7ec5B/sM8zD3NnqjDmMhgS1WT1T0Dggc/lMYQVnSHGUIivV+
 xLhbwoOuZ1IkaPaPbf3wQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bpakrh7ZVgA=:qadbdEBNFK5eWJ8dlexM4x
 vW/1oh0JarbEJaxz+3xiJhn2qjuk0Sup1HE0izVHhv191WWZFdF+ge2Hi22JUkK+jp+xALadd
 Qrtdn4TD1ebqZrjP7z7GxwLCSAsUjByjnwmgO60n9sw0VYMchkczQa1W639wBkhE1lqhXWR2u
 PgC/poIPOTi/D5+R8TTMizVN+00JYAeSFHSeNZAljFlB2ntnAg2CPmfWIiLyXOTGmyGNMskvy
 Vco+3q1xsagL9/mTgb429HifQwAPROmVwL2FTaZyxDF+SQEXOzwIriCH4EI/rADPnVtRk4Dsm
 MxMxsI+gxR8pL62XFpm1oy12+qY+gborZDu9gICEtg3HLES17xEP8mbkJgCenilIMKfJIxXNd
 ZlgnIdhHCJZWyiaypH7yzQgR0GpkmuXRGi/eim+HM7Y874si1UOUSWWJd9ne59Jwtme8MGWxl
 dcA/V0VC5w==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
> When the MacOS toolbox ROM transfers data from a target device to an unaligned
> memory address, the first/last byte of a 16-bit transfer needs to be handled
> separately. This means that the first byte is preloaded into the FIFO before
> the transfer, or the last byte remains in the FIFO after the transfer.
> 
> The result of this is that the PDMA routines must be updated so that the FIFO
> is loaded/unloaded if the last 16-bit word is used (rather than the last byte)
> and any remaining byte from a FIFO wraparound is handled correctly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index ae9e265a5d..d2d6366525 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -498,11 +498,22 @@ static void do_dma_pdma_cb(ESPState *s)
>  
>      if (to_device) {
>          /* Copy FIFO data to device */
> -        len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
> +        len = MIN(s->async_len, ESP_FIFO_SZ);
> +        len = MIN(len, fifo8_num_used(&s->fifo));
>          memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
> -        s->async_buf += len;
> -        s->async_len -= len;
> -        s->ti_size += len;
> +        s->async_buf += n;
> +        s->async_len -= n;
> +        s->ti_size += n;
> +
> +        if (n < len) {
> +            /* Unaligned accesses can cause FIFO wraparound */
> +            len = len - n;
> +            memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
> +            s->async_buf += n;
> +            s->async_len -= n;
> +            s->ti_size += n;
> +        }
> +
>          if (s->async_len == 0) {
>              scsi_req_continue(s->current_req);
>              return;
> @@ -532,12 +543,18 @@ static void do_dma_pdma_cb(ESPState *s)
>  
>          if (esp_get_tc(s) != 0) {
>              /* Copy device data to FIFO */
> -            len = MIN(s->async_len, fifo8_num_free(&s->fifo));
> +            len = MIN(s->async_len, esp_get_tc(s));
> +            len = MIN(len, fifo8_num_free(&s->fifo));
>              fifo8_push_all(&s->fifo, s->async_buf, len);
>              s->async_buf += len;
>              s->async_len -= len;
>              s->ti_size -= len;
>              esp_set_tc(s, esp_get_tc(s) - len);
> +
> +            if (esp_get_tc(s) == 0) {
> +                /* Indicate transfer to FIFO is complete */
> +                 s->rregs[ESP_RSTAT] |= STAT_TC;
> +            }
>              return;
>          }
>  
> @@ -612,12 +629,29 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_write) {
>              s->dma_memory_write(s->dma_opaque, s->async_buf, len);
>          } else {
> +            /* Adjust TC for any leftover data in the FIFO */
> +            if (!fifo8_is_empty(&s->fifo)) {
> +                esp_set_tc(s, esp_get_tc(s) - fifo8_num_used(&s->fifo));
> +            }
> +
>              /* Copy device data to FIFO */
>              len = MIN(len, fifo8_num_free(&s->fifo));
>              fifo8_push_all(&s->fifo, s->async_buf, len);
>              s->async_buf += len;
>              s->async_len -= len;
>              s->ti_size -= len;
> +
> +            /*
> +             * MacOS toolbox uses a TI length of 16 bytes for all commands, so
> +             * commands shorter than this must be padded accordingly
> +             */
> +            if (len < esp_get_tc(s) && esp_get_tc(s) <= ESP_FIFO_SZ) {
> +                while (fifo8_num_used(&s->fifo) < ESP_FIFO_SZ) {
> +                    esp_fifo_push(s, 0);
> +                    len++;
> +                }
> +            }
> +
>              esp_set_tc(s, esp_get_tc(s) - len);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
> @@ -1168,7 +1202,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>          break;
>      }
>      dmalen = esp_get_tc(s);
> -    if (dmalen == 0 || fifo8_is_full(&s->fifo)) {
> +    if (dmalen == 0 || fifo8_num_free(&s->fifo) < 2) {
>          s->pdma_cb(s);
>      }
>  }
> @@ -1191,7 +1225,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>          val = (val << 8) | esp_pdma_read(s);
>          break;
>      }
> -    if (fifo8_is_empty(&s->fifo)) {
> +    if (fifo8_num_used(&s->fifo) < 2) {
>          s->pdma_cb(s);
>      }
>      return val;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

