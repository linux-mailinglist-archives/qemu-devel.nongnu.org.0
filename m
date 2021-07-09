Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E427A3C2511
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:36:08 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qfo-0005a2-0h
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1qek-0004f1-J5; Fri, 09 Jul 2021 09:35:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:21448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1qei-0004uE-If; Fri, 09 Jul 2021 09:35:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 77D8C746392;
 Fri,  9 Jul 2021 15:34:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 412127462DB; Fri,  9 Jul 2021 15:34:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3F0D874570E;
 Fri,  9 Jul 2021 15:34:58 +0200 (CEST)
Date: Fri, 9 Jul 2021 15:34:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
In-Reply-To: <YOeeR6Uj9mhqG0j2@yekko>
Message-ID: <3ddc81f9-339-deed-d937-611e7ada6042@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <22b9ae49-7252-b664-ea98-99bb7baf4680@eik.bme.hu>
 <07d3a270-6d44-591d-d0ee-0264d3b4c7f2@ozlabs.ru>
 <4a903fde-4ea-a296-3132-bae249d261a@eik.bme.hu>
 <6a25eed6-22db-7d5c-6686-67322b70a83f@ozlabs.ru>
 <70991a4-7d9-3a1c-dd53-4b7da2c39a0@eik.bme.hu> <YOeeR6Uj9mhqG0j2@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021, David Gibson wrote:
> On Thu, Jul 08, 2021 at 03:00:22PM +0200, BALATON Zoltan wrote:
>> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>>> On 08/07/2021 20:39, BALATON Zoltan wrote:
>>>> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>>>>> On 08/07/2021 20:18, BALATON Zoltan wrote:
>>>>>> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>>>>>>> This addresses the comments from v22.
>>>>>>>
>>>>>>> The functional changes are (the VOF ones need retesting with Pegasos2):
>>>>>>>
>>>>>>> (VOF) setprop will start failing if the machine class callback
>>>>>>> did not handle it;
>>>>>>
>>>>>> I'll try this later but I think I've seen guests using
>>>>>> setprop (Linux also does that for some property). How should
>>>>>> I allow that? Do I need a new callback for this? Could it be
>>>>>> allower unless there's a callback that could deby it? But
>>>>>> that was the previous way I think.
>>>>>
>>>>> A simple defined callback which always returns "true" should do.
>>>>
>>>> Yes but what's the point? That would just effectiverly disable this
>>>> change so if we need that, we could just as well keep the previous
>>>> behaviour which is to allow setprop unless there's a callback that
>>>> can decide otherwise. The spapr machine has such a callback so it
>>>> already does not allow all setprop and if I'll have a callback in
>>>> pegasos2 returning true that will allow what's allowed now so this
>>>> part of this patch does nothing indeed.
>>>>
>>>> Since guests could do all kinds of things that we don't know without
>>>> trying them restricting setprop is a good way to run into problems
>>>> with guests that were not tested that could otherwise just work.
>>>> Then we'll need another patch to enable that guest adding some more
>>>> properties to the list of allowed ones. Why it it a problem to allow
>>>> this by default in the first place and only reject changes for
>>>> machines that have a callback? Then I would not need more empty
>>>> callbacks in pegasos2.
>>>
>>>
>>> From here:
>>> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210625055155.2252896-1-aik@ozlabs.ru/#2714158
>>>
>>> ===
>>>
>>>>>> +    if (vmo) {
>>>>>> +        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
>>>>>> +
>>>>>> +        if (vmc->setprop &&
>>>>>> +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
>>>>>> +            goto trace_exit;
>>>>>
>>>>> This defaults to allowing the setprop if the machine doesn't provide a
>>>>> setprop callback.  I think it would be safer to default to prohibiting
>>>>> all setprops except those the machine explicitly allows.
>>>>
>>>>
>>>> Mmmm... I can imagine the client using the device tree as a temporary
>>>> storage. I'd rather add a trace for such cases.
>>>
>>> If they do, I think that's something we'll need to consider and
>>> account for that platform, rather than something we want to allow to
>>> begin with.
>>
>> I've seen that, yet I don't understand why. If I'll just add an empty
>> callback in pegasos2 to disable it then we're back to where we were before.
>> So my question is why do we want to explicitely enable setprop for every
>> guest when we encounter it one by one (especially if this works on other OF
>> implementations so guests are free to change the device tree therefore we
>> don't know in advance what are allowable properties). If you don't want it
>> for spapr I think you already have the callback for it that disallows it for
>> all but at a few properties but why change the default for other machines
>> that don't have a callback? If I can still add an empty callback that could
>> well be the default just to avoid more boilerplate in board code.
>
> Because I think hitting the failure and deciphering that we need to
> add setprop logic is likely to be less pain in the long run, than
> allowing setprop by default, then discovering things break because the
> guest expected that setprop to have some semantic effect beyond just
> changing the dt, and we never even realized it was doing it.

What semantic effect does setprop have on real OpenFirmware besides 
changing the device tree? I don't see the advantage in this (see in my 
reply to Alexey) but sent a patch to add the callback to pegasos2 so you 
can pick that if you want to keep this default or alternatively you can 
revert the two hunks from VOF fix v23 to get back to prevous default. Both 
would fix Linux on pegasos2 with VOF.

Regards,
BALATON Zoltan

