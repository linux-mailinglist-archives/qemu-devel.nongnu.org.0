Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616332949A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 23:12:43 +0100 (CET)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqmP-00083h-Uz
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 17:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqjy-0006i0-72
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:10:11 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:35733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqju-0004EQ-AN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:10:09 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1Yl9-1lEvrY3rYJ-0037K4; Mon, 01 Mar 2021 23:10:00 +0100
Subject: Re: [PATCH v2 17/42] esp: move pdma_len and TC logic into
 esp_pdma_read()/esp_pdma_write()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-18-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4628ced5-7538-cf2b-a612-09ee6c303afc@vivier.eu>
Date: Mon, 1 Mar 2021 23:09:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-18-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MqeePP1OOrkpOoGv1Ez+QWRRbCVTwuj2ySxXjGZ7uVaOCZISCrx
 GfvG31DMRMhBYhbcrXiFYInRo3ae9fFcIqYgZUfaQRrVn5MgCll+whpaWyzVxj438oxPYLI
 GDK9qd+0meb3WOPIVku+3ju3oFZ+cfmvcQU+XofB3hNhVNr/WvGL0VmJc5fWM1kLefhqEey
 SIXI5raOJ/R2+6W+CTBxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s+pyXlXpQcg=:tXaBlYdfpQc6ODyhESALQC
 mAktSWEH4j+MJCoswSaPpLkBrmtjjsq1VCxz3aHohpfVZAJZRVW6YXE5CRL3dJXjLxDcc0ATg
 QCpWArTssxJXOQo0yhp1/bKkVhm/N8XW8zA0EvgU3GtPxboawoZ9gdI4jSFXeC4opT3veOnez
 oAgIuI3IaGilhaVbabsIPoHRCQ8dgbXLN6+vI6VykQqfbHpdeL7Ff2W5/blQ33DYWoCqyc45c
 YeiZguKdBynPdYAO+g/2FYP8oFtRzbhd4pflFA3AQjsaOVg06uhCbPihRBkr8m+wY/oy42wU9
 Z9gVTCyibWrpmhaBcI2X0FIByBXewi1FzQSr7usc6CbwPd9a49zd6Z7DDyNG5LYohTbzzkHkv
 hZeICxhxiLieq7RVbKLJrG5NRoWkdA8jLfHObB14wWiqry+35c7oDRWpEO60N
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
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 50 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index cfeba2feb0..7134c0aff4 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -153,22 +153,45 @@ static uint8_t *get_pdma_buf(ESPState *s)
>  
>  static uint8_t esp_pdma_read(ESPState *s)
>  {
> +    uint32_t dmalen = esp_get_tc(s);
> +    uint8_t val;
> +
> +    if (dmalen == 0 || s->pdma_len == 0) {
> +        return 0;
> +    }
> +
>      switch (s->pdma_origin) {
>      case PDMA:
> -        return s->pdma_buf[s->pdma_cur++];
> +        val = s->pdma_buf[s->pdma_cur++];
> +        break;
>      case TI:
> -        return s->ti_buf[s->pdma_cur++];
> +        val = s->ti_buf[s->pdma_cur++];
> +        break;
>      case CMD:
> -        return s->cmdbuf[s->pdma_cur++];
> +        val = s->cmdbuf[s->pdma_cur++];
> +        break;
>      case ASYNC:
> -        return s->async_buf[s->pdma_cur++];
> +        val = s->async_buf[s->pdma_cur++];
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> +
> +    s->pdma_len--;
> +    dmalen--;
> +    esp_set_tc(s, dmalen);
> +
> +    return val;
>  }
>  
>  static void esp_pdma_write(ESPState *s, uint8_t val)
>  {
> +    uint32_t dmalen = esp_get_tc(s);
> +
> +    if (dmalen == 0 || s->pdma_len == 0) {
> +        return;
> +    }
> +
>      switch (s->pdma_origin) {
>      case PDMA:
>          s->pdma_buf[s->pdma_cur++] = val;
> @@ -185,6 +208,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>      default:
>          g_assert_not_reached();
>      }
> +
> +    s->pdma_len--;
> +    dmalen--;
> +    esp_set_tc(s, dmalen);
>  }
>  
>  static int get_cmd_cb(ESPState *s)
> @@ -945,27 +972,18 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>  {
>      SysBusESPState *sysbus = opaque;
>      ESPState *s = ESP(&sysbus->esp);
> -    uint32_t dmalen = esp_get_tc(s);
>  
>      trace_esp_pdma_write(size);
>  
> -    if (dmalen == 0 || s->pdma_len == 0) {
> -        return;
> -    }
>      switch (size) {
>      case 1:
>          esp_pdma_write(s, val);
> -        s->pdma_len--;
> -        dmalen--;
>          break;
>      case 2:
>          esp_pdma_write(s, val >> 8);
>          esp_pdma_write(s, val);
> -        s->pdma_len -= 2;
> -        dmalen -= 2;
>          break;
>      }
> -    esp_set_tc(s, dmalen);
>      if (s->pdma_len == 0 && s->pdma_cb) {
>          esp_lower_drq(s);
>          s->pdma_cb(s);
> @@ -989,17 +1007,13 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>      switch (size) {
>      case 1:
>          val = esp_pdma_read(s);
> -        s->pdma_len--;
> -        dmalen--;
>          break;
>      case 2:
>          val = esp_pdma_read(s);
>          val = (val << 8) | esp_pdma_read(s);
> -        s->pdma_len -= 2;
> -        dmalen -= 2;
>          break;
>      }
> -    esp_set_tc(s, dmalen);
> +    dmalen = esp_get_tc(s);
>      if (dmalen == 0 || (s->pdma_len == 0 && s->pdma_cb)) {
>          esp_lower_drq(s);
>          s->pdma_cb(s);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

