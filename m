Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8F30B805
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 07:51:55 +0100 (CET)
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6pXW-0005ln-0S
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 01:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6pW8-0005AE-K4; Tue, 02 Feb 2021 01:50:29 -0500
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:11167 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6pW5-0004Lu-Bv; Tue, 02 Feb 2021 01:50:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR4Pr2L5NVLC5SDSlBXjnPx5IKAEImyyFNF3drrWphJbYP2RXH05etxwqhWQqHjGOw1l8zPEXAggCSDctiWM+5vmr+huge6Q1Md6dlw3PqR1HuAu/tqG2TwmRja9tYnT15wGk0biU7S3FfKLYTXXOOf05ZI5KqjMbGXxRSfUIT4kb4n2jtEb0Xoc/F9UcPcGW4uW/5OpA/eUoZnMch5N1xkhPXq9zHi6t0FrvjLWQ3N1OahtaCJqqCSTNJ4B6mR+NVA7w8r1TPU3PzEMVbVHMyLk6SJ27m5T0X6Hdt5X2kzGFoLYNQ1e/0AEMRZv3Pfbyw85caMzdXbymHoNgqL7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNsbrRChQrVjECk4WBrsL3wOljoFPKl2ZNOkX1FqOqs=;
 b=mVt0pQ4amvUhKtIKX7rMfLH6IAvdPRiUeJ+ATDohvMhpHifzzpx4BGfm+0OnHg1xA+QI97faS5ZCYsfH5EIgNSA5a1L/1/0Mi6yBkSXf0/rTDl+5grhV1Mi4+GElYaTdlISRBZQpBdkUAcYx2/G5Ni52iXdTShI8DwQb7F1hcBGHhbeGx3nCM9KW+yowtqhbMtDGz5CqXDbSMHCChnu1CoXNA88bKZ0Q3Aji+HtRFGDRemGAWJxKadHV+JbNe/pa7ZkRjHQtkE0jODMlif/B2YcYdabAsxYsEy0BXFHP4p1JbuFNYYc11+2mjKyuc/85t8mqjCz1ChhB0teSlqRaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNsbrRChQrVjECk4WBrsL3wOljoFPKl2ZNOkX1FqOqs=;
 b=ucnuGO5ra9PRaJdPyp3SErmlqr0rRhgJHxdb5kOiFAOPiJtk8Y7ier7eoH56rX0wGWqVRYkBpUOTG62+veiiRhy1sW07n99oiDYqVuWhBJOI2oyHPD5BI7DAvjXKY702z1Zffx0kbnfixMOgZ9ZW0nbx1fGc2ntpREQxwNhTmH0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 06:50:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 06:50:20 +0000
Subject: Re: [PATCH v4 00/16] 64bit block-layer: part I
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b0d47a81-b3b5-f2e7-7601-543156f94956@virtuozzo.com>
Date: Tue, 2 Feb 2021 09:50:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0168.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR02CA0168.eurprd02.prod.outlook.com (2603:10a6:20b:28d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Tue, 2 Feb 2021 06:50:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63eaeb13-0463-4be6-f34d-08d8c746ce8c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080DB649FAFEDB9CDBEF448C1B59@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a55PGEVu1v2OC7L1adnk0cjVf8v7GPa0XQOvdPseWZZzXpUNh73LFIp95UZaUXxV0T67XR4D4GCEreLIBN3MlRR+pZl+eYmJ6MymaU3ePn5MAobu9V6n+wKCEOGLq88bwgEcnoBSwTPzbnLXvsGIvYyMzimojmWZP0wm/vUhRQeJ7xyce+6+mMD7XhnfEGdf4GT7+8UaFPbIFpCwFhbe9PE6/qzDV9KRRwnxvigw027sAuann2GmpnK/I47BvE7Wev/KaFjHiDdXrHooyrWAn5wNKe6G3mc2RNEjpNg5B2Wkyq95q1h0RWPJW6i6lSri2E+ZN31hVP0Dn/YQ/V2SbKIqiFma3T9zngtXqZby/o+vtaFXwqGbg3leySO+2WlYfUryOm7480FshWsL++3+5Qv2mfxcYJ6b4qoeFZlakLHcEb+6fU5tdTZW8BYEgGVtt2gA0pWa/qsAT3q5D+5djbgrBoo2epOrKvNmpSgDr1W3ykaR9BgeO8gMzWQ5Hz6HOWW6g1OqUWBuq/CiYpiiezKi5erYCRzfCRQUIPHUmc2NdWE2hKl8pk/l5fqBjUPAGTXdkkd6ug/bCU9D94z3ag5sMEZ+xnyYH6FK4XfEHXHUV+sE3twk/lcQV6A0Mo/5zA6BVrzDm2WSAnpLaeTFp+pWjSL7RAAL8JBj56aYfdERZ7QIpGl42smm8HEB1mBq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(376002)(366004)(346002)(66476007)(4326008)(8676002)(6486002)(66556008)(31686004)(36756003)(107886003)(2906002)(26005)(16576012)(966005)(5660300002)(8936002)(66946007)(186003)(52116002)(956004)(478600001)(83380400001)(16526019)(86362001)(2616005)(316002)(31696002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkdyWjF3Z25ha204SXhJVjl4T1hkTFZXeWxsZGk0R283NG45RHRCTzR3eEI0?=
 =?utf-8?B?VHNVU0pMSk9vNWRhQ3piSFkyZXJEWkltWjlCZXAzNmZYdnNoZVpYWnhXbE82?=
 =?utf-8?B?M09mT0NFM2lYV1BhL1V1Y21QYno0RWxxanZ4L0JZQ29uTmRGRTFFL1htc0NP?=
 =?utf-8?B?Nk1YODNRS0VGYWcreExLR0FGNnEyZEZVN0tpbStPdTR6QjlqM0NOMHZ2VDg1?=
 =?utf-8?B?eGlEYkI2bkpoajN6a041RzhGK0dkbVlQakgzbEdEcjBkNzc5bXpod2I3aldv?=
 =?utf-8?B?bnRVNXVxcVFlVVlBckVTZzZvam16K2NSRzdPMVl1cjUzMDc5azhtMlIzQ3ZD?=
 =?utf-8?B?bjFDdTVKcCtzdFp5L0FWTlk5N0pSekVJOTdnd014THhaUEdMTkw2YnRwWjAr?=
 =?utf-8?B?N3I2bDJXdkRMSFdmV0ppSGJ2RHZhU0xKRzFYc0RNWWFQZUFZRllqV25VeFQy?=
 =?utf-8?B?cVJPc2ZidUJBbFJoa043T1RXU2NSVFVLVkpGbll4eWxNSTN0ZEppdUdYaXpB?=
 =?utf-8?B?ancxc3M5OUIxMXZ0bUdTUStSSEU2bzYvYWZsVC9oTkdhRUVlczU1amZhWTR5?=
 =?utf-8?B?WXZtZFlKOElmMnRUZkJTVXk4UTcvenN0WENoMUlvdWVJOCtPTi9PNGc1enNs?=
 =?utf-8?B?WjZLL0NLd3g4OWtNQnR1dUVoUlNBWnF5K1ZRcDdJaXhVOXhPS3dSUEpFR05T?=
 =?utf-8?B?bldOblZZQmJWWGs1WFZ2UGFxUmx4UDJWMzRVR2lGblZxcHBYTUZ2dWJqVmV5?=
 =?utf-8?B?VUc3N1F0M3JpTXhJbm9CcHBNaFd3R3UzQUVLVHdMMVVHVmlObWwrcW1DN1No?=
 =?utf-8?B?bkgxelJ4eVF0Q1RvejE4bnVNWTYvZ2cvaWR2NXZHVzZ2c1NmNERhelVKVlNz?=
 =?utf-8?B?am50V0VZM1pnTjdvMU1WSytHTzJIMXQzcUNFV2RyVEJPL05uQ3dpN3I1aCtF?=
 =?utf-8?B?N1JmWXJaQ0JON0xrSWhqTFVOSloreXZnS0xYVVBDV0FKeE5yR1lPNWkzR0RS?=
 =?utf-8?B?U0pHeHQzVmtPYlg2SkUzSW5lbW9sWGFQT2kxSHpEQlFOOHBPK3FSL2x4NGtz?=
 =?utf-8?B?d2hKZWdQNm1USTNqT2xSdDFlOGF1WE9raHVuR3R4dnpWZ1dhZ1l2UVF3M0p2?=
 =?utf-8?B?ZmxpaC9yamp6YmtObWNBd3ZDcXlob3pLK3kxcTl2T0s3NVVtL1ZZNFVUYjho?=
 =?utf-8?B?K21peWhoY2RXNXh5ckt6eGovNzRySlVGS040dTVuRW5uUjUydTB0Slg3OS92?=
 =?utf-8?B?b2RHZkZOSWRsVGZZK0lIUWVHeGtuK2hHcWwvSVRzSHdSNHRzWUx3ZEhxWWRq?=
 =?utf-8?B?b3orNitNVnBtNytSL0dPdHkwWnpONHQrcTNiMTFuaUg1Y1dnWHV2dE43UmpT?=
 =?utf-8?B?NEhJbHJ3U0Fuc3VyTk1xQ1k0cklrTFovMld6VnhKZDR3ZUVlNDNtNW12VkRL?=
 =?utf-8?Q?uiZ8Icmi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eaeb13-0463-4be6-f34d-08d8c746ce8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 06:50:20.2376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2DB/TlTzM39whTjwDGekdU7kKQ2FlXqXKkXNDSwXvh5VwoRwlZZYWppW5XWW4QRpYBKBxFcF+hjXq73NuPr3clrz158Vl+PrEWpdxk9Ztw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 05:56, Eric Blake wrote:
> On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> We want 64bit write-zeroes, and for this, convert all io functions to
>> 64bit.
>>
>> We chose signed type, to be consistent with off_t (which is signed) and
>> with possibility for signed return type (where negative value means
>> error).
>>
>> Please refer to initial cover-letter
>>   https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08723.html
>> for more info.
>>
>> v4: I found, that some more work is needed for block/block-backend, so
>> decided to make partI, converting block/io
>>
>> v4 is based on Kevin's block branch ([PULL 00/34] Block layer patches)
>>     for BDRV_MAX_LENGTH
>>
>> changes:
>> 01-05: new
>> 06: add Alberto's r-b
>> 07: new
>> 08-16: rebase, add new-style request check, improve commit-msg, drop r-bs
> 
> I had planned to send a pull request for this series today, but ran into
> a snag.  Without this series applied, './check -qcow2' fails 030, 185,
> and 297.  With it applied, I now also get a failure in 206.  I'm trying
> to bisect which patch caused the problem, but here's the failure:
> 
> 206   fail       [20:54:54] [20:55:01]   6.9s   (last: 6.7s)  output
> mismatch (see 206.out.bad)
> --- /home/eblake/qemu/tests/qemu-iotests/206.out
> +++ 206.out.bad
> @@ -180,7 +180,7 @@
> 
>   {"execute": "blockdev-create", "arguments": {"job-id": "job0",
> "options": {"driver": "qcow2", "file": "node0", "size":
> 9223372036854775296}}}
>   {"return": {}}
> -Job failed: Could not resize image: Required too big image size, it
> must be not greater than 9223372035781033984
> +Job failed: Could not resize image: offset(9223372036854775296) exceeds
> maximum(9223372035781033984)
>   {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>   {"return": {}}
> 
> Looks like it is just a changed error message, so I can touch up the
> correct patch and then repackage the pull request tomorrow (it's too
> late for me today).  Oh, and the 0 exit status of ./check when a test
> fails is something I see you already plan on fixing...
> 

Yes, Kevin have already sent a pull with "iotests: check: return 1 on failure"

-- 
Best regards,
Vladimir

