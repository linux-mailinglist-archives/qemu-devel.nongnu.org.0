Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A312D0E1A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:36:32 +0100 (CET)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDsd-00088m-I9
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmDpQ-0006ZE-0Z; Mon, 07 Dec 2020 05:33:12 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmDpK-0006EV-4d; Mon, 07 Dec 2020 05:33:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8877F746552;
 Mon,  7 Dec 2020 11:33:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 590EA74645B; Mon,  7 Dec 2020 11:33:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 57EAB746383;
 Mon,  7 Dec 2020 11:33:02 +0100 (CET)
Date: Mon, 7 Dec 2020 11:33:02 +0100 (CET)
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
In-Reply-To: <20201207105336.7190f621@bahia.lan>
Message-ID: <d2293129-f12e-3e4f-316a-cd6e17a21dac@eik.bme.hu>
References: <20201013021911.28701-1-aik@ozlabs.ru>
 <20201204193205.45d2a15a@bahia.lan>
 <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
 <20201207105336.7190f621@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Mon, 7 Dec 2020, Greg Kurz wrote:
> On Mon, 7 Dec 2020 18:33:34 +1100
> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> [...]
>
>>>> +    }
>>>> +
>>>> +    return offset;
>>>> +}
>>>> +
>>>> +static uint32_t of_client_finddevice(const void *fdt, uint32_t nodeaddr)
>>>> +{
>>>> +    char *node, *unit, *part;
>>>
>>> If you do this:
>>>
>>>      g_autofree *node = NULL, *unit = NULL, *part = NULL;
>>
>>
>> Did you mean
>>         g_autofree char *node = NULL, *unit = NULL, *part = NULL;
>> ?
>>
>
> Yes. Sorry for the missing char :)
>
> [...]
>
>>>> +static uint32_t spapr_of_client_open(SpaprMachineState *spapr, const char *path)
>>>> +{
>>>> +    int offset;
>>>> +    uint32_t ret = 0;
>>>> +    SpaprOfInstance *inst = NULL;
>>>> +    char *node, *unit, *part;
>>>> +
>>>> +    if (spapr->of_instance_last == 0xFFFFFFFF) {
>>>> +        /* We do not recycle ihandles yet */
>>>> +        goto trace_exit;
>>>
>>> And g_free() is passed uninitialized pointers.
>>>
>>> A typical use case for the g_auto magic.
>>
>> g_autofree, you mean?
>>
>
> If you switch to g_strsplit_set(), you'd need a g_auto(GStrv). But since you
> explained that you'd rather keep split_path() as is, then you should use
> g_autofree indeed.
>
> [...]
>
>>
>> Thanks! I'll repost in a sec. But I still wonder on what terms this is
>> going to be allowed in the QEMU tree at all.
>>
>
> Pros:
>
> This notably improves the boot time of the -kernel/-initrd experience.
> Even if the feature isn't used in production, it can be quite useful for
> developers.
>
> Cons:
>
> It doesn't provide a full alternative to SLOF with respect to the boot
> loader.
>
> This is still a lot of code that we'll need to support, especially since
> the changes affect paths used in production.
>
>
> IMHO, unless this gets momentum in the community, and eventually
> allows to get rid of SLOF once and for all, it seems premature to
> merge this.

I think it's hard to gain momentum if it's kept outside of the tree 
because few people will take the hassle to apply patch and compile it to 
try it, compared to testing it if it's already available in master. So 
unless it breaks something I think it would be better to merge it as an 
experimental feature than wait for it to mature without anyone else trying 
it apart from a few people. If it's in master more people could test it 
and maybe even sent patches or at least reports on what's more needed that 
does not seem to happen with patch only on the mailing list.

Regards,
BALATON Zoltan

