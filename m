Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE765307D8A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:13:48 +0100 (CET)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Bng-0000Zc-2F
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5Bi7-00045H-TE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5Bi4-0000wR-PA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611857278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+tCL+5M4PYZ3D/V8vunervBHMtf0QvlHaKEoWVr2eQ=;
 b=ZNRSXGfhdoo2sMLQyUzIx59Vp6qw7Rq1lFmOOzbeEc95V2OtfOPFRbkFeq1LufY61wvPrF
 1E9Yvq8m8uex6U3QB9OlQR63qwLStufTex2sipsu2DyejYpvZMB9u4s65BcIuiiyl0WAwf
 2PNvM6mrZERwOjA4lbqBdMsfC1jdiZE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-z-qJdtsvMJiCsGJK3MiYwg-1; Thu, 28 Jan 2021 13:07:54 -0500
X-MC-Unique: z-qJdtsvMJiCsGJK3MiYwg-1
Received: by mail-wm1-f69.google.com with SMTP id x12so2503775wmk.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 10:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h+tCL+5M4PYZ3D/V8vunervBHMtf0QvlHaKEoWVr2eQ=;
 b=raTteg0Za4tqNz9jqdP3bLPDQxmWt/ZNllnNW9es1tltDK2lMXsggMymoSXRxXMk31
 vq8VOzUMgJSnxKN2TznpvoEe79EkM12tzOH/OzaGCbGBavCi63ZkEPt24gte7ujI57m1
 iOxvIb6KwfSLUWJGssExCjKFpH5gC/WVzApjJZ3HffDpD7If9mXTtX0W2HZU5Kdta5t6
 QR67TdgHRaj4NnKbWWCdkEyIn+qrnibonZKtuvC1Nuui3tMXYiuP6tY8IHzthxH7NM4F
 inRK5eFDURySYowFJ2wMmclrOAbSrXtoOwSKgz/k1I3T1rtCqTB0MPuyfHGFR+NrGeGH
 Wqww==
X-Gm-Message-State: AOAM530VaPvtpB19L9ljaBwTgjAwzRhAn61cGQBbokIqOutvmojvGrbH
 AVEoZTRV3nEzKRlLCjMd7RETuCWABSDnSXwNyEFNBdr/OZXt/eDZ45e4QfWNO4IfLTZimPiT9L/
 SNv/L6wEQVRFoOHk=
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr434000wml.101.1611857273482; 
 Thu, 28 Jan 2021 10:07:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9fUNunK1wZI7xgBoF96ByRmYkapM36LGg8Fojq63f7dzyuEHZt6KrVy+RClO0E2Mk/zstzw==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr433990wml.101.1611857273366; 
 Thu, 28 Jan 2021 10:07:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v6sm7880773wrx.32.2021.01.28.10.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 10:07:52 -0800 (PST)
Subject: Re: [PATCH] migration/qemu-file: Fix maybe uninitialized on
 qemu_get_buffer_in_place()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20210128130625.569900-1-wainersm@redhat.com>
 <20210128171619.GF2951@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b8f47501-0272-af87-8bb2-9074cdc1b51b@redhat.com>
Date: Thu, 28 Jan 2021 19:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128171619.GF2951@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 6:16 PM, Dr. David Alan Gilbert wrote:
> * Wainer dos Santos Moschetta (wainersm@redhat.com) wrote:
>> Fixed error when compiling migration/qemu-file.c with -Werror=maybe-uninitialized
>> as shown here:
>>
>> ../migration/qemu-file.c: In function 'qemu_get_buffer_in_place':
>> ../migration/qemu-file.c:604:18: error: 'src' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>   604 |             *buf = src;
>>       |             ~~~~~^~~~~
>> cc1: all warnings being treated as errors
>>
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> 
> Yes, I think I had a discussion with someone about this recently but
> can't find it;

Maybe with Thomas, he reported that 2 years ago when building with -O3:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg599522.html

> the compiler is technically correct, but the only time
> it's unitialised is the case where it's result doesn't matter.
> 
> Still, to shut the compiler up:
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
>> ---
>> Passed on CI: https://gitlab.com/wainersm/qemu/-/pipelines/247801576
>>
>>  migration/qemu-file.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index be21518c57..d6e03dbc0e 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -595,7 +595,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
>>  {
>>      if (size < IO_BUF_SIZE) {
>>          size_t res;
>> -        uint8_t *src;
>> +        uint8_t *src = NULL;
>>  
>>          res = qemu_peek_buffer(f, &src, size, 0);
>>  
>> -- 
>> 2.28.0
>>


