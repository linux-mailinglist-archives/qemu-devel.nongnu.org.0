Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1E31CF80
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:47:52 +0100 (CET)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4Rz-0000FM-Du
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lC4P8-0007hq-Fi; Tue, 16 Feb 2021 12:44:54 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lC4P3-0001xF-2O; Tue, 16 Feb 2021 12:44:54 -0500
Received: by mail-qv1-xf29.google.com with SMTP id gi9so3878418qvb.10;
 Tue, 16 Feb 2021 09:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sez+r/6WiKgNqW20OZnRL1TF650U3Xyeo6TC3mhFdAs=;
 b=hNBYcciXxDGZc07YKV3wuCIECYbJeBGQXTwOmqXhnfwOOkaJ0qhuld0jf8DWn/mTYh
 /Z1kGwtPw4hZfNc7rs/aTOQPHCX16Jk2kHivIwx9lZVadyAMMic2RmYKVc1ZHG4VbzrB
 NmcUB/r7s9xuRO/9PHPRmzUyDHc4L0njNkANIXDXAGxoyI9dH1lUCDyD36KXkmXf2LtC
 3SZXz0h6XlfyezWfiw2TSvVXKU+L44Iz0uANSvFIAMLhJtBqVUXRP4piEfrX7hohUFwr
 7wy3XxGl+MyuJ6BzUzGTBUQJTqO27vNQj1raIsoQhuN3JkHtiiHqL4SuR9rKP5TaqAm3
 sauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sez+r/6WiKgNqW20OZnRL1TF650U3Xyeo6TC3mhFdAs=;
 b=pFjXmVena2tBsZwkxedJXWFZwCVUtfr99MG7/S1k8yy3zldX3Fg9XAzIMoTQVtLG9y
 6bEzkvncef9iTsXtYtaA/0iMG01XH4LNJJg0dLBUYWxunxE1RaUs3uYMqXX8kfX9aEwq
 M4uvYC/+avtIiID19IbE2YPKVyqXFnoY6xouT5+XgSYnX0b8slb/4KVEgeduHWPPTSf0
 Yy1x3RHS3ZVUcEvHd2EbKhUCZONhcQoiUljcByj1r3xbJVwfMXc8PGSJT+r5Cxz4qDkG
 1xQzrFG80RqdDfIs5V/34KwHW737annyEnhNXnE/j+k+1gQDu1RWYh8Gc2nfuu0I9Hg5
 EU3A==
X-Gm-Message-State: AOAM532OPq0PnUjOF3FBYnSDqkZq3tgGHDnfbcLCIH1AkAASSh48SEuE
 pU9RvzfG1SN+QfVWZtb5aBBPbrRBuls=
X-Google-Smtp-Source: ABdhPJwPLyXZGJG+lFSGqYaHv+FnYQwbjHNXZ6ZN78hy0BYQk4zCv/cAd8q75bKWWAS4/fSW5nPe3g==
X-Received: by 2002:a0c:aa19:: with SMTP id d25mr20889267qvb.46.1613497487452; 
 Tue, 16 Feb 2021 09:44:47 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:a50d:bdb3:4a9d:cdde:b53f?
 ([2804:431:c7c6:a50d:bdb3:4a9d:cdde:b53f])
 by smtp.gmail.com with ESMTPSA id p10sm14862768qke.92.2021.02.16.09.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 09:44:47 -0800 (PST)
Subject: Re: [PATCH v3 2/7] spapr_pci.c: simplify spapr_pci_unplug_request()
 function handling
To: Greg Kurz <groug@kaod.org>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-3-danielhb413@gmail.com>
 <20210216165059.284d2a21@bahia.lan>
 <5bdd86f2-0a00-bccf-65dc-236b064e8029@gmail.com>
 <20210216181654.7eaf0ff1@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <93b76a2a-5489-2e96-dd0f-ef39a13bb8d7@gmail.com>
Date: Tue, 16 Feb 2021 14:44:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216181654.7eaf0ff1@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/16/21 2:16 PM, Greg Kurz wrote:
> On Tue, 16 Feb 2021 13:09:43 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>>
>>
>> On 2/16/21 12:50 PM, Greg Kurz wrote:
>>> On Thu, 11 Feb 2021 19:52:41 -0300
>>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>>
>>>> When hotunplugging a PCI function we'll branch out the logic in two cases,
>>>> function zero and non-zero. If non-zero, we'll call spapr_drc_detach() and
>>>> nothing else. If it's function zero, we'll loop it once between all the
>>>> functions in the slot to call spapr_drc_detach() on them, and afterwards
>>>> we'll do another backwards loop where we'll signal the event to the guest.
>>>>
>>>> We can simplify this logic. We can ignore all the DRC handling for non-zero
>>>> functions, since we'll end up doing that regardless when unplugging function
>>>> zero. And for function zero, everything can be done in a single loop, since
>>>> tt doesn't matter if we end up marking the function DRCs as unplug pending in
>>>> backwards order or not, as long as we call spapr_drc_detach() before issuing
>>>> the hotunplug event to the guest.
>>>>
>>>> This will also avoid a possible scenario where the user starts to hotunplug
>>>> the slot, starting with a non-zero function, and then delays/forgets to
>>>> hotunplug function zero afterwards. This would keep the function DRC marked
>>>> as unplug requested indefinitely.
>>>>
>>>
>>> ... or until the guest is reset, which will no longer happen with this
>>> patch applied, i.e. breaks the long standing policy that machine reset
>>> causes pending hot-unplug requests to succeed. I don't see an obvious
>>> reason to special case non-zero PCI functions.
>>
>> It's not possible to hotunplug the non-zero functions during machine reset for
>> multifunction PCI devices. We need to unplug the entire slot, and that will only
>> happen when function zero is unplugged. In fact, I think bad things will happen
>> in this case you mentioned if we are forcing the removal of non-zero functions
>> without function zero (spoiler: didn't test it).
>>
> 
> I've tested with the aggregation of two e1000e emulated devices:
> 
> device_add e1000e,addr=10.1,id=netfn1
> device_add e1000e,multifunction=on,addr=10.0,id=netfn0
> 
> And I don't quite see what "bad things" could happen. We're resetting the
> machine to a stable state and the new OS instance will just not see the
> removed function (just like only function netfn0 got added).


Interesting. Thanks for looking this up.

Given that the intention of this patch was a simplification of the existing
design, without changing what we currently do regarding PCI functions and unplug,
and apparently it just did that, let's drop it.



DHB


> 
>> What I'm doing in this patch is making it clearer that non-zero functions does
>> not matter for the unplug of multifunction PCI devices. We'll detach the whole
>> slot when function zero is unplugged, regardless of the unplug state of other
>> functions.
>>
> 
> I understand that hot-unplug of non-zero functions is special cased while
> the guest OS is running, but this doesn't really applies if the guest is
> rebooted. Code simplification is not a good reason enough, at least for me,
> to alter the "reset complete all pending hotplugs" general rule.
> 
>> The only reason why I didn't make 'device_del' to error out when used with a
>> non-zero function is because we allowed this in the past and it would break user
>> ABI. Otherwise, FWIW, "device_del <non-zero function>" is doing nothing since
>> commit "spapr_pci: remove all child functions in function zero unplug".
>>
>>
>> Thanks,
>>
>>
>> DHB
>>
>>
>>
>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    hw/ppc/spapr_pci.c | 44 ++++++++++++++++----------------------------
>>>>    1 file changed, 16 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>>>> index f1c7479816..1791d98a49 100644
>>>> --- a/hw/ppc/spapr_pci.c
>>>> +++ b/hw/ppc/spapr_pci.c
>>>> @@ -1709,38 +1709,26 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
>>>>                return;
>>>>            }
>>>>    
>>>> -        /* ensure any other present functions are pending unplug */
>>>> -        if (PCI_FUNC(pdev->devfn) == 0) {
>>>> -            for (i = 1; i < 8; i++) {
>>>> -                func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
>>>> -                func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
>>>> -                state = func_drck->dr_entity_sense(func_drc);
>>>> -                if (state == SPAPR_DR_ENTITY_SENSE_PRESENT
>>>> -                    && !spapr_drc_unplug_requested(func_drc)) {
>>>> -                    /*
>>>> -                     * Attempting to remove function 0 of a multifunction
>>>> -                     * device will will cascade into removing all child
>>>> -                     * functions, even if their unplug weren't requested
>>>> -                     * beforehand.
>>>> -                     */
>>>> -                    spapr_drc_detach(func_drc);
>>>> -                }
>>>> -            }
>>>> +        /*
>>>> +         * The hotunplug itself will occur when unplugging function 0,
>>>> +         * regardless of marking any other functions DRCs as pending
>>>> +         * unplug beforehand (since 02a1536eee33).
>>>> +         */
>>>> +        if (PCI_FUNC(pdev->devfn) != 0) {
>>>> +            return;
>>>>            }
>>>>    
>>>> -        spapr_drc_detach(drc);
>>>> +        for (i = 7; i >= 0; i--) {
>>>> +            func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
>>>> +            func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
>>>> +            state = func_drck->dr_entity_sense(func_drc);
>>>>    
>>>> -        /* if this isn't func 0, defer unplug event. otherwise signal removal
>>>> -         * for all present functions
>>>> -         */
>>>> -        if (PCI_FUNC(pdev->devfn) == 0) {
>>>> -            for (i = 7; i >= 0; i--) {
>>>> -                func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
>>>> -                func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
>>>> -                state = func_drck->dr_entity_sense(func_drc);
>>>> -                if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
>>>> -                    spapr_hotplug_req_remove_by_index(func_drc);
>>>> +            if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
>>>> +                /* Mark the DRC as requested unplug if needed. */
>>>> +                if (!spapr_drc_unplug_requested(func_drc)) {
>>>> +                    spapr_drc_detach(func_drc);
>>>>                    }
>>>> +                spapr_hotplug_req_remove_by_index(func_drc);
>>>>                }
>>>>            }
>>>>        }
>>>
> 

