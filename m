Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E17435BAC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:28:41 +0200 (CEST)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSVC-0001Ok-SI
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdSS9-0007FV-N0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdSS3-0003AS-DG
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634801115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlAxv2orC5jqPlQuiLhXCnzhCeE8oJpKM8SICAXYB14=;
 b=KaLrdCGgZi2WZXDNjt0tY5sxSR9hSHu5J8zMOOLVJRApXgysOa59XsJgG7urgwA9szu48O
 L5qVoCJ23LT7gTX2LE0z5nQzaeXuQGEdZoK78mi4kX7jmKSLiTuyUl03OfcjHrklJ3I9+X
 YqkDFkVAmopjjgW/a/0AhoWtnrOhiak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-c-LzViuaMEG5UR-yiYoyyQ-1; Thu, 21 Oct 2021 03:25:12 -0400
X-MC-Unique: c-LzViuaMEG5UR-yiYoyyQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l39-20020a05600c1d2700b0030dba1dc6eeso4051226wms.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 00:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nlAxv2orC5jqPlQuiLhXCnzhCeE8oJpKM8SICAXYB14=;
 b=lX0j94xr+x0cnvMETPgJ8GOrrfnJihyGkCicf1wbIiLbB42l3JCTX5mgh8ujs7To9F
 YoavUjL+A0Xbyk6bJiUoq8QjhBKo2EGQInrbihlUSkh/fFXgcliTvuu4lpTMH265HiNO
 JQDk55t/sDlvCFNh+AkKZhVXhSzGjOGqD5PnazUhzhKGOHx2MR8mTj3vRScQneL14dO4
 XHwE6l1ZWBWTS459hqAmAmcNazOXcdSKhKYXwwI958ZDRL5eQFRWOoJZ3jYYtxR3thjs
 c2xkw2eBBWuDHjBkcTo8keQ2lQBvwkmX0shY4LcntOymHIPzXU6BVCsQ6Dkw/yi2AkV+
 jxWw==
X-Gm-Message-State: AOAM532VFPN2Bsl5h79JilnEzZdcD8A6Z/D32EdN9dPzUFvAulKItpEh
 +QQrRK1dp8zS6JtrTRJ1sL3qz6diQmqpGCeQj2vG+M0j1SzyoFI9bVOsJfqPCbgFMbGP/rsjeSx
 Np+9yzpMd8qARUkg=
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr1005430wmh.125.1634801111221; 
 Thu, 21 Oct 2021 00:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/1iwoNd1AxOCdl7OVJfhFIo/4YAehcUCCa7vyMFJ6Nmak4iDsQHPZ2N8j0dleQlbAKit+2A==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr1005385wmh.125.1634801110903; 
 Thu, 21 Oct 2021 00:25:10 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id q17sm4081371wrm.6.2021.10.21.00.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 00:25:10 -0700 (PDT)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
 <5263c819-b13c-f48a-d720-15b085537070@csgroup.eu>
 <8add201d-73cc-d7b1-cb52-f1fd18eb5d69@csgroup.eu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Message-ID: <d33f80df-1f82-b542-1e46-ffd3d3e01861@redhat.com>
Date: Thu, 21 Oct 2021 09:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8add201d-73cc-d7b1-cb52-f1fd18eb5d69@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/2021 08.48, Christophe Leroy wrote:
> 
> 
> Le 20/10/2021 à 15:16, Christophe Leroy a écrit :
>>
>>
>> Le 20/10/2021 à 14:43, Cédric Le Goater a écrit :
>>> On 10/20/21 13:42, BALATON Zoltan wrote:
>>>> On Wed, 20 Oct 2021, Philippe Mathieu-Daudé wrote:
>>>>> On 10/5/21 14:29, Thomas Huth wrote:
>>>>>> On 05/10/2021 14.20, BALATON Zoltan wrote:
>>>>>>> On Tue, 5 Oct 2021, Cédric Le Goater wrote:
>>>>>>>> On 10/5/21 08:18, Alexey Kardashevskiy wrote:
>>>>>>>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>>>>>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>>>>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>>>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com>
>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in
>>>>>>>>>>>>>>>> QEMU (as far as I
>>>>>>>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>>>>>>>> also not possible
>>>>>>>>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> True. I did some more research, and seems like there was once
>>>>>>>>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>>>>>>>>> couple of years ago already:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>>>>>>>> deprecate-and-delete them.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>>>>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I really would like to be able to use them to validate Linux 
>>>>>>>>>>>>> Kernel
>>>>>>>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>>>>>>>
>>>>>>>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any
>>>>>>>>>>>>> regression
>>>>>>>>>>>>> tests of Linux Kernel on those processors.
>>>>>>>>>>>>
>>>>>>>>>>>> If you/someone managed to compile an old version of u-boot for
>>>>>>>>>>>> one of these
>>>>>>>>>>>> two boards, so that we would finally have something for
>>>>>>>>>>>> regression testing,
>>>>>>>>>>>> we can of course also keep the boards in QEMU...
>>>>>>>>>>>
>>>>>>>>>>> I can see that it would be usefor for some cases, but unless someone
>>>>>>>>>>> volunteers to track down the necessary firmware and look after it, I
>>>>>>>>>>> think we do need to deprecate it - I certainly don't have the
>>>>>>>>>>> capacity
>>>>>>>>>>> to look into this.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I will look at it, please allow me a few weeks though.
>>>>>>>>>
>>>>>>>>> Well, building it was not hard but now I'd like to know what board
>>>>>>>>> QEMU actually emulates, there are way too many codenames and PVRs.
>>>>>>>>
>>>>>>>> yes. We should try to reduce the list below. Deprecating embedded
>>>>>>>> machines
>>>>>>>> is one way.
>>>>>>>
>>>>>>> Why should we reduce that list? It's good to have different cpu
>>>>>>> options when one wants to test code for different PPC versions (maybe
>>>>>>> also in user mode) or just to have a quick list of these at one place.
>>>>>>
>>>>>> I think there are many CPUs in that list which cannot be used with any
>>>>>> board, some of them might be also in a very incomplete state. So
>>>>>> presenting such a big list to the users is confusing and might create
>>>>>> wrong expectations. It would be good to remove at least the CPUs which
>>>>>> are really completely useless.
>>>>>
>>>>> Maybe only remove some from system emulation but keep all of them
>>>>> in user emulation?
>>>>
>>>> Or keep them all but mark those that are not tested/may be incomplete? 
>>>> So the used can see what is expected to work and what may need to be 
>>>> fixed. That way somebody may try and fix it whereas if it's not there 
>>>> they are unlikely to try to add it.
>>>
>>>
>>> The bamboo machine with 440 CPUs is booting with the latest kernel
>>> and we have an acceptance test for it now, thanks to Thomas. There
>>> is not much effort in keeping them in a working state until someone
>>> volunteers. Hopefully, Christophe is making sure that we are not
>>> breaking anything with Linux support.
>>>
>>> The 405 machine are still close to deprecation I think. We are still
>>> struggling to boot one with mainline Linux, using uboot provided by
>>> Thomas which skips SDRAM init. It is not clear to me if u-boot is
>>> strictly necessary. It depends if Linux relies on it to do some
>>> pre-initialization of HW. I guess once we find a good DTS for it, or
>>> not, we can take a decision.
>>>
>>
>> I now have a hacked configuration booting linux with the hotfoot DTS and 
>> the kernel is booting up to starting /init
>>
>> Then it is faulting forever taking a DSI for write protection. The problem 
>> is now likely in Linux and I'm investigating it, but I'm having problem 
>> with GDB (7.8.1), I'm hitting the bug 
>> https://sourceware.org/bugzilla/show_bug.cgi?id=17700
>>
>> And GDB 11.1 coredumps while reading vmlinux's symbols
>>
>> Hopefully I'll find a GDB version between 7.8 and 11 that works.
> 
> I bisected the issue to 
> https://github.com/linuxppc/linux/commit/52ae92cc290f0506eef9ad5466bb453ce4a9e80e 

You could argue that this commit introduced a bug, or at least a bad 
behavior in the kernel: According to the 405 user's manual that I have:

  10.2 Reserved Fields
  For all registers having fields marked as reserved, the reserved
  fields should be written as zero and read as undefined. That is,
  when writing to a reseved field, write a 0 to the field. When
  reading from a reserved field, ignore the field.

Thus the kernel should not write non-zero bits into the upper bits of this 
register.

> The problem is in QEMU, it should ignore upper bits of PID register.

Agreed, that's certainly necessary, too.

> The following change fixes the issue, don't know it is it the right way to 
> fix though
> 
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 754509e556..44f4fa5280 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -570,7 +570,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, 
> mmu_ctx_t *ctx,
>       for (i = 0; i < env->nb_tlb; i++) {
>           tlb = &env->tlb.tlbe[i];
>           if (ppcemb_tlb_check(env, tlb, &raddr, address,
> -                             env->spr[SPR_40x_PID], 0, i) < 0) {
> +                             env->spr[SPR_40x_PID] & 0xff, 0, i) < 0) {
>               continue;
>           }
>           zsel = (tlb->attr >> 4) & 0xF;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 2cb98c5169..9331830f34 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -789,7 +789,7 @@ void helper_4xx_tlbwe_hi(CPUPPCState *env, target_ulong 
> entry,
>       } else {
>           tlb->prot &= ~PAGE_VALID;
>       }
> -    tlb->PID = env->spr[SPR_40x_PID]; /* PID */
> +    tlb->PID = env->spr[SPR_40x_PID] & 0xff; /* PID */
>       LOG_SWTLB("%s: set up TLB %d RPN " TARGET_FMT_plx " EPN " TARGET_FMT_lx
>                 " size " TARGET_FMT_lx " prot %c%c%c%c PID %d\n", __func__,
>                 (int)entry, tlb->RPN, tlb->EPN, tlb->size,
> @@ -837,7 +837,7 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_ulong 
> entry,
> 
>   target_ulong helper_4xx_tlbsx(CPUPPCState *env, target_ulong address)
>   {
> -    return ppcemb_tlb_search(env, address, env->spr[SPR_40x_PID]);
> +    return ppcemb_tlb_search(env, address, env->spr[SPR_40x_PID] & 0xff);
>   }

The modications looks sane to me, could you please send this as a proper 
patch (with Signed-off-by line) to the mailing list?

Alternatively, it might be possible to do the masking only once in 
helper_booke_setpid() in mmu_helper.c:

void helper_booke_setpid(CPUPPCState *env, uint32_t pidn, target_ulong pid)
{
     if (pid == SPR_40x_PID) {
         pid &= 0xff;
     }
     env->spr[pidn] = pid;
     /* changing PIDs mean we're in a different address space now */
     tlb_flush(env_cpu(env));
}

... not sure whether that is the better approach here, though ... it maybe 
depends whether the reserved bits read back as zeros on a real 405 or not...

  Thomas


