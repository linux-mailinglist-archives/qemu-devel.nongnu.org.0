Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3063108BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:11:41 +0100 (CET)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7y5U-0006rD-EJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7y2J-00053Z-I1; Fri, 05 Feb 2021 05:08:23 -0500
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:57889 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7y27-0004mL-2u; Fri, 05 Feb 2021 05:08:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiBTh22z5MzmnwEjiLmGEsOlDkLxOt5fyv+2G8Pz+Ox5pNd+QaMYS/4MMyBwuM+/clqT/ObELASBzCkUSWkyu9B56smPdDjaKGKftYVFa/cK5qcnEhfPWB767LvPSP7ZsHPc8wL21KDpYvJAajU7Ar+sAOHHWAnQ5Q24smF4WTGJ9jx0grSdlD/GeWLqT1FwuQuHNe4+i2/kh8HfcobcOrzQvKF1p28lcSNdxyWA6fyeXxcn6SxDUIngPhcZ9fG+LPk0F8oUE5ibfmHoscLK39balSi4kLkNEc0Ys1MVJh7fx18S+Wu6ER4tfsf/tJpdbyaaPICAwBRmro3g/L+akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHN19oro3A6blAiwbkuydI7LzdgYHO/HnzLrg3kjZMY=;
 b=BG4QlqT0US1xKNia3FJNAwnfkZHumfMkS3+9t0Vmrs1QlZ5lMC1v8OP8N5k9NGOrJtpB46cKj0qvFindktphVAbcdRMmlmsNDZa0dTg8WSmjbLk3+JExW3JrwMpi/6L66FsYketCIoH3YkJCYTm1m0PZnHmLyOshdstcgwEGRe3w2oKh9PpGEmCvNkXq1ZX4riyQ/jlS+zjUs5G/tYbJ9bgAFUoFzRQTByavPY4wCRI5rv668111LnWmiXE+0a54x87Z91dnshCOOjWwEC4oQkDAW0m8qtnSFh6cUcbqMkaWH6qKKupxY1J+oI1zXEfRfWZexXeHEcrRULGFciV4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHN19oro3A6blAiwbkuydI7LzdgYHO/HnzLrg3kjZMY=;
 b=WwjicKF7N4ffvhOOaxofaaLm7r2eOh3ek6N1DbbqE9eUx6CHz+kPvlH0nPKQ7ZroM9GBpWTZHBfblR8qMAAD/L/yWTkiutJpTIrXwY5QX5RlFMeMQ/H5n0hgmXKLDl8EjIO5pmup3CckQ88AYZ7Ctm0u/+6XzRUUtK+pQx7qPAY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4213.eurprd08.prod.outlook.com (2603:10a6:20b:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Fri, 5 Feb
 2021 10:07:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 10:07:59 +0000
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: rjones@redhat.com, berrange@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, tao3.xu@intel.com, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <da4f6b38-d489-ee83-1661-fec41903dd75@virtuozzo.com>
Date: Fri, 5 Feb 2021 13:07:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204190708.1306296-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR02CA0211.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR02CA0211.eurprd02.prod.outlook.com (2603:10a6:20b:28f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend
 Transport; Fri, 5 Feb 2021 10:07:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b787c859-58a9-47e9-b49f-08d8c9bdea8a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4213:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4213D53121B4B7D0EE2446B2C1B29@AM6PR08MB4213.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAxLVsC+7qljo0qTAHzzZE2b+aOrnduldsDDEWOCe4bXj0WfPSqcfu7KO8PhaMm+SMVOP+eO/29gTsAHH0CtAMZSixMfuyEKdIYJh0nRjgIRslPfwzLksBfuVzxZ0Sdlk9JtOHMlaSn3okOzAK0tGYuozBmJNgL4R2utKA/cOiB/Pz+R1R6cgZmSts1unVWF3OGqBph9FrgaN7tbvP0ftfr6sbkqjIF3TUfjT3eMsdudrRgj+K6C5ecluY0ZSI/udBmoRpupxokxQsAki8kTOEt4Mv202LjMxDGF+3Kn30QmNSfchDKaC2yJPOx4bMqhv7FRVyS0GunDNkYHroxqPDBh51+uAw3KqQthlfe7WZ1s9xwgAS4gWUug3zRZB0ungrd+yALxE9V1SdbVrI8NEIeHpCidNsZQfUgIlnsd0pCnKK1D2xUdjnaoYJcFi6GxkvRvEMVDxriEeTI06PsN0hxX/9XUXt+BA4qRddoLVPYVvRGXdNdmEpSC6WpqKA/Tg7yiQp7V7fTwj7ePT4kCsnUzP1kGk1mijGzLps13UjcJva8/JB2n/b1fX/TAcnobff51/AWd8p2zkKe4CpTfy4n9lrKTvAqlaQmIBqVAnKuYGyZKKmrcGpawkQeiQm835s4EG6OiR/N75IICcTLsA2O+WnePRt60hIUnJCg0UbO28gi3aDwZ5A6ycVwWWlh5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(136003)(376002)(346002)(2906002)(186003)(8676002)(54906003)(4326008)(478600001)(316002)(16576012)(16526019)(83380400001)(26005)(36756003)(66476007)(52116002)(66556008)(86362001)(30864003)(2616005)(31696002)(5660300002)(31686004)(956004)(66946007)(6486002)(966005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjBmS0JrRXZDei9Yck8wUWJXcDErQzNrK1h3aUdKczh4OVpmTS9pY2M2VmxD?=
 =?utf-8?B?WTlmNUVaRHc1SXVZSUIvdGRJenI1NVdKZkd1aTBiN1N6SE9CMTJXM004RmFl?=
 =?utf-8?B?b1dZNG5PUDRXV2htVjNkWjRTaWVzWE9hcXE1VmJySzVha0Vod2RxdGFEUTFC?=
 =?utf-8?B?a1AzelAxdXV6NDV2S3Qxbi9ZT2RHWDc4My9JZXJuRE1sWVMvZEt2UWNOYVE1?=
 =?utf-8?B?VSt1d2tFNjM1QVU3U05LTXRiVDJBT2JaWWo5emlIdkpVcFRMREZJendiaEly?=
 =?utf-8?B?U2NFUVhnMFlIWnlMRFMzSExkMjk5dWpqdDFWUWdtemdNSDZSVlZpaFFxT1di?=
 =?utf-8?B?MHBpU04zdXFzUU5nUytyejdCeVJ2aVh2VURkOEVXWTMzaXowZWV3ZEdsNGd4?=
 =?utf-8?B?Q0Nzcjh0blgvRWxvVkNUdkpkWHdIbTVtZHRJUFh3bVpxS1RtVG9XRHpSSnpn?=
 =?utf-8?B?cWlieXdLZlVvNWZONnhFbVlUU2ZQL0xDYjB2d2NEcmJlckJDcmIvaEhyY3pv?=
 =?utf-8?B?T29LTmJWUnJPcVJ1cXlDRTY1V0Q3TEpYQ1RoeWx6Y1o0WUV3N3VRb1JBblUz?=
 =?utf-8?B?OGlWZmR4MlBsaXpURVZFMVVPbVFZZnNIVUxvVmd3ck5HM0dlN2wrVDhFVGxZ?=
 =?utf-8?B?SGd4clNpc0dwYm5HRk5xb2Rwd3loM2JUeUNhVkNpOHdkeG81VERiemNjejkv?=
 =?utf-8?B?MVJiNXB0Um5rWndBa01KeEdBVGl2T2hPcTlueStFMXUzTXhaamozYzNZQThw?=
 =?utf-8?B?c2l1KzJTZVBlTithN3JKVmc1TWFtYVpORHNWYjlmZW9NZTBqaGJNdzFybjd3?=
 =?utf-8?B?dVZXRUthMnJjT0FkNmZjbWRSQ2s5ODZoZk80bDJTeW15M3JJelVoSGdaWGFu?=
 =?utf-8?B?OWZEV1N4RmZMMDh3WkRrUG5WMkcyRTlXOHFXOGZzZFlCaU5oWHFZaWtxSVN6?=
 =?utf-8?B?Y2xVSGUrUmhMSUxaM1AyNHlVOGlIby9MT2NrVlRUa1hQZUxYWFhsWEt3VTJO?=
 =?utf-8?B?VFdETFFSajBxYkE5NVlYbnplVHA1Yi9VbUcvSWc2Vm9KRC9YcVMvbGI1SHlJ?=
 =?utf-8?B?bXBWVlgxTkFtSlpUbXV2L0dYR0FXWFJEK3FPQXpjT1R3YWl1VUtwNUx3ZnZm?=
 =?utf-8?B?VGFGUG8yeHUvejdmYVRYT3hBVTVMN0xxU2l0SXhybUlzVHRmT3RHTHU0dDRx?=
 =?utf-8?B?dS9RVnpjU2JyVkdWVjArM1ZQU09jbVRad1JqVHUzLzJnK1BnMG41cytVMHVR?=
 =?utf-8?B?WGVuZVg5YVVZSmxJVys4OVVFTzZqTXRyRjQ4RVhycW4zMHRVMUpJNHk2SFRp?=
 =?utf-8?B?MnlYOTUydXpnTmNJZVBKUjExa0hLbWtWQWpNQkxKTzlJZEZmaTBBcXpzL1R1?=
 =?utf-8?B?WDdiRWl5WklDZDd1RjQydXZ3RHVvTHh1VmkveUh4UjNHK0xBcXNKc1hieENt?=
 =?utf-8?B?ZGdtbTl0RVZFbFFIOWlhZXVPZFllbmdrL0pTTm9kZW1ma2M3b1V0d3pGUnoz?=
 =?utf-8?B?UTRSanZNZGFsbkROOExYT0I1RlNDZi9VbXgwa1V4NWVJZmtFeThNQm1BeW1n?=
 =?utf-8?B?eEVFUVcxM1BjNi9XOTJZRVU1eDNCOVRGTkhwMS80WWdnYjI2bmZ2dFhiV1JF?=
 =?utf-8?B?R3d1OERjanQ5VmJHTStYOW4xN0R3ZlltZ2ZyM1c4aFpTZCt2QTJZNzJCdE9h?=
 =?utf-8?B?ZVdsQzBoUzFQTm9tQWFtc2c2a0pqK1BMUStzbDZic2NmMnV0QWRnM05rdzdX?=
 =?utf-8?Q?ZvaggzgEflsJ9KBCNIImsdYdkoLWDHCye2YfEhj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b787c859-58a9-47e9-b49f-08d8c9bdea8a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:07:59.5319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OX0jX98y54u1WQamR0qoKJ7OcyfKgQC+ouVEYpvZ2+HrDbpui1gbmBfPI//k8s1ZFyIx/UFXxpUMM1RgeIfEwdJrGeU0hXbfTk+8f/ME6Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4213
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

04.02.2021 22:07, Eric Blake wrote:
> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
> the keyval visitor), and it gets annoying that edge-case testing is
> impacted by implicit rounding to 53 bits of precision due to parsing
> with strtod().  As an example posted by Rich Jones:
>   $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>     'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>   write failed: Input/output error
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
>   tests/test-cutils.c        | 79 ++++++++++++++++++++++++++++++--------
>   tests/test-keyval.c        | 24 +++++++++---
>   tests/test-qemu-opts.c     | 20 +++++++---
>   util/cutils.c              | 77 +++++++++++++++++++++++++++----------
>   tests/qemu-iotests/049.out |  7 +++-
>   5 files changed, 156 insertions(+), 51 deletions(-)
> 
> diff --git a/tests/test-cutils.c b/tests/test-cutils.c
> index 1aa8351520ae..0c2c89d6f113 100644
> --- a/tests/test-cutils.c
> +++ b/tests/test-cutils.c
> @@ -1960,6 +1960,13 @@ static void test_qemu_strtosz_simple(void)
>       g_assert_cmpint(res, ==, 0);
>       g_assert(endptr == str + 1);
> 
> +    /* Leading 0 gives decimal results, not octal */
> +    str = "08";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpint(res, ==, 8);
> +    g_assert(endptr == str + 2);
> +
>       str = "12345";
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> @@ -1970,7 +1977,7 @@ static void test_qemu_strtosz_simple(void)
>       g_assert_cmpint(err, ==, 0);
>       g_assert_cmpint(res, ==, 12345);
> 
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> +    /* Note: If there is no '.', we get full 64 bits of precision */
> 
>       str = "9007199254740991"; /* 2^53-1 */
>       err = qemu_strtosz(str, &endptr, &res);
> @@ -1987,7 +1994,7 @@ static void test_qemu_strtosz_simple(void)
>       str = "9007199254740993"; /* 2^53+1 */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0x20000000000000); /* rounded to 53 bits */
> +    g_assert_cmpint(res, ==, 0x20000000000001);
>       g_assert(endptr == str + 16);
> 
>       str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
> @@ -1999,11 +2006,35 @@ static void test_qemu_strtosz_simple(void)
>       str = "18446744073709550591"; /* 0xfffffffffffffbff */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 0xfffffffffffff800); /* rounded to 53 bits */
> +    g_assert_cmpint(res, ==, 0xfffffffffffffbff);
>       g_assert(endptr == str + 20);
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
>   }
> 
>   static void test_qemu_strtosz_units(void)
> @@ -2106,6 +2137,21 @@ static void test_qemu_strtosz_invalid(void)
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, -EINVAL);
>       g_assert(endptr == str);
> +
> +    str = "1.1e5";
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert(endptr == str);

I'd add also test with 'E'

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

ha this function looks like it should have

const cher *str[] = ["", " \t ", ... "0x1.8k"]

and all cases in a for()... and all other test cases may be ... Oh, I should say myself "don't refactor everything you see".

>   }
> 
>   static void test_qemu_strtosz_trailing(void)
> @@ -2145,17 +2191,7 @@ static void test_qemu_strtosz_erange(void)
>       g_assert_cmpint(err, ==, -ERANGE);
>       g_assert(endptr == str + 2);
> 
> -    str = "18446744073709550592"; /* 0xfffffffffffffc00 */
> -    err = qemu_strtosz(str, &endptr, &res);
> -    g_assert_cmpint(err, ==, -ERANGE);
> -    g_assert(endptr == str + 20);
> -
> -    str = "18446744073709551615"; /* 2^64-1 */
> -    err = qemu_strtosz(str, &endptr, &res);
> -    g_assert_cmpint(err, ==, -ERANGE);
> -    g_assert(endptr == str + 20);
> -
> -    str = "18446744073709551616"; /* 2^64 */
> +    str = "18446744073709551616"; /* 2^64; see strtosz_simple for 2^64-1 */
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, -ERANGE);
>       g_assert(endptr == str + 20);
> @@ -2168,15 +2204,22 @@ static void test_qemu_strtosz_erange(void)
> 
>   static void test_qemu_strtosz_metric(void)
>   {
> -    const char *str = "12345k";
> +    const char *str;
>       int err;
>       const char *endptr;
>       uint64_t res = 0xbaadf00d;
> 
> +    str = "12345k";
>       err = qemu_strtosz_metric(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
>       g_assert_cmpint(res, ==, 12345000);
>       g_assert(endptr == str + 6);
> +
> +    str = "12.345M";
> +    err = qemu_strtosz_metric(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, 0);
> +    g_assert_cmpint(res, ==, 12345000);
> +    g_assert(endptr == str + 7);
>   }
> 
>   int main(int argc, char **argv)
> @@ -2443,6 +2486,8 @@ int main(int argc, char **argv)
> 
>       g_test_add_func("/cutils/strtosz/simple",
>                       test_qemu_strtosz_simple);
> +    g_test_add_func("/cutils/strtosz/hex",
> +                    test_qemu_strtosz_hex);
>       g_test_add_func("/cutils/strtosz/units",
>                       test_qemu_strtosz_units);
>       g_test_add_func("/cutils/strtosz/float",
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index ee927fe4e427..13be763650b2 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -445,9 +445,9 @@ static void test_keyval_visit_size(void)
>       visit_end_struct(v, NULL);
>       visit_free(v);
> 
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> +    /* Note: full 64 bits of precision */
> 
> -    /* Around limit of precision: 2^53-1, 2^53, 2^53+1 */
> +    /* Around double limit of precision: 2^53-1, 2^53, 2^53+1 */
>       qdict = keyval_parse("sz1=9007199254740991,"
>                            "sz2=9007199254740992,"
>                            "sz3=9007199254740993",
> @@ -460,7 +460,7 @@ static void test_keyval_visit_size(void)
>       visit_type_size(v, "sz2", &sz, &error_abort);
>       g_assert_cmphex(sz, ==, 0x20000000000000);
>       visit_type_size(v, "sz3", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x20000000000000);
> +    g_assert_cmphex(sz, ==, 0x20000000000001);
>       visit_check_struct(v, &error_abort);
>       visit_end_struct(v, NULL);
>       visit_free(v);
> @@ -475,7 +475,7 @@ static void test_keyval_visit_size(void)
>       visit_type_size(v, "sz1", &sz, &error_abort);
>       g_assert_cmphex(sz, ==, 0x7ffffffffffffc00);
>       visit_type_size(v, "sz2", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0x7ffffffffffffc00);
> +    g_assert_cmphex(sz, ==, 0x7ffffffffffffdff);
>       visit_check_struct(v, &error_abort);
>       visit_end_struct(v, NULL);
>       visit_free(v);
> @@ -490,14 +490,26 @@ static void test_keyval_visit_size(void)
>       visit_type_size(v, "sz1", &sz, &error_abort);
>       g_assert_cmphex(sz, ==, 0xfffffffffffff800);
>       visit_type_size(v, "sz2", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, 0xfffffffffffff800);
> +    g_assert_cmphex(sz, ==, 0xfffffffffffffbff);
> +    visit_check_struct(v, &error_abort);
> +    visit_end_struct(v, NULL);
> +    visit_free(v);
> +
> +    /* Actual limit */
> +    qdict = keyval_parse("sz1=18446744073709551615", /* ffffffffffffffff */
> +                         NULL, NULL, &error_abort);
> +    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
> +    qobject_unref(qdict);
> +    visit_start_struct(v, NULL, NULL, 0, &error_abort);
> +    visit_type_size(v, "sz1", &sz, &error_abort);
> +    g_assert_cmphex(sz, ==, 0xffffffffffffffff);
>       visit_check_struct(v, &error_abort);
>       visit_end_struct(v, NULL);
>       visit_free(v);
> 
>       /* Beyond limits */
>       qdict = keyval_parse("sz1=-1,"
> -                         "sz2=18446744073709550592", /* fffffffffffffc00 */
> +                         "sz2=18446744073709551616", /* 2^64 */
>                            NULL, NULL, &error_abort);
>       v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>       qobject_unref(qdict);
> diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
> index 8bbb17b1c726..f79b698e6715 100644
> --- a/tests/test-qemu-opts.c
> +++ b/tests/test-qemu-opts.c
> @@ -654,9 +654,9 @@ static void test_opts_parse_size(void)
>       g_assert_cmpuint(opts_count(opts), ==, 1);
>       g_assert_cmpuint(qemu_opt_get_size(opts, "size1", 1), ==, 0);
> 
> -    /* Note: precision is 53 bits since we're parsing with strtod() */
> +    /* Note: full 64 bits of precision */
> 
> -    /* Around limit of precision: 2^53-1, 2^53, 2^54 */
> +    /* Around double limit of precision: 2^53-1, 2^53, 2^53+1 */
>       opts = qemu_opts_parse(&opts_list_02,
>                              "size1=9007199254740991,"
>                              "size2=9007199254740992,"
> @@ -668,7 +668,7 @@ static void test_opts_parse_size(void)
>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
>                        ==, 0x20000000000000);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size3", 1),
> -                     ==, 0x20000000000000);
> +                     ==, 0x20000000000001);
> 
>       /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */

should fix comment?

>       opts = qemu_opts_parse(&opts_list_02,
> @@ -679,7 +679,7 @@ static void test_opts_parse_size(void)
>       g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
>                        ==, 0x7ffffffffffffc00);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
> -                     ==, 0x7ffffffffffffc00);
> +                     ==, 0x7ffffffffffffdff);
> 
>       /* Close to actual upper limit 0xfffffffffffff800 (53 msbs set) */

and here?

and probably in a previous file

>       opts = qemu_opts_parse(&opts_list_02,
> @@ -690,14 +690,22 @@ static void test_opts_parse_size(void)
>       g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
>                        ==, 0xfffffffffffff800);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
> -                     ==, 0xfffffffffffff800);
> +                     ==, 0xfffffffffffffbff);
> +
> +    /* Actual limit */
> +    opts = qemu_opts_parse(&opts_list_02,
> +                           "size1=18446744073709551615", /* ffffffffffffffff */
> +                           false, &error_abort);
> +    g_assert_cmpuint(opts_count(opts), ==, 1);
> +    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
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

Test modifications above all looks OK.

> diff --git a/util/cutils.c b/util/cutils.c
> index 0b5073b33012..0234763bd70b 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -241,10 +241,21 @@ static int64_t suffix_mul(char suffix, int64_t unit)
>   }
> 
>   /*
> - * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
> - * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
> - * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
> - * other error.
> + * Convert size string to bytes.
> + *
> + * Allow either B/b for bytes, K/k for KB, M/m for MB, G/g for GB or
> + * T/t for TB, with scaling based on @unit, and with @default_suffix
> + * implied if no explicit suffix was given.
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
>    */
>   static int do_strtosz(const char *nptr, const char **end,
>                         const char default_suffix, int64_t unit,
> @@ -253,40 +264,66 @@ static int do_strtosz(const char *nptr, const char **end,
>       int retval;
>       const char *endptr;
>       unsigned char c;
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
>       if (retval) {
>           goto out;
>       }
> -    fraction = modf(val, &integral);
> -    if (fraction != 0) {
> -        mul_required = 1;
> +    if (strchr(nptr, '-') != NULL) {
> +        retval = -ERANGE;
> +        goto out;
> +    }

Hmm, I have a question: does do_strtosz assumes that the whole nptr string is a number?

If yes, then I don't understand what the matter of **end OUT-argument.

If not, this if() is wrong, as you'll redject parsing first number of "123425 -  2323" string..

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
>       }
>       c = *endptr;
>       mul = suffix_mul(c, unit);
> -    if (mul >= 0) {
> +    if (mul > 0) {
>           endptr++;
>       } else {
>           mul = suffix_mul(default_suffix, unit);
> -        assert(mul >= 0);
> +        assert(mul > 0);
>       }
>       if (mul == 1 && mul_required) {
> +        endptr = nptr;
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
> +    if (val > UINT64_MAX / mul) {
>           retval = -ERANGE;
>           goto out;
>       }
> -    *result = val * mul;
> +    *result = val * mul + (uint64_t) (fraction * mul);
>       retval = 0;
> 
>   out:
> diff --git a/tests/qemu-iotests/049.out b/tests/qemu-iotests/049.out
> index b1d8fd9107ef..f38d3ccd5978 100644
> --- a/tests/qemu-iotests/049.out
> +++ b/tests/qemu-iotests/049.out
> @@ -98,10 +98,13 @@ qemu-img create -f qcow2 -o size=-1024 TEST_DIR/t.qcow2
>   qemu-img: TEST_DIR/t.qcow2: Value '-1024' is out of range for parameter 'size'
> 
>   qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- -1k
> -qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
> +qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
> +qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.
> 
>   qemu-img create -f qcow2 -o size=-1k TEST_DIR/t.qcow2
> -qemu-img: TEST_DIR/t.qcow2: Value '-1k' is out of range for parameter 'size'
> +qemu-img: TEST_DIR/t.qcow2: Parameter 'size' expects a non-negative number below 2^64
> +Optional suffix k, M, G, T, P or E means kilo-, mega-, giga-, tera-, peta-
> +and exabytes, respectively.
> 
>   qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- 1kilobyte
>   qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
> 


-- 
Best regards,
Vladimir

