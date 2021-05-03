Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7B371497
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:53:54 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX97-0001n2-8k
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldX6t-0008Gn-Af; Mon, 03 May 2021 07:51:35 -0400
Received: from mail-eopbgr140121.outbound.protection.outlook.com
 ([40.107.14.121]:25409 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldX6r-0001E6-0C; Mon, 03 May 2021 07:51:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTH81x1Cp+Vzcqh09kZBSIySDUL5X0Mnzb9ptGlWfAv4bddDPCzpbGE22OEsV9+c4VF2zwMOere3OdwgScvRlPZwWAj1zzcVOQ8/UsSIupXbpXmq+J41+M8/pGexG3xDGKnXnTeEP/DQ0nzAnsitBfwS6/GX+Ck9XtAW2jAA2xyxNOA3ROY0Ydw4Kl7BlqWgNpmRboP0zxecUo4c/jB8CBcSjgVc5KT9MpYMwtpssbeQUm4WoFSRw+ziDd0USl2RYBua9P9zus4HWNX5eEDaMwSatTz7nn38y914DiWRiNriusyOvHzfsQa9TnYg/Bg0zX/VCCgW7V0tbR4xTUA97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeEtg8InYdpHkKWFgKNkd8UA7l0mkfIy1aHLBiWTJfg=;
 b=VPNu7WWhiJlyv8pLr0nCA0s1GJCH2uRD6dv0+VRYBHnLOg6lKEWwHn2Qjz4yAvU14a37YoT6BWlKkd4TZSBSvGIA6syVM/eueeMDkhoiZrO9Fp7xRtnJkXb1i5s8HPHitTKN/wvBDbjl3r+VDH4X8+TqlcsqVziN3adwaxnmhhP6g6DIkp0oulrtZtOqXcd/csXsiMS4jrYcN/f/Gb8q7ZZRQu7QXvmLm2adBTv52/a40kiF+mQdzKNuMXuRBDcohcAA4byeNHUZyz6c19EFYpSGKiGEdmF/4/j7kEJXA2EDQz61lR13j9ZVcEvZ8OHqH3oIWJ8Of4q5eBnwU5txlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeEtg8InYdpHkKWFgKNkd8UA7l0mkfIy1aHLBiWTJfg=;
 b=SsKO7McY0Jz7HrpGa47XY8Lof/6aFgj5wf6L7anXxdCWnP308fTApUVnPO/lRdoU/7qKJLj72282olcAcuWJzRKDtVpgiY/63BKdHY6eUY00HA1OfLcf1da1y651su4CbFOOlzf4A5+l1Jzg3o24znbXBQvGYwCn67ISXfV7Qb8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Mon, 3 May
 2021 11:51:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:51:30 +0000
Subject: Re: [PATCH 1/2] block: Fix Transaction leak in
 bdrv_root_attach_child()
To: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-2-kwolf@redhat.com>
 <9e23f679-84ac-9d1a-09dc-4894cd9d6979@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cdef7d37-1d8c-85c3-de0e-0730949bda92@virtuozzo.com>
Date: Mon, 3 May 2021 14:51:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <9e23f679-84ac-9d1a-09dc-4894cd9d6979@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: AM3PR07CA0108.eurprd07.prod.outlook.com
 (2603:10a6:207:7::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 AM3PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:207:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.10 via Frontend Transport; Mon, 3 May 2021 11:51:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b812748-ac4f-4d31-609d-08d90e29ca48
X-MS-TrafficTypeDiagnostic: AS8PR08MB6504:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6504CA5E42D7FEB9B09BD7AEC15B9@AS8PR08MB6504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3eppVylRTxnKnfodkqA0O99Pf87j2UUZFAj+LrbeNMQCaaP50JLBzYR7/6+VcXHo9Uj23JmNlF2rEqSikA3TKToHh+fvmhnNCNi7i1s7IERpBjLnfAyyrx3yCTLqyGGvDzFSL8WlUk0blMMYqFmizLSgjmQsWtZXbEIOrJw3r1lkJ0/3ZHlYwNsI8QjZiCFJJMYTafjkNFxXeDcjUzaz4LNkJW+gQDKbtpxGH3rVO/T824HjMQlOJSDq31m/lIQzh48ZhQ/NLqabF/D2VPkGFR9rzPYHc0AqsVSkUcPDYYpV1vGCMYdzXGgp1t51T6sonRfP9qOqD8IU+q+qT0ECCN9kSJQR6akH/xlVxXl6DS+td1fSpkQITBtQmYQ8u5x7cRwgDWwxiBhf/3r/M5Tr+aSAJReErTJzzN6XkOcS/gBfL7coJZYHLi4G2uVDG3a6/IBI/EPj8DXtJaNIIiqHASL1+BM4Qhj/mHUja+AFeExj894d0wlyr6bE0xryDc8xffJsHgm5TRZBxt4+B8+bRZAM0LjQ4ruBLCss+at1NQk93jQ++DA5OdlUA2N272o2RngPgUQhKWjQVIJS835EGnr2r36JAuNUX/OKQbe2rm4s3RYsqjM+05UDbVssAc0j1Gol0tjHlTSj7QGjx2PstSFUIqUEGQaMgWL92hzYVc0AQmREcLFHCMj4EJ8duzLTorUcEzpUtDkhtvgnHHbCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39830400003)(346002)(366004)(376002)(31686004)(66946007)(110136005)(956004)(2616005)(38350700002)(66476007)(186003)(16526019)(38100700002)(6486002)(26005)(478600001)(316002)(16576012)(36756003)(86362001)(53546011)(8676002)(8936002)(52116002)(31696002)(83380400001)(4326008)(5660300002)(2906002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHFLQlFldWc3QU5YUy9TZUdabFF3ek0xTmsrYTZVWjBJa3pSK0pldVF3UkFa?=
 =?utf-8?B?dWNFcE5DTTUrbmpzd0c1dmFPWDVNdFd5VEtCcld1WGM0bEJYK056emk0T0F4?=
 =?utf-8?B?d2pTajdOUkw5QW1zMGgzUit0QUZ5VHlVWk11Zmw1a2J2dXhmWHR1K2YrZHF6?=
 =?utf-8?B?ZWp1N1hlOVd1MnQybXJMRWhyWlRSNHhJeWdZcHh5R2ZoNFhQTEJjb3JjZmc3?=
 =?utf-8?B?dEtFZXZOb0JzN1lRNUtxOGV3T1R0RCs5eFg0aVRCMThEaVZUcUNjcEZIU3p4?=
 =?utf-8?B?VzlKSGNPUjgybkNCMStML21ReVFvaG1FKzJKNUsxRlEwZHpETzhlOURkWk5x?=
 =?utf-8?B?RGFsN0ZEVTFPWStUV0NlanNOSGIwYXVhanhFNjVBN2RBS0V1TTcwRnR3QUh3?=
 =?utf-8?B?Q0VtY1pOVkIyOHIrcmgzb2ZQdVFWZS9XbHdyV0lLelpPbk9mdEx2U0M5cXln?=
 =?utf-8?B?UEdNMXJXVGNoeFcwM0xZMTJVTC9UcUVvMG93ZnpTK0FSYTFlMjhZRlVyL1Br?=
 =?utf-8?B?NEhIOHY5aDB2aW93UytIb29QMFEzbm9EQVkvV0F3eFBmTWhqYmV4SG4yOUdq?=
 =?utf-8?B?Tmh0alp2V05IZXhEZVNJcnphTjd1enZ2VXdQVW9NRERaenBwZHNyZk5ralp5?=
 =?utf-8?B?UVVDV01JS0F0cUxCNGl1R3g3dTdVL0FhdXV2MUc0ZGY0cWZ6WkdKSk1EZHRC?=
 =?utf-8?B?d0tiY1E5b1hoaXNpQXVWKzdGQThDUHdlelVKeGd4eGVVNHgwUVIvbURYa1k1?=
 =?utf-8?B?YXZ5SUtXRzYrb2g2U2NWdTZaWkl3Q2I0WEdVQlB0OFIyOENxM1g1WEZyRFlM?=
 =?utf-8?B?YXh3TERKaDF4SUNxUUJTNGl6eFBxay92M2prZGcwQ1lGenlJeE94YWovYXN4?=
 =?utf-8?B?eWVHT1REc2R3QldDV1lqV3RZOFZrc1I3TS9nZXhGd2dJSVpWWkx2d3B0Z2tr?=
 =?utf-8?B?QitLWS9pRUd3eGlDamdDZUVsTVkrRzVIRzBrc1lndUJobmhQR1ZTOTBPdFg3?=
 =?utf-8?B?d3ErSnMwN1JTVFNESko3d0dJZktMTVRqaSt1bEx4U2FReXJrWXVlM1RFUyto?=
 =?utf-8?B?dUVqVXVCNGFJYTJTakx1bC8xYUZXQkZVVDJOTldyb2Z5Ty92N05yZkVuZFJX?=
 =?utf-8?B?Y1IxMlZRd3BDVDVmTkMxbnZLT1ZJM3Judy9qOGFHNlZKbHdrdWxzRFFFOEtY?=
 =?utf-8?B?amRBbThDaDRmOTBPYy9hUGRpb0dCYWgxVXN2cE9HSGNWNkJveWl2UzE1QS8z?=
 =?utf-8?B?S0pLdWpXSk1haVpianQ2bHYzOG9rYnlWbnN2aDZ5SXR3a1JuOVZ2WS9lUGxa?=
 =?utf-8?B?WU9xMDNXdWZQVnBMWWorYXNtbStLZittM2k5K3FSbWNNcjhEL3ZSUko3NUhH?=
 =?utf-8?B?NEh4VFBQUUJRM0RHY3pDQVJQZmtaR21xb0pJQmNGWFYvTGJJZWp6cUlzRlo2?=
 =?utf-8?B?aTl2Y05sZXhITEtESHNNc0tPTnlEWVhWbDdrVnNqZzdNNUNpYXNLejJPVk9Z?=
 =?utf-8?B?bDlTVHY3cW9OdnRGemZYWEo5YVg2SWRxb2ZleGV5Sjh1NTFEZFNZN0V1UU1V?=
 =?utf-8?B?c3VjK3M3NFdGSi9yTmRFTHdzblFzcXRNaWJFSVBPTS95cWRtZURDLzVGRzEv?=
 =?utf-8?B?NTB2ZEZWOHdpdnZNVjA0Y2wwYzNGTU4vL2xDUUNSUjl5WXZjU2h0QjZxc0ZF?=
 =?utf-8?B?M29PRDR5aUZwTmpEcmcvRkVWQTdtWlRCa0hMNlhic1NjS0xJUVNXUVl3Q2dG?=
 =?utf-8?Q?rjMowl8bD00kmDd7/Og/oq8QvWwrOpyBgXgWnGb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b812748-ac4f-4d31-609d-08d90e29ca48
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:51:30.0661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDc7opL1eRl+M+mSoPEmXSZl16QU+dr1LRkeEf/WsTlonukyv6agpaVPXAJJt/gNBXi7xX/t8Lxdxde9eqE16/CNVsk7p4dmwax8yAeHCSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504
Received-SPF: pass client-ip=40.107.14.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

03.05.2021 14:49, Max Reitz wrote:
> On 03.05.21 13:05, Kevin Wolf wrote:
>> The error path needs to call tran_finalize(), too.
>>
>> Fixes: CID 1452773
>> Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   block.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 874c22c43e..5c0ced6238 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2918,13 +2918,14 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>                                      child_role, perm, shared_perm, opaque,
>>                                      &child, tran, errp);
>>       if (ret < 0) {
>> -        bdrv_unref(child_bs);
>> -        return NULL;
>> +        assert(child == NULL);
>> +        goto out;
>>       }
>>       ret = bdrv_refresh_perms(child_bs, errp);
>> -    tran_finalize(tran, ret);
>> +out:
>> +    tran_finalize(tran, ret);
>>       bdrv_unref(child_bs);
>>       return child;
> 
> Looks OK, so:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
> However, the function’s description says that it will return NULL on error.  But if bdrv_refresh_perms() fails, it will still return a non-NULL child.  Is that right?
> 

No, it's reset to NULL on transaction abort, so code is correct. It's not obvious, and I've added a comment and assertion in my version of this fix "[PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child"

-- 
Best regards,
Vladimir

