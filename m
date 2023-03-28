Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B506F6CC8B2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:00:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCeo-0006tR-A1; Tue, 28 Mar 2023 12:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phCem-0006sv-4b
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phCek-0004tW-D4
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680022725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fzBMtKXlc4JDfuHrDq7UsszjrhTAq698GnqgTTtuYYs=;
 b=IsDu7q2bG3ODFgbfj3+e+vNDVvSRzEPZKRPd6VfYRuAzkS0m0My11W3xvZTQZh/NAcvW0X
 H4p+7IC5n87TIVxeLxmaQhUdUSJAuQ8GVQhBVKlhD/5GMHmhBIJ6v+S98eT3hrQYn5f5DL
 1RuUlGBq641KbsNFZjJXzq64hJovtDg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-e_sCve1qMeCVejWG3WMA-Q-1; Tue, 28 Mar 2023 12:58:43 -0400
X-MC-Unique: e_sCve1qMeCVejWG3WMA-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 679AE1C05157;
 Tue, 28 Mar 2023 16:58:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3F2202701E;
 Tue, 28 Mar 2023 16:58:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24AEA21E6926; Tue, 28 Mar 2023 18:58:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
References: <20230323204414.423412-1-danielhb413@gmail.com>
 <20230323204414.423412-2-danielhb413@gmail.com>
 <87zg7x2wca.fsf@pond.sub.org>
 <49e58c51-fca4-6b6f-db4a-27e4cfefacd4@gmail.com>
 <87v8il19sz.fsf@pond.sub.org>
 <f00b7e27-4c9f-226d-d727-241430be1d4c@gmail.com>
Date: Tue, 28 Mar 2023 18:58:42 +0200
In-Reply-To: <f00b7e27-4c9f-226d-d727-241430be1d4c@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 28 Mar 2023 09:54:13 -0300")
Message-ID: <87a5zwx16l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 3/28/23 06:53, Markus Armbruster wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:

[...]

>>> I believe we can improve the ARM boot code to not create ms->fdt at init(),
>>> leaving it unassigned, and make get_dtb() return the machine FDT on a common
>>> "void *" pointer. That would spare us from having go g_free(ms->fdt) to avoid
>>> leaks and we would assign ms->fdt at the end of arm_load_dtb() normally. I made
>>> a quick attempt at that but the ARM init() code is a little tricker than I've
>>> anticipated. I might have a crack at it later.
>>
>> Do we want a quick interim fix for 8.0?
>> Have a careful look at the untested patch below.
>> 
>>> Thanks,
>>>
>>> Daniel
>>>
>>>
>>>>
>>>>          }
>>>>
>>>>> @@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>>>        qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>>>>                                           rom_ptr_for_as(as, addr, size));
>>>>>    -    g_free(fdt);
>>>>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>>>>> +    ms->fdt = fdt;
>>>>>           return size;
>>>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 50e5141116..54f6a3e0b3 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>                                          rom_ptr_for_as(as, addr, size));
>>   -    g_free(fdt);
>> +    if (fdt != ms->fdt) {
>> +        g_free(ms->fdt);
>> +        ms->fdt = fdt;
>> +    }
>>         return size;
>
> This looks better than what I've been proposing here because it centers everything in
> the same spot. It'll also make it easier to change/remove it when we have the chance
> to take a look at the ARM boot code.
>
> Just tested it here and it works fine. Feel free to format it into a patch and send
> it. I'll give my r-b.

I'm going to send it as v3 with your S-o-B, because I'm stealing most of
your commit message.


