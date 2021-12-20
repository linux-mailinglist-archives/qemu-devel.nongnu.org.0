Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331BE47B09F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:49:28 +0100 (CET)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKul-0005Vq-Br
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKGo-0005Pu-7t
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:08:16 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:52961 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKGS-000088-TU
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:07:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt2OY9IxTX5FP3C+Ct+SJ/u+Ehd/NNCAVEZkx8/avrVAAXBIj5K11cbRL0z51XTy/LZuHAKylXRxvW88VXYJzU3OGeU/cq4qXeLV90fim/WR6J2eyil4XuAwR3PHxCKe6gWpUSJzFf3tpz8GJHWnhpzYrilcwWm1/htp8ODP864ginqevkFaI/CIIg3EbP3OJMKQeM1F/iqiWME6aTpeFq1omjru6B7cyftxHrcsCmxOnzlk6sDumrqm9WAvL8oUToZan8yQWMGEay0wg2LNmA8WVYadrBnW7BsnnISuUPUxg9N4NCYuytsQFkc0wlHZgIvwCmmlWGjPRBZL0HJ7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttLZYGeNu23GwO+wELjqipKSdaNZF6LGvOFsXk3FA6o=;
 b=iKr5UR1B12unwPOyRcPdTRFlNLpeDzlTCEpyon46AaABUYmsGsnvPxf7RNT7O65eHSIbHFZa+bQktJvJLHXtdc8e0tpcmFl8s3WrzBxgm1c24q4jXqnGVzRF6Z83Z3H3yhPuNxuK3nLTHp97NtKOFpEaQzJhAqh7D/5F/h53BIqLl11rXNwLLmrlGIHmRNdBz/XnqmM7o6EY+zORLeOHpdWG2flVIVaBjikglSSLlnuqKBNizTS7MqmbEYCqaPWRk57TMKN44sPpceuqekZphqhvFCTjeqZGo60oqCg0EJB4zMElucUqlpkELY065YoGE/hx06lQcZYXeZmH1Ygu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttLZYGeNu23GwO+wELjqipKSdaNZF6LGvOFsXk3FA6o=;
 b=oHB60Zmgw7MynMdK7pnwEn0/OhM3scs8gLYXG01K/HUhCA5R1iToD0twpO/GC/2XmsirjauHKz0TQGsTJqrIabvRnnzTCqOr9NFB3s5+pcHEf44iRLcWwcthhTn8G36tL8QXfF/bSzeei5LL6vXm5LgQQN/UQ42Yz1LPIGQdgrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB4057.eurprd08.prod.outlook.com (2603:10a6:10:a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 14:33:39 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 14:33:39 +0000
Message-ID: <973ddebe-14a9-4ba7-c389-7a97d6017237@virtuozzo.com>
Date: Mon, 20 Dec 2021 17:33:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 09/11] ui/vnc: clipboard support
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20210521125119.3173309-1-kraxel@redhat.com>
 <20210521125119.3173309-10-kraxel@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20210521125119.3173309-10-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0067.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::44) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fca6f6c7-d63a-4b87-044a-08d9c3c5b6fa
X-MS-TrafficTypeDiagnostic: DB8PR08MB4057:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB405746083E81244DBC0EDA9AC17B9@DB8PR08MB4057.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJ1dT+lCk5ptHNB9CRI+Ai4xJImV3vaysKtW5XGjZrDIkA7gdm81OE2L6TtKTlTeRwhnIT3KB44MSW2XjBoFOzqk2rnX/0chP1k5C5bguMyLlInDOPCQnjR36wZUo+NyFNui6pnxU11IxHDamEYeEqKg1jsXKUL6t43kj1mu4PNf97nI+OlUkehQN0h9NQBKLDuvLxvbF2006xxBBDcpF1aVAHLmIsGtoTy9NXhZLp5TNC/DCLWrhtxVtV/8QFm+jXY+ZME7suC+V4xSO2y6vZByNdUelS8jaMa2XZL5v1B62TtpT1hMRcGrrQkGF4FuwEtgEUHnVJMOxVmj2twvplKw8DUjFSRdo4BsGjk18X98BtNPTLpgPkB5N551029sn3pOUqmh2344K+L+EFbf7vTRmKezFEeqcCFhKpxw+N6zWnTHwWBDG4WqjzLx0KrnVjyXcEhxh7muKQe5m3ifXE1R/Wt1lppYPsWJ5jSURWWUM5bh1OglHphg8xOR56GVebC1wsONKLjwD/ZMJH9YyLs+tGMr3/ifH12RGKvBPgg0XrYKKPmOSjThso4fceJsoHh6e17aQtVXEZo35gnnEmps+tH9TVfe06lLOQIPUXmY0lbZuClC17iPUm7bLPGQyNttPUz9OV7j8OToh+MPtWsYD/JdIe0rM/hoYDZy5O/agI1dFBr//1teZNFlHcwJ5m/X+tQvjmlWyA/jJk78NxwOJO2LugyVNczqfsDt/wKg0fcTtFarHz7y/h9nRM3XYBvXWPiAKm/6DZynLpVW6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(83380400001)(6512007)(31696002)(6506007)(26005)(8936002)(52116002)(66946007)(66476007)(8676002)(66556008)(2906002)(54906003)(508600001)(6486002)(2616005)(38100700002)(38350700002)(36756003)(31686004)(4326008)(316002)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHU1b1cyc3VmSFduanVNV2NLUCtGYlJIUHhYODY3elh3K3h3cnFVYXRrOUNJ?=
 =?utf-8?B?VmExNldqcjJVV3BwcFR4VHNITXIrTUk2ZmVBbFVkNllSTC85QndVUHpLRmdr?=
 =?utf-8?B?TE1iYy9zVHdwYk8rVi8zajdteW8xd2ZWeXJycDVJemN0SHZYR0pDUXVKNXhJ?=
 =?utf-8?B?eXdYNCt4UjlRM2RSU1liTUFhSmx6YytNMmNtaU5kYUVKUittZUplYURmYmJt?=
 =?utf-8?B?c3QwM05RRnBYSThsVUVITkI3Tkd3YURWTEZWZTFCM041LzgyZGowMFc4dGdk?=
 =?utf-8?B?cjYxQ1RraE1IVDVTSlUvVHUxZUU0QW9xV2h1Zmd6RS9UZXlKY1N3REFaNmdC?=
 =?utf-8?B?Ky9wUnFrSERudjBmcXFuSDBqM0cwRUdOMld5ZlNuMkdNUEpHemhwU3NlNVNa?=
 =?utf-8?B?c3QxK3VzQXdrMEZaMjB0OFlvSDFxYzRWSTJjejBPeEprOFZvYlU0dVIwdENU?=
 =?utf-8?B?VG9FenF3QklMWmo4aUlRSjNmTWgzdFBjekEwVHBBTWdpR3U0U2xZeUhIYjZq?=
 =?utf-8?B?ckdwVWx2NnpCdkY5bk1YRDFqeldtcDBWNlIvV3dTWjNFZldkd3k1ZFN5UDlG?=
 =?utf-8?B?L21UNjRSdlB6ZTNFdVFXbDFWZFhZaGRnQzQvVDNEUE0wdk9BTVFJWHlrK0pw?=
 =?utf-8?B?dVcyQjdZeDRsWTF0cVJlcXdYeG5MaVhSeHUzQ1ZpOUJNZXdINEFaZGtGVHhQ?=
 =?utf-8?B?VmErNERzSFhpd1Avam5zRmlxNUMyOUsxUGpmOWJJWDgxbHJyd2lmVjBWRmNl?=
 =?utf-8?B?NG9IN29qdzBCek5EcnFoN0toOStZK2EzTGcvRDJrdW55VUlZMDBZOUREQVA3?=
 =?utf-8?B?Sm8wNGpEOUJlTGk0c1hKdGxjMU81eWRXZFg2YzhqTUFGWUM3RS83eE51VDhT?=
 =?utf-8?B?ZXluL2VJalJBQXVIUEUveE0vSE1aMnYvb1JJMVEzTjcweDJiRTRyRm4wRG9m?=
 =?utf-8?B?V2d2eDVtSmZBWGNWNm1Zem5BeGlKVTVmN2hCRU91ZXluUjdtME0waER4aXN5?=
 =?utf-8?B?YWVDLzVQYjNCTHd4T2ZKWURIbG1QbGlMVmt1cFRMTlhqZlRpNW15a1dDR1RJ?=
 =?utf-8?B?MTNmYjhDNUJvMTdVYWdGZUE2cytqcVZPNG0vSkFsbnFPT1J5dnVFQW43aEx5?=
 =?utf-8?B?UWJDTFNqTjZXcU10L05lYVI0YUdWT1BsUkpBQkRkNlVlRXRxbjd2NDgvWElB?=
 =?utf-8?B?SkRiOUl2Rkl4a1QzUXMrcXRSMFNha004czBNNll6d0tYVVJRWFNSdE9ybEhJ?=
 =?utf-8?B?dU5NaG0vMml2REZOQmtxYXRRUWx1ckRRRysxYVY1UGtwL05tcWpRNDhMb1BB?=
 =?utf-8?B?emJ2dUdCNXlPcTJ5Mk0xVDFjcHVpZmxlU2hhanY1WjZlelBJd2lHbm9RUG9s?=
 =?utf-8?B?eDk5MVBwdnBQU05heEsrUTFYQVZBbjBTNEN1OU1tejV6eVlxQnk5YzhMNzhH?=
 =?utf-8?B?eWRMY1NvRWNiRGlmK0VYS2pCRkdJVXJrdHBLSXBkYW9rajZKV0d3ak94eWs4?=
 =?utf-8?B?ejdIeDBId2pYc2hyUTVzbFlpcXhCYm9NbmFmSzlZUG9DY0hTazBKL0pvZWJW?=
 =?utf-8?B?M0ZWbVVuMXlCYkpPTkhQbVpjd2FUN0ovZklnYWZWcWRsUGp3NGROdFllU1g4?=
 =?utf-8?B?UkdmRUJHdG9IYkZQUkg2cC9NK2JBYlgvUkJoNzJGVllCWExyd25qQzFwL0Yw?=
 =?utf-8?B?SGM4YzBwOU94MEx4U0xqeWxlajVqMmxMUitCUkw0SXQyL3NzblROeUtxQXNp?=
 =?utf-8?B?bVFlY0VFci9Cd1Avc0pGM3I2Vmp2QlI1UEl2Y1gzMEZhNXcxc0RpUXFGVDVP?=
 =?utf-8?B?cndnYjZmaEt1bE5kR3Vpa2VmZVZOQ2NxMWdOeVJtSmpjekVDZDhCaUNQTjVl?=
 =?utf-8?B?MlQ3dzNwVHlYQldUaCtuaitCTUw0MnA2NGI0enVYb2FyMUR0QVlkM3hwblg2?=
 =?utf-8?B?T2Vkb3ptVUFJTDBqbWMrdGt3L0g1SUo2d0MzOEJLVElhRTdrT1IyT2t0NkNy?=
 =?utf-8?B?Rjd5VXpwRS9tc05hMGE0SCszTG5lU1l6QkxBU29ROHNqZUdacWtMSXVLM2xF?=
 =?utf-8?B?MG9WakdjYm9qOGExQWNKZTNsWllubnFOVVptdzk4SnBiZHhUUkQvZHVEZWNy?=
 =?utf-8?B?YlR1SjJYK0xqRXh2UExmMnpET1VhSVVPK01nSHBhMUFyeXEzQUlKd0JSWVow?=
 =?utf-8?B?WGU5ZFVWeWJYSlJ1NVgwRmJwUUxDeDY5M2loK1hBS2IrUU8zZWw4U0FvMDUz?=
 =?utf-8?B?MXhSVm5EVnk4Yy95bjRKN2xOdHVnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca6f6c7-d63a-4b87-044a-08d9c3c5b6fa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 14:33:39.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpXtYiU533DmpVn8KUzpLbAxIqjifRa+FuRCFBnJjFnK2e42jTdCtAy8tnMYxJZXFxQTYO02vJq0KMUPixbfyZmYocTG8Faz3NTYBB6az1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4057
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

21.05.2021 15:51, Gerd Hoffmann wrote:
> This patch adds support for cut+paste to the qemu vnc server, which
> allows the vnc client exchange clipbaord data with qemu and other peers
> like the qemu vdagent implementation.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-id: 20210519053940.1888907-1-kraxel@redhat.com
> Message-Id: <20210519053940.1888907-8-kraxel@redhat.com>
> ---

[..]

> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -25,6 +25,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu-common.h"
>   #include "vnc.h"
>   #include "vnc-jobs.h"
>   #include "trace.h"
> @@ -1352,6 +1353,9 @@ void vnc_disconnect_finish(VncState *vs)
>           /* last client gone */
>           vnc_update_server_surface(vs->vd);
>       }
> +    if (vs->cbpeer.update.notify) {
> +        qemu_clipboard_peer_unregister(&vs->cbpeer);
> +    }
>   
>       vnc_unlock_output(vs);
>   

Hi Gerd!

Something is wrong here.

We are already under mutex, but calling qemu_clipboard_peer_unregister may trigger taking this mutex again in same call stack:

(gdb) bt
#0  0x00007f4c979b77b0 in __lll_lock_wait () at /lib64/libpthread.so.0
#1  0x00007f4c979b0553 in pthread_mutex_lock () at /lib64/libpthread.so.0
#2  0x0000558fb33bbb72 in qemu_mutex_lock_impl (mutex=0x558fb5416598, file=0x558fb3447fb7 "../ui/vnc-jobs.h", line=60) at ../util/qemu-thread-posix.c:80
#3  0x0000558fb2ca16c6 in vnc_lock_output (vs=0x558fb540a400) at ../ui/vnc-jobs.h:60
#4  0x0000558fb2ca1ab0 in vnc_clipboard_send (vs=0x558fb540a400, count=1, dwords=0x7ffe37f5f968) at ../ui/vnc-clipboard.c:138
#5  0x0000558fb2ca1f17 in vnc_clipboard_notify (notifier=0x558fb541a700, data=0x558fb524ee70) at ../ui/vnc-clipboard.c:209
#6  0x0000558fb33c25f0 in notifier_list_notify (list=0x558fb3a142f0 <clipboard_notifiers>, data=0x558fb524ee70) at ../util/notify.c:39
#7  0x0000558fb2c6d601 in qemu_clipboard_update (info=0x558fb524ee70) at ../ui/clipboard.c:50
#8  0x0000558fb2c6d570 in qemu_clipboard_peer_release (peer=0x558fb541a6f8, selection=QEMU_CLIPBOARD_SELECTION_CLIPBOARD) at ../ui/clipboard.c:41
#9  0x0000558fb2c6d4b6 in qemu_clipboard_peer_unregister (peer=0x558fb541a6f8) at ../ui/clipboard.c:19
#10 0x0000558fb2c8518a in vnc_disconnect_finish (vs=0x558fb540a400) at ../ui/vnc.c:1358
#11 0x0000558fb2c848b0 in vnc_update_client (vs=0x558fb540a400, has_dirty=0) at ../ui/vnc.c:1167
#12 0x0000558fb2c8a1ce in vnc_refresh (dcl=0x558fb5882610) at ../ui/vnc.c:3207
#13 0x0000558fb2c72dec in dpy_refresh (s=0x558fb4fe7970) at ../ui/console.c:1673
#14 0x0000558fb2c6ebe4 in gui_update (opaque=0x558fb4fe7970) at ../ui/console.c:158
#15 0x0000558fb33e862b in timerlist_run_timers (timer_list=0x558fb45ed200) at ../util/qemu-timer.c:573
#16 0x0000558fb33e86d5 in qemu_clock_run_timers (type=QEMU_CLOCK_REALTIME) at ../util/qemu-timer.c:587
#17 0x0000558fb33e899a in qemu_clock_run_all_timers () at ../util/qemu-timer.c:669
#18 0x0000558fb33e26ec in main_loop_wait (nonblocking=0) at ../util/main-loop.c:542
#19 0x0000558fb3099c75 in qemu_main_loop () at ../softmmu/runstate.c:726
#20 0x0000558fb2c62ae6 in main (argc=5, argv=0x7ffe37f5fdf8, envp=0x7ffe37f5fe28) at ../softmmu/main.c:50
(gdb) fr 2
#2  0x0000558fb33bbb72 in qemu_mutex_lock_impl (mutex=0x558fb5416598, file=0x558fb3447fb7 "../ui/vnc-jobs.h", line=60) at ../util/qemu-thread-posix.c:80
80          err = pthread_mutex_lock(&mutex->lock);
(gdb) p *mutex
$1 = {lock = {__data = {__lock = 2, __count = 0, __owner = 1549902, __nusers = 1, __kind = 0, __spins = 0, __elision = 0, __list = {__prev = 0x0, __next = 0x0}},
     __size = "\002\000\000\000\000\000\000\000N\246\027\000\001", '\000' <repeats 26 times>, __align = 2}, file = 0x558fb3442aaf "../ui/vnc-jobs.h", line = 60, initialized = true}
(gdb) info thr
   Id   Target Id                                             Frame
* 1    Thread 0x7f4c89ba8fc0 (LWP 1549902) "qemu-system-x86" 0x00007f4c979b77b0 in __lll_lock_wait () from /lib64/libpthread.so.0
   2    Thread 0x7f4c89a36640 (LWP 1549903) "qemu-system-x86" 0x00007f4c96ad8e0d in syscall () from /lib64/libc.so.6
   3    Thread 0x7f4c890b3640 (LWP 1549904) "qemu-system-x86" 0x00007f4c96ad35bf in poll () from /lib64/libc.so.6
   4    Thread 0x7f4c03fff640 (LWP 1549905) "qemu-system-x86" 0x00007f4c979baa8a in __futex_abstimed_wait_common64 () from /lib64/libpthread.so.0
   5    Thread 0x7f4c01bff640 (LWP 1549906) "qemu-system-x86" 0x00007f4c979baa8a in __futex_abstimed_wait_common64 () from /lib64/libpthread.so.0


Reproduce is simple:

On master branch, run something like this:

   ./build/qemu-system-x86_64 -vnc :7 --qmp stdio

Then, in two different terminals start connecting loops:

   while true; do vncviewer <vnc server ip>:5907; done

Then wait. If vncviewer loop stack for some reason, when qemu is not yet dead-locked, just restart the loop. Qemu screen becoming black - good sign of dead-lock happen, go into gdb and check.
By default vncviewer does non-shared connection, so previous client is closed when new one is connected. So we trigger many disconnects and connects in a loop.


I don't know this code, so I'm not sure that it would be safe just move qemu_clipboard_peer_unregister() out of the critical section...

-- 
Best regards,
Vladimir

