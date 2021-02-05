Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3931094D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:40:45 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yXc-0004nC-9c
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7yVY-0003Mf-Sv; Fri, 05 Feb 2021 05:38:38 -0500
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:58606 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7yVW-0001Xw-6j; Fri, 05 Feb 2021 05:38:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCGtwKq9N593lp9ZtMvtU3eqIuVw4o/2y17l5PMQ7xdTcYINrEr8E321nRWpRZEz6+iKb752II/uCwG5qKBvx3+ubcClLbVZH9PR2H9AkKlhoX2fOlIeWoMX9uN8M+h/cNSM6CcwfEugSGONK7t1zEqTVxELQ5Zpzazuk5dyGmSTjC/7wnYatztQ73jWBtwhB34R7x+rBUDO7wsogheyu9WOM/UPt7k/YAIFWwEP80DPUy0SORub4WEln+wAIzeFuU2SnGAo290xKsSehbpG7V7YKBif4P19cIKffUz4LjxELgX0j3bSGaHRh5viTNK2Van0e2Ftoe0UA/2DgL8M/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FRqDsgrJX/EB6YX9BEeX5Ci9DUeU300JSmmS6WvHp4=;
 b=Hc29RQOSKtgyg7dFyjzCukRigB8V6IVLPrfxAIQ9EPI5Eh194U2WUAbXb/rmwGs8aWvvYnoLBudcRICwdjgmGPfVAJ5Z+IFXSPG3Cu2PyFOtZh24sAo8esHHoKtHu6/lA1xz2VYF+jucaECmUSZHM+0QysWgG2V4M0DqMnhme7Qk+PQA8T98Pdflcf0uMiRtwu6EdSbQs/LYBemwWRqJoAYgIK22EA7nD5AgrpsRwua8B1P8vr49ZcOtPQq/ZHtBxIo1M4Ftx0P/QflCttdmEr3KQsj05bh17qxQIfn6vHuSnxxrXoIkgXMlYanvXCOGaz1L+5N7G2Bmyxz6SxunXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FRqDsgrJX/EB6YX9BEeX5Ci9DUeU300JSmmS6WvHp4=;
 b=hdiqbbcs6yy2+4Lcqy4m18FFNrp3YTdw4ONeM5qQRSeaU71Oqi8XIO5nKsbC7lXvJxJ1bjDlqtyz8jSCHRmOvCOQ2Z8ZLGS4BcPsdiCcIp5BS28RqxSXJDAOjBuaLi4bbNzpMT8APd5dDacbRxRgWrvLQmtcenS3rTu+DK8tPpM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3445.eurprd08.prod.outlook.com (2603:10a6:20b:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 10:38:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 10:38:30 +0000
Subject: Re: [PATCH 3/3] utils: Deprecate inexact fractional suffix sizes
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: rjones@redhat.com, berrange@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, tao3.xu@intel.com
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-4-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5d89494d-7ef3-043b-61eb-58d0a49b97a7@virtuozzo.com>
Date: Fri, 5 Feb 2021 13:38:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204190708.1306296-4-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 10:38:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ddf922c-31d0-411b-9257-08d8c9c22df9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3445:
X-Microsoft-Antispam-PRVS: <AM6PR08MB34459A54954DD43424990584C1B29@AM6PR08MB3445.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVptQA0ILMEx0sunqDfTH7OLO7NxTWfDNCqIoIJqIq9cLXNHGFEJ1UdLgxBum3X5RxjaA4ye6qPSKK4jcdfTqTs9j3H8Y/5Ux7mqQ1hTW0m1jQ7ceHQBjVTFTeFdiJWxWqDyNSEAf/530PDvU6Lm6AAXUwKxGGf7UXvPX+6lvA1v2vCDtVDxB6vJkP90oVjwFSRonfQZK37KCQ4cI0fMTGL/1nY3HVIAjsnKYtAGou0whu2li8vsVx45P3qaO8d08+YtfGh7AGG1j/N47l1b4ANgEDQTi5aPO9v0QqTmwBBzCLUnmE6IzsIa1lMOZp2/SNme4kxK8W1UUp/iPW0LKKjQ2Tdu37gW2hP5rI+mCZWh/FwJK22Xq65ffMwuVZABo8iKpG1MLsCzWZnExXPFlARC1aUN2KDUnkBK4mHZKxtValLZQhdkdejzR+er6PXCGv2yPGAmUk/coN7FBpCVzg5hYd5mbiDzqMezMC7Qvg12wofI//u0rT6YgxZIyV71D+1APTnqpKimJyEZTB9IwLw0y9aKfGXZcHMrF19TS2+LNlKuOX7yNevNWZnvEnofY1jLjyyQ7+cfRq1nzx1q6QQ/VCnqAQTZ1FHLREwQBo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39840400004)(346002)(376002)(956004)(83380400001)(31686004)(2616005)(16576012)(36756003)(316002)(478600001)(8936002)(2906002)(66476007)(66946007)(66556008)(5660300002)(52116002)(4326008)(6486002)(186003)(26005)(16526019)(31696002)(86362001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TlNraFRJZlBTbko3bUF1YUtLUUFjTGc5L0JjWnl2SVRlaFpaUU1ockJ2RU1Z?=
 =?utf-8?B?TmwrTER1WlRXTkFhQlVXMG5MajBiT0dtcWpkUEJMZ2tjeUt6amk2aEYvdEd3?=
 =?utf-8?B?b1lXb0RsV2ppb2VockVqVWUvQkhOUDFoc3ZPU1Vta1dXTUxKaEhleHZQWFlt?=
 =?utf-8?B?Q0tjVUoyVFlPdXM4Y24weGFiVVN3UEdRdGdtSFdZSmZvaVh3eHJ6UDBZR1lJ?=
 =?utf-8?B?TUtyL2wwNXRnbHQ1cWRmZ0JkY25jNzRxMnBVRnYyeEZCY2FRQ3pvekQ0STFG?=
 =?utf-8?B?VUhJT3RQbFZmZHBxSlpvQUloVEFvMU9XSFZSOE9FN09kVE5tMXVmaC9uZDhp?=
 =?utf-8?B?eGtHUytYWGlnckNmZE0zNGIwRGxYK0cwd1NpMjNYdXdrK1B1cDdSQXZQM0lQ?=
 =?utf-8?B?anNBS3JUODdYRjk2RGgwVTBVSStTZ0VIeFVkQW44M2JscXMvN2sydGNNdXpK?=
 =?utf-8?B?RWlEL0FiWkJiTmtZbDcvUWluZlVLMnFYZ1hkUUl1bUhqL2UyTUR3TmNSVWNa?=
 =?utf-8?B?S0hOcGlIMjhibFlQbm1MTzNJUDB0WWdoR0F4TFA4N1lUUVE0cUc1eDB5dWtr?=
 =?utf-8?B?ZnFWTmN1RWFCRmgvRi9QRTVIUFdzMThSUjRUajFBZ0x6YkFqVnNjTi9PNHB6?=
 =?utf-8?B?V3YyNWFrVGMvakx0TDlBd1BxQngwYWEyZE1qZzFSQkl6bnRXZzhTdk5kNzY4?=
 =?utf-8?B?cE9XRzhpU3FTZy9USTFyTXNySVhpTGYrV08rRlZQcnpqRnZqVzBWUkdqdk9J?=
 =?utf-8?B?RlhvMWdtbW1LU3IyOGh2U2JqenprSm5STGZNekZBMmpxbWF2U2dpdkdTWGtx?=
 =?utf-8?B?TEZDeHg0UmFGdFA5U3NxQTBtMmFTM3h3djZNK0FKdEJBMXRNRmVtUG9uMCsw?=
 =?utf-8?B?alJKWURLNjBwZHhZVHZKWEZzQVM1SUVVdyt0dmtodnluQVl2WDZjOEZ5UmZ5?=
 =?utf-8?B?UDROazgybllaK0c0aXVNaWxVRGxOTVRRK3JZbUVEWkdFUlRwSG92VlRhY2FS?=
 =?utf-8?B?elRKN1FmbGJPcjBCeVZ1V2xvYUFMZmVvSHBmMHQ4UXZTOWNuS1IrR3JwMml3?=
 =?utf-8?B?UDJIalRPQXNPSEVDU1R4endiR3ZKUm8wem1uWXdCUmNiRXg4cUxaMWFMV3NJ?=
 =?utf-8?B?WmIwak5qUGRtZVdWTVp0cStDd0U4MnBkTHJtb3lndEFGMnFoZEpJbUlRZ1A4?=
 =?utf-8?B?TEYzYjBMazl3RnhabjhYR1BpNkdDVDRVaFdkWjMxY0dZd0pYRVowN1NiV2pj?=
 =?utf-8?B?MlRJVVI5bzRmTWR5S2kvc1c0ek1ENk1CL0hJNlhxSU5JK0x6WXI4NEh3cmQ0?=
 =?utf-8?B?MDc2MWpEY2UrdUhCWWZaeFFKblBYSUZDem8xTEhiQXd6RE5ISmxLVUZpVE9h?=
 =?utf-8?B?V2NTaU01ZVlJRGtBTGt1ZFFLV2gyc2Z2TG0vZWZISVYrdUJpYmh5ay9Ldzg0?=
 =?utf-8?B?Z1E2K1hoTmx6bk9pc0ZSZFpLSnc3RDFja2hDa2pvbXNibDQ0ekN2YlA1b1J3?=
 =?utf-8?B?L2s1dnNiallSVStLbWZOWEdjc2lEQk9ENTdleEx1ZkFQUXVHWTJkV0ZIamhu?=
 =?utf-8?B?UEswYXlTOXFFZ3RYQ2tqY1RBdk9nS3FKZVhoa0tyZURVMThYSjFyY0pnWWJy?=
 =?utf-8?B?aUk2MmRQREVkVFQ3MVlqS2x2dTJQcCt2WVBTcmZZUGVGNWI5SVBLcHZrNldO?=
 =?utf-8?B?NlRCYmNzY3BvVkR6RXVNTkJNTHRlenl6cytYQVdXNFJLUHBNbjk2WXg4UGRl?=
 =?utf-8?Q?lHSjKL6kuH1aWLGwXpkwDhWq1J+lvisy00w2PBh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddf922c-31d0-411b-9257-08d8c9c22df9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:38:30.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN5xmnTau4Oh7dqb8cvoJovzsr+uG0+xXcTCeNQV62PCCRC2Rol/cl0UZ4LCS1+PjPjnw4NTFYl/SCvoePefFilJDpS9/r6oY7oaZQjn8Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3445
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

04.02.2021 22:07, Eric Blake wrote:
> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
> happen to truncate it to 1126.  Our use of fractional sizes is
> intended for convenience, but when a user specifies a fraction that is
> not a clean translation to binary, truncating/rounding behind their
> backs can cause confusion.  Better is to deprecate inexact values,
> which still leaves '1.5k' as valid, but alerts the user to spell out
> their values as a precise byte number in cases where they are
> currently being rounded.
> 
> Note that values like '0.1G' in the testsuite need adjustment as a
> result.
> 

Honestly, I don't agree with the reasoning. User shouldn't expect something extremely precise when he (is it correct use "he" here, or what is the right word?) specify fractional size. I doubt that someone use fractional sizes for production.

Also, this will break almost everything except for 0.5.. I don't think such deprecation will force people to change their habits to use 0.125 instead of 0.1. Simpler is to move to integrals and don't care.

So, in this way we can just deprecate fractional sizes at all and don't care with them anymore. Or allow only "0.5" fraction as the only exclusion :)

> Sadly, since qemu_strtosz() does not have an Err** parameter, we
> pollute to stderr.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/test-cutils.c    | 4 ++--
>   tests/test-keyval.c    | 4 ++--
>   tests/test-qemu-opts.c | 4 ++--
>   util/cutils.c          | 4 ++++
>   4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/test-cutils.c b/tests/test-cutils.c
> index 0c2c89d6f113..ad51fb1baa51 100644
> --- a/tests/test-cutils.c
> +++ b/tests/test-cutils.c
> @@ -2095,14 +2095,14 @@ static void test_qemu_strtosz_units(void)
> 
>   static void test_qemu_strtosz_float(void)
>   {
> -    const char *str = "12.345M";
> +    const char *str = "12.125M";
>       int err;
>       const char *endptr;
>       uint64_t res = 0xbaadf00d;
> 
>       err = qemu_strtosz(str, &endptr, &res);
>       g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, 12.345 * MiB);
> +    g_assert_cmpint(res, ==, 12.125 * MiB);
>       g_assert(endptr == str + 7);
>   }
> 
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index 13be763650b2..c951ac54cd23 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -522,7 +522,7 @@ static void test_keyval_visit_size(void)
>       visit_free(v);
> 
>       /* Suffixes */
> -    qdict = keyval_parse("sz1=8b,sz2=1.5k,sz3=2M,sz4=0.1G,sz5=16777215T",
> +    qdict = keyval_parse("sz1=8b,sz2=1.5k,sz3=2M,sz4=0.125G,sz5=16777215T",
>                            NULL, NULL, &error_abort);
>       v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>       qobject_unref(qdict);
> @@ -534,7 +534,7 @@ static void test_keyval_visit_size(void)
>       visit_type_size(v, "sz3", &sz, &error_abort);
>       g_assert_cmphex(sz, ==, 2 * MiB);
>       visit_type_size(v, "sz4", &sz, &error_abort);
> -    g_assert_cmphex(sz, ==, GiB / 10);
> +    g_assert_cmphex(sz, ==, GiB / 8);
>       visit_type_size(v, "sz5", &sz, &error_abort);
>       g_assert_cmphex(sz, ==, 16777215ULL * TiB);
>       visit_check_struct(v, &error_abort);
> diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
> index f79b698e6715..6a1ea1d01c4f 100644
> --- a/tests/test-qemu-opts.c
> +++ b/tests/test-qemu-opts.c
> @@ -717,10 +717,10 @@ static void test_opts_parse_size(void)
>       g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, 8);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 1536);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size3", 0), ==, 2 * MiB);
> -    opts = qemu_opts_parse(&opts_list_02, "size1=0.1G,size2=16777215T",
> +    opts = qemu_opts_parse(&opts_list_02, "size1=0.125G,size2=16777215T",
>                              false, &error_abort);
>       g_assert_cmpuint(opts_count(opts), ==, 2);
> -    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, GiB / 10);
> +    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, GiB / 8);
>       g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215ULL * TiB);
> 
>       /* Beyond limit with suffix */
> diff --git a/util/cutils.c b/util/cutils.c
> index 75190565cbb5..5ec6101ae778 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -327,6 +327,10 @@ static int do_strtosz(const char *nptr, const char **end,
>           retval = -ERANGE;
>           goto out;
>       }
> +    if (mul_required && fraction * mul != (uint64_t) (fraction * mul)) {
> +        fprintf(stderr, "Using a fractional size that is not an exact byte "
> +                "multiple is deprecated: %s\n", nptr);
> +    }
>       *result = val * mul + (uint64_t) (fraction * mul);
>       retval = 0;
> 


-- 
Best regards,
Vladimir

