Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A32CAD72
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:36:53 +0100 (CET)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCOJ-0005Tv-EY
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkCEV-0001hx-Hs
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:26:43 -0500
Received: from mail-eopbgr30116.outbound.protection.outlook.com
 ([40.107.3.116]:31867 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkCES-0001fu-6d
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:26:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkE4qD27nW9ie7MPYT6dYdOTuC44XHftbQuqavgyHIVBprl8eHmBrqEg5XiPN+budCTKhzY3YMCVU+NIMXoYFs07rBVuFuirk+2OtM7SLYqoVrsa/vJWPrYLqBCNvhWKWshV/CfQ3MLCHmlQqaAkalhw7fRMMkWbqs6Z/bBCZurh0bXYYEHt/RWSvx0Qpjrcq4SEdCAVxy5Oj1U5JCBJtwHbv7hF3E9lms51IAc6QcAPi8bLR9LQakIk4ZD6gBZQUVFBujf11DrRRa14S9qbRpN25Iv4br3w/0Ov6Ks3iV0rIz7DUOYV1QC2RcClE5bN8LMVV/Xtt/jGcDKV27nwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8XqLfDagJhiThxcm6Y23z/jsB9G/8tNCaAaUHGG2EA=;
 b=ejUQJpzzBzPSOGAeuTO0hK/fIkE53r6nIcmHBuT/a/PxtEWQv6meYoasSwNncF1RW4kvh1QSlntapWV3dPvUGaPa98l4AitRMVDkbC6hsujSNfAm2ldEVnnqWpdwik0X2BXWV5ZWoYmjQgPUc4j0BePQ4rNmxO7wyWfmTvQr+BwK72ViOqn3P+Z9HdEIRu5JHpmniaynrdRdhylTC3hiFMZnvcP85MdcgKalbK6lgQNQmnmdbZuWAYk0rnT42WfJOxJdMddPsg+p1lUcRilm0W8Yf8UvBQ1xbUDRj3dsU/B7+tScakKBw7eqEfvnFe12c/ziDxv8p7MnVJ3xKH5QQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8XqLfDagJhiThxcm6Y23z/jsB9G/8tNCaAaUHGG2EA=;
 b=Si8GkRwj1f79g/iO0Mq9WtX8reslzaXp38EwhT3stfyhgnIDx2wueUEwJ2VXiZw3v3SKvClcRouK8i5TKLui5nDDQzm55mWBH6tpZ+e2uj0/R8/Ij3M3UnIrvst4nbDplch/1HJusoj2eyqeME2IXZDmCNAVt5sFL0Ne2UHgUdY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3184.eurprd08.prod.outlook.com
 (2603:10a6:803:41::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 20:26:35 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 20:26:35 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
 <20201201185438.GE3277@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <eba3a3a5-9503-5e93-9339-6c29f735d311@virtuozzo.com>
Date: Tue, 1 Dec 2020 23:26:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201201185438.GE3277@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR05CA0128.eurprd05.prod.outlook.com
 (2603:10a6:207:2::30) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR05CA0128.eurprd05.prod.outlook.com (2603:10a6:207:2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 20:26:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e68d4d62-2542-48b6-bf6e-08d8963765f9
X-MS-TrafficTypeDiagnostic: VI1PR08MB3184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3184C0C72F1F9474299AD3009FF40@VI1PR08MB3184.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zlMJPAlEvieG8tuOA7MUH0gJC29kOPI+Zdcp1RaoT25j8uiXkkAM9T0Q577uYTUy28diDg7Ofvu8BkvX4yax5rBNmsywKkbmKyjWsPFDmkKbV6amOxuuP8m9TFI+wuRsz0ZdifxfZP+y40ytvLyFRoYsHivDigcX+qDEoLx9pYETRSvy8x1owwCJBL/CMCieqOwQKJreLcb6ZP4vDbiEJXksN60iyONf4c3wBRxS20/KSYltryQspDWt7jppDL7ZKovXuOQjpHQXM/UrFOJzdz7wUeETUgQwMtzseD7y2HqzRP3lHMxDBOy+DP6zaJGwTuDG3f54F381quQlIDnLoaz5btX/jwrBsenGK4g+P/HhIFYOCAqS5HYQZeL0y1gw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(5660300002)(66946007)(8936002)(44832011)(478600001)(31696002)(2906002)(83380400001)(54906003)(2616005)(956004)(31686004)(316002)(16576012)(6916009)(36756003)(53546011)(86362001)(66556008)(66476007)(4326008)(8676002)(26005)(52116002)(186003)(6486002)(16526019)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVlOd3JhV1hsbldMcEMxaWwvRXhKa1p5VXBjK1Y1VHpNME1UWTh3ak1UMk9C?=
 =?utf-8?B?bjdLU2ZTdUlXQ3RqN2FsMDhNUWxlM3pmSHpBdWN2aWcxMXZlOVZjeVQ1Ujhx?=
 =?utf-8?B?M1A0cGxHN29oeXh4Z0tjQm1rSFpiMVpIL0pCSmlZZVh3Ym1yY0pFTFczSzB6?=
 =?utf-8?B?MllBZ2hzU1lhWVhyYkNEbHVpaHZKYW1QaXR6SUtsQU1xNU5iV244NUZwOURo?=
 =?utf-8?B?NVU5WS9sMENRV3lUUmh3V3B4YnN5MlNCa2syVVFqaDF4dU5LbWxUNUo2d2ZG?=
 =?utf-8?B?MFJHNEllWnBTV2g4Z29rM3BCZFNZenlOeitDMGo3ZUI5OTRDYzY3b1kydkpo?=
 =?utf-8?B?allnQ2dzZ1RpY01ja0praEUwN1pmY3dWc1ppZGsrVkVJcnVjUDljZUFpdU80?=
 =?utf-8?B?K0tubG9SOHIydmttL3AwSWgyMkZrcWxDUGowRjEzYmU0aEhETDU0cnV5TXd2?=
 =?utf-8?B?dmM0MEhDajIrYm9xVjQ4cXVYRmQ3bm9VRlppb3QyVG9EL2JlWklQQWlEMTI2?=
 =?utf-8?B?MUswOGxseFgyMlJWbHNrT01ETGdJMldPV1grbWV6V1I4M1Q1Mys2eVNLaW4y?=
 =?utf-8?B?T1FpWVZhWTVaRkxsWW9qWnJncVVWQVpESzZveWxMQTh5RTdWdklNejVPS0Qx?=
 =?utf-8?B?eVJqVmlLbk5SdVRWc1RNb2V2bnZVRWdMYVErRExvYjVpaEIyTjdsWkdVV2Y4?=
 =?utf-8?B?YzByUm81alBOdG9CWXpwYmd0V1Evb1NabHdFSi9PTDhTNmNxazZSVWFXVzY0?=
 =?utf-8?B?VHBBb2JleWJ3ZCtTVHRIOWxPWHJESklkNFRwa3ZNT25DTlBVNnova2NaM016?=
 =?utf-8?B?djRrRmFlYm1yRjUwN2VoK0lYbGlVTFZBWlZNV1V5NTBvOWIzMVBrQVpUTndh?=
 =?utf-8?B?TmRzU0hFeFJ4djFGQjdVQis1RjFUTGY5Y2hiZjFNUUkxaWJyR2VGQy9ZNnJT?=
 =?utf-8?B?cFhNUEJrVzZRNDNPM3cweTl1K0tBeFpTY3MyOVJOenBGVnIyTzVWR3NVRTRj?=
 =?utf-8?B?S0pIcVJOMXlSdXY1NElncFU5ZDNheVd6SEJob1JGajFOUjJUQ1k1OEZDWnVh?=
 =?utf-8?B?aWhIQlJyOWh0NHJuNXEwVER3YTNvQSs5OFlicTZGVHhFeVNVcGFNd2I0QUNR?=
 =?utf-8?B?aHJNUzAwRFNoaC91bHk1RTBQdVppRGZUYWYyTnh5Z1RXWXplVndRNFZkWVBJ?=
 =?utf-8?B?Mk5pZ1pzMzRFRkVHSVRMSWl0czFUclJrbzVqQml5U1BITU9NZ1BSTDN3MEQv?=
 =?utf-8?B?N1ZUdmdQR3ZKbEFicFVHdGFQZ1c2THJwQ2JQNnBEaVlFZkNCWmtZdG8rQ1hX?=
 =?utf-8?Q?0p4l9LuyGlMQ5gbP09le+yUhzC/iBetH+Y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68d4d62-2542-48b6-bf6e-08d8963765f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 20:26:35.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcmEzWad4pI5xNjW+xFotycVXBusbAqG2B/ud1QozC0I7qroCH6H0pThBUl5QdVIodn8VTpEuoSq0ghp6KRxr8SRj+U0EKU7cYCPa+jz7Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3184
Received-SPF: pass client-ip=40.107.3.116;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.12.2020 21:54, Peter Xu wrote:
> On Tue, Dec 01, 2020 at 02:24:12PM +0300, Andrey Gruzdev wrote:
>> On 01.12.2020 13:53, Peter Krempa wrote:
>>> On Tue, Dec 01, 2020 at 11:42:18 +0300, Andrey Gruzdev wrote:
>>>> On 01.12.2020 10:08, Peter Krempa wrote:
>>>>> On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
>>>>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>>>
>>> [...]
>>>
>>>>> Note that in cases when qemu can't guarantee that the
>>>>> background_snapshot feature will work it should not advertise it. We
>>>>> need a way to check whether it's possible to use it, so we can replace
>>>>> the existing --live flag with it rather than adding a new one and
>>>>> shifting the problem of checking whether the feature works to the user.
> 
> Would it be fine if libvirt just try the new way first anyways?  Since if it
> will fail, it'll fail right away on any unsupported memory types, then
> logically the libvirt user may not even notice we've retried.
> 
> Previously I thought it was enough, because so far the kernel does not have a
> specific flag showing whether such type of memory is supported.  But I don't
> know whether it would be non-trivial for libvirt to retry like that.
> 
> Another solution is to let qemu test the uffd ioctls right after QEMU memory
> setup, so we know whether background/live snapshot is supported or not with
> current memory backends.  We should need to try this for every ramblock because
> I think we can have different types across all the qemu ramblocks.
> 

I've already added some code to perform raw check on UFFD feature 
support on existing QEMU ram_list. That's fast, just trying REGISTER 
IOCTL with required features for each migratable RAMBlock, then cleanup.
So we can do it on migrate_set_capabilty. If some RAMBlock is not 
compatible (several memory slots with different backends) - we just give 
up enabling the capability.

>>>>>
>>>>
>>>> Hi,
>>>>
>>>> May be you are using hugetlbfs as memory backend?
>>>
>>> Not exactly hugepages, but I had:
>>>
>>>     <memoryBacking>
>>>       <access mode='shared'/>
>>>     </memoryBacking>
>>>
>>> which resulted into the following commandline to instantiate memory:
>>>
>>> -object memory-backend-file,id=pc.ram,mem-path=/var/lib/libvirt/qemu/ram/6-upstream-bj/pc.ram,share=yes,size=33554432000,host-nodes=0,policy=bind \
>>>
>>> When I've removed it I got:
>>>
>>> -object memory-backend-ram,id=pc.ram,size=33554432000,host-nodes=0,policy=bind \
>>>
>>> And the migration didn't fail in my quick test. I'll have a more
>>> detailed look later, thanks for the pointer.
>>>
>>
>> Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
>> missing pages but not for wr-protected..
> 
> Correct.  Btw, I'm working on both of them recently.  I have a testing kernel
> branch, but I don't think it should affect our qemu work, though, since qemu
> should do the same irrelevant of the memory type.  We can just test with
> anonymous memories, and as long as it works, it should work perfectly on all
> the rest of backends (maybe even for other file-backed memory, more below).
> 

Yes, I know. Nice improvement of userfaultfd feature, IMO.

>>
>>>> I totally agree that we need somehow check that kernel and VM memory backend
>>>> support the feature before one can enable the capability.
>>>> Need to think about that..
>>>
>>> Definitely. Also note that memory backed by memory-backend-file will be
>>> more and more common, for cases such as virtiofs DAX sharing and
>>> similar.
>>>
>>
>> I see.. That needs support from kernel side, so far 'background-snapshots'
>> are incompatible with memory-backend-file sharing.
> 
> Yes.  So as mentioned, shmem/hugetlbfs should be WIP, but I haven't thought
> about the rest yet.  Maybe... it's not hard to add uffd-wp for most of the
> file-backed memory?  Since afaict the kernel handles wr-protect in a quite
> straightforward way (do_wp_page() for whatever backend), and uffd-wp can be the
> first to trap all of them.  I'm not sure whether Andrea has thought about that
> or even on how to spread the missing usage to more types of backends (maybe
> missing is more special in that it needs to consider page caches).  So I'm
> copying Andrea too just in case there's further input.
> 
> Thanks,
> 

Maybe be for file-backend it works from start, but many configurations 
come with shared hugetlbfs.. Now it's not compatible with background 
snapshotting. We can't support even anonymous hugetlbfs at the moment.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

