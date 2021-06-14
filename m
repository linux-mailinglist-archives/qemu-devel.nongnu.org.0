Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EE3A685A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:49:16 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmxo-0003B4-1B
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsmwT-00021u-Jo
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:47:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsmwR-0001tp-CM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:47:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id a20so14673836wrc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Onmuaww04z/4gJzF2NX0og4oADD7NEws0osRe5XlThc=;
 b=ALQZ9QMouyCFGZuuUu51Wd5998HmF5Aimu0cspKFCfYe+46FLBKuqUhdV2/TuE+fgf
 dxEm2aZxgKwTANmCIanuhAhezPmOrYAJcq4UfFibx3JwFHWRtgaSdmvVVBTLY9W+VjIB
 uI+sVJCBzMcpaKx1Y6fJkCcZBuio6h44HdFQab7jooUS3jZ863pYBCDeP6OL/WwMCGxc
 UgbfyjDz5oFIxlkUiioXZ5C/d3JhOZ/BCYE7ht5dFvdSfJQjTNVzNb9p0apX2XnLsZ9u
 8Dt8DZc1DPwRrrqr0rDKCsuaknRpGGB7SLyj+mgUdl4DKmTz6yHFDwvjlyZYt3wfBFjE
 sbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Onmuaww04z/4gJzF2NX0og4oADD7NEws0osRe5XlThc=;
 b=chhfbBTpC0C5K9iII/bV4pMYFfyTW/+EaKX/h9TYdiVaaw1WlUtoAkoCxrhyTSsCBB
 +n/01qaK77p+Zps5L798Si1lehmXZm92+31fblq3cCgue/vW5qrnmsgh12zzH+aeVa8a
 h4C8Tf/S6nEKwc503RG3aio9b8f7ocZmYDtD9myV7l8vuQ6pvQEFfyNj5sgbVledjXWj
 SEuYo7/45sHGDrIJF1bUMnPXmUlDb7thUOEgPxk3EEVlJErGgc07p3UjG0xGQ4q6BwUF
 MV/QJL0M7x54LyfKyY5SrkyWpjfEC+BcHcm3ui9frxoWb2NgqMgIgQRaBd8iz+NL6wKS
 dqrA==
X-Gm-Message-State: AOAM531l81qa7o3B5ZapoY67bT1jl/z7aJUBKe2SdOkx+7Y3Ijyq9Cqw
 47/CH6oHpdJrrALlv/AnLiw=
X-Google-Smtp-Source: ABdhPJyde8nKAxBhT0lHYL2xRI5rE3lt0JLICFYPonpjwy7chHxhYzCAbXXVBw9V4/ee5TeHQ0u3JQ==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr18846523wrf.420.1623678469132; 
 Mon, 14 Jun 2021 06:47:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm16350549wrp.61.2021.06.14.06.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:47:48 -0700 (PDT)
Subject: Re: [PATCH] esp: fix migration version check in esp_is_version_5()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, laurent@vivier.eu, hpoussin@reactos.org
References: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
 <75bf9945-9953-ba75-048a-a1570c6746ac@amsat.org>
 <0940b4dd-563e-6c9b-fd66-91f5bc664ef3@ilande.co.uk>
 <347be692-0e6a-f684-ddbb-b2b2acd7ae04@amsat.org>
 <958e9fea-17c5-a818-14d4-a21c54399395@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3fb788e4-e1eb-0ff6-5209-53e2e1da76db@amsat.org>
Date: Mon, 14 Jun 2021 15:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <958e9fea-17c5-a818-14d4-a21c54399395@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/14/21 1:59 PM, Mark Cave-Ayland wrote:
> On 14/06/2021 10:01, Philippe Mathieu-Daudé wrote:
> 
>> On 6/14/21 9:44 AM, Mark Cave-Ayland wrote:
>>> On 14/06/2021 06:42, Philippe Mathieu-Daudé wrote:
>>>
>>>> On 6/13/21 12:26 PM, Mark Cave-Ayland wrote:
>>>>> Commit 4e78f3bf35 "esp: defer command completion interrupt on
>>>>> incoming data
>>>>> transfers" added a version check for use with VMSTATE_*_TEST macros
>>>>> to allow
>>>>> migration from older QEMU versions. Unfortunately the version check
>>>>> fails to
>>>>> work in its current form since if the VMStateDescription version_id is
>>>>> incremented, the test returns false and so the fields are not
>>>>> included in the
>>>>> outgoing migration stream.
>>>>>
>>>>> Change the version check to use >= rather == to ensure that migration
>>>>> works
>>>>> correctly when the ESPState VMStateDescription has version_id > 5.
>>>>>
>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>> Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on
>>>>> incoming data transfers")
>>>>> ---
>>>> Well, it is not buggy yet :)
>>>
>>> :)
>>>
>>>>>    hw/scsi/esp.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>>>> index bfdb94292b..39756ddd99 100644
>>>>> --- a/hw/scsi/esp.c
>>>>> +++ b/hw/scsi/esp.c
>>>>> @@ -1120,7 +1120,7 @@ static bool esp_is_version_5(void *opaque, int
>>>>> version_id)
>>>>
>>>> Can you rename esp_is_at_least_version_5()?
>>>
>>> Sure, I can rename it if you like but it will of course make the diff
>>> noisier. esp_is_at_least_version_5() seems quite a mouthful though, what
>>> about esp_min_version_5() instead?
>>
>> I was looking at esp_is_before_version_5(). Following that logic it
>> should be named esp_is_after_version_4()? Or esp_min_version_5() and
>> rename esp_is_before_version_5() -> esp_max_version_4(). All options
>> seem confuse...
>>
>> Maybe _V macros suggested by Paolo make all clearer?
> 
> Unfortunately the _V macros don't work correctly here (see my previous
> reply to Paolo) which is why these functions exist in the first place.
> 
> If all the proposed options seem equally confusing, is it worth just
> sticking with what was in the original patch? Otherwise we end up with a
> whole series renaming functions in a way we're still not happy with,
> compared with the original patch which is effectively a diff of 1
> character.

Fine, you are likely the next one going to modify these functions,
so I don't mind.

