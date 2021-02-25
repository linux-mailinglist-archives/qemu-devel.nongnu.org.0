Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A27325312
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:07:20 +0100 (CET)
Received: from localhost ([::1]:56036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJAd-0000Ue-Fb
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFJ8K-0006up-NZ; Thu, 25 Feb 2021 11:04:57 -0500
Received: from mail-eopbgr60095.outbound.protection.outlook.com
 ([40.107.6.95]:33504 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFJ8G-0005Qr-K3; Thu, 25 Feb 2021 11:04:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCUhs84He2vI9qf4o67XtAuQHI7FuW/q+4BmzzIwTcjHfv7g2Tigfsxp52y6izRosxXXfLq1UwJhIT0arOdw1LOu9XaqVkcHnQ3W0c4ymNEXL3eQ9EsMnkAbRW+z8K12e9kGCtztt1IgSyiR5YE3VINa3MTlcsfX0E4rfHDujPFxTcxdWa5Cmvgm/0HJzLfqOg776T1R5/stbNViDh547X50q4oBc/X5A5xcs4rDg1W9DDpzwdmI7fcqbPTkFfVgtuiVxMj3Ew7knELS+5fY8iVwDoKOe8h6VkVH3DsHb91EUDmN7/srWa71m8daU1lubeNr6hGPy2YPz4DN62l3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niPvt6rplu65dL8NxUHrB0FQReEUf8kNE4kNYWyK0zw=;
 b=QuFuHELl/pjRXEK88sMnFEu3t1obL0OhLDUbyIHkti4hXZTYeIOBHh9w7kQ6Zq297BA/297vX2oJ8J/JVPJdjr7M1cWP3e7Ysxi8fGKfyjxZMwh6Cu9PeL+z8N7+I8TXb/lYUtSvQufUS84gur/7GEPsgpLoPC6t9rNcroNN/6FNlPLTss1AsOoHtxobUFoBsLw4GoFFJvncMl1eWJPjIX89d0n21ikfO8qx9iW7SM6a2VskoqCqad/Ytr/wCvyrhu49BSNxhr4p8A+eZbmRrpwkAahqlzsAWl46PpU/8jTvOL7cBI1cO55EN0qTb1HOsfMo76+4Vl+bosZByzs8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niPvt6rplu65dL8NxUHrB0FQReEUf8kNE4kNYWyK0zw=;
 b=DdpNDr3uh51xaAOQFillqIjpSV9gi2cpj2LI76hpbSyNDKLadQfFBGLVo3B/66g36e4S/gzHaNDwbNNFO9UTcyHcg/a0JJ2pOJXTDBjRGicC5jx4iMvqP7IJokatqnbB6zZzdChxHG0pSx/hq88lcIEf74WHVe+Ff2BpsV1/rSw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Thu, 25 Feb
 2021 16:04:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 16:04:48 +0000
Subject: Re: [PATCH 1/5] iotests: Update 241 to expose backing layer
 fragmentation
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-2-eblake@redhat.com>
 <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
 <b471d0e3-b7cc-f62f-25a7-d7d59fe6093c@virtuozzo.com>
 <5a39103c-0688-5bb2-1f15-13c87d8f7892@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e114c49e-6260-9253-9827-b345ffbf1499@virtuozzo.com>
Date: Thu, 25 Feb 2021 19:04:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <5a39103c-0688-5bb2-1f15-13c87d8f7892@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0701CA0078.eurprd07.prod.outlook.com
 (2603:10a6:3:64::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR0701CA0078.eurprd07.prod.outlook.com (2603:10a6:3:64::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Thu, 25 Feb 2021 16:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24d3696c-86c5-4872-c07d-08d8d9a71383
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24194814EC941DBAE9702FC5C19E9@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +T3Tb2rqjeyTCCopN5Dj3PEacMBQimsZxPBfk0NxupY4Z8zOgZH/fbAPGfLA3/IvXqobW6P/KGWg9KQDKHtKFZcmtNjXEMItqBG0Q9rHMI2YWUJbO2HgtvLgAfRBdxAKWks4PTyJDUrEdBkwiKviZtyZ5M8+R05THmDWRY+YG2zH3D+0d+5w+JhrPI5Wsdj9PCroXdexZGeMletFnLnfAiiCbzvr/ROxko5hRRFMPCafTmH162jkVs0G+1Jf2PadVuMXxZFwFdulko0X4ZExWzKHJDOBnm19OLe8iK6bM5TXM82xc1REK9tkLO2DH+GoJO7IaXl3T6EE8okf4Fy564T3R/cJ62jcR5ePbC13wPyAYt4SCpLudLpHlJOHukLUo+lnuH1Mu3ubu46dNCdm0szm3tof56P63TqPz8OSqTkUCf7vPamATbvmjhTQBhYrMRgrtVmO80k6GcELnbDed1XqKNwutcMedbTk6QCY0J6n4dEIr6Nyp9yzu/bgX1WNxY/D6uRhgLmFLuMKEA9JMSGfeM8Gl7XXeLFzRuiZz+00/PUJKReLXoLt3Qkp93ilYFZf0u86nviskF2d56eFEunDIL5RpXpXjTbYvV/RDD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(396003)(136003)(376002)(4326008)(66946007)(8676002)(54906003)(53546011)(6486002)(31696002)(86362001)(83380400001)(66476007)(66556008)(52116002)(2906002)(316002)(2616005)(36756003)(956004)(26005)(478600001)(16526019)(31686004)(186003)(6666004)(16576012)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2VoRHV4YTBlL2dtMGV5NzJYTVBrMWtxdldxejNQRkx5OUQ3am1oQWxMUGJH?=
 =?utf-8?B?QTZaMy9sSVRJeURHdmQ2N3l6bEZkYkRGN1RuR3JPS0NOaXJKME82ZTVUZ3Jn?=
 =?utf-8?B?SFBUY1B4bW9LNGh4SU1xUmlZODZ5c2MrenNGV01ETHdFTnRWM2RSYkpra3FR?=
 =?utf-8?B?dWJkcUhZMllzV2xUTDVEVVhaVmY4WEFOWm5Ja1B0SGpOeDBFbTRVL0J2QXB5?=
 =?utf-8?B?ZlY1UzBtL1VwQzM3UDRWV1pKdFlpSldXMUpDQ0hMY0Izc0NkbE9RT3Exc09N?=
 =?utf-8?B?S291emtoQnE4enpVd08rRnlWemM3em1Rdk40UHpBY3ZHTWYxOTNVY2VTRWxZ?=
 =?utf-8?B?VUhmVXN6ZjlkRTVQTDlPVmM1cnhqSnU4UVpYbXVFZFpwOEVqOE9nVTI1YjR2?=
 =?utf-8?B?a0c2ck5kaGN0Z3J1UlhzR2xDNEVzUXB0K3ptTFNqcFVURDlsS2dFL3RaYU1h?=
 =?utf-8?B?N3pRKy8vblkzOHZXakMybk03MXVVb0xjM3g4SHozNXI2WEIvYjA1ZGljMWJy?=
 =?utf-8?B?RXJ5QzUvVGNWMXF3N2UzTDl1UlB3RGhKQ3lRSGlsRGplTVlkZ1lON01Na0c1?=
 =?utf-8?B?S0g4MDlwR3BKeDJaRW54Y2pQdSt5QTJKSlRKM2RQbzhtcWV1VWdmZzluOWNX?=
 =?utf-8?B?dHMzS0EwWmpYa2tmbUN3YTBSOWp5VkFvdm9NbTZlMzVaTmgwQzVtOHlKa2ti?=
 =?utf-8?B?dWZOb1pNK0pqcm4yK0c2YlhwZkptRXZsN2hITDhZMWF5RmZneTU5NmNYNzFx?=
 =?utf-8?B?U2VqRW9nd0hrUXI0S0VXZGxESC9LSHZySjE1RndIVHhsbW5XQ1dFQ0NBWG05?=
 =?utf-8?B?SUlXeVQvMVJMdzl6VC8waGZMNFZ2eXdtemxFUFNFOEQ0L0JLTEVmcVRrcDAy?=
 =?utf-8?B?ejNJbENuQWlvK0lsVVNPUEwvVTZQdUVlQWhwVDU3NHZFMjBDQ1hCYVZ6a2p2?=
 =?utf-8?B?MU40MnF6eTN1KzFoZ3RhazJLR1hRMWI4WlduV05wd21pWnBDUEt3cm1Ea05w?=
 =?utf-8?B?WTBEWkhDME5TSzlxNXhtV0JyZG4yUFNmdlIrY3lVWHB0RVptNWxPeS95Szdz?=
 =?utf-8?B?UWh2N3FyRjRkN2Y1K2EyY0pSY1ZZNGxWRHk3WjVDVnk4YzlaUHFGOGUwdlhM?=
 =?utf-8?B?cTRQNWQ0VmdLeWtlNHBXMHFtVDFPajdLeEU4U3EwZHVNaFNNZWVqOWVKaEdE?=
 =?utf-8?B?dDhBNzZCL0dWdTZlS2xoekppOEhCcTE2Njl4YU96UDRqMG1aRzVLMXJodkxY?=
 =?utf-8?B?aDYzcDlCeER0S1ExbFRyaTlwSm05QkNpa0hQMFVJTzNqOS9qNFBuUnZXUzVz?=
 =?utf-8?B?NGs0MFlueHFac2RtNkh5UU5STGJpRXpDZ0tML0krOTNMNDZLVit3MjU0dnp5?=
 =?utf-8?B?TTNSQ1g0WHRnQnJqVVZtTUNHdWVSTXAvbmZoMFp3M2ZYRktHcE1pL0JXTC9T?=
 =?utf-8?B?d3NHeWNqWlFSaXlwKzVCWGpSUnhiMWgyUkFULzJhd2RzeDJyVjBtZWprQXlw?=
 =?utf-8?B?Q2Iva1E1UDhZQklIUzR2WG8xT2MyT29HbVh3eG9IRi85THZ4aGdEdG9YVEFw?=
 =?utf-8?B?Y2tUSTdXNGQ0Y1VOZDZPSDBWZ3lSaG1ZRWdodnk2bW9EK2ZDdU03T1JpeW9O?=
 =?utf-8?B?b0Nqa1hOd2duV0h2YmM5UW5xQ2dHRHZkWnFzT1hkdkRkc2R5RkMzbmdNalBj?=
 =?utf-8?B?RnAwQjZSd29ybVlsZVlubkRZc3V5Ym54QWJ4Tk1oNUV0aW5uU0ZuM1YwOWR0?=
 =?utf-8?Q?nX2gnytbh2NH+QqUpeJi4IWUVMhhVafDKS1RhzP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d3696c-86c5-4872-c07d-08d8d9a71383
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:04:48.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tmn+bzDfb6DmRwWz1ju9FL983BT618GptKcOWYA8/uMHLvnLDi18yvq5bKY0097rjWw3Ac9xu00Lch5tQI24N5TtN8RO3ZiJy07+iFTAMcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.6.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.02.2021 18:52, Eric Blake wrote:
> On 2/25/21 8:57 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 25.02.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
>>> 18.02.2021 23:15, Eric Blake wrote:
>>>> Previous commits (such as 6e280648, 75d34eb9) have mentioned that our
>>>> NBD server still sends unaligned fragments when an active layer with
>>>> large advertised minimum block size is backed by another layer with a
>>>> smaller block size. Expand the test to actually cover these scenario,
>>>> by using two different approaches: qcow2 encryption (which forces
>>>> 512-byte alignment) with an unaligned raw backing file, and blkdebug
>>>> with a 4k alignment.
>>>>
> 
>>
>> Now I don't think that aligning qemu:allocation-depth information is a
>> correct thing to do.
> 
> Why not?  First, it's very rare that you'd have a qcow2 image with
> mandated 4k minimum block size, backed by another qcow2 image with 512
> block size (blkdebug made it possible to expose the bug, but I could not
> find a way in common day-to-day usage), so we really aren't impacting
> normal users.  Second, from the perspective of copying backing chains
> over NBD, what difference does it make if we have the backing chain:
> 
> A (granularity 512) <- B (granularity 512) <- C (granularity 4k)
> 
> with the allocation pattern:
> 
> A: -A-A-A-A-A-A-A-A
> B: --BB--BB--BB--BB
> C: --------CCCCCCCC
> 
> and report the allocation depth as:
> 
>     2222222211111111
> 
> instead of
> 
>     0322032211111111
> 
> The former may be imprecise, but it obeys our bounds, and in all
> reality, if all we have access to is 4k chunks, any decisions we make
> about how to handle that 4k block should be based on the fact that at
> least some of the data was allocated in our backing file, and not
> treating the entire 4k as unallocated merely because the first 512 bytes
> are neither in A nor B.
> 

I'm not sure about NBD client, but in qemu block-jobs the decision may be different for different tasks, as I mentioned in my answer on [2/5].
For example block-stream will skip chunks allocated in top, because nothing to do, data is already in top. But if we imagine that top may return ALLOCATED for something that is not ALLOCATED the stream logic is broken.. Probably that's a bad example.

I agree that this is a rare case anyway and we probably shouldn't care too much. But we should at least describe it in allocation-depth specification.


-- 
Best regards,
Vladimir

