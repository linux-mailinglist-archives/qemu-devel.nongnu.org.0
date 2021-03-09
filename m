Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D13325E4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:57:29 +0100 (CET)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbvU-0006wV-DE
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJb7x-0005r0-JA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:06:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJb7u-0003g9-QJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615291573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HvJvBv0sppg/5+TZ4duzOnfOzJ7dz5zjhNiVzKSths=;
 b=fJtsly4wXJnZEGoiX6MzOFlhjxQeiQr9jCOj2ktHzybusyaueExAFg9ikxt0+bN57XCqgn
 hozQDhA56cfHv/jw9xgZhOO/UMTOovJw8F5ZzZvV/o4UrYPz4JVzOLczcmvUK0tBjohOqj
 5vS0OmxboIPcMYv6dMzycdk4j+b1LBQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-9RpbBhiaMXWKMG6a3PYwpQ-1; Tue, 09 Mar 2021 07:06:10 -0500
X-MC-Unique: 9RpbBhiaMXWKMG6a3PYwpQ-1
Received: by mail-wm1-f70.google.com with SMTP id n25so1052746wmk.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2HvJvBv0sppg/5+TZ4duzOnfOzJ7dz5zjhNiVzKSths=;
 b=JQHZ/OWDoMyQzwTcevbzYK/j+nRjm7A7EeZFJ4NFwkokXImrOB9fwKK7OvFo53D5D2
 AfCWIcqFoFajP1d7S72juv7fljWGOHLfvgZHwmZ310bt7bYeSE38r+Ggtv/NWiULQvh+
 VTguO6b1Dyvuz8K78NGruchHtNok8gRakHxBmT4gFFWPwuCbMu2OFp8rtBlW5TnRfCy2
 M8fQohvrAakp6ClMcQPLn4DwgnGqK2rsgaO6Rd/tTvYUAWbpnAn6PD8GZ4Qp+sWvsEUo
 PxrHU00ltC9kbhxDP0/ize0BJ8WqB2AGGRUbeyTx6sLJPsA/z3BXgIm97t+Vwatll8al
 2Y0Q==
X-Gm-Message-State: AOAM530W3tyknoXYln06J9fGzb8cvXZU7KY/1ibEJNikfuNbuOgigk6q
 wB5yOmCHNMHp9nhcyzKEsUhjyiKQO9TIcx3y6r3YtsMPTgMkbqqvIXhRjGumjtzzS8m2t8BUPfs
 1kjGsZNK2Eoi67qg=
X-Received: by 2002:adf:e411:: with SMTP id g17mr27693693wrm.225.1615291569629; 
 Tue, 09 Mar 2021 04:06:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJ0ys341xF/VVhT8nnY3R2VI7zRRaocz4JlS4/kfyV7+i+zRJ7IVOtdKJ9hE3ycORvnLXRZA==
X-Received: by 2002:adf:e411:: with SMTP id g17mr27693652wrm.225.1615291569285; 
 Tue, 09 Mar 2021 04:06:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s23sm3688604wmc.35.2021.03.09.04.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 04:06:08 -0800 (PST)
Subject: Re: [RFC PATCH 1/4] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-2-david.edmondson@oracle.com>
 <34865f4c-dc32-4298-6ec9-c8690d738435@redhat.com> <m2mtvch72g.fsf@dme.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e71f897d-29a5-5efd-70f5-6ab7a7318b13@redhat.com>
Date: Tue, 9 Mar 2021 13:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <m2mtvch72g.fsf@dme.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 12:58 PM, David Edmondson wrote:
> On Tuesday, 2021-03-09 at 12:09:55 +01, Philippe Mathieu-Daudé wrote:
> 
>> On 3/9/21 11:21 AM, David Edmondson wrote:
>>> If a new bitmap entry is allocated, requiring the entire block to be
>>> written, avoiding leaking the buffer allocated for the block should
>>> the write fail.
>>>
>>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Thanks.
> 
>>> ---
>>>  block/vdi.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/block/vdi.c b/block/vdi.c
>>> index 5627e7d764..2a6dc26124 100644
>>> --- a/block/vdi.c
>>> +++ b/block/vdi.c
>>> @@ -690,6 +690,7 @@ nonallocating_write:
>>>  
>>>      logout("finished data write\n");
>>>      if (ret < 0) {
>>> +        g_free(block);
>>>          return ret;
>>>      }
>>
>> Alternative using g_autofree:
> 
> Newfangled witchy magic!
> 
> I'm happy to change it if you think it beneficial.

I then saw the next patch which keeps modifying the same
function, so this might not be a great improvement after
all.


