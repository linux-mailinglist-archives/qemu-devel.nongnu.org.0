Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6832AC71
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 23:03:32 +0100 (CET)
Received: from localhost ([::1]:55412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHD75-0004lB-Hi
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 17:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD61-0004LO-RU
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:02:25 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:44043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD5z-0001gX-Ul
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:02:25 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mo77T-1laYPC0inj-00peA3; Tue, 02 Mar 2021 23:02:17 +0100
Subject: Re: [PATCH v2 28/42] esp: use FIFO for PDMA transfers between
 initiator and device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-29-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ccd7eacd-7bff-0eb1-5f49-e6a2c9eac552@vivier.eu>
Date: Tue, 2 Mar 2021 23:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-29-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jtca7X+tyJqJkGfEoX/PsUF0pGNc6oNxkrswYwTKNWTHRLkemlR
 K31mvXswSZKsSij+GzBbJE9Ymz4fUJILzPWDGX4p+iAEC2P/IYLKpTW1qhSHOlWLXHSZMkd
 pRCT/Bj9VJXrCfu8pM9euUqe1eIDikAlCZYV5N8xKFNUCnr1QNJZ8UJi0KaflvgOIEo8hvn
 C1SOEL7ipeAXrqKO435tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R5uRV+3Tuto=:5R+P+y0eTYMNmTr4gPfRC3
 Yg4IydV178tBIex+7Kgw3LAYvhzBaUOwsUOS+MRh3PvP1i+pCgyUdx5+iY/9oKvtNvsOHp7vt
 4Qiv01VObOR1TOSYz/ntgGpvja2PtW6emCCQco6F79ZzlNjpaJJQHE4Vtd/0g6BxUDuUZhqMF
 ZV/4pLKF+cJni5zrpz5MRovFnJbG0TTrTNN/JE8k6+l/uanvBPa7bmmLDVoKBiQFAV81Rz45R
 HDzO8qjyjdaYrtsFpV4l4U/WPEGhXj4avbHnf0IsuaRQTzFHMeJQjhgTlqGM8puQ171LVbA6Y
 MX7twEh39DyUZ1x8ugF+duxFUaKddxUmdprdq0H40mIy49EWNS3n1qqpWi5GCKkwRHy9QSm3A
 F3be5uPBTSa2N2hV4VkmKUDGOi4R+aVwTg7Dbiu4SqO1RwT48oqYIiolc38cJ
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
> PDMA as implemented on the Quadra 800 uses DREQ to load data into the FIFO
> up to a maximum of 16 bytes at a time. The MacOS toolbox ROM requires this
> because it mixes FIFO and PDMA transfers whilst checking the FIFO status
> and counter registers to ensure success.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 109 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 75 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index b7ab5a5592..5dcd4cd651 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -134,13 +134,8 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin)
>  
>  static uint8_t esp_pdma_read(ESPState *s)
>  {
> -    uint32_t dmalen = esp_get_tc(s);
>      uint8_t val;
>  
> -    if (dmalen == 0) {
> -        return 0;
> -    }
> -
>      switch (s->pdma_origin) {
>      case TI:
>          if (s->do_cmd) {
> @@ -160,10 +155,6 @@ static uint8_t esp_pdma_read(ESPState *s)
>          g_assert_not_reached();
>      }
>  
> -    s->ti_size--;
> -    dmalen--;
> -    esp_set_tc(s, dmalen);
> -
>      return val;
>  }
>  
> @@ -194,7 +185,6 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>          g_assert_not_reached();
>      }
>  
> -    s->ti_size++;
>      dmalen--;
>      esp_set_tc(s, dmalen);
>  }
> @@ -290,6 +280,7 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
>      s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
>      s->rregs[ESP_RSEQ] = SEQ_CD;
>      esp_raise_irq(s);
> +    esp_lower_drq(s);
>  }
>  
>  static void do_cmd(ESPState *s)
> @@ -447,28 +438,71 @@ static void esp_dma_done(ESPState *s)
>  static void do_dma_pdma_cb(ESPState *s)
>  {
>      int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
> +    int len;
>  
>      if (s->do_cmd) {
>          s->ti_size = 0;
>          s->cmdlen = 0;
>          s->do_cmd = 0;
>          do_cmd(s);
> +        esp_lower_drq(s);
>          return;
>      }
> -    if (s->async_len == 0) {
> -        scsi_req_continue(s->current_req);
> -        /*
> -         * If there is still data to be read from the device then
> -         * complete the DMA operation immediately.  Otherwise defer
> -         * until the scsi layer has completed.
> -         */
> -        if (to_device || esp_get_tc(s) != 0 || s->ti_size == 0) {
> +
> +    if (to_device) {
> +        /* Copy FIFO data to device */
> +        len = MIN(s->ti_wptr, TI_BUFSZ);
> +        memcpy(s->async_buf, s->ti_buf, len);
> +        s->ti_wptr = 0;
> +        s->ti_rptr = 0;
> +        s->async_buf += len;
> +        s->async_len -= len;
> +        s->ti_size += len;
> +        if (s->async_len == 0) {
> +            scsi_req_continue(s->current_req);
>              return;
>          }
> -    }
>  
> -    /* Partially filled a scsi buffer. Complete immediately.  */
> -    esp_dma_done(s);
> +        if (esp_get_tc(s) == 0) {
> +            esp_lower_drq(s);
> +            esp_dma_done(s);
> +        }
> +
> +        return;
> +    } else {
> +        if (s->async_len == 0) {
> +            if (s->current_req) {
> +                scsi_req_continue(s->current_req);
> +            }
> +
> +            /*
> +             * If there is still data to be read from the device then
> +             * complete the DMA operation immediately.  Otherwise defer
> +             * until the scsi layer has completed.
> +             */
> +            if (esp_get_tc(s) != 0 || s->ti_size == 0) {
> +                return;
> +            }
> +        }
> +
> +        if (esp_get_tc(s) != 0) {
> +            /* Copy device data to FIFO */
> +            s->ti_wptr = 0;
> +            s->ti_rptr = 0;
> +            len = MIN(s->async_len, TI_BUFSZ);
> +            memcpy(s->ti_buf, s->async_buf, len);
> +            s->ti_wptr += len;
> +            s->async_buf += len;
> +            s->async_len -= len;
> +            s->ti_size -= len;
> +            esp_set_tc(s, esp_get_tc(s) - len);
> +            return;
> +        }
> +
> +        /* Partially filled a scsi buffer. Complete immediately.  */
> +        esp_lower_drq(s);
> +        esp_dma_done(s);
> +    }
>  }
>  
>  static void esp_do_dma(ESPState *s)
> @@ -511,7 +545,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, ASYNC);
> +            set_pdma(s, TI);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -520,9 +554,20 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_write) {
>              s->dma_memory_write(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, ASYNC);
> +            /* Copy device data to FIFO */
> +            len = MIN(len, TI_BUFSZ - s->ti_wptr);
> +            memcpy(&s->ti_buf[s->ti_wptr], s->async_buf, len);
> +            s->ti_wptr += len;
> +            s->async_buf += len;
> +            s->async_len -= len;
> +            s->ti_size -= len;
> +            esp_set_tc(s, esp_get_tc(s) - len);
> +            set_pdma(s, TI);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
> +
> +            /* Indicate transfer to FIFO is complete */
> +            s->rregs[ESP_RSTAT] |= STAT_TC;
>              return;
>          }
>      }
> @@ -548,6 +593,7 @@ static void esp_do_dma(ESPState *s)
>  
>      /* Partially filled a scsi buffer. Complete immediately.  */
>      esp_dma_done(s);
> +    esp_lower_drq(s);
>  }
>  
>  static void esp_report_command_complete(ESPState *s, uint32_t status)
> @@ -564,6 +610,7 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
>      s->status = status;
>      s->rregs[ESP_RSTAT] = STAT_ST;
>      esp_dma_done(s);
> +    esp_lower_drq(s);
>      if (s->current_req) {
>          scsi_req_unref(s->current_req);
>          s->current_req = NULL;
> @@ -606,6 +653,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
>           * completion interrupt is deferred to here.
>           */
>          esp_dma_done(s);
> +        esp_lower_drq(s);
>      }
>  }
>  
> @@ -977,10 +1025,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>          break;
>      }
>      dmalen = esp_get_tc(s);
> -    if (dmalen == 0 && s->pdma_cb) {
> -        esp_lower_drq(s);
> +    if (dmalen == 0 || (s->ti_wptr == TI_BUFSZ)) {
>          s->pdma_cb(s);
> -        s->pdma_cb = NULL;
>      }
>  }
>  
> @@ -989,14 +1035,10 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>  {
>      SysBusESPState *sysbus = opaque;
>      ESPState *s = ESP(&sysbus->esp);
> -    uint32_t dmalen = esp_get_tc(s);
>      uint64_t val = 0;
>  
>      trace_esp_pdma_read(size);
>  
> -    if (dmalen == 0) {
> -        return 0;
> -    }
>      switch (size) {
>      case 1:
>          val = esp_pdma_read(s);
> @@ -1006,11 +1048,10 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>          val = (val << 8) | esp_pdma_read(s);
>          break;
>      }
> -    dmalen = esp_get_tc(s);
> -    if (dmalen == 0 && s->pdma_cb) {
> -        esp_lower_drq(s);
> +    if (s->ti_rptr == s->ti_wptr) {
> +        s->ti_wptr = 0;
> +        s->ti_rptr = 0;
>          s->pdma_cb(s);
> -        s->pdma_cb = NULL;
>      }
>      return val;
>  }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

