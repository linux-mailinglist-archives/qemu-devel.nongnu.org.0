Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC54041C6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:29:41 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO70e-0000Hf-Ix
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6wf-0000uC-WF
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6wd-0005wA-Se
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lS3AAcIbBOOHIfVPa2kDjR1irshIK3d7KqeJawArnjA=;
 b=cm9v9KfZ1yxsvOrqTSEQrEJaU97InEQrXx0D/6I2QF4j1jykik603wzVtl7P5cuOo+CYYt
 OwdI/Kqq1s/qF1ExWLrDHv5sJcBdq1TZNLKSHQxF+57RVOKSNnXlY8Tsq6sekVp2TsPAiI
 FN6KvvWkHcyn8/ozROHjtsTZ3gBE+mg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-XcArl4cZOxSDYznaUPNH6w-1; Wed, 08 Sep 2021 19:25:30 -0400
X-MC-Unique: XcArl4cZOxSDYznaUPNH6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso14008wml.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lS3AAcIbBOOHIfVPa2kDjR1irshIK3d7KqeJawArnjA=;
 b=kEjNIH3PV0Ux2nzElr07eYkC63IF0eSm2ADqm8fn+MCNEp2/Aq7R8Cnwj13KqOE0sj
 oLXb/tHQgpfAevdC3808wnuyHjPeYLhMTyh07WbJqbsamK8Z7QpJEbJKWCFXwbgiRlhg
 iu64ngLCmjsBXdNOVTKJjSU9Gai/He9JJxrLlToNJ9PifksY7Xz1sKIBEP6PFPnC/gnw
 91dQRbBRmT6vus0DJPjSARum1KjfoDjR6SzOIHty5EirROl2o/fgZ6X+lZEUzkF7jmTB
 oS1YpujZKvEdxUiC4rLuffy/4MiIYT6pBGPUJVs4HerWdFpdWzmN/bF21yRobZcwq2IC
 DnFA==
X-Gm-Message-State: AOAM533LQXwFi91NwNUOdqhAo/lT+lsQSQFIiEA/CLONeKRnL3w53mGE
 mz1HHf2/0OMoY1NQkPKOX1ax77xywj47bkhSL7AnnaUs5kmtROhflN3cItOL35kha7MLdE5mMue
 lOvhN1V+undArUxTwS1JKQdCPRIJoKV9kTNZ4tcbnz5Z0JTNP0J3H4L17A6tlG1ZJ
X-Received: by 2002:adf:f88d:: with SMTP id u13mr95132wrp.297.1631143528583;
 Wed, 08 Sep 2021 16:25:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRWVbutppJLRM2n3okWXH71zYXUUUI4bbrnxZghUJWo2zBJhJ/Dk6pcpSKRroKBg8zuSS32w==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr95118wrp.297.1631143528276;
 Wed, 08 Sep 2021 16:25:28 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o14sm20786wrg.91.2021.09.08.16.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 16:25:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] elf2dmp: Check curl_easy_setopt() return value
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
References: <20210901143910.17112-1-peter.maydell@linaro.org>
 <20210901143910.17112-2-peter.maydell@linaro.org>
 <59844a83-9058-3935-0228-e159eef5277e@redhat.com>
 <20210909004313.1dadb24e@192.168.1.7>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a54835c4-73b7-31dc-0ff7-f363f6fb0a6a@redhat.com>
Date: Thu, 9 Sep 2021 01:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909004313.1dadb24e@192.168.1.7>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 11:43 PM, Viktor Prutyanov wrote:
> On Wed, 1 Sep 2021 17:25:09 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 9/1/21 4:39 PM, Peter Maydell wrote:
>>> Coverity points out that we aren't checking the return value
>>> from curl_easy_setopt().
>>>
>>> Fixes: Coverity CID 1458895
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  contrib/elf2dmp/download.c | 28 +++++++++++++++++-----------
>>>  1 file changed, 17 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/contrib/elf2dmp/download.c b/contrib/elf2dmp/download.c
>>> index d09e607431f..01e4a7fc0dc 100644
>>> --- a/contrib/elf2dmp/download.c
>>> +++ b/contrib/elf2dmp/download.c
>>> @@ -21,21 +21,19 @@ int download_url(const char *name, const char
>>> *url) 
>>>      file = fopen(name, "wb");
>>>      if (!file) {
>>> -        err = 1;
>>> -        goto out_curl;
>>> +        goto fail;
>>>      }
>>>  
>>> -    curl_easy_setopt(curl, CURLOPT_URL, url);
>>> -    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
>>> -    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
>>> -    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
>>> -    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
>>> +    if (curl_easy_setopt(curl, CURLOPT_URL, url) != CURLE_OK ||
>>> +        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) !=
>>> CURLE_OK ||
>>> +        curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) !=
>>> CURLE_OK ||
>>> +        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) !=
>>> CURLE_OK ||
>>> +        curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) != CURLE_OK)
>>> {
>>> +        goto fail;
>>> +    }
>>>  
>>>      if (curl_easy_perform(curl) != CURLE_OK) {
>>> -        err = 1;
>>> -        fclose(file);
>>> -        unlink(name);
>>> -        goto out_curl;
>>> +        goto fail;
>>>      }
>>>  
>>>      err = fclose(file);
>>> @@ -44,4 +42,12 @@ out_curl:
>>>      curl_easy_cleanup(curl);
>>>  
>>>      return err;
>>> +
>>> +fail:
>>> +    err = 1;
>>> +    if (file) {
>>> +        fclose(file);
>>> +        unlink(name);
>>> +    }
>>> +    goto out_curl;
>>>  }
>>>   
>>
>> Counter proposal without goto and less ifs:
>>
>> -- >8 --  
>> @@ -25,21 +25,19 @@ int download_url(const char *name, const char
>> *url) goto out_curl;
>>      }
>>
>> -    curl_easy_setopt(curl, CURLOPT_URL, url);
>> -    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
>> -    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
>> -    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
>> -    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
>> -
>> -    if (curl_easy_perform(curl) != CURLE_OK) {
>> -        err = 1;
>> -        fclose(file);
>> +    if (curl_easy_setopt(curl, CURLOPT_URL, url) != CURLE_OK
>> +            || curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) !=
>> CURLE_OK
>> +            || curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) !=
>> CURLE_OK
>> +            || curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) !=
>> CURLE_OK
>> +            || curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) !=
>> CURLE_OK
>> +            || curl_easy_perform(curl) != CURLE_OK) {
>>          unlink(name);
>> -        goto out_curl;
>> +        fclose(file);
>> +        err = 1;
>> +    } else {
>> +        err = fclose(file);
>>      }
>>
>> -    err = fclose(file);
>> -
>>  out_curl:
>>      curl_easy_cleanup(curl);
>>
>> ---
>>
> 
> Honestly, I would prefer this version over the original patch.
> In any way, I have tested both of them.

OK I will post this properly and let Peter pick whichever he
prefers. Do you mind to reply to the cover letter with a
"Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>"
tag?


