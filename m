Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9103F31D1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:59:53 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7s0-0005Nh-6h
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7rG-0004if-Nl
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7rF-0007Sn-66
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629478744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwTBMSxaydWX0sJXnm5xoq8mMLPzIuJyzjpqS+ZscIU=;
 b=EOZQs30Fl2Dg5n2BkVcOzMwpAMHCkOxtjcnb8G4DT6K7T/fGygoSiUM3uAm54r/97WiOPg
 Kxoy4/0C98WQjXrfRwsP/2s0U8Co4/GWGL/frAwJlDZef+DmsRVkp6GcVf2QRGYCo0HrwU
 ho119Icw4UUKFlzfBqK5iIMqYMtRZF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-VhgF-4d1M7-7Qi8Gw1o-SA-1; Fri, 20 Aug 2021 12:59:03 -0400
X-MC-Unique: VhgF-4d1M7-7Qi8Gw1o-SA-1
Received: by mail-wm1-f69.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so2581498wme.4
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IwTBMSxaydWX0sJXnm5xoq8mMLPzIuJyzjpqS+ZscIU=;
 b=pivO1YIZFbHzrif6nyoU8p0vdh4xn2o3TYjUB8AdDhC5jTIicg/wJj1JndTIQscEWg
 Ruq+FywowTRJawvHnYAgPMDdC8v+ESHTvcvSLTSSc7apUeu9kKJ+9QdChAgjlXIs+1Pw
 eFpE0NqikY7KDuRvklP86BIzaH3eAe2jEd1A8omkBkiqMLPDYnyiBH8vyqPWOhvsAd0I
 aHzAdWnW4K+tEoXr8woRRNu5FCV1dNAN5PHC5FHh4oRmp58krla3JqVa+hLvAAmpNlC9
 18vC6c/2msit/LIDRlAYk7/xtMVqlKLQsCZ48cUkryfdVuf5J21oYpzpNjxho6Jt+l0l
 APoA==
X-Gm-Message-State: AOAM533+p/V74TMkKQx3OpW0n9aOspS691kwS75YXCMDv4TAJCjdNmHi
 gCWDtnrViSjFjX7DRQFAr8+NQivSZL4EAT2ghKXyoevEa4vTSLloA78wxnvbQX8YTNMK8adAFBI
 z2LzFtmlVhWlua+g=
X-Received: by 2002:a05:600c:1ca7:: with SMTP id
 k39mr4971582wms.162.1629478742021; 
 Fri, 20 Aug 2021 09:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsuMwu+83nfkA3jA/iDiaBx+kXebYM5x+S8fTi7DbR6QF2E1VmzLblzbzo312kp8HOA6KHIQ==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id
 k39mr4971557wms.162.1629478741753; 
 Fri, 20 Aug 2021 09:59:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d4sm6849790wrc.34.2021.08.20.09.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:59:01 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: Igor Mammedov <imammedo@redhat.com>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <20210820184048.4a5294c4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5699e784-f120-25e8-d0c6-b3e53ed0b883@redhat.com>
Date: Fri, 20 Aug 2021 18:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820184048.4a5294c4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 6:40 PM, Igor Mammedov wrote:
> On Fri, 20 Aug 2021 18:00:26 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 8/20/21 5:53 PM, David Hildenbrand wrote:
>>> On 20.08.21 17:52, Philippe Mathieu-Daudé wrote:  
>>>> When Linux refuses to overcommit a seriously wild allocation we get:
>>>>
>>>>    $ qemu-system-i386 -m 40000000
>>>>    qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot
>>>> allocate memory
>>>>
>>>> Slighly improve the error message, displaying the memory size
>>>> requested (in case the user didn't expect unspecified memory size
>>>> unit is in MiB):
>>>>
>>>>    $ qemu-system-i386 -m 40000000
>>>>    qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram':
>>>> Cannot allocate memory
>>>>
>>>> Reported-by: Bin Meng <bmeng.cn@gmail.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>   softmmu/physmem.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>> index 2e18947598e..2f300a9e79b 100644
>>>> --- a/softmmu/physmem.c
>>>> +++ b/softmmu/physmem.c
>>>> @@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block,
>>>> Error **errp)
>>>>                                                    
>>>> &new_block->mr->align,
>>>>                                                     shared, noreserve);
>>>>               if (!new_block->host) {
>>>> +                g_autofree char *size_s =
>>>> size_to_str(new_block->max_length);
>>>>                   error_setg_errno(errp, errno,
>>>> -                                 "cannot set up guest memory '%s'",
>>>> +                                 "Cannot set up %s of guest memory
>>>> '%s'",
>>>> +                                 size_s,
>>>>                                    memory_region_name(new_block->mr));
>>>>                   qemu_mutex_unlock_ramlist();
>>>>                   return;
>>>>  
>>>
>>> IIRC, ram blocks might not necessarily be used for guest memory ... or
>>> is my memory wrong?  
>>
>> No clue, this error message was already here.
> 
> it's not only guest RAM, adding size here is marginal improvement,
> (it won't help much since it's not exact match to CLI which may use suffixes for sizes)

The suffixed size is already converted at this point:

  qemu-system-i386 -m 2T
  qemu-system-i386: Cannot set up 2 TiB of guest memory 'pc.ram': Cannot
allocate memory

I agree however the size displayed might be less than the size passed
to the '-m' argument.

Anyhow I still see the size displayed in the error message as an
useful hint:

$ qemu-system-i386 -m 64000
qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate
memory

VS:

$ qemu-system-i386 -m 64000
qemu-system-i386: Cannot set up 62.5 GiB of guest memory 'pc.ram':
Cannot allocate memory

> 
>>
>> No problem to change s/guest/block/ although.
>>
> 


