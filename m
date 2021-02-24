Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4F324360
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:54:21 +0100 (CET)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyMe-0007xo-4V
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lEyKd-0006yp-9N
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:52:19 -0500
Received: from mail-eopbgr10110.outbound.protection.outlook.com
 ([40.107.1.110]:36869 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lEyKX-00083q-6I
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:52:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5W9ZiLFaAJbhrxAfR62lgAFEnLsvy3ugnwO2RYBOBIazaSJbe5Ow5mZ4aBya69kzP46lXRwjMQ5kDfjHVkzhTVrMc0qmEPx+VEBKsdqrAKRduaUfOcw3ySvt+sigvzamgDXPzOaMtqEsyN8j3FPfLhBZHERkxf0sv+tkxHMgAKdwnI6FUh8eTdXQPuhGDpdUyCYdnYyL1spkB0xabTsY3wzbJXvQ4JwlFqJ6jXB1nBqjV7AabKh2PYq9ztmn8b9TD+ZohUUZ06RxlOzaTr3Opr7COOtlSfBN8DQSDGfpKCdW8nKBNFEPnqGhS4Y/bHubKhuN64b0QIbU+SBGUdHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o2B+5JnsZspaS8cUxwdiHFVPWaHpF5i+i5yhSYRKE0=;
 b=la0k5XLBJ0WTMWbgXKUN0NULVhfpSPrkkMyjOxBpPNfoKwuvO7Ar/DOiuf2crmUQsh5nyy9UULEsFewLefw39vkEXJ80uemZhoW5GP9rnShgkkRmfZ7jRFIpJekVQM1lWTBqK5f17vALXJbdhlLAIXm1OPo3xTWiUjzQvZXQqoKzQPzAP686U2hDQWcv+CCtHQp4c8EtvndVKC0yIC6ddwZOEtGyGVBkkdwTdKk5S8BKf0MaXMnSLrlQK0rmSEg8kBDRIidEQSXBXZgtb+Hc9r95CQwyP+nGH4fPOWyxbyczqmhW4ytKbTVmrt4iD68R28PcG8QSR9E4QrJiD/+GSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o2B+5JnsZspaS8cUxwdiHFVPWaHpF5i+i5yhSYRKE0=;
 b=I9Ofe+EULkFKVtO/eJLThx+frqNutwRVHwbmtvWgHiDP5m1VoTKPufN8yeV+lApf80l4CcbcsaQt/LVGsIPCYg6BjLe87CN7cNzfC1SLlXYFZCQHRsUXRbCMNZ3wNbdTO6szXoUM0r+fXXgmoQ0JanB2KOFKjzvhIShsi6FMr6U=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB3283.eurprd08.prod.outlook.com (2603:10a6:208:5e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 17:52:05 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 17:52:05 +0000
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
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
 <29fff27e-b2df-83a8-2649-581949a216de@virtuozzo.com>
 <39a30875-4424-8437-47a8-1043252159f5@redhat.com>
Message-ID: <6ef9f78f-317d-e207-a40e-9a36cf3a2b2b@virtuozzo.com>
Date: Wed, 24 Feb 2021 20:52:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <39a30875-4424-8437-47a8-1043252159f5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM9P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::28) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM9P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 17:52:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a4d264f-309e-488a-9866-08d8d8ece588
X-MS-TrafficTypeDiagnostic: AM0PR08MB3283:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB32831A9A41DDE7A30CE94D239F9F9@AM0PR08MB3283.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBSKWqrRDChV1LBEJg0ypvTMzyQRiLt4+soN8odLQp+46LzUFqoyz/7yUoApG2ZthvvhsSQzLnbNQF2wOhKm6SM8FREJLbHXM+WszPcdrdCdkyCiTb3wxSJyByI7uLP0U6PCm8gSaX/RVmP2TTMqv2sOCKnIk1dr6d5Vdz4MB5G2NHf1Od2Sr8NZQCkNvnFAG4EAnd8VILJ5sAZGAULBdPSnmFynsJHis7PBM/ASjeioR/DqVHckgqmDaALv3yRHJW18egy97rtW6zZwVHIWgqCFbcG9AEPQvEAOqz0qhYQ/OEimQAdJYVhyESinpwfYjCFH7QJ5GjnOcSIXkGeLoHZHes5UEnhLMlfLtGPHEVDlOGEykkHeP8PNbVDDYsf9Mf42PrYtSHgt/zV73nwFNaoKqs0H3CTr925X6aXHljdnke+4+yclm6zOCTl2Vibu+mYEuOLZk9SsYBd9/fLCu1HZehgHx6gWPWhl/IOibC6xVPp/ooUqPEGK1ZhLGW2TuPFwsbQBB6mB+DeOvDEus0E3HzogkQybpqCjEeMQePjyk2hL3AiYBx1FCPf4mR0yuPuDJMSBLeTAqMMZHs/7RDw+KDY/aypVE0oR6/6gkYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39840400004)(346002)(31696002)(7416002)(16526019)(36756003)(26005)(66556008)(186003)(66476007)(8676002)(8936002)(956004)(2616005)(4326008)(66946007)(86362001)(53546011)(52116002)(6486002)(5660300002)(44832011)(16576012)(478600001)(83380400001)(2906002)(54906003)(316002)(31686004)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDhnMkFSS09qcElySkN0RnVjbWZvayt0aVRTMGo0K2gwSjd0bmwyZjhuZUgy?=
 =?utf-8?B?TVo3R2hzdG9qVlpJQlVxbHcyZHM2NVRuUisyejVIb1V6TlVTN3hCeG5Hdzd6?=
 =?utf-8?B?dHZiY3pjQ1h1TmZXeFp1Z1FWbmJCUEdvdkoxU0l5R0tuTVBFOUI4RlVkM1h3?=
 =?utf-8?B?MTJyOG1jcUhlREgrN2x4T3RuNzk0Z2MzcC9zWWZObVpMSWRsZWh3SXp3cXFZ?=
 =?utf-8?B?STVuM25RR1lBamlJQ3NIbFplWEdtV2ZWV0g1bWRld0JRZjVZMk94cGt1Rlo2?=
 =?utf-8?B?TWhzMnY0M1cxdU82VzNoVjNMVCtTNE5jbG5tM2dsdktVaGNlT1BOVVZUaFY2?=
 =?utf-8?B?dlg5cmtlNkJNamw4THRwQkoxVzBvWHFhSU9mUzZabFVDZzdJRTR3TVg3TEUx?=
 =?utf-8?B?bi9FVHJVdzY1QXhhTC9iNFZmdjJzTmdVV2dDYUpBQU9EdFFDRGk1VVpSZ25B?=
 =?utf-8?B?Rnl0WHljRDAzQXUyN0VsTFNQNDNXcGp2VlBKck5KdDJTNUxlNXlFZ1FYWlpy?=
 =?utf-8?B?aG9IQk5LdHVFdTVQY1FjVTFaUVdreXZKSjhwNGxXTXNmT25kNHExRDl4STJD?=
 =?utf-8?B?TVI3TVA0MUxBeU9tNUtFbkZUcHZ5UmJXaS9EQitGc24zSE1tcjV4Rms2b2o3?=
 =?utf-8?B?VlpmQ0N3U2c5QlpqNkNldmkxMmUyWGZuTDcweGNtRThJemR0Z0JHSTBXMUlu?=
 =?utf-8?B?d0ZRdUNtV2F0Y0g5OE5hVjhvMG00TFVTN2RpRExiV0Q4blNlWm1aMlZqME9i?=
 =?utf-8?B?aFV2MHg3SW9IamJzWTV2VXVpMWU3ak1IVWJKVW9HSmRKSWNpblo3eGVoQ005?=
 =?utf-8?B?eDEvWk83OVpRSmVyNTlUa003b2pZWUNWWjhpOFRHaHFXNkNSK1pEb0NpZkxG?=
 =?utf-8?B?OVM1RnJXWHplcUE3dm9wd3FiOG9nWUVDa1d6a25zd1RoekN2WlBta2J0UXRa?=
 =?utf-8?B?NlBNUnUzYnN6RXpvdlZqd0lkRmJ6bmFDL09KOW5kOFc0YnpKNGFRTG9FOEpt?=
 =?utf-8?B?TURlTWJ2OG4wUjkrMXJWREp2czFOdEhLeVBaajErZERkZEZYcG5FdmhIQk8y?=
 =?utf-8?B?UGh4b1BoY0h6aWZIMnIzWlhJb3dFZUVOb1M1amZkV3RpQUxVaHNPMkhKZ3FV?=
 =?utf-8?B?M081OWhlRkEwQWdVL244Q1hOVTMwQTZLSXIxREpYajFyNXdudFk2STBvYTRv?=
 =?utf-8?B?KzlpSWhrckRFWlo1aWNxZnFOcktKWHFWOXRtUHhlNUZxYWJ1K21ha2ppaXAw?=
 =?utf-8?B?VlREUjZmU2p6SUVZajErbnl4TlNBdDhNQTVtNEFZeE05aCtpR3FsRkpaSmFP?=
 =?utf-8?B?VUpWb1haR2liMmsrdXY3amFSUnFjNFdHRnhBY1VGQk15NjF5VEZHWEduSWRM?=
 =?utf-8?B?bjFudEVrVmtrUXd3MlVBdEpVWTVoZElpbkJoS1NVd0NJQ2VsaUlidnhCM2Ev?=
 =?utf-8?B?UU4rWUJ4dVFrVlluQk14Z1dVa21Days0eFNJMmpyUElMS3I3NzczTHR2bEdn?=
 =?utf-8?B?WER0VjVOWUlUUkUyY0tIVVdBTExZOGxVTUs0VGM4SzBvcHZQcGZQSjZEME9L?=
 =?utf-8?B?aXZDVyszaks2SGtEbnhBSm14V1NYQldSaHp0WGFNRStpZGRvWEhDYnQ0dFI0?=
 =?utf-8?B?OXdHK0RNT0dyZUR1WkVXVUFCUWdIWkExVkdSRWdHWXMrV0lnQllpZWZQK1Rn?=
 =?utf-8?B?Y3FCMFc2RWdQUEVZT1JEeWE0Rk9MTmdFMTh2OUtyeUhIMUZZRDMxYjV1NTNn?=
 =?utf-8?Q?nepmAfCU93ruRGvgLDBVPNWkeHY48w4g0XyJ586?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4d264f-309e-488a-9866-08d8d8ece588
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 17:52:04.9120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6KAMQwcxO8cx4npAkUUY+y3yIG3BxzGK5L0VoX501Pec1/8IZxMSRHDrbhCPYmurVucn2fAIIr92sVQdSQ6gY75lEqid+13iqHlcd27grA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3283
Received-SPF: pass client-ip=40.107.1.110;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

On 24.02.2021 20:01, David Hildenbrand wrote:
> On 24.02.21 17:56, Andrey Gruzdev wrote:
>> On 22.02.2021 21:11, David Hildenbrand wrote:
>>> On 22.02.21 18:54, Peter Xu wrote:
>>>> On Mon, Feb 22, 2021 at 06:33:27PM +0100, David Hildenbrand wrote:
>>>>> On 22.02.21 18:29, Peter Xu wrote:
>>>>>> On Sat, Feb 20, 2021 at 02:59:42AM -0500, David Hildenbrand wrote:
>>>>>>> Live snapshotting ends up reading all guest memory (dirty bitmap
>>>>>>> starts with all 1s), which is not what we want for virtio-mem - we
>>>>>>> don’t want to read and migrate memory that has been discarded and
>>>>>>> has no stable content.
>>>>>>>
>>>>>>> For ordinary migration we use the guest page hint API to clear
>>>>>>> bits in the dirty bitmap after dirty bitmap sync. Well, if we
>>>>>>> don‘t do bitmap syncs we‘ll never clear any dirty bits. That‘s the
>>>>>>> problem.
>>>>>>
>>>>>> Using dirty bitmap for that information is less efficient, becase 
>>>>>> it's
>>>>>> definitely a larger granularity information than PAGE_SIZE. If the
>>>>>> disgarded
>>>>>> ranges are always continuous and at the end of a memory region, we
>>>>>> should have
>>>>>> some parameter in the ramblock showing that where we got shrinked
>>>>>> then we don't
>>>>>> check dirty bitmap at all, rather than always assuming used_length
>>>>>> is the one.
>>>>>
>>>>> They are randomly scattered across the whole RAMBlock.
>>>>> Shrinking/growing
>>>>> will be done to some degree in the future (but it won't get rid of the
>>>>> general sparse layout we can produce).
>>>>
>>>> OK. Btw I think currently live snapshot should still be reading dirty
>>>> bitmap,
>>>> so maybe it's still fine.  It's just that it's still not very clear
>>>> to hide
>>>> virtio-mem information into dirty bitmap, imho, since that's not how we
>>>> interpret dirty bitmap - which is only for the sake of tracking page
>>>> changes.
>>>
>>> Well, currently it is "what do we have to migrate".
>>>
>> Using dirty bitmap can prohibit unexpected (overwritten) content of
>> pre-discarded pages, but they'll appear as zeroed on destination.
>
> To be precise, they'll usually appear as discarded (no pages in the 
> migration stream).

I just mean the retained content of the page after population - zeroes.

>
>> What about other virtio-baloon features like HW_POISON when poisoned
>> pages should also be retained on population filled with certain pattern?
>
> In case of free page reporting, we skip discarding if poisoning is set 
> to != 0 because of that reason:
>
> if (virtio_balloon_inhibited() || dev->poison_val) {
>     goto skip_element;
> }
>
Got it, thanks.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


