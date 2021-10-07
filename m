Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82011424E70
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:00:59 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOKo-0008DB-8d
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYOJC-0007Ww-7E
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYOJA-0006JS-DB
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633593555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF/jRWRHoLDnU/HOUhFRONVVOoO/cy34ZUZn6rnrAIQ=;
 b=BLOurXF5jBgJs2njxjfbXkEze34umUDU1Xym55fIuPj9wxpXM6T4iIP9Z6awXnPR4XTeUR
 wC6h7BJ3ITlt+BsXb3mlQ/JeRMK9NY5CT7O40PtbpRgYvcmRht/CcNtoNq8pROJCzuv7py
 /4aTEcSMNsODZ6+xJ/SPFMewfNo9CqM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-uNmJlBWtN76f4tsXVBU-Hw-1; Thu, 07 Oct 2021 03:59:14 -0400
X-MC-Unique: uNmJlBWtN76f4tsXVBU-Hw-1
Received: by mail-wr1-f69.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so911405wrd.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 00:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HF/jRWRHoLDnU/HOUhFRONVVOoO/cy34ZUZn6rnrAIQ=;
 b=PiXfbs1VLkjFMKBORRbo6cNRGGFMdDWQ63q4rLzPQdyzzfTpfKgJju3t+gWV0Xzz4l
 VM6pJy1Eud1YzEKu1jBEGNcylxOYRQRCjzWeMC4vEY/FIUuClVDKk1SRab8D1G29WzEb
 cMP4kQcqJUBAGO6tD4JsCIQsNj9wj643odz6TD0S0yostBOqSa8NsAcLIO2Pzqg2xDgO
 qZT7JjlxB4PldwNvnjnSxTscH6x/+AtmykhAgzJkythkNVddjxeUQ9inGz9nMfeI6VYQ
 +SSGdtWKtuWDDr4aJQZdFq13TqmA0GV33asJ5pn2CQv71Ujiic2b8BxRxnFVlQo4HHJW
 tlbg==
X-Gm-Message-State: AOAM5329s76AQh7zw+iVINGReYYBpX6rhal/J1Ga6WF17Zlvykgw+ZxS
 9Qk/ncem/iPhjdtDFwW/h6KJ8uNqgw+1szzb0sIdeEJuPeCxsheMHo+4enDy+ulY39NpWhVnG/Z
 EkdFtiuwkDWXLkiM=
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr15203242wme.94.1633593553478; 
 Thu, 07 Oct 2021 00:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeGzdpbTIJrIcOqT09SXmEOL54ylP1Qf3iZHcMuGgps/yAGQkvAmAVPNUmdCMm1kY/DKK+wA==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr15203222wme.94.1633593553243; 
 Thu, 07 Oct 2021 00:59:13 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v13sm20243507wrp.64.2021.10.07.00.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 00:59:12 -0700 (PDT)
Message-ID: <6b919273-ab23-6822-fdeb-66e18009f70a@redhat.com>
Date: Thu, 7 Oct 2021 09:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
To: Alistair Francis <alistair23@gmail.com>,
 Damien Hedde <damien.hedde@greensocs.com>
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 08:41, Alistair Francis wrote:
> On Wed, Oct 6, 2021 at 10:04 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
>> On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
>>> On 10/6/21 13:37, Damien Hedde wrote:
>>>> Right now, we cannot load some binary file if it is bigger than the
>>>> machine's ram size. This limitation only occurs when loading a
>>>> binary file: we can load a corresponding elf file without this
>>>> limitation.
>>>>
>>>> This is an issue for machines that have small ram or do not use the
>>>> ram_size feature at all.
>>>>
>>>> Also get rid of "hw/boards.h" include, since we needed it only
>>>> to access `current_machine`.
>>>>
>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>> ---
>>>>
>>>> Hi Alistair,
>>>>
>>>> I found this while experimenting with a ram_size=0 machine.
>>
>>
>>
>>>
>>> Where are you loading your file?
>>>
>>
>> In a rom.
>>
>> The loader does not check at all that we are loading to the machine's
>> ram. It just check the size for the raw binary file format.
> 
> Hmmm... This is probably correct, in that a user might want to load a
> binary into ROM and doesn't want to be blocked by the ram size.
> 
> In general though a user would expect an error if they are loading a
> file into RAM that is larger then the RAM. So I'm not fully convinced
> we want this change.

I agree with Damien using current_machine->ram_size is not ideal,
for example some machines have the RAM split and mapped at different
regions, so even if ram_size is enough for the image to load,
a region might not be big enough and I'd expect load_image_targphys_as()
to fail.

Maybe we can call memory_region_find(s->addr) then on match:

 if (memory_region_is_ram*(match)) {
   size = memory_region_size(match);
 } else {
   size = -1;
 }


> 
> What error do you get if you try to load a binary that is too large
> with this patch applied?
> 
> Alistair
> 
>>
>> --
>> Damien
>>
>>
>>
> 


