Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690A4EBDC9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:40:58 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUoy-0000Uu-At
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:40:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZUdn-0003On-BO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZUdl-0002sy-KL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648632560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n81HjiyTi+o8XoDL4nL1M7U8xUHupnF/+i6InBtvXD4=;
 b=CNdb5pTwSoseg7ducpaTVKKS7rMUwmsjAOdQFPqQWDjEYO3pcnKnUBRgSLw8EzoDKl9gpK
 9nXcSf5EBWE0blXLR/sJmn9zHrnjye7jj2otrMnLXJdCKYytDRVOgd2TauiwuytL2h4Q1L
 +d+IB+dN3v4dv1keW2imuxr5MlihHEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-Vi8Ysz3OP1K0Owlkm2gQsQ-1; Wed, 30 Mar 2022 05:29:19 -0400
X-MC-Unique: Vi8Ysz3OP1K0Owlkm2gQsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02A6D8F11C9;
 Wed, 30 Mar 2022 09:29:19 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 379EF400E11D;
 Wed, 30 Mar 2022 09:29:18 +0000 (UTC)
Message-ID: <36106411-4cf1-5eaf-b63f-c331380e087b@redhat.com>
Date: Wed, 30 Mar 2022 11:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] target/s390x: Fix determination of overflow condition
 code after addition
To: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-2-thuth@redhat.com>
 <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2022 10.52, David Hildenbrand wrote:
> On 23.03.22 17:26, Thomas Huth wrote:
>> This program currently prints different results when run with TCG instead
>> of running on real s390x hardware:
>>
>>   #include <stdio.h>
>>
>>   int overflow_32 (int x, int y)
>>   {
>>     int sum;
>>     return ! __builtin_add_overflow (x, y, &sum);
>>   }
>>
>>   int overflow_64 (long long x, long long y)
>>   {
>>     long sum;
>>     return ! __builtin_add_overflow (x, y, &sum);
>>   }
>>
>>   int a1 = -2147483648;
>>   int b1 = -2147483648;
>>   long long a2 = -9223372036854775808L;
>>   long long b2 = -9223372036854775808L;
>>
>>   int main ()
>>   {
>>     {
>>       int a = a1;
>>       int b = b1;
>>       printf ("a = 0x%x, b = 0x%x\n", a, b);
>>       printf ("no_overflow = %d\n", overflow_32 (a, b));
>>     }
>>     {
>>       long long a = a2;
>>       long long b = b2;
>>       printf ("a = 0x%llx, b = 0x%llx\n", a, b);
>>       printf ("no_overflow = %d\n", overflow_64 (a, b));
>>     }
>>   }
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/616
>> Suggested-by: Bruno Haible <bruno@clisp.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   target/s390x/tcg/cc_helper.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
>> index 8d04097f78..e11cdb745d 100644
>> --- a/target/s390x/tcg/cc_helper.c
>> +++ b/target/s390x/tcg/cc_helper.c
>> @@ -136,7 +136,7 @@ static uint32_t cc_calc_subu(uint64_t borrow_out, uint64_t result)
>>   
>>   static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>>   {
>> -    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
>> +    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {
> 
> 
> Intuitively, I'd have checked for any overflow/underflow by comparing
> with one of the input variables:
> 
> a) Both numbers are positive
> 
> Adding to positive numbers has to result in something that's bigger than
> the input parameters.
> 
> "a1 > 0 && a2 > 0 && ar < a1"

I think it doesn't really matter whether we compare ar with a1 or 0 here. If 
an overflow happens, what's the biggest number that we can get? AFAICT it's 
with a1 = 0x7fffffffffffffff and a2 = 0x7fffffffffffffff. You then get:

  0x7fffffffffffffff + 0x7fffffffffffffff = 0xFFFFFFFFFFFFFFFE

and that's still < 0 if treated as a signed value. I don't see a way where 
ar could be in the range between 0 and a1.

(OTOH, checking for ar < a1 instead of ar < 0 wouldn't hurt either, I guess).

> b) Both numbers are negative
> 
> Adding to negative numbers has to result in something that's smaller
> than the input parameters.
> 
> "a1 < 0 && a2 < 0 && ar > a1"

What about if the uppermost bit gets lost in 64-bit mode:

  0x8000000000000000 + 0x8000000000000000 = 0x0000000000000000

ar > a1 does not work here anymore, does it?

  Thomas


