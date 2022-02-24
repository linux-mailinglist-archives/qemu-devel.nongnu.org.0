Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85814C2D8C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:47:50 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNETF-0008KL-Pu
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:47:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEOk-0004Jj-In; Thu, 24 Feb 2022 08:43:16 -0500
Received: from [2a01:111:f400:fe0e::705] (port=11854
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEOg-0002aS-Ry; Thu, 24 Feb 2022 08:43:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8jkscHGaiCRhUrz1947jcGMn06RFJQM69fj/kYEeo96FbpXKxNSvfw6/qrmMu6vDO7Kxa1rHBMpZ/nGw/vT7KIIHv5ykhoAWz4OfwsNEM5wN0vhfr+5m6AxjoVu2NNvSyTICr02fLTf6eWRRG7SKo59N8cWRCIvfPzw+SmTaL8ypvo+0TMMBQXV1Qgp72NGiGU5FUVThukoelPaWce2yBYLDNOKmrmn32D7BBR9PuvupdVGVZeRXTQuZUAYN3FyCYbzazwq4kon9HebQ9YZL0SNuIr7kxR5JdkN20i9G+WorjQjc3XuCZJQzkgxLzpD6axmR2k78MmbICO9oGTSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3F+E6mCnbwNdcqyVKwXeuRL277+pLoSDXL/C+m9oEw=;
 b=A9MAll9k+9KgdJ2EmT8f1ncUvoKLUjFeNm9wUOr3RP1SB+1g25P7pzFevvpmpCoQcnfPYfamhSZgCDYJkqbGlMtwwX7n7Hkz2KK+O7nlL9vlD+OGlGJpguJ+AIFBmPvIQ3xqsx2zdElTHWznGYeq5bt1GhZ3ElkB73FtKyjzwetEzEsbNjqOxxWaqVlTL8KGFnb0chuwEReGDLsgWL0Va/zrVFVqxJr81eKirNC4Zk35mbO0SohX6dI/+W9aXgWu5b1dPTA+NMwgIGF5Kkx8ZX48eyZCcXVrX5G4sehBZJhF+vjGR7MjSe2tUkHRdKckUK/PyDksddr1vsxmKUgSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3F+E6mCnbwNdcqyVKwXeuRL277+pLoSDXL/C+m9oEw=;
 b=sQjZuA7QshLSKyt7FpJaU4vDMQjVgn56T1slPICPRxQ2m/EJ0MAJeI6ifsxv840EuUm3suH4rkkX2vxfcsjJrstJ7grOzvWiCRgPWUeF5pLUrQRYW0y/ELKirK8J+sXqYtGbX592C43PIdCyiePz8KDNfXCmMU1UcWbZLOW/A48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2884.eurprd08.prod.outlook.com (2603:10a6:205:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.18; Thu, 24 Feb
 2022 13:42:49 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 13:42:49 +0000
Message-ID: <df5b46ff-4df8-5fb4-65d9-ea948b0db414@virtuozzo.com>
Date: Thu, 24 Feb 2022 16:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 14/18] iotests.py: add qemu_io_pipe_and_status()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-15-vsementsov@virtuozzo.com>
 <1f402acf-5732-8df6-4d44-aac59db0f55a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <1f402acf-5732-8df6-4d44-aac59db0f55a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bb409a0-f767-4ee6-32c2-08d9f79b8c0c
X-MS-TrafficTypeDiagnostic: AM4PR08MB2884:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2884149561BCB9464188A405C13D9@AM4PR08MB2884.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nI+lrBrd40FF/l/ANJz4gkH8kWIzltFM0wpf93f8YmDkhyPcumaNXnwJ+q14yac9sY0XtKmteBd9d4mmiMu2L1swpBrlSMgvLNx1pVNRMCu1g3kmIlj8a3aXxN1Itpc0Rn3nPxelKrb7lRSuQmfilMDQ1uW9lc5JhKYhRMOFEJ/aQA/qBtq89eHRdyTpOBCnA2egowjCflBN5ji4zRwxIeNdOs1SQNrT8yfVjilnzj7rnq5sD8d4MTWRJ1wFYHIQPYs/TS01ZjyH7lJQYaTzHpDfh0gAzWxyNZAGMoIhb8mmSAG6lgWpfkDhYYd90XeVTEcPoMujO/uXDYeCwxN6BrD5BqI/fw/OnVa2ezHQSRt+1jGOHn5WyVbFZl0Ab8HHG6kPjIqGlO+7CoMx3cgCtavCzRtNf61Ux87By0sGkyzY4umNwMjM/NKAlqFGEfkSbvKkjBNjubN393lewjK3aoQXFXAgAfCpEnDDbkR0uWd7zeIQrCbCkRbnrwdczeVqcN7dvRzK1iQ/NugOPXjqvWxuTW7QVtUTGukDT6JoxEYTtK+3lx3wUpPo8bBr7O7VumS3fwSjk78jDWeNVbDx6vuz+MjAorz+yhjCNV7GWVzmsbVeJT2vfFwtoNjt2JqK9ci/fjt5ArdulgSoRhQM/vWp1ffaywmt8Avjm30iMa/TpwECvKUdNtKVy7tJYlz1cvDCWKozpFa/ZgxlH+8+gPaw6IPaq5s721jQ4VTdOzSl7yxXLwIuIMZcWaq1bAj2C7L9aEj61bL9hSJVFVHeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(5660300002)(6506007)(8936002)(86362001)(53546011)(52116002)(38350700002)(6512007)(38100700002)(107886003)(8676002)(7416002)(66476007)(66556008)(4326008)(66946007)(2616005)(6666004)(6486002)(31696002)(31686004)(508600001)(316002)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0lGWkJwTGp6SzNvcWtVQXhSZ2tPcXVjN0E2OVUyczQxVWhKV3hLY2tBUGp3?=
 =?utf-8?B?WitXUy83Q0dYNWYrbUdUa2JyeXZzZmlQU3AwajNUQzdHQ0M2a3ZUTnFpZWhW?=
 =?utf-8?B?NTM3TURXVlRMS0dJU1h4aUFwcjFNcGN6d202TE9iSktBK2Mza1EvSGNYd2Jy?=
 =?utf-8?B?UjJxcGFVUVBYcTNSUXcySks3MjQzNjNVb3hsSStHYkxDN29hV0U4b0hicEdo?=
 =?utf-8?B?ZWtydFMwYWtsTGlGdnUzSzh3MWczR29Xb2c4TGhiMWNuOUYzU04zSGhzVEhh?=
 =?utf-8?B?ZHI1SDhJRC9FUTZyMHNuUjQ5cXVXcjcrbmNmb1NjY0tGUEgwemtoTllaMkhE?=
 =?utf-8?B?bGc5eDYwOXBGYUhGeTQrRmNvQ0NEcjB2czJXcG1xR2NVYlpjZGZvanNoSTZH?=
 =?utf-8?B?Sm5Tb0RVdFcrSXcwbjdFM3F4UEZEcldzVEtYWFYyV3RtcTNZSi84YWRpQ3Iv?=
 =?utf-8?B?Y2FCRkU1d3NnQzZqTStXbUQwUWN5MU9rRWx3alJlSzhyWSs1QVZGbVAxRTdH?=
 =?utf-8?B?QkI5YUQremVHY3F5bDFBR0VqZ1RCNG9BRlIyQ2JjcVdLMUwvVnBiWXNNOTdt?=
 =?utf-8?B?WDdDRG44RVArc2taWk5wVFdSRUxaUk1KeUhEL3RXQTh4TUN0M0dxUTFDTUtw?=
 =?utf-8?B?WDhSOU9nc2hJSk01azRmZVFmWnF2dVJWWlRXbmNvZjlyQzQ2RTU5Y0F3eFlS?=
 =?utf-8?B?SnJpRDNhT1QxMHRIei9LV3IxcUp4VXRrYWxYaHJMN3dTRk9XVkZhczA4TFEr?=
 =?utf-8?B?SmZLRlQrUytxTzRxeTV5TW9oeTBXZ2I0dkFPejFKTGozeUlZTzRFZE93aXFG?=
 =?utf-8?B?TlpmYlhhZjdmcEI4eGlYeDFhbEpXaW9LV1RlVDRvTjZFeTUrNnBQUklJRi9z?=
 =?utf-8?B?TUhGenI3QjBsQVV0b1hXQkxJamR2dGM3cjAvTEQ1SW5ERGdtU1JUbHY1c1RF?=
 =?utf-8?B?U2t6UlViTG0zamE2eUN0NFA3MGJaZEx3dnl2REUwanJLRzc5b1RhdWpScVFs?=
 =?utf-8?B?QnNrM0t1OVMrMDM4WE45ZGwwSE9BYm9oSzN2OGwwVVZXNnRyekNham1sRFZQ?=
 =?utf-8?B?RFVKWCsrN3BJSHdLLzI4c2dCeFZlMkF0T1o2eUt0aHJjYnVGMVgxY0pVeVNl?=
 =?utf-8?B?cFpWY0RmMWpKY1NzRlNNRHBhY2YxcER4bmR2YTJmSWtUSmt5N1RlcG11TG5z?=
 =?utf-8?B?aFFVa1lOaXJGZkU0MWNxcW83RjBtMzRWSkNzQVViRGNoTXYzTWQ3N1dTcDdq?=
 =?utf-8?B?OFFnVHA0MGd0SEdkakpyQ3BvbFZOMlFPcW5NWUhVOHhBd1RVZ0VMdzBaUHpE?=
 =?utf-8?B?N0dWUUZVTGhpTk8vb2NPQzV2bUN6Y0xObGsxelUzaTBiSW1oMXhLVDJSaXNo?=
 =?utf-8?B?L3dwVzZ4L0krOFAweE9tWldsSDRRTEZCMlpSWk8wUWxldldrc0RvYkljbnNu?=
 =?utf-8?B?U0E1OFdZY0p5SEVBOHJhQzZ2NVBVMThnNUhFUG5RbGY1Qk5KNzRWMWtDS1d5?=
 =?utf-8?B?Vk1BOU1uRXU3VmgvMnRmZ2x1d0Y5MENGMndLSHBEODFCdURwdmlxSlNZczY0?=
 =?utf-8?B?aUZncFFmTjhaakpjR3FabDNXbVN5blhidEEwTXcydnRtT0daS3RRYis3dDNl?=
 =?utf-8?B?Zk9kUldKelR1dlhscm9GemlBNUc5U0RFRGgvTjBFSWZacXZuTUFkM0Z1TVlv?=
 =?utf-8?B?aTUreUFrdGsraUl0bUFGOGwzajNPeFVYeHNkeXFEeUVxKzJrZWI5UGNqSmlJ?=
 =?utf-8?B?SVBrTGoyanFJL1FOREM0VCsvREtzT2J0OU9ORXhkMjNNeDFpMW9XdS90NXQx?=
 =?utf-8?B?cExVQmV6ajhwMjdlTFQ2WGRlNHU3T1BtajNzTHJnUFFmV1FxalJRQW5IL2Q2?=
 =?utf-8?B?ZDNObVc4UnRkbjNENnFFN211M1NuR1VpOUN5c3VmSnVuQTN1OGhjcjdOMjB4?=
 =?utf-8?B?WHdNR2xTQ3pHVmdpVVJHME5MM0p0Q3VnOTAvc29FcTkySXB3K3JlTWkrVTlO?=
 =?utf-8?B?TWR5VXBENUpOQ1VpKzdEY28vS2d0QzlWS0o0TGxKaXpkTmV6UEFrMmxaWFNB?=
 =?utf-8?B?VmV3VEU2WEVPMVJNWElQUUdScU95WUh5VEhpZlJObUNmWkxLbkpQeHo5UG5w?=
 =?utf-8?B?Q3FPNnJQTUtrazRRZEV3d052V2UyMlh6eTZSc3Q0Sk1pa1kyUmViVlhEb1Fl?=
 =?utf-8?B?ajNOTHBxTG83WlZxWmE2SmYvbkdlcjJGczFEczNLalU2WkZGVHovYS80eXli?=
 =?utf-8?Q?VBzhjFUEfk4Uv3Yz2nMDiT7r++7QbDRc3A/9DwLcVM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb409a0-f767-4ee6-32c2-08d9f79b8c0c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:42:49.2330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZUhKh68It7q/bkz4XLXssgoUshq66Gr7BpSlj1uUAJMX8vShpEXRiI4XgifGVF5eXEiFrcSoLWt+wYZGuPM//+BYNPSDrI8eYXCSXLD/o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2884
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::705
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::705;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

24.02.2022 15:52, Hanna Reitz wrote:
> On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
>> Add helper that returns both status and output, to be used in the
>> following commit
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index 6ba65eb1ff..23bc6f686f 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -278,6 +278,10 @@ def qemu_io(*args):
>>       '''Run qemu-io and return the stdout data'''
>>       return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
>> +def qemu_io_pipe_and_status(*args):
>> +    args = qemu_io_args + list(args)
>> +    return qemu_tool_pipe_and_status('qemu-io', args)
> 
> Shouldn’t we use qemu_io_wrap_args() here, like above?  The next patch adds a caller that passes `'-f', 'raw'` to it, which kind of implies to me that qemu_io_wrap_args() would be better.

Will do

> 
>> +
>>   def qemu_io_log(*args):
>>       result = qemu_io(*args)
>>       log(result, filters=[filter_testfiles, filter_qemu_io])
> 


-- 
Best regards,
Vladimir

