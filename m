Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47084DC5E6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:34:56 +0100 (CET)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpLD-0007mq-El
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:34:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUpJD-00075O-Ih
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUpJA-0007Lc-Rd
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647520367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Dh0aEuicEhma/xt3iE5fmOcG5AEEA/TpkSwf5eCz94=;
 b=ZBzfviEl81B3Qd5nG8sIHtTE6y7VGH5yYJ115XlIkdh8JajpynO9ZptgCmTaWPbXMrq7gZ
 vQzvQ08+avTz98i/hT0hf4q8i4LNHW6He2W1mOlb8fD9pxSfTadtGXCmFDEaBKi77d8xnx
 qrD1Or8obo/65GryZNqzYQHW5+7HB8c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251--H0UeYJUOo2U7HMNp6rMzg-1; Thu, 17 Mar 2022 08:32:44 -0400
X-MC-Unique: -H0UeYJUOo2U7HMNp6rMzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso3173175wml.1
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Dh0aEuicEhma/xt3iE5fmOcG5AEEA/TpkSwf5eCz94=;
 b=TLADxcbwvzNd7d69oj8vGUtWd7BFfwxHPsIP4dhqbcnjeiLWWT57jeajNqjBwFkHWV
 It7EtBAPCxxE7tZCewQwKWz2EgM0bsBKr/s25F3V4V0VI5CTrJr359ww2bWktKFt5eSa
 qjY1RXUWUZiqZ6b7FTXARTtTtHbXH6xlKIEMwZW+oDBa0FyeFtgJmcbjTFEWy23knbuV
 h6ASLtDfpicfZvg/Y39m5IpbMBs3CQtagp2ve83SEAxK4m0BcuVpIAhVoBYWoYJ314/6
 Pn1DJugeDRXqAVCHL0MyikgX85+vNquAOnz0mGNyi1ye/itfdQ1v6lfKfK9+kwWBeAPK
 nKBw==
X-Gm-Message-State: AOAM5328mQPylQCRaekCZugoMdWx/1W5KzCLm3jVQCExO9ph0qlPLDSZ
 UTxfvGA9R+kgoEbrbMH7Pf2JKU+BUPj3JWR71vCp++ggaS6EH510+BWmiV5CiseskSdkk/DWjpW
 U9gZr0SvsXj06Ts8=
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr11356141wma.75.1647520363025; 
 Thu, 17 Mar 2022 05:32:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkb221eYzbXc12/VlSq09ogQIeDvMhTtOncyc1+6AdeYT4qoFG9OazUDeGljzUsBjmFqhZLw==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr11356119wma.75.1647520362742; 
 Thu, 17 Mar 2022 05:32:42 -0700 (PDT)
Received: from [192.168.42.76] (tmo-098-109.customers.d1-online.com.
 [80.187.98.109]) by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm3570298wry.102.2022.03.17.05.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 05:32:41 -0700 (PDT)
Message-ID: <79b983e8-40aa-35b6-cdf4-6cb0571c37e5@redhat.com>
Date: Thu, 17 Mar 2022 13:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
To: Markus Armbruster <armbru@redhat.com>
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
 <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
 <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com>
 <87bky6ugmx.fsf@pond.sub.org>
 <8e608283-b5d2-91d9-26b3-372c57422a30@redhat.com>
 <87o825qb6y.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87o825qb6y.fsf@pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/2022 08.40, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 16/03/2022 15.16, Markus Armbruster wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> On 16/03/2022 14.32, Philippe Mathieu-Daudé wrote:
>>>>> On 16/3/22 14:24, Thomas Huth wrote:
>>>>>> The vga_common_init() function currently cannot report errors to its
>>>>>> caller. But in the following patch, we'd need this possibility, so
>>>>>> let's change it to take an "Error **" as parameter for this.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>     hw/display/ati.c            |  7 ++++++-
>>>>>>     hw/display/cirrus_vga.c     |  7 ++++++-
>>>>>>     hw/display/cirrus_vga_isa.c |  7 ++++++-
>>>>>>     hw/display/qxl.c            |  6 +++++-
>>>>>>     hw/display/vga-isa.c        |  9 ++++++++-
>>>>>>     hw/display/vga-mmio.c       |  8 +++++++-
>>>>>>     hw/display/vga-pci.c        | 15 +++++++++++++--
>>>>>>     hw/display/vga.c            |  9 +++++++--
>>>>>>     hw/display/vga_int.h        |  2 +-
>>>>>>     hw/display/virtio-vga.c     |  7 ++++++-
>>>>>>     hw/display/vmware_vga.c     |  2 +-
>>>>>>     11 files changed, 66 insertions(+), 13 deletions(-)
>>>>>
>>>>> Please setup scripts/git.orderfile :)
>>>>>
>>>>>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>>>>>> index 847e784ca6..3e8892df28 100644
>>>>>> --- a/hw/display/vga_int.h
>>>>>> +++ b/hw/display/vga_int.h
>>>>>> @@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
>>>>>>         return (v << 2) | (b << 1) | b;
>>>>>>     }
>>>>>> -void vga_common_init(VGACommonState *s, Object *obj);
>>>>>> +void vga_common_init(VGACommonState *s, Object *obj, Error **errp);
>>>>>
>>>>> Can we also return a boolean value? IIUC Markus recommended to check
>>>>> a boolean return value rather than Error* handle.
>>>>
>>>> Really? A very quick grep shows something different:
>>>>
>>>> $ grep -r ^void.*Error include/ | wc -l
>>>> 94
>>>> $ grep -r ^bool.*Error include/ | wc -l
>>>> 46
>>>
>>> Historical reasons.  We deviated from GLib here only to find out that
>>> the deviation leads to awkward code.  I flipped the guidance in commit
>>> e3fe3988d7 "error: Document Error API usage rules" (2020-07-10).  A lot
>>> of old code remains.
>>
>> Hmm, you should add some BiteSizeTasks to our issue tracker then to
>> get this fixed, otherwise people like me will copy-n-paste the bad
>> code examples that are all over the place!
> 
> I'm not sure the issue tracker is a good fit here.  An issue tracker
> works best when you use it to track units of work that can be completed
> in one go.  An issue then tracks progress of its unit of work.

That's why I wrote "*some* BiteSizeTasks", not "one BitSizeTask" ... of 
course you've got to break it down for unexperienced new developers first, 
e.g. by subsystem. I did that for example for the indentation clean up tasks:

  https://gitlab.com/qemu-project/qemu/-/issues/376
  https://gitlab.com/qemu-project/qemu/-/issues/371
  https://gitlab.com/qemu-project/qemu/-/issues/372

> This isn't a unit, it's more like a class of units.
> 
> I added an item to https://wiki.qemu.org/ToDo/CodeTransitions for now.

Thanks, but I doubt that this will help much - the description is really 
terse, and for anybody who is not involved in this email thread here, I 
guess it's hard for them to figure out the related parts in the 
include/qapi/error.h on their own ... so if you really want somebody else to 
work on this topic, I think you have to elaborate there a little bit (e.g. 
by giving an example in-place).

  Thomas


