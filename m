Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A83001B0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:36:55 +0100 (CET)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ukI-0000Lw-Td
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2uge-0005zu-Vh; Fri, 22 Jan 2021 06:33:08 -0500
Received: from mail-he1eur04on072a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::72a]:27374
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2ugb-0002jn-OE; Fri, 22 Jan 2021 06:33:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLcL+kYk7I2QYTIKp7VIauYEVF5ydTpGZ+Ca3V1sq6MVXHW3uCEzaepNKBcLw4Y1kLuWqFNcV41kBb7akpc7tivgBAwcMNZA18LNNANyQCTUegbaTUTvW06FqwMU1GwLqrKDHi0sHjW4oV6m5TcynmY/rOxY7G0GJLcHgsTqF1wVKqoEefRoM9WzCSfEK2lSaDslIxhudvsns/uCejbvXASg58kUYyJnyO7pDpaeGQNLjFvAcJs56NMMcvuMYE2+q5Hnsdtf8uqDPCj6uxNuacOL2nLjU0HgT95MaD+fMzOuUU7dRhKP2U+VWYhVO/boEAod1CSa7o0vbS3bisAGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xlzVXK16bVM98m0Iaid3GRIPfVi6jhKABpno/cmDjk=;
 b=H1XK918Iiw1Lpl+M+oMQOw5hC1Wgezb2tggmJReQaibDpB5+snvEAxYh+QJRC6RDzoPD3j2MXbzf4Orymr+7dl4kY7AlN8ZSa/vKvQ90WjjZBGeCT7tgxP/7tvoK43Tcqb0VPotkt3rrhL2KYAIMxCoyFkYxIAMKvJ7xYZNfceiQo9YqX8ylWSdKIzyNty7bwuLgoCaI6v+I3r3AS1W2S3QGMQsDbcXm/zwfqEj5iRaOWkNdVGbKJLsV03MpP13dK8ydGn2aitAWYjJj0AQpbOYeJIms2xGSpsc9yVvQtWwB2OxX2/Zp6TGFI6ikkTydSZ3kSOqQreBE3ICS7fwO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xlzVXK16bVM98m0Iaid3GRIPfVi6jhKABpno/cmDjk=;
 b=UqAvJc9XchLd7Y8Sxfn+xN+FUBWSxr89FX2JHku8Y7WpgMD0WuUEZDliXadDAyN9ZkyOaFqcXF1GqcgYUtEnYPpG5uZPPR5GX5CKFE7Kg38PgWC8NT4NBAx+Q+ImTxv/vgFdpmJ51DybyGonFBDoMghXscOz7/GV1IaYZM0WSVg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 11:32:48 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 11:32:48 +0000
Subject: Re: [PATCH v7 00/11] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <c4bdbd03-7a03-3bf2-3f6e-c8c85dd9897c@redhat.com>
 <20210122112745.GB15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20c6d588-3221-1fa4-bac5-5e1954dea27c@virtuozzo.com>
Date: Fri, 22 Jan 2021 14:32:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122112745.GB15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM8P192CA0001.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::6) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM8P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 11:32:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff06f051-eb76-43e7-a5fe-08d8bec971bd
X-MS-TrafficTypeDiagnostic: VI1PR08MB5503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5503FBFDCB2EFCFE9D173C5AC1A00@VI1PR08MB5503.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +L3dA5liq/gQXxcApk8ulY5/zMgtJ9wLiQ8PQIi49/ON2ctLrdKD6BtLBZbNs9ZhcQobOth73LTKqQoNsvF/jzlpAHNLlcT8YMJWJT6jobX/kEDuDFE6AuJF6Vowceh2OLOeXgRviE5iWXPl6kTZXPViqnq3IbYCTmAAyP27I4ViK1/oq3JIX65ZpGOpcXltZJI7WaeYmFz03FQanNOvDfO5TG/uH6wRNwGvHgZBSs4M3XV4X7dHnnsVx9zF3i+2gWrPpY2bECkUgk2NzutSYDXXV2qLGMHp1BsALJI28A8sas/Q1EGhxF8ZJX+18JRyApLurXSJyQ4HKFvUu7dY7NwNLAwoUI1KZda2dmHmE+uWobCf7hZemRBFJ99Edq6Gt/RKJVYhVIIJa7lM5WRXnNiWGxaeNq8PoRhW3vQQ+sA5wHoF63BDc5yYvsvY7Prv7zAlIzPYOWyCzPOSunrIsHlUDcE2DGaXwyU2BfTqwpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(52116002)(110136005)(5660300002)(316002)(478600001)(83380400001)(16526019)(86362001)(4326008)(66556008)(26005)(66476007)(66946007)(2906002)(53546011)(6486002)(8936002)(31686004)(956004)(16576012)(186003)(36756003)(31696002)(2616005)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVNXZG9NVFQ0VXIyUzUrWUdPWWw3QXZFWWNybUZKVHBQRXBhd25oWTlZZXNV?=
 =?utf-8?B?RElqMGV4cnBac3RidDJkbGtvOHprZHBnYnZ4dlRVc0J3ZlREUFpuTExXNnVm?=
 =?utf-8?B?emhqdU82QkNlRDRaZHlxZ0RGNXdlcXpER0dadnR2OUZGcWVvZGNDbEM2NTBG?=
 =?utf-8?B?S3ZTRWNMYVY1V09KMjlKekhWYnRYNStLY2dLd2FRRnBaT1lnT09PRFhyVXdq?=
 =?utf-8?B?Wi94VDV3OTBwY3I1VEI1aStHMnRrMjdIT2cwcnVSN2hxSWZrMUtyeW9uWVBw?=
 =?utf-8?B?YTRjTWZscTB6SDlHZk9mdEcvcU5MRG1HRHdIaHZzUnpPQ0k3NStLak9UUFBN?=
 =?utf-8?B?MWEzSURuVnZpdWlhT1ZPS040OVJXMjNOUmFrQnJhRWQrekVOYXgvZVZFamdT?=
 =?utf-8?B?ekRtekVEditqNU9XZUM0dWd5Z0JnUDFpYVNpWU9sWkhuTGJDNHprVEQ5M3FT?=
 =?utf-8?B?NkpROE5CeG9SYVM0K0RNUDI1WmRjOWd4T3JveEMrV0x2aUp4ZTFrSG92dy9t?=
 =?utf-8?B?dE9XOS95YUhjVjg2SXNPM0xKcUpOcHVIZmJEblVMVFpkYlp3eVloWk54eWZH?=
 =?utf-8?B?elYwK3hHa0Q3N3FLbFI0OHQ5UzV3RmJZUHhZQWVtZUlrUW0yQWM2R3h5T3pr?=
 =?utf-8?B?eEljWHdaTnlBeTVsMUlUSnJVamt3NENBN1BxanRoWjBodGdZSlJ0aTMzT010?=
 =?utf-8?B?ZWszdmZTcE0vK0xJYmhYS2tnRHZIWVZ2ajZnWmRyN1lRMGtEY2RoS3ZhOU9z?=
 =?utf-8?B?YWp1Y3lnMlpKM2taUDhzUXRDVEhSWHpkNUVTcWNmajBPSHZVRlVEV2NlK281?=
 =?utf-8?B?V0k4S1kvSTZoV3IzVjZYekNxeFY0NlNpaGhCSUlpQk1SRHV6WldyUVRHSlI4?=
 =?utf-8?B?eE1VbmprbUpId1BDLytaL0tsdkhVWG12bUU4bzZibUQrTkpwSXU0N1l5d0Fz?=
 =?utf-8?B?YVJDMmVYTnpUNjJxdEY5R2szMUpwOW8vTlBXSWowV1VaNE9HSGxDR3BwYThh?=
 =?utf-8?B?WE5FUkkySk5NaGFnc2NVMzlwT2RGWVAraTE3UnlSSVlxM1BpcnNjRVZmUnJ6?=
 =?utf-8?B?bERZYmNoQjJvZFQ0dmY4UktCcGVZQllyR3VJNTg3azlncDNvcm13SFdrTnVC?=
 =?utf-8?B?VVNWUi9ZQjFIMVNHdkRWeG4yb25LY3NkNUV6MGRjdUR1UWFhdmVqUmhrZFp3?=
 =?utf-8?B?MkZCcSt5RzU2Uzl0VUtQREZRQ1cyTm4zTEVCU2FKajlaOVZRUzJSNXovblN2?=
 =?utf-8?B?ay9VcHRNbW83Tk5FR09mOTY3TWhYVHUzTDltWUQyZkJUNlRsSTNLczFlTENS?=
 =?utf-8?B?T3FQUVNUNzQ2K1pFRjhQWUw0YkxvZlExYnBMNmxSU1AzRWY4OWgwaFpyUGkr?=
 =?utf-8?B?OEU4eTNtckJxMzloeGlHUkxOeUlrY0REaUliaGttRzdLMjdzZmpBWkFSOEN5?=
 =?utf-8?B?Zkc5WmRPdUVra01GZCtDZzExTXdsclJBSHU4a0xRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff06f051-eb76-43e7-a5fe-08d8bec971bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 11:32:47.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qkV861/qxSqv/YStbx65Un5KKW7AmJ2yqIWRLCoduALwEWZM32oB2BiWghsHXRQpUSBOFmHPxY+sg3GWjg1/WWU7Ogptkd16yAQk2Rv70o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 14:27, Kevin Wolf wrote:
> Am 20.01.2021 um 21:52 hat Eric Blake geschrieben:
>> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> These series has 3 goals:
>>>
>>>   - get rid of group file (to forget about rebase and in-list conflicts)
>>>   - introduce human-readable names for tests
>>>   - rewrite check into python
>>>
>>> v7:
>>>    - fix wording and grammar
>>>    - satisfy python linters
>>>    - move argv interfaces all into one in new check script
>>>    - support '-n' == '--dry-run' option
>>>    - update check-block to run check with correct PYTHON
>>
>> I'd really like a second reviewer on 7-11, but I'm queueing 1-6 on my
>> NBD tree now.
> 
> Oh, you already sent a pull request? Having 6 in without the rest is not
> a good state. We now have the group info duplicated and one of them is
> ignored, but will become the meaningful copy later. We need to be
> careful to not let them diverge now.
> 
> I hope the rest is fine so we can switch over quickly, otherwise I'd
> prefer to revert 6 and redo it from the then current state when we merge
> the whole series.
> 

I can make a new version now with tiny fixes suggested by Eric if it is convenient. (and keep --color suggestion for a separate follow-up)



-- 
Best regards,
Vladimir

