Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443253ADB95
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 22:08:15 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luhGI-00011T-BB
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 16:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luhF3-0000BI-GS; Sat, 19 Jun 2021 16:06:57 -0400
Received: from mail-eopbgr00121.outbound.protection.outlook.com
 ([40.107.0.121]:50310 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luhEx-0006Ng-BP; Sat, 19 Jun 2021 16:06:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD/N8mdMY9P5SqdJHdmM6TD1ImsFnGsZKNTNl0Za/lFF/+Plx5LCXGp+smp0cxpFYfjEjDMdZlAX2icOZSOu3D5B/RR2kJ/tN5ZC/jk16ZWY1nlHs1YedFtD+mVFdloq/1xNEohYCzQP3BchuWOE5G1PN6V/p72L+KyaG3nwPtHq7TslXmizg3sp9ae0nKtZNcCtdHnvSuK0+DLkzl3eA21tvTaNitmUWJMBJ/FS/X4gJ1nsNuCYQs/jls5RHPX4ukkWruu5T45no4Z6oo4oY5YbNENwPUx0mZziyIPGsan50gmdr+9V0FYK9vpcff4fS/9cK4QAK4kAX5j90tUfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CV0AVeREOe7gAS/Yd8q90jlrTPT1G3zJ+CwvroyQCQ=;
 b=eW+uj2JietfL9F7ZHMG1ScZza9wFLve2rqG8NvrR7w9+rnrTF3R8Lix0PfxaNrKyke/0/822hwlCy+4GOcMvitKRSdjCXixRidHiKK1H6mHx9PGeOYR4uQ7GA+V/+YOFjbVVylaeNHfuqcLEFc4Rh0N1YxpkLkUG4vs+mopZmHFcBALFEGE1uWvPh2Bzw0cZhtAl22BgMjgyvY+6W2ypk++Tu2QFq6G+wEjZt1Q5FekeNIMc1AxSjLQHlQFUYG/3wus39MRaHpl3+F4vGW/VjnInY+HnOAuHH9fYU/8gkMJkcGHHF5NoxpxCX3gJsrshYNdgvYjD0SmEY0Edrd928g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CV0AVeREOe7gAS/Yd8q90jlrTPT1G3zJ+CwvroyQCQ=;
 b=ujcxsunAUXcCUisLAGTC1/OANJBTxYuHLzgWEzf7by3K1b4y7/UaR+VpvB+IztCCz+9xTFcbqEyI5rGSpGeKQBL3HbHyTAIEBfzn0iEYSB79M/geqUwAelbgQLXmsPC9eXjfOgDgImIEmNGTLHiVfLk5dYHDGGGf4xUX3woI/Bs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Sat, 19 Jun
 2021 20:06:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 20:06:46 +0000
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
Date: Sat, 19 Jun 2021 23:06:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Sat, 19 Jun 2021 20:06:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd618d56-01a2-49bb-c151-08d9335dc417
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-Microsoft-Antispam-PRVS: <AM6PR08MB42142CDD645F9976BCCB5837C10C9@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWFr2VCd9cxWtjclT1Fyp/cJpzznH8K+Ix7zLmCFYa7OUzLQp2IFuP2WtwtAU5Coz1XXPtSgRyE5GnZvcMkjOWXiA+k23O51V2uk6vPn+lHivBTWEGo3ZU6P1oDn2Gg15JsS1C5tR+VFuoq1vKWYFa1eP78SsEte2rk3hu7NXg/IcKF6auDtgR2J+LiOL6ac91PIKfFdhbhm7znc99jdYZzbs+U0W1X/FrKu46BuYgqb9fSCNIgFwJ453JU2l/1pIBMIkHaql4PrbsRMfEC7/W2FquHimFkbxRkHnm4eoelLAcO+wxgX79BFI6Kkv6gq1WPoVCj8DuZigmcYLKwjtJlDG2/JbHCQs1V71MQSK4kOhBfijcb7uFZdPDZPYlGs9w68znzpqKUlfUgkKx3EvEa+2ppTcWfKiabEmN2SbV1zEQ9GQnUjFUci5GD0p3HzcGS4pRP/M/89CsPwZ0NjsNCEU83jmdLz8K4TyvrgLu50DFwa53vf7mblwiAiqFn8uwPhUL1zvkJn1qm9UtSOeqz7jJI7Ut4CM8bbgn0m+RE0ub2FN7udJ7p5mvmARXp0dJtEqqvmF6uerfp8/qX/vVUU/FiejKI9dyQIzZeHx1a9lcbjD9ILV9pbbyWemXMvBZKWw6SPIy2W3eoHyIfPRwDscSiFk/4+usu4nUqUsaFzS8eNeK5N7jm3EVI8t00L3fYZNHaN9eKrh0PnlS+blz66OrV1hBJtPSYT/SxAD6bxqrKgF34cJqcJCGJVF3QO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(346002)(376002)(366004)(136003)(16526019)(52116002)(186003)(36756003)(2906002)(956004)(5660300002)(31696002)(2616005)(26005)(6486002)(316002)(478600001)(4326008)(8676002)(54906003)(8936002)(31686004)(86362001)(83380400001)(38100700002)(38350700002)(16576012)(66476007)(66556008)(66946007)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MndHZDZwMW5QQW10RDdsMGViN2ZlbE5XUVpxc0NSVUJxREhXczNzSjVScUpE?=
 =?utf-8?B?VlliRnNmUVlEQmx3V0kvSzFOSE9zcGhSTjc2MkwvdmxncXM5QloyMWNDS24r?=
 =?utf-8?B?SHNFNmVoSkFkK2VTbFpVOWZVMG8wY0NZa2tJUnJFWHdJblV6YmVKUExtenY0?=
 =?utf-8?B?MUdiZDl2dGczV3lOQ3hoYWdhcW92L25DWWROWUdEeXhINlFUa2J6dXFnbmNm?=
 =?utf-8?B?QTcyUmhxa2FLei96WC9hMEtTaG1jZ0dROGsrS1Uza1QxeHpnSW9ZUmJaUXNm?=
 =?utf-8?B?Z0gvTXcraXYvNDNTZFMyTVlBak5MUXJBZ0dQWnBYaVNUZitPeWtFRk1mc2hj?=
 =?utf-8?B?L0Q1dXp4NHdFemswMnN1K3RkSGVaQmVCM1BuM2F4MXJmZGxuVElWNkVpaDRs?=
 =?utf-8?B?cEU2clFmeVhSOHZTbktBbzlVcmxqdldDUDNoOEcwL0o5UFY4VnFQa1BscWtI?=
 =?utf-8?B?MEdkeERiSjlpVWg5Ty9VK3VGNHZORC9lMHBFTVlsTm4yWU1WNXkwQTBpZldQ?=
 =?utf-8?B?d01DbEpkS1Q3UldiL1JISm54MS9WaXErRUJ4dzFhNkVjVWRVZy9nMndUVFZQ?=
 =?utf-8?B?YytyWnQ5Sko1bWEzMDRlVVhRdHYvbDB6a1U0WnhXMHFhL1cybVBuTkdhL1pQ?=
 =?utf-8?B?LzNJV09QMmFGL3FhSnlsR1BlaWJHcUsvcWY3MDJYTnF6cWk2TWIwY2RJekw4?=
 =?utf-8?B?UDVxSTVSTXJ0ZnJVaG1KRkpNcDhyNkIweUQ5QWh4QkJ5QWkydjFyMldCZGxk?=
 =?utf-8?B?YjR4MFk2Y0ppSlo3b0JvWVU5eVYwb2tEb1dEemlnRlczZjV1QnNRRitYakY4?=
 =?utf-8?B?UVVjNG5pN2JGWVJ5cFc4UHduQmRQWGV4MEhyZHBXNHNJQUJmMEpQU1lTanpm?=
 =?utf-8?B?eDdPbzFSTnlQa1owcGlkMWhIT1YxUlJJV1pHMHRWVkFXcHI2bmpqMDR4dkcr?=
 =?utf-8?B?c082ZGVGNGs4OWRaYjIraVJLU0RCa2kyRTJ3T2ZYZC9GTkRacktyRFR1UmFB?=
 =?utf-8?B?cG5kb2RxYXJreVI2LzBqR3RvMHRxdDRIQzIyWUVrOENWd0xKblBSaGhKN1Nv?=
 =?utf-8?B?VzhvOVVramVtUWtwRXBXL3NaRGp5MnJmOUkwRWptWlYrOHB1a1VvQ3hZcEhQ?=
 =?utf-8?B?SHROeWZOa1J1eDlxNjhvVmh1Y0xNdDNGM3ptTnlZRlB3TGVDbFo2V0w3dWNC?=
 =?utf-8?B?Vzd1ZW9UUC9EUjRsTVpuMmtTMWNjclF6dm9veFdLKzc1WGYweXJYeUhYWVBy?=
 =?utf-8?B?bG55WUU5YUIxMXFrVEpjNmZyUDhJaUhzbnV6VkhJOXZ6NWhMK0x1LzV1cGNR?=
 =?utf-8?B?ZVNNT1pIaHRyam0zb2RzekVHMlhIWVZPLzRDdjArc1dzbVJzaGo3Y1hmc3NL?=
 =?utf-8?B?citUMWkxQi8zc3lLVWlabVp5eTV6VXQ1ZnhpOEJDVnpIbEkybkQ1bjJXd1ZI?=
 =?utf-8?B?UDlqN0ppSVNVcEpoWFNVanZwMXZOVkFYTWFlR295Y2s1NmxzUmxwRk04THFT?=
 =?utf-8?B?K2JvWlpPUWIwY1Erbkx3RU9jNmw0WVpFNjBJTnI3RnNFRm0rc280YU91anBC?=
 =?utf-8?B?R1ZETnowY1VKb0NvNUVZYWFnUkxjTzNBVUtkbUVIcEJnNXExbDZQWXgxbFRJ?=
 =?utf-8?B?VDNWREhBMVJZdS9ram8zN1RiKzRFR1l6VVgxdXQzUVVUdHU2QmtjNGxmdmsz?=
 =?utf-8?B?NERLS0ZJYm50c3ZxSENmOFdEWVB6STByQnR2Vy9Ydnk5WG5OTU9Wb3NTTUNB?=
 =?utf-8?Q?Apw0low7M8LfH8bYHUnAS1z8Lj+GmT4ctJxoUqc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd618d56-01a2-49bb-c151-08d9335dc417
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 20:06:46.5248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fxdlG6gFxrrEHiqpCgTZ02w3vyIoBEuWCauujQF+cob+buI63NHf8Ld+EiJAhveCBKnI8/eU0rrE8iLjUW6cbi/kytBZh7OS6VgE+XJqC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=40.107.0.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> By adding acquire/release pairs, we ensure that .ret and .error_is_read
> fields are written by block_copy_dirty_clusters before .finished is true.

And that they are read by API user after .finished is true.

> 
> The atomic here are necessary because the fields are concurrently modified
> also outside coroutines.

To be honest, finished is modified only in coroutine. And read outside.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 6416929abd..5348e1f61b 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -53,14 +53,14 @@ typedef struct BlockCopyCallState {
>       Coroutine *co;
>   
>       /* State */
> -    bool finished;
> +    bool finished; /* atomic */

So, logic around finished:

Thread of block_copy does:
0. finished is false
1. tasks set ret and error_is_read
2. qatomic_store_release finished -> true
3. after that point ret and error_is_read are not modified

Other threads can:

- qatomic_read finished, just to check are we finished or not

- if finished, can read ret and error_is_read safely. If you not sure that block-copy finished, use qatomic_load_acquire() of finished first, to be sure that you read ret and error_is_read AFTER finished read and checked to be true.

>       QemuCoSleep sleep; /* TODO: protect API with a lock */
>   
>       /* To reference all call states from BlockCopyState */
>       QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* OUT parameters */
> -    bool cancelled;
> +    bool cancelled; /* atomic */

Logic around cancelled is simpler:

- false at start

- qatomic_read is allowed from any thread

- qatomic_write to true is allowed from any thread

- never write to false

Note that cancelling and finishing are racy. User can cancel block-copy that's already finished. We probably may improve change it, but I'm not sure that it worth doing. Still, maybe leave some comment in API documentation.

>       /* Fields protected by lock in BlockCopyState */
>       bool error_is_read;
>       int ret;
> @@ -650,7 +650,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>       assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
>   
> -    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
> +    while (bytes && aio_task_pool_status(aio) == 0 &&
> +           !qatomic_read(&call_state->cancelled)) {
>           BlockCopyTask *task;
>           int64_t status_bytes;
>   
> @@ -761,7 +762,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>       do {
>           ret = block_copy_dirty_clusters(call_state);
>   
> -        if (ret == 0 && !call_state->cancelled) {
> +        if (ret == 0 && !qatomic_read(&call_state->cancelled)) {
>               WITH_QEMU_LOCK_GUARD(&s->lock) {
>                   /*
>                    * Check that there is no task we still need to
> @@ -792,9 +793,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>            * 2. We have waited for some intersecting block-copy request
>            *    It may have failed and produced new dirty bits.
>            */
> -    } while (ret > 0 && !call_state->cancelled);
> +    } while (ret > 0 && !qatomic_read(&call_state->cancelled));
>   
> -    call_state->finished = true;
> +    qatomic_store_release(&call_state->finished, true);

so, all writes to ret and error_is_read are finished to this point.

>   
>       if (call_state->cb) {
>           call_state->cb(call_state->cb_opaque);
> @@ -857,35 +858,37 @@ void block_copy_call_free(BlockCopyCallState *call_state)
>           return;
>       }
>   
> -    assert(call_state->finished);
> +    assert(qatomic_load_acquire(&call_state->finished));

Here we don't need load_aquire, as we don't read other fields. qatomic_read is enough.

>       g_free(call_state);
>   }
>   
>   bool block_copy_call_finished(BlockCopyCallState *call_state)
>   {
> -    return call_state->finished;
> +    return qatomic_load_acquire(&call_state->finished);

and here

>   }
>   
>   bool block_copy_call_succeeded(BlockCopyCallState *call_state)
>   {
> -    return call_state->finished && !call_state->cancelled &&
> -        call_state->ret == 0;
> +    return qatomic_load_acquire(&call_state->finished) &&
> +           !qatomic_read(&call_state->cancelled) &&
> +           call_state->ret == 0;

Here qatomic_load_acquire() is reasonable: it protects read of ->ret

>   }
>   
>   bool block_copy_call_failed(BlockCopyCallState *call_state)
>   {
> -    return call_state->finished && !call_state->cancelled &&
> -        call_state->ret < 0;
> +    return qatomic_load_acquire(&call_state->finished) &&
> +           !qatomic_read(&call_state->cancelled) &&
> +           call_state->ret < 0;

Here reasonable.

>   }
>   
>   bool block_copy_call_cancelled(BlockCopyCallState *call_state)
>   {
> -    return call_state->cancelled;
> +    return qatomic_read(&call_state->cancelled);
>   }
>   
>   int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
>   {
> -    assert(call_state->finished);
> +    assert(qatomic_load_acquire(&call_state->finished));

Hmm. Here qatomic_load_acquire protects nothing (assertion will crash if not yet finished anyway). So, caller is double sure that block-copy is finished.

Also it's misleading: if we think that it do some protection, we are doing wrong thing: assertions may be simply compiled out, we can't rely on statements inside assert() to be executed.

So, let's use simple qatomic_read here too.

>       if (error_is_read) {
>           *error_is_read = call_state->error_is_read;
>       }
> @@ -894,7 +897,7 @@ int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
>   
>   void block_copy_call_cancel(BlockCopyCallState *call_state)
>   {
> -    call_state->cancelled = true;
> +    qatomic_set(&call_state->cancelled, true);
>       block_copy_kick(call_state);
>   }
>   
> 

Uhh :)

Ok, that looks close too. Or in other words, I feel that I have good enough understanding of all the thread-safe logic that you have implemented :)

-- 
Best regards,
Vladimir

