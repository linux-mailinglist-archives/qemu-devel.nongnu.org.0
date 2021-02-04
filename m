Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D386930FDC1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:14:12 +0100 (CET)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7l11-0000Nk-Tn
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7kzj-0008Ij-BA
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7kzf-0003Yl-6Z
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612469564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfophCiIB9zra3Y5ymTvwCo1KMyI9S8r5R47FgHiHBU=;
 b=YAZH04bKpO7uD5q2YLalOF/YZ4hB8O2BDSPhSnBeAzz9NRJQdDm2U3NydmfhIKB13RbUoV
 4W06VDrpZ2FH/bU2rhT4ZSxMY/8PaSSMBGbuXzN13D/CdSAkf2NwWvkQpwZ9Ha+6ai8dVn
 zOAFdTxyT+PbEmME/EycTUc6bgjG8Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-wDnOQNyCPxuKNg1higrhnA-1; Thu, 04 Feb 2021 15:12:42 -0500
X-MC-Unique: wDnOQNyCPxuKNg1higrhnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C33885B664;
 Thu,  4 Feb 2021 20:12:41 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 862DF10074FC;
 Thu,  4 Feb 2021 20:12:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <a141ad8f-113e-b769-931a-767e0807a1f9@redhat.com>
Date: Thu, 4 Feb 2021 14:12:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-2-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 berrange@redhat.com, qemu-block@nongnu.org, tao3.xu@intel.com,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 1:07 PM, Eric Blake wrote:
> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
> the keyval visitor), and it gets annoying that edge-case testing is
> impacted by implicit rounding to 53 bits of precision due to parsing
> with strtod().  As an example posted by Rich Jones:
>  $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>    'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>  write failed: Input/output error
> 
> because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
> out of bounds.
> 
> It is also worth noting that our existing parser, by virtue of using
> strtod(), accepts decimal AND hex numbers, even though test-cutils
> previously lacked any coverage of the latter.  We do have existing
> clients that expect a hex parse to work (for example, iotest 33 using
> qemu-io -c "write -P 0xa 0x200 0x400"), but strtod() parses "08" as 8
> rather than as an invalid octal number, so we know there are no
> clients that depend on octal.  Our use of strtod() also means that
> "0x1.8k" would actually parse as 1536 (the fraction is 8/16), rather
> than 1843 (if the fraction were 8/10); but as this was not covered in
> the testsuite, I have no qualms forbidding hex fractions as invalid,
> so this patch declares that the use of fractions is only supported
> with decimal input, and enhances the testsuite to document that.
> 
> Our previous use of strtod() meant that -1 parsed as a negative; now
> that we parse with strtoull(), negative values can wrap around module

modulo

> 2^64, so we have to explicitly check whether the user passed in a '-'.
> 
> We also had no testsuite coverage of "1.1e0k", which happened to parse
> under strtod() but is unlikely to occur in practice; as long as we are
> making things more robust, it is easy enough to reject the use of
> exponents in a strtod parse.
> 
> The fix is done by breaking the parse into an integer prefix (no loss
> in precision), rejecting negative values (since we can no longer rely
> on strtod() to do that), determining if a decimal or hexadecimal parse
> was intended (with the new restriction that a fractional hex parse is
> not allowed), and where appropriate, using a floating point fractional
> parse (where we also scan to reject use of exponents in the fraction).
> The bulk of the patch is then updates to the testsuite to match our
> new precision, as well as adding new cases we reject (whether they
> were rejected or inadvertenly accepted before).

inadvertently

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 

Is it a bad sign when I review my own code?

> 
>  /*
> - * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
> - * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
> - * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
> - * other error.
> + * Convert size string to bytes.
> + *
> + * Allow either B/b for bytes, K/k for KB, M/m for MB, G/g for GB or
> + * T/t for TB, with scaling based on @unit, and with @default_suffix
> + * implied if no explicit suffix was given.

Reformatted existing text, but incomplete; we also support 'P' and 'E'.

> + *
> + * The end pointer will be returned in *end, if not NULL.  If there is
> + * no fraction, the input can be decimal or hexadecimal; if there is a
> + * fraction, then the input must be decimal and there must be a suffix
> + * (possibly by @default_suffix) larger than Byte, and the fractional
> + * portion may suffer from precision loss or rounding.  The input must
> + * be positive.
> + *
> + * Return -ERANGE on overflow (with *@end advanced), and -EINVAL on
> + * other error (with *@end left unchanged).

If we take patch 2 and 3, this contract should also be updated to
mention what we consider to be deprecated.

>   */
>  static int do_strtosz(const char *nptr, const char **end,
>                        const char default_suffix, int64_t unit,
> @@ -253,40 +264,66 @@ static int do_strtosz(const char *nptr, const char **end,
>      int retval;
>      const char *endptr;
>      unsigned char c;
> -    int mul_required = 0;
> -    double val, mul, integral, fraction;
> +    bool mul_required = false;
> +    uint64_t val;
> +    int64_t mul;
> +    double fraction = 0.0;
> 
> -    retval = qemu_strtod_finite(nptr, &endptr, &val);
> +    /* Parse integral portion as decimal. */
> +    retval = qemu_strtou64(nptr, &endptr, 10, &val);
>      if (retval) {
>          goto out;
>      }
> -    fraction = modf(val, &integral);
> -    if (fraction != 0) {
> -        mul_required = 1;
> +    if (strchr(nptr, '-') != NULL) {
> +        retval = -ERANGE;
> +        goto out;
> +    }
> +    if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
> +        /* Input looks like hex, reparse, and insist on no fraction. */
> +        retval = qemu_strtou64(nptr, &endptr, 16, &val);
> +        if (retval) {
> +            goto out;
> +        }
> +        if (*endptr == '.') {
> +            endptr = nptr;
> +            retval = -EINVAL;
> +            goto out;
> +        }
> +    } else if (*endptr == '.') {
> +        /* Input is fractional, insist on 0 <= fraction < 1, with no exponent */
> +        retval = qemu_strtod_finite(endptr, &endptr, &fraction);
> +        if (retval) {
> +            endptr = nptr;
> +            goto out;
> +        }
> +        if (fraction >= 1.0 || memchr(nptr, 'e', endptr - nptr)
> +            || memchr(nptr, 'E', endptr - nptr)) {
> +            endptr = nptr;
> +            retval = -EINVAL;
> +            goto out;
> +        }
> +        if (fraction != 0) {
> +            mul_required = true;
> +        }
>      }
>      c = *endptr;
>      mul = suffix_mul(c, unit);
> -    if (mul >= 0) {
> +    if (mul > 0) {
>          endptr++;
>      } else {
>          mul = suffix_mul(default_suffix, unit);
> -        assert(mul >= 0);
> +        assert(mul > 0);
>      }
>      if (mul == 1 && mul_required) {
> +        endptr = nptr;
>          retval = -EINVAL;
>          goto out;
>      }
> -    /*
> -     * Values near UINT64_MAX overflow to 2**64 when converting to double
> -     * precision.  Compare against the maximum representable double precision
> -     * value below 2**64, computed as "the next value after 2**64 (0x1p64) in
> -     * the direction of 0".
> -     */
> -    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
> +    if (val > UINT64_MAX / mul) {

Hmm, do we care about:
15.9999999999999999999999999999E
where the fractional portion becomes large enough to actually bump our
sum below to 16E which indeed overflows?  Then again, we rejected a
fraction of 1.0 above, and 0.9999999999999999999999999999 parses to 1.0
due to rounding.
Maybe it's just worth a good comment why the overflow check here works
without consulting fraction.

>          retval = -ERANGE;
>          goto out;
>      }
> -    *result = val * mul;
> +    *result = val * mul + (uint64_t) (fraction * mul);
>      retval = 0;
> 
>  out:
-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


