Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A4319246
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:31:49 +0100 (CET)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGkm-0001CO-4m
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lAGhi-00083I-FP
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:28:38 -0500
Received: from mail-eopbgr150113.outbound.protection.outlook.com
 ([40.107.15.113]:41218 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lAGhe-0000qt-9b
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:28:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1dYk1vmN801RTO/kvmJAkjTDQdj+UOjtX4T6Gm6NI0ZMBQ0IMJRIJ7/xf69bi94eZfhU8pAOJSEJkOyreRGYKPYSlBYk3jkKq8kqeGkbswhE2CZL0nAv3RrTaDjNnBCeE4kPoiuf/lM1aHo3fEZGWWa3OsG+g60EpdHKzEume65H8GCK1roa8o+q4l2dnY0uHXD7RQ1Vi4SMN4cMaZ1HFeYIz4Bu5aAG++1HP7zBDtQuch51gk1mbQIuWN2Lwhrj2LXHsXIybxuvYDar9BjJCGVUtuL9sf67lZZKbKNN3q7gMCvD4456BT8Db8JFAHX77kQZNthE4gWQOfb0geuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx7KE7T0HlEhpMUxXsSJ1R2FqMwa9n8KxGemgJVsGlU=;
 b=dDHcswgPWsld5Lpv7jr/xrmwKVV1jvoyfIAxKlDIsJ3tuj1d9jiWs7tLbX+DRz3p+0y/FdiDDe+CVQHN6aa02SvFnWXd8V/1WLuwqSilIc+PgbM7RT2EcVagMfZe7g76eOAKrIK69Lb7+l0ajX8y1BQ75Gdkb2MRmTXF1qjXNZeqVjTz9DN5VDC7T3XWtJQHIeRdNQxNyTQrHN4nQKjKqrJa0oGFPyDLY5i5cD8wFErDkfCM2Fgqcs4nUGszx0mJLkBhD6TUxtamDJoBWxaf1GeydNKOznrvc9OkY+r5Qeq7jDczguJRcUBO1t6ZZtJkJBm7Htq5hfrz3K5Drmjbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx7KE7T0HlEhpMUxXsSJ1R2FqMwa9n8KxGemgJVsGlU=;
 b=bl1io5KAFdEacoed0IHWY/oQpaGWPls7tqfjeznfthRgWUmt0MyDFCEIYbvapcAOljCxFDTfL3cCMAxBnZxu+PXlNFoP39wPh3msKY8fyaP4P/ayoJdzX4LBY0v1OpWBNDmhH6sLqunDffHvErX4QJKUN8mIEbOJj4S5YfWnsow=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB5730.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 18:28:31 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3846.029; Thu, 11 Feb 2021
 18:28:31 +0000
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
 <d7dcfbf8-8f33-065b-47a9-802952732218@virtuozzo.com>
 <20210211173215.GC157159@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <13142aee-fc4f-372c-d216-8b38484ba8e8@virtuozzo.com>
Date: Thu, 11 Feb 2021 21:28:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210211173215.GC157159@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------B6B9D88F3D6CA2715025BC55"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM0PR02CA0139.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::6) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM0PR02CA0139.eurprd02.prod.outlook.com (2603:10a6:20b:28d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 18:28:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f08fe6a4-b935-4fd0-76ed-08d8cebad526
X-MS-TrafficTypeDiagnostic: AM8PR08MB5730:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB5730E6F1BE5DEB79FAA300C19F8C9@AM8PR08MB5730.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiJnf27u5Gf327PfdrQIdmwCMdMEPz6I80gr1wCh4HyE/bjEakTteS0mK4GrM7DMNdl8tTDmLmD9J5VcVwD4VsgeG6NumDS5UdsPsySCOC4/r5zNmKhXOi3CDL9GPit74JBohDLL+6xV1caZbZrrlVXJXhoZaQ8g3KEnyUX0DTPWNqytf7TjX1eZ7xlUFsQ4GdSBqGHdKcQXS4V67zr59Nz0snunzVQNk4aVUIIwm/ZFTAhGV1unW6QB7eDKf/Ffe6kiQBopYkJ/RmdtofI5x3iEuzsUoEqcwhbN8yICV3XK5MCk+c6keE+SvqGXrbtEQsvUqo9Y8f40Gr6dNc/xpGASpzJ1wNc8zFVRznvMXpTeT5qp2tboZ15kylVLmyw4i38+MwlT67T21Mx/2VHrwKebKqmBCkBHZg+uRF2+u+pwVObfAzgpVHH0AJL24ZCmrsKoab01GJY5gAVM7c2Q/ts4H4v6nq7X/hBg0s03bc3laDqIyTKT0yUkzjrzb+/jI1eSeHao8Qk3Ea192PW+ZEkuOJLoAlSFHVz3EMETiDGfXYoqQUSV+DmVTKuhofXouuZh2IWS3PuJedB1Aj6A72FLtsGq64bfTYCxe8b/MjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(366004)(346002)(376002)(66556008)(53546011)(6486002)(8676002)(478600001)(33964004)(8936002)(83380400001)(31696002)(86362001)(186003)(66476007)(6916009)(44832011)(54906003)(956004)(66946007)(5660300002)(2616005)(31686004)(16526019)(36756003)(26005)(107886003)(316002)(4326008)(2906002)(16576012)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFNCRGpQL28wOGVqSW9qTlFzNUdmT3ZSK1BndlUrQjRsTVZOVWRvYjVYQjJs?=
 =?utf-8?B?amlZZUhWd04xUkhGVW00TnJ3MDY1QVEwTEROQ0trZXAwbFF1YW1DWmVuNEFa?=
 =?utf-8?B?c3RmM1NTc0hmbWFZWFIyOFc2RllWT2dud2hLeTBRbGdZUFU0Y0Y3cHAxeWhX?=
 =?utf-8?B?aFR4K2RlcUd4Sko2MnNBS2tYaFMrTGFoTCtjbEREMzR1Vm02a2QwcHJFTHNp?=
 =?utf-8?B?NENNTmt3dXBWT2xYREQ3OTlWKytpL1g4WEhSRlV0OEVkNGxleldNWmt6NUh4?=
 =?utf-8?B?WTJVTFk0NlZPc05hU0UvYUhlaHRoclZWM2R5UFdhQUlRRTVkZ3l0VkNEQnZW?=
 =?utf-8?B?UU5ycUFURmJmN2JwOGxzSGh6S1k1bmFBSGlybHJYWFF0eURUdWY5d0E4L2lB?=
 =?utf-8?B?L3AzS0ppaVlYM2VXbkhQeE9Eb2lUTVFSelFYRjdGd0MzaWNpcWJQR3VhTDB2?=
 =?utf-8?B?SHRGa3NNdUhDbjB2UDdvZzJUK2VYdDBia3JQZ3h1Zk1XVTFiaEcvQ3NndzJY?=
 =?utf-8?B?cElVQ09kK2pMaGJrSk9FNnUrbHBKcDdMdzdiZXgvRG9JUEpEVzhTeE4vZTBu?=
 =?utf-8?B?ZndlOEIyaGt0V2huMGZJTXVJcHdpbGJ6SWRTa2NZU284QTVkaE1EQk91NnRN?=
 =?utf-8?B?QUVucGROeVRzTDQrOFUxdTJiODVxNG1VMkJUbG9lckdxcUNqbVUyeFZIWG4v?=
 =?utf-8?B?cHpzZ3pzNURBWUc3MFR4SUVlaDR5SjVieThWMlJrRzNXb0pMcGx6NU5Kckd0?=
 =?utf-8?B?TUpmZ1FlM3VNRzhCdmt5c09oTmF3dTNhQ2htTEI1MnFJYnBkQzNabFpXcS9z?=
 =?utf-8?B?WGFJd3RFVm5CWEZKT3FncU54THZlQTFNNElKdzlBbXlsUFY3U2paTGxuSGMr?=
 =?utf-8?B?M3lFcGRRNEI0NDVJRThjcDFHM1ZIVnFGYUhpMlRNWmZNdnBOWDJQSEJDRE5K?=
 =?utf-8?B?N3RtcFZVSU5NQ2RkaHJXaHlkS2Z3Q2tIRVMwcndSYU1sbFF1Y1J6QkZmODdS?=
 =?utf-8?B?Y3ZKL2I3bGc1a3JsbjJmSG9aYlNCUVdCNDVNN3dGcUJaMCtMVno3QVBkbzg4?=
 =?utf-8?B?SEJkSFFOTCtDeG5QeVYyb2VLNWlGOFBMcm5QeWt3SE5KWmI0QS9HZGtpUlBX?=
 =?utf-8?B?b3RxWnMvQ3ZBL2JZQ2pXSHZEK1RhTzErNlJ5aUJsRStBMWpOMDFXZjNLOGNj?=
 =?utf-8?B?TWh1ZGQrTlNEc2F4WVIxeFhtTE0vMFRiNExhRW5LUmMyenZldTZNVS92ejNO?=
 =?utf-8?B?WHVKaFVTUEdrd1lyVzNWWU15bGQ3V1Z5aFlEU3duZ2VPMTlvT0t2cGZjM1Rw?=
 =?utf-8?B?RGtIUjhzRk1RL1E3eC9Ya0tvVU9nV0VKdndJQWEyZ1BUcUZmK2NyMFNOVTVx?=
 =?utf-8?B?dTJ1bVJEakc1b2drRWxMRkVNanY1QnFkZDZIVjNMKzVJMFhCNVV6Vm1mTndk?=
 =?utf-8?B?d3ZwVnNzTzVuTlFNVmpxNVVqd3ptb256SDJWcFVwMGZxdFRnT01PLy9vNEFp?=
 =?utf-8?B?bGF6WFF0TGhaRmUyVC9HZ1Q0amV2NU9tbzRsb0tkMEdZY0xkdGcxZ3VmMDVh?=
 =?utf-8?B?eGhtN2dpcnk0dVBaRk42ZnhIOEFVVU5RSkxmMFd2bTZQaGJvSHptTkZHUStY?=
 =?utf-8?B?aG4zQ055aHdFSnBWOHh0bU1kaWd1cHFFbDU4MUUrL2h2VGdVa2MzZEp3Skx1?=
 =?utf-8?B?K0xURWRMcEYvUHdNVkhKOFFqUTlYZlVsMTJja2FlMGNxYnlheDFsalVrRjJH?=
 =?utf-8?Q?75xAxiokVeEZfJ0BQTyM7LLA5xAsAVUiY+ftyMg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08fe6a4-b935-4fd0-76ed-08d8cebad526
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 18:28:31.0690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7yu1/ZWs+A/OFEZJeXo0guBRh0pFYf/86gA6+zx5t93F/SmcFXWUt9SNNQFYWFxePrIQ28R1h8KQ2UG3NXIXNt90TQ4o9xYj7oAqdz4PRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5730
Received-SPF: pass client-ip=40.107.15.113;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------B6B9D88F3D6CA2715025BC55
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.02.2021 20:32, Peter Xu wrote:
> On Thu, Feb 11, 2021 at 07:19:47PM +0300, Andrey Gruzdev wrote:
>> On 09.02.2021 22:06, David Hildenbrand wrote:
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
>>>>>
>>>> Hi David,
>>>>
>>>> I really wonder if such a problem exists.. If we are talking about a
>>> I immediately ran into this issue with my simplest test cases. :)
>>>
>>>> write to an unpopulated page, we should get first page fault on
>>>> non-present page and populate it with protection bits from
>>>> respective vma.
>>>> For UFFD_WP vma's  page will be populated non-writable. So we'll get
>>>> another page fault on present but read-only page and go to
>>>> handle_userfault.
>>> See the attached test program. Triggers for me on 5.11.0-rc6+ and
>>> 5.9.13-200.fc33
>>>
>>> gcc -lpthread uffdio_wp.c -o uffdio_wp
>>> ./uffdio_wp
>>> WP did not fire
>>>
>>> Uncomment the placement of the zeropage just before registering to make
>>> the WP actually trigger. If there is no PTE, there is nothing to
>>> protect.
>>>
>>>
>>> And it makes sense: How should the fault handler know which ranges you
>>> wp-ed, if there is no place to store that information (the PTEs!). The
>>> VMA cannot tell that story, it only knows that someone registered
>>> UFFD_WP to selectively wp some parts.
>>>
>>> You might have to register also for MISSING faults and place zero pages.
>>>
>> Looked at the kernel code, agree that we miss WP events for unpopulated
>> pages, UFFD_WP softbit won't be set in this case. But it doesn't make saved
>> snapshot inconsistent or introduce security issues. The only side effect is
>> that we may save updated page instead of zeroed, just increasing snapshot
>> size. However this guest-physical page has never been touched from the point
>> of view of saved vCPU/device state and is not a concern.
> Oh I just remembered one thing, that Linux should be zeroing pages when
> allocating, so even if the page has legacy content it'll be cleared with
> __GFP_ZERO allocations.  So yeah it would be harder to have issue at least with
> a sensible OS.  I'm not sure about Windows or others, but it could be a common
> case.  Then the only overhead is the extra pages we kept in the live snapshot,
> which takes some more disk space.
>
> Or there could be firmware running without OS at all, but it should really not
> read unallocated pages assuming there must be zero.  It's not a sane behavior
> even for a firmware.
>
>> Often (at least on desktop Windows guests) only a small part of RAM has ever
>> been allocated by guest. Migration code needs to read each guest-physical
>> page, so we'll have a lot of additional UFFD events, much more MISSING
>> events then WP-faults.
>>
>> And the main problem is that adding MISSING handler is impossible in current
>> single-threaded snapshot code. We'll get an immediate deadlock on iterative
>> page read.
> Right.  We'll need to rework the design but just for saving a bunch of snapshot
> image disk size.  So now I agree with you, let's keep this in mind, but maybe
> it isn't worth a fix for now, at least until we figure something really broken.
>
> Andrey, do you think we should still mention this issue into the todo list of
> the wiki page of live snapshot?
>
> Thanks,
>
Yes, even if the page happens to be overwritten, it's overwritten by the same VM so
no security boundaries are crossed. And no machine code can assume that RAM content
is zeroed on power-on or reset so our snapshot state stays quite consistent.

Agree we should keep it in mind, but IMHO adding MISSING handler and running separate
thread would make performance worse.. So I doubt it's worth adding this to TODO list..

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------B6B9D88F3D6CA2715025BC55
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11.02.2021 20:32, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211173215.GC157159@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Thu, Feb 11, 2021 at 07:19:47PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 09.02.2021 22:06, David Hildenbrand wrote:
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
            <pre class="moz-quote-pre" wrap="">Hi David,

I really wonder if such a problem exists.. If we are talking about a
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I immediately ran into this issue with my simplest test cases. :)

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">write to an unpopulated page, we should get first page fault on
non-present page and populate it with protection bits from
respective vma.
For UFFD_WP vma's&nbsp; page will be populated non-writable. So we'll get
another page fault on present but read-only page and go to
handle_userfault.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
See the attached test program. Triggers for me on 5.11.0-rc6+ and
5.9.13-200.fc33

gcc -lpthread uffdio_wp.c -o uffdio_wp
./uffdio_wp
WP did not fire

Uncomment the placement of the zeropage just before registering to make
the WP actually trigger. If there is no PTE, there is nothing to
protect.


And it makes sense: How should the fault handler know which ranges you
wp-ed, if there is no place to store that information (the PTEs!). The
VMA cannot tell that story, it only knows that someone registered
UFFD_WP to selectively wp some parts.

You might have to register also for MISSING faults and place zero pages.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Looked at the kernel code, agree that we miss WP events for unpopulated
pages, UFFD_WP softbit won't be set in this case. But it doesn't make saved
snapshot inconsistent or introduce security issues. The only side effect is
that we may save updated page instead of zeroed, just increasing snapshot
size. However this guest-physical page has never been touched from the point
of view of saved vCPU/device state and is not a concern.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Oh I just remembered one thing, that Linux should be zeroing pages when
allocating, so even if the page has legacy content it'll be cleared with
__GFP_ZERO allocations.  So yeah it would be harder to have issue at least with
a sensible OS.  I'm not sure about Windows or others, but it could be a common
case.  Then the only overhead is the extra pages we kept in the live snapshot,
which takes some more disk space.

Or there could be firmware running without OS at all, but it should really not
read unallocated pages assuming there must be zero.  It's not a sane behavior
even for a firmware.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Often (at least on desktop Windows guests) only a small part of RAM has ever
been allocated by guest. Migration code needs to read each guest-physical
page, so we'll have a lot of additional UFFD events, much more MISSING
events then WP-faults.

And the main problem is that adding MISSING handler is impossible in current
single-threaded snapshot code. We'll get an immediate deadlock on iterative
page read.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right.  We'll need to rework the design but just for saving a bunch of snapshot
image disk size.  So now I agree with you, let's keep this in mind, but maybe
it isn't worth a fix for now, at least until we figure something really broken.

Andrey, do you think we should still mention this issue into the todo list of
the wiki page of live snapshot?

Thanks,

</pre>
    </blockquote>
    <pre>Yes, even if the page happens to be overwritten, it's overwritten by the same VM so
no security boundaries are crossed. And no machine code can assume that RAM content
is zeroed on power-on or reset so our snapshot state stays quite consistent.

Agree we should keep it in mind, but IMHO adding MISSING handler and running separate
thread would make performance worse.. So I doubt it's worth adding this to TODO list..

Thanks,
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------B6B9D88F3D6CA2715025BC55--

