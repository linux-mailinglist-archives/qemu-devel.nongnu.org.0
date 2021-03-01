Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C53294B6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 23:14:49 +0100 (CET)
Received: from localhost ([::1]:41016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqoS-0002bh-DR
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 17:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqgA-0002MV-V4
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:06:14 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqg9-0002cc-6h
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:06:14 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MryKr-1lbaW20KMH-00o04H; Mon, 01 Mar 2021 23:06:07 +0100
Subject: Re: [PATCH v2 15/42] esp: introduce esp_pdma_read() and
 esp_pdma_write() functions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ebfda263-f167-2bfa-8f55-5dccbf96d68b@vivier.eu>
Date: Mon, 1 Mar 2021 23:06:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8sS5IBIErBcQGuglxHBGwgmIvqr58UYDX6WBZ9md2yNp7vGxH2u
 q11pPTmN9Gj7FR3b5MKvuJn/ckIiOGf7gdA6b2wnd2D+wFEeA5rg3hGTe9dE/UEaAfIgNck
 N5wPw2/FS+S0I3RDQcXxFnNTUzwDW8TPWuBSJ6QPKUh9U9op+p9j4UJ5dgolnlLfMSVbeX1
 +tXzCa5GYhSKE0HqUNBGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9J+08Bfz+gU=:1V+kWmIUhSyr/lPLGdcjxY
 ueqvU5LSCSqOIlLUyExFYD2YHarxozDe6ZyGENrWEj4WMk5xwmb47YpWQw8JuGha1ZC4c967A
 dw/s3SZj4ThHeMPdJkTZcpOXfut3/8q5t7Ys2hKTBOp0x/LocZbJENqDfpPtYzO7kQqVz0g3q
 ooXQMC+GALvnHpeinyq2X+ImYO8/SPQNcbJcjeZ3KNLGxWM7ZTtNT5ZMTDIL582S3mjEM9sWI
 XEKbBM4gLNU0ac3odhxk4WI1gicdDY1UU1l9Zae0gL7MA1mJZV3sPBZI2s7qKRuOK0BkhPDhc
 W+urun6Y89S8Gwf0G++nYBVANJXNmRlDektef2PPJmPjbu/GnsuJgSvh/rvHee8sghzZAayXZ
 05JmOiPwIFR7ZZPj5yz5LLzmvN2bVblYTn31R0Syx1WwpHFvZXObNHhHtpCXcRhJSQmjUqfFp
 e68YwNRfaw==
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index e7cf36f4b8..b0cba889a9 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -151,6 +151,20 @@ static uint8_t *get_pdma_buf(ESPState *s)
>      return NULL;
>  }
>  
> +static uint8_t esp_pdma_read(ESPState *s)
> +{
> +    uint8_t *buf = get_pdma_buf(s);
> +
> +    return buf[s->pdma_cur++];
> +}
> +
> +static void esp_pdma_write(ESPState *s, uint8_t val)
> +{
> +    uint8_t *buf = get_pdma_buf(s);
> +
> +    buf[s->pdma_cur++] = val;
> +}
> +
>  static int get_cmd_cb(ESPState *s)
>  {
>      int target;
> @@ -910,7 +924,6 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>      SysBusESPState *sysbus = opaque;
>      ESPState *s = ESP(&sysbus->esp);
>      uint32_t dmalen = esp_get_tc(s);
> -    uint8_t *buf = get_pdma_buf(s);
>  
>      trace_esp_pdma_write(size);
>  
> @@ -919,13 +932,13 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>      }
>      switch (size) {
>      case 1:
> -        buf[s->pdma_cur++] = val;
> +        esp_pdma_write(s, val);
>          s->pdma_len--;
>          dmalen--;
>          break;
>      case 2:
> -        buf[s->pdma_cur++] = val >> 8;
> -        buf[s->pdma_cur++] = val;
> +        esp_pdma_write(s, val >> 8);
> +        esp_pdma_write(s, val);
>          s->pdma_len -= 2;
>          dmalen -= 2;
>          break;
> @@ -944,7 +957,6 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>      SysBusESPState *sysbus = opaque;
>      ESPState *s = ESP(&sysbus->esp);
>      uint32_t dmalen = esp_get_tc(s);
> -    uint8_t *buf = get_pdma_buf(s);
>      uint64_t val = 0;
>  
>      trace_esp_pdma_read(size);
> @@ -954,13 +966,13 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>      }
>      switch (size) {
>      case 1:
> -        val = buf[s->pdma_cur++];
> +        val = esp_pdma_read(s);
>          s->pdma_len--;
>          dmalen--;
>          break;
>      case 2:
> -        val = buf[s->pdma_cur++];
> -        val = (val << 8) | buf[s->pdma_cur++];
> +        val = esp_pdma_read(s);
> +        val = (val << 8) | esp_pdma_read(s);
>          s->pdma_len -= 2;
>          dmalen -= 2;
>          break;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

