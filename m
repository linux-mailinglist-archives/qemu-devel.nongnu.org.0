Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EB54E1C2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:21:07 +0200 (CEST)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pQn-0006oM-VL
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1p0k-00017S-Si
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:54:10 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1p0j-0000Hj-9k
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:54:10 -0400
Received: by mail-lj1-x231.google.com with SMTP id d19so1376319lji.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qkjgIynhQ28yphOElfZ02Z/SQbehn7ES0tE88QyUI0w=;
 b=p1DTe3KXEmPMIVS2SMKboo8Wn+xggXkff0DHMTAYlIwGeATwIYrJopqXmpxx5bhI5j
 IoNFf5l8FsdiUkbrokmnOvq5Pl64RzfzH0sQCoLqRydgH1VwsdOISVWYjTLlqFC8LkjA
 4Z1AOsONNusNw1l6wna7wXi5qECUdrwxGeyZ/WDqkHDwqt86FHrP6EsW6WJoGXw7m0z0
 tyqlBdD0GEvcW09Dy6MyZQmA6BOUb3cVWkMTzR0Jso4pYRcYGbfLs0Sl1sV5pPjXSisj
 YNBf/ROPiR2hIT7Hm2Wj22pCqlgLfinXt0GZp4RaF8meoOowXmJAjpPXUo37Bi+sZ3Xq
 WNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qkjgIynhQ28yphOElfZ02Z/SQbehn7ES0tE88QyUI0w=;
 b=tCBUXsI3Lw4af8Qlh/sueDRLl+V1qvYM36bsDXydy/RWkfpqJehEphEWYP+0cUENmj
 7OQV+cAF8Ykrfy9jRSfE3jYIr/wYyS5p+P8j1uUsdGnG3BcZckupWR7uq9mDwXNh10r9
 to1kA2cLqKKsHtd6LYv2cPQBulGYGEd+4TYFd+YicjRPsJfDake3T2DOQ7hI0HWjRxCf
 WTrrJBzw6fDJLedjmViQvTCEqOi+LG1PH4UTNffL9rdt935xGu1tNUWVWTdaHDfyRq3U
 qds6sHNTFS1sa/Sw5hfIOJQYrAx7yHCHAvkJP9KrQprKK6Fb8ijgQPp3rv/CeeGVyUeh
 bXxA==
X-Gm-Message-State: AJIora+rQ5py2BNb0SnjIH+3B8SHpm0VJ/y/Ofg6WD3vpJ5enUdVF/0L
 1Crq6XttO9dnZbqmXS6AwArQUQ==
X-Google-Smtp-Source: AGRyM1snsCkviw5OTbVjE7Sk2aXtMavvbh/rVzCpMUVyQdKzNhH6MrPVQW+DNyQEp4hCZ60W2nXvIw==
X-Received: by 2002:a2e:bf19:0:b0:259:1889:53dc with SMTP id
 c25-20020a2ebf19000000b00259188953dcmr2447496ljr.497.1655384047140; 
 Thu, 16 Jun 2022 05:54:07 -0700 (PDT)
Received: from [192.168.0.101] ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 p20-20020ac24ed4000000b0047976e7388bsm230975lfr.81.2022.06.16.05.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 05:54:06 -0700 (PDT)
Subject: Re: [PATCH v3 11/17] migration/qemu-file: Fix qemu_ftell() for
 non-writable file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, 
 quintela@redhat.com, dgilbert@redhat.com
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
 <20220616102811.219007-12-nikita.lapshin@openvz.org>
 <YqsR+IlrxpU3CrC4@redhat.com>
From: Nikita <nikita.lapshin@openvz.org>
Message-ID: <cccf5f06-2954-4854-8057-cf4344c8a7e6@openvz.org>
Date: Thu, 16 Jun 2022 15:54:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YqsR+IlrxpU3CrC4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/16/22 2:20 PM, Daniel P. Berrangé wrote:
> On Thu, Jun 16, 2022 at 01:28:05PM +0300, nikita.lapshin@openvz.org wrote:
>> From: Nikita Lapshin <nikita.lapshin@openvz.org>
>>
>> qemu_ftell() will return wrong value for non-writable QEMUFile.
>> This happens due to call qemu_fflush() inside qemu_ftell(), this
>> function won't flush if file is readable.
> Well the return value isn't necessarily wrong today - it really
> depends what semantics each callers desires.
>
> Can you say what particular caller needs these semantics changed
> and the impact on them from current behaviour ?

Sorry, it's my bad. It was used in previous version. But after 
refactoring I threw this function out of implementation.

So it is in fact not used now.

>
>> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
>> ---
>>   migration/qemu-file.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index 1479cddad9..53ccef80ac 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -663,7 +663,8 @@ int64_t qemu_ftell_fast(QEMUFile *f)
>>   int64_t qemu_ftell(QEMUFile *f)
>>   {
>>       qemu_fflush(f);
>> -    return f->pos;
>> +    /* Consider that qemu_fflush() won't work if file is non-writable */
>> +    return f->pos + f->buf_index;
>>   }
> IIUC, this is more or less trying to make 'qemu_ftell' be
> equivalent to 'qemu_ftell_fast' semantics in the non-writable
> case. But that makes me wonder if whichever calls has problems,
> shouldn't be just changed to use  qemu_ftell_fast instead ?

qemu_ftell_fast() counts iovec length. When we try to read from QEMUFile 
using for exmaple qemu_peek_buffer f->buf will be filled with data so we 
need to consider buf_index.

>
> With regards,
> Daniel
Thank you for your review!

