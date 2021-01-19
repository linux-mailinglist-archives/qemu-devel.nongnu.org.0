Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990122FC052
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:49:12 +0100 (CET)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x03-0006VZ-L0
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1waZ-0006K2-7s; Tue, 19 Jan 2021 14:22:52 -0500
Received: from mail-eopbgr20136.outbound.protection.outlook.com
 ([40.107.2.136]:30738 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1waQ-00081G-At; Tue, 19 Jan 2021 14:22:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0PBZnDdTnrxkgjDN79y5WdnOk8TKJckOndI8I5GBmjwDaO/c/+vYKCU/aSiOgIm9xQCb7KpUoW8IRNsWcfFlAkbTomLU6RNt/KY+f7HyD6Not3UyXZfuMWhstECdScG9LMcKcro2e5Thw4lo8AX2gPtnfLIxtxaGBF+vS5Ip1R4fyLvZvr70M7+ybNjo1SwD4yzIUngcoVMIZgc9m6Q/IJevkt5ikTiBHlcOB/NB2Uahre9x9a867wYxvvVXXFbvoK1WGOmNQfYZ06tZ9nTLH/UfufEzo55S0SDQbPTUeoS3quUVTujtq1jPHcfgVcukArKsRJHeLWPa8gyCSxJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV6BXQ1RTmIV9eS3zBLnyg5AD1e3W5dor+iedGseAWc=;
 b=XnRD1Je2J2aiYQ8nhRuH6xUfo0rrAv81vLcrheTNbm9+YXhxOtTZIotAvU8uSZuCeje1y4X6zmgOz2IlnxA3rz6RtTA+GgW7joMf9cmx799XbzT8M6S82Shsl1kp3/+D9f+T2BCodZepFwYGwbbOWuRdIpnJrM7M5y9HipMrEqlKd3GC3OvDdkw31OjfCww9yCq4sM0Tyc/YJc++W9QBXq3gxM/KdpXNAC8xl0zlnHTgUgyAZBocf6qmQMzmfVCP+IQSz3dlcbKTvOoiJozW2Tn9mm8m0iZsW2e0gjFoWpdRMv2qv533nrgmcBMkfaIDk7MSM7f00GTJm/AG/CLx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV6BXQ1RTmIV9eS3zBLnyg5AD1e3W5dor+iedGseAWc=;
 b=KfmI0akeor4Od6Hb0PtB9Jm1dHFdl3ifvIWKn2qTD7725jxnSOtYu19aJZEb7YHS8K8+4VbFUltmGZapl6xxJZyxOI0jlb6HM6tgTC9yzXnRz52f/hBQQ66LJFNy6Yux+2DnOIhkec8Ys2ronzv+k9GPsdlmUYc7RwAJd4iTShc=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6584.eurprd08.prod.outlook.com (2603:10a6:20b:33c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Tue, 19 Jan
 2021 19:22:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 19:22:38 +0000
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
Date: Tue, 19 Jan 2021 22:22:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.84]
X-ClientProxiedBy: AM8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.84) by
 AM8P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 19:22:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 742d79fc-2f0b-43e1-3597-08d8bcaf954a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB658465369D90C5A561628F0DC1A30@AS8PR08MB6584.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00ccGGwkIZmVtTXJ9xFRUgT1lp8GdF5YpQxFeWETBpytVwJ0CfAt+9m1SxGtU3/effKBS7pFovQyMqLJAy3exWdkH7wG1QjrQc2HhCDJzHD0Fbp29nuqB7DNpsnWLMIoVcsuvvb5rWRxWrcNPsNl4po1LNEIaZDXC5dEA0GuAgnbojpd0F9MfcXigvom20SK2fQ/rf5PgEdY977tjNJycxBzHozlYZKcpDuVTJk12BCXIaAsPQy/vlLDXog15rig9yVmCDnTlBy37FHEgXGzE5wJWQ+Oln1HPTz1PbD8pFWel1TwddumJEO99l75L3iqIbVuTblWEJSzFHHhB6TRDeRoT12y7C4uYNOQruPPM5Vdv3yuusKI9GraDj2J+5zu2YUQn/qioqOk1EHvVVm3lyX/G3GO7IjRjmybufaxtHzxJ5H94k7vzsHz49IbbZNokdXNyHZ0IFa5Pc6ZPQ4dZcOHPS5L93qMXIWb8jJqRHMW+30z4ZrVEkywmv0WNYmvJT5JOYQEqaZHciYvxgXHCD3NEw/rREb8kEbhcUHIQ24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39830400003)(376002)(136003)(66946007)(107886003)(2616005)(8936002)(31686004)(478600001)(4326008)(31696002)(966005)(83380400001)(186003)(8676002)(52116002)(66556008)(956004)(66476007)(16526019)(16576012)(86362001)(6486002)(36756003)(5660300002)(53546011)(26005)(316002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UnZRSVlhMjlNdXdKYlI5T3loMHFBWkYxZHNWUW9LdkhmeERpVDhRbzlQRXNk?=
 =?utf-8?B?L1VjWmlHMWFUWTRNd2hVR2NHK0NEZnFycTBBTUxpbkhoeG5VL3pPREU4ckdV?=
 =?utf-8?B?NHlsS3VyQUVoelpaRDRGdWJCTWN4NHpCalVXYnJWL0gzZWRMRnBKTnpDTFp3?=
 =?utf-8?B?MmpCQ0grL3IwZGxHOVI2K0ZpMEVxbGNRYWF2a1YzSXNmMjM4WTN0Z0tFZ1Fj?=
 =?utf-8?B?ZUVLYVkzVjZzUENCSHVZTlhrLzNGODNmUUZ4VUE3ZE5TTE1INE5RQ3U0azB5?=
 =?utf-8?B?YnFkRG05Y3p3WFhySWdIdVFtUWlrWm1mL0xNZXhLYkRQRGVKTTMvcTNLR1Zo?=
 =?utf-8?B?elBINmhLTEU0VDAvdURLQjhoZmJLMytOZGM4U01NYXRXcnR1akxvNXYvazdX?=
 =?utf-8?B?Qk1mSitGcGRTZzd2eGNWd0ZUSytpak02bVhKOFRmd3FXeHM0aklFOE1nSzhV?=
 =?utf-8?B?NzZQbVRSOXYyKzdMcXE1bkN5TE5wMWEvZ0lzeVM0NWtGbTFhK1VKN1ZSWWFy?=
 =?utf-8?B?TmJRcnhqZ1pvTHJSclZIYlUrWGpiUnMzeG5XRjczazZlV1BwU25GUjdDblFy?=
 =?utf-8?B?VEMrN2x6d3JXY1VxTDlXdVN0amlUK21tcWFMZTlnTWdZbHBobVd6ZXNxa3Ew?=
 =?utf-8?B?cnFVM0tJRmg2TjhUT09XZkdmRVovOUpTYTkwOVJxbElxL0NBeDV6cWNoRG5n?=
 =?utf-8?B?TkxIRURpVDlseUtMSURSTlo2aUs0ZCs2bmxxS3NCb0RMZlNDaUY5ak1KdnNN?=
 =?utf-8?B?UlM2eTRMcjZ0eE85UmRlS0JjdGI1bGZFbUdMQys5OW5aQkVGeDBsYTlFUitX?=
 =?utf-8?B?NnA5bDhVcXRSaW9RclR5eUlxZ0xMRWhLUVpHamxDVWt5T3UxZ0VnTVl2TWVM?=
 =?utf-8?B?QTY2VkR5NHRXaTZDWU92NTZhcHNub3huS2dObUQ0bHNrb2hkSHd4MlhqMDJo?=
 =?utf-8?B?SHhCNjQxOUlEemVBd1NUcDM5eE0rN0tVRzBXTXhJZmtIdzJXLzhneEZxcmFq?=
 =?utf-8?B?L1VJRit4YlNmZHMrS2hQQTJxakJyVEpHTkQ0aTB1RjNxNWdTVE9wL3ZXdkFr?=
 =?utf-8?B?YUR3QXBOZVJvQjVkY0RkNFhpMjJtR2xyMHdOTlZxanhNc1ZZTmVVWGl6U1hw?=
 =?utf-8?B?dTEzRUhFNVFnMDhJSDB4cUZqQUFTV3dMMDBCSEw3RlpkbnJuU29tdjMvY1Jh?=
 =?utf-8?B?S2xvOWFuZDlTODZNeDhNWGRrem5mUnpmeU5vOC9IMEcrM1BiVEJ5T3djSHht?=
 =?utf-8?B?a0d6WW1LZ3N5U2tUT0E1N1lKV2w0ZUhjYzlhT2k1YitTN2F3dnpHMm5EL2Yy?=
 =?utf-8?Q?LflvWaIMbv9PTSlxEer4jn4R54QUgTVQYo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742d79fc-2f0b-43e1-3597-08d8bcaf954a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 19:22:38.4246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGqV2obmMoOXfSMKLVLxnnyc6fAgV3gL6Ph1UC0mJkhB0mCgoTZOqgCAaQNaofROAxyQR78bxOHIamGcMfs4HkAArCLoiD8OT+KFmSCCvDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6584
Received-SPF: pass client-ip=40.107.2.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.01.2021 21:40, Max Reitz wrote:
> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>> Hi Max!
>> I applied my series onto yours 129-fixing and found, that 129 fails for backup.
>> And setting small max-chunk and even max-workers to 1 doesn't help! (setting
>> speed like in v3 still helps).
>>
>> And I found, that the problem is that really, the whole backup job goes during
>> drain, because in new architecture we do just job_yield() during the whole
>> background block-copy.
>>
>> This leads to modifying the existing patch in the series, which does job_enter()
>> from job_user_pause: we just need call job_enter() from job_pause() to cover
>> not only user pauses but also drained_begin.
>>
>> So, now I don't need any additional fixing of 129.
>>
>> Changes in v4:
>> - add a lot of Max's r-b's, thanks!
>>
>> 03: fix over-80 line (in comment), add r-b
>> 09: was "[PATCH v3 10/25] job: call job_enter from job_user_pause",
>>      now changed to finally fix 129 iotest, drop r-b
>>
>> 10: squash-in additional wording on max-chunk, fix error message, keep r-b
>> 17: drop extra include, assert job_is_cancelled() instead of check, add r-b
>> 18: adjust commit message, add r-b
>> 23: add comments and assertion, about the fact that test doesn't support
>>      paths with colon inside
>>      fix s/disable-copy-range/use-copy-range/
> 
> Hmmm, for me, 129 sometimes fails still, because it completes too quickly...  (The error then is that 'return[0]' does not exist in query-block-jobs’s result, because the job is already gone.)
> 
> When I insert a print(result) after the query-block-jobs, I can see that the job has always progressed really far, even if its still running. (Like, generally the offset is just one MB shy of 1G.)
> 
> I suspect the problem is that block-copy just copies too much from the start (by default); i.e., it starts 64 workers with, hm, well, 1 MB of chunk size?  Shouldn’t fill the 128 MB immediately...
> 
> Anyway, limiting the number of workers (to 1) and the chunk size (to 64k) with x-perf does ensure that the backup job’s progress is limited to 1 MB or so, which looks fine to me.
> 
> I suppose we should do that, then (in 129), before patch 17?

Yes, that sounds reasonable

> 
> (PS: I can also see a MacOS failure in iotest 256.  I suspect it’s related to this series, because 256 is a backup test (with iothreads), but I’m not sure yet.  The log is here:
> 
> https://cirrus-ci.com/task/5276331753603072
> )
> 

qemu received signal 31 ?

googling for MacOS...

  31    SIGUSR2      terminate process    User defined signal 2


And what does it mean? Something interesting may be in qemu log..


-- 
Best regards,
Vladimir

