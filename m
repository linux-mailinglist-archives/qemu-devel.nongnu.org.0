Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C03DA917
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:30:32 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98vX-0003ZC-Tc
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m98uR-0002kL-Jr; Thu, 29 Jul 2021 12:29:23 -0400
Received: from mail-eopbgr140132.outbound.protection.outlook.com
 ([40.107.14.132]:15229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m98uO-0007ve-IS; Thu, 29 Jul 2021 12:29:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOxbpStiQeGx0SWb79ZuHuO+HdgaHgeBEvmcyqBqz/CpFYn9xTuZu59aHL8JHvp4SpeylT+M/EODx5rel3owEbH3Lcv3jQlYZ9PRhkyAkfpOFMMd2P6i4LamrEFaAiiq3JeTAhTqrijrppUSOoZD85NnPYZ1wSOlRPPrVgAXGPTSyRZ6KJA7FzAcRzeBqfoUzOY2i5BVzBVlX3ETasob80LSdgiXODX/UMmdMC7fuOF4JCq/bKa/AUmI4U8muKjkexvwfl169oF/RlpfrsaQoao0iLhgrUBkOvwTeN17jQH/kGGU9fLmdyx6QAlGQ07hlvYL7JUcQvJrF0WC3cSGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z9UzlXrBCQU4czyEOkUz3Zv5VZoCARrbtV5Z3sVono=;
 b=gCMpH6ieO8UpuTqkqLJrQXru/2YhGlfpwaid9QwZOCeKif1zIS+mAUjSFDGS6RAEUWpCP35w5ftbLoWjJVJsiUbwUa9vUKfXqAH30T30jZM8hIwXthKOzqut/nlCex/YAV4vxbCbad+4rVWvDoTPrJes+ii5uruU7n9Vyg+HkGnHmG64uAIq3TX9OwyxJDaX9CHQ78I8RkCeypqy5HSBue6zlhGOCmChRL/TOCJPjvg4gxB02R47GUuDiTbXIo12nldPj12BOPcCYvQ4ZgRnFcJci01mj2ThUUlrcVlk9MIPPTDLYHhrIkgmCrCVEYBhagiJ807jNmgu7N7R0pYYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z9UzlXrBCQU4czyEOkUz3Zv5VZoCARrbtV5Z3sVono=;
 b=Wg7olI3n13SMZ3Ocsyz8d2bpxCGqxOKaKE94jT9j0u/wWA1CdEoOHYppqM+SQcsURNPEIfPTDPI+rp2CFt70YJUIa7XyYUgf0Vysul+vYp37HGXkPsXCSy+8EqCyFkBmqnQ1ybLAw7OYF09iFDsrT5BSqxxUl9jmY4MLeffNADU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 16:29:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 16:29:17 +0000
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
 <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
 <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
 <660d9a7b-beb9-c2a2-33eb-d894aae8b1e0@redhat.com>
 <af37e046-46d3-2791-f91d-bdbaec9ee5e5@virtuozzo.com>
 <a8e6f5d7-2bf8-6214-3689-6350592eab07@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a3f7afef-8eb2-80b3-1a9e-9c37a1cf85f9@virtuozzo.com>
Date: Thu, 29 Jul 2021 19:29:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <a8e6f5d7-2bf8-6214-3689-6350592eab07@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0162.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM0PR01CA0162.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 16:29:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 230235ee-b179-40f7-d61a-08d952ae0266
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59101519360B9F34FAA068B8C1EB9@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLY0U96E6gNZaCpysohiOuqf8RIH6fJEPGphESP9FzX9ME5LEgPZilIHrqe35yTFsYxiEbbaVmeLox8l8cxKxsL745wNNtoh3Hov/Bp5jL/pA47blN85nZQG5g2VgjfBTb7s04WeJNrgS1zYCppACUkV7857PbETCgq1fOev/4iYCsi041X4Faj6dhVGE9XknKFtoo6fECws7sfST6NyBW/K+YXmLYe9vZ2Nnc9iRAbtIYRj/OMmdfSdCTl+4tp0pEMLyEuLzIWxiPrvPVt+Hepsb4s7/c8XUqHZZn0yTBfXeYJ8JcD/KqXD2tdt4tFnsywc10GqPYsFJwXZFIdQ8/9tdkKoDij1ivOessx+1fj4AN1rxa1Wkrv0s8xuZugoQGf/wMN6uA4ZFMHJB/DFDXerHsfO01CgOEPMtP0Se81nyGJF+v3zeJCKgizof8WRl+Wtv0sa5Subk0FRL/t+stcOVNuSO5tfuClCZ87hAjLseFtLXb9VVBfe1dPZH0Z3LXnjuudcm5hRa43/E2OS/DC9IVuOvWgVYJLHJfhdnYsEv/ntV3ISprtYU2o0+MfJcGC3rubtq5gZDbP7TvQfxgTxyQL6PRrxiscwcm3JzdDCqJnV58QX4or6YYrCzU/35vGdJ5y5gO/YS0r8uX4TAc2zRQl9uIfDwZZ8nUGVb79RnGwabDhlkT22Gu+GGV5dmLWnyBJo8lHrWcrNy/P+m0+bJpoCg+oEk/abZzARWTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(396003)(376002)(366004)(346002)(5660300002)(53546011)(31696002)(66556008)(66946007)(316002)(66476007)(86362001)(6486002)(4326008)(31686004)(8936002)(16576012)(83380400001)(26005)(186003)(8676002)(956004)(36756003)(52116002)(2616005)(38100700002)(478600001)(38350700002)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZQT2dkWlVYc2RNeUFxOEdDbTZHNUdEUGN4ODRDVW5DWU93dE5sci9sRXpX?=
 =?utf-8?B?NlcvSmdFWE5YY2Y3NlJ1SGxzaW4xcldZYm5WVmdtVURISUJQUEFsaStrQVRG?=
 =?utf-8?B?R0RuSGZLVlNJdDlINGgyUHNWb3d4dmxiVDdwaTBSTEc5ZmhWZkFGQWpBMUdm?=
 =?utf-8?B?bGJXODRUT2xkcnJWYnVDMUN1VXpYbWhNVGpONnJZeERYNkdvYzBkallYeW00?=
 =?utf-8?B?WUpZNVhveDdjMVcwWDRRcFJ0S014aUlpMG90cDN2K1VFN3llb2ZNdVB2dXFp?=
 =?utf-8?B?VjZCVUdlTE9lOFBGQmVyN1pYMkZkWHZBcEpsSVAzVVJRNXh2OWxMQVhvcHlu?=
 =?utf-8?B?RUZsRnprQllwWDNGUEVZcmFXL1cvRzlDODJjUUZwd2RwMzN6aHRDY3BwbFh6?=
 =?utf-8?B?Y25wOWNKTkNYcUE0dkY4NkxYaHNkUVRhN0YxaDVnb2VkVC9PK3JrTHV2ZXE1?=
 =?utf-8?B?LzF5VUdjUkJyc1pON1lncFRQb0hsaDFqcmVMV3BvQlh6V2ZlNGQyL0VKTmd0?=
 =?utf-8?B?MTlvWXJla2RMOHhFNDRRSjJEc2JML2lKM3k0YXpLS3ZyZEVaR3VKM2VSd1BD?=
 =?utf-8?B?cTVPN2dZenRScERmSXZYOFBiOTNwK2hkTUFmVFpwdmJFdjVlWWhidERHUXZq?=
 =?utf-8?B?RlM5d0M4MkI1dTNVU0s2RjRnSE9QZGhrUm1WN29vVDk0OWdGZkM2YzZqcHRr?=
 =?utf-8?B?b3pZODZteTRrRWtCV3AvNzY4Zi9VUGZRMklwcWMzYmQvT3ViK29yc0JPR0wx?=
 =?utf-8?B?RnJHMUFEYmsrMW9hTC95MnRkQUwxdkpOUmo3c2VjT21idjQzc01wZW1xTDha?=
 =?utf-8?B?UjdUSUhpRm9iaEljMTVZSXJjSUlYeTIrNGtxbmxWTmVDWENXK3NBTlFIWjVF?=
 =?utf-8?B?TUMrZWxnODQ4aUFEc0RZTHlVbyt0cEl5Q1poa1Jsb2J2MFg5UHkvZlFkL1Mz?=
 =?utf-8?B?eWxuN3NURTJ2VnJRMDBhYm9reFFoOHR4VnpMY3pldHhPWGJsbHlPSjA5ZGJo?=
 =?utf-8?B?cWtrZkQvNGxGWndMZG1PWEQvV0pyRmIwV3ZSQ1Y4emRKOHNldW40S2tMSzdI?=
 =?utf-8?B?YWQzeGdFbGpPRGZqeit1NjFZREdKV0FmejRuZjQybGJYQUZqOU90QWpPOFBq?=
 =?utf-8?B?bU0wT3JZMHlCbkZVQ2xLRDN2M05nNW5kYzNwT09najBETHM5MmMrUk5VVnNY?=
 =?utf-8?B?NDE4TVA4aFBZamd5MW1vK1gvMDJuanJQUkJUYXBNV0lJNzFRSnJ0Q2VyS3o0?=
 =?utf-8?B?L1BhenlFSUZVMDhDQWZuNmJpV0ZlTFlOcWgvYnF3dFB4eXR0YnYvQUdndDRZ?=
 =?utf-8?B?WDNGeGc2L2hVM0RldWhGR3FCRGdjSVJXUFR5Rldyb2RIdjQvWWY2ell3cFRh?=
 =?utf-8?B?YmxPam5QTFFLYzVCR2g4aERZVGlwZmpCTVBwUDY0M2NMUUFCOHFkU0FrTGJJ?=
 =?utf-8?B?Uk00YTUyWTlILzdxdUw4WnNSeTl2TElWQnlkaHVEaDZyOXRqSnRqUVdWUzMz?=
 =?utf-8?B?QXlRZi9VWHhzQ204ZGRuVHRONjRZVHk0N3hPYlVGNzlLLzJQQTlzMmpMOFRO?=
 =?utf-8?B?Z2hPMTk2SzRyVzQ5ZVA1NHA2T256Y2tOSTc0dlNHS1p4Q0owdEFqMEsybG9a?=
 =?utf-8?B?MVVpY0llOXRsL0VNTVRBYVlFanJnWjkzUkgwS0czaVp0ZmVFUVZyejFwNTFX?=
 =?utf-8?B?eW1EKzNMaHltOUtWVUR4RElrSHZqVzRPUGNUWFZ5MW5RTkRFUWNNeVZTWm9T?=
 =?utf-8?Q?Lr2QhGz+fa64ORXBxcsDZ4fDEggqg40QkpMi8wo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230235ee-b179-40f7-d61a-08d952ae0266
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 16:29:16.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhGLanilad+DOuS70di84FZTNt1Mr+Zd9y5kimtmQh1Q45Qd/GvWZedKe2mnk7dtO2vyNxQvfbu6iJTSc3cS7IORwkVbwk/jJ88zgL+l+Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Received-SPF: pass client-ip=40.107.14.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_NONE=-0.0001,
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

29.07.2021 16:47, Max Reitz wrote:
> On 29.07.21 13:35, Vladimir Sementsov-Ogievskiy wrote:
>> 29.07.2021 13:38, Max Reitz wrote:
>>> On 29.07.21 12:02, Vladimir Sementsov-Ogievskiy wrote:
>>>> 28.07.2021 10:00, Max Reitz wrote:
>>>>> On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> Hi all!
>>>>>>
>>>>>> That's an alternative to (part of) Max's
>>>>>> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
>>>>>> and shows' my idea of handling soft-cancelling READY mirror case
>>>>>> directly in qmp_block_job_cancel. And cleanup all other job cancelling
>>>>>> functions.
>>>>>>
>>>>>> That's untested draft, don't take it to heart :)
>>>>>
>>>>> Well, I would have preferred it if you’d rebased this on top of that series, precisely because it’s an alternative to only part of it. And if it’s just an untested draft, that would have been even better, because it would’ve given a better idea on what the cleanup looks like.
>>>>>
>>>>> There are also things like this series making cancel internally always a force-cancel, where I’m not sure whether we want that in the replication driver or not[1].  With my series, we add an explicit parameter, so we’re forced to think about it, and then in this series on top we can just drop the parameter for all force-cancel invocations again, and for all non-force-cancel invocations we would have to think a bit more.
>>>>
>>>> I now don't sure that patch 5 of your series is correct (see my last answer to it), that's why I decided to not base on it.
>>>
>>> Well, we can always take patch 5 from v1.  (Where I changed any job_is_cancelled() to job_cancel_requested() when it influenced the external interface.)
>>>
>>>> My series has the benefit of handling soft-mirror-cancel case the other way and handles mirror finalization in case of soft-cancel properly.
>>>>
>>>>>
>>>>> Specifically as for this series, I don’t like job_complete_ex() very much, I think the parameter should be part of job_complete() itself.
>>>>
>>>> That was my idea. But job_complete is passed as function pointer, so changing its prototype would be more work.. But I think it's possible.
>>>>
>>>>>   If we think that’s too specific of a mirror parameter to include in normal job_complete(), well, then there shouldn’t be a job_complete_ex() either, and do_graph_change should be a property of the mirror job (perhaps as pivot_on_completion) that’s cleared by qmp_block_job_cancel() before invoking job_complete().
>>>>
>>>> This way users will lose a way to make a decision during job running..
>>>
>>> On the contrary, it would be a precursor to letting the user change this property explicitly with a new QMP command.
>>>
>>>> But probably they don't need actually. Moving the option to mirror job parameter seems a good option to me.
>>>>
>>>>>
>>>>> Max
>>>>>
>>>>> [1] Although looking at it again now, it probably wants force-cancel.
>>>>>
>>>>
>>>>
>>>> What do you think of my idea to keep old bugs as is and just deprecate block-job-cancel and add a new interface for "no-graph-change mirror" case?
>>>
>>> I don’t see a reason for that.  The fix isn’t that complicated.
>>>
>>> Also, honestly, I don’t see a good reason for deprecating anything.
>>>
>>
>> Current interface lead to mess in the code, that's bad. Cancellation mode that is actually a kind of completion (and having comments in many places about that) - that shows for me that interface is not good.. It's a question of terminology, what to call "cancel". Also, that's not the first time this question arise. Remember my recent cancel-in-flight-requests series, when I thought that "cancel is cancel" and didn't consider soft-cancel of mirror.. And reviewers didn't caught it. I don't think that interface is good, it will always confuse new developers and users. But that's just my opinion, I don't impose it )
>>
>> If not deprecate, i.e. if we consider old interface to be good, than no reason for this my series and for introducing new interface :)
> 
> I’m not against a better interface, I’m against using this current bug as an excuse to improve the interface.  We’ve known we want to improve the interface for quite a long time now, we don’t need an excuse for that.
> 
> If we use this bug as an excuse, I’m afraid of becoming hung up on interface discussions instead of just getting the bug fixed.  And we must get the bug fixed, it’s real, it’s kind of bad, and saying “it won’t appear with the new interface, let’s not worry about the old one” is not something I like.
> 
> OTOH, if we use this bug as an excuse, I’m also afraid of trying to rush the design instead of actually implementing the interface that we’ve always desired, i.e. where the user gets to choose the completion mode via yet-to-be-implemented some job property setter function.
> 
> As a final note (but this is precisely the interface discussion that I want to avoid for now), I said I don’t see a good reason for deprecating anything, because `job-cancel force=false` can just internally do `set-job-property .pivot_on_completion=false; job-complete`.  From an implementation perspective, that should be simple.
> 
> I understand that for users the existence of the `force` flag may still be confusing and so we might want to deprecate it for that reason, but again, this is the interface discussion that I think we don’t actually need right now.
> 
> And that’s why I’d prefer for any clean-up to come on top of fixing the existing bug, so we can have separate discussions and take our time with the interface without feeling driven by the need to fix a bug.
> 

OK, I see your point. Let's just fix a bug with current interface and anything else is a separate step. Are you going to send v3?



-- 
Best regards,
Vladimir

