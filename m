Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F1039688B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 21:50:18 +0200 (CEST)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnnvT-0000ay-Bj
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 15:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnnpo-000420-0i; Mon, 31 May 2021 15:44:24 -0400
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:20598 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnnpk-0002nY-9v; Mon, 31 May 2021 15:44:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkxOyBollBwQzlIa24+0g3ZrcInJCAhLWN6TzHa0ehJ35ZSrdlmZ30Od3psSX6kSBp0aB5l2jI7XKESOhhhFmRUW0E/ZaPeoV7S91QjWDOIseuN/VpGzkRcC2YUgrK3pv6dMPGWMSqZ3DcTxMOtN+LqOTfbklb9MylWDFb/y6oj5NC658WNCtO0/CbFro5NiUitdXtm5Ahoeffu4QNnEkyQltdk9Jt098NmPWtc+vUfOLcU8w4OdXWOSe35N0ihZGTY8zo5rDB1dnQ06OQQxY91ylZ5PFp5z6aUxLv+adOCB8BlSWFye5Xhmg+VLYr3idmtAjOdUJL0vMApDKoOKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux8QunrglzdPWj1f4YIO17/3wmxTSOXZwbe45K6ISJg=;
 b=dSTrKSmAlYhtA6yJH95f0ivaGbO/PGKRBijBNy+kFTPDhEZoUOcX1eAO+k2jeiT/El9MreC72DQEiAfXWRu78wkYZI48SCxUPYvzOU2OokJmKX/1p4u3YmpzCawgd9Jvn6rShzFlEkYs2HO8gWmiWtEvRhYknnjOPyrqchTN5lXsh1zpukbusUXitxrqV0Xi2R4G8dfT1RvYndiMfh4HAQ6z6NLVQbNW3SSAacR6eJ+oZIbkuX6BCC4+kAvuP37PQQeHgNL1rQ0Z0glEuby3IjipfgX9Q8nFyzKns4MWfl8jdPYxK4zvvBB5PB34sFwfhVUloUTOJZ0OXnetMfDc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux8QunrglzdPWj1f4YIO17/3wmxTSOXZwbe45K6ISJg=;
 b=cs/JSMTSoFJgY/ItXxkKhnPPIXNPvTmmjN9hiMNW23gPXiXSAJ8gomtPQCRxS8F5NdowWZzoY05b2LSgzyRAGd2eb/6z5Df2AoRQ6lzNc6HbQb8D6uGCQ961qWCBScBsZNXNc3V4dg//Wq1OKjNXP8bau8RwY9cWIlfmbwBr6kU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3895.eurprd08.prod.outlook.com (2603:10a6:20b:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 19:44:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 19:44:16 +0000
Subject: Re: [PATCH v3 1/5] blkdebug: refactor removal of a suspended request
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bd034b20-eaa5-8392-2e06-da477ab613d6@virtuozzo.com>
Date: Mon, 31 May 2021 22:44:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210517145049.55268-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM0PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:208:55::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM0PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:208:55::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 19:44:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3a6f14d-1cd6-4a03-ccee-08d9246c7955
X-MS-TrafficTypeDiagnostic: AM6PR08MB3895:
X-Microsoft-Antispam-PRVS: <AM6PR08MB38954B32D363EA713FADFEB2C13F9@AM6PR08MB3895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUvDDMBkk/lgCmEL9eNHLWs4SUIoWGgTKkaa7kQOxzyp2j/Q60rGBf6/A5XftsZiMbE3RSXBYFrWt/XPlpWz07nSIy+awZnre42kfetEX6dFFMHA2ROZNbzkGVZVJtbZal5ZyOKQX9cHSsgYoOOLQSyvzjltzhZo/EdasRWFewK9FAYTloDVV66Z9DwFEj78MQqpfYEC3TnPIfUMbrvm2uf7rYx5IAAOy78DPPN4bqMsprb8M1zsYTPzC8V9PvVvDBa8tBUmU9+afsZKeUdkpLvNIdTeeiUqGDlSJrRkHNIxuAiGcQdJaCl+VQ4iAiaCd28pn/+7r+u2CGJFdYv7XeTDRj1YLChHBjnS20wIr0LWgxj96xYVGtosYlw0iieBG7Z7cB6MN0QBcsxKb6Hd06FE2mK3jHgWYUAoKOdaLAxPVnuwh+C7nsXaYfsI6U9k1itzXEFCasc93uVmTFTyTH2Zkbp83MXiwVJdO0yEPXbcFqEoRzorJLsSTupoiCPAuh7EoHodYSbtW83J9qBZr/BcKktg3cwZEyithU0xTYCEb5DmLuaJZISN9SSZnVxJfBu+3bVCHAtMrisFv/4yZ6PxBv1L2Kh0VV2vToHOGTxztI6Pcle6ff9SrqR7hkS6Rcy1MQ0AHpKIN6KGRaexNeMRmtLBxzLGdDcC4vyZk/b2OVhDWIrl6IDvWOONC2b/5J+qqevjKISQoDyTwdFFmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39840400004)(366004)(15650500001)(186003)(4326008)(2906002)(54906003)(16526019)(66946007)(52116002)(66476007)(66556008)(316002)(38100700002)(38350700002)(86362001)(36756003)(31696002)(8936002)(2616005)(16576012)(26005)(478600001)(956004)(83380400001)(5660300002)(6486002)(31686004)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2VBb0g5YWhSQkRkUmU3bFhsUmNaNFAzeGp3dFdiU0MrSDFyS2Q3bWVhS1JJ?=
 =?utf-8?B?OFBnbFpUSlYzWlVNaVlTWEZZMWZEdkZOUUNQeHhRdTFjS3Z2TVVwZCtxRm5p?=
 =?utf-8?B?TzBpaW12dEFCbDZEODFWa3ZKa1R5R1h6b25NMmZ3WVFwbmVoOXRqWUxaNkpY?=
 =?utf-8?B?YS9XTCsxZ01TQjc0L3pHZk1FZVA0RnFNcTFuNEt5QTdzZVgrKzRIOStrVVdo?=
 =?utf-8?B?YWRUUE9lY3BVMUVOQXlaNGNUdGh5NCtVMDV0YUxnVzcwTnozYk5uUzZIUGZK?=
 =?utf-8?B?NUdVQk01WXcxMWVvSW5FcnZoTkdmZE1oMEFreThZc0VaWU81MTlYYW94TWxx?=
 =?utf-8?B?a3EwWExnT2wrZ1F1cWRMSzVmaS9uZURJVUJMcDg0eHBlTFE0aGFleFByNkJu?=
 =?utf-8?B?ZkRacCtTZjFPdlppWjUxVnYxc2hqSG1xUjZFOGM2dHpnbDE2VHhHdDFwVW9D?=
 =?utf-8?B?RUlUazlwZW9OejFsdTdtVS85YktXbjhoZ0lGd3M0YU9iS25lUE0xS3ZYWGxz?=
 =?utf-8?B?UFdKbCtZbGo5dXNZR2MxT3Vjbm56akx1Z3o1QjM2Vko4N01lYkk4THBwa2tU?=
 =?utf-8?B?UjZxdjhvV3ZtT0FBaGY1QkhIM054VUJFRk9nWHpXaW9FdWdJNFZ1U0NIUXhH?=
 =?utf-8?B?VmJqNzQvdCtmL3RWR1pjdmx3bU1nallNa1Y0SHNyRzlJcHpBSHFWa1pESjZq?=
 =?utf-8?B?WjdIdTZ1a0hvVGxVcVRLRDFkbFhyNTBBZGRPaGpyMWRhdUpieFdKN0RVNHdE?=
 =?utf-8?B?Zm4xdHFHWURHS2V6OUpKUGFuNWZaakdBZDlEc0ZPeTdONDdqZUQ1WnJ3bWlj?=
 =?utf-8?B?R1ZQVzRTQmJMV1RFY1dkc2kwZFZMRmk3VHd3S0crNU1uajZLUHdqaHBVcW0w?=
 =?utf-8?B?d25JSU1wYm9lbEx1YjZpTnZpRElzSWZpWmZRTHpKdWRlSGE1ZDh6Z2pmVVJK?=
 =?utf-8?B?cmpEZXN1U3JFeE1FOVlYYW5CaW5xTWJteTRFTWhVYm5kODJVa1hacURlREJB?=
 =?utf-8?B?bldVc082RVhTMjc0YVVDaDNFSFYzWWtnZ0cxRmVCV3FEZStYbjVDNXBybTFS?=
 =?utf-8?B?NXRCZ2VQenA4ZEtuSUxhSDlDdkFWQXFnM3J1VXVCSld5aFA3L0pCTUcyZk1D?=
 =?utf-8?B?Zzh4VGNqRUlUSlFTNytzTFRnZS9kKzJZeHpWby9ka1dyM2lGNGc1a0RGc0w4?=
 =?utf-8?B?cVhxSEVHOGJ4bEVCVitTMFc0cDdHWDF6NnQyZGg4R095UkVWMXpid0RZRVNP?=
 =?utf-8?B?NEF1UGJGNDNDalo3RXBITFBBaVpDR3UyV0hqbnE5MUdVVG5zUDVMck1zR1lu?=
 =?utf-8?B?dnVNZG04SlpreG5VWkVJRGpzSVNjQ09hMUhIUUdkVlZCd1NIbzNXT2VzTStO?=
 =?utf-8?B?UVFlQmpoQ21rZ1l6b3l3V0xBbUlRTWZvYlpiUDNEbkhISTIxZ2xpQTQybnZY?=
 =?utf-8?B?UW53TS9laTA5MjlRUU41VENXc0U5OVRZVTJuMGxwR1lxRTRmR0hTODlYUmNM?=
 =?utf-8?B?Z2hMZk1TVGs1aVIxNVk3ckFYK29xc1lpeWprYjRxOXMyNVVsZEVCOFpqU3Np?=
 =?utf-8?B?Yzc1d29XYXUxL2dRZXVkYzJwTVA4RGQ2V1lTZGN3cnEzOGxqUytSRlA2alhV?=
 =?utf-8?B?Q2ovOUErd0hFWmsxTlhYQjAwN3V4emJtU1dBRzlaUGhuTm9nN1VFNUxseThY?=
 =?utf-8?B?bDFLMURqeDhQNkVwTEJ6NTQ0d2pKM29aYTVBb0ZRMGptNk9qT0o4MHhucE9M?=
 =?utf-8?Q?BCtpK2oqe34eBJ0TATrynyDm4OuK90KSA8pJ7B/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a6f14d-1cd6-4a03-ccee-08d9246c7955
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 19:44:16.2719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAw+8FMSPa650Gtjl0hjiC6nu96QmqPwmKr0i5jkujEaAohnLT+Iw6djIQGlZ10DG9AQKXyLSj8pug2/KQDmaNcylC0Z5Taqkl2kcdYrk6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3895
Received-SPF: pass client-ip=40.107.5.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
> Extract to a separate function.  Do not rely on FOREACH_SAFE, which is
> only "safe" if the *current* node is removed---not if another node is
> removed.  Instead, just walk the entire list from the beginning when
> asked to resume all suspended requests with a given tag.
> 
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/blkdebug.c | 28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 2c0b9b0ee8..8f19d991fa 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -793,7 +793,6 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>           printf("blkdebug: Resuming request '%s'\n", r.tag);
>       }
>   
> -    QLIST_REMOVE(&r, next);
>       g_free(r.tag);
>   }
>   
> @@ -869,25 +868,35 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>       return 0;
>   }
>   
> -static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
> +static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
>   {
> -    BDRVBlkdebugState *s = bs->opaque;
> -    BlkdebugSuspendedReq *r, *next;
> +    BlkdebugSuspendedReq *r;
>   
> -    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, next) {
> +retry:
> +    QLIST_FOREACH(r, &s->suspended_reqs, next) {
>           if (!strcmp(r->tag, tag)) {
> +            QLIST_REMOVE(r, next);
>               qemu_coroutine_enter(r->co);
> +            if (all) {
> +                goto retry;
> +            }
>               return 0;
>           }
>       }
>       return -ENOENT;
>   }
>   
> +static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
> +{
> +    BDRVBlkdebugState *s = bs->opaque;
> +
> +    return resume_req_by_tag(s, tag, false);
> +}
> +
>   static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>                                               const char *tag)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
> -    BlkdebugSuspendedReq *r, *r_next;
>       BlkdebugRule *rule, *next;
>       int i, ret = -ENOENT;
>   
> @@ -900,11 +909,8 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>               }
>           }
>       }
> -    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, r_next) {
> -        if (!strcmp(r->tag, tag)) {
> -            qemu_coroutine_enter(r->co);
> -            ret = 0;
> -        }
> +    if (resume_req_by_tag(s, tag, true) == 0) {
> +        ret = 0;
>       }
>       return ret;
>   }
> 

Interesting, could we really have several suspended_reqs with same tag, keeping in mind suspend_requests() removes rule before creating suspended_req with same tag.. Probably user could create new rule with same tag, when existing requests is suspended? Not sure is such behavior expected or should be abandoned. Still, it's all not about that patch:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

