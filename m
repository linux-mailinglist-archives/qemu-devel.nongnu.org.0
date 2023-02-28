Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083496A5C64
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2Fo-0001Xk-Mu; Tue, 28 Feb 2023 10:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX2Fk-0001XY-HL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:50:56 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX2Fi-0005OQ-TB
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:50:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso4523933wmo.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FsV55x6cXG19BZp9PU/3kMDU8G4rSDl1Uku25UUqXxY=;
 b=MO3+gALcd0vyo/Yaf2aiECg53TxQfDDULzEVEoqptaQhFCibCuSKNPdsRRsOvshy9E
 Q3SWEkc25d3q3D/wGGx6TAGkBXZv1If6ltBKOlTZHYNVgyywdYjnSgXLha4zZDrDmUbA
 16YOfTVjUd+BNLJdjT7Ha7e4liUBUKjJ/5XjgWsT2CmQwirvOjru2KQKoReICLTDu1Nf
 BosarsM3uFdIRDNgbbwzYm0LBb6zXpX66RN9N56QwkSTkgoTNMCPvxYYrb4oCMvX+etg
 WJI0BveGDLiqPO/7KZxdQXuZG8n6ymjJbv5HxnzW0Qo6F9bCWEIHeef+4vt2BZGulXik
 8Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsV55x6cXG19BZp9PU/3kMDU8G4rSDl1Uku25UUqXxY=;
 b=KBg4Ne3No9gniMrrCjmlaD967VcAsniJQy/CpZSzgudMGQ7j+OkGXDsEW7WoMqieyJ
 UNwb7Thzsykp93wBCAUJnLe29jVREi4DC41UWA0fyG/TSaN9jJldZs7wXD+cK8ma9jpP
 5dA5ozlzLheu4TW1xAn5dVsXi+1LSRvnE16vsiDHalL2Iz5S1gkr6SCc32pG4422k7GP
 MAhd4BErRWupJQqbAbcM5f+Tx/pUISRO1SXeBsN5iu0SKsucIY6kzxIXHZMAwxW42r8P
 +aMUkHdKgaLE7GnMfeW8W9eCmBf2JidqjTzIWvR1NCkuWivfNE6t8W4kWlxt7kBfVIVO
 8tBQ==
X-Gm-Message-State: AO0yUKWRlt2jXK6tKENpTS30RGQ4mAlIcKu00TBNVhLnkndTmfPI18+u
 rWlDPM+Y9zitKTznINdYZnfIHA==
X-Google-Smtp-Source: AK7set8SP1MZG8pSjtO3wNJORsMF8vT+W5HRr2JYmnOPaSYfKXbFK+JBZ9rklUEZiRzKTZQO32GSCQ==
X-Received: by 2002:a05:600c:4da6:b0:3eb:19e7:b291 with SMTP id
 v38-20020a05600c4da600b003eb19e7b291mr2452246wmp.11.1677599453240; 
 Tue, 28 Feb 2023 07:50:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b003dc434b39c7sm2560903wmb.0.2023.02.28.07.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 07:50:52 -0800 (PST)
Message-ID: <4a835d39-bcb4-e147-50e0-5a526d1ae107@linaro.org>
Date: Tue, 28 Feb 2023 16:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/7] usb/ohci: Implement resume on connection status
 change
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1676916639.git.balaton@eik.bme.hu>
 <35c4d4ccf2f73e6a87cdbd28fb6a1b33de72ed74.1676916640.git.balaton@eik.bme.hu>
 <9d4b7238-23f4-1ea8-10d9-6b73f4c026ec@linaro.org>
 <5281d606-7348-4537-01db-68714969c0e8@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5281d606-7348-4537-01db-68714969c0e8@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/2/23 15:55, BALATON Zoltan wrote:
> On Tue, 28 Feb 2023, Philippe Mathieu-Daudé wrote:
>> On 20/2/23 19:19, BALATON Zoltan wrote:
>>> If certain bit is set remote wake up should change state from
>>> suspended to resume and generate interrupt. There was a todo comment
>>> for this, implement that by moving existing resume logic to a function
>>> and call that.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/usb/hcd-ohci.c | 23 +++++++++++++++++------
>>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
>>> index bad8db7b1d..88bd42b14a 100644
>>> --- a/hw/usb/hcd-ohci.c
>>> +++ b/hw/usb/hcd-ohci.c
>>> @@ -1410,6 +1410,18 @@ static void ohci_set_hub_status(OHCIState 
>>> *ohci, uint32_t val)
>>>       }
>>>   }
>>>   +/* This is the one state transition the controller can do by 
>>> itself */
>>> +static int ohci_resume(OHCIState *s)
>>
>> Preferably returning bool.
> 
> I can change that on rebase. I just followed other exising functions in 
> this file for consistency which return int (although some use 1 and 
> others use -1 besides 0).

I'll squash that myself.

>>> +{
>>> +    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
>>> +        trace_usb_ohci_remote_wakeup(s->name);
>>> +        s->ctl &= ~OHCI_CTL_HCFS;
>>> +        s->ctl |= OHCI_USB_RESUME;
>>> +        return 1;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Sets a flag in a port status reg but only set it if the port is 
>>> connected.
>>>    * If not set ConnectStatusChange flag. If flag is enabled return 1.
>>> @@ -1426,7 +1438,10 @@ static int 
>>> ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
>>>       if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
>>>           ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
>>
>> // ConnectStatusChange
>>
>>>           if (ohci->rhstatus & OHCI_RHS_DRWE) {
>>
>> // DeviceRemoteWakeupEnable: ConnectStatusChange is a remote wakeup 
>> event.
> 
> Not clear if you want any change here or the comments are just 
> explanation in this email.

I was just taking notes while reviewing ;) Our OHCI definitions
aren't very verbose.

>>> -            /* TODO: CSC is a wakeup event */
>>> +            /* CSC is a wakeup event */
>>> +            if (ohci_resume(ohci)) {
>>> +                ohci_set_interrupt(ohci, OHCI_INTR_RD);
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Thanks for the review. You put a lot of work in QEMU and we appreciate 
> very much that you're also doing the job of other maintainers.

No problem. I'm queuing this patch for my next PR (hopefully much
less patches, and before the freeze).


