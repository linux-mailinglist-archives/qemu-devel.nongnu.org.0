Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328F2D2D88
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:50:17 +0100 (CET)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeJk-0002Mp-MI
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmeG1-0001At-5O; Tue, 08 Dec 2020 09:46:25 -0500
Received: from mail-eopbgr130130.outbound.protection.outlook.com
 ([40.107.13.130]:24833 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmeFx-0005j6-VX; Tue, 08 Dec 2020 09:46:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+c2QVvIC/WRZguGvex944a3uPU7yud/UKn/kK7SzPUtrv+Nc3ezGoYuPGVIU0m1aC/tYb+JlV9gjQy+jisZ3ynrfKdjdtAwc807p2Mt+XnYT5dd0dgfFnADHWlLfZurFdXYTv3MmuQPmpmb8eK1ObZYMF26qnf/MPR0tTA0SLi9ZIK9JON9+zh4ZUQyT/LeFYTYBJmaVwKetDko/lt8GijARmS4KD7RT1QEEB4XY9eLXOXKnG9j6peJKyqV/JHxJ+0sg+z07Sr826qO/+ZOX2Y0ler02GSB5ssUlfsNBQBf1QSdAnpQXVVo1P2WO0KnRW2eAhsmZrFNxemTMM5/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h/fw1oE/DIfF3wFIwr5YdI+h5LURuJR2IhXhXaicFM=;
 b=PAac0ScUF48ycsNGR6a1TJ1RgXbOJiAWrGbz8RstxL5D6WluYMBxio/LPchZ1P+JuA0GcVrKMZsAKwdN9gk92EOXq14DRdTfQ5h7jZ9az2KixP7PBw73pWKCzjwvx+K/Ow0EAgUuzOVMPUTjDiYRS5VE1URGq1jPoZvuG4Nr0304g1P+YqFYatR6u2n7CFl+35buZRfQGakvNRvlhRFjcIFy6FeVYC0Vd7AmBf1ZCTRUcFhU8m8mCcRtQ2LZ9052oIZzdaebLEwh42dvXckLjW8luE3w5KrfACEVUKsy2/6VKmCJhqv6nUrMw1SpZLJiGF0LqfC/qfzK1qDA9i0lKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h/fw1oE/DIfF3wFIwr5YdI+h5LURuJR2IhXhXaicFM=;
 b=iZ/LiHiCSxA2dx0deBD9EOP5sFWq15H9n10bRXdXP1U0eywAihJCmsbOsWzQSKXZKN7L/0aXUL6Hr/+7Js0LKMQWuuM4Zl3Ha17MPWAEgd81vxIy2Cb8p7V03Kl7x0PD9zmyoYorPi8KPWBWkO5wi5iIE0yxLMAoBsa2fPHO2BY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 14:46:17 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 14:46:16 +0000
Subject: Re: [PATCH 2/3] block: Fix locking in qmp_block_resize()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
References: <20201203172311.68232-1-kwolf@redhat.com>
 <20201203172311.68232-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b0ad26a7-7db2-86bd-7001-f360ccf3b20e@virtuozzo.com>
Date: Tue, 8 Dec 2020 17:46:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201203172311.68232-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0093.eurprd04.prod.outlook.com
 (2603:10a6:208:be::34) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:208:be::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18 via Frontend Transport; Tue, 8 Dec 2020 14:46:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b76f3871-f189-4bb5-9da8-08d89b8804b7
X-MS-TrafficTypeDiagnostic: VI1PR08MB5422:
X-Microsoft-Antispam-PRVS: <VI1PR08MB5422F69C729C2730A1BA2717C1CD0@VI1PR08MB5422.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3kaXGJHpK+PSiqNlp0cEUJOdl+6BRBv5ybfy4atLcwCd+gatWix2C6IY/8JqYeEeVo3TCNIB8ThoKEvyOmRcYn5A3c3MN80u+XR6bI+/ylea+vbQ04u+A/EbgZveFJzWztu7dYs/eTsiQFA8oi7ium6EHYjrSyZlsm/6Lz9a97BMxdKD3n6fdUNArkaC56egVylPj7FDni7ivP4+/9+JCKwGXK5dMHJyeLXV1Ypo8hkabjkMaLtgNs0WNF+pFlu36bkyI4+MjMXOljYFN9S2gWWrQS7kf3mvJJE2uDTUbGocBwcGupEt0O1n+Z0Avpt1Dkf9VabE4BvKmTmEqEtJKc2OQsJohuTuEh2LV/cwC5YMliKH9rugOc8lzRX7m9Wt9NWlzfHxrkbDRJSu1yyXFZxAN+I0ic3TSeTAOXgs7xL8I+X9NCZVphMc59kZdu1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(956004)(4326008)(2906002)(34490700003)(86362001)(2616005)(5660300002)(31686004)(6486002)(52116002)(186003)(66946007)(66476007)(66556008)(8676002)(83380400001)(26005)(508600001)(16526019)(36756003)(8936002)(31696002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGJvbC9wWXd1dGgra0kzTzYzTjFaT0hFcGlqaHYwZEk5RTdwMlBnVVo4S05v?=
 =?utf-8?B?ZlljSDJOblZYNTQwRlVqQ2YxTmlqOXNTOGVuR0ZPMTFkTnNmUHFVakYvUUtL?=
 =?utf-8?B?WWJBWThScHRLTXgwelNZSDQwaWhpRlE2ZWNGUFBsL20zVFlBcGNMZFE4akhj?=
 =?utf-8?B?RThkUFZvN0tZY29jUGR3cUJpdmdBQVBPc2oycmdtTzRXcHlUQlNJaWJleFNk?=
 =?utf-8?B?QWNZellCTTJheTh6UWFYb25TV3YrZjhCZTExMW5CTmhDSmU5M1pLdU9GcXM1?=
 =?utf-8?B?YjF5cEQ0dUlKREJ1R0N0ejFOeTJCT2IxQ1dLeUZMNzJlbzN1SjlFcnZtcERK?=
 =?utf-8?B?SjBaRzI5UlJTZTI3dTBJLzNWVm1tQ1VXYVpIYUJSM1RBdnJuWllNM1pSZUtJ?=
 =?utf-8?B?bDB1OUZKejk0Y0ZIYkFQYzQ0dmo2VXBCK1l1MGt3VjF4SmNkeXFzTFBCdVNa?=
 =?utf-8?B?SStjRmZkVjdHSENIUHlIanVPYytERFIzR2w5QlR3RkVVdmVIMXRZWjFyNXkx?=
 =?utf-8?B?WFdpRkNhZW1JSy9FQkRQWDZTNWpock0vdStkZUg0US9MQk85Zm9rc0pWQURw?=
 =?utf-8?B?QktzZFpuV1Q1UGRUN24xV05ISktmbjF0RVd0dFdtdmd5cGRLSDlud1huR0du?=
 =?utf-8?B?QVZMdktHOGdjZXhaYmpsWCtBenF1ZnlGaEtvREQ4cmFzM0I1eDhYMVc3UVZq?=
 =?utf-8?B?YXN5STdyZTdmLzF4cWdNQnJuT01KazlhK0tyWThYSXhJZlR1VUU2THJtTXhp?=
 =?utf-8?B?cEhlL29zSHpFeVhpZm1xbkRSellnSlptY3FSZmtYWFo2d2FKMWxYWFIrS0FL?=
 =?utf-8?B?R0pKTXdwbkoreXdWL3FGaDY2ODVvQ2NQSDRFS3NBZkxpQXBwajZxMy93NEEy?=
 =?utf-8?B?Z1plaWR1bmNOL0pRYXgranRGVGpQZldqZWJJRGg0dmRia0tWRVZFRmRVN25W?=
 =?utf-8?B?UXlTS0NqNm52dENnN1laZmx4aXpBZ2JXSHV5TmVJS2NYakF2WTlUUElzcnVw?=
 =?utf-8?B?S0gvOUxGNXdjUDBlNTNGVkFZUEhZZDQyVWMrNFAxNmRWcnR2ajJPM25Xa2t3?=
 =?utf-8?B?NnozbENWY000RDFzOWc1cXBORUpYWGFTNjRVZUVjbTl5SDU2QjBzclZ0UDFQ?=
 =?utf-8?B?a0VRN1RFcjQ1QXN5L0l3MWxxOUpJQlVWSkphV3B3ZlNHVExZSjB4WjhVWXVs?=
 =?utf-8?B?TFpPSTIxSERncHNIYnh2YVZvTk83d3BET1ZMUnh3V2kyeWFvdktaTFVoQjdr?=
 =?utf-8?B?NHJ4enJ1K3ZZbTd5QS8zVHdwM2tMWVZlK0VBdUxUNmxtcXJWWU1jd1pObGtV?=
 =?utf-8?Q?QVoReBu4uRi7VRNqXQcH1zZYyYFIsPJcXP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 14:46:16.8780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: b76f3871-f189-4bb5-9da8-08d89b8804b7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfWzdR6my6njwAhAfMQI8IkJ4oLspMQI9gJ+qX0zDb4+KeVx/wiq+6yy0YE8RuUw5hfokgZcSqOFBEkX8qBxOqGVF85sy9vQiXcDuwnxUxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422
Received-SPF: pass client-ip=40.107.13.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

03.12.2020 20:23, Kevin Wolf wrote:
> The drain functions assume that we hold the AioContext lock of the
> drained block node. Make sure to actually take the lock.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   blockdev.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index 229d2cce1b..0535a8dc9e 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -2481,13 +2481,16 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
>           return;
>       }
>   
> +    bdrv_co_lock(bs);
>       bdrv_drained_begin(bs);
> +    bdrv_co_unlock(bs);
> +
>       old_ctx = bdrv_co_enter(bs);
>       blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
>       bdrv_co_leave(bs, old_ctx);
> -    bdrv_drained_end(bs);
>   
>       bdrv_co_lock(bs);
> +    bdrv_drained_end(bs);
>       blk_unref(blk);
>       bdrv_co_unlock(bs);
>   }
> 

Can't we just do

     old_ctx = bdrv_co_enter(bs);

     bdrv_drained_begin(bs);
                                                                                 
     blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
                                                                                   
     bdrv_drained_end(bs);
     blk_unref(blk);

     bdrv_co_leave(bs, old_ctx);


? This way we have one acquire/release section instead of three in a row.. But then we probably need addition bdrv_ref/bdrv_unref, to not crash with final bdrv_co_leave after blk_unref.

Also, preexisting, but it seems not good that coroutine_fn qmp_block_resize is called from non-coroutine hmp_block_resize()

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

