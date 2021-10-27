Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604243C551
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:38:04 +0200 (CEST)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfeRf-0005eV-CV
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfePk-00049m-0d
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfePX-0007Qe-7c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635323750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFeMhCmjuoy403Bl3/SSNdZp3YEPUWQIuXS5Kndt2R0=;
 b=bw9jE4iJ3uOdmpkKhu9uI8+hQYStzSFizbGqoZv0G6Ig0MakKx4tWv9e1pEwvCEMxH1b8K
 QOZoV94W3ZCSbrsDIVD9bwgsilOVHL0JR4PT2qcvT5jSL1a8C/5ggQYAJuC7ZKlKl5iGRv
 OVokXtnq+nD2QxwGgd4OU7JhIwuIRZ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-8bPtkWBqN7Ow-_hVPb_SrA-1; Wed, 27 Oct 2021 04:35:47 -0400
X-MC-Unique: 8bPtkWBqN7Ow-_hVPb_SrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so906074wmj.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mFeMhCmjuoy403Bl3/SSNdZp3YEPUWQIuXS5Kndt2R0=;
 b=Xg0d+dcAHc4NxR0jMPnuzRn2zfV97ffBBgVI23XUPXlIeWqNy8rwEWeGjn1rM5y//j
 ep7loEOegfNl1GqP+OCxV/IR8bQEF6dMEstWGb9tMOcioUxank8nOn7if3kTufFb9oTJ
 DhUqF7coBvvuWM9F1zbjdyGikctvPWevtz5X27iDqLAqBFx8DtW32rFI7JixEkUBntfY
 66nlxwGPI9l25qjTdrv7zqUtglHUAkjnL1oevdteE/zjPuAiQrdCymdUUk18rYED1i/W
 N/QwciUOmN4IzN4eBeRHr9TMwGxmafBRgHAakaiOCXdikQuNRMKBtKqKMx8ZaPyp3hxQ
 TkKQ==
X-Gm-Message-State: AOAM532/63tEE33cjmEA2m/CP61991/RqCAyl4/e1LVEStEEGs0yj2+7
 QVOHVIk98kAP3DzbxWLzgGGyTffME0rBTNdjfBz3xoEQxlN/1ZrTZ6TyLlfu6aBeTDhKQdTuno7
 RbhOvun3NtXrmDF4=
X-Received: by 2002:adf:82b0:: with SMTP id 45mr9952622wrc.120.1635323745847; 
 Wed, 27 Oct 2021 01:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwss5GCjDFDN2SxuxnCXy3vQ+SS2QfDFn060uPVnhAGJxsuF8bJgEm2xF6msnkCROeBo4IhUQ==
X-Received: by 2002:adf:82b0:: with SMTP id 45mr9952598wrc.120.1635323745597; 
 Wed, 27 Oct 2021 01:35:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id u2sm20340082wrr.35.2021.10.27.01.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 01:35:45 -0700 (PDT)
Message-ID: <6b016523-87d5-f17e-8f1c-2e6ccf0dce0b@redhat.com>
Date: Wed, 27 Oct 2021 10:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/4] qemu-img: implement compare --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-2-vsementsov@virtuozzo.com>
 <f9559937-f077-f8d5-4a5a-2c583c2131f5@redhat.com>
 <e8d99b0a-f46d-1d9d-11a3-5c04de1c3904@virtuozzo.com>
 <7bb75761-7043-25cc-f05a-b24bcecb7012@redhat.com>
 <f63b4410-2c3d-d078-26e5-e891bfbb61e5@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <f63b4410-2c3d-d078-26e5-e891bfbb61e5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.21 11:18, Vladimir Sementsov-Ogievskiy wrote:
> 26.10.2021 11:47, Hanna Reitz wrote:
>> On 26.10.21 09:53, Vladimir Sementsov-Ogievskiy wrote:
>>> 25.10.2021 19:40, Hanna Reitz wrote:
>>>> On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
>>>>> With new option qemu-img compare will not stop at first mismatch, but
>>>>> instead calculate statistics: how many clusters with different data,
>>>>> how many clusters with equal data, how many clusters were unallocated
>>>>> but become data and so on.
>>>>>
>>>>> We compare images chunk by chunk. Chunk size depends on what
>>>>> block_status returns for both images. It may return less than cluster
>>>>> (remember about qcow2 subclusters), it may return more than 
>>>>> cluster (if
>>>>> several consecutive clusters share same status). Finally images may
>>>>> have different cluster sizes. This all leads to ambiguity in how to
>>>>> finally compare the data.
>>>>>
>>>>> What we can say for sure is that, when we compare two qcow2 images 
>>>>> with
>>>>> same cluster size, we should compare clusters with data separately.
>>>>> Otherwise, if we for example compare 10 consecutive clusters of data
>>>>> where only one byte differs we'll report 10 different clusters.
>>>>> Expected result in this case is 1 different cluster and 9 equal ones.
>>>>>
>>>>> So, to serve this case and just to have some defined rule let's do 
>>>>> the
>>>>> following:
>>>>>
>>>>> 1. Select some block-size for compare procedure. In this commit it 
>>>>> must
>>>>>     be specified by user, next commit will add some automatic 
>>>>> logic and
>>>>>     make --block-size optional.
>>>>>
>>>>> 2. Go chunk-by-chunk using block_status as we do now with only one
>>>>>     differency:
>>>>>     If block_status() returns DATA region that intersects block-size
>>>>>     aligned boundary, crop this region at this boundary.
>>>>>
>>>>> This way it's still possible to compare less than cluster and report
>>>>> subcluster-level accuracy, but we newer compare more than one cluster
>>>>> of data.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy 
>>>>> <vsementsov@virtuozzo.com>
>>>>> ---
>>>>>   docs/tools/qemu-img.rst |  18 +++-
>>>>>   qemu-img.c              | 206 
>>>>> +++++++++++++++++++++++++++++++++++++---
>>>>>   qemu-img-cmds.hx        |   4 +-
>>>>>   3 files changed, 212 insertions(+), 16 deletions(-)
>>>>
>>>> Looks good to me overall!  Just some technical comments below.
>>>>
>>>>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>>>>> index d58980aef8..21164253d4 100644
>>>>> --- a/docs/tools/qemu-img.rst
>>>>> +++ b/docs/tools/qemu-img.rst
>>>>> @@ -159,6 +159,18 @@ Parameters to compare subcommand:
>>>>>     Strict mode - fail on different image size or sector allocation
>>>>> +.. option:: --stat
>>>>> +
>>>>> +  Instead of exit on first mismatch compare the whole images and 
>>>>> print
>>>>> +  statistics on amount of different pairs of clusters, based on 
>>>>> their
>>>>> +  block-status and are they equal or not.
>>>>
>>>> I’d phrase this as:
>>>>
>>>> Instead of exiting on the first mismatch, compare the whole images 
>>>> and print statistics on how much they differ in terms of block 
>>>> status (i.e. are blocks allocated or not, do they contain data, are 
>>>> they marked as containing only zeroes) and block content (a block 
>>>> of data that contains only zero still has the same content as a 
>>>> marked-zero block).
>>>
>>> For me the rest starting from "and block content" sounds unclear, 
>>> seems doesn't add any information to previous (i.e. are blocks 
>>> allocated ...)
>>
>> By “block content” I meant what you said by “equal or not”, i.e. what 
>> is returned when reading from the block.
>>
>> Now that I think about it again, I believe we should go with your 
>> original “equal or not”, though, because that reflects what qemu-img 
>> --stat prints, like so perhaps:
>>
>> Instead of exiting on the first mismatch, compare the whole images 
>> and print statistics on the amount of different pairs of blocks, 
>> based on their block status and whether they are equal or not.
>
> OK
>
>>
>> I’d still like to add something like what I had in parentheses, 
>> though, because as a user, I’d find the “block status” and “equal or 
>> not” terms to be a bit handwave-y.  I don’t think “block status” is a 
>> common term in our documentation, so I wanted to add some examples; 
>> and I wanted to show by example that “equal” blocks don’t need to 
>> have the same block status.
>
> Actually, I think, that the resulting tool is anyway 
> developer-oriented, to use it you should know what this block status 
> really means.. May be just s/block status/block type/, will it be more 
> human friendly?

Oh, OK.  I think I’d prefer “block status” still, because that’s what we 
use in the code.

Hanna


