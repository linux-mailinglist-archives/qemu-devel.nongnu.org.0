Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E844C25D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:47:41 +0100 (CET)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknwy-0000ps-Ob
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mknoS-0000kJ-4R; Wed, 10 Nov 2021 08:38:52 -0500
Received: from mail-eopbgr00130.outbound.protection.outlook.com
 ([40.107.0.130]:9513 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mknoP-00033s-Hz; Wed, 10 Nov 2021 08:38:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYccmzWWLm15ldwndWZf7BpYAutMkvojK16mmfxPAB/MDhdSOYsyOiiPLea8jIQ75P3ouOtsLqV1GCEVMJPTHsYLi32sMF6qi7j2qgnDm5AlG2Ljyyty/89PMW+CY7QM2quZRMyzH7pTqp7ITRKdjfM0ZU46KkjvqUEvF8SVvmTc7I3sPr/aZ9PteUASqJR1kFwV0yhGDAjysV0tvH2VACpyGMUbeDJkjZqOeBbkt6AZ9/8bhJoA4sTvSfnLPaeku3WUwRi3nL8/9ZS4RcDRN/xxZ9lMqtCrUjev+CfEON+QyyMeJucWsS6VVNWu8yP7KYy/4Rd1zqT7No0+C+gUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ttt35gkfWHK2BG8RcaqAJH/IIzflOmtFRqO8/WQQduI=;
 b=dV4OvBmWYVoGu2XZE1npEJxqdhF18SkhH696qwqvpmp1IxOUJHFiOul/ojkPLubDNYts3bMexndq4eupjZurSXuY8lVECnrht13J2YN8AmmNHUrxCFaI321J5tNy3C0ZC8BogOqnatiA5a1fk5WRq7pRt9OMm1Os8UIwMKvbDJzVyV/qxWtQupx54ie4H4CO13f4jDdOcdKeQVCrf8ErokizN55Sg5LI1CEvOeEGEl4ZjpR0OxHnrBITq7F+uONhL+R4Xn3/BPCExoZwsUU4fzWODA3DcBl484JBcyfbdUuDipZZl2+ckOXk20NayN5f5TFGGBGvmO5m0NmlYE0BbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttt35gkfWHK2BG8RcaqAJH/IIzflOmtFRqO8/WQQduI=;
 b=jzst+4f4BAh4C+5oD6gqp/w0ZAcEzi4F974YaCa6bEQkZyoamiy36g8T83+PXPQHX60NeyD8/SA2VvRBOTipFRmZr3FLdCKXV6yPbuRBmD1P16am+E2zx78YH4N3SGpMzeOEQmFuYWp0VfEP7ZYHI1d7aIfNuKS8wGUx29RQ+gA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 13:38:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 13:38:44 +0000
Message-ID: <9509e689-95cb-ec98-e27d-7f3a35e22503@virtuozzo.com>
Date: Wed, 10 Nov 2021 16:38:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/7] block: Drop detached child from ignore list
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-5-hreitz@redhat.com>
In-Reply-To: <20211104103849.46855-5-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:20b:462::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 10 Nov 2021 13:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09b685a3-0a25-4f83-714d-08d9a44f6a9a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652C4D1E6DF2D6BEB6F11E7C1939@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQP7tYiaMJTH2Q9p3Sbd0JPKirjzWrGwv9z38PSmljdhrNWJqrGBN7UDy4F354QGltBifcqwEP3WjsILJJvKfcXAUhWjo57aCEPvDOmvx+eHvnCNi7XRJmmdHgoIHYgpRf9hDwqWzd01hMZ2o5Wcj/f9n7L64tumyO7AKVcTjQw7i4adKx5y6rdKg36C6o7N75oGs5kCwbre1/bFCvaq/o3Rf+KOfk/CjPL+tjFEOx9obdhwVQgI7nh2WMN2MAOXWD9Dj+HWykKLRYXOAXpgJ6SFZp5nYG0WjolgX4aEqibVh78VsDgVY36ByXFdkp20olh8bfZpKPPtdZKDamUsLTaYnQ/mDhziVwt/N67Ke/jY6TRrrKDNaJM6wqxO8tbxRTCn4SsBIzZnRvmZWPRFTJXIPn0XAmivoA77vfB+0CXWwIZ8syvqg0rlAK0nhqiKez1a2yoRIbCM4DBQWEc+4nlzka5p/8diUcyoGczLY9PlEZ+PjAeHxq+CoVO8Hem44y1JB7YhPZRQ9pew9wEQNuSYrc2tG5dYOYmAXNIG7p3qkWpn276z08yGecQYeNzBe86feLyFE0qbxC6kcmJftN5TRhZJ/uCsHMSnaTnt89qpjxBBG5eI1MRJcj9F7/tKDDzcPd4ro+fV/UDTyRL+yceTZc7iB1VH9x6WWhQuL3NP+oLdZ1Ucb0Vos1RFCuWgkd5bLjvtWPYYXkXYPmro6OlCEofWJ5urbGtfeGwo4JOAqiSAVuLunGf5+Y3AuOX1/4wCxE/joHeoTTtWFTTHTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(83380400001)(52116002)(186003)(508600001)(8936002)(4326008)(31696002)(2906002)(38100700002)(38350700002)(26005)(16576012)(66946007)(86362001)(6486002)(66556008)(66476007)(5660300002)(316002)(31686004)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWJBaGcyKy9Vc2VBS1FWUkFOMFgxa3ZwVm0xeDZXZnhyd3Q0N3pmelMwa0RS?=
 =?utf-8?B?eFh5RDlzUW9CQ2o0bDVpVXNrd0QwTzdiRkNBSnd4U2NQTHo3UmpmQUlLTGUz?=
 =?utf-8?B?eHB3VHJEWUVxTG9qZWpmdFZGUlZsMnBKb3RxRk9rOW5HUm4zK1R0NENaM3E5?=
 =?utf-8?B?L01aTUxsTGJKWjU3NEw5YTh3Q09waUN0Y09ZTmZTOGhiVEd5cU9Rb0dEM3lO?=
 =?utf-8?B?eGUyUk1WQjNObWdOUFpINHhucjBFNmxyRXVXcG5iWWpjeXJudW9MUWNhVmJB?=
 =?utf-8?B?S1BHaFZRSjI1M0JyMEVTQjJrT3hvMWNSc0EweDJPY2NUejZGQ05abDFodVRz?=
 =?utf-8?B?Q3dVVEJnVnJreGo0VkR1aFdkKzhvRmk5Q1pZanZGSWFGTGpBNUsrclc5VVhV?=
 =?utf-8?B?T05kMXJLSkZSaWJkTzRrTWVUUGYwV3dORVpnRVdkZ0U1bFZMT3NScmo2b2hl?=
 =?utf-8?B?c3BWeEJucDlLRDdNMW9MSUdPcys3V3JSMXRGOUV4a3Q5eTF6cWxqQ1kxaThH?=
 =?utf-8?B?K3A3Q1J4K3dzeWJqaHpOSUVlclRheU1BVUhydEQzYTRYTlFTNXMyc0tBaFZJ?=
 =?utf-8?B?ZEtWT3A1NmduUlk4NmNOT25aR2FxNU0yTEVaQjJKU2RpOWlxT0daV1U0KzVx?=
 =?utf-8?B?N254TFEwa296aUFTVWNpN1Q0Uk9WQ0VEVGVRMGZjc1lOYWEzSG83akF6UUZa?=
 =?utf-8?B?QUdRT3d1cFAycVdLTUh6VG1aNHhmQWJYU3hiMXB0QWVqbk0ydmFVd25MRnZp?=
 =?utf-8?B?TXovQkpVbnRKWC9kN0gwWURzZjBRVmFueVF1STkzZHJPaVVmWHZTYmczVk9U?=
 =?utf-8?B?VjlwZWFJV3o4TW1TMDdoWXoxMGZyalphWXZlWElWeU5iUHFmbnV6dno1RTFY?=
 =?utf-8?B?T0pFYkhua0I2RlVZejZzK3hXQlBrV1VoemJIQ3hjTjlJcEZpWWtteXRMV0Rl?=
 =?utf-8?B?QkxhRjBQbWhqN3ZpN2paTGtNZWIyU1FZTjFBWGVkV2w5VUE1VVI5S1BQQllw?=
 =?utf-8?B?NW1lT2kwY0F6VjdKMVpKNDlHMnVGYzRMSVRSVUtWbGFsajBoOS9RT1dZN2s4?=
 =?utf-8?B?a0o3eHhvZndJK0lPL2pteGlKeExTd1g4UWZISThBS3JEMFZWN0EzZ29kb1NX?=
 =?utf-8?B?Zkthc2M5VHVka2FvR0U1TzJMVkEyb3VveHFTR0ZVcEFCWUYzelo4SEM0bGxS?=
 =?utf-8?B?OGgvZXdEcWxPdEoycFhMQ3lydjhwZlc5MmNDUmxCbUFWUkVjTFJqd1N5ZzVV?=
 =?utf-8?B?YkdueTk4WFdWSWZqV29pM0RKNm05SFdjRExGZVc5Z1RFUDBzOFhIOVgvM0lF?=
 =?utf-8?B?a0ZuN2xSRktCc1JaVWN2eGo4cmpvOUFrSXlLZHZIaVNvTW9mNktvUE91V1Qw?=
 =?utf-8?B?ZWtveVd3Vnc4UHFwUnNNcHlPWEZPL0ZXb3FGZm1pSWtoZjdER0RzWkNsRHZh?=
 =?utf-8?B?YWJUNDhZekhkMEtNTXJ2aUdvMm5OV1ZScDltSE9VN0w2ZU1rWHlRZDViUlli?=
 =?utf-8?B?V3BSSjZtQXNsMDhRUnFlOXhqS0c2NEpQb3VLZWpxYWloYjNFNjNjSmwrcXZp?=
 =?utf-8?B?eTRCMzJuaDJMdVVoejM2d2pwZXVhUUtWVkUxRVpxM1VVSzRwNEhqRnZqWmVz?=
 =?utf-8?B?cjY2N2FsaUJUTmpabFY2SXdINjd3T0M1cXZHZnYzVHcxTC8zRURYZG9GQ2pl?=
 =?utf-8?B?bGVTcTdna0R3V3VrWGVPenRZZnhQWk9MSE5Oc1BvNDRDUDlzSlI3NngxTUVm?=
 =?utf-8?B?bzhlVStGVzMvQkFicU5GWlh1R1B4U3dEOU9GZ2lRQ2ZZVm9KT0ZMdWgwSHBu?=
 =?utf-8?B?aEMyZnBESmNrNC9iSUR4cFllVStZazQrVTdub2IrWlhKZjdQRVM5OUNNZXA4?=
 =?utf-8?B?azBuL1pQN3ZPNHZzKzF2VkxwUGYvTm1VQS9wMVdsanMrak5MQ2RMRlNNdkhu?=
 =?utf-8?B?RzFvMmwvOWErR2c3NFVzN0EwcXhPTVNJUWRoSk1tQlJvV2l5SWk1aTkyOTdn?=
 =?utf-8?B?RDh4SElqV1hubEdzaE1YVjRleXhlVHd5SVMzeW9JR2pKc2VnQTN3Y1JlNXdn?=
 =?utf-8?B?T3VGUDJwOUJUYlRhdE9OUGl4SDcxTVN6N3FNZDhJYWhMK2NOWUhDSENsb25H?=
 =?utf-8?B?WjVuWUxTTjZGL3R2WEQxbSt0eDkwbEtqbi9vVzBQMHV3WDIrUUZlUTZZOVYx?=
 =?utf-8?B?aXR1SHpOOWd0R3F5eUtwa2p1cnJnbXFuKzlSV0xtOFdEbXZNR2l0cnE0S0Qy?=
 =?utf-8?Q?pWquaM5SdoZaK3adVHN/RAoV3ez/pOlGCzBSfl3QKM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b685a3-0a25-4f83-714d-08d9a44f6a9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 13:38:44.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jin+LUWifHOogqt5s8fNrVLxBenFcVPJhBIx+cYZBBFsWJj9Hvhj0Pl+Lx9420VXs5+fd2JgB+iOmyfcy8fanvYUWkQhP+OVCyqgmyoq6a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.0.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

04.11.2021 13:38, Hanna Reitz wrote:
> bdrv_attach_child_common_abort() restores the parent's AioContext.  To
> do so, the child (which was supposed to be attached, but is now detached
> again by this abort handler) is added to the ignore list for the
> AioContext changing functions.
> 
> However, since we modify a BDS's children list in the BdrvChildClass's
> .attach and .detach handlers, the child is already effectively detached
> from the parent by this point.  We do not need to put it into the ignore
> list.
> 
> Use this opportunity to clean up the empty line structure: Keep setting
> the ignore list, invoking the AioContext function, and freeing the
> ignore list in blocks separated by empty lines.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


What comes in my mind, is that now bdrv_replace_child_noperm() is more strong in detaching.. But may be not enough strong: we still have link from the child to parent (child->opaque).. Maybe more correct for BdrvChild object to have no relation with parent after detaching. But than we'll need some GenericParent object (as child->class is mostly about parent, not about child and even not about the edge).. Now GenericParent is "included" into BdrvChild, which represents both GenericParent and Edge objects..

> ---
>   block.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/block.c b/block.c
> index b95f8dcf8f..6d230ad3d1 100644
> --- a/block.c
> +++ b/block.c
> @@ -2774,14 +2774,16 @@ static void bdrv_attach_child_common_abort(void *opaque)
>       }
>   
>       if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
> -        GSList *ignore = g_slist_prepend(NULL, child);
> +        GSList *ignore;
>   
> +        /* No need to ignore `child`, because it has been detached already */
> +        ignore = NULL;
>           child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
>                                         &error_abort);
>           g_slist_free(ignore);
> -        ignore = g_slist_prepend(NULL, child);
> -        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
>   
> +        ignore = NULL;
> +        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
>           g_slist_free(ignore);
>       }
>   
> 


-- 
Best regards,
Vladimir

