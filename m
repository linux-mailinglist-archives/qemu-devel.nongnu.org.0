Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FF14266B3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 11:24:13 +0200 (CEST)
Received: from localhost ([::1]:32996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYm6u-0006Pj-L0
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYm5V-0005Yn-TR; Fri, 08 Oct 2021 05:22:47 -0400
Received: from mail-eopbgr30094.outbound.protection.outlook.com
 ([40.107.3.94]:48634 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYm5S-0000yP-2b; Fri, 08 Oct 2021 05:22:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP+EmXCcZ2ogVc1Axnm7ynK4z4V19Z6AN+Vpiyodi1VtElcX2T5ltbV8cbNDViKjSc48sWFs/pWhv8KPlX5KzX2YqbS5JkksbsU2AN4wgHy5NXFWtxxHH8WDMHTC52soMDQdnCSavNP83XWs7BzCL/TSyvbTyb0Rnerei+yhERypVoA2mSJrD0W9P24iX1PbGRac8sz52nu/6HSih5o63ywAmakpcT55Sh48gfztkzLwt4dk46XtOeo7D9H4DD0WaMqSu1+JaobVTtK0cwrC7sR6H5TJWsW/2oIOOySZ1thfaQw9Lj17u7P0IHyT0c0OqaXjgVZvCRYdxl0RbKpv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ/2z0Ogghle3uyJBnNEFvxEIVN+3C+wUek+rvqLhUE=;
 b=ErBRlLg+GKcKioABtap6BAVcEP5sY4F+wuHi/ELMlQQPEJhl7mkry99XsIrwiTX4+wU8ojyLAwed5M2n23cA6rGvXu2H6LDbvMep2XhDqprR5s18eMLdCUL/BB8oV5tTF6ZQEiwnCWWnFX0psfeblyeZ3W5XO+rovhZa708zwYZuH66Ymy8GRPhUqVeLf+4LRr4HCtQGHXibVqbeemZd58K75cjSObEHJ/8jcNlY/focsHo2hXU8dTts4ICFWU8t4d0jHy9R3Fgx2YOPMeVOPGyjeUb1VsbRDwCZ/u90DDM/P82+hTLRpsHrcwXCTa5fFpzY2OC/agRJYIIikYYMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ/2z0Ogghle3uyJBnNEFvxEIVN+3C+wUek+rvqLhUE=;
 b=jL3sxEmSEwmyUuxVQl3xBfPv+OkNdVtXbJK8KttDFd8DLCwmS9qoODkFhy2rvkr1jBE8GjveAAaHOIztLAx0nEAA43bEZyH2yXKEAWStmuh7YebfSasoK5p0zixHh2VaC1VdZQ7jsyjpVbKvtTdkVjtKHD4g4g9nQWCTcJDIFz0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3288.eurprd08.prod.outlook.com (2603:10a6:209:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 09:22:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 09:22:36 +0000
Message-ID: <1113744e-8a63-13f7-46bf-750412766562@virtuozzo.com>
Date: Fri, 8 Oct 2021 12:22:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 00/17] iotests: support zstd
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, jsnow@redhat.com
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <b0fb7a33-c273-33e2-fc80-d5488fbce877@redhat.com>
 <4d839852-8939-0536-55d3-12c2e6503f33@virtuozzo.com>
 <6c65e7f0-482c-1a85-3146-82f3d2314e8f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <6c65e7f0-482c-1a85-3146-82f3d2314e8f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0301CA0006.eurprd03.prod.outlook.com
 (2603:10a6:206:14::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.207) by
 AM5PR0301CA0006.eurprd03.prod.outlook.com (2603:10a6:206:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Fri, 8 Oct 2021 09:22:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6de467f3-9505-42ae-9ac5-08d98a3d2a81
X-MS-TrafficTypeDiagnostic: AM6PR08MB3288:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32883A2183E2C52674852098C1B29@AM6PR08MB3288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPQd1Dt6V6GvfYRmJSXCExMNxSvQpTlR+NfFq7tHCbaA4VPAc8FYOY24GYnwyfr3EaWKTADgUrrpgfIy2JU/AH2w7xXpYavZmG9aw6WSXNsdqD+FAz2R2WuFXtH+uwOueuzq6ei8a6774eRkG+q7so+KyQzBh9Ak2mkipXE4/ES7v/c1i2Y1BIcGQkniN1/KByFu44tHGgodOroMODDOzJ30mjv+k/NK+n+zCXj3YgeDCvDMKVbYL40BuL66rv+Mo2R/mDu4dsOyxbelRJCAcQhT2a7Z2/L0WHEwpo2zcBD/2bC3I4dmPw1Hfd4gNgfg3jnK0qkuBvqPU5JXlcU+QFyTb70S7pZISGF/mlzFf3E0qJMcahIaiClZWTe+qWfkGJN1bEsmPg2Ru/dDHXSKSLuz73Nu3Et26TKDQOCU6WgZOWrL0sRPpwpQkEW3NI+Y0ucvQRvMmlKS0vFBHcCoLlTyUqII1BWouxt8i1MXzyU+yeLTfK0DYOhbbj6ahPFXRMSMh5MBqghVptRQDYGlaZfWCLjwwRitcs9PLtqSqbb0rSIxRGwpJTxgOo5C6y6Famr6eKN0EEfYVPAlbijPF/ot3KQGloYJgMx5oV3qXDL8MRsOaoWIT7wGyULEh3kFsUmPmBZld0zLep4FgI7AoT6SMSCX/twnv1hmy1VCilbFajAUQL0XPAHeGdDVDvRViO/wqwfg5VqDudsEJj/6n6jQk4puhT3NAhnVM04OlHpKORBwOfJzc3gXO1ThdcCLI7oP0aAFdULo00i/9JJm7efRh6Ti+czDosqdZq+n0V02RComX2e0fpqdl2ohDd8y85feLuOLCnc+LeHI5nt5t+4gKzWmILp8jwbuKugUkeaZjN1ZfG/ZqKZhNds/VmP5UmyJLdd4XdolW9KFvjZtuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(966005)(86362001)(83380400001)(38100700002)(31686004)(8936002)(38350700002)(508600001)(956004)(31696002)(316002)(53546011)(16576012)(186003)(36756003)(4326008)(2906002)(66946007)(66476007)(66556008)(5660300002)(2616005)(6486002)(26005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXhLS2QwMk9GMDZ0MG16ZFhvTTBBZXFKUXNhN0NZTDZoSW5iZ0E4RlUvK0Ix?=
 =?utf-8?B?SHhSd2hXeXRtYUpkMEJER0VCS1E1ci9FR0ZsOVkvSVBwOW1yN3M5bkFRcm5Q?=
 =?utf-8?B?MktNNnVBUVJpaGFNeDc3SS8wMEtMREJ3azdDQTc5Y0cwb3dwdEIyTGZLb0dV?=
 =?utf-8?B?Y3g0V1BBdTh1QitSclB2aHd3TEZDU3VpSTFQLzZrMzF1akcrR0R0Q2ZUM2I4?=
 =?utf-8?B?NGhkTUFrbVpWak9sNXBFTHIxSmpqb09IbkV0RzdZNW02ajNOeFVGTkdIbzVz?=
 =?utf-8?B?cyt1UVRRVWd4dTRMbWRIWnljRXJBU1lINk5HTG9TVnYyTXdIRmY4RzBGeVZY?=
 =?utf-8?B?b2IzcFpyYTBVT09MY3AwR01HZEErTnd5NjdhUlVOUFd5L2JNeUtFOGNtRmp5?=
 =?utf-8?B?cGMreDVpSnJYZW5DZjYwRjVUMGY4M0VwdEJKZlBnZ2NMSElQaVBubnVqUytj?=
 =?utf-8?B?bVBDNVlESkYxWEpLNDU4bU1TVEkzTXFnYVkrKzRhT3JHVUxDVGRuRDgxQmZW?=
 =?utf-8?B?U3lqdzY0YWYxckZPRTlHODk5R0IrQjh0VlQ5dzF2cjI1c29UR3Z5UmVHd01K?=
 =?utf-8?B?aWJGMldRc3JUK25uV3pmWlBzZzI4OUpEczZMTis0L1RKcExhdlVmcnlNaXAv?=
 =?utf-8?B?WnVwR2FvUGlENXcwRmVXUWdxMmRlSmhPUDF0KzVIbFlyUzBsc2hrQjdjN0h1?=
 =?utf-8?B?VUlWdmd2VUZiUk91K0lPcHJVNm9TT2hkZTBocnIzTjJMRENLN3pZOUEzbG91?=
 =?utf-8?B?VWFpdzVxYzJOaEYraUE0MGNNeGpyS1lHYUI1bld6ZGdIaXJZVmswVEJjVzVE?=
 =?utf-8?B?cFdvLzRxamJNNHFqQ0swdk90aTFlYUVCSE11WGd2S2FhcGo4MUpkdTRFNnk0?=
 =?utf-8?B?UVdjek54WEp3YmJ0SlBFaGdEeng2QnlYT1FKdTR0RjZjaEFlQXJ1SFc1a0s3?=
 =?utf-8?B?RFF5NitwWHpzeS9kTGhrUURQUXUzQVpIY2ZRdkVRejdPYVhJZmp1eDRhdXpY?=
 =?utf-8?B?NVpLN25BOGNDM0RSM2VzZEw1KzVHY2JIMVQzM2xubWViUS9YNnJTbjJ6NWJJ?=
 =?utf-8?B?bG5JU2VEU2dwNzQ3aGJmVlo1ang2WDQvNit2QUlwKzRhVXF0eG9QR0tQK2JD?=
 =?utf-8?B?anhPWnhsR1ExMFRxcnZWRmQxemtUMG12U25BM2wveUd3SFJ0d3ZaUzFsZHMw?=
 =?utf-8?B?VWNUUDJFY2M1RkdpWGpzdG9rQ3pNcVhySHlxRExxbDBhOG4rOCt3OUZuMkNQ?=
 =?utf-8?B?TU9pSFlXOUJZYTdKNHRJZGZ5SXJGaXJuT3B0WFg4RExZZ0loMWVndVV3NVls?=
 =?utf-8?B?UzVhMnIxSlF3QVE1L1V3cG50WFRxcHlHQU9pYlRXRW1WdjdKREs4TW9JaEFY?=
 =?utf-8?B?QmR5U01oZktMTlZaUlB1ck95aEk2SzVkV1hPTXhxN1E2K25KOGs0ZkZCZTJN?=
 =?utf-8?B?ZDR2dlIwOG5RN2FOV0JnUU1VdER5SHFUUTVOeVdKcUNHd1JzL1dJc3FaRXZF?=
 =?utf-8?B?dFlwdXZQRVpJN25rTUUwVmRpZGV1b3Q3ZlhEVDZvTHNSTEFIeWVkRUE2RSt1?=
 =?utf-8?B?WlcrWTVYK01SV2w1ZUZxNk1oSGdhamliRFFNcWJSRjhQK0dzSHRRN2R2Y01n?=
 =?utf-8?B?aStKNC9GNElpZFF2L0w3Y2hXY0FVMFBTOVAyVERWT0ZPWXQ0amMyWWpjRjR0?=
 =?utf-8?B?Q3VHQnA5S3NwY3FMMW9HM3Bjbzl1S2RrNTUyNTNFY2s1R0ZiSmVMVXVtRU1Q?=
 =?utf-8?Q?yk4TrJ1mY9DeEuA7cZvuaX2MRdqTVfQM5nX5yB/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de467f3-9505-42ae-9ac5-08d98a3d2a81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:22:36.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouo7dqki6TD9i/YZEsRUxUaG8iABg4IcMcf3RkazPMdWDZxvw5qEZBolXA6UUs8LoN+XVgsFB4w8ALh0og0I+oL2BJxO6aYzMo4MIfNA3Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3288
Received-SPF: pass client-ip=40.107.3.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_NONE=-0.0001,
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

10/8/21 09:39, Hanna Reitz wrote:
> On 07.10.21 18:29, Vladimir Sementsov-Ogievskiy wrote:
>> 9/14/21 20:08, Hanna Reitz wrote:
>>> On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>>> These series makes tests pass with
>>>>
>>>>     IMGOPTS='compression_type=zstd'
>>>>
>>>> Also, python iotests start to support IMGOPTS (they didn't before).
>>>>
>>>> v3:
>>>> 02-04,06,08,14,17: add Hanna's r-b
>>>> 07  iotests.py: filter out successful output of qemu-img create
>>>>        fix subject
>>>>        handle 149, 237 and 296 iotests
>>>>           (note, 149 is handled intuitively, as it fails :(
>>>
>>> It was also reviewed intuitively. :)
>>>
>>> Thanks, applied to my block branch:
>>>
>>> https://github.com/XanClic/qemu/commits/block
>>>
>>
>> Hmm, patches are not here neither in master. Aren't they missed somehow?
> 
> Yes, I had to remove them because they broke other test configurations (like `-o refcount_bits=1`): https://lists.nongnu.org/archive/html/qemu-block/2021-09/msg00692.html
> 

Ah, yes, right, sorry. I forget and somehow lost these emails from my thunderberd.


-- 
Best regards,
Vladimir

