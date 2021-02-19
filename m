Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3D31F54E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 08:13:59 +0100 (CET)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCzzB-0005jw-Lc
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 02:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lCzy9-0005IB-Fx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:12:53 -0500
Received: from mail-eopbgr150117.outbound.protection.outlook.com
 ([40.107.15.117]:15941 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lCzy3-0008Cx-3y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:12:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gROMlcH2TeJHrmN068aa75UMgba/qdQrjpUYjNytYIVR+/qKFBJf3O1M1aBbPBoFW8TGQEo0cBqDCcDA/ihvO5cavo4rTFF/IPhbR58mjLq3JNEzuRr90/AD90dXLD4a/X6CBiz/Gqk9ayuhpaFocISximASU76Y27s88r2o+4XyJW+SwJ5xNZ3384HESQGY8ulXzAJgCoGfWu7tSQy5prSRdC/20c20K538ugee0+t7jZ01w8HuWbzJGb9RUfBATUmoSvRTfsjG1ua76UKIMiqp4efyzUj9k0iOCFTOvCXdLnwbjaVbpA89Kg55Ti0PSDbmUqAOWfzehN44DAEYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLIJlxwJnuFGCBY1MUoRUy+ct9qapnve8mQN2Nj03Bo=;
 b=QeRs6m0CQAIHC97ubrg1BpCJ9xzlMUMJ6JPCUe4Y/YLeFArVfF1tx/VwbwASoR1Vyhpod999v0vwasHYdRjy+wOt0ZrdPS/EtB2+XTX14j2fOY157pHvL7j3qzpGkJsvcpGmq6gyg0co53yukpTtFMd2EM8CAzjmO3AJn/ph6Vm/Rae6jE1FCvDRCPZQj8tW1zxdMJrWsEsZxp5HmE6fRwe7G0JUEzQQzTYQbuotrLyiLSB1eQFkHODyvOCyEE2MDPSu99gFle3MrmJOAfCldnLR/RSYvFxR7D5Nkb/6jOVI3/cF87H5OHDcf1q6We0ntYbfukHqnhYFXvKjNu5Bzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLIJlxwJnuFGCBY1MUoRUy+ct9qapnve8mQN2Nj03Bo=;
 b=g8Mp/2u6ivNrNo8vHyKJ/GzVGbtBQOpzXJXS3uuLnbDdc2s67x3Zdwl5315lNlHhgr8c4m5zqZ9lmuQ5PsNB4Uwl/h6jrHxLZJ1oVq+9Q/Mq8yVLvlvWCJKNQYl+/WB7zy3pdPi2KOZKxfRlTqhzUhVJ6uAZSXDFLSzzSJa+qVM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB5298.eurprd08.prod.outlook.com (2603:10a6:208:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Fri, 19 Feb
 2021 06:57:40 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3846.042; Fri, 19 Feb 2021
 06:57:40 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
Date: Fri, 19 Feb 2021 09:57:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210216233545.GD91264@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------4105C8827BDDD738D9FF555F"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Fri, 19 Feb 2021 06:57:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97a80ab0-df85-4ee9-a85d-08d8d4a3a5bb
X-MS-TrafficTypeDiagnostic: AM0PR08MB5298:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB5298BC1A7D2F0550BCA656DB9F849@AM0PR08MB5298.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCgaCusftE6/pmDhH8mtWtZfSSRpFuCSsH0U47uC/hY5LYlTA8vEmML/UkhnGdMk8pvIN4zEAg/OFTG3OxZyucS5nmwkABPH60odkbjQdEXl7zsHT7LgrRSbepPavWs4I5SOZGZE4V+Dr64+S/A/DwB1ksL1Gqv1KAQAuJ26kW0hzOaFUxCvsBybBOoQ8Lh0Ium2x1k9PuOerBqnP6ZVfLQ9EFCJOS855cKhkFGssT3VHfcF8GKmgDnfS5m8rE446Lb1eYqWJ8sy4Tb7SV85oftRKLAoJSlLrt1a5PIbhY66AkiUopr/v7rHNXr951NBhyR9T7knv9AgjdS8TmZtEN5vzW/+YWLcrPOiGbrX2P+HjyPmaxmGa1+oeU1Y/iss0FqGDz/7YdPQ0EjgGQnj/ARYNdbYpFQcAmxv4KEBGE84B0yWxgrhG87cW5Fr6vHhSoGa+3lg8882FSjBm4yil5gzYfXMHelfFfD/kZ8BvBpNhRpRIsWkSPCQtfTj0Yzm25ckzB0KInuo0pzr19fdA5XNP+gVsV0xyYHvPUwJ07pF/MCrDQ97i3Q9sJypSx1+Og1dLczyynxHI1B/aSkEfpfKBX0SbXhC+k8C+JM8ENM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(376002)(396003)(8936002)(2616005)(31696002)(478600001)(44832011)(8676002)(31686004)(36756003)(66556008)(66946007)(2906002)(83380400001)(30864003)(4326008)(956004)(6486002)(66476007)(52116002)(86362001)(53546011)(5660300002)(6916009)(54906003)(316002)(16526019)(186003)(26005)(33964004)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WVo1YjhUWXBFMGlKK1hndFRxSFkrSXgwT2tyTlQ1WFZZZGlER2tkMTZQa1Fa?=
 =?utf-8?B?TTRwZEpaVnBYaTcyOHZkT2V5S2w1OEVzZC9oL05hVU9IY3JjMkJNNm5qbW40?=
 =?utf-8?B?b3pRWjJJd3M3RTlLTEhyRFJ4YmlnVHQ0bTlIeEQxYTV6dzZGMkVTSDFqNElt?=
 =?utf-8?B?N3NEdlh4VXlIOHJ2TTJ0MGd4dHFUTTRwaHlGbmxMVzhla080bVNPSmJ2N25j?=
 =?utf-8?B?bHhWN25XMzhVMi9TdDc1ZXM4VFdyaUVLaUtUU1RzZVpXZUowWlIzeUgrbnQ4?=
 =?utf-8?B?S2UzallVeWN6R2NuY3lUWkZacmo1S0pZVnA4bWQvVHEwd1kwRmxUT2UxM2E1?=
 =?utf-8?B?S3N6b3UrUC9JUERRTzkxa25GUjdOaTRIQUVQRm1mcmVUbnNXakNzNnZWQlNB?=
 =?utf-8?B?SjlOOU1JUE4vQVFldFZvekFXMDk0U3VTdVAzYlo3bzBYbVZVeFljS2hGNFRw?=
 =?utf-8?B?ZVJkRG15eUZ2eXRjWlQzQU91QitxTlBqWVNML3ZlaWV2Umt3WG5RMUlHbUlD?=
 =?utf-8?B?SEhTdzJMaCt1WGN5MDdlc0Z4YUpGM1J0VCtqYmtDZVhrdnlDa1N5N2hoQ29Y?=
 =?utf-8?B?R2ZuOFh6T2k4N0p2TFA4SWtrMFFOVjZUdzkwSGt6VEFYQkJyeXFGYS9yYkx2?=
 =?utf-8?B?NG5aRE81WW1HVlQ3TWFCRm5td0hibno1ZDlzL2N5K0pHbmhvNzFoUjVURC9G?=
 =?utf-8?B?R3pBcGtoV3pIMVlLMkFJWkFQbHh4cW01aS9zYlJ5Wmt2N0JvK3JaK1YyMkth?=
 =?utf-8?B?T2xYT3ppSFpwaEhoL0tZVHBCQy9Wa3hHYjNNU2Y1am5MNk9xYXRDUGRZVkxr?=
 =?utf-8?B?Wk1UU0FsUFNaWHh1SGszTDNnK2RmdkVjUkx3Vm1zem5jVUR0S3pjWjVoTlYz?=
 =?utf-8?B?aEIybmNvNDNvWGJaZTNUanN6KytEcmZpcXpnelBtdG5NZXVrODE4aGZ2NUov?=
 =?utf-8?B?MmxpREhWTVZKcGtrWmZsWHVwa011Y3Q3NWwreUt0YXJpM0xnaGtXYUhVaUVi?=
 =?utf-8?B?dXpUYnppZHZ6clF4M0VXcitGTVE4WjVBcXFLd3Jxc2dqUTI3MDYzeHlhVDN1?=
 =?utf-8?B?bjVuMHNHU25zT2J4azk5MFFjMmlBL0VyVk9IT2xJS1ZZSjRjOVBSVisrTDh5?=
 =?utf-8?B?dkpuNGZ2SXZEMHA0TmFuRTZBQzBlMTVyK05iWnYxaHppbTh4ejJVTnA3NVB3?=
 =?utf-8?B?MDJmVGhBUE00U0xzaHNIVTR1YUdUS2I3K3c4QTRHMEdMcHJYMW0wV1hjdGo3?=
 =?utf-8?B?aTJOMHd1aUJ0NWpEc1JoN2RSMjQzRnk5OUdrOFFGSjZlNFVQUlJQNXFncTJm?=
 =?utf-8?B?V3lKMTVpbTNrSmZCWEhlaFRvZzFGeTd5RndOUGttaUZZN1hVaUJYWE5HOW1O?=
 =?utf-8?B?bk9qU0t4eVN2RUVIbHpzTjB0NVMvTzhpS1FPT0VhZXJ4eGFLS2hDU0l4YnFJ?=
 =?utf-8?B?elpZVHltaThCWDZ2RHNWYVdPcnJKZGp0VUMzRXUvYlhObnVmWkhURDFuSmpp?=
 =?utf-8?B?Y0hVc0tFaDVzT01HcW5HOG4zNUl6SHYwTTZOTTVXM044QTdwM21TSWhTTmtz?=
 =?utf-8?B?bnVUYVpPakhzMzZ5VTVOT3JOV044ZUs5WDM0d3pXdGs0ZmJLSkVuSk85a0pT?=
 =?utf-8?B?SFgvQkZXZkFzZTN1ai9KMXJ0cVNDL3BkcTFBUHJYamJ6OE15S1FXVGVzZXE2?=
 =?utf-8?B?VG81S2NQMlErbENtVUFlNXlmYi9HSXFvV3RjUDBqUFhCNVQwNGFxSGpPVk43?=
 =?utf-8?Q?S96/bq2rjTV6Xo6iHgCtI0RaFPvQnGDEgj4eDX+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a80ab0-df85-4ee9-a85d-08d8d4a3a5bb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 06:57:40.1040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8PBZ3Aq5RnqwlGAkqfLhPeDvAVz+zeQd0B6PovwrhCgJMMoafFa6kamfPsvuz6onz7x0YFHwalsquKezlMsEY0udah/foWAveAq1vR7FdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5298
Received-SPF: pass client-ip=40.107.15.117;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------4105C8827BDDD738D9FF555F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.02.2021 02:35, Peter Xu wrote:
> Hi, Andrey,
>
> On Sat, Feb 13, 2021 at 12:34:07PM +0300, Andrey Gruzdev wrote:
>> On 12.02.2021 19:11, Peter Xu wrote:
>>> On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
>>>> On 12.02.21 04:06, Peter Xu wrote:
>>>>> On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
>>>>>> The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
>>>>> I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
>>>>> I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
>>>> Yes, some distros seem to enable init_on_alloc instead. Looking at the
>>>> introducing commit 6471384af2a6 ("mm: security: introduce init_on_alloc=1
>>>> and init_on_free=1 boot options") there are security use cases and it might
>>>> become important with memory tagging.
>>>>
>>>> Note that in Linux, there was also the option to poison pages with 0,
>>>> removed via f289041ed4cf ("mm, page_poison: remove
>>>> CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported free
>>>> page reporting.
>>>>
>>>> It got removed and use cases got told to use init_on_free.
>> I think we talk about init_on_free()/init_on_alloc() on guest side, right?
> Right.  IIUC it's the init_on_free() that matters.
>
> We'll have no issue if init_on_alloc=1 && init_on_free=0, since in that case
> all pages will be zeroed after all before the new page returned to the caller
> to allocate the page. Then we're safe, I think.
>
>> Still can't get how it relates to host's unpopulated pages..
>> Try to look from hardware side. Untouched SDRAM in hardware is required to contain zeroes somehow? No.
>> These 'trash' pages in migration stream are like never written physical memory pages, they are really
>> not needed in snapshot but they don't do any harm as well as there's no harm in that never-written physical
>> page is full of garbage.
>>
>> Do these 'trash' pages in snapshot contain sensitive information not allowed to be accessed by the same VM?
>> I think no. Or we need a good example how it can be potentially exploited.
>>
>> The only issue that I see is madvise(MADV_DONTNEED) for RAM blocks during snapshotting. And free page reporting
>> or memory balloon is secondary - the point is that UFFD_WP snapshot is incompatible with madvise(MADV_DONTNEED) on
>> hypervisor side. No matter which guest functionality can induce it.
> I think the problem is if with init_on_free=1, the kernel will assume that
> all the pages that got freed has been zeroed before-hand so it thinks that it's
> a waste of time to zero it again when the page is reused/reallocated.  As a
> reference see kernel prep_new_page() where there's:
>
> 	if (!free_pages_prezeroed() && want_init_on_alloc(gfp_flags))
> 		kernel_init_free_pages(page, 1 << order);
>
> In this case I believe free_pages_prezeroed() will return true, then we don't
> even need to check want_init_on_alloc() at all. Note that it'll cover all the
> cases where kernel allocates with __GFP_ZERO: it means it could happen that
> even the guest kernel tries to alloc_page(__GFP_ZERO) it may got a page with
> random data after the live snapshot is loaded.  So it's not about any hardware,
> it's the optimization of guest kernel instead.  It is actually reasonable and
> efficient since if we *know* that page is zero page then we shouldn't bother
> zeroing it again.  However it brought us a bit of trouble on live snapshot that
> the current solution might not work for all guest OS configurations.

So I'd like to clarify that guest's init_on_alloc/init_on_free cannot bring any problems if we don't
consider virtio-baloon here.. If these pages have been zeroed inside the guest they certainly have got
populated on the host. And UFFD_WP should work as expected.

>>>>> impact should be small, I think.  I thought about it, but indeed I didn't see a
>>>>> good way to fix this if without fixing the zero page copy for live snapshot.
>>>> We should really document this (unexpected) behavior of snapshotting.
>>>> Otherwise, the next feature comes around that relies on pages that were
>>>> discarded to remain zeroed (I even have one in mind ;) ) and forgets to
>>>> disable snapshots.
>>> Agreed.  I'll see whether Andrey would have any idea to workaround this, or
>>> further comment.  Or I can draft a patch to document this next week (or unless
>>> Andrey would beat me to it :).
>>>
>> Really better to document this specific behaviour but also clarify that the saved state remains
>> consistent and secure, off course if you agree with my arguments.
> Yes, no rush on anything yet, let's reach a consensus on understanding the
> problem before trying to even document anything.  If you agree with above, feel
> free to draft a documentation update patch if you'd like, that could also
> contain the code to prohibit virtio-balloon page reporting when live snapshot.
>
> IMHO if above issue exists, it'll be indeed better to implement the MISSING
> tracking as well with UFFDIO_ZEROCOPY - it's still not optimized to keep trash
> pages in the live snapshot, since for a high dirty rate guest the number of
> trash pages could still be huge.  It would definitely be more challenging than
> only do wr-protect so we may need multi-threading at least, but it'll be a pity
> that live snapshot randomly fails some guests, even if it's rare.  The thing is
> host cannot easily detect that guest config, so we can't simply block some
> users taking snapshots even if at last the snapshot could be silently broken.
>
> Thanks,
>
Agree, let's reach consensus before doing anything. For the concurrent RAM block discards it seems
clear enough that they should be disabled for the duration of snapshot, like it's done when incoming
postcopy is active.

For the discards that happen before snapshot is started, I need to dig into Linux and QEMU virtio-baloon
code more to get clear with it. Anyhow I'm quite sure that adding global MISSING handler for snapshotting
is too heavy and not really needed.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------4105C8827BDDD738D9FF555F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17.02.2021 02:35, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210216233545.GD91264@xz-x1">
      <pre class="moz-quote-pre" wrap="">Hi, Andrey,

On Sat, Feb 13, 2021 at 12:34:07PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 12.02.2021 19:11, Peter Xu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 12.02.21 04:06, Peter Xu wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes, some distros seem to enable init_on_alloc instead. Looking at the
introducing commit 6471384af2a6 (&quot;mm: security: introduce init_on_alloc=1
and init_on_free=1 boot options&quot;) there are security use cases and it might
become important with memory tagging.

Note that in Linux, there was also the option to poison pages with 0,
removed via f289041ed4cf (&quot;mm, page_poison: remove
CONFIG_PAGE_POISONING_ZERO&quot;), available in some kernels that supported free
page reporting.

It got removed and use cases got told to use init_on_free.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I think we talk about init_on_free()/init_on_alloc() on guest side, right?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right.  IIUC it's the init_on_free() that matters.

We'll have no issue if init_on_alloc=1 &amp;&amp; init_on_free=0, since in that case
all pages will be zeroed after all before the new page returned to the caller
to allocate the page. Then we're safe, I think.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Still can't get how it relates to host's unpopulated pages..
Try to look from hardware side. Untouched SDRAM in hardware is required to contain zeroes somehow? No.
These 'trash' pages in migration stream are like never written physical memory pages, they are really
not needed in snapshot but they don't do any harm as well as there's no harm in that never-written physical
page is full of garbage.

Do these 'trash' pages in snapshot contain sensitive information not allowed to be accessed by the same VM?
I think no. Or we need a good example how it can be potentially exploited.

The only issue that I see is madvise(MADV_DONTNEED) for RAM blocks during snapshotting. And free page reporting
or memory balloon is secondary - the point is that UFFD_WP snapshot is incompatible with madvise(MADV_DONTNEED) on
hypervisor side. No matter which guest functionality can induce it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think the problem is if with init_on_free=1, the kernel will assume that
all the pages that got freed has been zeroed before-hand so it thinks that it's
a waste of time to zero it again when the page is reused/reallocated.  As a
reference see kernel prep_new_page() where there's:

	if (!free_pages_prezeroed() &amp;&amp; want_init_on_alloc(gfp_flags))
		kernel_init_free_pages(page, 1 &lt;&lt; order);

In this case I believe free_pages_prezeroed() will return true, then we don't
even need to check want_init_on_alloc() at all. Note that it'll cover all the
cases where kernel allocates with __GFP_ZERO: it means it could happen that
even the guest kernel tries to alloc_page(__GFP_ZERO) it may got a page with
random data after the live snapshot is loaded.  So it's not about any hardware,
it's the optimization of guest kernel instead.  It is actually reasonable and
efficient since if we *know* that page is zero page then we shouldn't bother
zeroing it again.  However it brought us a bit of trouble on live snapshot that
the current solution might not work for all guest OS configurations.
</pre>
    </blockquote>
    <pre>So I'd like to clarify that guest's init_on_alloc/init_on_free cannot bring any problems if we don't
consider virtio-baloon here.. If these pages have been zeroed inside the guest they certainly have got
populated on the host. And UFFD_WP should work as expected.
</pre>
    <blockquote type="cite" cite="mid:20210216233545.GD91264@xz-x1">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">impact should be small, I think.  I thought about it, but indeed I didn't see a
good way to fix this if without fixing the zero page copy for live snapshot.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">We should really document this (unexpected) behavior of snapshotting.
Otherwise, the next feature comes around that relies on pages that were
discarded to remain zeroed (I even have one in mind ;) ) and forgets to
disable snapshots.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Agreed.  I'll see whether Andrey would have any idea to workaround this, or
further comment.  Or I can draft a patch to document this next week (or unless
Andrey would beat me to it :).

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Really better to document this specific behaviour but also clarify that the saved state remains
consistent and secure, off course if you agree with my arguments.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, no rush on anything yet, let's reach a consensus on understanding the
problem before trying to even document anything.  If you agree with above, feel
free to draft a documentation update patch if you'd like, that could also
contain the code to prohibit virtio-balloon page reporting when live snapshot.

IMHO if above issue exists, it'll be indeed better to implement the MISSING
tracking as well with UFFDIO_ZEROCOPY - it's still not optimized to keep trash
pages in the live snapshot, since for a high dirty rate guest the number of
trash pages could still be huge.  It would definitely be more challenging than
only do wr-protect so we may need multi-threading at least, but it'll be a pity
that live snapshot randomly fails some guests, even if it's rare.  The thing is
host cannot easily detect that guest config, so we can't simply block some
users taking snapshots even if at last the snapshot could be silently broken.

Thanks,

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">Agree, let's reach consensus before doing anything. For the concurrent RAM block discards it seems
clear enough that they should be disabled for the duration of snapshot, like it's done when incoming
postcopy is active.

For the discards that happen before snapshot is started, I need to dig into Linux and QEMU virtio-baloon
code more to get clear with it. Anyhow I'm quite sure that adding global MISSING handler for snapshotting
is too heavy and not really needed.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------4105C8827BDDD738D9FF555F--

