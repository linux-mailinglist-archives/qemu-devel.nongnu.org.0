Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33338395DAC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 15:48:34 +0200 (CEST)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lniHQ-0005ru-Ox
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 09:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lniEl-0004ca-3e
 for qemu-devel@nongnu.org; Mon, 31 May 2021 09:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lniEg-0008Ql-9t
 for qemu-devel@nongnu.org; Mon, 31 May 2021 09:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622468739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gK6n3st3wHEDRVD26U1jOn1Tihl70XpZvkWMnma8ic=;
 b=NQtkn1enw5N8msjnU6NnebQBtFQ0hIeKqER9Xjv/olmX0KaX9E4L5YbqWAaAwvRztE2KyG
 gFFW4boR7moOL+LKZZjLRZo9t43pPYxEeutU0DgX3O9hApsE7kqzpCM/R7+nJV3Qj7xdFT
 OoJLB5Z8wQJhmAHjnyYnQDwB69WvVAs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-suvPciGEN_6SdqeOmLqOIQ-1; Mon, 31 May 2021 09:45:35 -0400
X-MC-Unique: suvPciGEN_6SdqeOmLqOIQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 b10-20020a170906194ab02903ea7d084cd3so1452935eje.1
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 06:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1gK6n3st3wHEDRVD26U1jOn1Tihl70XpZvkWMnma8ic=;
 b=SHXBHpfrzdop5v+3CDOUemy3o1zV7XA6Enb/C5LK7S47qhSxuYZW/lnsDXAgv5z/mN
 4PkMwlWrqMZpqmE4hY5jS38LSAVCIw6f3HG69QLERecLQ3iTqvyB5jVgGi9wVSAtSH/p
 5B5B7F0iwPvQUVCGGrtrYiy3prIqClvZNyL0mms7AG18cvp+W1sHlbLx5cvLDpeMucKf
 otqUg9xQLZRZJ5j/mLDwL9jTWlns2TQ2rUG6Aaqy8SkRRJvKwk/JbMrUqHHnoFOzzZ97
 z6m1OoCnqF5ct+oCRMXXJzroeR9mQoXMCoYrVLTocFltmEZxQ8Okn/Q6Tgb3zRTuDsL1
 XosA==
X-Gm-Message-State: AOAM532Q3pwjgU4Erf392nnP1cPHMFRyOcpVk3BqKYv+dLvnIUZxrP+M
 Jn+aQVEjsUIm6jSVoCkwjxTxpIQQiedUemSOVrdBzVxkv/Yc2mkynMxyGYjFul7w7dNda5+tgpB
 xFZq/BVdwzvPAyrc=
X-Received: by 2002:aa7:d413:: with SMTP id z19mr25818249edq.37.1622468734235; 
 Mon, 31 May 2021 06:45:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ObCe65Y+uIzdPL/wXV9OO4KElPXg6xEZZk6x/8IhAlg9p9z6ZfHf8ImFU4xjHQgFFqVEpw==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr25818220edq.37.1622468734003; 
 Mon, 31 May 2021 06:45:34 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h2sm6284042edq.61.2021.05.31.06.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 06:45:33 -0700 (PDT)
Subject: Re: [RFC PATCH] block/vpc: Support probing of fixed-size VHD images
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20210329072559.2668780-1-thuth@redhat.com>
 <a14b4678-f447-4949-14e1-0d4be9e37e7c@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c56e08a5-9baf-0bbd-2db6-d24d10d47a6b@redhat.com>
Date: Mon, 31 May 2021 15:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a14b4678-f447-4949-14e1-0d4be9e37e7c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.05.21 12:19, Thomas Huth wrote:
> On 29/03/2021 09.25, Thomas Huth wrote:
>> Fixed-size VHD images don't have a header, only a footer. To be able
>> to still detect them right, support probing via the file name, too.
>>
>> Without this change, images get detected as raw:
>>
>> $ qemu-img create -f vpc -o subformat=fixed test.vhd 2G
>> Formatting 'test.vhd', fmt=vpc size=2147483648 subformat=fixed
>> $ qemu-img info test.vhd
>> image: test.vhd
>> file format: raw
>> virtual size: 2 GiB (2147992064 bytes)
>> disk size: 8 KiB
>>
>> With this change:
>>
>> $ qemu-img info test.vhd
>> image: test.vhd
>> file format: vpc
>> virtual size: 2 GiB (2147991552 bytes)
>> disk size: 8 KiB
>>
>> Resolves: https://bugs.launchpad.net/qemu/+bug/1819182
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   I've marked the subject with RFC since I'm not quite sure whether this
>>   is really a good idea... please let me know what you think about it...
>>
>>   block/vpc.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/vpc.c b/block/vpc.c
>> index 17a705b482..be561e4b39 100644
>> --- a/block/vpc.c
>> +++ b/block/vpc.c
>> @@ -191,8 +191,18 @@ static uint32_t vpc_checksum(void *p, size_t size)
>>     static int vpc_probe(const uint8_t *buf, int buf_size, const char 
>> *filename)
>>   {
>> -    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8))
>> +    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8)) {
>>           return 100;
>> +    }
>> +
>> +    /* It could be a fixed-size image without header -> check 
>> extension, too */
>> +    if (filename) {
>> +        int len = strlen(filename);
>> +        if (len > 4 && !strcasecmp(&filename[len - 4], ".vhd")) {
>> +            return 10;
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>
> Ping!
>
> Anybody any comments on this one?
>
>  Thomas

Sorry I’m replying so late, but honestly, it’s because I’m just a bit 
afraid to respond.  So, perhaps like others, I hoped someone else with a 
stronger opinion would do it in my stead.

I understand this addresses a real problem, but OTOH probing by the file 
extension intuitively seems like a bad solution to me. What’s the 
problem with simply requiring the user to spcify the format in such a case?

I mean, I can’t think of a concrete problem with probing by the filename 
extension.  The worst that can happen is that a raw image is called 
.vhd, we try to open it, and the vhd driver then says the image doesn’t 
work.  That could be a real problem, but, well, it would be kind of 
deserved.  (Unless the user really in good faith just thought .vhd would 
be a nice extension for their raw virtual HDD image.  Which, then again, 
I couldn’t blame them for.)

Perhaps we could print a message if the extension matches that advises 
the user to explicitly specify the format for such images?

Max


