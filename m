Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3C319210
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:18:51 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGYD-0005jP-TI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lAGVZ-0005AN-Kz
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:16:06 -0500
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:45188 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lAGVV-00047x-8l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:16:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFIgQZUfabYY3P1mRTIem6k8ilet2+ORjCrHKn0Jma3vU9rMY0RycW69mgxoPuE/xZGJT0Xj6MFGDqD5qORaxgPZmrjL526wF5HaXu3VNBwkasugWFvMnPjnbGVTIvqM9+17SrCoFX9LZHxXmYN93+//lkbfLR5If1ZAAw9xOD6pFMWMzQUD1XGSg4lao/P7koohlqrHab2d55DgF+O76GDudbRLpnCQINC9SVUvvxDPhXGC+0O9r5mA0vbbL50xHNEMwi07pnssSOo2BFd/tMrZCrWfdRXWiP8H7jd8hyIz0axYLI3Lq4mR2Cebq1xCpXYcKXJ7U86kGWVx15cnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyG6bp/VDIchImrj2K1k5le6+JAQiFjmbWLDGXA1pJg=;
 b=KMwQNBA7bM3tQqU/hMkCqYFQZbFZ0oJpwq11zxv5AMtwiMAAwhj/elmyXShkfb8QZAXvMpEKDHt5MuEpfIsh8gmxo0Rp0cVaTnrkvl29bpYQX11bJ5STyuHJMwaR3SPsfHGtwX500wJBublZrnNswZ06PKGymtgfeoe+vhhXETaXYoUJy/MzymZCiHXDkuf9q/6g+PhjuddhtgiGOW+4tWRZatSWCtGkjs2CRoHjquRdZIz4GfpwgZAkpATt+Q2EaEo3x49rks6A0SfPIHe59yAhawy1E2/9fN9gi7VYaNCyUUby390/RGbo5KDTt9I5NEhxIALJUsD0EFPLxE+BdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyG6bp/VDIchImrj2K1k5le6+JAQiFjmbWLDGXA1pJg=;
 b=cm6r1UtmQFqyKCl79wzzIXEXIJ/T04rX9NBZlEMA0FdkOQnXMwyhOhXC7EY7ClQ3VxDMiZuN4BkPSIu0fF7/yunkYomIDUM4HUOeV3pcgkbNCNEh9Ee+fPsDLQHcQ0Hageuz2/6G4tbd2lTqAySJyHyIr1QtmhyZxDJ/j2e3MjU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM6PR08MB3366.eurprd08.prod.outlook.com (2603:10a6:20b:47::32)
 by AS8PR08MB6279.eurprd08.prod.outlook.com (2603:10a6:20b:294::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 18:15:55 +0000
Received: from AM6PR08MB3366.eurprd08.prod.outlook.com
 ([fe80::981a:7a52:b412:d119]) by AM6PR08MB3366.eurprd08.prod.outlook.com
 ([fe80::981a:7a52:b412:d119%3]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 18:15:55 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <20210209200928.GB103365@xz-x1> <20210209203143.GC103365@xz-x1>
 <fa670b07-58c3-f0cc-c358-82c4cbc4deac@virtuozzo.com>
 <20210211171844.GB157159@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <6d2af92c-b20e-545d-f6e8-315454eae461@virtuozzo.com>
Date: Thu, 11 Feb 2021 21:15:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210211171844.GB157159@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------FF77322846909CAD59A47013"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM0PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:208:69::17) To AM6PR08MB3366.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM0PR03CA0076.eurprd03.prod.outlook.com (2603:10a6:208:69::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 18:15:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10240ffa-61a4-470f-1862-08d8ceb912eb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62799C2B48D5A3F9F8200C5E9F8C9@AS8PR08MB6279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRyMetZGdFQRSw+aDTN80ZJizH5DyTsuN96KTAKcBGDEVIiS0goCfuViKaPaOgAeEocIImcF0R8ZUvgaHWa3vlKwjSeP/Dy2Xt0NrN6YsdiVL6+mlj7NQ6I0NdHOffsTY9RKITP7ZEDvXckJubBzue6KRIbJR3xtu2MomG4r5qRD2jlqsw9waV0YYyx/O0WJMTdds9Y+2Ne7Z98hDvXBM7y/33MTVzkhhw/eT41Ym3E9FaX3CKulPqjG/9gW85SXKqgPVvJ80nHNLeUsGV48fEFxphMSAnVcLNco9IlAxYQKGzMjMq1wxY8amoPg88BkcQ37zVy1YXbOR+egLE9zFPbL4qpNs5I6gVx9BOaR61BHSg0x6bpR15OSmOrX5UwaYlNf1MKcE3x7NI662fRzds8z0CocqhWHpCtBDIiZxgm99qO0p4OLf0F4JvSovwX0KrUyAcTx3dxVpb+hnQK/UZY/wTA3b8BVxbtiuo9dPTpPKsdyQltbylLJVN/ygyNsGNUA+ZM3CbxtqJK3XwNs+RjHZ/nVX6KsBn8fKFKZMtpe3VkKEowQZKhC6CaTkM0j+RJjNTJsTfRXxFBe91jPLcAeUA0DhlKE6JG5wPP7JwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB3366.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(33964004)(478600001)(52116002)(5660300002)(26005)(86362001)(956004)(2616005)(186003)(36756003)(6916009)(66946007)(8936002)(16576012)(6486002)(316002)(31696002)(31686004)(53546011)(107886003)(4326008)(8676002)(2906002)(44832011)(16526019)(66476007)(66556008)(54906003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmV6cHdqcGFCNU55V2VEVVN3ZmJuVEJMMndDckoyVkF3VisrajZRZUE3Smo4?=
 =?utf-8?B?aHVHeTZxdk1pcnlySy9iZ3UvcUZqWk1yZW53eUhiMDBxS2ZhOGpIMkV2TlU2?=
 =?utf-8?B?WnYrV0xFRERISU9GbGJPNHdmZXN6VGVvMGs1UERFNmhLY3RkNzZHMXpqY0R3?=
 =?utf-8?B?RzNkamNVZmlQbk82MGVrNFpGenVFNmhYVkV1U1VWTGlGWllFQ0xZelB6RWU4?=
 =?utf-8?B?UFRmRmVTUXpabmJJVHpwenA1ZktKQmtRcUxGblFZYk9wTkRNcnREZFdIbUh6?=
 =?utf-8?B?L2VEeXJaa1RxQTA2dWlTYlRxRzZ6TjYyNS9MRVcyakpaOEVtcFUvYUMzL1ZJ?=
 =?utf-8?B?a1Fvd1JNdVlBVnVncXlmRlZPMU1hWlBFNGw1UlFGR3BlcmJKMUFtOS9ENnd5?=
 =?utf-8?B?K1pwRkNjbEpTcTlFR1J1MjR2bm45SGROZlRjd3JSSjFJMDRwT0tsT1BZTS9U?=
 =?utf-8?B?TE1QY0p5Z2RUMHNHNjU0MnlBVlJ4bVUxTzZIclZaUm5UM2NJOFlyY2IxaUdK?=
 =?utf-8?B?clV6WmFYWncyOTd6ekg0Vk9HUVRsUWY4Ym1zRXBnT3UyYzBhcUtQU3ltUFRq?=
 =?utf-8?B?MGpid0J2bWxRd3lHRDZUZExyMjhkWFFXdHRiZGJKdUliNWdQbTNDSjdyZDg0?=
 =?utf-8?B?WHVoWUgxR0F2cFlMWm50QmY0dDh5bkQvYnBEclhYZjFrWTRvV2lNbVJmSXUy?=
 =?utf-8?B?b3A2VXhoeW56M0VFTVFiOFpNRjF0UGlJWmlqdmh5czZTN3d6bDhxbk91RnI4?=
 =?utf-8?B?b2lsTEp4dkpncDhEQTZ3SFNIeHRSemE1aVdVTkVKampQaFdoekdiUTRpaWVF?=
 =?utf-8?B?b2ZTNk0wT0RpNGd4d1lXQWdWcnNsc0x4UzlRRzVRMFZCL1BkSlhSTXVGbkhn?=
 =?utf-8?B?dzBwdldVVDRJd1pQSTNFNzk3cVRqSXV1eWRhSmt1UXprZXdlaVBaSWxnL3Fu?=
 =?utf-8?B?Z3ZXQWU2eG5LZk5Fd3F2SlpNMmp5b1F4L0ZsVTVuV1cwZndMaTNmczRpUUI0?=
 =?utf-8?B?OWJBdERKaVdVSWNqZjQ2QitSbTNDL0FMTTVSTU82aXdobXdtZnZoczhtR0w2?=
 =?utf-8?B?eE82TFhvZ0RrS1lENTFLYmdKVnk5RmMySUVacHpDMVlWRzVmbGcxYmJYcU50?=
 =?utf-8?B?anUvQUdnOTBvajBBSllVR1F2T3pkVnp0NUF0bFBiaHlVdmdkbzdFUU5iOHg2?=
 =?utf-8?B?a1hUVG40VlNscFVpRnF0cGlxc2FIei9HbWttTHNOUUw3cTZHMERSTDRmc0xS?=
 =?utf-8?B?SkdlWXlQanZlblIwZkw3RDVkako1WmZIMFRXN1hWdW8yWE5JRVpoZVpTRjNZ?=
 =?utf-8?B?bml6QXZhaGdkUlEzZXpmNHlEa0MyMWR3UWxqYXVSYmFBWEk1SWMrT1RjSW5w?=
 =?utf-8?B?S2dEendJK1k1cFkxcDdvRUR5MXM3UWxINDB3YmFVZTh1ZmhiODZJVmg4bXQ1?=
 =?utf-8?B?U3pORW5Gejc5bU8vRUllSUtXY3ozbHNSQ25kMVR5TUZ0RmZPM3lOZWpiM2ZR?=
 =?utf-8?B?MmFJRHptTHVBNXpQSDNRd2k0R0V4RjB5ZjJ0WGdENVc2eU5IaitNbE9YS0d2?=
 =?utf-8?B?blU4VFByczNNWlRmbjQzNDVLUHoxZVdzd2hoK3dWWjRUTi9reU80NXVPbVRk?=
 =?utf-8?B?WWgrODRzdUdqcUFpck5XU3owbWd3RG9mM1F1anlpSm5weEE4U05nUjVlTUhH?=
 =?utf-8?B?bG5GQ0ZIYnVwbzlwNDFUQlhSazRLbVc4UTY5dFV3L0ZZeFJ6Yy9ONmIzcHYx?=
 =?utf-8?Q?6ayHTIUUISdjAErWcNr4buUkf1Ian6WeHimWEN8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10240ffa-61a4-470f-1862-08d8ceb912eb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3366.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 18:15:55.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXW7PwsXY/sUxlqNHyTG9QnpkSs6sA76VwWqFIm4LKX7g8YQPzCIHemjFd0NuaZdlZwRvjMZrXf83oXkV5d4u5SO+VsnQzdvYVM92zxhPEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6279
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_NONE=-0.0001,
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

--------------FF77322846909CAD59A47013
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.02.2021 20:18, Peter Xu wrote:
> On Thu, Feb 11, 2021 at 12:21:51PM +0300, Andrey Gruzdev wrote:
>> On 09.02.2021 23:31, Peter Xu wrote:
>>> On Tue, Feb 09, 2021 at 03:09:28PM -0500, Peter Xu wrote:
>>>> Hi, David, Andrey,
>>>>
>>>> On Tue, Feb 09, 2021 at 08:06:58PM +0100, David Hildenbrand wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> just stumbled over this, quick question:
>>>>>>>
>>>>>>> I recently played with UFFD_WP and notices that write protection is
>>>>>>> only effective on pages/ranges that have already pages populated (IOW:
>>>>>>> !pte_none() in the kernel).
>>>>>>>
>>>>>>> In case memory was never populated (or was discarded using e.g.,
>>>>>>> madvice(DONTNEED)), write-protection will be skipped silently and you
>>>>>>> won't get WP events for applicable pages.
>>>>>>>
>>>>>>> So if someone writes to a yet unpoupulated page ("zero"), you won't
>>>>>>> get WP events.
>>>>>>>
>>>>>>> I can spot that you do a single uffd_change_protection() on the whole
>>>>>>> RAMBlock.
>>>>>>>
>>>>>>> How are you handling that scenario, or why don't you have to handle
>>>>>>> that scenario?
>>>> Good catch..  Indeed I overlooked that as well when reviewing the code.
>>>>
>>>>>> Hi David,
>>>>>>
>>>>>> I really wonder if such a problem exists.. If we are talking about a
>>>>> I immediately ran into this issue with my simplest test cases. :)
>>>>>
>>>>>> write to an unpopulated page, we should get first page fault on
>>>>>> non-present page and populate it with protection bits from respective vma.
>>>>>> For UFFD_WP vma's  page will be populated non-writable. So we'll get
>>>>>> another page fault on present but read-only page and go to handle_userfault.
>>>> The problem is even if the page is read-only, it does not yet have the uffd-wp
>>>> bit set, so it won't really trigger the handle_userfault() path.
>>>>
>>>>> You might have to register also for MISSING faults and place zero pages.
>>>> So I think what's missing for live snapshot is indeed to register with both
>>>> missing & wp mode.
>>>>
>>>> Then we'll receive two messages: For wp, we do like before.  For missing, we do
>>>> UFFDIO_ZEROCOPY and at the same time dump this page as a zero page.
>>>>
>>>> I bet live snapshot didn't encounter this issue simply because normal live
>>>> snapshots would still work, especially when there's the guest OS. Say, the
>>>> worst case is we could have migrated some zero pages with some random data
>>>> filled in along with the snapshot, however all these pages were zero pages and
>>>> not used by the guest OS after all, then when we load a snapshot we won't
>>>> easily notice either..
>>> I'm thinking some way to verify this from live snapshot pov, and I've got an
>>> idea so I just share it out...  Maybe we need a guest application that does
>>> something like below:
>>>
>>>     - mmap() a huge lot of memory
>>>
>>>     - call mlockall(), so that pages will be provisioned in the guest but without
>>>       data written.  IIUC on the host these pages should be backed by missing
>>>       pages as long as guest app doesn't write.  Then...
>>>
>>>     - the app starts to read input from user:
>>>
>>>       - If user inputs "dirty" and enter: it'll start to dirty the whole range.
>>>         Write non-zero to the 1st byte of each page would suffice.
>>>
>>>       - If user inputs "check" and enter: it'll read the whole memory chunk to
>>>         see whether all the pages are zero pages.  If it reads any non-zero page,
>>>         it should bail out and print error.
>>>
>>> With the help of above program, we can do below to verify the live snapshot
>>> worked as expected on zero pages:
>>>
>>>     - Guest: start above program, don't input yet (so waiting to read either
>>>       "dirty" or "check" command)
>>>
>>>     - Host: start live snapshot
>>>
>>>     - Guest: input "dirty" command, so start quickly dirtying the ram
>>>
>>>     - Host: live snapshot completes
>>>
>>> Then to verify the snapshot image, we do:
>>>
>>>     - Host: load the snapshot we've got
>>>
>>>     - Guest: (should still be in the state of waiting for cmd) this time we enter
>>>       "check"
>>>
>>> Thanks,
>>>
>> Hi David, Peter,
>>
>> A little unexpected behavior, from my point of view, for UFFD write-protection.
>> So, that means that UFFD_WP protection/events works only for locked memory?
>> I'm now looking at kernel implementation, to understand..
> Not really; it definitely works for all memories that we've touched.  My
> previous exmaple wanted to let the guest app use a not-yet-allocated page.  I
> figured mlockall() might achieve that, hence I proposed such an example
> assuming that may verify the zero page issue on live snapshot.  So if my
> understanding is correct, if we run above scenario, current live snapshot might
> fail that app when we do the "check" command at last, by finding non-zero pages.
>
> Thanks,
>
Yes, I understand the limitations with vma's which lead to the fact we can write-protect with PTE softbits only.
I think mlockall() is not required, just need mmap() with MAP_POPULATE. Since the problem is related
only to pte_none() entries.


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------FF77322846909CAD59A47013
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11.02.2021 20:18, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211171844.GB157159@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Thu, Feb 11, 2021 at 12:21:51PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 09.02.2021 23:31, Peter Xu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, Feb 09, 2021 at 03:09:28PM -0500, Peter Xu wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi, David, Andrey,

On Tue, Feb 09, 2021 at 08:06:58PM +0100, David Hildenbrand wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Hi,

just stumbled over this, quick question:

I recently played with UFFD_WP and notices that write protection is
only effective on pages/ranges that have already pages populated (IOW:
!pte_none() in the kernel).

In case memory was never populated (or was discarded using e.g.,
madvice(DONTNEED)), write-protection will be skipped silently and you
won't get WP events for applicable pages.

So if someone writes to a yet unpoupulated page (&quot;zero&quot;), you won't
get WP events.

I can spot that you do a single uffd_change_protection() on the whole
RAMBlock.

How are you handling that scenario, or why don't you have to handle
that scenario?
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Good catch..  Indeed I overlooked that as well when reviewing the code.

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi David,

I really wonder if such a problem exists.. If we are talking about a
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I immediately ran into this issue with my simplest test cases. :)

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">write to an unpopulated page, we should get first page fault on
non-present page and populate it with protection bits from respective vma.
For UFFD_WP vma's&nbsp; page will be populated non-writable. So we'll get
another page fault on present but read-only page and go to handle_userfault.
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">The problem is even if the page is read-only, it does not yet have the uffd-wp
bit set, so it won't really trigger the handle_userfault() path.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">You might have to register also for MISSING faults and place zero pages.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">So I think what's missing for live snapshot is indeed to register with both
missing &amp; wp mode.

Then we'll receive two messages: For wp, we do like before.  For missing, we do
UFFDIO_ZEROCOPY and at the same time dump this page as a zero page.

I bet live snapshot didn't encounter this issue simply because normal live
snapshots would still work, especially when there's the guest OS. Say, the
worst case is we could have migrated some zero pages with some random data
filled in along with the snapshot, however all these pages were zero pages and
not used by the guest OS after all, then when we load a snapshot we won't
easily notice either..
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I'm thinking some way to verify this from live snapshot pov, and I've got an
idea so I just share it out...  Maybe we need a guest application that does
something like below:

   - mmap() a huge lot of memory

   - call mlockall(), so that pages will be provisioned in the guest but without
     data written.  IIUC on the host these pages should be backed by missing
     pages as long as guest app doesn't write.  Then...

   - the app starts to read input from user:

     - If user inputs &quot;dirty&quot; and enter: it'll start to dirty the whole range.
       Write non-zero to the 1st byte of each page would suffice.

     - If user inputs &quot;check&quot; and enter: it'll read the whole memory chunk to
       see whether all the pages are zero pages.  If it reads any non-zero page,
       it should bail out and print error.

With the help of above program, we can do below to verify the live snapshot
worked as expected on zero pages:

   - Guest: start above program, don't input yet (so waiting to read either
     &quot;dirty&quot; or &quot;check&quot; command)

   - Host: start live snapshot

   - Guest: input &quot;dirty&quot; command, so start quickly dirtying the ram

   - Host: live snapshot completes

Then to verify the snapshot image, we do:

   - Host: load the snapshot we've got

   - Guest: (should still be in the state of waiting for cmd) this time we enter
     &quot;check&quot;

Thanks,

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Hi David, Peter,

A little unexpected behavior, from my point of view, for UFFD write-protection.
So, that means that UFFD_WP protection/events works only for locked memory?
I'm now looking at kernel implementation, to understand..
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not really; it definitely works for all memories that we've touched.  My
previous exmaple wanted to let the guest app use a not-yet-allocated page.  I
figured mlockall() might achieve that, hence I proposed such an example
assuming that may verify the zero page issue on live snapshot.  So if my
understanding is correct, if we run above scenario, current live snapshot might
fail that app when we do the &quot;check&quot; command at last, by finding non-zero pages.

Thanks,

</pre>
    </blockquote>
    <pre>Yes, I understand the limitations with vma's which lead to the fact we can write-protect with PTE softbits only.
I think mlockall() is not required, just need mmap() with MAP_POPULATE. Since the problem is related
only to pte_none() entries.


</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------FF77322846909CAD59A47013--

