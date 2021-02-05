Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A473310C9B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:38:14 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82FQ-0005ZM-Kk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l82DY-0004KP-B5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:36:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l82DV-0007MY-V6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612535773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlOW7oy/xRIIT2tC5DkM0CWYfD0H9+LWKmhSR9iZ/eo=;
 b=ALxhbvXByXUGB57QSWamaHlVtERG7oaqPyuZYH2c0yumh9MkkLg3o8R9t0ZRVfzN0rurIz
 YOb7WCXxM5bMgEfzqzlyaO2nVtCxvBQI1CCoLbh9QM9CtAi/uo8YN1YubTiE3H7SAZXDEw
 DmPmBsyBBCAtY40hHMK/NXnhLIKAfC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-T_jqUwEPPsO0S4MAoKBCcg-1; Fri, 05 Feb 2021 09:36:10 -0500
X-MC-Unique: T_jqUwEPPsO0S4MAoKBCcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EC2801978;
 Fri,  5 Feb 2021 14:36:08 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B815C261;
 Fri,  5 Feb 2021 14:36:06 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <20210205113429.GG908621@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <be536ba5-cbfb-fc96-7014-de88f06290bd@redhat.com>
Date: Fri, 5 Feb 2021 08:36:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205113429.GG908621@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, rjones@redhat.com, tao3.xu@intel.com, armbru@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:34 AM, Daniel P. Berrangé wrote:
> On Thu, Feb 04, 2021 at 01:07:06PM -0600, Eric Blake wrote:
>> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
>> the keyval visitor), and it gets annoying that edge-case testing is
>> impacted by implicit rounding to 53 bits of precision due to parsing
>> with strtod().  As an example posted by Rich Jones:
>>  $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>>    'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>>  write failed: Input/output error
>>

>> @@ -1970,7 +1977,7 @@ static void test_qemu_strtosz_simple(void)
>>      g_assert_cmpint(err, ==, 0);
>>      g_assert_cmpint(res, ==, 12345);
>>
>> -    /* Note: precision is 53 bits since we're parsing with strtod() */
>> +    /* Note: If there is no '.', we get full 64 bits of precision */
> 
> IIUC, our goal is that we should never loose precision for the
> non-fractional part. 

Correct. Maybe I can tweak that comment more as part of splitting this
patch into testsuite improvements (highlighting existing shortfalls)
then the actual implementation change (with its corresponding testsuite
tweaks to demonstrate how it is fixed).


>> +
>> +    str = "0xa";
>> +    err = qemu_strtosz(str, &endptr, &res);
>> +    g_assert_cmpint(err, ==, 0);
>> +    g_assert_cmpint(res, ==, 10);
>> +    g_assert(endptr == str + 3);
> 
> I'd stick a  '0xab' or "0xae" in there, to demonstrate that we're
> not accidentally applyin the scaling units for "b" and "e" in hex.

Will do.


>> +    str = "0x1.8k";
>> +    err = qemu_strtosz(str, &endptr, &res);
>> +    g_assert_cmpint(err, ==, -EINVAL);
>> +    g_assert(endptr == str);
>>  }
> 
> A test case to reject negative numers ?

We already have one, under the _erange section.  Then again, there's an
oddity: with ERANGE, we tend to leave endptr pointing to the end of what
we did parse, while with EINVAL, we tend to leave endptr pointing to
nptr saying we parsed nothing at all.  It's hard to decide whether -1 is
an ERANGE (negative is not permitted, but we successfully parsed two
characters and so advanced endptr), or an EINVAL (we don't allow
negative at all, so endptr is nptr).  If anyone has preferences, now
would be the time to document the semantics we want; although since we
already have an existing test under _range for -1, I tried to keep that
behavior unchanged.


>> -    retval = qemu_strtod_finite(nptr, &endptr, &val);
>> +    /* Parse integral portion as decimal. */
>> +    retval = qemu_strtou64(nptr, &endptr, 10, &val);
>>      if (retval) {
>>          goto out;
>>      }
>> -    fraction = modf(val, &integral);
>> -    if (fraction != 0) {
>> -        mul_required = 1;
>> +    if (strchr(nptr, '-') != NULL) {
>> +        retval = -ERANGE;
>> +        goto out;
>> +    }
>> +    if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
> 
> This works as an approach but it might be more clear to
> just check for hex upfront.
> 
>   if (g_str_has_prefix("0x", val) ||
>       g_str_has_prefix("0X", val)) {

Won't work nicely.  strtoull() allows for leading whitespace, at which
point we are duplicating a lot of functionality to likewise skip such
leading whitespace before checking the prefix.

>       ... do hex parse..
>   } else {
>       ... do dec parse..
>   }
>       
> 
>> +        /* Input looks like hex, reparse, and insist on no fraction. */
>> +        retval = qemu_strtou64(nptr, &endptr, 16, &val);
>> +        if (retval) {
>> +            goto out;
>> +        }
>> +        if (*endptr == '.') {
>> +            endptr = nptr;
>> +            retval = -EINVAL;
>> +            goto out;
>> +        }
>> +    } else if (*endptr == '.') {
>> +        /* Input is fractional, insist on 0 <= fraction < 1, with no exponent */
>> +        retval = qemu_strtod_finite(endptr, &endptr, &fraction);
>> +        if (retval) {
>> +            endptr = nptr;
>> +            goto out;
>> +        }
>> +        if (fraction >= 1.0 || memchr(nptr, 'e', endptr - nptr)
>> +            || memchr(nptr, 'E', endptr - nptr)) {
> 
> Can this be simplified ?  Fraction can be > 1, if-and only-if exponent
> syntax is used IIUC.

True for > 1.0, but false for == 1.0, because of the possibility of
overflow while parsing a fraction like .99999999999999999999999999999999

> 
> Shouldn't we be passing 'endptr+1' as the first arg to memchr ?

Not quite.  I used endptr as both input and output in the strtod() call,
so at this point, I'd have to add another variable to track where the
'.' since endptr is no longer pointing there.  But being lazy, I know
that the integral portion contains no 'e', so even though the memchr is
wasting effort searching bytes before the '.' for 'e', it is not wrong.

> 
> nptr points to the leading decimal part, and we only need to
> scan the fractional part.
> 
> Also what happens with   "1.1e" - that needs to be treated
> as a exabyte suffix, and not rejected as an exponent. We
> ought to test that if we don't already.

Agree that we need to support it (well, depending on patch 3, it may be
cleaner to write the test to look for support for 1.5e).  Will make sure
the test covers it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


