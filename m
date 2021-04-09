Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC835A407
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:52:20 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuMl-00048B-9a
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUuIX-0000jz-L7
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUuIT-0006Ub-JP
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617986871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UN4yG29vx+d71j+V5I7V0UXXCTbUDWVo226xR+hAvcI=;
 b=XMybXWVuRgrk4lSbSbZ6I1PoAL90r5BLVQxC6uRzL84fk1oc85M590cidNha6H34tSXxh5
 ZqcTdh4iG8rWrttsPEm3ztFHWOg23LZLGW4FijLfMKqWL5GU5QMqrNAsVVTCwivFykmPGP
 ijcdzBmlbwKc2ZN0P0PzSoyqZ05Rkgs=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-gQZQty5DPQaoo6xqaRm5FQ-1; Fri, 09 Apr 2021 12:47:50 -0400
X-MC-Unique: gQZQty5DPQaoo6xqaRm5FQ-1
Received: by mail-oo1-f70.google.com with SMTP id t23so2716957oou.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UN4yG29vx+d71j+V5I7V0UXXCTbUDWVo226xR+hAvcI=;
 b=pLnOx1hUp+EJ3/4fEsds6dNBht3HeVQgKiSdEx9OjxfhIeR4wBzYcqVU8mc51FSPa6
 jZoMOS7zl/h2al0on1Y+jlA6FiyM58lSjW8SBbpIJVfJ/uuV9Jj5RyMZ6OI1dcxnpbZU
 OCPxau0MEyfGMgq5DaFKW+zX6RJeTGvORqTRn25QNHpqLluzHam+Q8EslNW0JB3Sj7pW
 DQovLIZyBKKK+PY6FMWsyNXTZjYxl6doe89ZPkL41HeY7p6AqIESHR+0cvVzWRU7Us56
 yGfOsjtSqGQAW/iG1BQMy7VZbA9vYwJsJmVh9675IUKswylsurJPZRWh+bGTQxTGxXkg
 cZuA==
X-Gm-Message-State: AOAM5330rIMluYa3xDXLUUAsVIch2PVAsiQ47Hg0v8NfQ8fMVOir2Gu2
 SV7KNeGA/v3cv+MVB94n1QcyWGNlulDMZLJmfomX2UiUB30pslbRgEB+/ekAQKaXZrFOHw0I+f8
 KB8Su1uWtxRisEdY=
X-Received: by 2002:a05:6830:1694:: with SMTP id
 k20mr13023865otr.241.1617986869156; 
 Fri, 09 Apr 2021 09:47:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp+1RmFDv5H67g+FH+1hDKVrdRywwKFW740UD7oEI/aOmvdEo26YKQWTUEOw0EkQwPJSr3Yg==
X-Received: by 2002:a05:6830:1694:: with SMTP id
 k20mr13023852otr.241.1617986868904; 
 Fri, 09 Apr 2021 09:47:48 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 b12sm690199oti.17.2021.04.09.09.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:47:48 -0700 (PDT)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210301172837.20146-1-ckuehl@redhat.com>
 <4e64ef24-ba3d-809c-6320-57965c353247@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <6959b220-a722-6dd8-c444-b2434e7d72eb@redhat.com>
Date: Fri, 9 Apr 2021 11:47:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4e64ef24-ba3d-809c-6320-57965c353247@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: hhan@redhat.com, stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 6:15 PM, John Snow wrote:
> On 3/1/21 12:28 PM, Connor Kuehl wrote:
>> [..]
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index b615aa8419..5cc585dc27 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -866,6 +866,18 @@ Supported image file formats:
>>       issue ``lsattr filename`` to check if the NOCOW flag is set or not
>>       (Capital 'C' is NOCOW flag).
>> +  ``data_file``
>> +    Pathname that refers to a file that will store all guest data. If
>> +    this option is used, the qcow2 file will only contain the image's
>> +    metadata.
>> +
> 
> Might recommend "filename" simply for parity with *FILENAME* argument.
> 
> (This is the first appearance of "Pathname" in this file without spaces, 
> though "Path name" is indeed used several times.)
> 
>> +  ``data_file_raw``
>> +    If this option is set to ``on``, QEMU will always keep the external
>> +    data file consistent as a standalone read-only raw image. The 
>> default
>> +    value is ``off``.
>> +
>> +    This option can only be enabled if ``data_file`` is set.
>> +
> 
> How does this interact with caching options, if it does? What happens in 
> the negative case -- how does the file become inconsistent?

Hi,

First, just wanted to share the same note I'm sending to Max's review:

> Hey, I just wanted to leave a note indicating that I'm not ignoring this review; I've incorporated it in my next version but I am waiting until after the freeze to send it.

Second: I've been trying to figure out if and how this affects caching. 
I do not know yet. I will keep digging. My next version of the patch 
does touch on the negative case though, describing how it becomes 
inconsistent.

Thank you!

Connor


