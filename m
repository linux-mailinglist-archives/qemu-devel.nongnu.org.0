Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CBF3108EF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:23:45 +0100 (CET)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yHA-0004F0-Ly
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7yCc-0000L9-66; Fri, 05 Feb 2021 05:19:02 -0500
Received: from mail-eopbgr130097.outbound.protection.outlook.com
 ([40.107.13.97]:31297 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7yCV-00013w-JF; Fri, 05 Feb 2021 05:19:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQT+8oc8hJC5Xu0tuxyc7wEyo++f5cQ/iyebP0tpCE7/Y0Qgy4+HrFB/WrRo5d5lytAbFxe3oiJy/eL5cske8kfAr/fAz2putj4SZvhtncPxJwgkib7WtteRHGVPmdquL1SPTZpCfWJIhwhnS1XpFAkNBEZYTSyFQbmGl4kZU3pimYwZNUhPHyWdWxaouualKSfToPRO/5Zzufofd3ZF3u9zupmU7ktf0zEUAFEEeTY3yNorYneUKVmCR19o7N+9AJGq5XRN8FJH/d5n5CAoCnRv3m7XtXIAjnph1CsZ9wtNqniTHhvHi1HhoSCYVxzSaz+XbhZbcFNYUEVNYx5E3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qR2qgfMWRyuitV/4AErkgvGbE0VhODVkokQ4TxtPII4=;
 b=RcA86UNFAtqhrf8uQdDIz4eO4J3bypu+0rDi4dCoXy1PDSnj+rg6HhtBhqHjlsoCiKGHe5Ay9yGjBzZgeJvtZPJg2t5HAC8ZMG348H0XcweE3sL8I41SaXINib+PQXdFvN68I2e6IzmZHOqiwBCnZ7qNwvUDE14XTdXP1Clhmc0/yEYGdTlkBzfABsPQ+ETITkm3NUIZ5usyvi+3X31yf4cE1fbBoWHGP7w9ElDnPH6isqhxxBdrZO/LFGDLbJoHNA3vrug/UKGTNYncfsF7r8ffRefJlRsU5KVukkowlbjc7ojX4HbXujQW1aYneyTDSjA3WlrigVhA2UfLoKmqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qR2qgfMWRyuitV/4AErkgvGbE0VhODVkokQ4TxtPII4=;
 b=XQO19VEDTfZ++eWg7thCaTqzqHKD8KZJjoFX0UkRSvFCwALs7cNx2n9YU9/M8V+j+Im6x16bBPpHhK7mIqCT2gRgvcTmlIDXXEWOWu0lBcnpb3Q7RVHLHJmc7Kj9sH7uynFry9qoWobqQPWH+fEc168IsR/ldsjfjOPqxlbmCbs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4597.eurprd08.prod.outlook.com (2603:10a6:20b:90::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Fri, 5 Feb
 2021 10:18:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 10:18:52 +0000
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com,
 qemu-block@nongnu.org, tao3.xu@intel.com, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <a141ad8f-113e-b769-931a-767e0807a1f9@redhat.com>
 <21fcd50e-b5c2-d35c-0555-7d26014370ee@virtuozzo.com>
Message-ID: <addae936-44a8-11d4-add3-ba5bcb095fcf@virtuozzo.com>
Date: Fri, 5 Feb 2021 13:18:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <21fcd50e-b5c2-d35c-0555-7d26014370ee@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:208:154::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:208:154::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Fri, 5 Feb 2021 10:18:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef9bd618-e5ca-4896-27e7-08d8c9bf6f70
X-MS-TrafficTypeDiagnostic: AM6PR08MB4597:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45971C3B3A197ACAA28D7C5EC1B29@AM6PR08MB4597.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82cTwo6wt2pjb34UHic27fI+JOgx/7hC6qNE9uraCxE797zruZnnT7A08zISEs4P81HgBxq8v1bG0dN9ppXIsGx7qR1LjKUycITQufB7HtQCpREnGpaQSn+pvtGnUnUxAhcPOnuErUAwrtrmRdS9kV4VoUbp0h7bSXWtF1hEQ14/9fdyYNUrP7OTJsOl/smNNMIZ209pEXmqeQArXvKUFZRhMma1ybBYTuoY6P4C68Jcdh6zFvQsI/Uq5ov/ZdVeKSUt9CpOWIDpNCtiJlwpBi85V5bBGinHl5MYhsDveh2mNOpzSkwaM9TcpPCF3blr82oVPUsXlrYvMUfnBeGEp3rxnPIQTKNVZ90dADDDTKUE6UFIOg83sb5gcZ3/22QvTdnP84nMhumYIIazuC2m1ZcFyhGZJyPkJ5dt3zi/cfJ5elq4cGuXhEZRdBAUyyCSAt2WcKBDL9th9Nlbhu1sN6ShjTzuQGzzA/5ULtayowoYJ2kVUDqK6EL1Hy2uR+d/FqGjyf+p5xsz2Y2K9/D4d1Z5z6lv7/JrEo6b562vkmmQxaq5QzB8eRyWm8pH/CPoM+zoirO+vGS1WwAa2FRLFcPFcsnlkDCUr1S3hLesSEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(366004)(136003)(396003)(5660300002)(53546011)(316002)(6486002)(8676002)(4326008)(186003)(54906003)(16526019)(2616005)(8936002)(66476007)(83380400001)(478600001)(86362001)(52116002)(2906002)(16576012)(36756003)(31696002)(31686004)(956004)(66556008)(66946007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WHk5NjVNaFg0TGk1OHpFRjlrbEZhclR2TG9xbE44OUpaN0VVT2lvWlZxSm0z?=
 =?utf-8?B?cU1sVDFNekVVLzRDeDZsNnhNWk9xRVVjWjdHZ3dzYWpXRWhYTHE4YVh0N3po?=
 =?utf-8?B?S2NORmFjVDQ5ZXc3QzdaTzF6aG1QajhjQ2FCdG1XdVJqODF2ajZidnZVQXll?=
 =?utf-8?B?QUhtc0dGNk5JT2F1b1Q1VExERHg1angvVjVHYWsrZWx1WDNraGd6MURXUEZO?=
 =?utf-8?B?UVJvTUVvU1pJZmk5Ym1aSS90T3pMRXlOTFRydm5yR2MxcnZVUWNqQ0dzaDkr?=
 =?utf-8?B?SEhNMno0N2d2RVJtbE5MbDZnZ0R3blUvd1dNS014algrTnhLa0VLUTg5YzFS?=
 =?utf-8?B?L2Z2TFhGZkxWeVJMczFnbDBFVFpUUFRCQWN0QWVUUVo4QTJ0U2JhRzlsS0hR?=
 =?utf-8?B?TGJaNSszNWpqZjlDVEhaaFJVQkVEOEdoSWMwZ1V0b3lvcDM5SlpkenQyTTd6?=
 =?utf-8?B?TlhsamZXdmZpMk1qTWNEM2FNcnk5TWtSU3J6R2c1dzhJc3VrOFhheXRzUmxM?=
 =?utf-8?B?UGRnN1JKQng0eXpoVkRwV1lXOHQwRVNuMTFGR1hSY1BNNzltbkxCUXRtQ01S?=
 =?utf-8?B?UUhwazhncURuRkJkSUdLMFJTV1NPY3lpRFcvUFBESTB6UkI1MGx5WXFoMDB5?=
 =?utf-8?B?R3RPZEtLNW9aeDRKSzRhRGFoY3Jod3hPVGJLQjdLWWtESklnZTltdUx2dmFz?=
 =?utf-8?B?MndZNjdNaG83VE9TTHdOT1Ywc2x3ZGJxellkU2xoeVJzV1pmNkZmaDVudkRL?=
 =?utf-8?B?am9OWEp0Q2pyTlVyZUtMUThsWkRIcG4wUWVqSklJNUtkN3IvVmNieDdDOEd4?=
 =?utf-8?B?dytZaUs4RUVRd1JaTE84UTJ1V0pMRVlEQU82bWtZSFhPV2kyYVYzYzhYVlZH?=
 =?utf-8?B?TGJsNjRPeVFWT0g1dmplVHcwY24vSCtYT3Zza2p3QmhBL0xNdTl2MnEwaHNa?=
 =?utf-8?B?MUk5Skp3aDRYbm1kVWZMajFRNzZROGI1MGlnaWJHVzZ6VzV3MnpGTkNibjJ1?=
 =?utf-8?B?dlZOZWRVajNTVlVlUSsvSkFHQ2RxOE5LNUhHSGR6Vjc1SWlCVGc3QXV4TWt0?=
 =?utf-8?B?ZnFSZUlZNjg4dHBQNEFzV2VHeUV2aEdwcndQSkR0VG9IY21SYUlNYVdFSkEy?=
 =?utf-8?B?OGF4WmtNWEhwK2oyVkdwWnNYTjhmNEJCVVVsWlhuM1JicUVFTlYvYjhlSDhw?=
 =?utf-8?B?aFlob0dCM1F5Y3lEZThrUnpBUkR6ZlgySkhHVXpvV21NbytnblU2bWlTMmZQ?=
 =?utf-8?B?K0FzWWVUcEZLT3NuMWdwNzdUaWVua252TnZhZW5QZkRieHoxSU5uYWZ1TGxW?=
 =?utf-8?B?ZVA1dG42cnpCeFlocVhteHNMb0NHamFRNmJPRHF2SEZkL3hPVjNLWlgyTFBo?=
 =?utf-8?B?MTM1R1ZPOFUyR0VMWVlSNkQyemxMYkJiTWxBcCtxTkpFY1VqeEphV092UjJ3?=
 =?utf-8?B?Z2dZYXo1SGJlWU10ZUNhTERsZWhZbzJvT1pBTUNPcVM0b01LTWJLS0phb3Rr?=
 =?utf-8?B?cGpTMWxtUXRVN2wyMEVTcEhaVVRhNVk1aEJrTG9MdkRZSjFPNWZNRkQzWVR4?=
 =?utf-8?B?L0lQOXV4K3JsbTFCTEVNK2JrMStTMGZ4anVXMXZDc3RXRk1EemRjRUZTNHBn?=
 =?utf-8?B?QWVXOVZCSmVqYUcrQnNmTUJHVm1ES2RHaTBtSTh5bVBJWXdHV2VxYllHLzhF?=
 =?utf-8?B?eW1WeHRxbzRnV1kzOGo3ODFFMW51QW05ZHhCVlJrN1JZM05wSHpZL1V1Z3RH?=
 =?utf-8?Q?50h+bcLYE4miTNfoKpyc5YB+bGkAvmdOIxomYwD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9bd618-e5ca-4896-27e7-08d8c9bf6f70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:18:52.0593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jYD+hmRs8aJBoyz5DBVgOj1aCAdikd0TQdB9EhUhUSio+A5B3QkRq1J4MTKAiOA+vIx03fQQ7a/XlCXrWs85aQZ+V+4MN2Yp/EcrIlmWQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4597
Received-SPF: pass client-ip=40.107.13.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

05.02.2021 13:06, Vladimir Sementsov-Ogievskiy wrote:
> 04.02.2021 23:12, Eric Blake wrote:
>> On 2/4/21 1:07 PM, Eric Blake wrote:
>>> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
>>> the keyval visitor), and it gets annoying that edge-case testing is
>>> impacted by implicit rounding to 53 bits of precision due to parsing
>>> with strtod().  As an example posted by Rich Jones:
>>>   $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>>>     'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>>>   write failed: Input/output error
>>>
>>> because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
>>> out of bounds.
>>>
>>> It is also worth noting that our existing parser, by virtue of using
>>> strtod(), accepts decimal AND hex numbers, even though test-cutils
>>> previously lacked any coverage of the latter.  We do have existing
>>> clients that expect a hex parse to work (for example, iotest 33 using
>>> qemu-io -c "write -P 0xa 0x200 0x400"), but strtod() parses "08" as 8
>>> rather than as an invalid octal number, so we know there are no
>>> clients that depend on octal.  Our use of strtod() also means that
>>> "0x1.8k" would actually parse as 1536 (the fraction is 8/16), rather
>>> than 1843 (if the fraction were 8/10); but as this was not covered in
>>> the testsuite, I have no qualms forbidding hex fractions as invalid,
>>> so this patch declares that the use of fractions is only supported
>>> with decimal input, and enhances the testsuite to document that.
>>>
>>> Our previous use of strtod() meant that -1 parsed as a negative; now
>>> that we parse with strtoull(), negative values can wrap around module
>>
>> modulo
>>
>>> 2^64, so we have to explicitly check whether the user passed in a '-'.
>>>
>>> We also had no testsuite coverage of "1.1e0k", which happened to parse
>>> under strtod() but is unlikely to occur in practice; as long as we are
>>> making things more robust, it is easy enough to reject the use of
>>> exponents in a strtod parse.
>>>
>>> The fix is done by breaking the parse into an integer prefix (no loss
>>> in precision), rejecting negative values (since we can no longer rely
>>> on strtod() to do that), determining if a decimal or hexadecimal parse
>>> was intended (with the new restriction that a fractional hex parse is
>>> not allowed), and where appropriate, using a floating point fractional
>>> parse (where we also scan to reject use of exponents in the fraction).
>>> The bulk of the patch is then updates to the testsuite to match our
>>> new precision, as well as adding new cases we reject (whether they
>>> were rejected or inadvertenly accepted before).
>>
>> inadvertently
>>
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>>
>>> ---
>>>
>>
>> Is it a bad sign when I review my own code?
>>
>>>
>>>   /*
>>> - * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
>>> - * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
>>> - * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
>>> - * other error.
>>> + * Convert size string to bytes.
>>> + *
>>> + * Allow either B/b for bytes, K/k for KB, M/m for MB, G/g for GB or
>>> + * T/t for TB, with scaling based on @unit, and with @default_suffix
>>> + * implied if no explicit suffix was given.
>>
>> Reformatted existing text, but incomplete; we also support 'P' and 'E'.
>>
>>> + *
>>> + * The end pointer will be returned in *end, if not NULL.  If there is
>>> + * no fraction, the input can be decimal or hexadecimal; if there is a
>>> + * fraction, then the input must be decimal and there must be a suffix
>>> + * (possibly by @default_suffix) larger than Byte, and the fractional
>>> + * portion may suffer from precision loss or rounding.  The input must
>>> + * be positive.
>>> + *
>>> + * Return -ERANGE on overflow (with *@end advanced), and -EINVAL on
>>> + * other error (with *@end left unchanged).
>>
>> If we take patch 2 and 3, this contract should also be updated to
>> mention what we consider to be deprecated.
>>
>>>    */
>>>   static int do_strtosz(const char *nptr, const char **end,
>>>                         const char default_suffix, int64_t unit,
>>> @@ -253,40 +264,66 @@ static int do_strtosz(const char *nptr, const char **end,
>>>       int retval;
>>>       const char *endptr;
>>>       unsigned char c;
>>> -    int mul_required = 0;
>>> -    double val, mul, integral, fraction;
>>> +    bool mul_required = false;
>>> +    uint64_t val;
>>> +    int64_t mul;
>>> +    double fraction = 0.0;
>>>
>>> -    retval = qemu_strtod_finite(nptr, &endptr, &val);
>>> +    /* Parse integral portion as decimal. */
>>> +    retval = qemu_strtou64(nptr, &endptr, 10, &val);
>>>       if (retval) {
>>>           goto out;
>>>       }
>>> -    fraction = modf(val, &integral);
>>> -    if (fraction != 0) {
>>> -        mul_required = 1;
>>> +    if (strchr(nptr, '-') != NULL) {
>>> +        retval = -ERANGE;
>>> +        goto out;
>>> +    }
>>> +    if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
>>> +        /* Input looks like hex, reparse, and insist on no fraction. */
>>> +        retval = qemu_strtou64(nptr, &endptr, 16, &val);
>>> +        if (retval) {
>>> +            goto out;
>>> +        }
>>> +        if (*endptr == '.') {
>>> +            endptr = nptr;
>>> +            retval = -EINVAL;
>>> +            goto out;
>>> +        }
>>> +    } else if (*endptr == '.') {
>>> +        /* Input is fractional, insist on 0 <= fraction < 1, with no exponent */
>>> +        retval = qemu_strtod_finite(endptr, &endptr, &fraction);
>>> +        if (retval) {
>>> +            endptr = nptr;
>>> +            goto out;
>>> +        }
>>> +        if (fraction >= 1.0 || memchr(nptr, 'e', endptr - nptr)
>>> +            || memchr(nptr, 'E', endptr - nptr)) {
>>> +            endptr = nptr;
>>> +            retval = -EINVAL;
>>> +            goto out;
>>> +        }
>>> +        if (fraction != 0) {
>>> +            mul_required = true;
>>> +        }
>>>       }
>>>       c = *endptr;
>>>       mul = suffix_mul(c, unit);
>>> -    if (mul >= 0) {
>>> +    if (mul > 0) {
>>>           endptr++;
>>>       } else {
>>>           mul = suffix_mul(default_suffix, unit);
>>> -        assert(mul >= 0);
>>> +        assert(mul > 0);
>>>       }
>>>       if (mul == 1 && mul_required) {
>>> +        endptr = nptr;
>>>           retval = -EINVAL;
>>>           goto out;
>>>       }
>>> -    /*
>>> -     * Values near UINT64_MAX overflow to 2**64 when converting to double
>>> -     * precision.  Compare against the maximum representable double precision
>>> -     * value below 2**64, computed as "the next value after 2**64 (0x1p64) in
>>> -     * the direction of 0".
>>> -     */
>>> -    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
>>> +    if (val > UINT64_MAX / mul) {
>>
>> Hmm, do we care about:
>> 15.9999999999999999999999999999E
>> where the fractional portion becomes large enough to actually bump our
>> sum below to 16E which indeed overflows?  Then again, we rejected a
>> fraction of 1.0 above, and 0.9999999999999999999999999999 parses to 1.0
>> due to rounding.
>> Maybe it's just worth a good comment why the overflow check here works
>> without consulting fraction.
> 
> worth a good comment, because I don't follow :)
> 
> If mul is big enough and fraction=0.5, why val*mul + fraction*mul will not overflow?
> 
> Also, if we find '.' in the number, why not just reparse the whole number with qemu_strtod_finite? And don't care about 1.0?

Ah understand now, because mul is a power of two, so 2^64 - (val * mul) >= mul. Still, is it possible that (due to float calculations limited precision) some double close to 1 (but still < 1.0) being multiplied to mul will result in something >= mul?

Also I failed to understand what you write because I forget about E=exbibyte and thought only about exponent

> 
>>
>>>           retval = -ERANGE;
>>>           goto out;
>>>       }
>>> -    *result = val * mul;
>>> +    *result = val * mul + (uint64_t) (fraction * mul);
>>>       retval = 0;
>>>
>>>   out:
> 
> 


-- 
Best regards,
Vladimir

