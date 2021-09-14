Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14D40B305
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:28:04 +0200 (CEST)
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQALr-0006cR-SS
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ9cU-0007lO-4r; Tue, 14 Sep 2021 10:41:10 -0400
Received: from mail-eopbgr130099.outbound.protection.outlook.com
 ([40.107.13.99]:61056 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ9cP-0000wl-KS; Tue, 14 Sep 2021 10:41:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp6eJCYI3KWpP9ND4mTpJ4yX2l4VH6SSfgpGd5N+TaaCi345mdFmx02ksg+/YxPjx8bXjKyj3CSkI4NIVKx8ySSkvZqALETso63hTB7JXSqPPnIgEd2WjH38KITSPBIOOrJrOiOxmc3euAIcZuZyxyv+CGlJSdJtbLpd0bq7/Z4jRi41Smxw4czHjxxURd3RrWRusVTbNiyoVwU/CY9glEYHhwWT9B0TERAM5f4kVGLszKASaeG2Y9BlyWZ/gpyp1yKpEpXCcKWI0q1q3vOuF0+8/dgEbDnePLLCN/KLoRaMzcx5UppoIKiu/6+SPojqC7aCdGkc/wbtdJeLhHLQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=u10KgJ3XVcdB64QUnwHkmgNNEjFbjPYz4+x4suiFKDU=;
 b=gCTd3J0AbHRmcN98/TktYjMQ2jxGTYEfMxJWwy4u2uLeFIDRseTU/YtGSccSFYDPerp1vvh/yn0XEd+N71Sj9KpqTDjlLhN2INVJNovQrUGXUjDCEs0ApLh9hSC9b5oXPsewJUhrhlLJlRi902NE9DguzoWGliSsDsybhyki0ytHfBwOKFN5O+WG+GVn4kXJBa0we3Gu6TKmGY8zagsQX5k5pXA2OOavBwfP9pSSsLXB7sP7fqV68BN5QRL3+yfL4Xm3f5sb0j50z0FhgSO2gFCBtPq6yHaYJ6JWWbMcZZHyr7zhtT2f2G1WVHk8fNtqkCONaMyGLD0mYqtlwF4AoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u10KgJ3XVcdB64QUnwHkmgNNEjFbjPYz4+x4suiFKDU=;
 b=hThoEvVyFzWv/bHO3B4UooG2hJ+ltuPg08r9KK91kpzKSMNqRe5qQGAHEue/gAUc51IUripJ6VCgF8CWRxsgOgKQgxFPmqRXlvGybSwoi77mCd07f/3vphjtrdMJREDO5pNmhpRb6R67Wg1NE3P9svPtuRhLA5id4DmQoZTg/2E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 14:41:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 14:41:01 +0000
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, eblake@redhat.com
References: <20210913151936.392705-1-rjones@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
Date: Tue, 14 Sep 2021 17:40:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210913151936.392705-1-rjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Tue, 14 Sep 2021 14:41:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2126c138-47eb-4c51-3c74-08d9778dabfc
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17144DDCC3771AF9F555544FC1DA9@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdUe3ncieTnCC+Uhw2SlwTyJBTxjL5tu4P6WzU9J+hZ6OK3xj9dDGjGcuVoIygriNHbctX+kyaiMOBlTCgbGnEXyk2rp1VSZc+IC5hokM9kY7QK4t4JFM5k27VSx29GsIVDtLsYsusAtx3xEZtRuF8SyUNJ9lWf9QiYZGNvbU6mqvvpULZ+P33vIC3j8GSw9ndmKC/6yX4m+JGEHMmLYa7lkG5dgiWv97b13XY8wjhbyw8a364w/LtH5c2lNALe29+frYBMcL1h1ZfCGqDq3Ia+IsUKZDFB2O7uePuvaon3v9efP+tkPal3S5WK7Yl1xOEYzKlmwIJouXuX5HoiQkviHDt8dl6OlcYgAB+432LuU95ZC5mBlc42APPKAQSGIYRGH1jJH+nnJrkDTaoaLazTPipjWlU5h+h3VOLFs2kNf/pgF/qM17IFw5QcoqgLpbjSXu89NUMuSKXix6tM8+xFQRcs0l5KLpELBTMN1DAGSFeLWUyP5DgYjbLOLGgMVk4Hi1LYPDzcqHeKw6xZQGvfCY/L+sjedcqcfKG7AEnZJmLxONuO94zJa0mu7++O355UHEAphcLsV5zXCNb9PosC0J5ta43QBZI6r2Cm+JofylvTTIfnLrr5KluxDQq5zq+FnsJBCEufpnf7HLczaw050be0Vn9HSCo5RivKuXNoCWAOFzF0DpQRfFgNSqkzxVhNoRIZ2iECkxMirO2iDjc9Xd3nneZoZRPuQD9h+tUMKiqy4aOWvYeYoH1VMPPz87CP7CFvLA7HbcJeM/av6CdDlBNgd5+w0cGM8AXp9rEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(83380400001)(508600001)(316002)(86362001)(16576012)(31696002)(6486002)(36756003)(4326008)(66476007)(31686004)(2906002)(66946007)(38100700002)(186003)(8676002)(66556008)(38350700002)(5660300002)(956004)(2616005)(26005)(52116002)(33290500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFiL3ZIVW9YRTFZR0JxWjEzN1ZUQmFqTm45RXRZcXpiLzd1N0xXa0xBcGlP?=
 =?utf-8?B?alF6OEtzbFF5L1ZkWmhYKzRqMWNUQ2kvMXkyemhtYnZWL3dYazJ6cTM4U0hz?=
 =?utf-8?B?WjI2bG9aR2xFdW1yb0ZNVkFhMzhKM2tPQ3JzTGk5aWY4L2tRdTBNdWxuWkxi?=
 =?utf-8?B?OEtqSnlIL1d2NG1WTkVxVE5FbmEyYmVuSHkyTk90Z0dObEVTQjhBNFpsYlRU?=
 =?utf-8?B?ZEEvU0tJdUxBcnJKZzZUYllYYmJSQSs5YlBJM2ZzL0xNWlUvZkg4NVluM3Vp?=
 =?utf-8?B?KzZWaG9Rakt3eU5jOFFBeXBVNXk3aERrR3BSVTFyVXZLNHRiZkJ5cHhWS2VP?=
 =?utf-8?B?OVY5d0FDbDFjcERxRTVKdncwdmUycE1hcERxbU0rNnlpRkcvTExJT1ZTYkhn?=
 =?utf-8?B?Wnp1SmpldVdKeDBZbC9Hd0pCQnFnc1RiQjRvZVdIelE0RlRJU2VmNmhiT2Jl?=
 =?utf-8?B?M2pVU0Q4bXZoUVozdHpIMUkvVFlXQlpTZXBhaDZlR0VzN1dNdjE1eGV0ajEz?=
 =?utf-8?B?dG5tUnlrUzdoSTlGaFpzRkw4ZVBCdkZBSlkwZkJTcmdQazJnMDdJWk5ySFE5?=
 =?utf-8?B?OEVVSHlpTlFERTFZV1M1REYzdXlGaDBxUTVadk4waUV0R2NPa2tVWUhnWjlO?=
 =?utf-8?B?Q2JTT1M4ZG1hRVQvOFE2V3FGclNoT3AzOTFiUGVNVHNNdnM2ZHkzT0ZBdzJ5?=
 =?utf-8?B?UmNNd29CeFJoV1pSZDhmazZhOU14YXhUdHU0Q21scXpoOXZ5Qlc3RVcwSi9S?=
 =?utf-8?B?MGk5N1pVeHB6OVAxWmdybTdTSFIwR3BXanpvYjhPdjF2NlRhZWxPeUJKL1JN?=
 =?utf-8?B?eElyMUUzOFFJTUppRzFXZTFtRExrc0Q4NDhwYlpqdm9TbU5KUEdUeDRCL1Ba?=
 =?utf-8?B?OE1OSnF3QlNzNCsvTkRtNlpwWmRkSi9DRU5SYjBrTWRaR09ZOHpoNmp1V0Ey?=
 =?utf-8?B?NGNqellFQUE3Q3RVSVEwUjdGRjVHUTQxSVgxcEwrSFlZNWNLRjN6ZzIwcVJu?=
 =?utf-8?B?cFZxOWU5L1g3dzNvajJFeUFLZGw5YXBwKzFiN2ExWjJ1ZVZBSWM0Z2xmTlZ5?=
 =?utf-8?B?amZLd01ZYkVQZy8vRURISjJyQWxsYTVIOVpmOUgwWlo4VlJrT0cxNm5haDRH?=
 =?utf-8?B?dzVYd1NPN3F6RFNkY0J0cFJZQWhIa081bUpFN1FBazh1a1h0RDFSZ2Z3NVVI?=
 =?utf-8?B?SXJTQzNLMDhYSzkyTXY1T3cxTDc4YWdlejNTMkltRzFtOWRZdGRFbVAyMGRo?=
 =?utf-8?B?S2RGZ1ZZdnZZRllXMllPTFdIUG1PYm84aHFQaFJGUlFJVlVZQUJqK2drL24x?=
 =?utf-8?B?ZVNUSENkUnd4bGNRcjdtNzNOYTVvbDNpbHhXUlR4anYyMkJYTTdqVW9MNHVa?=
 =?utf-8?B?dUNMSGFUSGM5NXJwM2RKV0dIbER3U2ZFazIvOEZ5WUJaVVo2YVN5Z3lpSTNQ?=
 =?utf-8?B?ek1tMUZKNUZjVkVrVFN5VGFHK0NKeHQ4ZHRYeGlUblZVZC9wMDVFcWk5ZkdE?=
 =?utf-8?B?UGZvdzUrWWs0d2VKTGpkS25hYXRNaUJIN1BJaXNVYU9jeW1mazd5S0E1dGJx?=
 =?utf-8?B?RVNoekw5OVFMb3NDUlJyVm9NcUZhVWEzNVpVdjBuUll4a3ZRTVJUNmpyUCsw?=
 =?utf-8?B?TzhIekZ3b2h6Ukw4NnQvZlljeUl6UXZyaVcrdHVKZVFoZTZ6dHlqVThSa3pp?=
 =?utf-8?B?bC9la2FnNHpxNlVZMHFZT2ZtbG1wWk9wRHlJZU4yck9vOXVZTHFRajZwNlMx?=
 =?utf-8?Q?CGJkHChXk81icwG2sDqXsBCYbQgChzMJtPSfz1W?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2126c138-47eb-4c51-3c74-08d9778dabfc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 14:41:01.0478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpUKGgQSiXk3DgGwES34tBGe/CXwgaSgkBeSA4qG5rbZPLZRB02FHerzJbQNoT9g3T+mldYlm3ZRH4b6b1EfRjC9T+w8YABrwNJUwhsYOf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.13.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.09.2021 18:19, Richard W.M. Jones wrote:
> $ rm -f /tmp/sock /tmp/pid
> $ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
> $ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
> qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> $ killall qemu-nbd
> 
> nbdsh is abruptly dropping the NBD connection here which is a valid
> way to close the connection.  It seems unnecessary to print an error
> in this case so this commit suppresses it.
> 
> Note that if you call the nbdsh h.shutdown() method then the message
> was not printed:
> 
> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'

My personal opinion, is that this warning doesn't hurt in general. I think in production tools should gracefully shutdown any connection, and abrupt shutdown is a sign of something wrong - i.e., worth warning.

Shouldn't nbdsh do graceful shutdown by default?

> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   nbd/server.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 3927f7789d..e0a43802b2 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
>           ret = nbd_handle_request(client, &request, req->data, &local_err);
>       }
>       if (ret < 0) {
> -        error_prepend(&local_err, "Failed to send reply: ");
> +        if (errno != EPIPE) {

Both nbd_handle_request() and nbd_send_generic_reply() declares that they return -errno on failure in communication with client. I think, you should use ret here: if (ret != -EPIPE). It's safer: who knows, does errno really set on all error paths of called functions? If not, we may see here errno of some another previous operation.

> +            error_prepend(&local_err, "Failed to send reply: ");
> +        } else {
> +            error_free(local_err);
> +            local_err = NULL;
> +        }
>           goto disconnect;
>       }
>   
> 


-- 
Best regards,
Vladimir

