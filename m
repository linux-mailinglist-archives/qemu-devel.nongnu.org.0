Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52673108B7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:09:49 +0100 (CET)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7y3g-00053b-PT
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7y0k-0003Ws-Ug; Fri, 05 Feb 2021 05:06:46 -0500
Received: from mail-am6eur05on2093.outbound.protection.outlook.com
 ([40.107.22.93]:23969 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7y0h-0004GP-4v; Fri, 05 Feb 2021 05:06:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuuUkjwYf67NIgl/x3TkEjfqr8z2xlYa64wWzyAt3z+trRomhGWTVxJdttorZwfRZpS59mw/k5zGWqKbQHfkS7r3kVh0Ah7BwC2jzl/qvtTed3hE5VCMwcBCjf5je7A5FKXkywNhmYRKymlwbDbVJh40qSZNo/zS/lx2iBu17VPOoqNES3mPLUu1AMTbccM8IBz64YWC570P5OzRo4wZ0QFqEbGcPJt0FuHECK0NEUVMHhv7TdlScf4w7402V9nmu5GDtwOtLOYeM1MoQxxUxhkNyMokKgcILK3geoe3XAn5l6LDZfThAD9DgvbyYfmEW1aBOYSMwgfWyQ3XP9be3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuebGTKn8wb1fsPEaEcLcOCmsNZ291AhJPgZ2qMVbz0=;
 b=FSZ8w1s4Le526xC04Kos8dRYEovtqnf5XkvpkGK6f2IEDRsuz7kiy98M2W7VHqWdRn6AWFqLFuvpMRdqw/4NJAoX8im9p9Ifs/dGEIzDiJgO2YGIzjWgA9ZCXb1IsKjAAH57olNMPLuw0vE/CQjJM+dureD+lUQFNK4ZsHdvQ5ZTj0IZXxtLVN/+wV/6F+etQzcLSZ6heeAJvHiYtvnI12KJmnjDuJW+vK7k6v2htks6a/z2XfWWRq5e2+Is9SJ+kpN5qqamKNUz0TEXCgQ98ydWGGkGPfAD2RzgmRcPPExQ8d1GbFNXJO+qN6IIJ74d1xS/mFe+EtD4N+3fpeFeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuebGTKn8wb1fsPEaEcLcOCmsNZ291AhJPgZ2qMVbz0=;
 b=JhQqBP7sOcYfcBOueohBtg/WAz2DyVQNT7IqzY8pLYJceBfzCHnjvN20Y2JCoC+br+nXrAtNxhGot8OV3easDOBbn+OO/8vBN9F6qvdhGPQIzSOgmeiG0R0XtF45wokHIuC80TkKabmht64ZNQA7RQgMFXdhc9e/tl3eMbsawZM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 10:06:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 10:06:39 +0000
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com,
 qemu-block@nongnu.org, tao3.xu@intel.com, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <a141ad8f-113e-b769-931a-767e0807a1f9@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <21fcd50e-b5c2-d35c-0555-7d26014370ee@virtuozzo.com>
Date: Fri, 5 Feb 2021 13:06:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <a141ad8f-113e-b769-931a-767e0807a1f9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR02CA0203.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR02CA0203.eurprd02.prod.outlook.com (2603:10a6:20b:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 10:06:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75b88888-5b39-4bbf-d654-08d8c9bdba80
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944A27E13C693712558ECD8C1B29@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOd+s7BswgNWe6nRiZaoVoQk6f8n6DXCrG100NA8DISWx45Yd8H/WdLvjo47f5eO068I+qbcelYyxh/xL2JSdYWb31vQ7SfZhCYKWlOX6EOjoYr2lit97A/3TmPEg+rZpWvrs31g1CogdExwL6mqbUM/znIkdjXr2MKZQ3L8ZBbo2pPJzFKElRQ8aEfGBLjcq8FRjX5p7n19XzDWDKjDT/r1OCvd1iCmBKx9y7HunSTaFwl248Pv1i8SSajfBCP2mUdXBOcICwB8gWvfhrorU1JjAigQ+hd5NSoQF1/sNzDQbI/eOO9Lne9Au8LAVSwa/E5m+iQxUeYAaApUtideVbhZWWMQKrsksm08lNMqNlpfhnZFRmKIXILONClrW+J1BlhlKkWpl5UpM0MfRvS2bRcUflpBix+ajyI5lEKHkyOUeW1osU5Wfol5TPCmbWakywhE2CoJ4hF3JYRu/LJarYBNACPp5NkW45cM7E635aCOD1kuKmOPOVQE6CXcb0ovh8gTcbV8jAywT6pJRzs7hI6eFpPEv4CozImKwmM62gO6mlTbUeXTroKoRphzXOlYMszqEgz01EoIbuulCcCKSD3uAlDgEunT32Nz34PEdvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39830400003)(16526019)(52116002)(8936002)(66476007)(26005)(478600001)(316002)(66946007)(66556008)(2906002)(5660300002)(6486002)(86362001)(4326008)(8676002)(2616005)(83380400001)(31696002)(36756003)(54906003)(16576012)(956004)(31686004)(186003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c25RSzM2OUJFTTdUR1lENDE1Ky8xOWhmNWMzblRkK3RteE42anFhS0NjZjln?=
 =?utf-8?B?c1N3RjBjdWVRdVhCTHRqbkVMaTZoZnFkSTN5aVZ2bXVBRnlPeTA4RW1PZ295?=
 =?utf-8?B?TFYxMzRKYis3bEpjOU8wNTlOSVptczNuOXZka3F5QWtMdkZmS1luZmRjYnBE?=
 =?utf-8?B?Z1JvdkpVT1hlUFdSU0RnZ2w5dWZuRkIwaHJKRTFMNFlQUWpzZmgvSWxGb3V1?=
 =?utf-8?B?YnJVZEh3WGhHQWpMakRKVk5kRzhxa0ord1JLMDZIL1h4Ui8xakx3RWlYR2lP?=
 =?utf-8?B?aFdnVjl2Tk9xRHRrTHYzNjluSG5xMHhEN0JKajRPQnZ2dmVkbFRRT0R3SCs1?=
 =?utf-8?B?VGxWdzZWb25KeTVOUVc5K3ArRGRyMTJySXBBOUxrT3ZyeGNNZ2pwTDhpMEp0?=
 =?utf-8?B?MDlaaThLOGk4ZHpOcVhFc1RZMitkbHRiTWQySHAvWmZhRlVDWUZtU1pndURX?=
 =?utf-8?B?YXVuMkw1Qy9TTXNpM0UxSVlubmdLTHBONEh5dnZuaDJrWWZmeEhsTnZxLzl2?=
 =?utf-8?B?VTNNUzFuQ293ajFiTGMwUzNGWTl6S0MzWm51Y2pPT2JNdmlKSVBFVWkxUjJK?=
 =?utf-8?B?VzlVQ2F0VFRvdS9MMEdhVWpmamQySmc4ZW9KeFdtanhzNXoxaE4ybzIxbXQv?=
 =?utf-8?B?c2JKK2pMTFNVU1ZneVMxdWtucGJleUJnSjBmMW1QNDdaaHF1d1Jha1FLS0lr?=
 =?utf-8?B?WlJBTmoxaEp1WmcrVi9XZ0tFYVNHODFSVkpUMWg1bDFFQ3dpZkEvdGo0MjZV?=
 =?utf-8?B?SjRWcmNlNDR5aDhyT0dscnhRT2IwcEl4SEJkNGFPcHo3RllMa1crOFRaZVU5?=
 =?utf-8?B?S1lMVHAvRmZNaXg2Z1cvZXlhV1QyRE5pMW9UdHI1TDJrYStIRnlrSFl3UmxI?=
 =?utf-8?B?S3c5ZDNiQzF3WWkwT1Y4bnJuNE9hSklKc3NPY01kNml0TmxYNkc0aGEyenFn?=
 =?utf-8?B?WTJ4eVY3N1BWTG1qY3JoVk85MVBTdm4vYVgxTUNRVlBneFpSSkNtWVhqV2N0?=
 =?utf-8?B?TVo0aDZveExibys4V1RGRXJERWNRYVdHOCtYS1Y5Vk1sYzk3TVFpM3kycHVs?=
 =?utf-8?B?RkpzT0RZZ1FXTGFvMk04dTZFVVlYU0NtbHhXUjh5ajN2Y2YvUnlWeWRWWFh2?=
 =?utf-8?B?cktGN0NDYThNbElnajlpUEZaTXpnVS9QZE9qMkJmUjRnVnAzd2Y2OWFITkVZ?=
 =?utf-8?B?R2QvWEswTFRFUDlHSCtnTXorVm9VaitxOUZCczdaU2orczFNUCtuTXlqdEpr?=
 =?utf-8?B?R1BkTVJTckNKcG1XUWh4RXVmSFVkMTRKL2xmQTlVL3Z6ZkJtNzhkUEhXcjYr?=
 =?utf-8?B?dUdRalQvSXB2akVLdk1ZUElmZ3FqS0V5VlRxTm1KaTQzc2RoRnZrY1BJTExC?=
 =?utf-8?B?aTdmeDRleDl6dHNLNmZaTzdBYlpSMi9idnBqbjNZaHRkSVJCeTJ1Y09xeW5C?=
 =?utf-8?B?OEVBZkRGWVhtbE5remhxYXlWZk9DSUh3Q0VTRmhwZFJnTE1RRStjYTBZMHZN?=
 =?utf-8?B?ZzJBVUpKdHRiVThBd1UvTzJvaThTZ3hpUWVqZWdNcld3U3lzKytrYWhzalBx?=
 =?utf-8?B?QnFUYk1CNTF2aUNtRVllbFQvVW9QcUVBdVFwRHlSY1Fvc3hVTlQvajRnR0sv?=
 =?utf-8?B?NzlWdGtwMG9zaitjbUJDOEM5WVpRT0F5UU5NTzBjSGhGdXh0NTM1ZGtNZmow?=
 =?utf-8?B?NjN1MjdqY0RsOHEwUlZtMjNqck1jQjRwNWVBajgxcTZuZ1djdkpEUG1QTHRS?=
 =?utf-8?Q?p4FqtJ3EMfoHtXlUhteobxVB0DGIZjIKmT5MTSc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b88888-5b39-4bbf-d654-08d8c9bdba80
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:06:39.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrVjSLJ8UdUZPyqD2qX9UOgq7+i0nG7727+HiK5L0tqdxCSq0IxHmJNCPCvU/uQs1rjArJaARFvHgFT+Kv/o05zfpLKUstskdyvsxSNct8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.22.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

04.02.2021 23:12, Eric Blake wrote:
> On 2/4/21 1:07 PM, Eric Blake wrote:
>> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
>> the keyval visitor), and it gets annoying that edge-case testing is
>> impacted by implicit rounding to 53 bits of precision due to parsing
>> with strtod().  As an example posted by Rich Jones:
>>   $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>>     'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>>   write failed: Input/output error
>>
>> because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
>> out of bounds.
>>
>> It is also worth noting that our existing parser, by virtue of using
>> strtod(), accepts decimal AND hex numbers, even though test-cutils
>> previously lacked any coverage of the latter.  We do have existing
>> clients that expect a hex parse to work (for example, iotest 33 using
>> qemu-io -c "write -P 0xa 0x200 0x400"), but strtod() parses "08" as 8
>> rather than as an invalid octal number, so we know there are no
>> clients that depend on octal.  Our use of strtod() also means that
>> "0x1.8k" would actually parse as 1536 (the fraction is 8/16), rather
>> than 1843 (if the fraction were 8/10); but as this was not covered in
>> the testsuite, I have no qualms forbidding hex fractions as invalid,
>> so this patch declares that the use of fractions is only supported
>> with decimal input, and enhances the testsuite to document that.
>>
>> Our previous use of strtod() meant that -1 parsed as a negative; now
>> that we parse with strtoull(), negative values can wrap around module
> 
> modulo
> 
>> 2^64, so we have to explicitly check whether the user passed in a '-'.
>>
>> We also had no testsuite coverage of "1.1e0k", which happened to parse
>> under strtod() but is unlikely to occur in practice; as long as we are
>> making things more robust, it is easy enough to reject the use of
>> exponents in a strtod parse.
>>
>> The fix is done by breaking the parse into an integer prefix (no loss
>> in precision), rejecting negative values (since we can no longer rely
>> on strtod() to do that), determining if a decimal or hexadecimal parse
>> was intended (with the new restriction that a fractional hex parse is
>> not allowed), and where appropriate, using a floating point fractional
>> parse (where we also scan to reject use of exponents in the fraction).
>> The bulk of the patch is then updates to the testsuite to match our
>> new precision, as well as adding new cases we reject (whether they
>> were rejected or inadvertenly accepted before).
> 
> inadvertently
> 
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>
>> ---
>>
> 
> Is it a bad sign when I review my own code?
> 
>>
>>   /*
>> - * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
>> - * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
>> - * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
>> - * other error.
>> + * Convert size string to bytes.
>> + *
>> + * Allow either B/b for bytes, K/k for KB, M/m for MB, G/g for GB or
>> + * T/t for TB, with scaling based on @unit, and with @default_suffix
>> + * implied if no explicit suffix was given.
> 
> Reformatted existing text, but incomplete; we also support 'P' and 'E'.
> 
>> + *
>> + * The end pointer will be returned in *end, if not NULL.  If there is
>> + * no fraction, the input can be decimal or hexadecimal; if there is a
>> + * fraction, then the input must be decimal and there must be a suffix
>> + * (possibly by @default_suffix) larger than Byte, and the fractional
>> + * portion may suffer from precision loss or rounding.  The input must
>> + * be positive.
>> + *
>> + * Return -ERANGE on overflow (with *@end advanced), and -EINVAL on
>> + * other error (with *@end left unchanged).
> 
> If we take patch 2 and 3, this contract should also be updated to
> mention what we consider to be deprecated.
> 
>>    */
>>   static int do_strtosz(const char *nptr, const char **end,
>>                         const char default_suffix, int64_t unit,
>> @@ -253,40 +264,66 @@ static int do_strtosz(const char *nptr, const char **end,
>>       int retval;
>>       const char *endptr;
>>       unsigned char c;
>> -    int mul_required = 0;
>> -    double val, mul, integral, fraction;
>> +    bool mul_required = false;
>> +    uint64_t val;
>> +    int64_t mul;
>> +    double fraction = 0.0;
>>
>> -    retval = qemu_strtod_finite(nptr, &endptr, &val);
>> +    /* Parse integral portion as decimal. */
>> +    retval = qemu_strtou64(nptr, &endptr, 10, &val);
>>       if (retval) {
>>           goto out;
>>       }
>> -    fraction = modf(val, &integral);
>> -    if (fraction != 0) {
>> -        mul_required = 1;
>> +    if (strchr(nptr, '-') != NULL) {
>> +        retval = -ERANGE;
>> +        goto out;
>> +    }
>> +    if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
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
>> +            endptr = nptr;
>> +            retval = -EINVAL;
>> +            goto out;
>> +        }
>> +        if (fraction != 0) {
>> +            mul_required = true;
>> +        }
>>       }
>>       c = *endptr;
>>       mul = suffix_mul(c, unit);
>> -    if (mul >= 0) {
>> +    if (mul > 0) {
>>           endptr++;
>>       } else {
>>           mul = suffix_mul(default_suffix, unit);
>> -        assert(mul >= 0);
>> +        assert(mul > 0);
>>       }
>>       if (mul == 1 && mul_required) {
>> +        endptr = nptr;
>>           retval = -EINVAL;
>>           goto out;
>>       }
>> -    /*
>> -     * Values near UINT64_MAX overflow to 2**64 when converting to double
>> -     * precision.  Compare against the maximum representable double precision
>> -     * value below 2**64, computed as "the next value after 2**64 (0x1p64) in
>> -     * the direction of 0".
>> -     */
>> -    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
>> +    if (val > UINT64_MAX / mul) {
> 
> Hmm, do we care about:
> 15.9999999999999999999999999999E
> where the fractional portion becomes large enough to actually bump our
> sum below to 16E which indeed overflows?  Then again, we rejected a
> fraction of 1.0 above, and 0.9999999999999999999999999999 parses to 1.0
> due to rounding.
> Maybe it's just worth a good comment why the overflow check here works
> without consulting fraction.

worth a good comment, because I don't follow :)

If mul is big enough and fraction=0.5, why val*mul + fraction*mul will not overflow?

Also, if we find '.' in the number, why not just reparse the whole number with qemu_strtod_finite? And don't care about 1.0?

> 
>>           retval = -ERANGE;
>>           goto out;
>>       }
>> -    *result = val * mul;
>> +    *result = val * mul + (uint64_t) (fraction * mul);
>>       retval = 0;
>>
>>   out:


-- 
Best regards,
Vladimir

