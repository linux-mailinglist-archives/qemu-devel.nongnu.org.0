Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3498D4093ED
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:26:07 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmuM-0005jf-6B
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mPmJP-0003VA-7l; Mon, 13 Sep 2021 09:47:55 -0400
Received: from mail-eopbgr140132.outbound.protection.outlook.com
 ([40.107.14.132]:62997 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mPmJJ-0007f7-Kt; Mon, 13 Sep 2021 09:47:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSV1+dF9FhAnZHqUcNqN5qhVv6aPE9ZRC4eJLBq4vqkzzRWkLaNEwYI0HjotmKACWXQc/C5hVvVVW7ZygpzJee6sp6P0tE4gSUhtDla5ogGOf/hOeRaj9EDN5sATn0k8/dWItBIsemHbsfxhR+UWjmU+tX/IthuP6OjcInqqGzJ7FUSfNIUV4+g8rlc5XqBefzf/bQiKebklA8MMZBetHIq+HiyWCZt9YIz5nB0crMcHfUmi4ZuVg8X8IzZYgXdvd/yCizXokIJmvX0EeBUpMlVdD1v5jI5AQL7k0KantpWOmjZAku07dqbi9HQVgWpXmbkZvWjs+1i4yDUSN/hFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YUpyn7XkK+qGb5RXPvFAhJa1wR+H35WQGdh9dnoqJnk=;
 b=Oo5bSxYwx5szaCxh0oNA3DkXHvO68oga9ejdi6yPDJmec5b63lDSGZAy0DNbvFMfU3KNV8JxijCi5XUjbRZ+/qanCxfd+4qbFIzSiQ5UX9Zu4Vb8ZA9Iuage0X29ozW8xwiOc1ME0vo5UIuFRa5qgxpssA3U0Lb7k9B68PzDEtAfr0w6CIp0m5uX9oJuyIl3bmO7iMO8RmUt7OWswOBnDHGXOWAHNNPyyxc61kB5Off+E9WltPcftRa39mw7oUSAm6LB8XGBEKQQ1THjzOZBruRBShEm7P6wbTc6/DQx1JpUuOIt6kNa+UB9IbMlg0ezwZvH34U7zc4yp8JdVl6Nmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUpyn7XkK+qGb5RXPvFAhJa1wR+H35WQGdh9dnoqJnk=;
 b=DkLk32j3jHhMwqZuTMf++GfEagldTvTL2TmFpbVg3D6rhubghgRGf72rpHWO0e+PgfrA/DaYDavep444kMWnqb784KCMzcfWyjTccpvI4eVSnOQc+swCmNO+B8evG3gymF9B2g5o/8hPn/L1ijbws4nbNEvqB89gr4D5nSs6uW8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 13:47:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 13:47:44 +0000
Subject: Re: [PATCH v2 04/17] iotests.py: rewrite default luks support in
 qemu_img
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, jsnow@redhat.com
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-5-vsementsov@virtuozzo.com>
 <a93ab286-5785-f05f-2059-4cac783d6cf0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <35320f85-cd60-002a-14aa-e5e39b0322be@virtuozzo.com>
Date: Mon, 13 Sep 2021 16:47:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a93ab286-5785-f05f-2059-4cac783d6cf0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0093.eurprd05.prod.outlook.com
 (2603:10a6:207:1::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM3PR05CA0093.eurprd05.prod.outlook.com (2603:10a6:207:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 13:47:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ffb16d9-78e9-4a42-a6ec-08d976bd0fe5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4405318B1E52D6980976126AC1D99@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuOy0Es89puCvjivgYd1rtr1/jATcla+Zfv5bQULmFD0yBRgtXFnRwVqUn+vWFUxJDGu5XWHs2zPYxrYQ5gaH6Nh1aix8eC75r0z2yy+0D0ckcjqKkwtOHURaF0WdPCKCwcjkki8Nhieo5LWO87+hSuTvPFbnXUYCbMQStP3dNrVDXzAE0WiMAMR+Hm3q4Mas03gbgAlUEsucJpWl0IzAxqrIKOTEmnHkq5KXw3sKdQMWEP9fNfc7k3OW877nNGhHhSLGHlAEqhV3ivhxDx3AkYMFRZ9KenlItzsPwnVfI26L53mS4WJwHLkq2b6RmCme0BJsOeUfr5GmBqOPxF4UFdh5PM8KMFafLuOShSK6I7k+TNvG2WCvTS7X9AjiVUvOD6A1JPjeL9AHuEx/8NeF/1WDODpgmwlKKqEsafjErxmJv06jyiNbHNcSEDipczCVldptsgteVkVP7hLm9PuddQEtfpioDtS644KXVRuTpVTFKZpy4vjIiVJ3PHRnDAcS9HPUewAG6JwjycDqM8ltL2gF66BS4g5doUFQxYp0cYg+lYIU/zQn40lAyhOfv3zBjSP5Pnh/DH0wiz3aMwHSatQQRW9KwB8l/l/y7Snu0SewA+8OKCevM3Yub7YM1kP7RrN9ZZxzdh0TVB2vQiugNnx9ZJEUUxfter9V97c5UiVp3LzytYzrOa/Vomb9rPyW/afhygdLGDrFEtvKm6R7epUvzSmi+r1AYCDjkhRay6TCrSeI/qVRJfBlVCO6yI4n8qgaOFogxcu4RQr4LzwcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(2906002)(956004)(36756003)(2616005)(5660300002)(53546011)(6486002)(86362001)(8676002)(83380400001)(66946007)(16576012)(316002)(186003)(38100700002)(66556008)(4326008)(38350700002)(26005)(66476007)(52116002)(31696002)(478600001)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS9SeXpXakFwZmh1UmRQMUswVSt2Z09Cbm9FYWRMdGxpVGg1VlRUUjRyY0JJ?=
 =?utf-8?B?T1RIbThSbjkybjBEeURoSzJ6TXJiNXFJODQzQzJOMDhnZ254QzdGQXJNT3VZ?=
 =?utf-8?B?MG8wUHBGQkUzcU1OOTF3UDhXNExQNG9mbjRzMGlYd2hwSEw0N2pkT2lmZVI2?=
 =?utf-8?B?blgwY2xlSEpaa0s5UDNKa2ZoU2ZsSHM5Vmtzek85QUpiQjFMcFozYkozeGNO?=
 =?utf-8?B?NHZESVZqMjR0NXBFam5NVW1EZExCSUVEZDdwSGFobDkveGN3aVF2QjRtTkZP?=
 =?utf-8?B?WUlaTXFZOGZPOXJhNUgxUXI5WDZZK2tLbUdWenNsMTBUWFF3MnA1YjJ6UG9t?=
 =?utf-8?B?Rjg2aTN1bm1sbktJUGhxZUV4NHloRXJZYTlSc3gwSzBsdmFmcC90Njc0cUdF?=
 =?utf-8?B?QyszekhIZmxiTGF0UmJUVmNITFhpWXdHVTFpbXJzK3BoU2E1Y0kraWJ3a3dR?=
 =?utf-8?B?NGJHbVA3bnZlaVVKekRBTEpKVENiVjhraVFpcWRSMjdLZm43WVBtd29xOUhz?=
 =?utf-8?B?Tmdxc3hxUjQrOWRHQVV0TzhsWjVyVWhNdVMyY0dveGZyY0ZWZHhOdUVuc2F4?=
 =?utf-8?B?QUVNaGV2NUNhSGhkRnpZT01Yb1d0d2U1dnYraEFTZkxEamNxdUNZR0g5bU9X?=
 =?utf-8?B?bVlteHFJa1Vvd3NRV0dEZmVtNUZVYmhKVjRFMklrdE5VTCtZM0t4SllxZVY0?=
 =?utf-8?B?V3RJRnc5Y2kzWTZoTGc5ZGNPTEtZaFpVNHpPUkMzQVR4NG9aSk9FaWd4WFc3?=
 =?utf-8?B?Nm5UZTJQRWlpdUxyZmdVend3aXM1SDViN3hkY0xxSndPR3d5QVhBdHovcFpB?=
 =?utf-8?B?VnlTZXBSb0tsdDdZazcwMUJkbktyeTlGZUpvd0QxZ2hPcUlMTEhyOE1NcC9Y?=
 =?utf-8?B?eTlBZzdCOVh5QlFSSmdENnR6dWFOZ3ZaRXJJRktYNXZFeHlwSytpa3M0UkZn?=
 =?utf-8?B?cWRRdm0zNFN1K1BGeXEwTFhBKyt1Qk9vZUx2dFBrRjN2eklDTGJuckQ3NFBx?=
 =?utf-8?B?bkY5cEpRV3lpQStaaHJpZ21zWDBEdFNJNEF4RllYWVVlRGROaW04RWEzMmxn?=
 =?utf-8?B?cmkyZWxybkxPbk1UYXhsK1NYTmxLT21KeEQ2Z3JRNy9vRUYyWWUydm1YOTJC?=
 =?utf-8?B?b1dtb3o3QXFNZHl4V2hBMTlUNGlDblhmMnFiMUcxa3ZGd0FFQUJqL2NQclFU?=
 =?utf-8?B?dEw3cmphZUJPMWhwNGthNEpzWU4xMDlnckpYSWRPRGpDRUtIUiswbGcwbGk1?=
 =?utf-8?B?NndNUzhoeVNEOWx5bi94TFlHM0xhNFVRaU1uMzlvNFBLTVdRV1c5eHlYSlB0?=
 =?utf-8?B?VVBvdGNyQzd0enVGL1lOZWFoSHYzNXpzMWdZQmpMVEUwM0kyeUpLVG40THFz?=
 =?utf-8?B?d01heTBuMlBzcnJoaTZGa0cyVkR5SkxlRzFLSnpmNU5mWVlkREJkYXlNM1lK?=
 =?utf-8?B?V2ZEQUV2WmpZMW9RT1M5dCtJb09CdGRZOEMrY2QvazRQRE45T21KTGJ2Rjlu?=
 =?utf-8?B?RjMxUmN6VjZ4Qk1pdEJVdUxkU2kvdlNldnU2cy9rckp1c1Frb3dJUnByTjVG?=
 =?utf-8?B?c2tJbHRQTzBlZW8yTi9iclMrVnZSL2FKaW02Y1RqU3NjMkJ6UkRQeFpXWWtR?=
 =?utf-8?B?dm1JaDNTZWdsY1hDaUNSUW9kOG51WG40WGx1SkdnRzZQa25pVkVaK0pWSjd2?=
 =?utf-8?B?a3Q3bktOQmtDUFZNVWowajYwRW9sZjE1alROaWprRndFUWp6bGRLcGdUNXk5?=
 =?utf-8?Q?0WFYgCwxVniYtjiRuiszGRj2GBm0QMEDg3obnbg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffb16d9-78e9-4a42-a6ec-08d976bd0fe5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 13:47:43.9531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsHNzx3DlU9fqRpzjI9MC8YlTLFjylIQ3aRklO/fJgZs/RJcAWZlx/9LVbKsRByzlZudU6LKX/grAV1tR51UO78bNb2qaWTDMRWZbpCd/Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.14.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.09.2021 14:16, Hanna Reitz wrote:
> On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
>> Move the logic to more generic qemu_img_pipe_and_status(). Also behave
>> better when we have several -o options. And reuse argument parser of
>> course.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index def6ae2475..484f616270 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -128,9 +128,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>>       args = args[1:]
>>       p = argparse.ArgumentParser(allow_abbrev=False)
>> +    # -o option may be specified several times
>> +    p.add_argument('-o', action='append', default=[])
>>       p.add_argument('-f')
>>       parsed, remaining = p.parse_known_args(args)
>> +    opts_list = parsed.o
>> +
>>       result = ['create']
>>       if parsed.f is not None:
>>           result += ['-f', parsed.f]
>> @@ -139,8 +143,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>>       # like extended_l2 or compression_type for qcow2. Test may want to create
>>       # additional images in other formats that doesn't support these options.
>>       # So, use IMGOPTS only for images created in imgfmt format.
>> -    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
>> -        result += ['-o', os.environ['IMGOPTS']]
>> +    imgopts = os.environ.get('IMGOPTS')
>> +    if imgopts and parsed.f == imgfmt:
>> +        opts_list.insert(0, imgopts)
> 
> Hm.  Yes, IMGOPTS should come first, so it has lower priority.  That means that patch 2 should have inserted IMGOPTS at the beginning of the parameter list, though, right?

Agree

> 
>> +
>> +    # default luks support
>> +    if parsed.f == 'luks' and \
>> +            all('key-secret' not in opts for opts in opts_list):
>> +        result += ['--object', luks_default_secret_object]
>> +        opts_list.append(luks_default_key_secret_opt)
>> +
>> +    for opts in opts_list:
>> +        result += ['-o', opts]
>>       result += remaining
> 


-- 
Best regards,
Vladimir

