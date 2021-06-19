Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505BD3ADAC6
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:57:29 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludLc-0007wr-5Z
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludKd-0007HZ-Pc
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:56:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludKc-0008DB-5u
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:56:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id k42so5635207wms.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qA7lAq/6YVwC5dUcWP2EqZwZPM+SKfrEIWjHsddT17M=;
 b=Hemye2ePJ/j9cvuwNVh2atfT9/JC/Uxc7ZNT/+PGffL3VMKY9cj3doxXdX+Iyq8nux
 BSME6t9p7ElLU971eT5IkCezIF20hwQXClpdSggcAHJy5HfpHwSue+vAcc44bWt5vNvH
 x3f6Eax4CFni/3k8K7xTpf03o9HDrcGYE3BqICDaEDJ04VxcuAIZ9EuTFokB/59/tOXe
 kxHnuSkdGEkeiw4tMv/xVmsOgCbwp1c+ljsEaAmI+xxVE9AAqqpSHChIMRILvwKDYneg
 6UQO1UEYvXd+F44ZRLgboOOZLyLfwtN2ly5+G2eQ0DKGsgMO4ZI3OXzYTW8fufj4KVoD
 sswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qA7lAq/6YVwC5dUcWP2EqZwZPM+SKfrEIWjHsddT17M=;
 b=ew5WUgpZ71JTVPiX+W3mEbEjcDKy4cbD1Jh7iGVkbc0kDB/TUSSutk10SWXFfZjzZ9
 FO6RyG6Rnti+sd2EqpJCpS+1vkEpffCNFKzap0/HLq5TY8Wb32YqmMJbKyTNA8nTbgUD
 QFcLDcZIIFhSIvJJtJ0K6dCYauCO1zG043I1dZzzTdndWfGuI1y6VHj9obvw41YAxqFn
 Uouhh1A9VVSxldwRn40W1rnS3sYY86T6c7kKy0+CRwYGZD36Ze9Qlo8bbl9SmsbCNSyM
 TY9UanL5ZTQzH91BlhsTkHiicPNqjdFYsbLxAql6d77C4a8j/hLV86p21BTK90wsGW9J
 J2Gg==
X-Gm-Message-State: AOAM5327uh9siwvyR3Kd+PUiYFwZ4lmAw61vLL98jfzh2i12qrSPzBqU
 MJ+0Y3sDT4E7X84B1iaVKKI=
X-Google-Smtp-Source: ABdhPJyQu99P40MDZmKPUrKCCHGQIRzxOnNp8CHEQdzoM7V6je71Fqr2LYuHRSYLfVLdxhCpvYtfAA==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr16847205wmc.163.1624118184665; 
 Sat, 19 Jun 2021 08:56:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r6sm12042771wrt.21.2021.06.19.08.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:56:24 -0700 (PDT)
Subject: Re: [PATCH 1/4] mc146818rtc: Make PF independent of PIE
To: Jason Thorpe <thorpej@me.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-2-thorpej@me.com>
 <5c2ae675-f734-174d-6640-baebc817f3ba@linaro.org>
 <39CACE5E-7CCD-400C-A983-689474D42EC5@me.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72b9ed14-3af0-8284-9baf-f1a552e61b5f@amsat.org>
Date: Sat, 19 Jun 2021 17:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <39CACE5E-7CCD-400C-A983-689474D42EC5@me.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 6/16/21 7:34 PM, Jason Thorpe wrote:
> 
>> On Jun 14, 2021, at 9:17 PM, Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> Cc: paolo and mst
>>
>> On 6/13/21 2:15 PM, Jason Thorpe wrote:
>>> Make the PF flag behave like real hardware by always running the
>>> periodic timer without regard to the setting of the PIE bit, so
>>> that the PF will be set when the period expires even if an interrupt
>>> will not be raised.  This behavior is documented on page 16 of the
>>> MC146818A advance information datasheet.
>>> Signed-off-by: Jason Thorpe <thorpej@me.com>
>>> ---
>>>  hw/rtc/mc146818rtc.c | 4 ----
>>>  1 file changed, 4 deletions(-)
>>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>>> index 4fbafddb22..366b8f13de 100644
>>> --- a/hw/rtc/mc146818rtc.c
>>> +++ b/hw/rtc/mc146818rtc.c
>>> @@ -155,10 +155,6 @@ static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>>  {
>>>      int period_code;
>>>  -    if (!(s->cmos_data[RTC_REG_B] & REG_B_PIE)) {
>>> -        return 0;
>>> -     }
>>
>> This looks correct, but I don't know enough about this device.
> 
> Quoting the data sheet here, for context:
> 
> <quote>
> PF - The periodic interrupt flag (PF) is a read-only bit which is set to a "1" when a particular edge is detected on the selected tap of the divider chain.  The RS3 to RS0 bits establish the periodic rate.  PF is set to "1" independent of the state of the PIE bit.  PF initiates an ~IRQ signal and sets the IRQF bit when PIE is also a "1".  The PF bit is cleared by a ~RESET or a software read of Register C.
> </quote>
> 
> This is why my patch always runs the timer, and does not suppress it if PF is already set; real hardware will always latch PF at regular intervals irrespective of when software reads Register C.

Do you mind reposting this single patch including the DS quote
in the description?

Regards,

Phil.

