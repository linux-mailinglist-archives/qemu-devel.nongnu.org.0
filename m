Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9E122513
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 07:56:08 +0100 (CET)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih6m7-0003wo-6S
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 01:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ih6i0-0007yt-W4
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:51:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ih6hx-0001VK-8n
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:51:51 -0500
Received: from mga06.intel.com ([134.134.136.31]:60212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ih6hw-0001SX-SO
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:51:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 22:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,324,1571727600"; d="scan'208";a="247327642"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.238])
 ([10.239.196.238])
 by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2019 22:51:44 -0800
Subject: Re: [PATCH RESEND v2] util/cutils: Expand do_strtosz parsing
 precision to 64 bits
To: "armbru@redhat.com" <armbru@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
References: <20191209083053.16402-1-tao3.xu@intel.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <f8bb8382-7199-3177-84bc-38d757e38f4f@intel.com>
Date: Tue, 17 Dec 2019 14:51:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209083053.16402-1-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping.

On 12/9/2019 4:30 PM, Xu, Tao3 wrote:
> Parse input string both as a double and as a uint64_t, then use the
> method which consumes more characters. Update the related test cases.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
> 
> Changes in v2:
>      - Resend to use double small than DBL_MIN
>      - Add more test case for double overflow and underflow.
>      - Set mul as int64_t (Markus)
>      - Restore endptr (Markus)
> ---
>   tests/test-cutils.c    | 37 +++++++----------------
>   tests/test-keyval.c    | 47 +++++------------------------
>   tests/test-qemu-opts.c | 39 +++++-------------------
>   util/cutils.c          | 67 +++++++++++++++++++++++++++++++-----------
>   4 files changed, 75 insertions(+), 115 deletions(-)
> 
> diff --git a/tests/test-cutils.c b/tests/test-cutils.c
> index 1aa8351520..49e495b8ba 100644
> --- a/tests/test-cutils.c
> +++ b/tests/test-cutils.c
> @@ -1970,40 +1970,25 @@ static void test_qemu_strtosz_simple(void)
>       g_assert_cmpint(err, ==, 0);
>       g_assert_cmpint(res, ==, 12345);
>   
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> -
> -    str = "9007199254740991"; /* 2^53-1 */
> -    err = qemu_strtosz(str, &endptr, &res);
> -    g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0x1fffffffffffff);
> -    g_assert(endptr == str + 16);
> -
> -    str = "9007199254740992"; /* 2^53 */
> -    err = qemu_strtosz(str, &endptr, &res);
> -    g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0x20000000000000);
> -    g_assert(endptr == str + 16);
> +    /* Note: precision is 64 bits (UINT64_MAX) */
>   
>       str = "9007199254740993"; /* 2^53+1 */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0x20000000000000); /* rounded to 53 bits */
> +    g_assert_cmpint(res, ==, 0x20000000000001);
>       g_assert(endptr == str + 16);
>   
> -    str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
> +    str = "18446744073709550591"; /* 0xfffffffffffffbff */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0xfffffffffffff800);
> +    g_assert_cmpint(res, ==, 0xfffffffffffffbff);
>       g_assert(endptr == str + 20);
>   
> -    str = "18446744073709550591"; /* 0xfffffffffffffbff */
> +    str = "18446744073709551615"; /* 2^64-1 (UINT64_MAX) */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0xfffffffffffff800); /* rounded to 53 bits */
> +    g_assert_cmpint(res, ==, 0xffffffffffffffff);
>       g_assert(endptr == str + 20);
> -
> -    /* 0x7ffffffffffffe00..0x7fffffffffffffff get rounded to
> -     * 0x8000000000000000, thus -ERANGE; see test_qemu_strtosz_erange() */
>   }
>   
>   static void test_qemu_strtosz_units(void)
> @@ -2145,20 +2130,20 @@ static void test_qemu_strtosz_erange(void)
>       g_assert_cmpint(err, ==, -ERANGE);
>       g_assert(endptr == str + 2);
>   
> -    str = "18446744073709550592"; /* 0xfffffffffffffc00 */
> +    str = "18446744073709551616"; /* 2^64 */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, -ERANGE);
>       g_assert(endptr == str + 20);
>   
> -    str = "18446744073709551615"; /* 2^64-1 */
> +    str = "1.7976931348623158e+308"; /* DBL_MAX, double overflows */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, -ERANGE);
> -    g_assert(endptr == str + 20);
> +    g_assert(endptr == str + 23);
>   
> -    str = "18446744073709551616"; /* 2^64 */
> +    str = "2.225e-308"; /* Small than DBL_MIN, double underflows */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, -ERANGE);
> -    g_assert(endptr == str + 20);
> +    g_assert(endptr == str + 10);
>   
>       str = "20E";
>       err = qemu_strtosz(str, &endptr, &res);
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index 09b0ae3c68..fad941fcb8 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -383,59 +383,26 @@ static void test_keyval_visit_size(void)
>       visit_end_struct(v, NULL);
>       visit_free(v);
>   
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> +    /* Note: precision is 64 bits (UINT64_MAX) */
>   
> -    /* Around limit of precision: 2^53-1, 2^53, 2^53+1 */
> -    qdict = keyval_parse("sz1=9007199254740991,"
> -                         "sz2=9007199254740992,"
> -                         "sz3=9007199254740993",
> +    /* Around limit of precision: UINT64_MAX - 1, UINT64_MAX */
> +    qdict = keyval_parse("sz1=18446744073709551614,"
> +                         "sz2=18446744073709551615",
>                            NULL, &error_abort);
>       v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>       qobject_unref(qdict);
>       visit_start_struct(v, NULL, NULL, 0, &error_abort);
>       visit_type_size(v, "sz1", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x1fffffffffffff);
> +    g_assert_cmphex(sz, ==, 0xfffffffffffffffe);
>       visit_type_size(v, "sz2", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x20000000000000);
> -    visit_type_size(v, "sz3", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x20000000000000);
> -    visit_check_struct(v, &error_abort);
> -    visit_end_struct(v, NULL);
> -    visit_free(v);
> -
> -    /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */
> -    qdict = keyval_parse("sz1=9223372036854774784," /* 7ffffffffffffc00 */
> -                         "sz2=9223372036854775295", /* 7ffffffffffffdff */
> -                         NULL, &error_abort);
> -    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
> -    qobject_unref(qdict);
> -    visit_start_struct(v, NULL, NULL, 0, &error_abort);
> -    visit_type_size(v, "sz1", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x7ffffffffffffc00);
> -    visit_type_size(v, "sz2", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x7ffffffffffffc00);
> -    visit_check_struct(v, &error_abort);
> -    visit_end_struct(v, NULL);
> -    visit_free(v);
> -
> -    /* Close to actual upper limit 0xfffffffffffff800 (53 msbs set) */
> -    qdict = keyval_parse("sz1=18446744073709549568," /* fffffffffffff800 */
> -                         "sz2=18446744073709550591", /* fffffffffffffbff */
> -                         NULL, &error_abort);
> -    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
> -    qobject_unref(qdict);
> -    visit_start_struct(v, NULL, NULL, 0, &error_abort);
> -    visit_type_size(v, "sz1", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0xfffffffffffff800);
> -    visit_type_size(v, "sz2", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0xfffffffffffff800);
> +    g_assert_cmphex(sz, ==, 0xffffffffffffffff);
>       visit_check_struct(v, &error_abort);
>       visit_end_struct(v, NULL);
>       visit_free(v);
>   
>       /* Beyond limits */
>       qdict = keyval_parse("sz1=-1,"
> -                         "sz2=18446744073709550592", /* fffffffffffffc00 */
> +                         "sz2=18446744073709551616", /* 2^64 */
>                            NULL, &error_abort);
>       v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>       qobject_unref(qdict);
> diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
> index ef96e84aed..3a8b8c0168 100644
> --- a/tests/test-qemu-opts.c
> +++ b/tests/test-qemu-opts.c
> @@ -650,50 +650,25 @@ static void test_opts_parse_size(void)
>       g_assert_cmpuint(opts_count(opts), ==, 1);
>       g_assert_cmpuint(qemu_opt_get_size(opts, "size1", 1), ==, 0);
>   
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> +    /* Note: precision is 64 bits (UINT64_MAX) */
>   
> -    /* Around limit of precision: 2^53-1, 2^53, 2^54 */
> +    /* Around limit of precision: UINT64_MAX - 1, UINT64_MAX */
>       opts = qemu_opts_parse(&opts_list_02,
> -                           "size1=9007199254740991,"
> -                           "size2=9007199254740992,"
> -                           "size3=9007199254740993",
> -                           false, &error_abort);
> -    g_assert_cmpuint(opts_count(opts), ==, 3);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
> -                     ==, 0x1fffffffffffff);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
> -                     ==, 0x20000000000000);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size3", 1),
> -                     ==, 0x20000000000000);
> -
> -    /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */
> -    opts = qemu_opts_parse(&opts_list_02,
> -                           "size1=9223372036854774784," /* 7ffffffffffffc00 */
> -                           "size2=9223372036854775295", /* 7ffffffffffffdff */
> -                           false, &error_abort);
> -    g_assert_cmpuint(opts_count(opts), ==, 2);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
> -                     ==, 0x7ffffffffffffc00);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
> -                     ==, 0x7ffffffffffffc00);
> -
> -    /* Close to actual upper limit 0xfffffffffffff800 (53 msbs set) */
> -    opts = qemu_opts_parse(&opts_list_02,
> -                           "size1=18446744073709549568," /* fffffffffffff800 */
> -                           "size2=18446744073709550591", /* fffffffffffffbff */
> +                           "size1=18446744073709551614,"
> +                           "size2=18446744073709551615",
>                              false, &error_abort);
>       g_assert_cmpuint(opts_count(opts), ==, 2);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
> -                     ==, 0xfffffffffffff800);
> +                     ==, 0xfffffffffffffffe);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
> -                     ==, 0xfffffffffffff800);
> +                     ==, 0xffffffffffffffff);
>   
>       /* Beyond limits */
>       opts = qemu_opts_parse(&opts_list_02, "size1=-1", false, &err);
>       error_free_or_abort(&err);
>       g_assert(!opts);
>       opts = qemu_opts_parse(&opts_list_02,
> -                           "size1=18446744073709550592", /* fffffffffffffc00 */
> +                           "size1=18446744073709551616", /* 2^64 */
>                              false, &err);
>       error_free_or_abort(&err);
>       g_assert(!opts);
> diff --git a/util/cutils.c b/util/cutils.c
> index 77acadc70a..7c94ff2f0b 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -212,19 +212,39 @@ static int do_strtosz(const char *nptr, const char **end,
>                         const char default_suffix, int64_t unit,
>                         uint64_t *result)
>   {
> -    int retval;
> -    const char *endptr;
> +    int retval, retd, retu;
> +    const char *endptr, *suffixd, *suffixu;
>       unsigned char c;
>       int mul_required = 0;
> -    double val, mul, integral, fraction;
> +    bool use_strtod;
> +    uint64_t valu;
> +    int64_t mul;
> +    double vald, integral, fraction;
> +
> +    /*
> +     * Parse @nptr both as a double and as a uint64_t, then use the method
> +     * which consumes more characters.
> +     */
> +    retd = qemu_strtod_finite(nptr, &suffixd, &vald);
> +    retu = qemu_strtou64(nptr, &suffixu, 0, &valu);
> +    use_strtod = strlen(suffixd) < strlen(suffixu);
> +
> +    if (use_strtod) {
> +        endptr = suffixd;
> +        retval = retd;
> +    } else {
> +        endptr = suffixu;
> +        retval = retu;
> +    }
>   
> -    retval = qemu_strtod_finite(nptr, &endptr, &val);
>       if (retval) {
>           goto out;
>       }
> -    fraction = modf(val, &integral);
> -    if (fraction != 0) {
> -        mul_required = 1;
> +    if (use_strtod) {
> +        fraction = modf(vald, &integral);
> +        if (fraction != 0) {
> +            mul_required = 1;
> +        }
>       }
>       c = *endptr;
>       mul = suffix_mul(c, unit);
> @@ -238,17 +258,30 @@ static int do_strtosz(const char *nptr, const char **end,
>           retval = -EINVAL;
>           goto out;
>       }
> -    /*
> -     * Values near UINT64_MAX overflow to 2**64 when converting to double
> -     * precision.  Compare against the maximum representable double precision
> -     * value below 2**64, computed as "the next value after 2**64 (0x1p64) in
> -     * the direction of 0".
> -     */
> -    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
> -        retval = -ERANGE;
> -        goto out;
> +
> +    if (use_strtod) {
> +        /*
> +         * Values near UINT64_MAX overflow to 2**64 when converting to double
> +         * precision. Compare against the maximum representable double precision
> +         * value below 2**64, computed as "the next value after 2**64 (0x1p64)
> +         * in the direction of 0".
> +         */
> +        if ((vald * mul > nextafter(0x1p64, 0)) || vald < 0) {
> +            retval = -ERANGE;
> +            goto out;
> +        }
> +        *result = vald * mul;
> +    } else {
> +        /* Reject negative input and overflow output */
> +        while (qemu_isspace(*nptr)) {
> +            nptr++;
> +        }
> +        if (*nptr == '-' || UINT64_MAX / mul < valu) {
> +            retval = -ERANGE;
> +            goto out;
> +        }
> +        *result = valu * mul;
>       }
> -    *result = val * mul;
>       retval = 0;
>   
>   out:
> 


