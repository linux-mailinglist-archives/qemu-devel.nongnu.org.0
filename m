Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC4310A58
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:37:18 +0100 (CET)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zQK-000489-QJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7zNx-0002jT-U4
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7zNt-0001a8-IY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612524883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H5mcWG6OuaqvRNCoWBABiHQud0GgiZZkX2QKi3cmGCQ=;
 b=ZImGKwnxOjla4Ke/Lr99jW97X51owdAaHhgscmzGmosRRTlc56anxrORYHtcvYya5gwF1a
 ft5HN+H1OhhLMxTKUeyILsAgHnnZ1AjJKyI2DTt/UUxgsQYpVgcrdpnpa/7TT4WsBeRZqs
 rMz6uxM+jJrE6ZQRuXkz2z9N0CVknxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-guJES7qnN_y6ih-obXh_Mw-1; Fri, 05 Feb 2021 06:34:37 -0500
X-MC-Unique: guJES7qnN_y6ih-obXh_Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD10BBEE3;
 Fri,  5 Feb 2021 11:34:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABDE66268F;
 Fri,  5 Feb 2021 11:34:32 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:34:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <20210205113429.GG908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-2-eblake@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, rjones@redhat.com, tao3.xu@intel.com, armbru@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 01:07:06PM -0600, Eric Blake wrote:
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
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 
> Note that this approach differs from what has been attempted in the
> past; see the thread starting at
> https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00852.html
> That approach tried to parse both as strtoull and strtod and take
> whichever was longer, but that was harder to document.
> ---
>  tests/test-cutils.c        | 79 ++++++++++++++++++++++++++++++--------
>  tests/test-keyval.c        | 24 +++++++++---
>  tests/test-qemu-opts.c     | 20 +++++++---
>  util/cutils.c              | 77 +++++++++++++++++++++++++++----------
>  tests/qemu-iotests/049.out |  7 +++-
>  5 files changed, 156 insertions(+), 51 deletions(-)
> 
> diff --git a/tests/test-cutils.c b/tests/test-cutils.c
> index 1aa8351520ae..0c2c89d6f113 100644
> --- a/tests/test-cutils.c
> +++ b/tests/test-cutils.c
> @@ -1960,6 +1960,13 @@ static void test_qemu_strtosz_simple(void)
>      g_assert_cmpint(res, ==, 0);
>      g_assert(endptr == str + 1);
> 
> +    /* Leading 0 gives decimal results, not octal */
> +    str = "08";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpint(res, ==, 8);
> +    g_assert(endptr == str + 2);
> +
>      str = "12345";
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, 0);
> @@ -1970,7 +1977,7 @@ static void test_qemu_strtosz_simple(void)
>      g_assert_cmpint(err, ==, 0);
>      g_assert_cmpint(res, ==, 12345);
> 
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> +    /* Note: If there is no '.', we get full 64 bits of precision */

IIUC, our goal is that we should never loose precision for the
non-fractional part. 

> 
>      str = "9007199254740991"; /* 2^53-1 */
>      err = qemu_strtosz(str, &endptr, &res);
> @@ -1987,7 +1994,7 @@ static void test_qemu_strtosz_simple(void)
>      str = "9007199254740993"; /* 2^53+1 */
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0x20000000000000); /* rounded to 53 bits */
> +    g_assert_cmpint(res, ==, 0x20000000000001);
>      g_assert(endptr == str + 16);
> 
>      str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
> @@ -1999,11 +2006,35 @@ static void test_qemu_strtosz_simple(void)
>      str = "18446744073709550591"; /* 0xfffffffffffffbff */
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0xfffffffffffff800); /* rounded to 53 bits */
> +    g_assert_cmpint(res, ==, 0xfffffffffffffbff);
>      g_assert(endptr == str + 20);
> 
> -    /* 0x7ffffffffffffe00..0x7fffffffffffffff get rounded to
> -     * 0x8000000000000000, thus -ERANGE; see test_qemu_strtosz_erange() */
> +    str = "18446744073709551615"; /* 0xffffffffffffffff */
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpint(res, ==, 0xffffffffffffffff);
> +    g_assert(endptr == str + 20);
> +
> +}
> +
> +static void test_qemu_strtosz_hex(void)
> +{
> +    const char *str;
> +    const char *endptr;
> +    int err;
> +    uint64_t res = 0xbaadf00d;
> +
> +    str = "0x0";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpint(res, ==, 0);
> +    g_assert(endptr == str + 3);
> +
> +    str = "0xa";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpint(res, ==, 10);
> +    g_assert(endptr == str + 3);

I'd stick a  '0xab' or "0xae" in there, to demonstrate that we're
not accidentally applyin the scaling units for "b" and "e" in hex.

>  }
> 
>  static void test_qemu_strtosz_units(void)
> @@ -2106,6 +2137,21 @@ static void test_qemu_strtosz_invalid(void)
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, -EINVAL);
>      g_assert(endptr == str);
> +
> +    str = "1.1e5";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert(endptr == str);
> +
> +    str = "1.1B";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert(endptr == str);
> +
> +    str = "0x1.8k";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert(endptr == str);
>  }

A test case to reject negative numers ?

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

This works as an approach but it might be more clear to
just check for hex upfront.

  if (g_str_has_prefix("0x", val) ||
      g_str_has_prefix("0X", val)) {
      ... do hex parse..
  } else {
      ... do dec parse..
  }
      

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

Can this be simplified ?  Fraction can be > 1, if-and only-if exponent
syntax is used IIUC.

Shouldn't we be passing 'endptr+1' as the first arg to memchr ?

nptr points to the leading decimal part, and we only need to
scan the fractional part.

Also what happens with   "1.1e" - that needs to be treated
as a exabyte suffix, and not rejected as an exponent. We
ought to test that if we don't already.

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
>          retval = -ERANGE;
>          goto out;
>      }
> -    *result = val * mul;
> +    *result = val * mul + (uint64_t) (fraction * mul);
>      retval = 0;
> 
>  out:

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


