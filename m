Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F733BFA5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:22:53 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLp3U-0007BZ-4H
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLozw-00054z-Gd; Mon, 15 Mar 2021 11:19:12 -0400
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:21910 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLozt-0008EG-8O; Mon, 15 Mar 2021 11:19:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp8M7flc+dRymVL2+AsYLiVNr9OJPaGBBhhY84NXk/OrASM54s+3DCmLVBaCgZUuPA4oKa7tZrjGupE3A1mk+SbVDHEEBIQ9u6HeVZShcvqNjrHItfTHm4478cnpYJrLJwdVt47ssvUX1LAm4cjPZPtX2Ou0an9XIt/nbFTk4d5BTZ/NytV5FV9O193hsFNrd2yvZ1MXOd3hAFHJbNPfmnJRaLTEAIwfqqx834JUmfKQ3ONyRTt36t7cfAfGMUuskvf2x7SGVVDwcSIGafjzHdWliHAD4mQOP8wEzuuHznQgdo4SQUBI48B4Cau2oPErUM94tH/7X39f3wHICKb1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9/OZfjp3uV+g8s3IbKvCH9lCk2KBCO2H7gEf9gw3AQ=;
 b=JwZMQp6mll0MkzF1xB3IoBNq+0RcGsiJDabL5VdVq27IEDZEQPb6vUz9S5OUAhxwxwGKx62D46z7ajbY65vHoAodUb9g9eso8RERPZ/A8sO/w/sYZrnAurkCGWvxwjLMTimee0nz3ErcILQL9lecT3BUCTQbKdGs2L4UUZECqEc9Z+epim65zc5P6tk7hGwrF/O7h+NBhFibqHCLd25hQPpOydIty2XTQ+Xrb43NnApU4jyAjrxCyMX6BADIXKo1e3UKdQgmuSv/K12dvYS+RBB2W0ywX3eddlITE5JeDy9NeMQ8BAvn9F/bWVToypOurj7vKz+wUe2Onkd/Y+dVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9/OZfjp3uV+g8s3IbKvCH9lCk2KBCO2H7gEf9gw3AQ=;
 b=BZpjKYA8wu9R2QJiCnu55E/Sh/oJN/qcsZUXSV+VgFtjnDgUwOyx5yJoiqznX3k8NyE6cBwDB86Fw8k7wHb4AwIsPgCWweBzHT2kjGirBRrNnUBwTSx2L0pdgHcgjI8XCGo5ULZSbo4MHzSSdye+e1fKY+h2aD4fq7KshQ9L6q4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 15:19:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 15:19:05 +0000
Subject: Re: [PATCH v3 0/6] Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1615309297.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9099cb4f-b42f-f50c-c8ab-e55ef9da0ffe@virtuozzo.com>
Date: Mon, 15 Mar 2021 18:19:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <cover.1615309297.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0106.eurprd03.prod.outlook.com
 (2603:10a6:208:69::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:208:69::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 15:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98c24f72-caff-478d-6a4e-08d8e7c5ac05
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-Microsoft-Antispam-PRVS: <AS8PR08MB663190D8E75779559F673823C16C9@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ORZH3YMdDdeuJK+Yp+lpXu+yHuLs8pzIb0UE6sF+L26Yra3YDDcWtSRE3j9DolB7v8M5r7G+UvnAEZgL4/DOtyWgR68EGrpV+K9w1jrRwXY9qfI0IkUWeKvbNBXSOcwcx/Ju4x41JhHQwtcxXNPdLqUMQ6t4zZGuJNl6SvpvMlTe2pk5cI9ixB71Dju489yRGGG2OjjBGAue6IImZIs9wiFE75RxPqW/OEfZrM4b+tBdYoN8Qwyp+pMhB5m76ULP+hkSnhGEolvEr3HtRZsoiVLpsTv5Jv/4oc7RQrW6Ln+8pbsPff9W4o2KMPQ8MbHBSM3FwwNRN+Exk4h2H3mLqN28GTKpRE5aHOyXd1LOMHvdvJ3FaEphTGkFoQvn1VN02KxU0+htMDO4P7an/+YyjwMbpVbvMpn8LSPx57ePP787N5Ir/2tSldskjCCDiPfR7yfG9oRljmv5neqKy+eG419fCBmUsZf/ozdFBb4HSQqSqqN2pIkS7a55km5LmA9OeIml+y63dvuA/1Osa0TNmSY+Uuyi4woG+s8qnZzdB/FAf/ourbM/qZLeP7+txfzZL2fn7qO80iQl5SVM+htm6vZWdo65v55jgyWKiC/I0KpjuMNLteGOtVYz6LGMdQq4gn7SF6xkLEnnCpAWMol8BVLXjixSPyspgARoMCLNfhNa88rycPbPBtBp1xEeP6a8fYyQq4UesAibT0v4h46XedJ9vusPFqKc+7Ktjw6gfbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39840400004)(346002)(366004)(478600001)(86362001)(2906002)(4326008)(54906003)(966005)(16526019)(8936002)(66476007)(52116002)(956004)(316002)(5660300002)(6666004)(66556008)(31696002)(16576012)(186003)(2616005)(8676002)(66946007)(36756003)(83380400001)(6486002)(31686004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVNtZXNzT3QyalZZeW9UbjZJeE5XTzVtUWFLN0VDakhwL2lyK3JHVmFBRzl6?=
 =?utf-8?B?UlpPQk5MVGlDblNUZ01idFZDcXNhbVNXVlpEeURSME5RNTExVWNMQ2EvNllZ?=
 =?utf-8?B?eDVHd081blQxb2ozOHRDSUhLc1JybmI1eExveDMreldWc1BDd3Rzb29LU3pa?=
 =?utf-8?B?U2FWdDlyTWoxTVFaaHJJSFNBYjlHdzR3c2RBVElMLzFKSFR5dVpYVDYxZnYv?=
 =?utf-8?B?Q0luMlRYMDRXajV6RVQ5QlB3anVmbFRZQjlNRUxZSGh2KzNKTHJGTXZrSko4?=
 =?utf-8?B?TGF4NnVwVndkSlBHUXFMQjNNOVM1MFJUNWFCeHFUcFBkd2FJRGxuaWo5Sndo?=
 =?utf-8?B?Yy9wSUVYUzFrdEVoR0E5SlRSeHJmRUVQV0ZYaGRzYkhaQUNuN3AzVjNYbHFU?=
 =?utf-8?B?NVNJd2ExeHJ3dzlMd3VWV0lUTE1RdTVnQ1Ztd2thQjF1SngvUnplbnJTK25n?=
 =?utf-8?B?dlhmK08xQXdnYkZiWXI0d2hlN21HUnVRVUx0WThwSTk1ckE3WVVyeGJic05B?=
 =?utf-8?B?aHlCNnc3NU5JOFVKZUh0SFRld0h3TXJjTG04TTZ4R09FSW5uSGhFY2lLOTlT?=
 =?utf-8?B?aGpWcUFPbGVjL3pjb0V2cXRCdWdwaHM5VnR1TjBVbldYMDFzdFVVVVpDN1FL?=
 =?utf-8?B?NlF1RkovcXc5OVhEV1JYRFBhVDN1UkVIcmZ6dHRsVU1wc0J4RG9PWWFPYUxj?=
 =?utf-8?B?blFKR3dRUHl4ZFNtZkFteFRtUndUUVZzUmRlYmNxakFIbGZrNWF5LzZvUkY3?=
 =?utf-8?B?b0I5TGp4czBEcnBIeGZjZS9rYW95czNKcHowSmxRdVhpa2ZQU1pPL1UwbUtW?=
 =?utf-8?B?L08xT3MwMEhrM0g3OHk3cEF4UEtQUU9jVEIxdlgweExUc0JTMlhlLytORC9r?=
 =?utf-8?B?cGc1K1c1RzF1aVFUUStSQ1I5b0NMdUFVekVGNkYrVFdPZ1hNYUQzZEQwMmpp?=
 =?utf-8?B?ekUvbEs3NVowUzY5SXdFdWVoR3Y4NHRJWVo5ejRlN3Z0NUZVNjNrN1BsWFRi?=
 =?utf-8?B?d2hZSFI2c2FvNEpyY1lsaHBUVk1udXJsM2VKcHFGRmkrODNBVkRjaVlzVURW?=
 =?utf-8?B?b2w4aEZmNVhTcHdxU0JqNW9MbmdZUUUxVTZIcFB6SGlUcVNYbi9LbEY4R3Ur?=
 =?utf-8?B?QU9PRXFJNC8yZ1lITmFaWHZlckJCVng3NGlIejdPWDRxdzJmaEVWaDVZb1Ry?=
 =?utf-8?B?dVVmN0pNN01VOThrRW1ZNVowVE9tbHhzSG9sN0FpYzE0SGZUV2lyNnJEc3Y2?=
 =?utf-8?B?SmR0KzdQWHUxUDJGRnpHb3dvcDREVldrSHZMQS9yYWZLcWFuSm1UMCtwQklt?=
 =?utf-8?B?czZuZURjUXEremp5akd6dXJoWEMxYzhvTFFZSG5tR1BnckxhckV3N2hBYU40?=
 =?utf-8?B?K1pyMGxCSUtaY0dCNnhVaUJYSW9DWmZJZEZDR2Y0WFkzb2xhZlNmUUdYMjdP?=
 =?utf-8?B?azg5UngyWG1TRnJJWk04eHN0TEtDSzlNRWxoYWdLOXgwdkRiakZnTFhpUmNl?=
 =?utf-8?B?MDFIUHVSa1hwaWJUTjJudFgxQmM2V0ZHaGpPRllqWFJWUEN0Mnh0THZ4ZGg4?=
 =?utf-8?B?VmlBSXkrTWJlZlFJWUd3UDdEbThQazZGZ1VLUHk2TDQ0WWNLdmttZjREcU04?=
 =?utf-8?B?TzVaMEJOTU9ULzJKZUZpV0k5MEpZcmxrN2xpT29iaHM2UEQ2MFlKWFBMNldi?=
 =?utf-8?B?SHNrbW15S0c1ZUlJU1V6VzZLWHRwbERkRS9uU3JjcWMwRzl4VmdselhtU2FQ?=
 =?utf-8?Q?Us6hxuEAyDONvOuvUYWA/Mtn9nMGMPlM5Icqwne?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c24f72-caff-478d-6a4e-08d8e7c5ac05
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:19:05.5307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHFp6So/ibix0Yn2uentOTB3UAGv0Ohnogv8MbBwbJN/Y1ZgLyiNvvj/lqxyhYoeVNfA5/7d8L6EGs4i6gJnPPuJs2e9+5Ln8XSAseyKk0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.13.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.03.2021 20:08, Alberto Garcia wrote:
> Based-on: <20201127144522.29991-1-vsementsov@virtuozzo.com>
> 
> Hello,
> 
> here's the third version of the patches that allow replacing bs->file
> using (x-)blockdev-reopen. You can read more details here:
> 
> https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
> 
> In summary, the series does three things:
> 
>     - Allows replacing bs->file
>     - Allows reopening multiple block devices with one single command.
>     - Drops the x- prefix from the command name.
> 
> This is still depending on Vladimir's "update graph permissions
> update" branch.
> 

I've rebased my series and handled all comments on v2 (except for additional test). Now I have some iotests failing

(028 030 039 040 041 051 056 124 127 129 141 153 155 156 176 185 191 195 200 203 216 222 224 228 240 245 247 255 256 258 260 267 274 281 291 307 309 310 migrate-bitmaps-test)

I'll start handle them today, hope most of the failures is one stupid mistake. But anyway it all doesn't seem feasible to finish before soft freeze (tomorrow)..

> 
> v3:
> - Patch 1: Move bdrv_reopen_queue_free() to a new patch
> - Patch 2: Merge bdrv_reopen_parse_backing() and bdrv_reopen_parse_file()
> - Patch 3: Add more tests
> - Patch 4: Update documentation and fix iotest 296
> - Patch 5: Minor updates to iotest 245
> - Patch 6: New patch, drop the 'x-' prefix from x-blockdev-reopen
> 
> v2: https://lists.gnu.org/archive/html/qemu-block/2021-02/msg00623.html
> v1: https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
> 
> Output of git backport-diff against v2:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/6:[down] 'block: Add bdrv_reopen_queue_free()'
> 002/6:[0160] [FC] 'block: Allow changing bs->file on reopen'
> 003/6:[down] 'iotests: Test replacing files with x-blockdev-reopen'
> 004/6:[0042] [FC] 'block: Support multiple reopening with x-blockdev-reopen'
> 005/6:[0015] [FC] 'iotests: Test reopening multiple devices at the same time'
> 006/6:[down] 'block: Make blockdev-reopen stable API'
> 
> Alberto Garcia (6):
>    block: Add bdrv_reopen_queue_free()
>    block: Allow changing bs->file on reopen
>    iotests: Test replacing files with x-blockdev-reopen
>    block: Support multiple reopening with x-blockdev-reopen
>    iotests: Test reopening multiple devices at the same time
>    block: Make blockdev-reopen stable API
> 
>   qapi/block-core.json       |  24 ++---
>   include/block/block.h      |   2 +
>   block.c                    | 137 ++++++++++++++++----------
>   blockdev.c                 |  85 +++++++++--------
>   tests/qemu-iotests/155     |   9 +-
>   tests/qemu-iotests/165     |   4 +-
>   tests/qemu-iotests/245     | 190 +++++++++++++++++++++++++++++++++----
>   tests/qemu-iotests/245.out |  11 ++-
>   tests/qemu-iotests/248     |   4 +-
>   tests/qemu-iotests/248.out |   2 +-
>   tests/qemu-iotests/296     |  11 ++-
>   tests/qemu-iotests/298     |   4 +-
>   12 files changed, 351 insertions(+), 132 deletions(-)
> 


-- 
Best regards,
Vladimir

