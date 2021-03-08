Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E333104A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:02:42 +0100 (CET)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGT3-0003z2-JK
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJFic-0001X0-Bu
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJFia-0002Gx-3s
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615209277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrtT/CkE2ZtiTO8Qjl4sgVuaCU7qgUlKbO2lFUSQokA=;
 b=TWQPeV/Z8Zlfs6F5//djvwOLSQRSdHIY8s5lShfnS/4TrQfGfR+TPLJv2/WpoMHxUISZAl
 rIQvvwZCzPH0343Pfq721k7vuxsJvAygAA1zm4pmjClOvG0DTJgs4Td3LWQNp0QKRgEKkw
 Ikmikp+af00OmSV6rVFi1/bRtqbZi54=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-BEi_x-dzNUWYd5UojA9RBw-1; Mon, 08 Mar 2021 08:14:34 -0500
X-MC-Unique: BEi_x-dzNUWYd5UojA9RBw-1
Received: by mail-ej1-f71.google.com with SMTP id si4so4051797ejb.23
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qrtT/CkE2ZtiTO8Qjl4sgVuaCU7qgUlKbO2lFUSQokA=;
 b=i0VscLr+9Ne8VUSzD6So6fJ0Yr8emlix+E9kJUcD5edNxjNUqH8ncTeHjgJ33b4tUv
 9PYu23OSXHvCdi23zgcO3Cg7tlWvm0UbCh3QSfRngQevwddpSLVgfbFrcbRhWSjCz3hF
 vlCNH5V4aQGVyIOUOkBg4kRyroRuJ/lxIRwwSbK1tVM44b69ndXrDndfLck25D/b0D9j
 URkC+pd70BI5JrKIxWWU/US7AeR5l4spUEJ2vYzEha9n3i7d6VLCKgjWM2stFU0o9rXu
 CGAnbwklgl0NWWYnM495sqqFlH4XM8mYXBLnnSpOLCFvfaMaYV8dMBg6NhjR9WPzNJzQ
 Zbig==
X-Gm-Message-State: AOAM5319Hh4FZFPNrQLOQrfIaLzy8soROk64+8PBcWI04b+z/YWV0hpN
 Ny4hiK9bevqttVUOgS1ooqAjS5f/RlYMYyt/N38Yn5eQI5T4li3iSgDmV3drk0zguPC5ywM6ad4
 nF2hzZAy2Jb62RR4=
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr7251904edb.214.1615209273172; 
 Mon, 08 Mar 2021 05:14:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpziUAMcJ7fOhHUMFiN2N54O39JYIc4R8BP3/qBX28ssL9hAkvZ6ckBblyoQCneC/MrsNmjw==
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr7251882edb.214.1615209272991; 
 Mon, 08 Mar 2021 05:14:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id oy8sm6535091ejb.58.2021.03.08.05.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:14:32 -0800 (PST)
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
 <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
 <YEYVPsRcE1S9vuo3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <843150bc-7a6e-38e7-8957-22087ce0d80e@redhat.com>
Date: Mon, 8 Mar 2021 14:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEYVPsRcE1S9vuo3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 1:14 PM, Daniel P. Berrangé wrote:
> On Mon, Mar 08, 2021 at 12:55:10PM +0100, Thomas Huth wrote:
>> On 08/03/2021 12.16, Philippe Mathieu-Daudé wrote:
>>> Hi Peter,
>>>
>>> +Markus/Paolo/Laurent/Richard
>>>
>>> On 3/8/21 11:24 AM, Peter Maydell wrote:
>>>> On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> On 07/03/2021 16.56, Warner Losh wrote:
>>>>>> The FreeBSD project has a number of enhancements to bsd-user. Add myself
>>>>>> as maintainer and Kyle Evans as a reviewer. Also add our github repo.
>>>>>>
>>>>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>>>>> Signed-off-by: Kyle Evans <kevans@freebsd.org>
>>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>    MAINTAINERS | 5 ++++-
>>>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index 26c9454823..ec0e935038 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -2896,9 +2896,12 @@ F: thunk.c
>>>>>>    F: accel/tcg/user-exec*.c
>>>>>>
>>>>>>    BSD user
>>>>>> -S: Orphan
>>>>>> +M: Warner Losh <imp@bsdimp.com>
>>>>>> +R: Kyle Evans <kevans@freebsd.org>
>>>>>> +S: Maintained
>>>>>>    F: bsd-user/
>>>>>>    F: default-configs/targets/*-bsd-user.mak
>>>>>> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
>>>>>
>>>>> BSD is not really my home turf, but since nobody else picked this up and I
>>>>> plan to send a pull request for a bunch of patches anyway this week, I can
>>>>> also put it into my queue.
>>>>
>>>> Fine with me. (The v1 was in my to-review queue, but I'm currently
>>>> running somewhat behind on processing patches.)
>>>
>>> This is a patch for mainstream QEMU, I'm having hard time
>>> understanding the point of it. This is some official way
>>> to say that BSD-user is not maintained in mainstream but
>>> has to be used in the referred fork which is way different
>>> that mainstream...
>>>
>>> I'd rather wait for more mainstream contributions from Warner
>>> and Kyle, or blow the current orphan/dead code and import
>>> bsd-user-rebase-3.1 adding the maintainer entries along, but
>>> certainly not mark this dead code as maintained.
>>>
>>> Please convince me why I'm wrong, because I'd prefer NAck this
>>> patch...
>>
>> The idea has been discussed here:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01399.html
>>
>> So this is not about declaring that bsd-user is maintained in a different
>> repository, but about giving Warner et al. a chance to finally upstream
>> their work.
> 
> Yep, I think this change in MAINTAINERS file is primarily about signalling
> intent for future.
> 
> Marking the subsystem as maintained isn't saying the current code is great,
> just that there is someone committed to improving it hereafter.

OK, thank Thomas / Daniel for explaining and referring to the "BSD-user
plans" (which I didn't notice earlier).

Warner, what about mentioning your plans here in this patch?

Resumed ideally, else a simple link to the thread.

> If we want to warn people that the current impl isn't great, that's goes
> back to the topic of having a way to classify QEMU features into quality
> levels Tier 1/2/3.

That indeed sounds good w.r.t. contributors / users expectations.

I suppose 1=hw_accel/security, 2=tested, 3=rest?

Not a single clue how to do that although.


