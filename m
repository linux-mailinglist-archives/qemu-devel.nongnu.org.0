Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D54CA5DE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:24:00 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOxT-0005Yc-QE
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPNJ0-0001wp-23
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:38:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPNIw-0004Rw-CE
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646221081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cb1gEkJ0W08ut5ucby3ScKXTaT7Jsmz4K6qxWQ6kczs=;
 b=ZD36QDH8o8tHcqYkrPK1CasnGtelR1uZEVqFRZHVHzlb5JLS6SHQJpIqvS2Hg7fjQ4EI46
 4OQITYNbm6aM3EdC24gaQ2zMH8ne9cPDiq1CLTNDjgQ9pDUXZA7BX8txf/Qm6zrerBNBS8
 71TdSXpHP0u2u8WR04JNuj0/sTda/k4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-Bl_59aUoP4OOJw3fyf3ijg-1; Wed, 02 Mar 2022 06:38:00 -0500
X-MC-Unique: Bl_59aUoP4OOJw3fyf3ijg-1
Received: by mail-wr1-f72.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so534266wro.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cb1gEkJ0W08ut5ucby3ScKXTaT7Jsmz4K6qxWQ6kczs=;
 b=lnz7ohdm8jE0ZJxAZlQjN15yFnxguMPJhRhBl0hbdZIpOFTQKZKXhhDPlVhEIMP23H
 g/MrRIdOnXRmpk0CeA05S1Ky/JXbgYYIiq+2SDN/tpZbD70qS+XSe63exsooUwYOTiQr
 HgqRxF+5NWOEBc1FibrPr7/lt33ihRTZ8nYIG4UtKLZXtAclJ7AMrslgh+6l3hsP+dzT
 cmDgK4R1VuHMuoKRiZYZsARNWY1TR8a0F+RXdVR9oRYlpI+Thj2Yph9T6K2wUtsTNYKf
 G8VlJ2qFTCwaQ/0A03E619AJC94nPXBrmIh2ZKNgRYjFKstpcaxIea/ptzRfjYzvf0yg
 p8qA==
X-Gm-Message-State: AOAM532JqyVvrKpMPYgal7r6Ekv2GVV7RDmr6uPj3OjlykptlTzZb5rm
 HLg4QSr8yXshxylQ9apo6mOnBA9lOrQ5Vprehi3lLoL1ES5vf9By3bYe6nyH2x/EVS4/XCqbCFl
 6sOXRHc+u2nYru5s=
X-Received: by 2002:adf:e10a:0:b0:1e3:3188:79c7 with SMTP id
 t10-20020adfe10a000000b001e3318879c7mr22785945wrz.329.1646221079458; 
 Wed, 02 Mar 2022 03:37:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvki0ymVU3zqq2+1YOYzHTAoGjUbF+hFC8weEKxNLANniGP6p/4BL+vRwwTD0UKanKkaw84g==
X-Received: by 2002:adf:e10a:0:b0:1e3:3188:79c7 with SMTP id
 t10-20020adfe10a000000b001e3318879c7mr22785929wrz.329.1646221079197; 
 Wed, 02 Mar 2022 03:37:59 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 i9-20020adffdc9000000b001f046861795sm925426wrs.19.2022.03.02.03.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 03:37:58 -0800 (PST)
Message-ID: <d90960b3-3165-0e17-fddd-b23cb7488b3d@redhat.com>
Date: Wed, 2 Mar 2022 12:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] iotests/303: Check for zstd support
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-3-hreitz@redhat.com>
 <e4e63939-d4c3-795b-1270-0d3f74477ec3@virtuozzo.com>
 <17a2a9e8-b0a0-8cd0-f3e3-4e4d71437d45@redhat.com>
 <f2955b23-4b41-7058-afc2-b36c561096b1@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <f2955b23-4b41-7058-afc2-b36c561096b1@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.22 12:31, Vladimir Sementsov-Ogievskiy wrote:
> 02.03.2022 14:09, Hanna Reitz wrote:
>> On 22.02.22 16:55, Vladimir Sementsov-Ogievskiy wrote:
>>> 21.02.2022 20:08, Hanna Reitz wrote:
>>>> 303 runs two test cases, one of which requires zstd support.
>>>> Unfortunately, given that this is not a unittest-style test, we cannot
>>>> easily skip that single case, and instead can only skip the whole 
>>>> test.
>>>>
>>>> (Alternatively, we could split this test into a zlib and a zstd part,
>>>> but that seems excessive, given that this test is not in auto and thus
>>>> likely only run by developers who have zstd support compiled in.)
>>>>
>>>> Fixes: 677e0bae686e7c670a71d1f ("iotest 303: explicit compression 
>>>> type")
>>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>>> ---
>>>>   tests/qemu-iotests/303 | 15 +++++++++++----
>>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
>>>> index 16c2e10827..5a3efb4ba3 100755
>>>> --- a/tests/qemu-iotests/303
>>>> +++ b/tests/qemu-iotests/303
>>>> @@ -21,7 +21,8 @@
>>>>     import iotests
>>>>   import subprocess
>>>> -from iotests import qemu_img_create, qemu_io, file_path, log, 
>>>> filter_qemu_io
>>>> +from iotests import notrun, qemu_img_pipe_and_status, qemu_io, 
>>>> file_path, \
>>>> +        log, filter_qemu_io
>>>>     iotests.script_initialize(supported_fmts=['qcow2'],
>>>> unsupported_imgopts=['refcount_bits', 'compat'])
>>>> @@ -55,9 +56,15 @@ def add_bitmap(num, begin, end, disabled):
>>>>       def test(compression_type: str, json_output: bool) -> None:
>>>> -    qemu_img_create('-f', iotests.imgfmt,
>>>> -                    '-o', f'compression_type={compression_type}',
>>>> -                    disk, '10M')
>>>> +    opts = f'compression_type={compression_type}'
>>>> +    output, status = qemu_img_pipe_and_status('create',
>>>> +                                              '-f', iotests.imgfmt,
>>>> +                                              '-o', opts,
>>>> +                                              disk, '10M')
>>>> +    if status == 1 and \
>>>> +            "'compression-type' does not accept value 'zstd'" in 
>>>> output:
>>>> +        notrun('zstd compression not supported')
>>>> +
>>>
>>> Could we make from it a function in iotests.py like 
>>> has_working_luks() / verify_working_luks() ?
>>>
>>> Then in this test we'll simply have at start iotests.verify_zstd(), 
>>> and in previous test we'll do something like "comp_type = 'zstd' if 
>>> iotests.has_zstd() else 'zlib'" in classes that wants zstd
>>
>> Well, to be honest, I deliberately didn’t do that.  We have qemu-img 
>> create calls in both of these places, where we can simply check the 
>> returned error string for free, basically. Adding a function for this 
>> check doesn’t really reduce complexity (now), because adding such 
>> functions probably has some more LoC than just checking the returned 
>> error string in these two places (I say “now” because it’s possible 
>> that more places are added in the future, though, of course).  With 
>> zstd support compiled in, such functions would effectively also just 
>> add a superfluous qemu-img create call wherever they’re used.
>>
>> I’m not saying I’m right about that judgment, because it does feel a 
>> bit like premature optimization.  Just saying why I didn’t add such 
>> functions.
>>
>> So, with that said, would you still prefer such iotests.py functions? 
>> I’ll absolutely add them in v2 if you do.
>>
>
> Yes, I think better is to have generic function for such thing:
>
> 1. These modifications makes tests more complicated to read (OK only a 
> bit more complicated, but still). And they break common practice that, 
> necessary features are controlled by verify_* functions, parameters to 
> iotests.main and so on.

OK.

> 2. I understand your doubt that we just do an extra qemu_img call. But 
> for sure there are solutions if we want:
>
>  - At least, we can call verify_* function once and cache its result 
> for the whole test run.
>  - More, we can group several verify_* things into one qemu process 
> call, to do different checks by qmp commands in context of that one 
> qemu process test run, before running real tests.
>  - And about zstd support - we can even generate a file with some 
> environment variables as we do before (remember 
> tests/qemu-iotests/common.env.in), and meson will set a CONFIG_ZSTD 
> variable in it, and then in iotests.py we'll know, do we have zstd 
> support without any extra qemu-img call. Hmm, and probably when we run 
> tests through make check, we already have this information (I mean 
> CONFIG_ZSTD).

I thought of similar stuff, but that seems so complicated that it kind 
of breaks argument 1.  Caching in iotests.py is simple enough[1], but 
caching across different test instances isn’t really.

[1] Well.  If I add it to has_qcow2_zstd_compression(), then the 
question will arise why I’m not adding it to has_working_luks() also.  
So that way, just caching in iotests.py would make this series already 
more complicated than it was here in v1.  Which is why I’d rather not 
add any caching at all.


