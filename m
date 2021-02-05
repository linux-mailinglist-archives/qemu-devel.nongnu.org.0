Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5D310C7B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:13:41 +0100 (CET)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81rg-0002ds-5x
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81qE-0001qy-Vj
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81qD-0004w4-HN
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612534328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Va205n/nfouNSrAU9e4wE0pt+ndjUAyFcvbtSqJIWg=;
 b=ZM27AIFzuSZudJDhI+9Q0WJUS4kSVEDurGjonaVUrYacHm/fWlTRcLYCEQz9RP9TDZ/6I1
 KK6Wbop76rPWNoBdgDWKMNwBMWvIV6XUIc4JfRSTteOX761hX1koIto7HPPPLFMIwf+Wf9
 JQoRKnrr+LL4m+ZSYyTMYKeQTdo7sYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-9q58yMr4OJiH0-z4j2MIBg-1; Fri, 05 Feb 2021 09:12:04 -0500
X-MC-Unique: 9q58yMr4OJiH0-z4j2MIBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3F5D107ACC7;
 Fri,  5 Feb 2021 14:12:02 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 531B61851D;
 Fri,  5 Feb 2021 14:12:02 +0000 (UTC)
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <da4f6b38-d489-ee83-1661-fec41903dd75@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d81514a0-6615-80ae-c095-05a12cc1380e@redhat.com>
Date: Fri, 5 Feb 2021 08:12:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <da4f6b38-d489-ee83-1661-fec41903dd75@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, rjones@redhat.com, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:07 AM, Vladimir Sementsov-Ogievskiy wrote:

>> @@ -2106,6 +2137,21 @@ static void test_qemu_strtosz_invalid(void)
>>       err = qemu_strtosz(str, &endptr, &res);
>>       g_assert_cmpint(err, ==, -EINVAL);
>>       g_assert(endptr == str);
>> +
>> +    str = "1.1e5";
>> +    err = qemu_strtosz(str, &endptr, &res);
>> +    g_assert_cmpint(err, ==, -EINVAL);
>> +    g_assert(endptr == str);
> 
> I'd add also test with 'E'

Will do.  For v2, I'll probably split this patch, first into adding new
test cases (with demonstrations of what we deem to be buggy parses), and
the second showing how those cases improve as we change the code.

> 
>> +
>> +    str = "1.1B";
>> +    err = qemu_strtosz(str, &endptr, &res);
>> +    g_assert_cmpint(err, ==, -EINVAL);
>> +    g_assert(endptr == str);
>> +
>> +    str = "0x1.8k";
>> +    err = qemu_strtosz(str, &endptr, &res);
>> +    g_assert_cmpint(err, ==, -EINVAL);
>> +    g_assert(endptr == str);
> 
> ha this function looks like it should have
> 
> const cher *str[] = ["", " \t ", ... "0x1.8k"]
> 
> and all cases in a for()... and all other test cases may be ... Oh, I
> should say myself "don't refactor everything you see".

I'll think about it.  It's already odd that the tests are split between
so many functions.


>> @@ -668,7 +668,7 @@ static void test_opts_parse_size(void)
>>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
>>                        ==, 0x20000000000000);
>>       g_assert_cmphex(qemu_opt_get_size(opts, "size3", 1),
>> -                     ==, 0x20000000000000);
>> +                     ==, 0x20000000000001);
>>
>>       /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */
> 
> should fix comment?

Yes, I did it in one file but not the other, so I'll make it consistent.
 The point of the comment post-patch is that we are demonstrating that
our implementation is NOT bound by the limits of a double's precision.


>> -    retval = qemu_strtod_finite(nptr, &endptr, &val);
>> +    /* Parse integral portion as decimal. */
>> +    retval = qemu_strtou64(nptr, &endptr, 10, &val);
>>       if (retval) {
>>           goto out;
>>       }
>> -    fraction = modf(val, &integral);
>> -    if (fraction != 0) {
>> -        mul_required = 1;
>> +    if (strchr(nptr, '-') != NULL) {
>> +        retval = -ERANGE;
>> +        goto out;
>> +    }
> 
> Hmm, I have a question: does do_strtosz assumes that the whole nptr
> string is a number?

No.  In fact, our testsuite demonstrates the difference between endptr
as a pointer (we parse what we can and advance *endptr to the tail) and
as NULL (trailing garbage is an error).

> 
> If yes, then I don't understand what the matter of **end OUT-argument.
> 
> If not, this if() is wrong, as you'll redject parsing first number of
> "123425 -  2323" string..

Yep, good catch.  This needs to use memchr, similar to the check for 'e'
in the fraction portion below.


>> +        retval = qemu_strtod_finite(endptr, &endptr, &fraction);
>> +        if (retval) {
>> +            endptr = nptr;
>> +            goto out;
>> +        }
>> +        if (fraction >= 1.0 || memchr(nptr, 'e', endptr - nptr)
>> +            || memchr(nptr, 'E', endptr - nptr)) {
>> +            endptr = nptr;


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


