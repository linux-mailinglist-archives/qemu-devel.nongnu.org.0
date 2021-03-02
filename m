Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D385329A91
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:40:51 +0100 (CET)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2SQ-0002AT-BZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH2R1-00014y-Sd; Tue, 02 Mar 2021 05:39:23 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH2R0-00073j-6p; Tue, 02 Mar 2021 05:39:23 -0500
Received: by mail-qt1-x832.google.com with SMTP id s15so14382202qtq.0;
 Tue, 02 Mar 2021 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LDf7MO6MyvM/r+Qz83IpErDMH7nd2znjAkHdUi+j6H8=;
 b=tbVNCDONJINktTOlbnivY+rEslwZoj9UqXdFXzh/FZrqgvXg/AsUC2siPcAvopnXYC
 lppZQpEHP8odWwqi8O1KWy+XfiOHQCDaZlYv1rEcICnkpbRlgTU7K9Y5zoz9rX767Qq4
 iwMYxa8FbM3PAGzSCSK+Nt8q+yExFnOHDVEFpOGsyd1hXpwbLLyH3aAhmiQ89wl6JRq8
 ETHNp5WvCZbUkF1SMp/WrtRmsyzIdYJ4pKRUBr7Qwvaqc+Q7c9vF7sGJC9oqeXJieO30
 QsX5qfc7xh0s2HyrIt35tUyhI0gWb+yX1Y8CIYDJcjGX+7HVmoytjHFufBI+yL+xTLDy
 kRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDf7MO6MyvM/r+Qz83IpErDMH7nd2znjAkHdUi+j6H8=;
 b=LmLtU8iWVORkx1f3HSbMYkNR86FZ5gte9gEiN03DOg9qSdbAexB30sP5lDmaDBEF2G
 A3Cjig1Byoq698nNNNH5aa8WjSWk97YFji6YK5F7ZoEUujQaOtdgPHqmQ1v3IZQLfMW3
 rTLt5PQ1sloEjHWmuKMR+ijif1ebMtxGLAv3yITXPkaZf3IpswILAVF8AewvZw0uGhPL
 nQxEkkpPb9VlPEnOZ7K58sd3oiMlytuP+dEhgjToMMFOBSt7hbQZWKRGBbVB1uDpsMNa
 TEgsKaKRERhp5U01kZQDIGD6V/aW23IOnHQ3vv6Mt6+sou48frFYIloLbjACLOiciVX7
 Xt4g==
X-Gm-Message-State: AOAM531Uu5VVZWapRibhAcDLNTcmfseka1H5JDAqWYx/sbVFV8Cq2+CM
 bK+QXmWUyD5foi0COsKakqDn8PFWJtU=
X-Google-Smtp-Source: ABdhPJxZan9Mf9pynzNYh6gdoFTeiexbUirHSGykHn/Y4QpgtQ/r4JjfZWirBUiN8cVb7W00efML2Q==
X-Received: by 2002:a05:622a:492:: with SMTP id
 p18mr14347662qtx.91.1614681560977; 
 Tue, 02 Mar 2021 02:39:20 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:1670:7849:4614:f4b6:4112?
 ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id d24sm3481027qko.54.2021.03.02.02.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:39:20 -0800 (PST)
Subject: Re: [PATCH 2/5] spapr.c: check unplug_request flag in
 spapr_memory_unplug_request()
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-3-danielhb413@gmail.com>
 <YD2dDcCGenJC27kC@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <9c1b9a19-0e68-8228-5f7b-dc3ec5287978@gmail.com>
Date: Tue, 2 Mar 2021 07:39:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YD2dDcCGenJC27kC@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/1/21 11:03 PM, David Gibson wrote:
> On Fri, Feb 26, 2021 at 01:32:58PM -0300, Daniel Henrique Barboza wrote:
>> Now that we're asserting the first DRC LMB earlier, use it to query if
>> the DRC is already pending unplug and, in this case, issue the same
>> error we already do.
>>
>> The previous check was introduced in commit 2a129767ebb1 and it works,
>> but it's easier to check the unplug_requested  flag instead of looking
>> for the existence of the sPAPRDIMMState. It's also compliant with what
>> is already done in other unplug_request functions for other devices.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> I'm having some trouble completely convincing myself this is right.
> 
> What about this situation:
>       1. We initiate a DIMM unplug
>       	- unplug_request is set on all the LMBs
> 	- all the LMBs go on the pending_unplug list
>       2. The guest encounters no problems, and starts issuing set
>          indicator calls to mark the LMBs unusable, starting from the
> 	lowest address
>       3. On drc_set_unusable() for the first LMB, we see that unplug is
>          requested and call spapr_drc_release()
>       4. spapr_drc_release() on the first LMB clears unplug_requested
>       5. At this point, but before this is done on *all* of the DIMM's
>          LMBs, the user attempts another unplug triggering the code
> 	below
> 
> AFAICT this will now skip the error, since the first LMB is no longer
> in unplug_requested state, but there *are* still pending unplugs for
> some of the remaining LMBs, so the old code would have tripped the
> error.

Good point. Checking the existence of the sPAPRDIMMState struct at this
point is the same as checking for drc->unplug_requested for all the DRCs
of the DIMM.

I could check for drc->unplug_requested inside the loop where we instantiate
each DRC, but there is no gain in doing that instead of what we already have.

I'll drop this patch and change patch 1 to just remove the duplicated assert.


Thanks,


DHB

> 
>> ---
>>   hw/ppc/spapr.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 74e046b522..149dc2113f 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3681,13 +3681,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
>>                                   addr_start / SPAPR_MEMORY_BLOCK_SIZE);
>>       g_assert(drc_start);
>>   
>> -    /*
>> -     * An existing pending dimm state for this DIMM means that there is an
>> -     * unplug operation in progress, waiting for the spapr_lmb_release
>> -     * callback to complete the job (BQL can't cover that far). In this case,
>> -     * bail out to avoid detaching DRCs that were already released.
>> -     */
>> -    if (spapr_pending_dimm_unplugs_find(spapr, dimm)) {
>> +    if (spapr_drc_unplug_requested(drc_start)) {
>>           error_setg(errp, "Memory unplug already in progress for device %s",
>>                      dev->id);
>>           return;
> 

