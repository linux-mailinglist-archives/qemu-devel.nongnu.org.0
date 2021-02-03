Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161830D528
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 09:24:50 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7DSz-0005aw-Fw
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 03:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7DQl-0004Pe-QM; Wed, 03 Feb 2021 03:22:32 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:19841 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7DQi-00012U-9n; Wed, 03 Feb 2021 03:22:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3oUxUNcLioEKxDXV7yp09hIdW8hpYevMF2TLk9TuxlI1sTf4lr9yGQR2wQ+b/fV/c5SE9v9gnQ0Iv3Jq5zIMp8odnpQuQXnPMPbYf9MaE18fAtXOJOEVuYWhu2imoro0UytWTtVNMEv8+zFDWRy+kmA3TmDz/ZoDsWKsM+Ulxc/3mPlz652H4uRVTDYnoReeCi5+9/sLYYuu0zIh/Q9PZ8+Lh//mhXZLVIVwmR2eSSkgo4oE5RMLGTbUIN07NKy2mI4NHRpSj/Al7rC0zfB/oenHnc6EhzWW4Hap39EmGdekzmEV4b6JfuTNqvQ9Iy/wleOcV6hCCUQu9PopjawcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXC5ma7sDf3JWKRjCZ0JOOQPiKp7ZE0ghIFuzM904to=;
 b=Lu/hR2M3Tlk5mYkcaMSrBjILtP9fwOwp5QtdQ9IVKvME1EVN7RlBirXym6aj9Jz+Qn+IElPoxiSYKHBn3waeYi2NZ9c9ZWYFSGXNLvVgUrOYsC3ONt44YrOB9FgXZs7Kx7tYEw9+/G1eUiImJgxX0lkodTOGTMNvmQqgBmx5r4PNBpyIA52Y6Fhf3wCqC7xG882pZygXcA2R99XPZ8OggpKrQj3pIcCObidb60WNL1njUtEdz69GpUke00DgriS8TJkD58sfOgW+rmrpc/43rc5r5v875Ue0VZ8bgBVgEZhxtB0HPMz4pPUZe4TC2ww3dtUinoigMhLvBcvfZhGVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXC5ma7sDf3JWKRjCZ0JOOQPiKp7ZE0ghIFuzM904to=;
 b=uBQCBE5bVbMooDxLOhdjvq3GikX76Oimrv576oVwFmuN+CNkhvHxI4MYcDflI6UOAhbthAHdHeUjWGki9OMlBoqt4Tbu1n13AuQ+kC6WCPcmBA/EYul0DN9LhOB8GIYWgT/WYiZ14haHGUiU9dRUmO42L4PDJpM3KqLjXYwYqGU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Wed, 3 Feb
 2021 08:22:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 08:22:23 +0000
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
 <20210201145056.GD13157@merkur.fritz.box>
 <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
Message-ID: <e1b4aba3-e94b-de1b-05b4-780f41feb5a8@virtuozzo.com>
Date: Wed, 3 Feb 2021 11:22:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.10 via Frontend Transport; Wed, 3 Feb 2021 08:22:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed583cbe-0590-43dd-fa0c-08d8c81cd4cd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376484E8525638874975D04C1B49@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eewOMqRaKV/NkuU4doprDEvk4BJ7GvT9VzvgUIKEOml59Qy1+OhMz/WGfrkQEQUi7hn4Bdao1dPusJoL/zF1Zhg6e0MhT2G3ajHhiCjrWugMoJCfp3DJ+qVQlkjqRwZFHqwgHfePu96aaHUmSqvPIeoFKqZMMY3JtgVTIURJQ7zxtJ+DXaj28zkgzTpLpuaJHsKgw7v0ivBrESnbKBl02GgmKONaBFu/SxIT+Glh+fup00lhJtScWWJAfYK/CK0QnG1jgOSigAXPirrPDAdw97y1C661CM6wnMUQRXIY8pZTdv6MLYhScEgRUqdEUT4YgeSfvbB7a4ZV8T6eTjY4xJLVxgdwos/ovU1bG+u+cDZ4uU9G8Jr6VJvEqpEMCrW2U4+UQ/V4BOpZFFw5GsChZrMigrGi2p902234TGIhbUBc1rhGm78ohqA9fRdYpmacA5v1/j8J3wVayCxSgTdEpyE3UmJq2MZaqcFs3qDaCEdRpdeIBLC2ui7ad/HXtgS36O/9q7yIJDqVG8Uc2wvW6W9tLozipKn2U+fOLavBPve5ZIafzd2NLTfETvHFmvdadYsQvibcMUsiBMIMkycbj6i2MQYQvNsmEzidhsx8hxd2Hn5HF+Eo9PrtK1mN4C06a+zm5tUie2DcinnP1Wn8JGaA8fIGwzEajqLQ8Hjc+3gdhT7aeL39FFLC7xwxJGWF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39850400004)(5660300002)(54906003)(31686004)(66556008)(16526019)(107886003)(8676002)(66476007)(2906002)(86362001)(6916009)(83380400001)(4326008)(26005)(31696002)(6486002)(53546011)(478600001)(966005)(956004)(36756003)(2616005)(52116002)(316002)(8936002)(16576012)(66946007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVdHOG9LanpBTjRwbzZzTzVrVFBCdTJoQmdFbjNTc1ZhM24wS1N5NTVIV2Zt?=
 =?utf-8?B?dW9uV2hqQUwvYlIvN3RaWW9VYU1CRmR1Rm8vampqQUduam1OQXBkajZ2ZFBq?=
 =?utf-8?B?VU01ZjZESXdIOFRUdTZhb2lZR2RPRjlwZ0xJTDlpby9xNWJyZTRBRjBnd01y?=
 =?utf-8?B?TXFlZG1sZ1JQYkxocE1aalNPYlNZaHcwQ3dCeW9CMzl5Rk1qbExKTittVy80?=
 =?utf-8?B?dTdPWHl4dENRRDBYSC9VMjNyUmU5aHd4OG85U1N3WE96b3p6MXU2bWNkLzFZ?=
 =?utf-8?B?YmkzdjkrTlNIdWh5Zzcvemd4WlI4WnpDY0h4VVpKb1BucFdqeG9HVWVZNEpQ?=
 =?utf-8?B?cTZDTmROaXFxSmE1YkNhajM1V0l5dVhYYUlYc0t2Z1k4VHNQY0FKcGsrRVE2?=
 =?utf-8?B?OHZsNDkyNmE0OUNaVVc1dVgrR1N4bDZoWlFDVGhhcGErTHdVL3ArU3Btd1F0?=
 =?utf-8?B?UktnRXA5bVc2d1B0T0NtK1lvSDhwOVhMR1BDVWFZYmp0cHp3U0psK0p6cWpq?=
 =?utf-8?B?MktnSEFCVk1HYjRrUW41TW1LOUY0UDBuWmlKRnB5V2ZtN0l6eSttRlZrcmJY?=
 =?utf-8?B?TnlXM1lXZVRWdTdDaytpSlROTU16U2tUTnVjeTk1Z285c00vNlhPdjE1dzRR?=
 =?utf-8?B?Z1pvcFpZOFU1S245TURDREZWRlYvRkphTWgzYnUyQmt6SlhsRlBBZUVER2w2?=
 =?utf-8?B?MjBNNG01Q3ZvRVdGenRRd0NQUkRKMmMzUktwdmw5V1ptMVV2NUtGUVlpNmkw?=
 =?utf-8?B?ZUNTNHFtNzhGem9Mc25KS1FwazlFbHlPNEo2Y21XT2tzZlo2S3dLMFZ3cFdB?=
 =?utf-8?B?YkNsS0h1dWVmS3JvblVJOHhMdzNvUU5OVW9sUENjT0dPQ3o5alRpWU8rTUtz?=
 =?utf-8?B?MkJwRFhuQmdZWW9pM0RxSEg3Ny9nT3hvWVhwOHRIUWpxemh5c2FxYkVTaGFN?=
 =?utf-8?B?Z2t2NVZNOE9EaWI5MlBuTlZVMkx6NTdRREUwWmVUbXlIVW9Jb1pTUk9WQ1JD?=
 =?utf-8?B?MjYrT0JxRnVUbUlQRUpoVVRydlRlb2l1Wkt3cjZOcU5kajYrcTBkYmtDUzF4?=
 =?utf-8?B?WUpwYVo0NWlUVFBTNU5hSHN2VldDZlY3MVltdnEyQ09qV3NzV0tMMVFGRmM5?=
 =?utf-8?B?dEUyNHlHaWxCYWFSaUJERGorYlR6VFJMRnZUR0xVTW9BTGNBVmVCYkkwTEsv?=
 =?utf-8?B?V09OZ1E4QWloZVUxcTg3TUNPbkhCOHRxZXVOUUVhdjJROUg4ejRyVC9udlIv?=
 =?utf-8?B?blBMU0ZzQmRFK3Q5RnljRFBhTHFacHVsbHRyMVh2MWVlSHBQbjVMNW9nUEFN?=
 =?utf-8?B?NkR2TTA0VWJxTFpTcmt6aGorQ3lQNEY0TUJLdTlsTXpZQ1VseWFBLy9QZFBu?=
 =?utf-8?B?OVMwN0U0R1R1c1JlenFzemVPYkVSMGdhL3hXNVhvYk1zSmxBNHAzc2V6Zmt3?=
 =?utf-8?B?RGVNRzY4NjI1T3VidWlVeVBvTUhxUkY5WWZIT05RPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed583cbe-0590-43dd-fa0c-08d8c81cd4cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 08:22:22.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oU5HqUwb2lYEprBuwfQRca7eW+dhW1mxJlT8E8stmIqmfKZlwc9rbEOEC8WBUZqKo0v8hWXxNVfUDlbSysuuFMlFkB5Tpo/Ri7VcUxdXDqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.02.2021 19:20, Vladimir Sementsov-Ogievskiy wrote:
> 01.02.2021 17:50, Kevin Wolf wrote:
>> Am 01.02.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> 28.01.2021 18:28, John Snow wrote:
>>>> On 1/28/21 10:09 AM, Markus Armbruster wrote:
>>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>>>
>>>>>> I'm developing Qemu backup for several years, and finally new backup
>>>>>> architecture, including block-copy generic engine and backup-top filter
>>>>>> landed upstream, great thanks to reviewers and especially to
>>>>>> Max Reitz!
>>>>>>
>>>>>> I also have plans of moving other block-jobs onto block-copy, so that
>>>>>> we finally have one generic block copying path, fast and well-formed.
>>>>>>
>>>>>> So, now I suggest to bring all parts of backup architecture into
>>>>>> "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
>>>>>> qemu-co-shared-resource can be reused somewhere else, but I'd keep an
>>>>>> eye on them in context of block-jobs) and add myself as co-maintainer.
>>>>>>
>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>
>>>>> With pleasure:
>>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>>>
>>>>
>>>> Absolutely! Glad to see it.
>>>>
>>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>>>
>>>
>>> [..]
>>>
>>>> Great!
>>>>
>>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>
>>> Thanks!
>>>
>>> Could someone pull it?
>>
>> I've put it in my block branch (with s/suggest myself/Add Vladimir/ in
>> the subject line), but I don't know when I'll send the next pull
>> request. If someone else sends one first, feel free to include it with:
>>
>> Acked-by: Kevin Wolf <kwolf@redhat.com>
>>
>>> I don't have any signed PGP key for now, to send pull requests :\
>>> Interesting, could I get one while sitting in Moscow?
>>
>> If you're planning to send pull requests, should a git tree of yours be
>> added to the MAINTAINERS sections, too?
>>
> 
> I didn't add it because of signed key absence. As it turned out, Denis Lunev (my boss) already has a signed key, so it's not a problem.
> 

Unfortunately, Den doesn't have an access to his private key, so this variant doesn't work. So, probably someone could recognize me in a video call?

My key is here: http://keys.gnupg.net/pks/lookup?search=Vladimir+Sementsov-Ogievskiy&fingerprint=on&op=index  (note that there is only one Vladimir Sementsov-Ogievskiy, so I can't imagine who can that be other than me :)

-- 
Best regards,
Vladimir

