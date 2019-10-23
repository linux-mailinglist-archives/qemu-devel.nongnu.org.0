Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5514E11EE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 08:08:43 +0200 (CEST)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN9p4-0004VT-V6
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 02:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iN9oA-00046J-II
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 02:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iN9o8-0002fS-15
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 02:07:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:6525)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iN9o7-0002cG-Ot
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 02:07:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 23:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; d="scan'208";a="188146208"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.197.6])
 ([10.239.197.6])
 by orsmga007.jf.intel.com with ESMTP; 22 Oct 2019 23:07:37 -0700
Subject: Re: [PATCH v13 01/12] util/cutils: Add qemu_strtotime_ps()
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
 <20191020111125.27659-2-tao3.xu@intel.com>
 <20191023010846.GH4084@habkost.net>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <b136ab44-5396-8616-1242-73d04fa5fc01@intel.com>
Date: Wed, 23 Oct 2019 14:07:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023010846.GH4084@habkost.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: "Liu, Jingqi" <jingqi.liu@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/2019 9:08 AM, Eduardo Habkost wrote:
> Hi,
> 
> First of all, sorry for not reviewing this earlier.  I thought
> other people were already looking at the first 4 patches.
> 
> On Sun, Oct 20, 2019 at 07:11:14PM +0800, Tao Xu wrote:
>> To convert strings with time suffixes to numbers, support time unit are
>> "ps" for picosecond, "ns" for nanosecond, "us" for microsecond, "ms"
>> for millisecond or "s" for second.
>>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>> ---
>>
>> No changes in v13.
>> ---
>>   include/qemu/cutils.h |  1 +
>>   util/cutils.c         | 82 +++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 83 insertions(+)
>>
>> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
>> index b54c847e0f..7b6d106bdd 100644
>> --- a/include/qemu/cutils.h
>> +++ b/include/qemu/cutils.h
>> @@ -182,5 +182,6 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n);
>>    * *str1 is <, == or > than *str2.
>>    */
>>   int qemu_pstrcmp0(const char **str1, const char **str2);
>> +int qemu_strtotime_ps(const char *nptr, const char **end, uint64_t *result);
>>   
>>   #endif
>> diff --git a/util/cutils.c b/util/cutils.c
>> index fd591cadf0..a50c15f46a 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -847,3 +847,85 @@ int qemu_pstrcmp0(const char **str1, const char **str2)
>>   {
>>       return g_strcmp0(*str1, *str2);
>>   }
>> +
>> +static int64_t timeunit_mul(const char *unitstr)
>> +{
>> +    if (g_strcmp0(unitstr, "ps") == 0) {
>> +        return 1;
> 
> This makes do_strtotime("123ps,...", &end, ...) fail because of
> trailing data.
> 
>> +    } else if (g_strcmp0(unitstr, "ns") == 0) {
>> +        return 1000;
>> +    } else if (g_strcmp0(unitstr, "us") == 0) {
>> +        return 1000000;
>> +    } else if (g_strcmp0(unitstr, "ms") == 0) {
>> +        return 1000000000LL;
>> +    } else if (g_strcmp0(unitstr, "s") == 0) {
>> +        return 1000000000000LL;
> 
> Same as above, for the other suffixes.
> 
>> +    } else {
>> +        return -1;
> 
> But this makes do_strtotime("123,...", &end, ...) work as
> expected.
> 
> This is inconsistent.  I see that you are not testing non-NULL
> `end` argument at test_qemu_strtotime_ps_trailing(), so that's
> probably why this issue wasn't detected.
> 
>> +    }
>> +}
>> +
>> +
>> +/*
>> + * Convert string to time, support time unit are ps for picosecond,
>> + * ns for nanosecond, us for microsecond, ms for millisecond or s for second.
>> + * End pointer will be returned in *end, if not NULL. Return -ERANGE on
>> + * overflow, and -EINVAL on other error.
>> + */
>> +static int do_strtotime(const char *nptr, const char **end,
>> +                      const char *default_unit, uint64_t *result)
>> +{
>> +    int retval;
>> +    const char *endptr;
>> +    int mul_required = 0;
>> +    int64_t mul;
>> +    double val, integral, fraction;
>> +
>> +    retval = qemu_strtod_finite(nptr, &endptr, &val);
>> +    if (retval) {
>> +        goto out;
>> +    }
>> +    fraction = modf(val, &integral);
>> +    if (fraction != 0) {
>> +        mul_required = 1;
>> +    }
>> +
>> +    mul = timeunit_mul(endptr);
>> +
>> +    if (mul == 1000000000000LL) {
>> +        endptr++;
>> +    } else if (mul != -1) {
>> +        endptr += 2;
> 
> This is fragile.  It can break very easily if additional
> one-letter suffixes are added to timeunit_mul() in the future.
> 
> One option to make this safer is to make timeunit_mul() get a
> pointer to endptr.
> 
> 
>> +    } else {
>> +        mul = timeunit_mul(default_unit);
>> +        assert(mul >= 0);
>> +    }
>> +    if (mul == 1 && mul_required) {
>> +        retval = -EINVAL;
>> +        goto out;
>> +    }
>> +    /*
>> +     * Values >= 0xfffffffffffffc00 overflow uint64_t after their trip
>> +     * through double (53 bits of precision).
>> +     */
>> +    if ((val * (double)mul >= 0xfffffffffffffc00) || val < 0) {
>> +        retval = -ERANGE;
>> +        goto out;
>> +    }
>> +    *result = val * (double)mul;
>> +    retval = 0;
>> +
>> +out:
>> +    if (end) {
>> +        *end = endptr;
> 
> This indicates that having trailing data after the string is OK
> if `end` is not NULL, but timeunit_mul() doesn't take that into
> account.
> 
> Considering that this function is just a copy of do_strtosz(), I
> suggest making do_strtosz() and suffix_mul() get a
> suffix/multiplier table as input, instead of duplicating the
> code.
> 
> Thanks for your suggestion, I will try it.


