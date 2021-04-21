Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F353367526
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 00:30:47 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZLMr-0000dw-BO
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 18:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZLJl-0008Ej-I1; Wed, 21 Apr 2021 18:27:34 -0400
Received: from mail-eopbgr70092.outbound.protection.outlook.com
 ([40.107.7.92]:34925 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZLJg-0003hm-1s; Wed, 21 Apr 2021 18:27:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfrHGYgo1E73iQkZeP2tJkzUHt379SBjeE4M+38Z4+AvnIKosP2FDSzKllC5S3xTLmgsGKSu73BMl4Kseq+Mc0sPjxcnv9NJyitqVVaWY+watZn2OcRRXCJnec1y+xLTW43ZMNmMH60fJpCUHzn8GPmO0gR+qHs1DOCVSk/Ui8sZ7eFPKfmAiCL5ijtzOfaBtQDBkj+0YtWe6GH4psALUyLEF5XqkcCxQaKDB0fhRiLj0mmj3MmZtoSDRoPRAd0RDzAA8YmjdYdxAy8o2GJPyJ2482wuSV5cVqzr5gfhhXgfOKhGIv8lSzA7ityd+GIzlI3e+rDqpfM8jmM9RUj4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGGw2e0xRO44jQd71VnydH5WtmFOyfnol8UTwdyPRMM=;
 b=mlGYKI+7cPAlxmsX02+qv/zIgSAsi58qqA4ER38fz1jtm4moq2DzhkM/+7rKtyySe1uTw3Wp0ZimMhvcQRVpWFXrDNWO+b/8B3nUSOLyylFDty5RDXF7r0mlZ2kMfZnGQxLgMDJdlT6onKnziGMNjXU601Yma1sP5aPKAMY9837Vn36G4KpMx94GeeuhomksET/oAYm3Rs3ijps+HkvkeHnVfKcmGww3ZsG9HWfgWb6QRiQlMRuapgmmDgfJ69Wf05EUxMaZrWDkVq2QW48eoQNBTqvy0gFwOUV3fErOuT0a5oiCClXf0paSiZSdHC4h/Tf4YozgRVyamfooZTqRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGGw2e0xRO44jQd71VnydH5WtmFOyfnol8UTwdyPRMM=;
 b=ggYi5CQf6n78wzybG6u6qlLI5mZ+SUkfM/lzUpTXQZUBhjSJSZbJWHB55LiIWrCHgDlUGgpF8JMnCuBWEHzBiMx7/2pii9KTz2mFFARfUjSDh86dAwpDHl571PhbWwcpzTzAOXgu0znZiaYsTfMc+Xws6Op1cAkk/H05lUeY3II=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5445.eurprd08.prod.outlook.com (2603:10a6:20b:10d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 22:27:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 22:27:24 +0000
Subject: Re: [PATCH v3 02/33] block/nbd: fix how state is cleared on
 nbd_open() failure paths
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-3-vsementsov@virtuozzo.com>
 <YIAwEYbLpqzzFzd4@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2f1afa65-fb15-7ccd-7285-dee9fe41161c@virtuozzo.com>
Date: Thu, 22 Apr 2021 01:27:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <YIAwEYbLpqzzFzd4@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.7 via Frontend Transport; Wed, 21 Apr 2021 22:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c49855e-3fe4-4d91-2371-08d90514a2ec
X-MS-TrafficTypeDiagnostic: AM7PR08MB5445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5445963C1C53A2F36E21643FC1479@AM7PR08MB5445.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/X5ZXFaGWz81PHK49ryR8MWj6Jrt6YryXPA6FCksBkJ9OcFBQ/Hvo2LVK3YtJJZwT5zBcKIuxUsWfouRduH+1rD/OOMrcsCJ9qQjonSWygzDbuzxivM+3cSwzfG5i8XVNa4TZkv30chDMtP9+32BtBBOn8uWamH3IoCoLJswMt5IF9A7aiw/DFDmKcfY9jyPusKAfTbj0BWLfuLqoMQ8PpxpGq1iemmAVmqzgckYCeGnMEnVSbyURel4MIZfwhjHg+IU2zkyj7Oq+T88yV2gdhTZccIz5PQWm0ddxK+AN41zH7s9uu+WslRRSG4NoENShw9yDQPd8YBz0qsXetaXS0CFwN5bX6CBST5uTy7o+LcROTJNWZz0JWeSQeF3ZAmSC1JOLTw8zDAlYi74MNG/DAnX/RfMsEMxdTyGr4mcydtLWmRO6TELRAIOuxqcw+/dPULmlSgBNkI8wt3tIn1VFfb3g+aKjltpn6u8+PVHws8pIRmUSdd7K8JYH7AF+1MRyETrY6N2auP74GiO7rrYDWlKbZzUplhiZnukRwKg+LSH4/ppgZlB/7bJbYqqmb0mrTmMf0AwpDOecOxLn81VKbQAjcKM11OLBTDwxG3RgZ0+9oqsIWs0+qbTsIdZbS4/0zaZDj5Hp/uU/b55fHtAPJ8NgVwyV4cwwBSfqqq4lDnKLlg3EXvz8JM0zK8AO+9rbz/TyVfb3E1GEYXLGAVEhM0R0uCK0OKx5ASCBuAvcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39830400003)(38100700002)(38350700002)(83380400001)(31686004)(52116002)(36756003)(16526019)(186003)(8936002)(8676002)(6486002)(26005)(66946007)(66556008)(66476007)(5660300002)(478600001)(2616005)(956004)(316002)(2906002)(86362001)(31696002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFM5aDdmWlk3Q2Rzall0Y3FiemdaZTg3MFZrUFoyQ0x1YzI0T2s2bHdJcmtn?=
 =?utf-8?B?ZEZmUmFWUnpRWjNNd3orV05ZUVh5TERRZHkxSEszcmhVWERtYUlwMWhkV3pV?=
 =?utf-8?B?QnVZblJ0QWdpdDNFZEFwb2J3dzVwMm1HVVJROGFSaDFvampVM3BIUUQ3TDhS?=
 =?utf-8?B?dC9PN1NFdE12NjVxdkFqUFNLdW41bjh4bzZJelhrYXh0bnk4VFpaRG90QzNS?=
 =?utf-8?B?WkI2YVRVVVZoSFRYTEwrcjRGdW9GN2tuRTk5aHA4MVZycldSZElSRFRQaGJ0?=
 =?utf-8?B?cU5UdXM5TXVlSzVFMjM1aDVwS0YzamdKcFJaWlgvVXFwcTJNb29CUVF6VHlR?=
 =?utf-8?B?NVhDZG1GeDRkS0hRQ3pyKytORUllNkRDeEFJT2Ezek5KRUdxSDZyWmhJZUFW?=
 =?utf-8?B?OGFCMUhFYnZoWGdCTTUvOEhMSDJ5dEx0S3dkZnVmVk5NenlPTFI0eDlpRHVQ?=
 =?utf-8?B?Q1FwV1gyT0F6L0NSMnhpVlQ4N2J3eWMxaUZBakx6VEFnNHFhWFh1Y3JMRWhD?=
 =?utf-8?B?eEdOMlNaQnRVY0s1amxybkEwWVZhUVc3OXFXaFhUYUxvTCsvWk4zcWZNZlgv?=
 =?utf-8?B?dzZiVFA1TkRhRFVjNDgwZkNJa1ZLcEt3VDRINmFUVDdTbSsyQ2R5TVdaeFBm?=
 =?utf-8?B?ZHNkTHMyZ3dDK01xM3F5MXA5R2ZZYzlQUktyLy9MbHBHRERNMHlVZ3ZRcDMw?=
 =?utf-8?B?QXNiQ3E0VFAwbkh0d0M1N1A1YVkrMGFpYUMwYTdXNDFpTU5iMVFZZ3NzTmtH?=
 =?utf-8?B?NDJCWHNCUHZoMDBJS1cxakNHUlVJbjdQeEpmbWdHMHVFWm5ldDdXWFpIcEU4?=
 =?utf-8?B?b2JDdkNjd0hIQ1NlSWNudVRhdVRiclpXMlo0VzBad3BpbDdERXVLTWhrbHM2?=
 =?utf-8?B?Yk1meG9nVDlkZUNKaWZtYmRqRnJEaVVrb1ZEN0NqNlFsTXY3cExFeHFHaVNL?=
 =?utf-8?B?TDZGNEtKWHdzNkFQN24yNmY5NGZJSjZ5SlhnNTRpSENwYWRja2xBaG9sTTlR?=
 =?utf-8?B?NTJXUjlCVzhBYys0QStGTHlIdnM2L2lHUnh5YjdaMHpEcGR3TGtWZk1jRUx2?=
 =?utf-8?B?THFJbm4xclJSZ2pRaWcxelN4NkRDeEJSb2pyTUZ3dURsUWtCL1Jsd0I1eWZp?=
 =?utf-8?B?TzVjUUhxSWExS2ZoVEppV1lJNFQ1bVRlQVRYc2o3UnRCNTdndXBvZEt0eis5?=
 =?utf-8?B?aU1DeHJVUEsrOUxNK0RoRVpLVmhTQzlIa0RQVk0wcVVpNzE2STFPbi85b3Aw?=
 =?utf-8?B?bHJrbjRXUDh5NytMUXQydmY2cEM0WkNqSW96cUNBQkc2UHk4c09QUm5MdFJI?=
 =?utf-8?B?bDJvL0xjcUFMRlBsbVJadlRVUzhFQTlCNzJpYjlsNzcwaHdIOFE5d3VhVW80?=
 =?utf-8?B?YWUycHVtTWNNVVZocldiOGxEOGV4NmhNUFp6WUZMMFNMcjJuR3ZTUGQ1bWhU?=
 =?utf-8?B?Q0JONDFvQXczTmpZSm1NU01NL3hSdFdLMS8rWmZxRGw4aElnMy9nVGNHaFJK?=
 =?utf-8?B?aURYWkJtd0dKQ2NscVgybkt3cmgzZXZEc1ZOVWN6MTdOZDYxRGNVQ21JZi81?=
 =?utf-8?B?MW00ZVdoUC9FZDBsam5YWmtoeHVKUWhGdGpGZkFKTTNlTGMyZmxiMWZURzRW?=
 =?utf-8?B?N2ZtTXZRK2VTWGh3WFI3MzBhK2I1SDNlM2g5UHJzWjVkNEZtVUtwbU14a3l6?=
 =?utf-8?B?OXFhalV6V3lST0UzbXdYTS9BWEhIL2Z1UFdMMDYrNW95TUpYWXdHUjVIZ0dV?=
 =?utf-8?Q?/Aq2IByapyp5bqJ/ws3hUmoxhiG3oclnwbHg1Zb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c49855e-3fe4-4d91-2371-08d90514a2ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 22:27:24.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQz2ifLvyGd7qWyvSGsSOdGw0KJz4ug63FVRL+r8zm0jVsFv7Yl8Oiwo6EzLsWnA5+kf4ZbUuxxAZX8Sh7KYSWxZMnjUwEodDfR6giveQVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5445
Received-SPF: pass client-ip=40.107.7.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

21.04.2021 17:00, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:40AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We have two "return error" paths in nbd_open() after
>> nbd_process_options(). Actually we should call nbd_clear_bdrvstate()
>> on these paths. Interesting that nbd_process_options() calls
>> nbd_clear_bdrvstate() by itself.
>>
>> Let's fix leaks and refactor things to be more obvious:
>>
>> - intialize yank at top of nbd_open()
>> - move yank cleanup to nbd_clear_bdrvstate()
>> - refactor nbd_open() so that all failure paths except for
>>    yank-register goes through nbd_clear_bdrvstate()
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 36 ++++++++++++++++++------------------
>>   1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 739ae2941f..a407a3814b 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -152,8 +152,12 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
>>   static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
>>   static void nbd_yank(void *opaque);
>>   
>> -static void nbd_clear_bdrvstate(BDRVNBDState *s)
>> +static void nbd_clear_bdrvstate(BlockDriverState *bs)
>>   {
>> +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>> +
>> +    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
>> +
>>       object_unref(OBJECT(s->tlscreds));
>>       qapi_free_SocketAddress(s->saddr);
>>       s->saddr = NULL;
>> @@ -2279,9 +2283,6 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
>>       ret = 0;
>>   
>>    error:
>> -    if (ret < 0) {
>> -        nbd_clear_bdrvstate(s);
>> -    }
>>       qemu_opts_del(opts);
>>       return ret;
>>   }
>> @@ -2292,11 +2293,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>>       int ret;
>>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>>   
>> -    ret = nbd_process_options(bs, options, errp);
>> -    if (ret < 0) {
>> -        return ret;
>> -    }
>> -
>>       s->bs = bs;
>>       qemu_co_mutex_init(&s->send_mutex);
>>       qemu_co_queue_init(&s->free_sema);
>> @@ -2305,20 +2301,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>>           return -EEXIST;
>>       }
>>   
>> +    ret = nbd_process_options(bs, options, errp);
>> +    if (ret < 0) {
>> +        goto fail;
>> +    }
>> +
>>       /*
>>        * establish TCP connection, return error if it fails
>>        * TODO: Configurable retry-until-timeout behaviour.
>>        */
>>       if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
>> -        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
>> -        return -ECONNREFUSED;
>> +        ret = -ECONNREFUSED;
>> +        goto fail;
>>       }
>>   
>>       ret = nbd_client_handshake(bs, errp);
> Not that this was introduced by this patch, but once you're at it:
> AFAICT nbd_client_handshake() calls yank_unregister_instance() on some
> error path(s); I assume this needs to go too, otherwise it's called
> twice (and asserts).
> 
> Roman.
> 

No, nbd_client_handshake() only calls yank_unregister_function(), not instance.

-- 
Best regards,
Vladimir

