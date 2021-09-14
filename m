Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391740A8C4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:03:41 +0200 (CEST)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3Po-0003KV-60
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ3OU-0002Vo-30
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ3OO-0006qV-TS
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631606532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66HWOncCLsmDb0AFDv6hVzkyafr5kjCBZ8UVqG+GL1s=;
 b=JBaGx2FvxkyI7r2VCyc18/vpSzMCQVmpq/j7XemZGWFoBaatb6n7LpXUB8hwqjVXldPRDD
 GQ/e7m0b5wG4G9pHyqIBULm0AwTp4YhSEHcLAhfxuvIaXZHmZRpGPX3yhKnMpCmMYoh32r
 2KiIyZEyw4ejZwXuoHGIkGxQ2o8xt4M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-NmHjsQ35OxuJJMKg2vz9XQ-1; Tue, 14 Sep 2021 04:02:10 -0400
X-MC-Unique: NmHjsQ35OxuJJMKg2vz9XQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so2299732wrp.16
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 01:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=66HWOncCLsmDb0AFDv6hVzkyafr5kjCBZ8UVqG+GL1s=;
 b=aRv90cMp8GVncYPvWs9lYPNnrXnW5Rq5anZLGetSEfCbsMqOx1RGg3EZouaNfaaNyu
 kH30UYdreBhlSy9AgdO8dimg7/yo7LOJF3lC8JhilA4+0Tt80Cc7QlcbMFbPM/nI5lU1
 zCiFgAwBA1LPouI4/RNIptD+elVyt2sfVu/8mRGWVF36E1rOISvlD2oE84NTBpBuz+D0
 4oQaqjJxRuCxHrreISejEhm8XOM/sx8pVQ0fqfCEUXWl67/fTz3mBRcXanneIB82Qtg3
 gZ6aerVXMZB2IXGdOisKwFpND15J/h7b0mmP2s03PwPBS2u2MfvzPk3P+QKoXnrh04Of
 /iQA==
X-Gm-Message-State: AOAM532Xpw9wA/JrdILMUdbu2zYASkxVq8O8PkUj1SzJ3ia+lYP01Tch
 NxrUu7wPfGeS2Fh6v3mWSmfRUJi6RS8JqSvvB1hx5km2Gf03tcLjMuYFblBIMj8bDop+bJhpqK3
 TNoUG/5W4BruF6VM=
X-Received: by 2002:a05:600c:2f08:: with SMTP id
 r8mr687492wmn.86.1631606529047; 
 Tue, 14 Sep 2021 01:02:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBU8CdneWv4CUdmfxqpVHyESwdGY4QTx/NuCQ23phDWI7Sh/bXd5+jDVI9RpiqYfATStM1Jg==
X-Received: by 2002:a05:600c:2f08:: with SMTP id
 r8mr687461wmn.86.1631606528815; 
 Tue, 14 Sep 2021 01:02:08 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id o24sm350468wmm.11.2021.09.14.01.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 01:02:08 -0700 (PDT)
Subject: Re: [PATCH v2 04/17] iotests.py: rewrite default luks support in
 qemu_img
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-5-vsementsov@virtuozzo.com>
 <a93ab286-5785-f05f-2059-4cac783d6cf0@redhat.com>
 <594fa5ec-886b-3216-f002-37c2b1cd09ed@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <22a4d64b-31fa-796d-e573-bd78110c7e00@redhat.com>
Date: Tue, 14 Sep 2021 10:02:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <594fa5ec-886b-3216-f002-37c2b1cd09ed@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 09:44, Vladimir Sementsov-Ogievskiy wrote:
> 13.09.2021 14:16, Hanna Reitz wrote:
>> On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
>>> Move the logic to more generic qemu_img_pipe_and_status(). Also behave
>>> better when we have several -o options. And reuse argument parser of
>>> course.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/iotests.py | 36 
>>> +++++++++++++++++------------------
>>>   1 file changed, 17 insertions(+), 19 deletions(-)
>>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>>
>>> diff --git a/tests/qemu-iotests/iotests.py 
>>> b/tests/qemu-iotests/iotests.py
>>> index def6ae2475..484f616270 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -128,9 +128,13 @@ def qemu_img_create_prepare_args(args: 
>>> List[str]) -> List[str]:
>>>       args = args[1:]
>>>       p = argparse.ArgumentParser(allow_abbrev=False)
>>> +    # -o option may be specified several times
>>> +    p.add_argument('-o', action='append', default=[])
>>>       p.add_argument('-f')
>>>       parsed, remaining = p.parse_known_args(args)
>>> +    opts_list = parsed.o
>>> +
>>>       result = ['create']
>>>       if parsed.f is not None:
>>>           result += ['-f', parsed.f]
>>> @@ -139,8 +143,18 @@ def qemu_img_create_prepare_args(args: 
>>> List[str]) -> List[str]:
>>>       # like extended_l2 or compression_type for qcow2. Test may 
>>> want to create
>>>       # additional images in other formats that doesn't support 
>>> these options.
>>>       # So, use IMGOPTS only for images created in imgfmt format.
>>> -    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
>>> -        result += ['-o', os.environ['IMGOPTS']]
>>> +    imgopts = os.environ.get('IMGOPTS')
>>> +    if imgopts and parsed.f == imgfmt:
>>> +        opts_list.insert(0, imgopts)
>>
>> Hm.  Yes, IMGOPTS should come first, so it has lower priority. That 
>> means that patch 2 should have inserted IMGOPTS at the beginning of 
>> the parameter list, though, right?
>
> Now looking at it closer: no, patch 2 is OK.
>
> It only put into result:
>
> 1. 'create'
> 2. -f <fmt>
> 3. -o <IMGOPTS>
> 4. remaining
>
> and that's correct

Ah, right!

Hanna


