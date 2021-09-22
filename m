Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EFE41431E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:59:33 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSxAC-0006bx-93
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSx3N-0006dN-6p; Wed, 22 Sep 2021 03:52:30 -0400
Received: from mail-eopbgr00096.outbound.protection.outlook.com
 ([40.107.0.96]:34673 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSx3L-0000OQ-Ja; Wed, 22 Sep 2021 03:52:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkDKKTs5PArAo2W8gaQ65PqwiJnjrqqRgd6ati5W+RxJkIDYumkjIWmdjwOkGr9wx5xzuMPJOIQwzuG7EvtycS9A2n1X39HqeLByDGnwoRY7RmWUKwunmhnRkQSoq08D+XqALfIh7cML/Nl2WJl7EomjzVvspMr5ZaBAJDvgjQZM2EHPxotL4aKgFvlEPLdlRdJVkMhlKWgT7OruYJptaL5B+AoiqIxgmi+0wuXJIYT0c+wbQL+JvA2E95hXAazJ7/NpFV7NEI7R4WxqmR9gkMxjEwxLxUD1CDxmH6zt/1azO7QUt0cje6UE5wShjIxb9mP2ReBjIQoZWbuIMtabmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zTnjkPVJxUWRHYW0rhjWFWBtlXPVP56jwdd8D+QILWM=;
 b=IUBbC9fa5YcZK55U66m1EhB/MDvjj243e1LvaV4hlNiMMMslFumaayvmMJGMbJKRwJIhaidfwA9yvmxcaZb9uSfXi2bBts5wOrf1uPHGRCNDQWtpbJ0csmH/urHtgsV3DiEfqjA4evId7i+kLYQ6cGEfG6h2yHj9ZkJcl0d0ycHxr8oWehuKkJiYuZ3jbM4p7UAXzgXnO5whAxSvl2nIUrWmjH0tV3+XOhL5jPM6f/3YifY5n2vNfZptR0RbWnmCMUtIxEdTqNgd/ClKE6AvFfhnO2bsD9haZRUcrHXJgjJMEp34pcxMS4SKNb3bUuij2yQbBInTG2scVHtMZyEPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTnjkPVJxUWRHYW0rhjWFWBtlXPVP56jwdd8D+QILWM=;
 b=psAJgjeuhyYAtujsxfd23kTOj8f2BnMYsR8560LXpGWT5pFwLSvmS2rGjDNKr0GRK+udTpM1jeGSQafseStCQ7bLPoIi40YFKW530U3pFp06Nymw/dnSOFOSeJr9mmNCkd4OC/sUrc65m/kA7ouFBNxCbPVNQFUuPnDoJXCrh5o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 07:52:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:52:23 +0000
Subject: Re: [PATCH v6 00/11] 64bit block-layer: part II
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 jsnow@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 pavel.dovgaluk@ispras.ru, ari@tuxera.com, hreitz@redhat.com, kwolf@redhat.com
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9029492b-5b9c-2697-8d87-716859f96382@virtuozzo.com>
Date: Wed, 22 Sep 2021 10:52:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:52:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7f0893-eadb-4bc5-8828-08d97d9de9d5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-Microsoft-Antispam-PRVS: <AM6PR08MB371713C077CD23577D933860C1A29@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCOPoHXrekJIAc9e3XxDOBzH8ohCEdD/4VRgEosYFJ7XoEGpirDHwFm1g/tyxdXuYIOdGsYRsRj+zWrF7r6twr3hwTOC3Vuxu0+y0W89SHZcU3XWWxNW50k4XXs6wjLU/fHA6CbIF3IC5/75s+V4f/PJVPixTk28n1BGlRNGkWi7As+KGlbo4RIIRlFq3etD8I0X6EapTnqPt0Naop23pS9ARBcDmsAIDnaAjqRwl0M1FtKJ1G/LHJSQfahNSx1Ds/UHr2Vv7rtOwBA2T6qbHxgP7kPXCdrECmmQEVpfsEp5BIf3tJ2nv9W9Dgh3EwYnB7D0VP7VqhcSfsLw7+F3guph8P84bQeVvu6SBSZAkDg4PSihZIWYFtiokKcLysO8zV8yf5bkh+5896GrZMzrbxFEgec7t9b7EWUKBBYTPj4NqXbwzCU7FU9JAq6QZhtZVCsnoeoIg5XLfT6aGkVKpP7pdBK5pnuYPG4UgvYlPoySn6HRxbXsP7t52I1ustQNP1sqE6eTzrxXEqwflB3syiX13ChZ/qsny8aqzSTBNBIFefl37tKb/CLdmnPISNYcyLLdPzCwOPKvt0gX1Sx41kKLlb6pMW/7WTl7EgLE0cI2JRaswpgn2JWGDe5+sxW767+2xnxPWAXgLhznpPqMr+aVM3PKzK5PvlOkdHXZRr2rYBil55xHUmmV0Wa4bUXiz1NH5gLBucpQHiFH7dvT6kk75cL8cpSZBosPZUf0h6vi+HzQlP70wPno3rMQKotmNNfaNE9kIxX8PyAFXL1eOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(16576012)(66946007)(86362001)(7416002)(38350700002)(2906002)(26005)(52116002)(186003)(8936002)(66556008)(8676002)(66476007)(316002)(6486002)(38100700002)(5660300002)(36756003)(4326008)(31686004)(83380400001)(6916009)(2616005)(508600001)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R200Y1dNQkZFWkQ0WVVYbTREOXk1VmNJK2p3ak80NENhNzFLeWQ4WGQ1UlNa?=
 =?utf-8?B?TFBGUWlYN3dmOWZxNFgvTWxldzN5QXRTSFpzM0JEVVpadElyaHVoTjc5U09R?=
 =?utf-8?B?KzNRVWRGclUvRjNzVkM4VXlCWkgycklUMVdVN2p3ZVhjSFZuaXZpc0Z0eDl3?=
 =?utf-8?B?TWdjR08zVlVLZStJbER1R05lZExNV3dCU1MxSWVKVGlUalFFNTJqOVFYdkR3?=
 =?utf-8?B?N0RJcVRqZndaZ2hwcmlxR05veHFHNTdXd3JOckFyQ2RNcTI4Z3JkMXZJQ0Jy?=
 =?utf-8?B?aGk5eDJ4T2tWMjB3QnI4ZHVkdVBTU3hTekFTVm50VmZJZzRJeU95bzNCbWxC?=
 =?utf-8?B?M0hwcGpXdDNkbVJwdUxITy9KWngzb0owdzAvaGk2UWkvSGlEMVFjNEdxNExJ?=
 =?utf-8?B?dVJNWWFad1BwL0xyU0luODZwY2dnSTRkaEswbHhBUmpzL0pud1Y1VWt1VUdU?=
 =?utf-8?B?REVEQ2ZMeVl4WmxubkUvZmg1b2JOU24zYjNZOFB2ZzNxSW8zV3k2eDR2RHlO?=
 =?utf-8?B?ak9Jck5uVmFYS3Q1RmQzZU1zL2FxU25HNE5LSVFrQlVEVzVoRVl4MWcrSk9a?=
 =?utf-8?B?dVBmZWpJMUVta0licmVyb29la2pIZi9nUUZqc1h2RGpTdDBuK0dZL2c0eFRl?=
 =?utf-8?B?b0F4UW50Z3MwMmdUckhtakE5VlBHVHN5RlBVU3JLSXExTHFJc3AxMExQTTZh?=
 =?utf-8?B?K0s0VUR4NWx1QW55bENjazczUmpoRkVTOFprYWsrSXNKV28rQnh3MzdOeDJ2?=
 =?utf-8?B?WjBpeEFNTzN0Z1JLMFRFOXF2MlRCSnRZOG82c2g2NmsrRGJzNHRrc0VhTHNJ?=
 =?utf-8?B?elJDVFFGOU5KazZJcEZvSE1PQmVsK05hcE9seXRpR0NzL3hrMHRxbVlXWEUv?=
 =?utf-8?B?NGFGM3ZhcDBnSHd4QW9vZmV5VVNNUG5LSS9MWUdPalBMY3RiWnN1ZnJielA5?=
 =?utf-8?B?L0c4b1Y4VjgrdUdoWUw4eG51eXJkNVoxaXdWZllTWnJqQW5KNHlaUTh5UERo?=
 =?utf-8?B?dzhwbndjQ1VBVHNZTTA3ais3aXlkYkNsb08zUmJULysyUlVkUEdSNFZob1Fu?=
 =?utf-8?B?c2l6UkpZZHZmMHgrQmJoWVFURW44b0RsTlN3WmRaL1VqMW4rdmhLMWhQeFh4?=
 =?utf-8?B?RTYrdURaOVFLUkMwTFg5SnJndlp6OEljSUE4T283Z1pROXArT0oyam1vMzlp?=
 =?utf-8?B?dGY4RWV4S002RGxhMHEvS0F1U2x0SCtUemFyczVNM3dmSm1uOGFTa3hrcklZ?=
 =?utf-8?B?RDhDSmJZei92emNJU2p6ek5TZS9OQ3ovSk5STjJQN1puTTFxNDdtYmluTlUx?=
 =?utf-8?B?S1RveFo0bkZaVWJ6YXA5b2l6OGYrTHdOcmtnRHpDTmRmSWlIMHRVQlhjbDV0?=
 =?utf-8?B?WWpvM2tBVXN0UVA1SkRCSFpQb2V2S0FQN0k1VWZEcS9zTlMwR0t0UEhlaEQv?=
 =?utf-8?B?YW5idTJzMU9hQUdtcUdOa0NQNmphbGFpNzErN3VOZHBFSkVwM3RCQ2YyOWlF?=
 =?utf-8?B?UmlyVHJSVlBSQjRWZ3V4MWNWbGlqVmVXdzZBbFBhNktoaVY3WWw1aEJRNVJK?=
 =?utf-8?B?Z04vY2MyYWlZdDdRb0dqeEdBNnFienk2bkZaeWZDSFJMeDNVdnJoUnhsWEVs?=
 =?utf-8?B?QU05eHB4bU1mWjhNUWdpaXRmY1VieFlMRHl5dVphQ2tsWFZIYmxMSjZVL0l0?=
 =?utf-8?B?d2NxNCtiMmhhMCtRMnhMVHVKOW1wNEFMTW9tejg2ZGptbE5ybVBLUStZWTBz?=
 =?utf-8?Q?ghiF7By9mANV6jtyav7PYDrV0ZeCfSDpAHmPetH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7f0893-eadb-4bc5-8828-08d97d9de9d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:52:23.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joOTskRfXiyqvyoeuteCmOxZZ2JHPz5vseUOPoGugfLCL2pv6hy+JslUDscGGgQiQ7x+lNKuiWBc8YUHNgQxChCG+f8XjIm22cyAFjbgt04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.0.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Ping)

Not reviewed: 6,7,10

03.09.2021 13:27, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Sorry for a long delay:(  Finally, here is v6.
> 
> v6: rebase on new rbd handlers and backup-top renamed to copy-before-write. Also:
> 
> 01: add Eric's r-b
>      tweak commit msg to not mention sheepdog
> 02: add Eric's r-b
> 03: tweak commit msg
>      drop extra type conversion in raw_co_pwrite_zeroes
> 
> 04: vvfat: no write_target_commit() anymore
>      nvme: fix over-80 line
>      type conversion in raw_co_pwrite_zeroes() now dropped in 03
> 
> 05: tweak commit msg
>      add Eric's r-b
> 
> 06: update comment
> 
> 07: tweak commit msg, grammar and typos in comments
>      don't add extra empty line
>      handle also qemu_rbd_co_pwrite_zeroes
> 
> 08: tweak commit msg, add Eric's r-b
> 09: tweak commit msg, add Eric's r-b
> 10: add rbd, drop sheepdog
>      add assertion to iscsi_co_pdiscard()
> 11: tweak commit msg, add Eric's r-b
> 
> Vladimir Sementsov-Ogievskiy (11):
>    block/io: bring request check to bdrv_co_(read,write)v_vmstate
>    qcow2: check request on vmstate save/load path
>    block: use int64_t instead of uint64_t in driver read handlers
>    block: use int64_t instead of uint64_t in driver write handlers
>    block: use int64_t instead of uint64_t in copy_range driver handlers
>    block: make BlockLimits::max_pwrite_zeroes 64bit
>    block: use int64_t instead of int in driver write_zeroes handlers
>    block/io: allow 64bit write-zeroes requests
>    block: make BlockLimits::max_pdiscard 64bit
>    block: use int64_t instead of int in driver discard handlers
>    block/io: allow 64bit discard requests


-- 
Best regards,
Vladimir

