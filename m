Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD23A5ECD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:05:09 +0200 (CEST)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiWq-0006mw-I0
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsiTd-00047C-KH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:01:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsiTc-0003TQ-13
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:01:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso12466605wmi.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pHqDW207mjgrvpC5bUXztMmrnYyS4Ll7Q7BfaTXLkLI=;
 b=kVQcVq4QxFA7pDcSWrtunEERM/Temly5Z2CjvEuOHh2MVBJQ79oQ/j8GdUC0C1nCTB
 MbKuxYR7GjYO3j7Pbo5paIpLz1INXW62/HuiTdIYYUWFvvjgxIFP7eYpuFx1gvXG4rUJ
 PsxYArHaDKGR5OPRpAJJnIzWcjQObLzOh7Xo4B2UZ6NNWp0X3ihb46OAlYHSWRPkV2pN
 ahGKdOfWKzbGg4HWLZQ/HPmry3fAXwnydRCUNV1XVB1koqG1BGcEENs2mXWXv79U0MG6
 y/S8KDzLf4/dnMAXnMCi1QoAmEbkAvdcboXLSFhPXDH7NmlOfkxm0TdLuLJgTeM0K6gc
 aHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pHqDW207mjgrvpC5bUXztMmrnYyS4Ll7Q7BfaTXLkLI=;
 b=Elk/ZWzt8TD1C4Eg0DjPvA+3m/dTDpSZRbm6++ETFc/30/vVUv+/9mUKJcpfhrBaFF
 +lOwuA16bwjP98eujrSllJj6G7NHxyJKEHhtS5foNA3sb2Xj63t/tGTDH54OOrlgg+Cq
 VcemO0g9qTop9hzXJdjV1z4TYUbI/DNkOjhItgIp/DGYttBIOJti2t5CGJSECYFXawcI
 tm5UfXPZPfAsFJ5eieuPdxRI1cp2nquSZs36QcRDUi6Mir2Mp7VEZXne4F/weWjYMEp/
 RjzfWG56KnVqQSpFM4Rx28wsp7O24JBiiMb9WQW+lls6KvLiWDilDbHxgRfvuVS+fn9G
 bSHQ==
X-Gm-Message-State: AOAM533mDiwUBxnORrxhKgX+VKFCePgY6G1ZjNB5MPFZDX+IIijjdt+J
 tSANH6zFUYleaq5GE17+2is=
X-Google-Smtp-Source: ABdhPJxJcm2JJ2QVII4oAneyzHFKaggXEPa8fJxDAovb3WklvQ3+pytURtwJkruB/s3IvUTtHWhYdQ==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr15482474wmb.60.1623661306480; 
 Mon, 14 Jun 2021 02:01:46 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f5sm16591101wrf.22.2021.06.14.02.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:01:45 -0700 (PDT)
Subject: Re: [PATCH] esp: fix migration version check in esp_is_version_5()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, laurent@vivier.eu, hpoussin@reactos.org
References: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
 <75bf9945-9953-ba75-048a-a1570c6746ac@amsat.org>
 <0940b4dd-563e-6c9b-fd66-91f5bc664ef3@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <347be692-0e6a-f684-ddbb-b2b2acd7ae04@amsat.org>
Date: Mon, 14 Jun 2021 11:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0940b4dd-563e-6c9b-fd66-91f5bc664ef3@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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

On 6/14/21 9:44 AM, Mark Cave-Ayland wrote:
> On 14/06/2021 06:42, Philippe Mathieu-Daudé wrote:
> 
>> On 6/13/21 12:26 PM, Mark Cave-Ayland wrote:
>>> Commit 4e78f3bf35 "esp: defer command completion interrupt on
>>> incoming data
>>> transfers" added a version check for use with VMSTATE_*_TEST macros
>>> to allow
>>> migration from older QEMU versions. Unfortunately the version check
>>> fails to
>>> work in its current form since if the VMStateDescription version_id is
>>> incremented, the test returns false and so the fields are not
>>> included in the
>>> outgoing migration stream.
>>>
>>> Change the version check to use >= rather == to ensure that migration
>>> works
>>> correctly when the ESPState VMStateDescription has version_id > 5.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on
>>> incoming data transfers")
>>> ---
>> Well, it is not buggy yet :)
> 
> :)
> 
>>>   hw/scsi/esp.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>> index bfdb94292b..39756ddd99 100644
>>> --- a/hw/scsi/esp.c
>>> +++ b/hw/scsi/esp.c
>>> @@ -1120,7 +1120,7 @@ static bool esp_is_version_5(void *opaque, int
>>> version_id)
>>
>> Can you rename esp_is_at_least_version_5()?
> 
> Sure, I can rename it if you like but it will of course make the diff
> noisier. esp_is_at_least_version_5() seems quite a mouthful though, what
> about esp_min_version_5() instead?

I was looking at esp_is_before_version_5(). Following that logic it
should be named esp_is_after_version_4()? Or esp_min_version_5() and
rename esp_is_before_version_5() -> esp_max_version_4(). All options
seem confuse...

Maybe _V macros suggested by Paolo make all clearer?

> 
>>>       ESPState *s = ESP(opaque);
>>>         version_id = MIN(version_id, s->mig_version_id);
>>> -    return version_id == 5;
>>> +    return version_id >= 5;
>>>   }
>>>     int esp_pre_save(void *opaque)
> 
> 
> ATB,
> 
> Mark.
> 

