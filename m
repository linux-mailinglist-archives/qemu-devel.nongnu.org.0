Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8980A3242BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:00:20 +0100 (CET)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExWN-0003fZ-FU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lExTA-000224-Q4
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:57:00 -0500
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:22720 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lExT8-0006b0-C0
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:57:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmzxYlmIIzHlCK45IoqufPOtAYD8FOQOBLc3H3XEZO/qkwFUWZAPFjasnaLfe/YltLYEh33jAjCMm834qnvfE/Q4VvoLI5zEqhGfhBpmvNpdI4H/UxNMLYeK2wt4Rp4bVGQLr0yanr1Rc0y6YmHBSr9SPHtO/R3uSEPb2B+Sau+Qqg4ylU6130sJtjzgWdDxxn18BwMbK9IRSSNwmox0hr+iWhjUs084FrYrM7xc80N3na+5KqP+yAlwYx5aQKWztnUlf8aBA8/OKGAUjK1UZm6j0n/dVrgBEXKMT1VluEpe/GpoLIY8anOAO+Iq/I8lQO43XIIOl+P/SbeGKD3e/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/z9BYsrClyszqNs1WK5RC+yPzwyYYjoFxP7zZp3o6XI=;
 b=S5n0HOlazputTofJxtmGsB/58H9NLmQbw9Efx5zNRPnsWY5LEzXbIGPpmddSs1IjtF6JLXQeogDvSqeL2Ya83BVqWkyRyxJBiosa5UbhtanxPGWrtsEcaZywc6esoyPZ23HuNjv+GJvKe4i/4nX3dLqohiiUrGjBXkBJpV5vql8g+aXyA5mA1yQoQ5Z1IGudrxWD00hblTHTAGpED+QEuwOCc36zJTRZ6tnWYnhRINb5hNvhfgLXLftd0ZXHk++mfVosizueXHDS1PVHLbBpLWDLaMbhF9kiHk7bdRQRUv1tMZOiYWpf9QJ3ZyqMoA8iV+nn27Y0CNeM3oOjTciZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/z9BYsrClyszqNs1WK5RC+yPzwyYYjoFxP7zZp3o6XI=;
 b=NUWv6cbMfOQao3snv+bhBB/BzcKGp2lIL97/6Gs2hAD/PTzvviVP0qLclZkQXdhD0+BxMkb+mzeyUwdcR5DZS5xvug/DSHEFO06lSk2GriwH2Y18R1kQau5k+njuwRaNyADW6BNmEOpaK56YUwkrcY67foEEBzs5LuN4QEE/hVY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 16:56:55 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 16:56:55 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <dhildenb@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>
References: <20210219224719.GN6669@xz-x1>
 <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
 <20210222172923.GS6669@xz-x1>
 <79ce6a7e-c40b-b64e-757e-1ec6e4177310@redhat.com>
 <20210222175440.GT6669@xz-x1>
 <5471ac12-0dc5-1435-8fba-fad7b37bbcf1@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <29fff27e-b2df-83a8-2649-581949a216de@virtuozzo.com>
Date: Wed, 24 Feb 2021 19:56:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5471ac12-0dc5-1435-8fba-fad7b37bbcf1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM8P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::33) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM8P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 16:56:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f20a74fb-d0b3-48f8-4e24-08d8d8e5304b
X-MS-TrafficTypeDiagnostic: AM9PR08MB5972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB5972E56E963683F946A404999F9F9@AM9PR08MB5972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6nuHoPYa7hFkpXiNA+LiY0SaopS2zLnYf3zpUOFn/deqHmXUWLNIbRAJH34hcSmu1tMSBNl2BTAbu/0UykM5sQQRoqve6r9aV5BgkGaKOmGQl5+Y4EwrVq2QmFl5IIzpOMIIsjvQFPn8U8kmEjw5DGTHqmjQboUBUcRferFblT3NZwEOBlnwytKdBiTJ7knGDxYRVWIYRf8R2TEsLQRFnWOA42AKmqY+W8HpyusHFEmAsocbK5xbJcK2AN3ockgBG9qmARGOUNUSci0paYU39ab64gu8tvlPkld0jNdA10g9x0qrAe8GzmJHwqC2W28weBSuv4DGGLwD7X22w8vakkThWYMOXv9OoZjVVmtE9eP793yEexHw2sMoieXdV4psvA1HmCIUwtS5ScYcMAmVBFBp+QmbJpxLjz/JS5RVpmFAGo9MRzw9uvF/AndGnAOXMmBVX8rS22k30r+i0BHJCVUxebTzVubTeoI87pmKPo5p9XGC3JUITS7sgM2J0tuFOW/hgP/5c0qpnSiM2vki3R+tvXa3pnml2/Vlo1o5FodXa0F0iKWoe5p0G0la1Vsk7mlmNJUewVg84IUTRv814INP0v/5Em3E0w2FunDalU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39830400003)(346002)(8676002)(16576012)(316002)(66476007)(83380400001)(66946007)(53546011)(54906003)(5660300002)(66556008)(86362001)(31696002)(52116002)(44832011)(6486002)(186003)(2616005)(956004)(4326008)(8936002)(26005)(110136005)(16526019)(36756003)(31686004)(478600001)(7416002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDNZVmNlWFAxQmNwaTBpVy9uN0wwUW5DQjhJa1VuZXNkL0E5QXJReUhKeHNQ?=
 =?utf-8?B?Nk5sSXMvS20rOGgvdGFpenI2ZWxWdW5iVURPODBhRUE2UHVTSkVOZ3BIMkNN?=
 =?utf-8?B?U2QzVVgwb2hlYnQ4TEhpdDVtblR2OENsem1BMitaaWQxQTFIaWZqNWpDWENH?=
 =?utf-8?B?dXJlTUo1aEpWY2dlYm5lNUY0b3J2b2J5blI1b1JRY2ZYd0EyYkVYS3hnakpL?=
 =?utf-8?B?OVR6Um85L0M1SE5wSVZqdmszU2QzcEIvOTU2WHVBNkxISE9naTNOUkYzVUtn?=
 =?utf-8?B?RkJDNUVDcDdLeUtNVHJ2U3VlUDZnMGdpc1FtTTdFZTZLc0svL2VPQjhVRkRk?=
 =?utf-8?B?Y3JaeWRjZ2h4THM1VTg1aEVHblQzMWp2R3hMNWMwL0doM2ZnQ0lBZG1vN0RW?=
 =?utf-8?B?aWh2SU14aXc1c29lcFViVG9RQWFNVnFqWFNyRkRGanE5RVc2UnlJRDhEcmlB?=
 =?utf-8?B?cVQ5OEJzNHRCY3JuZlc5L3JUcWJSMmZtZ3hUdG9KMWhVUHAxTEEyNHQ5Z0t2?=
 =?utf-8?B?Z2RSUzJ4ZTMyNk94TDFiTXZnRjYzQ3Z4TGJ4bWFySVRIUU1FMGJkTjVzYUNT?=
 =?utf-8?B?U1F1YkVLbVFIYzRsTHRxYmxMUjl6TGFUSlJ6WkVvYjFGd1oyOFhsUWNUYjRJ?=
 =?utf-8?B?bFBKK1krem44YkhibVNEK3o2T0VEQ1dRa3p0L01rZlUyWGtmVHNvWVQ0UFFD?=
 =?utf-8?B?dkU2TjJmbWtWSGJqcFpnVGRtZmJ5THZObzNkcnhMNHhCMGxSdDQ1eUZQejJo?=
 =?utf-8?B?ZmhYN1FycU9vZFFqdU1YZFcvWW9PVk50cnpMSElFNlNiZG1aWldmZXluT3Yv?=
 =?utf-8?B?MnkxM1RtRFdkMXgvWFhXK1ZGbmg1SFZ5UHc4Mmt1VUorckk3WUhsVmJ3cG1T?=
 =?utf-8?B?d3NKb1AxNXR1S2lOQzIweDdIQWRTL3JuY2M3RzBaSGhRajFyZVBpWUU5TnJO?=
 =?utf-8?B?L09KeTBUMGtEQTBwbDVTUHUxc3lIQ2prVDR4bEV0SXJibjNPS3U3eEpEMjE3?=
 =?utf-8?B?RUdib0hUaW5ZSWNnV3lRdkltNHBzNGw3aDJkY24rWm4yTDRWalZrSlMwWWsy?=
 =?utf-8?B?S1ZNSy9EcWpkRGhPSDhtZ2daNHNSTTVUa3hRUkZVVXE0NnZOL2hoVW9HdlJV?=
 =?utf-8?B?TUlUZFIvMXBvM05hMGtiVWk5aTgrOFpzRjJYai9XK3Q3L21EME1oVUN4U1RS?=
 =?utf-8?B?dEVOWG9PVlZLbmI0OEZqR3dyY2lpTDBEZktGOUI4SlpUVHM5NFJZQlBsOHp1?=
 =?utf-8?B?TjhLcE9jK2VNWTd6aVZJanRITmtqSUhDcDVBVUhzbk0yZGMxUjI0OEVHczNC?=
 =?utf-8?B?bDY3elpjL2pjTXpWTkI0YjlqdkpCZDFTMjE5OUdJVFpySWQ3RVBSOXZNR2gz?=
 =?utf-8?B?OE5aTy81bjBHRCs2dG9NUUl3KzlIOXlwYjk0dkJiQkZyUUl0UndydUhpeXlD?=
 =?utf-8?B?Wkp2L2hwanVWZW5mdGoxWHJnc0s5WWlnR2p3Q2dPYVgwMm11VDhiclg3aGpH?=
 =?utf-8?B?Wmp2MlJwTlJVSmhNQ3lnbnBJQTBhcUI0Tmx0cUJuTnpkNi8xcnVxMTAxUUZC?=
 =?utf-8?B?TkdCSFp1dm5la1dBYUF6WnJ5N2d6VFRzZW82RjdJbWVZTlVoQm9ZSGVHalhk?=
 =?utf-8?B?Nmk5UmVHWTFEdGdxVmRsOS9wSnJLczdWQmlqNW1TSjlBWks5RStRUW10Q0VF?=
 =?utf-8?B?Y2E2Ui81NFFzWGRMUHJGbHlzeCswNlVxYzdSZFU2SXMwMGM2S1Zsb0RwWlpw?=
 =?utf-8?Q?PEr+j0A2YwmVTSwjt368LYxJ7UQ0G/z1tgc4mR9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20a74fb-d0b3-48f8-4e24-08d8d8e5304b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 16:56:54.3106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x851MroXcLJeYfM9XPPosWY3zTDbXC+lHalk3l6Jo5BXl3qqSd3lBdWfNnvelrsgCuHd1SB/mNvwUca+v+M7WKk1C2BhF1vEn0IvwdHTOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

On 22.02.2021 21:11, David Hildenbrand wrote:
> On 22.02.21 18:54, Peter Xu wrote:
>> On Mon, Feb 22, 2021 at 06:33:27PM +0100, David Hildenbrand wrote:
>>> On 22.02.21 18:29, Peter Xu wrote:
>>>> On Sat, Feb 20, 2021 at 02:59:42AM -0500, David Hildenbrand wrote:
>>>>> Live snapshotting ends up reading all guest memory (dirty bitmap 
>>>>> starts with all 1s), which is not what we want for virtio-mem - we 
>>>>> don’t want to read and migrate memory that has been discarded and 
>>>>> has no stable content.
>>>>>
>>>>> For ordinary migration we use the guest page hint API to clear 
>>>>> bits in the dirty bitmap after dirty bitmap sync. Well, if we 
>>>>> don‘t do bitmap syncs we‘ll never clear any dirty bits. That‘s the 
>>>>> problem.
>>>>
>>>> Using dirty bitmap for that information is less efficient, becase it's
>>>> definitely a larger granularity information than PAGE_SIZE. If the 
>>>> disgarded
>>>> ranges are always continuous and at the end of a memory region, we 
>>>> should have
>>>> some parameter in the ramblock showing that where we got shrinked 
>>>> then we don't
>>>> check dirty bitmap at all, rather than always assuming used_length 
>>>> is the one.
>>>
>>> They are randomly scattered across the whole RAMBlock. 
>>> Shrinking/growing
>>> will be done to some degree in the future (but it won't get rid of the
>>> general sparse layout we can produce).
>>
>> OK. Btw I think currently live snapshot should still be reading dirty 
>> bitmap,
>> so maybe it's still fine.  It's just that it's still not very clear 
>> to hide
>> virtio-mem information into dirty bitmap, imho, since that's not how we
>> interpret dirty bitmap - which is only for the sake of tracking page 
>> changes.
>
> Well, currently it is "what do we have to migrate".
>
Using dirty bitmap can prohibit unexpected (overwritten) content of 
pre-discarded pages, but they'll appear as zeroed on destination.
What about other virtio-baloon features like HW_POISON when poisoned 
pages should also be retained on population filled with certain pattern?

Thanks,

>>
>> What's the granule of virtio-mem for this discard behavior? Maybe we 
>> could
>
> virtio-mem granularity is at least 1MB. This corresponds to 256 bits 
> (32 bytes) in the dirty bitmap I think.
>
>> decouple it with dirty bitmap some day; if the unit is big enough 
>> it's also a
>> gain on efficiency so we skip in chunk rather than looping over tons 
>> of pages
>> knowing that they're discarded.
>
> Yeah, it's not optimal having to go over the dirty bitmap to cross off 
> "discarded" parts and later having to find bits to migrate.
>
> At least find_next_bit() can skip whole longs (8 bytes) and is fairly 
> efficient. There is certainly room for improvement (the current guest 
> free page hinting API is certainly a hack).
>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


