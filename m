Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06B469569
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:06:33 +0100 (CET)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muClL-0007Nl-2N
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muCil-0005KN-6i; Mon, 06 Dec 2021 07:03:51 -0500
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:52641 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muCii-0000AC-Fw; Mon, 06 Dec 2021 07:03:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8pAmt+IoCbZ26Mx2s/NHT/U90/KfjrbWyCShf5vaCmBMNxaXTzXHCLkQ7YKEfRtCQaUAmC8PZemu2bceUR5yQWHglgkTA3NvT9rxj+n6eLuddTy36g0Z06pRalE3zR1agAMrTv2grPME/PBFse5EuBF6VZkUT9hI8PmNpuvviQH+hqaL+DuRSk1khgllAPAlP+qLC12LBQeHapjruXSgwPg3PM+Pbm06My8OjPFe7//B2boxKe40RYvyXMlLTsx+J/sMfILiBa9SHT5XE+Fplk+HBM8jU0pQ3nDeia+/o3SAolGwXtFab9LK3bj/LbhsD2xAJu7LllheaFYXRdsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXlG8KqLwVoLOFfCWP5Vx+sCaG/wFmKWZkv+GAf5dPY=;
 b=KcYQiPvAcjQ8LzuKnMssU6TApABqPnwLBkcnI3/9k54ZBCJeS+BPtPKSj6sG+9QBFH4mM9DHnkPGhLi+53Ieewhw6v7tapzmMftSJcouyYvDgAUkCZHWkZWFzlB5UhchnOZ1NX4MeXp7GcCrfWUpjVKNKfC1xPi4XrOOEcdvxUtVCxS+RDW6LRZhXD0Zm+e7uX+WXnGXYtyU+SMNkLIZAFGVleTeGQ2jY1Wpz9fpbpdXpGqVM47DRDkYx2DYOUni5BjhzVbr0jHUCyGkQdTm/edxRepTHwD1/Z/KtZUC8Vb+ibpjALOtL/NCOGbxZcIhOVi1k6i0ExLf7NgTzW3Apw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXlG8KqLwVoLOFfCWP5Vx+sCaG/wFmKWZkv+GAf5dPY=;
 b=WvkZTD4b7G81lucStk4rMyYwcvDofSOYEMV7WZmJXmC17GrxHgvaIapawhG4UCFhzUWqR7VvhvbStWh19FdUmPNSQBGKSUaNPNYFDh3qFHYWiDwus1/YmERRZskatsaI92Vq1R0l1TMlR3uA3MIy61cmPe4Vfx5/gBHRM0agcM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6966.eurprd08.prod.outlook.com (2603:10a6:20b:415::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 6 Dec
 2021 12:03:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 12:03:44 +0000
Message-ID: <9839e5bf-242a-8337-dbe4-bbd814cfc5b5@virtuozzo.com>
Date: Mon, 6 Dec 2021 15:03:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 01/14] nbd/server: Minor cleanups
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nsoffer@redhat.com
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
 <20211203231539.3900865-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203231539.3900865-2-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 12:03:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e18b9407-254d-44c6-9d86-08d9b8b072c3
X-MS-TrafficTypeDiagnostic: AM9PR08MB6966:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6966877D6858B88D65502F48C16D9@AM9PR08MB6966.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YO54g4z/m0NVu3siXt9MPL4qtWDyp2ECh9gldy+Kai8CudeTEndG0k/+Bd4my7barPU+6IjCvZGi61WTvOvJv0SY1jdOCCZ44/yGIrvn7MqiMfGQBawe5kGz4utv6Z/szxwzm4WrMqr1OKEJ/emk5jxoGg8kP7cQjRoH0EoG+mtM9xMpZa3sdpILM5rbTbkg6JgD0AszquNxRWh479l7FzuUmiB1VBXc/J36T+Cj+JEH8KIqsBp3XdXhFJ9ss/mQNGTgY+zerWx2I63s/sneZhuYfnjZpwYN/zw1HKmmyNIvJBPp4qTgWvRO5xJkidVh6T/hNx9z5p2iM/tIgv1GPUPjGMqOO19u0DqwCyzbzVy5ZlCU0fljMUSYFPqtY+yeqJQY3lsLU/kqV1PUjgdGH//p+PrjF/bFKsPpB4cSe23pmUN1/LqVOD/8J0VsGgMWrLS1UWb6MVgtog4aGv+E1JlPDmIsNTKj5KY7LLuqLOodaHu4F4dqQpV4RoWgrLtstmpOG5kJ6q9WxKcStV8J/8T7Oi1fojXqCMA1bBjR8e5HYb+1ihj4qBj5KeHz3BzQ/UUC+vGcQzCJJ9Qkfc3AMFGewUTO9G1nnR6A443Vj5VvNar5S+mXnRrZfDV8mY6oTPrPkWACZViWCCI4kfgihtUOpZH/Gxxf1XcG+jVcz14o8NiYIMXgx750IBnMrfnPeVKo6KlLMFJ0UKpUyG6Qhi0k7PqmLZGoLmfVpn49RjDNMyDLz1erB073RBtphmJI0Thaui5dzqmBUdOrOIjVvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(8676002)(186003)(38350700002)(31686004)(83380400001)(36756003)(31696002)(8936002)(26005)(16576012)(52116002)(66946007)(86362001)(956004)(316002)(66556008)(5660300002)(2616005)(38100700002)(4326008)(508600001)(2906002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V01sQktYZTNMSHlSbGZWb1dwOXBNeFRBS21CcmorWk1SQWplZlJhS2w2Nmhq?=
 =?utf-8?B?L2tpajJ4a3FNQ3BQbnpJWVdsVzhCRlpWSVVMckdMUkhMTG1ha1BvZWlQOWJO?=
 =?utf-8?B?YmxRQzBKOUxiQmRRMkVSQmxPaE9LbFIwTVhBYUdNZHQrTGlCL05ROXFUc1hr?=
 =?utf-8?B?VzNsM0VXRDhGc3NpaUdyL2Q2MmpNajVRQ2hEMzUzUXVIMjJtU1EzL1VmR2Ux?=
 =?utf-8?B?TDJabk9hZEROVHF0VHFvWnRVZnVWcTl1RjEzeUlNVGlZbzBLRXFIdW14WmJ3?=
 =?utf-8?B?NEU3MkducW5hV01hTHpQdXVvNWlGZXBzZm91d0tJZEphVzNEY1lpMVFSMXhs?=
 =?utf-8?B?VzVXNXoraWl3dVFtQ1hYRUFTQUc2THRYVHd6aStNb25TV3QrdnZmNG9sTzN5?=
 =?utf-8?B?N3F2NmJqRVNhbDB3WTFnVjlHUCtHRUxKc1BiSTVJTUI0YTFYbmEwZUdTbkRC?=
 =?utf-8?B?Z1F0VVV0d0dBVXUxK0daVlk0VEVBM05aS2tPeGdpcUlMaEEzS0JqeS9Sb1FM?=
 =?utf-8?B?a0ltYlNXaDN5R2djN2JtVS81S0ZoREtHQVNQZUhYeDdkZWVObXhrVk54QU0x?=
 =?utf-8?B?aXhHMFlvakEwdGhpVTNvQkR2ZW1wNEhzY2hWNHVFRVdlcFU1bitHWlV6bERa?=
 =?utf-8?B?aUU3RVZ2N1RRc0xER21WK1lqVUZFMThpMFp1QUhZVmRyQ25VNUJJMm85ZXV6?=
 =?utf-8?B?azlwSW1RTVQ0dGFEQWhMckxTWmJyTHBjaWF3OFp5Q2NBOGl3c0JWUC9uUk9x?=
 =?utf-8?B?ZTVWRTV2RFZ4a1AwSmlLbjVFVXZteFQ5MEJPM2lvRG9mZ3JhQTVzRlVFVWRm?=
 =?utf-8?B?bjVxRHB2NndqMlpTd2JJMlZOYjN2RUtoSXFkeTFFOGhNZU1RVWlwYXBxcy96?=
 =?utf-8?B?Y012RXJwbTRyeUNmdnNjVDVhZFltMUNmQVRTNXBnS1VBL3FrOGIzdGdpcjlI?=
 =?utf-8?B?N05uY3Q1Q0JhR0JTMEp6djBYQUR2Um9IUy9OVXhUSG5CV0tjbHUxSThBMXEw?=
 =?utf-8?B?MWxQemdmcFFKQjNMNUt0eDNnakFjOXhyV2ZsWVpNSlhsWmJkNWxmbkg3QTJS?=
 =?utf-8?B?SDJNYmd3SlYrWEVsR1V3bDE0RnJHRjJrVGx1WldsVEdxUHIrbjFueW5aYmRP?=
 =?utf-8?B?akFabW5HQ1doZGRqbjhMTmNIQU9XVm1qMzVRSXQ3T3FzSXR1VXVFQjNpQVF2?=
 =?utf-8?B?YkVzZ2lZK2Y4SXBpcmNtRUNSaXdZTnpsb0hXYkszSkdnTnB3cSsrNklhRnl1?=
 =?utf-8?B?dTBxcWxlZ0N3eVlhTTJzVGY1T3A3QithbXFNaGhVRDlBbUREUFF2STNZUUdR?=
 =?utf-8?B?M2E5WlRVZzRPVXFwbnl6emNzV2FCMTNPdmFXUERuMlBVUm0rTGM4RGh6MC9F?=
 =?utf-8?B?T0J0MlpNSmh6YllEdEJ4Y0RvdlpGMUhQemE4SmgzS1pJUnhHTFdJSlk2QTVq?=
 =?utf-8?B?N0NpZEFmWXNYWEhZZC9vakVIc1grd2FZd3ZJUHN2b3p2OHIrVjQwYjZzQk8x?=
 =?utf-8?B?R3pXREprOEJ3THBJVUdRSkpOOWZicVNFTGpUUFAzZk9rQU41dzJTaTNNNjQv?=
 =?utf-8?B?OGk5ZkwzdmRQTEY3K2Y4YWRxaWl0cGVtZFpCSXRzK1NkZytCbzdVNDBLOEd6?=
 =?utf-8?B?a2lBQ0Y1RjZkbHFyZk5uNERaMTJBblY1bGtOZXVZZDBXMGFiU1VzMGNyRUt4?=
 =?utf-8?B?UHcyL0kvZFFFcWNhNWF2ZDU3OFdOaUdzK014ZElhYnpVWXhja09ZL1VIVnRH?=
 =?utf-8?B?K0ptN25XdHN6N05vakxoNEVuRmVLMUtQckJCMVRrd0htZm9HS3NIUkZxNVQr?=
 =?utf-8?B?eGRzNnREN1Q5MjFSa21rQW9jSkN3cmRDZjVUTWJXZ0R1UUpuS3BhdFA4ajcy?=
 =?utf-8?B?Z2x3NE9hUjZMcjJNd2RTcGZGQzZaWVJiUVNuVGQ2SDdRa1RoNWlvaHNLb09M?=
 =?utf-8?B?Q3JRNUE2RGJaZUJTTVRxS0JVWHE4aUtPb3RFK25vT2tQbStjMlFISURPZGM2?=
 =?utf-8?B?czNGd0lnUlF4TTRhQ0s0Q3dWTDBnT2lnaUtJZ3Rxd1lDazlKUGVuUEZEMHZQ?=
 =?utf-8?B?a1h1S2E3cG5IbVBiZUJrQ29vbjl0RTFxZjNlUTRWNEZoUy9JOE53MHdYY2NV?=
 =?utf-8?B?dzNyd3lTTi9LK3BISFBzRnkwTHJITGFkTmNEUlRFcFExeG5oajRuRFpRZ2hU?=
 =?utf-8?B?RGdSL2dmbElCNGF0b1NkaWpXeTBQSU1ybHNpdkxoOTlxNkNiOEVhT0hrUkhx?=
 =?utf-8?B?WDZTVWM5eXVhcVkwdmRnUHM2emZnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18b9407-254d-44c6-9d86-08d9b8b072c3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:03:44.0252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5O+pj34jd0d+NaqZO7qzooDR5CWwXCqNu3KyZzQYxid8krcnSOw7tAdUqOZ55D6vU6sevXIULZIor/y9e45Z3KDfiuqjfB3LvxiiACaLHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6966
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.12.2021 02:15, Eric Blake wrote:
> Spelling fixes, grammar improvements and consistent spacing, noticed
> while preparing other patches in this file.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   nbd/server.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 4630dd732250..f302e1cbb03e 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2085,11 +2085,10 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
>    * Add extent to NBDExtentArray. If extent can't be added (no available space),
>    * return -1.
>    * For safety, when returning -1 for the first time, .can_add is set to false,
> - * further call to nbd_extent_array_add() will crash.
> - * (to avoid the situation, when after failing to add an extent (returned -1),
> - * user miss this failure and add another extent, which is successfully added
> - * (array is full, but new extent may be squashed into the last one), then we
> - * have invalid array with skipped extent)
> + * and further calls to nbd_extent_array_add() will crash.
> + * (this avoids the situation where a caller ignores failure to add one extent,
> + * where adding another extent that would squash into the last array entry
> + * would result in an incorrect range reported to the client)
>    */
>   static int nbd_extent_array_add(NBDExtentArray *ea,
>                                   uint32_t length, uint32_t flags)
> @@ -2288,7 +2287,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
>       assert(client->recv_coroutine == qemu_coroutine_self());
>       ret = nbd_receive_request(client, request, errp);
>       if (ret < 0) {
> -        return  ret;
> +        return ret;
>       }
> 
>       trace_nbd_co_receive_request_decode_type(request->handle, request->type,
> @@ -2648,7 +2647,7 @@ static coroutine_fn void nbd_trip(void *opaque)
>       }
> 
>       if (ret < 0) {
> -        /* It wans't -EIO, so, according to nbd_co_receive_request()
> +        /* It wasn't -EIO, so, according to nbd_co_receive_request()
>            * semantics, we should return the error to the client. */
>           Error *export_err = local_err;
> 


-- 
Best regards,
Vladimir

