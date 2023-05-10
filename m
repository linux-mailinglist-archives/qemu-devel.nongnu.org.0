Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD36FD889
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweZB-0002fG-Qm; Wed, 10 May 2023 03:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pweZ9-0002et-RA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pweZ8-0000l1-DJ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683704929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bW/BoR9gQ19CwIgdkHe7U0rjOEwNRE17cFz+sZiybII=;
 b=iKcBf7Hq4JYzWDrCxkUlbK5tI6puQYPGgePsg1IodoBJjMk3LsGJuXupVfneWQcJw2BwNW
 ALi3+S3pFqWRaEqZRW8CIqnNzdktUqss8h9AeC2+x3ZKLmO0vc4F4jsBVw6M4e5FsjJfaV
 4QTvr7ZAQ6I0kAgWV7VNUBVGEJw+TSg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-RMW29bHpOjKYWnXDcskc0A-1; Wed, 10 May 2023 03:48:48 -0400
X-MC-Unique: RMW29bHpOjKYWnXDcskc0A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a355c9028so784603366b.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704926; x=1686296926;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bW/BoR9gQ19CwIgdkHe7U0rjOEwNRE17cFz+sZiybII=;
 b=eem7jpmErmaCP9vOgAwTmUik3GS1+QeC3WTseYcGN3uBnWIg5BNa9LoE+BzhDbeBcs
 jspR0THl4RPyy59SyN0hD+JnEEOYCSdqGozPEhBjbGC2EDktxC7yfcAdxm5h0dADBXCc
 RPe5ZRHV9CGPiggAn/XUIkQcl8kId8ItnM19SSm5Z57/xTlFZbAdgQBNMBG5hYe2pomZ
 lrCQNWEpX+cIK2MpQGll00TTcMS5rfmdma/cj44Z1gKVzZ0CwVL8TnGc7c9+cFRVmTKP
 Bef3TmWsETcUy+Pqtl4fB3GqFkSmzPBryQEuPM9WQdN8T3HnKAvXhtCCUw+HgmxlxeNB
 ILTg==
X-Gm-Message-State: AC+VfDx0Laz30MIDPb5AlGxRTM9XrFugArm6aaK6HtM0uRwzUqHNmORK
 bjjwsfNhfOcCb/ibzuq1lluR0ZHowu/ZF9NnqPqZT2Bzot0p8ZvJBf1FMg2MkvZCH2E8cAP8KaU
 vw+uC7auS+h1a1g8AlZ1KZI0=
X-Received: by 2002:a17:907:3fa6:b0:966:6035:c81e with SMTP id
 hr38-20020a1709073fa600b009666035c81emr10612202ejc.52.1683704926585; 
 Wed, 10 May 2023 00:48:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46okhIViTM6jC6+h45249wYD7d+qaQxTcTsUtY44SLtw04RUdVv9er3XbDCVZXtS/312gmUw==
X-Received: by 2002:a17:907:3fa6:b0:966:6035:c81e with SMTP id
 hr38-20020a1709073fa600b009666035c81emr10612190ejc.52.1683704926349; 
 Wed, 10 May 2023 00:48:46 -0700 (PDT)
Received: from ?IPV6:2003:cf:d706:2e02:6e14:9279:969b:d328?
 (p200300cfd7062e026e149279969bd328.dip0.t-ipconnect.de.
 [2003:cf:d706:2e02:6e14:9279:969b:d328])
 by smtp.gmail.com with ESMTPSA id
 ia21-20020a170907a07500b00966392de4easm2363165ejc.14.2023.05.10.00.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:48:45 -0700 (PDT)
Message-ID: <eac22820-2cfa-8de9-9ea5-3630e02207c9@redhat.com>
Date: Wed, 10 May 2023 09:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/11] cutils: Improve qemu_strtosz handling of fractions
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-12-eblake@redhat.com>
 <40919a58-2bb2-f156-ddc0-49c117a8f031@redhat.com>
 <bmvo2jg7jb2jmr3ezvqa3ymvuldon54cy3gv5mugplwd542rnk@lhr7d5ulqc5d>
 <b53326eb-3b85-f017-ce00-85e522d89835@redhat.com>
In-Reply-To: <b53326eb-3b85-f017-ce00-85e522d89835@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10.05.23 09:46, Hanna Czenczek wrote:
> On 09.05.23 23:28, Eric Blake wrote:

[...]

>> But I think the solution to that is not to treat underflow as valf =
>> 0, but rather to alter this snippet:
>>
>> -            valf = (uint64_t)(fraction * 0x1p64);
>> +            /*
>> +             * If fraction was non-zero, add slop small enough that 
>> it doesn't
>> +             * impact rounding, but does let us reject 
>> "1..00000000000000000001B".
>> +             */
>> +            valf = (uint64_t)(fraction * 0x1p64) | !fraction;
>>
>> so that between the ERANGE branch and this slop, valf is guaranteed
>> non-zero if fraction contained any non-zero digits.
>
> I’d make it a logical || instead of |, but that sounds good, yes.

Sent too soon – exactly when sending I realized that I’m very wrong.  
Still, I wouldn’t just | the 1 on, and rather make take the LoC to make it

valf = (uint64_t)(fraction * 0x1p64);
if (!valf && fraction) {
     /*
      * If fraction was non-zero, add slop small enough that it doesn't
      * impact rounding, but does let us reject "1..00000000000000000001B".
      */
     valf = 1;
}


