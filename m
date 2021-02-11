Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2A3187D8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:15:19 +0100 (CET)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA90I-0003LL-JP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8uo-0008BJ-5U
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:09:38 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8um-0004Rv-Lq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:09:37 -0500
Received: by mail-wm1-x329.google.com with SMTP id a16so5693334wmm.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=liW1k8zj9eIv43B+47EpXzcOZUsQhiVDQjzh33hsc3I=;
 b=uNyzRO1i2lXR5chUeAEHH1kEIHIq6ZZCcw10pNdCoOQv4MLk42OX7B2osGPbOCSWYw
 5q9SCjYWx7QkCXeNj8t5sjDi0nRM9YGLXN83hnVFPj+o1YyD22qD11e2UOxUWrFd6Od+
 yKs7MkR3WR8jomEGNXiTD0qdmwGuqds5AGpOuDnNpmonMrY3WqN4spPrYApP2LhlyXC+
 V7cRyn4iaDHZulSsxtMgoeAgdfyQn08+pemZqsSS0Q0/ZITa7R8/tA7w6zrqCNzjuli+
 wHQh6COwRTfQ7zK2to4HvsxaYJ2S2SpyWV35FF7FFc8piSvU+60+yw70wjAoUaFlPiPL
 k+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=liW1k8zj9eIv43B+47EpXzcOZUsQhiVDQjzh33hsc3I=;
 b=Jiz1nWZLj9XyDxbKhV+rgKx/VTeePicdS0hK5gDPz4MpC9ulN0tCiBwrZS+oM58f5v
 Xs8P7ltdSQwp8OmO7Yr1Wo1agQNZQO0lMxeJTB7DKtflipoZh2Bv3AZA+05dM+YfNwxz
 4hk48uwj+eBa74X41BybsxuXUHBInSbJHPilLfuoMI/tKPUTv8SSK2mH6ReUv/uxOdjG
 Li2YYLapSyww0GewHdf6SkwT7RB1LTsbt2DxutydMIoC729czp9wH9A18SOAhSaAdSRm
 Nx215duUO4jaRWWHonhG/UVfsTLSc7xi0TuINtjrwnNwve5fcBWiTEvZx9cjmnhQwKBC
 Sdug==
X-Gm-Message-State: AOAM532TZW4V2sVxp+hOp6oCA2fzeQtVmrJcMKsgaNvZoxCTRlkeWb/W
 MWqSVcU4gNMdZkSOY93YMio=
X-Google-Smtp-Source: ABdhPJwAc5m5kj+3iIAJr/BYmg3eXVOne0GZ0/oqN+FmzNMNHd7PIjJZYcGogGo0RFrsg55ZExp31A==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr4338712wmc.136.1613038174790; 
 Thu, 11 Feb 2021 02:09:34 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p12sm7969801wmq.1.2021.02.11.02.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:09:34 -0800 (PST)
Subject: Re: [PATCH v2 15/42] esp: introduce esp_pdma_read() and
 esp_pdma_write() functions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
 <fcaa4613-9b90-d41e-e00b-8b7e7e6081ff@amsat.org>
 <0830b4d4-2c7f-0f67-04f6-7141a987fa75@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <02ad6cb6-8148-134b-4186-8faf7cabadec@amsat.org>
Date: Thu, 11 Feb 2021 11:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0830b4d4-2c7f-0f67-04f6-7141a987fa75@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/11/21 9:01 AM, Mark Cave-Ayland wrote:
> On 10/02/2021 22:51, Philippe Mathieu-Daudé wrote:
> 
>> Hi Mark,
>>
>> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp.c | 28 ++++++++++++++++++++--------
>>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>> index e7cf36f4b8..b0cba889a9 100644
>>> --- a/hw/scsi/esp.c
>>> +++ b/hw/scsi/esp.c
>>> @@ -151,6 +151,20 @@ static uint8_t *get_pdma_buf(ESPState *s)
>>>       return NULL;
>>>   }
>>>   
>>
>> Can you add get_pdma_len() (similar to get_pdma_buf) and ...
>>
>>> +static uint8_t esp_pdma_read(ESPState *s)
>>> +{
>>> +    uint8_t *buf = get_pdma_buf(s);
>>> +
>>
>>         assert(s->pdma_cur < get_pdma_len(s));
>>
>>> +    return buf[s->pdma_cur++];
>>> +}
>>> +
>>> +static void esp_pdma_write(ESPState *s, uint8_t val)
>>> +{
>>> +    uint8_t *buf = get_pdma_buf(s);
>>> +
>>
>> Ditto.
>>
>>> +    buf[s->pdma_cur++] = val;
>>> +}
>>
>> Otherwise:
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> One of the main purposes of this patchset is actually to completely
> remove all of these pdma_* variables and integrate everything into the
> existing FIFO and cmd buffers, so if you continue reading through the
> patchset you'll see that this soon disappears.
> 
> Even better towards the end you can see that both of these buffers are
> eventually replaced with QEMU's Fifo8 which has in-built assert()s to
> protect from underflow and overflow which should protect against memory
> corruption.

OK great! I planed to review half of it (21/42) but was too tired so
stopped at this one :D My bad for missing in the cover:

- Now that the TC register represents the authoritative DMA transfer
  length, patches 14-25 work to eliminate the separate PDMA variables
  pdma_start, pdma_cur, pdma_len and separate PDMA buffers PDMA and CMD.
  The PDMA position variables can be replaced by the existing ESP cmdlen
  and ti_wptr/ti_rptr, whilst the FIFO (TI) buffer is used for incoming
  data with commands being accumulated in cmdbuf as per standard DMA
  requests.

Regards,

Phil.

