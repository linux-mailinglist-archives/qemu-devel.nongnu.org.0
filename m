Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA132AC63
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:50:48 +0100 (CET)
Received: from localhost ([::1]:36300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCul-0003zr-I0
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCsl-0002Tz-Sk
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:48:43 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCsj-0008BE-U8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:48:43 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MzTCy-1m3W8h43OK-00vSts; Tue, 02 Mar 2021 22:48:36 +0100
Subject: Re: [PATCH v2 24/42] esp: use in-built TC to determine PDMA transfer
 length
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-25-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7dec3d87-08bf-b949-d475-b87152509a29@vivier.eu>
Date: Tue, 2 Mar 2021 22:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-25-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PMjPb9UoNytegyBTJei+Y+FWGR64y+F3cZ9cjVfQ9jTTsH300py
 t+FeYXJdUUuC65/CX1l5+I0OuuzCAoSx4GwkgvBkGIDUGv7AhmfAgwu/Tz6blTy0OIUfqUO
 OvQXx1voii84SfsZXn9bgbTE9GxJtHslc51pxezHGHX6NPj9inZxVYw8RuuLhonf/Byuwi3
 5ygC9co+l8W1yFblsZ2/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C/r4hFFlgiY=:AV8eoyfmwvyHwIlzAGDoap
 h6pKtsH+hcMvp8usFWHyVVf7+SIVieP/noDAyK/V66GGFhDXdH+trSCEnduCmI8DR7OEY6Vt4
 FJnR6B/lJx/gJjhrwJrZl507kr1w9MS9/gyfV9n9Vcs7Febx9nqDg7QRNTOX8uS0VIvxBx48y
 Xix9wXT9E0yNHZ5DAv/GpFJqIxcUhoLerir2w9mrZVB2CitFR0jWpUEzsd1I/EKY6A+q4igcQ
 7SZhDNrqUhgolMgJinJWmAoTt5H/sA2NWNN0XP+tnT8cS4Z4jHAkqjA98jQ8twsQQx7kFR1yC
 XWeyFEFHT6oAJsqOqMlkqeA4rslqx6G/1ruxMk+AkDo5Nl8nTuvMSe7u7fyeZEU0k9XP2I/82
 /8pK+zdSH8zfLLMh14tjKMzpKUmvmtJ5JpJZnzKD1Tc9E0rGDlw0Zaosn6YpG
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
> Real hardware simply counts down using the in-built TC to determine when the
> the PDMA request is complete. Use the TC to determine the PDMA transfer length
> which then enables us to remove the redundant pdma_len variable.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 28 +++++++++++++---------------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 50503a6f53..bff330733f 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -127,10 +127,9 @@ static uint32_t esp_get_stc(ESPState *s)
>      return dmalen;
>  }
>  
> -static void set_pdma(ESPState *s, enum pdma_origin_id origin, uint32_t len)
> +static void set_pdma(ESPState *s, enum pdma_origin_id origin)
>  {
>      s->pdma_origin = origin;
> -    s->pdma_len = len;
>  }
>  
>  static uint8_t esp_pdma_read(ESPState *s)
> @@ -138,7 +137,7 @@ static uint8_t esp_pdma_read(ESPState *s)
>      uint32_t dmalen = esp_get_tc(s);
>      uint8_t val;
>  
> -    if (dmalen == 0 || s->pdma_len == 0) {
> +    if (dmalen == 0) {
>          return 0;
>      }
>  
> @@ -161,7 +160,6 @@ static uint8_t esp_pdma_read(ESPState *s)
>      }
>  
>      s->ti_size--;
> -    s->pdma_len--;
>      dmalen--;
>      esp_set_tc(s, dmalen);
>  
> @@ -172,7 +170,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>  {
>      uint32_t dmalen = esp_get_tc(s);
>  
> -    if (dmalen == 0 || s->pdma_len == 0) {
> +    if (dmalen == 0) {
>          return;
>      }
>  
> @@ -195,7 +193,6 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>      }
>  
>      s->ti_size++;
> -    s->pdma_len--;
>      dmalen--;
>      esp_set_tc(s, dmalen);
>  }
> @@ -243,7 +240,7 @@ static uint32_t get_cmd(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
>          } else {
> -            set_pdma(s, CMD, dmalen);
> +            set_pdma(s, CMD);
>              esp_raise_drq(s);
>              return 0;
>          }
> @@ -406,7 +403,7 @@ static void write_response(ESPState *s)
>              s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
>              s->rregs[ESP_RSEQ] = SEQ_CD;
>          } else {
> -            set_pdma(s, TI, 2);
> +            set_pdma(s, TI);
>              s->pdma_cb = write_response_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -474,7 +471,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
>          } else {
> -            set_pdma(s, CMD, len);
> +            set_pdma(s, CMD);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -497,7 +494,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, ASYNC, len);
> +            set_pdma(s, ASYNC);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -506,7 +503,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_write) {
>              s->dma_memory_write(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, ASYNC, len);
> +            set_pdma(s, ASYNC);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -851,7 +848,6 @@ static const VMStateDescription vmstate_esp_pdma = {
>      .needed = esp_pdma_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_INT32(pdma_origin, ESPState),
> -        VMSTATE_UINT32(pdma_len, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -950,6 +946,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>  {
>      SysBusESPState *sysbus = opaque;
>      ESPState *s = ESP(&sysbus->esp);
> +    uint32_t dmalen;
>  
>      trace_esp_pdma_write(size);
>  
> @@ -962,7 +959,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>          esp_pdma_write(s, val);
>          break;
>      }
> -    if (s->pdma_len == 0 && s->pdma_cb) {
> +    dmalen = esp_get_tc(s);
> +    if (dmalen == 0 && s->pdma_cb) {
>          esp_lower_drq(s);
>          s->pdma_cb(s);
>          s->pdma_cb = NULL;
> @@ -979,7 +977,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>  
>      trace_esp_pdma_read(size);
>  
> -    if (dmalen == 0 || s->pdma_len == 0) {
> +    if (dmalen == 0) {
>          return 0;
>      }
>      switch (size) {
> @@ -992,7 +990,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>          break;
>      }
>      dmalen = esp_get_tc(s);
> -    if (dmalen == 0 || (s->pdma_len == 0 && s->pdma_cb)) {
> +    if (dmalen == 0 && s->pdma_cb) {
>          esp_lower_drq(s);
>          s->pdma_cb(s);
>          s->pdma_cb = NULL;
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 5908d59a0a..1e84b7bfb0 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -57,7 +57,6 @@ struct ESPState {
>      void *dma_opaque;
>      void (*dma_cb)(ESPState *s);
>      int pdma_origin;
> -    uint32_t pdma_len;
>      void (*pdma_cb)(ESPState *s);
>  
>      uint8_t mig_version_id;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

