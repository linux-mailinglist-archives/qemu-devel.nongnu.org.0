Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8633AFFEF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:09:42 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcPc-0008Tm-PY
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcO4-0007eR-1w; Tue, 22 Jun 2021 05:08:04 -0400
Received: from mail-am6eur05on2092.outbound.protection.outlook.com
 ([40.107.22.92]:40206 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcO1-0002Pp-50; Tue, 22 Jun 2021 05:08:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3W5L43kgRdwhVsElOufo8J3BDqvVn2j+EDfWgVIpOdoBNGCOifRvfD7Ur9zMpwmKUoR/lvvNXfEjnTGQJ37LfPolMqxuekQ8AielNkDAvoOF7DROive6qfE15/Kf+OplxbNy31AyfWnCwLZOcmX6rAU3dSuDvRQPGJdO1BbjV5PvIWIwNs4au6vnB3k+LyqvCQ5UBbrUpafoR0LFU8MeCx/Z1vhd2hfouoqfokUZ17l0Lx4chQkfocs+/i3ymPGwpGayJM3fXTCm/Kuj9rcu6x/tfrJphxd6dKgMVsRPTv4F/AaQ8hV1Mq1aAMLghIm5aDKt2OmRudHSNbuZOuuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVTkBLfT+L1puJXnVg/gYPdNQkGs2nTjlLr2VOy9Fy0=;
 b=HJrxDewCE83TAMJ1+tLNpyF0cNP29RAkb69UQdLUyNMifJu5Sqi0+/KGGLjHK3s2TmBQoh/CfttnFYmbLAhlFx8hc8GRnurghkCM0GpznA7WHYu/kLflAEKoFPQMAkHaYCAJsvtceIg7Aw1+JR3QSzE8OWM1mMwNGbKKyPDjleFBtqxq6wH7o80cdRBR+apkdeZaHi4eWkaaOD/l3MGOgEVs4mL0mysjn+PCt38KMbKfVFp2ceG9CHCHaFEZLhXn0XTsyURaMQFI91UWQ0lUGn7m+xcwO5YqphGLUCFN5SOfz7TgM+/dnve3QbgDZr9zkvbXOpwjoyoCc+WOVDM6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVTkBLfT+L1puJXnVg/gYPdNQkGs2nTjlLr2VOy9Fy0=;
 b=fmVmiLH+0inm49RV1Xq9bD98JQqMiYohRUj0MDYlbZBYtJHOmc0oVIK5yf1EEtC6COwk3TvrLwbm50kkkv31zkLXi+bWsdPNx6JElbjM6/uKii6AgCYXMzNEcAC61fxKNnIlwzhJ0qpZBYHhA+BFi50/sgXDcQHVg25xQi7/whY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7012.eurprd08.prod.outlook.com (2603:10a6:20b:34f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 09:07:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:07:56 +0000
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
To: Eric Blake <eblake@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
 <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
 <20210621185336.zslqpqusqng4ub2u@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <488e47db-e7af-5b18-2cee-8dd6abb81481@virtuozzo.com>
Date: Tue, 22 Jun 2021 12:07:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210621185336.zslqpqusqng4ub2u@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::11)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 09:07:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7817c8d0-6fd6-41d6-7e06-08d9355d39c6
X-MS-TrafficTypeDiagnostic: AS8PR08MB7012:
X-Microsoft-Antispam-PRVS: <AS8PR08MB701210B2B91F28B7F64FA083C1099@AS8PR08MB7012.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwPnXGv/ZRt3U/bYFoM+HspnW5OPQ70r7kJhKZVqtRZSLxZ1PEhK6f+HgeMNt9ZJjYYeQxIfsjJagHJyYei8cekGd3iqiF0RbywYxDs3f4HDv9GCJIV8GEoSy2R1TTAFiU//QtvUYlOtMnCYTeV1OgR7wNt1H7ZtIvAhyQ9MyM7cUpG7ATZwrKiY/V3Az7qrm1y+asfsPRDoLSMgFXgrTSom4Un57aADWq2yFWtEXZdI45V1ZjJtnIfoHhcgvRDpr/eualAzdf+lPKUkmR3qIMp1BVKNgBx+6kt+dwi6bAKgliXEaGbkUD9W1mpkrIz6HgrCNfBmUWZWtHFwZ0v9Z64bQIFRlGAa4jRvp3hw6CN7c45QeauQLuIFSchKCmJqoYHoh4RbHTdDMzbR1huHcgbYM2ib8ibwm0z7X7IaNkEntZF5COipTilzMGxfS0Zn4HCshHpaE5+ikIBgrmaSK8FNOvtugmq6KVROvhGpfjOtoR0yffUbeEgzPyM6w2LUq5nvxYy3yvnGgUiPDOar45J02ANeD+ZgFwrXTBQZA1Ypde9MC9v8jVgl7hvC7ORe60NAkGZB84enTb51Ghu6lVzk+KEpT3pFEezgPbhbnFb+QrK8cQ8ymfWkuBSXUCWQbURe6kz1B1qGRsaiu6N0rqzMZiprtX6S4CayIsO8+x2+63RQtigTOTa6+b1Od5LwtKnwRFjMmWnknkR7PorN83ezDUTmtzkcamzGpoQOLJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39830400003)(376002)(396003)(366004)(16526019)(2616005)(186003)(316002)(16576012)(26005)(5660300002)(52116002)(956004)(8676002)(36756003)(6666004)(54906003)(83380400001)(4326008)(66476007)(38100700002)(38350700002)(6916009)(66556008)(8936002)(2906002)(31696002)(86362001)(66946007)(6486002)(31686004)(478600001)(2304002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmxYME4wSHY5eEt6RkN6ZEEwajA3bDg0MnZpRkxTellpWCtyZmIrclZGUGxZ?=
 =?utf-8?B?blVCRnNIVFcrT2M5RkpTTDI0djBIdzBzSjVzZXIwd1dGNm9YOUNrUmdvZ2Rn?=
 =?utf-8?B?aHczRGxjd1JkaVJmd0JEbnJ4ME1PbVg1cDlNNHpHWncxeU81c0xLU0tmRWV5?=
 =?utf-8?B?bkRSdURicHNYTnlNQkFTQXFsVnFtTWJTcU55YldqUHR0QUdYR3Y2cmZHSHI3?=
 =?utf-8?B?eldDTWlEb3N1M2JodnBPeUNQTnN1VE9PWnBjSnMwQmZEYWFHMjB0dVAyKzE4?=
 =?utf-8?B?SHZwV0VKT0ZoblUzZmdUZ2FaQnZtalNsNm5jOWVtSHEvU3BqK2pJL3hjakcy?=
 =?utf-8?B?MXFHYko5cnJoK0RDMTJWTFE0dStRVWptVzlkcnNnNHJWbm1ySjdKSGI1cXVn?=
 =?utf-8?B?TXdPZjRNTlNtaC9QcXNteGE3REJ0d2twZCtaTG5rR1kzSlFYb09pcjNoVm1K?=
 =?utf-8?B?dXdOajlkVXh4KzlEV21YQytxWXFXMG4wZlNKMmRSMWE0STFHdnNsUkpVQkxG?=
 =?utf-8?B?aHFycFl5ZUpoWXYrVXZXNWFIYXprV2huRDdLUjhmWmlPOFoyZW5hL3RKMEE5?=
 =?utf-8?B?WHR3Y2RjcjZ5QmVkRmgweTVVVHBlY0t5bm8reVY1NjhBWEgyTTlNN1JlYXBQ?=
 =?utf-8?B?eHNOT3JWRXR3cXlML2pQSCtXMWJmZytUMEw0Zjg0cHdVQloxY24yNWxWOVVo?=
 =?utf-8?B?L2dyOTZUT2dYN1Q3Y0h2R0hPbnQ3YXhNQlJCOUxPeDNsZnMyZmVBNXg0Y1Jx?=
 =?utf-8?B?VlZ1eHl4NHluK3Y4RTZMYjdWUzBYRjA2R1M5ZGpTczA5UDN0L3pLdHdBaHdY?=
 =?utf-8?B?b2RBR05MMkhzVjR5WjJNbjVBOWNLK0RmaDhrMG1kUDkyRWNmRm5CWjc5SkhY?=
 =?utf-8?B?SmJRMzdyRjNzeUxpazJLQytWVWxJSEQ5UmNRNVY1YkpOdTQxeWtXeDlKQVQ2?=
 =?utf-8?B?QmVxWWtEa3dvMzVYL3N0T3BPczg2Z1p0RDg4SXVZN0hqdXhMZExkL2tHaFAx?=
 =?utf-8?B?MGw4ZTRkbjllOGREYm5YR25CcHpSbDlnbWE3RHFXa3JobWJPUXl5bFpoaFRT?=
 =?utf-8?B?K3h6UndsNnkwWkFBcWhlRlVDWndrUWJDRXZMOTl2bWdSZ1h2cXViQUdwbnBK?=
 =?utf-8?B?OGtYblVNUFhMRzRwRnR6TUd2KzNVN2xFdDFZWWJQOXpUQllsaGF5b1ZhcmRx?=
 =?utf-8?B?SytsQXdpeVdXeEF1c3VsT3NiT1ZCbk1oZ2N4K2JLRzJrbFJCV05zNlJNbk1E?=
 =?utf-8?B?NERmUEhDQnJPdFRDSzkyVmhUcU8rL2lUVmRkNHpUQmRnTzVEdWpDL1ZkZGFF?=
 =?utf-8?B?U01ISmtRRDNUQ0hjMUxobFVNODZ2TTVxLzJHb1Eza2RBYTN2Q3N3bHBOY3NV?=
 =?utf-8?B?Z2dqaWhYb1hRam1KdCt4T3BuYTBubGYwQWFBTmc2aXdRZlpNcTFKQ1Avd1F2?=
 =?utf-8?B?Z0FaWlNwVmZkYUNEN1NJZmk1aXB4UkZaQkhjUVhlT1p4Qmt2U3FyTFltYnU2?=
 =?utf-8?B?QlRlbStiSWV4aklHOVFJdTR0K1R4WHRJYjRIYTdqK0dWa2lQVHF0SGxhZjE4?=
 =?utf-8?B?ZmQwNTkvV1lhVEJJYXhjU0pOMEpicy94eWFWVlBPcnpMb3VGLzF3UVdGekYz?=
 =?utf-8?B?ZmdIbnNsbjJzOXkxYWpHaXhRby9KaG90NE5KWm5qK0Q4SlQwNkV2dUFoQkVH?=
 =?utf-8?B?bEJ6cnRRSk9vTktPV1ZSTyt4U3R5MlpCb2VDSWp1ckhPT0tLWW5VTzhQdVht?=
 =?utf-8?Q?KjPkzbw6kx+XGIowkdok+rNUfmRSkILf4bq84Hl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7817c8d0-6fd6-41d6-7e06-08d9355d39c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:07:56.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pM+Y1wHhOwIa3sJXwtngzLS/5NvamIDinMtQsIn2tUvIzEKuZlNyY8s/6/4/EaBi8N5LkxC+ro2aLK4TQMPjOiWUFpm3TODM7HeXm+dxiRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7012
Received-SPF: pass client-ip=40.107.22.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

21.06.2021 21:53, Eric Blake wrote:
> On Sat, Jun 19, 2021 at 01:53:24PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> +++ b/block/nbd.c
>>> @@ -1702,7 +1702,7 @@ static int coroutine_fn nbd_client_co_block_status(
>>>            .type = NBD_CMD_BLOCK_STATUS,
>>>            .from = offset,
>>>            .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
>>> -                   MIN(bytes, s->info.size - offset)),
>>> +                   s->info.size - offset),
>>>            .flags = NBD_CMD_FLAG_REQ_ONE,
>>>        };
>>>
>>
>> Hmm..
>>
>> I don't that this change is correct. In contrast with file-posix you don't get extra information for free, you just make a larger request. This means that server will have to do more work.
> 
> Not necessarily.  The fact that we have passed NBD_CMD_FLAG_REQ_ONE
> means that the server is still only allowed to give us one extent in
> its answer, and that it may not give us information beyond the length
> we requested.  You are right that if we lose the REQ_ONE flag we may
> result in the server doing more work to provide us additional extents
> that we will then be ignoring because we aren't yet set up for
> avoiding REQ_ONE.  Fixing that is a longer-term goal.  But in the
> short term, I see no harm in giving a larger length to the server with
> REQ_ONE.
> 
>>
>> (look at blockstatus_to_extents, it calls bdrv_block_status_above in a loop).
>>
>> For example, assume that nbd export is a qcow2 image with all clusters allocated. With this change, nbd server will loop through the whole qcow2 image, load all L2 tables to return big allocated extent.
> 
> No, the server is allowed to reply with less length than our request,
> and that is particularly true if the server does NOT have free access
> to the full length of our request.  In the case of qcow2, since
> bdrv_block_status is (by current design) clamped at cluster
> boundaries, requesting a 4G length will NOT increase the amount of the
> server response any further than the first cluster boundary (that is,
> the point where the server no longer has free access to status without
> loading another cluster of L2 entries).

No. No matter where bdrv_block_status_above is clamped. If the whole disk is allocated, blockstatus_to_extents() in nbd/server.c will loop through the whole requested range and merge all the information into one extent. This doesn't violate NBD_CMD_FLAG_REQ_ONE: we have one extent on output and don't go beyound the length. It's valid for the server to try to satisfy as much as possible of request, and blockstatus_to_extents works in this way currently.

Remember that nbd_extent_array_add() can merge new extent to the previous if it has the same type.

> 
>>
>> So, only server can decide, could it add some extra free information to request or not. But unfortunately NBD_CMD_FLAG_REQ_ONE doesn't allow it.
> 
> What the flag prohibits is the server giving us more information than
> the length we requested.  But this patch is increasing our request
> length for the case where the server CAN give us more information than
> we need locally, on the hopes that even though the server can only
> reply with one extent, we aren't wasting as many network
> back-and-forth trips when a larger request would have worked.
> 


-- 
Best regards,
Vladimir

