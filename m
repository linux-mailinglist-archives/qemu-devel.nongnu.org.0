Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97B33B1A1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:44:24 +0100 (CET)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLle3-00043D-Mk
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlaa-00011K-8w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlaY-0002j1-Fi
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87GptV1muzBykYPvYKUs9Bigru+WwVrhV8VYvcrD8BM=;
 b=AZ8Xl4tOw9uVOkAg44zBNA+dTvrqDfGFsaj5u+PJb6Af4eLBXFpeur4vnDPwSm2UTVFWfS
 vh3Ifmrqn98Kwwnb+MRUvucIgXKFy29uEO4PV3XWYvVEVQLhK4SN4W6HXZgivS7jF/79a2
 Ub9Or+bbf/vEqbmp1WkDTsfR7bO9zt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-z2R0Yey8Pd2iI31TlwXafQ-1; Mon, 15 Mar 2021 07:40:44 -0400
X-MC-Unique: z2R0Yey8Pd2iI31TlwXafQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7BEE80006E;
 Mon, 15 Mar 2021 11:40:42 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71B61610F0;
 Mon, 15 Mar 2021 11:40:42 +0000 (UTC)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
 <0697b6d1-0a64-3d71-2f7f-3c52a005b77b@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <42eaf0ff-e1f9-e7da-2c8d-240fcadd787b@redhat.com>
Date: Mon, 15 Mar 2021 06:40:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0697b6d1-0a64-3d71-2f7f-3c52a005b77b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 4:10 AM, Philippe Mathieu-Daudé wrote:
> On 3/15/21 12:48 AM, Richard Henderson wrote:
>> Use fma to simulatneously scale and round up fraction.
> 
> "simultaneously"
> 
>> The libm function will always return a properly rounded double precision
>> value, which will eliminate any extra precision the x87 co-processor may
>> give us, which will keep the output predictable vs other hosts.
>>
>> Adding DBL_EPSILON while scaling should help with fractions like
>> 12.345, where the closest representable number is actually 12.3449*.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  util/cutils.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index d89a40a8c3..f7f8e48a68 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
>>      if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {
> 
> Shouldn't we use fma() here too? ^^^^^^^^^^^^^^^^^^^^^^^^^^

Unlikely to make a difference in practice, but yes, consistency argues
that we should perform the same computations.  In fact, it may be worth
factoring out the computation to be done once, instead of relying on the
compiler to determine if fma() can undergo common subexpression elimination.

> 
>>          retval = -ERANGE;
>>          goto out;
>>      }
>> -    *result = val * mul + (uint64_t) (fraction * mul);
>> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
>>      retval = 0;
>>  
>>  out:
>>
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


