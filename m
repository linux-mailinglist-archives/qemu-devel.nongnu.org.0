Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9B216A6B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 12:35:49 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jskx3-0000EF-0F
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 06:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jskvp-0007l0-De; Tue, 07 Jul 2020 06:34:33 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jskvn-0005Om-Aq; Tue, 07 Jul 2020 06:34:33 -0400
Received: by mail-wm1-x341.google.com with SMTP id l17so42744674wmj.0;
 Tue, 07 Jul 2020 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SHHrVlrgvYvdr+UupFcWTLa2FKml67HTUSieo4VrRf0=;
 b=nvPt8nQNVzUfinh6qmaQvMOy6uE3C2yqo32AfeZz1KNfkzdzTkBsVNO96X3sT3J9mS
 Cv+ANZAvqoQgaWHfvkHM+4Df3aVBnFYAnUF2K3OWa1mCbfi3iOBHqf8WaWs9yBmHSYaF
 HswmjIyYwbQUb2prJVq2jUMJxzUnPGgxrpTmQ+kvOyLMZqCqJdANT0fHgbBWKlbD6Wyb
 G6bgiVIr/53Bg1ZBpN0q9Js+3wxoHTlFux3OBisVFsfyj8jKBdbHRxRaEENpC/d05nAJ
 6tFu4hLyDNpf4ksyB4cS4OAZbq46P2kHDbdXoqNTgIhFd9bGAY3lzn++6K6RF8KIg3zx
 zIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SHHrVlrgvYvdr+UupFcWTLa2FKml67HTUSieo4VrRf0=;
 b=U4Hz7QqcHcpumV+alReNkgMSuOXqIQQMH8kjiCsHatO9QbZMkFSQrPS8MvsmtX0B+s
 TjhTSPRyrtJlYmADA7T64m5FTjSpjvPNf93ZIldiP3PAPKtTJVP/ZsM2fnViDNYmUZ/s
 WYYLQO4x8oPuCsQocHCu19pCVD330X605/abkFR7gmdGaM0yWyDJe/ww8GPpxhrsUCq/
 kcwIcVmw8iJn5wvTqnv/lL/gyE010VygXWzF2/Cwc93k7rczJS+tfPby3A6WUQWyUIlq
 VqwOZma2aV36Y5qbL2tbvWk7KQjTRrbegkqL6Ihq/wrcK9Cun7NcHwHlyPhgSR/6e6XA
 M52w==
X-Gm-Message-State: AOAM531hYUiPgeiXIo0Qixz5wZSVGvxPlIcROfd0THJw+dfDgjju3mxw
 TJIx/QaU3vN0tUXCTZqWs3E=
X-Google-Smtp-Source: ABdhPJzO0PVB8b5p4NaspE667CjOBMks1GRyZfYGjgC5HrDRyuM24PuyDprQBsbuH4KsIK7RY9z1bA==
X-Received: by 2002:a1c:e088:: with SMTP id x130mr3344874wmg.14.1594118069411; 
 Tue, 07 Jul 2020 03:34:29 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id r10sm491680wrm.17.2020.07.07.03.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 03:34:28 -0700 (PDT)
Subject: Re: [PATCH v7 05/17] hw/sd/sdcard: Do not switch to ReceivingData if
 address is invalid
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200630133912.9428-1-f4bug@amsat.org>
 <20200630133912.9428-6-f4bug@amsat.org>
 <CAP+75-V-Uu8-Uk8jMwkgb3xJpFoef=k6p=ejaY4=+njkdb3ZeQ@mail.gmail.com>
 <3b0a65bc-97a7-9f49-da3a-5c680c4b5722@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0d5d56c8-02ea-17ab-c935-077fa96dcf56@amsat.org>
Date: Tue, 7 Jul 2020 12:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3b0a65bc-97a7-9f49-da3a-5c680c4b5722@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/20 12:24 PM, Philippe Mathieu-Daudé wrote:
> On 7/7/20 10:30 AM, Philippe Mathieu-Daudé wrote:
>> On Tue, Jun 30, 2020 at 3:39 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Only move the state machine to ReceivingData if there is no
>>> pending error. This avoids later OOB access while processing
>>> commands queued.
>>>
>>>   "SD Specifications Part 1 Physical Layer Simplified Spec. v3.01"
>>>
>>>   4.3.3 Data Read
>>>
>>>   Read command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
>>>   occurred and no data transfer is performed.
>>>
>>>   4.3.4 Data Write
>>>
>>>   Write command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
>>>   occurred and no data transfer is performed.
>>>
>>> WP_VIOLATION errors are not modified: the error bit is set, we
>>> stay in receive-data state, wait for a stop command. All further
>>> data transfer is ignored. See the check on sd->card_status at the
>>> beginning of sd_read_data() and sd_write_data().
>>>
>>> Fixes: CVE-2020-13253
>>> Cc: Prasad J Pandit <pjp@fedoraproject.org>
>>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1880822
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> v4: Only modify ADDRESS_ERROR, not WP_VIOLATION (pm215)
>>> ---
>>>  hw/sd/sd.c | 34 ++++++++++++++++++++++------------
>>>  1 file changed, 22 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>>> index 04451fdad2..7e0d684aca 100644
>>> --- a/hw/sd/sd.c
>>> +++ b/hw/sd/sd.c
>>> @@ -1167,13 +1167,15 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>>      case 17:   /* CMD17:  READ_SINGLE_BLOCK */
>>>          switch (sd->state) {
>>>          case sd_transfer_state:
>>> -            sd->state = sd_sendingdata_state;
>>> -            sd->data_start = addr;
>>> -            sd->data_offset = 0;
>>>
>>>              if (sd->data_start + sd->blk_len > sd->size) {
>>>                  sd->card_status |= ADDRESS_ERROR;
>>> +                return sd_r1;
>>>              }
>>> +
>>> +            sd->state = sd_sendingdata_state;
>>> +            sd->data_start = addr;
>>> +            sd->data_offset = 0;
>>>              return sd_r1;
>>>
>>>          default:
>>> @@ -1184,13 +1186,15 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>>      case 18:   /* CMD18:  READ_MULTIPLE_BLOCK */
>>>          switch (sd->state) {
>>>          case sd_transfer_state:
>>> -            sd->state = sd_sendingdata_state;
>>> -            sd->data_start = addr;
>>> -            sd->data_offset = 0;
>>>
>>>              if (sd->data_start + sd->blk_len > sd->size) {
>>>                  sd->card_status |= ADDRESS_ERROR;
>>> +                return sd_r1;
>>
>> Unfortunately this breaks guests (Linux at least) when sd->size is not
>> a power of 2,
>> as Linux doesn't expect unrealistic SD card sizes.

I'll go with Peter's suggestion from IRC:
"insist the blk device is the right size and make it an error if not".

> 
> I can use blk_truncate() to expand the image (which must be RW anyway)
> to the ceil pow2 with something like:
> 
> -- >8 --
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index b44999c864..052934f867 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2121,11 +2121,28 @@ static void sd_realize(DeviceState *dev, Error
> **errp)
>      }
> 
>      if (sd->blk) {
> +        int64_t blk_size;
> +
>          if (blk_is_read_only(sd->blk)) {
>              error_setg(errp, "Cannot use read-only drive as SD card");
>              return;
>          }
> 
> +        blk_size = blk_getlength(sd->blk);
> +        if (blk_size > 0) {
> +            int64_t blk_size_aligned = pow2ceil(blk_size);
> +
> +            if (blk_size != blk_size_aligned) {
> +                ret = blk_truncate(sd->blk, blk_size_aligned, false,
> +                                   PREALLOC_MODE_FALLOC,
> +                                   BDRV_REQ_ZERO_WRITE, errp);
> +                if (ret < 0) {
> +                    error_prepend(errp, "Could not resize image: ");
> +                    return;
> +                }
> +            }
> +        }
> +
>          ret = blk_set_perm(sd->blk, BLK_PERM_CONSISTENT_READ |
> BLK_PERM_WRITE,
>                             BLK_PERM_ALL, errp);
>          if (ret < 0) {
> ---

