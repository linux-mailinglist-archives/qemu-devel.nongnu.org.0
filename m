Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6032BA5B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:23:09 +0100 (CET)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHY1U-00039M-Qo
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHY0b-0002ah-H7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:22:13 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHY0Z-0002m8-Cw
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:22:13 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTiDV-1lMeeH235x-00U4JA; Wed, 03 Mar 2021 21:22:04 +0100
Subject: Re: [PATCH v2 41/42] esp: implement non-DMA transfers in PDMA mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-42-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8aa60a55-6847-c2db-7a95-73869f43b1fd@vivier.eu>
Date: Wed, 3 Mar 2021 21:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-42-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:epRCPYNHkWxstqGhAebHhjlJNXZ76nBLcqlrVey2dcxXJDWHh7a
 x49fCcx2eHWjKxKSLoG40J8nifBiPWWK3Ooe6558EXi3BcoSTgSJleypatKHeeyGT2Ala6X
 nu4dc1BP9wYLIBcs2mZzVuo4kMEFZgy0wpPsNDYAo7SpFPT7JUckffEfw4b9lqbq+mu2NYD
 sxAVKSVy6pUfIn2+Ofi8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qNi5VVBPbIk=:QM7XwtzxOOdG0+dSkX5rBP
 kVy/zkPyNeX52ab1etIGgEyuQMLoYzk9VKi16MpFqPJr8ukZrsvBJwAkfUHP48MJkx5W/+8QJ
 oaqdhiZtrHt3Or8DoVFz1trvshb/oM68UNOQWorFyvT4wOIcmeSLW5mgqy4oD3HfqX9pEeZDm
 EgcMdABo0eu/nblcERPJzuxVAP1PHOHvot4AStx1XIW+UHRcMvJ4UBqm3XgxzkivJuftJGf+D
 HB7w976r8MS3nk0vYeFy8pZRuyxuDsIjRgD2EH5Uv7VpSJz0tAsIBFIvvHDxNclhyRl6EHlVp
 7n4RfzwDCiDRr5Gjvtxue6s5YTtrqy/EteMmUuQceeAaOwS92/CU/4ydLWifR1eaymfBkncNg
 OqhJNlbouDSJjkVreps1TMKTB058R0w9MXFVXgw8ZyfXgD0ETTnC0epYNUrC2
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
> The MacOS toolbox ROM uses non-DMA TI commands to handle the first/last byte
> of an unaligned 16-bit transfer to memory.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 133 ++++++++++++++++++++++++++++++------------
>  include/hw/scsi/esp.h |   1 +
>  2 files changed, 98 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 1f01f2314b..ae9e265a5d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -296,6 +296,7 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
>      if (datalen != 0) {
>          s->rregs[ESP_RSTAT] = STAT_TC;
>          s->rregs[ESP_RSEQ] = SEQ_CD;
> +        s->ti_cmd = 0;
>          esp_set_tc(s, 0);
>          if (datalen > 0) {
>              /*
> @@ -651,6 +652,71 @@ static void esp_do_dma(ESPState *s)
>      esp_lower_drq(s);
>  }
>  
> +static void esp_do_nodma(ESPState *s)
> +{
> +    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
> +    uint32_t cmdlen, n;
> +    int len;
> +
> +    if (s->do_cmd) {
> +        cmdlen = fifo8_num_used(&s->cmdfifo);
> +        trace_esp_handle_ti_cmd(cmdlen);
> +        s->ti_size = 0;
> +        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
> +            /* No command received */
> +            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
> +                return;
> +            }
> +
> +            /* Command has been received */
> +            s->do_cmd = 0;
> +            do_cmd(s);
> +        } else {
> +            /*
> +             * Extra message out bytes received: update cmdfifo_cdb_offset
> +             * and then switch to commmand phase
> +             */
> +            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
> +            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
> +            s->rregs[ESP_RSEQ] = SEQ_CD;
> +            s->rregs[ESP_RINTR] |= INTR_BS;
> +            esp_raise_irq(s);
> +        }
> +        return;
> +    }
> +
> +    if (s->async_len == 0) {
> +        /* Defer until data is available.  */
> +        return;
> +    }
> +
> +    if (to_device) {
> +        len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
> +        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
> +        s->async_buf += len;
> +        s->async_len -= len;
> +        s->ti_size += len;
> +    } else {
> +        len = MIN(s->ti_size, s->async_len);
> +        len = MIN(len, fifo8_num_free(&s->fifo));
> +        fifo8_push_all(&s->fifo, s->async_buf, len);
> +        s->async_buf += len;
> +        s->async_len -= len;
> +        s->ti_size -= len;
> +    }
> +
> +    if (s->async_len == 0) {
> +        scsi_req_continue(s->current_req);
> +
> +        if (to_device || s->ti_size == 0) {
> +            return;
> +        }
> +    }
> +
> +    s->rregs[ESP_RINTR] |= INTR_BS;
> +    esp_raise_irq(s);
> +}
> +
>  void esp_command_complete(SCSIRequest *req, uint32_t status,
>                            size_t resid)
>  {
> @@ -708,56 +774,51 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
>          return;
>      }
>  
> -    if (dmalen) {
> -        esp_do_dma(s);
> -    } else if (s->ti_size <= 0) {
> +    if (s->ti_cmd == 0) {
>          /*
> -         * If this was the last part of a DMA transfer then the
> -         * completion interrupt is deferred to here.
> +         * Always perform the initial transfer upon reception of the next TI
> +         * command to ensure the DMA/non-DMA status of the command is correct.
> +         * It is not possible to use s->dma directly in the section below as
> +         * some OSs send non-DMA NOP commands after a DMA transfer. Hence if the
> +         * async data transfer is delayed then s->dma is set incorrectly.
>           */
> -        esp_dma_done(s);
> -        esp_lower_drq(s);
> +        return;
> +    }
> +
> +    if (s->ti_cmd & CMD_DMA) {
> +        if (dmalen) {
> +            esp_do_dma(s);
> +        } else if (s->ti_size <= 0) {
> +            /*
> +             * If this was the last part of a DMA transfer then the
> +             * completion interrupt is deferred to here.
> +             */
> +            esp_dma_done(s);
> +            esp_lower_drq(s);
> +        }
> +    } else {
> +        esp_do_nodma(s);
>      }
>  }
>  
>  static void handle_ti(ESPState *s)
>  {
> -    uint32_t dmalen, cmdlen;
> +    uint32_t dmalen;
>  
>      if (s->dma && !s->dma_enabled) {
>          s->dma_cb = handle_ti;
>          return;
>      }
>  
> -    dmalen = esp_get_tc(s);
> +    s->ti_cmd = s->rregs[ESP_CMD];
>      if (s->dma) {
> +        dmalen = esp_get_tc(s);
>          trace_esp_handle_ti(dmalen);
>          s->rregs[ESP_RSTAT] &= ~STAT_TC;
>          esp_do_dma(s);
> -    } else if (s->do_cmd) {
> -        cmdlen = fifo8_num_used(&s->cmdfifo);
> -        trace_esp_handle_ti_cmd(cmdlen);
> -        s->ti_size = 0;
> -        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
> -            /* No command received */
> -            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
> -                return;
> -            }
> -
> -            /* Command has been received */
> -            s->do_cmd = 0;
> -            do_cmd(s);
> -        } else {
> -            /*
> -             * Extra message out bytes received: update cmdfifo_cdb_offset
> -             * and then switch to commmand phase
> -             */
> -            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
> -            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
> -            s->rregs[ESP_RSEQ] = SEQ_CD;
> -            s->rregs[ESP_RINTR] |= INTR_BS;
> -            esp_raise_irq(s);
> -        }
> +    } else {
> +        trace_esp_handle_ti(s->ti_size);
> +        esp_do_nodma(s);
>      }
>  }
>  
> @@ -796,12 +857,12 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>  
>      switch (saddr) {
>      case ESP_FIFO:
> -        if ((s->rregs[ESP_RSTAT] & STAT_PIO_MASK) == 0) {
> +        if (s->dma_memory_read && s->dma_memory_write &&
> +                (s->rregs[ESP_RSTAT] & STAT_PIO_MASK) == 0) {
>              /* Data out.  */
>              qemu_log_mask(LOG_UNIMP, "esp: PIO data read not implemented\n");
>              s->rregs[ESP_FIFO] = 0;
>          } else {
> -            s->ti_size--;
>              s->rregs[ESP_FIFO] = esp_fifo_pop(s);
>          }
>          val = s->rregs[ESP_FIFO];
> @@ -853,7 +914,6 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          if (s->do_cmd) {
>              esp_cmdfifo_push(s, val & 0xff);
>          } else {
> -            s->ti_size++;
>              esp_fifo_push(s, val & 0xff);
>          }
>  
> @@ -1055,6 +1115,7 @@ const VMStateDescription vmstate_esp = {
>          VMSTATE_UINT8_TEST(cmdfifo_cdb_offset, ESPState, esp_is_version_5),
>          VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
>          VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
> +        VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
>          VMSTATE_END_OF_LIST()
>      },
>  };
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 9da2905f14..a387eb5292 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -40,6 +40,7 @@ struct ESPState {
>      uint32_t do_cmd;
>  
>      bool data_in_ready;
> +    uint8_t ti_cmd;
>      int dma_enabled;
>  
>      uint32_t async_len;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

