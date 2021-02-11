Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A8318734
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:39:05 +0100 (CET)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8RE-000399-4b
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lA8PJ-0002Xn-8D
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:37:05 -0500
Received: from mail-eopbgr80135.outbound.protection.outlook.com
 ([40.107.8.135]:26107 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lA8PE-00078r-Cs
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI+5s2iP1AqSccMLE0GcVOI66XRUCkxBIXIR7RLdJLPzzs7wfcug4ofqq7dLNOa+KsKnekXyL0QRRjPgSSUZn+nvXZsWyzklQvJrWhtk5n235c3UzrBx5P2f9O9QJFAzX5Kvmg2l5VVrqvJ65wJWXEPgjyoPY++rt+Rb0dDLNRJPhGkvfbsws6L95Yy8yMSvDnh/tFnSMFQ4r+uOWnFIZ26/oUZzCH36WUve0VDYUC1NlnF+aKR92UN6CdGe0WGVRxzibbiRs5PM/9a5j6wixHqyPEcCN2OicEqM0J/IkzD0G5g2JQru/waOLQSKmptIhPXadDUiCZnWRdi3rAW+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOS+CInCHX7UBsawHMwQHENDeVFMVW6UHqivqUV2YwY=;
 b=XnqtvUbW8APfcqtnjmxRZnXVNIH/qfW+jvkNg7DUkB4IcPXe8gGD21pMik4qtZ9Z8B+TaucNSjWYR5Wq3jWIxJJhRtswMSEyn2zmOQtIA/y59hCQpPHbD4E6r93wgRmTiFIDEgLeLP5Aq6+GI7U5p02Gkw14tR93bkb6nj4tVwqrmZLpebZ4it2LiZF/8qn6s+TC0uN8CsUa0c4Ef7ldapnNZ0QepVaB/M+6MB501Yhf4VycC3d+tdV5Yb0FsPmli9VeoGxywHzty4Xc3WDYpVjsako56aShCI9fvI5dhEtX2dEaK7gRUfAi1u72vJR0rAawrycCtoBjcrezuQvI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOS+CInCHX7UBsawHMwQHENDeVFMVW6UHqivqUV2YwY=;
 b=c2qVPQyEpNvgayWMTODRysGM08Chy4JfW23aO19NF8PT0HDcrnNN7SZkgPVLOYc0uS4UuYe35dt7Ip4eEGo81TLSFfguabaxF0Y/YvTCtnXnGUYEHW3uJe2Wjyns4z7SpFrMswi+8JV6PsOYAq8iQF2aDuSpW7XC6hhA8XqQLHo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM6PR08MB3366.eurprd08.prod.outlook.com (2603:10a6:20b:47::32)
 by AM5PR0801MB1956.eurprd08.prod.outlook.com (2603:10a6:203:4b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 09:21:53 +0000
Received: from AM6PR08MB3366.eurprd08.prod.outlook.com
 ([fe80::981a:7a52:b412:d119]) by AM6PR08MB3366.eurprd08.prod.outlook.com
 ([fe80::981a:7a52:b412:d119%3]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 09:21:53 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <20210209200928.GB103365@xz-x1> <20210209203143.GC103365@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <fa670b07-58c3-f0cc-c358-82c4cbc4deac@virtuozzo.com>
Date: Thu, 11 Feb 2021 12:21:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210209203143.GC103365@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------B3935A3D2D31AF6E64543BB3"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM0PR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::15) To AM6PR08MB3366.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM0PR01CA0074.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend
 Transport; Thu, 11 Feb 2021 09:21:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b40ecb-1cd9-40e2-84a4-08d8ce6e7807
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1956:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1956CF7040A3F1A16BD14B349F8C9@AM5PR0801MB1956.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IMjzDZahk34m39lVwdWOaBhXqMJrOaIhpYV5HxoP7Y1SV9J1eE9HOQVT1+FAX57QLzBEv22AR/HlYwTX2D1Cp81QlMzeJwTKJvCodQPiTzs5pGQH83OZ3Vh07eIzhgi2f4KyMuTSVcijskjhlmXC9/4TgjTl4HDf0di6i7sl2gzG7PFhpQ+/bc6QHnRpmzIehj6YB28J0GubY8BwVnrKK8GI/5Z2BKucI497r/iS0AL4ihkbWfqgneWa/yeOFk+X8TlVupObQu5E2FD4f60NL/7ScOBL4Q+FqWz018njSpux66jPHQQ7HAMiTrYPtuGmoo2pZZxzGF6bL42oLb5Yz7JIc78dTqpCSGAy09jSCM+sAy3NeMOJ6JgaqQHHgyuS1zAS8Q6BWi+wioGQbm/ptveprpZSq06ef8aN1wogYBEUI4DuC/N2Ay/xuezlsSXsa7UkgMHnv8/bQtAskWYoBwnn9psflaG70SdcqS0Icu3S3tESCLOLxrcAvt+U0THaVs/XzHpr2OsfjBEPzB4S467j09+lGhPEb5Vzy7l2kbQ2oEzfFf0dnIPg1o4OWBkuA54PgYD/e0HaH2HsTKEb4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB3366.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(366004)(346002)(376002)(136003)(36756003)(33964004)(8936002)(66556008)(5660300002)(66476007)(86362001)(66946007)(2616005)(31686004)(31696002)(956004)(52116002)(16526019)(53546011)(2906002)(107886003)(6486002)(316002)(83380400001)(110136005)(54906003)(4326008)(186003)(26005)(478600001)(16576012)(44832011)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dm1pVER5L1pYRVNtbklaNTBOMzZlVlNuWmJxTEtsN21hMGdqUFFPMWEvQUpQ?=
 =?utf-8?B?LzF0aVRac0dUY25lVExlSWI3WGprdUVPdVVHdmpqcE5tNzhWRkxTQWVmbWZp?=
 =?utf-8?B?WHBkQ2ZGVVpFUCtCVHhocGlOOFZaNzVNdzg0eFpZclh4WDJJUUZUVE4zOW1t?=
 =?utf-8?B?ay85NEFFVkFSdytCZzdEUHB6bW1iNDF6dG9wTEN2U29PNnlyMFNvV1ZTcDZM?=
 =?utf-8?B?UjFJMFpvR1EycXkvT3U5ZjBlUXRwa2hNQ29JNUhFU3QwVnlmWmdrbFRTNm1E?=
 =?utf-8?B?ZjBIZ0NyZ1hONUQyTFlNU1Jzak11bUZDV0IzVGExKytrcmVVRFh1NmRoeklx?=
 =?utf-8?B?eGFmNUl0aVludUVOT1ZaaksrTE1sZWdCL2wvdlExNm1nc1B1a3VGWERyNjJM?=
 =?utf-8?B?NXB3djArZ295NmZPZGhld050M3Q2blhSRUFrWE5EUGxoREV0TkxJQ1VKYmpt?=
 =?utf-8?B?RWRUL0NsL0JMUXU4Z3dsUzZhMGdNZWV6U29XNnN4YVpTb3JIWjEwTXVHZFV6?=
 =?utf-8?B?WUFva1hzYXF5Y2YyMFo4TmYwQjVWS2RlWVhyMnFoMmt6YVF5SHJzZmdISXV2?=
 =?utf-8?B?VlgrNEFMMmQ5RXhuTjlIRnNyUEZHZEg4VmE4VWxCL3ZQRk1EM3ZSNGRHWVpk?=
 =?utf-8?B?SkJoQ3MvS0s1dXF1VW56ZEszSElOZVoyUFdITCs3OEhnT0JzSGJSN2xTYUZ3?=
 =?utf-8?B?dlJPdnQydXpyRG1kMVNzdzl1YTBONThsOHpvM2RnWlJVZ3F5RmhhSGxPSS9p?=
 =?utf-8?B?anc0K2tCS3NOQmFyL0VNV3pxVm1BRDlaRTBZKzlNdDBUYU11c1FmR1Y3eGxH?=
 =?utf-8?B?c0ExTyt3amVXSDF5dlU5MmJvTDJGQkNyNnNudVN1dWt3a25Ga24zaWpFNDM3?=
 =?utf-8?B?L1lDTUt5UkpDdFM3ZEtsT3VnU0s2YjkvSjhOS3pkRDQxOEVvN3R5MExoQkY1?=
 =?utf-8?B?MHZobUZFaHBQaDVtNGZDa2lleWRUc0kzb0tTTTNvbE1nVjBVaUJJYjNlREVs?=
 =?utf-8?B?d1h5d3lTSnRzMmYyeUNFMWlrZVVrZWxsd1BQZzZieTVSSFVZdFF2eENlcGVQ?=
 =?utf-8?B?SUJCZlNQTm55a2NUYWQxOUwyK3RaNlkwY1RZM01nei8zUy9mNEZ1cVNzOTZO?=
 =?utf-8?B?L1dnUm5BVTgrNW5XQlY0ZFVVL3QzTm5waVpQV3puSVQvUERxTENwZEMyemxv?=
 =?utf-8?B?U3l3MURYbDg2empIRnJEL21KZmxvbTZmS3htaVppcFVmTUxFRmVwL3QrNC9s?=
 =?utf-8?B?eUZrMkgwejhoeFNNcW5tL1V0TmxodzBGUGZ2b09KRnVzNWRZN01vclRhakhW?=
 =?utf-8?B?Q1N1OWcwOTMwa1dXVHlEME9WeU5BelZ1SWY3OFQyaEtuWnRSWmtzWWw5UzNU?=
 =?utf-8?B?ZDNKZis4VTIxSjQ5NFI0TWcvRnBHSEVrQjRMZmNyS3NibUNZalJBMC9YZm50?=
 =?utf-8?B?NTIvcTZiK1hDVFl5bG5TUmw4eEgxQUx4c0FZR3FEc3JjeHdTMlA5dXdqYXpu?=
 =?utf-8?B?U2lXa3VDdUpPc1p1MVJpZ2F1TXRpR1IxMmpLVWNTaExhRmZhWENkL0locTdO?=
 =?utf-8?B?bTNHUnFVd1dJaTdySUhUWXFBY3hoalBYdkY5aDU2ZFZvbjh6LzZQbmVUT0wx?=
 =?utf-8?B?RlJFZU1SaGZ0UEZvZ3BEZ0NCRkhPTS94VHFLd2t6UUVwMFpxMnhGQ21sbTF3?=
 =?utf-8?B?RGtVQlB5WmtBQy9qcDJJY0FUMStZU28xQ2NBbFdJQk1iTHdPbzg0Z2c3Yyt3?=
 =?utf-8?Q?3Rc7yB0311omFMTdHjsqMqhaIF7i2oYGMRLNxpc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b40ecb-1cd9-40e2-84a4-08d8ce6e7807
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3366.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 09:21:53.0317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI9CdvmlXycKNTD81ZALqTvUUpdzUAc/8o0vY/z8mjxvfsCK02q8YxJrobRDE66FhDRKxrMkFygsT2y7cqYt6xtqON3ZCN3SzcZT/z2k6v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1956
Received-SPF: pass client-ip=40.107.8.135;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------B3935A3D2D31AF6E64543BB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.02.2021 23:31, Peter Xu wrote:
> On Tue, Feb 09, 2021 at 03:09:28PM -0500, Peter Xu wrote:
>> Hi, David, Andrey,
>>
>> On Tue, Feb 09, 2021 at 08:06:58PM +0100, David Hildenbrand wrote:
>>>>> Hi,
>>>>>
>>>>> just stumbled over this, quick question:
>>>>>
>>>>> I recently played with UFFD_WP and notices that write protection is
>>>>> only effective on pages/ranges that have already pages populated (IOW:
>>>>> !pte_none() in the kernel).
>>>>>
>>>>> In case memory was never populated (or was discarded using e.g.,
>>>>> madvice(DONTNEED)), write-protection will be skipped silently and you
>>>>> won't get WP events for applicable pages.
>>>>>
>>>>> So if someone writes to a yet unpoupulated page ("zero"), you won't
>>>>> get WP events.
>>>>>
>>>>> I can spot that you do a single uffd_change_protection() on the whole
>>>>> RAMBlock.
>>>>>
>>>>> How are you handling that scenario, or why don't you have to handle
>>>>> that scenario?
>> Good catch..  Indeed I overlooked that as well when reviewing the code.
>>
>>>> Hi David,
>>>>
>>>> I really wonder if such a problem exists.. If we are talking about a
>>> I immediately ran into this issue with my simplest test cases. :)
>>>
>>>> write to an unpopulated page, we should get first page fault on
>>>> non-present page and populate it with protection bits from respective vma.
>>>> For UFFD_WP vma's  page will be populated non-writable. So we'll get
>>>> another page fault on present but read-only page and go to handle_userfault.
>> The problem is even if the page is read-only, it does not yet have the uffd-wp
>> bit set, so it won't really trigger the handle_userfault() path.
>>
>>> You might have to register also for MISSING faults and place zero pages.
>> So I think what's missing for live snapshot is indeed to register with both
>> missing & wp mode.
>>
>> Then we'll receive two messages: For wp, we do like before.  For missing, we do
>> UFFDIO_ZEROCOPY and at the same time dump this page as a zero page.
>>
>> I bet live snapshot didn't encounter this issue simply because normal live
>> snapshots would still work, especially when there's the guest OS. Say, the
>> worst case is we could have migrated some zero pages with some random data
>> filled in along with the snapshot, however all these pages were zero pages and
>> not used by the guest OS after all, then when we load a snapshot we won't
>> easily notice either..
> I'm thinking some way to verify this from live snapshot pov, and I've got an
> idea so I just share it out...  Maybe we need a guest application that does
> something like below:
>
>    - mmap() a huge lot of memory
>
>    - call mlockall(), so that pages will be provisioned in the guest but without
>      data written.  IIUC on the host these pages should be backed by missing
>      pages as long as guest app doesn't write.  Then...
>
>    - the app starts to read input from user:
>
>      - If user inputs "dirty" and enter: it'll start to dirty the whole range.
>        Write non-zero to the 1st byte of each page would suffice.
>
>      - If user inputs "check" and enter: it'll read the whole memory chunk to
>        see whether all the pages are zero pages.  If it reads any non-zero page,
>        it should bail out and print error.
>
> With the help of above program, we can do below to verify the live snapshot
> worked as expected on zero pages:
>
>    - Guest: start above program, don't input yet (so waiting to read either
>      "dirty" or "check" command)
>
>    - Host: start live snapshot
>
>    - Guest: input "dirty" command, so start quickly dirtying the ram
>
>    - Host: live snapshot completes
>
> Then to verify the snapshot image, we do:
>
>    - Host: load the snapshot we've got
>
>    - Guest: (should still be in the state of waiting for cmd) this time we enter
>      "check"
>
> Thanks,
>
Hi David, Peter,

A little unexpected behavior, from my point of view, for UFFD write-protection.
So, that means that UFFD_WP protection/events works only for locked memory?
I'm now looking at kernel implementation, to understand..

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------B3935A3D2D31AF6E64543BB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 09.02.2021 23:31, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210209203143.GC103365@xz-x1">
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
        <pre class="moz-quote-pre" wrap="">
Good catch..  Indeed I overlooked that as well when reviewing the code.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Hi David,

I really wonder if such a problem exists.. If we are talking about a
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I immediately ran into this issue with my simplest test cases. :)

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">write to an unpopulated page, we should get first page fault on
non-present page and populate it with protection bits from respective vma.
For UFFD_WP vma's&nbsp; page will be populated non-writable. So we'll get
another page fault on present but read-only page and go to handle_userfault.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The problem is even if the page is read-only, it does not yet have the uffd-wp
bit set, so it won't really trigger the handle_userfault() path.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">You might have to register also for MISSING faults and place zero pages.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
So I think what's missing for live snapshot is indeed to register with both
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
      <pre class="moz-quote-pre" wrap="">
I'm thinking some way to verify this from live snapshot pov, and I've got an
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
    <pre>Hi David, Peter,

A little unexpected behavior, from my point of view, for UFFD write-protection.
So, that means that UFFD_WP protection/events works only for locked memory?
I'm now looking at kernel implementation, to understand..
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------B3935A3D2D31AF6E64543BB3--

