Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2AF2CAD16
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:13:26 +0100 (CET)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkC1e-0007MB-05
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkC0B-0006jp-3T
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:11:55 -0500
Received: from mail-vi1eur05on2091.outbound.protection.outlook.com
 ([40.107.21.91]:4491 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkC08-0004rv-01
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:11:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmtq87lNOy7yNfW/ycVYD7xqtSUr5AuNCZOaYdrDMn1flEYNEz1CJpAq9OYGmW5AnzWVhr5jngwa6sdlMfTs3IZlUMzVhZtvQeuFlJ+riiwiH4erh9F8rUFWBEFkv5NsPtZWmej9+glej81l54VltZy7TVK0bT/4TdEn2/oLMj4zKJNHLxNfn5wJyDVPqEfEbJyEtPxgZvviC56KYRA91N4uPu9g9oDxenMyLTkcgnv6UopYS2bOv2oDd/zOPaSdSnMKW/k9R7N5sZNMvNlZ2GCLnX8ic+kY+snvIr+SzsUkfx5oYVxqpjhXnXaH3g0UH3KVF+rTCeYJ1oiqcbu2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHf70qTscrviC/Hur8QdIJOMYccHEcx64efrwpj1rDk=;
 b=D3xNcMk4gSuGfdPpzuKEDD8F+eI1c0qMzkBaSPP7B1jv/IhG6hicMXrOsWjY3vXtCpiDeTXUZ2Hzdq/82A/b1DGtWFLeaQtAP4JQ7uQq1x5HqpwBIT5mL8ZEJucMHsSyBhkcwlvtYb0hpGkJMgbjYBEDHO45/+6MT6CxggfG9BBFr+gBVFVmn4DzK05ox1op8LeCAo8sunVASZQ5xxC4g0w4m4VC1PK2884KnUiKETyLdha6QYPNM/V9rm4ZZqhvVNHBochYRRy10OZ4AtzByFFr5pW5/3q1S8/rIjaoxTMv9kKRtnpJl4C/fF47/jbchnHHdNohQpRLBeJRqaO4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHf70qTscrviC/Hur8QdIJOMYccHEcx64efrwpj1rDk=;
 b=Wn8g1j52g8BEY8ZxgmwkSqWuxs07rTxeDNdk6XkUXPHjpHNxvraTEWsqbbNJVNXznUZmITyLb7n0jw6Fz1rAK4u1JGlA3SCakxuEEGHjpwgtZe1rL8+F1rT6nEMkEXdqPELsWk70bVtJog3C1ByJ+8ya0WRPpEDmwmeRE+RJyKA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5615.eurprd08.prod.outlook.com
 (2603:10a6:800:1b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 20:11:46 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 20:11:46 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
 <20201201184055.GM4338@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <472f5bef-c066-a939-676f-88b372574828@virtuozzo.com>
Date: Tue, 1 Dec 2020 23:11:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201201184055.GM4338@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::21) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:208:3e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 20:11:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41eef5c3-7504-402c-79b2-08d89635540b
X-MS-TrafficTypeDiagnostic: VE1PR08MB5615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB56152C9DCABC913F0D38E2639FF40@VE1PR08MB5615.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oq/q78EnZMPWfx7oHi8gFPz7jYqwujAQL0Os3aIA4oupx6eLPMYrSGoB2mrcagLWqpBEo0eVI+jrXSmB1MlMAy31y8mSdTIMOfPnce4Q7r6Mb+V1tbculLx6nMaOxIuyEgdDZp5vaPz224MBo18j1DU7WFhzYZ3uBmXTmVQxXKWr1Op2mrktogPw2/+3mlval8dHRcNgsnevqPyZHMrtP4BZqY8Gi3TxAoFchw6L9PegLQxVz3ccgyoVfoqKQ/1hO2Ov68ojHgdgCe1BaVDS2JLS+HIMzkinzcxtybuTfDM+gBGAUjOFqXDqs7fcvHR+gmqXaDKjhy55qH3ePiE4JiXLgNV12iabNBZLzt4GjorXnmG/l1GjLgdothE58o6D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(6486002)(31686004)(316002)(16576012)(86362001)(54906003)(8936002)(6916009)(36756003)(8676002)(31696002)(2906002)(5660300002)(53546011)(478600001)(52116002)(66556008)(26005)(16526019)(186003)(2616005)(956004)(66946007)(66476007)(4326008)(83380400001)(44832011)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVBCY1MyTXlKaFA1cmFZak9XRXM2Y2dYbVZPR3RVQW5tTzZ3cE9ZZzBRRjJY?=
 =?utf-8?B?aVFQWGNGRnZPWWUyalkxSmcxS2xpQ3I1YWxOS2tTN3c0RUd4QXlERHB6YnJP?=
 =?utf-8?B?VThENGRwZ1Z5eHdoMTdUQkJPbHdTWFl2ek9sSlU3bk02bnNYaUh6d1U5RkRO?=
 =?utf-8?B?dXlJUDZWYmJuZ1U3ZWJZL3REVytrTlBsbzUwUVdZdi80bkVkRnNTMnN1ZVVP?=
 =?utf-8?B?T2ZmZ1l6VW43SGwrTHNnWisvenNiMVhjcUFETlo5ZFBmLzBTN1BpR0ViY1F5?=
 =?utf-8?B?TUlDSnF4KzFmTmNJd25nY1NINlFQTmptcmVETFhackJPdEtkZ0ZDRVdWQnBw?=
 =?utf-8?B?bUN6V3RVMzZrMGRRRHlHRml1YkRTVWlQOGFoK1lTVFQyMXlZZ1ZaTkYzekZj?=
 =?utf-8?B?dWxOeXAyb0YwYk51L3RFSlZDTmRON1VRV3JkbjJQUHhWTGpYRGF4bTFIZitr?=
 =?utf-8?B?YWwrcTVPdDVjeDlKT2NsRmljY0xkZW1KTGwwUElsV0NMbjlPeFZKYjA3c050?=
 =?utf-8?B?WEEzbUtMRU0rSHoxV1JOV0RLSVJTb0xRZTV4a0IxU094Q2dpSzZmMnhJQlB2?=
 =?utf-8?B?dlRVdy9SQTFONVJvSzVkd0NrTjd0QXBLZG01Y0hScC9lTmtJUTZxdGhqRWR5?=
 =?utf-8?B?VlZMb3lVYytiZS93ayttNGRVdXBGU214blIzSnloc2pEM2x6TFVwcVdIT29O?=
 =?utf-8?B?bWtQa1RUb2pLRDJJaWdlbDN0cFRpbVJqek1aTlpRWDBNUklocEVHVXRGYmlV?=
 =?utf-8?B?T0ZZVHNocEx4dDlhV0p6eVBEbXdweURuM3NJcmpLY1U2UTdPWldEb2hLZ3Rr?=
 =?utf-8?B?aTFVL08zdXJNcE55cEpRazdHRnlPM0cybDRiNXFEd1RsQUszdjB4TDByT0lF?=
 =?utf-8?B?b0lTSVlPT0xrTnF5V1EvazFoSXh1L0dsTnB2RytKbHo5alFMeGtKNFYvdGs4?=
 =?utf-8?B?RUJBSllzc3JreVFJZ2MwOGVTakZGbzB1TVBOR3laYURnVWVxbk9hMFVFcGo5?=
 =?utf-8?B?RjMzdnNNYm1uaml3akF3bmJxcTBNSCtPSDh6VThvQUY4ZXYvYmVsdzIvQ2Z3?=
 =?utf-8?B?YUhiNWsxWVZnMUJsL1M4bk1DcFpCMzJDSEdEUlBUZUJwWmhOVTd5V0p4M1BZ?=
 =?utf-8?B?ZmE0dzJZdk5ld0hXWXJpbUQ2RnFKTW81TnhBdEcvMEVmdE9ORjFLTTcydWFs?=
 =?utf-8?B?YTdvVVI0azlWYnNTeit3bHQ2Q0FnNXN4S1h1WnBWbG5Ec2pNQnJaNzBoY3BV?=
 =?utf-8?B?SmRSUElyM0x6QU9pdkJvN1d3RkF0b0p0WlcrR0tIWEtkNXZGRTZpcHFsTUc2?=
 =?utf-8?Q?C6DoZ2v8RgS1wXdwhTRh0rg+Zx4FkHKThR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41eef5c3-7504-402c-79b2-08d89635540b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 20:11:46.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqMWQ2m/xPqmUrbS9uqlsZvCoFn430sVwOwdcQ+sDZarOiONAknQtVriERWknpo/VJUHaxCsdE6nkBFxcNFUO3dRj6sobnmoUYUFdDpK9ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5615
Received-SPF: pass client-ip=40.107.21.91;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 01.12.2020 21:40, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
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
> For hugepages, you'd need kernel support - but also you'd want to make
> sure you write the whole hugepage at once.
> 
> For shared, there's a harder problem to ask; what happens if RAM is
> written by the other process - for postcopy, we get the other process
> to send us a userfaultfd that they have registered with their VM.
> 
> Dave
> 

Yep. May be problematic. But if used for vhost-user external backend - 
seems it should work.

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
>>
>> -- 
>> Andrey Gruzdev, Principal Engineer
>> Virtuozzo GmbH  +7-903-247-6397
>>                  virtuzzo.com
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

