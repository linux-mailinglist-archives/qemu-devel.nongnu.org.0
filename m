Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE338B36A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:42:01 +0200 (CEST)
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljko6-00035g-VI
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkgw-00074i-M5; Thu, 20 May 2021 11:34:30 -0400
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:57381 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkgu-0002w6-Af; Thu, 20 May 2021 11:34:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzx2aRSkMTBSU9M6AG4GLNu3Gsqhsq1xD2XM7q08tvXRYNLctnEQ2ddKa7dyZmVWDrgew798WZk/6ZGddwX/BsMgbh5ohUoImb7MZ3lxrmhBFLIAYcVFSBM8CX73GTG/KybdwkBRTw2E1zKeVfFGpU0UgY6pMUhZXs6cfNG+FubKiR++Wc8T7I1MUhIHXhYfSwlZECYDkEIVysDQLuIZxf4LCFJYI7jnp6I8SYOrT4UO3dxGHuK2UXtcVlGJocuvlG0NriDlrh5XvCRlsw4z0G8vIJKW5pTx4rkF7d5aj99RO1Szlu4Y5amBrEoJERKRDG5pBJiYqyLxvRwzRVUJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Unf3rXSZT28WVxymhHRToaG0hwNbUW8s9S1NWpyRx0=;
 b=jjUc9mQTuhlmzMPox4hEWWcsaBizgDJnoX4JIh+gRSAYup3e6DuBlPO97x1eDORH7EWFfDeXfi0xAuZ5NZfTMkZRB2KcKIn+YYYrSHH859o1yJLRL3QBk5Dgtd/tF4LD2owyB9yMD4vi9LhIL70z0ijyYKqBm/5D10/5ReSe4qW97XeI2ctGa4dvein7ZusxkUkdMsh6rlekobibzhXXHdzPvBhHRNathea6vUTQrWZdsJoXfUQ0PTvoXSHhVBmjIxvItQeSn8Qzckm7bA4vw68ry7X44gPeyNYFAp4puT2A5z+bHvTydC+bzrteLBjpWMZ1MtItAZO9cbB8h8u9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Unf3rXSZT28WVxymhHRToaG0hwNbUW8s9S1NWpyRx0=;
 b=L/9SZBH7FUI69L2ZGiF9FOCs6RAFq4kd4Cv0PtOIWCh7gMWejLlkIe8/kj00aasVIRJHoIThc0lP8JC/Je1RMT18TDyHTG4AylAi7AelVk/PMiILjcVHuMnr/nugpV+t22uAIyK04HhkV6WSwcoNKeycHTOo5grg7TcNByjJK6c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 15:34:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:34:23 +0000
Subject: Re: [PATCH v2 6/7] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <068832dd-c577-0234-4a1d-dfdae6a5b4dd@virtuozzo.com>
Date: Thu, 20 May 2021 18:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: AM8P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 AM8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 15:34:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d95bac5-0bbc-4621-b8fd-08d91ba4be82
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-Microsoft-Antispam-PRVS: <AM6PR08MB468972DC51EC3CC56CF5D668C12A9@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICJJS/edmMxTwFNbBIiOvS2J8SrZPNIkt88HDg/BIL9SVvLSMvs2/wdXYEb+iX2ncv/F0zKaonBRyNz1ZTvGsRxdxI7bfxnhzzKtYJi7kSTPSQC3YnGcDTYS5sGMzDPfhYeQ5BJnZOmiXfQ9Gjff0eKcBl04/yDF2HXmry5GsGRTPIkjb9QXYt9Re65E6kXvfgCqi7gnJ7PHD3iBz0+BR+5FNjESfv+M6ZwQ/epYW/9PnvdZSNH7R16+ZUawYMRmwVZ4kUm0ReL+zBfHIyrm4YPX452qeqerQLG6uqHC/MDfCLd/2a++8UfzdgdiKi1S3J2NOqTp3yKqSAuJdcjuQso+2BGadNa3ILR/Yid4C5XCFFqsVpnY0O+IxhaXRz/TsJe9I9o2tZZHLv/Woniktv6RgMqD0MutXoK1Iu1AiWQQsnCYGun5wgHC8vwaU6Qcnm/2vTo/W1oweIvxPSEX06u+dJ/xOhc9FH20u5sOj3JzsGKUQer701/Lgk+WWbOTdFRtSeLjZNv+9NWKSVLoTZX3KDHAw2bWeyN9I1rZTc2pOFInlMhWsPK6Lg8rVgTwJxo8OjddHJ/c+JkO4uVdUdHjI2SMKEOCvjYM7fkibw6Pi07a1SAICjIDHnmJGrYqQU4LtwXG4nU89jdnBUYSr+g6j0tHZMhNUzNE3CHqPQcJuOPGF2CBff/zUKzwMk+S6tbjL9a0g9+xrVIwUmpacVGcfe1DnMEA2wJZLPj8dwO9d1Rp8zFsh8zHrAZddyaJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39830400003)(346002)(376002)(38350700002)(2906002)(38100700002)(6486002)(16576012)(186003)(66556008)(31686004)(478600001)(16526019)(66476007)(54906003)(66946007)(316002)(8676002)(52116002)(83380400001)(8936002)(26005)(4326008)(5660300002)(36756003)(956004)(2616005)(86362001)(31696002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHRRYjZFMTRXY1JnU0ZBN1V5TmlzWVVMbWtERmw2ZlNKQVFBazhDejVZZGRF?=
 =?utf-8?B?eFB5L0tHWFpWbEZqUVRWT0hzSklpQjZjN2U1RWJ0eW84YUhESlhCLzhXb1VV?=
 =?utf-8?B?Z0t0TFZWK0NKZERGUU5YVVFKRkFINDZiQm9yc3NvaVZPazhHdURVWWZhcVJY?=
 =?utf-8?B?amUxTy9Gd2ZlZWNNOVdkR05RU1FKU0JnZkFrbGgxR0xXakFmWVNjbTY2WGZo?=
 =?utf-8?B?ajdvYTRuUytOTlQxQzB4SEMwc0J2UmpIMDc2TnVsdXhuK2F2eGxXb3kyeXdH?=
 =?utf-8?B?VGhRUUNZa3RvcDhUM0FvZGpXMkY5ekY4ZmxDZGtxMVVCTTF0b3dyNXR0eWpn?=
 =?utf-8?B?SEJ4aXdVdlU4bjZleG5PY1BKWnhUbFdCb3VEZC9YZHE5TjRWbnNQMUNRelVY?=
 =?utf-8?B?MVozWGJhdUxPMHJnaS9mdkhaUUtCSDdDU3NrKzU3dkxJRmtGME9EZXZtaXND?=
 =?utf-8?B?UHNQclRWenJYSDJYb09Vb3dWY3RGc3duQ1Z5Z2tlTXY2K1NoQ2hLVG9jTjRM?=
 =?utf-8?B?NUR0N1VxVncrUThoOGNOdTh4QWZKR1BCZWs3M2pQekF6Smhna1FzMVdrT0RR?=
 =?utf-8?B?SG1SVXo2VGtTaXNxTHpJZTZIZ01nN0VJblpCSDhJc1hzUGZBbmc1R1FOOTdZ?=
 =?utf-8?B?YlQxQWpGWmFwOWYwZnRpcmFlYThVbTZpUmxzYjQxUlN0UnpTM1p3YUdIaGJX?=
 =?utf-8?B?OTdxUGxrNmNETi9hQnlVOTA0QmdFWHB2TmhjTjlwWWM2UTc4S2hweW9XTFJD?=
 =?utf-8?B?cEkrNGFNZjltb3Rid2tYSkFocjQ0endVZzF6d2ZJSnl6K3BRZTVheDJESmxp?=
 =?utf-8?B?VW9XTXpFVWptelJOcFIrbm9YZEs3SFNqVkhIQkp0U2U0Zkt3VXJ1WXZEK1hD?=
 =?utf-8?B?a2RjelB6ZHZtSDhZZ1FqMWhNV2RZdGQxVDNIbCsvUHBHbEs4T05pbFRUVTZF?=
 =?utf-8?B?V2o4YXAyUDVpYk4zblJqTnd4bGozUXcwZ1RuMzlnQWdMT3NRK2t5TERTQUg5?=
 =?utf-8?B?U0NvMksxTkRaY1J3TzV1ZUh1Y3VNZkFqUDVRTGc1T0REVC9YNW9DMTB0MEs2?=
 =?utf-8?B?RGtnclEvS0kySGkvZjNScmg1Nm1HUVl3ekRFWlFOSXpXbDlxaU9md1ZueTBw?=
 =?utf-8?B?M1lmTzVDQkJWRU52Mmw4Z05BMVYrM0wwalplTFkxK1d0U3dCM0ZxWnZOUm11?=
 =?utf-8?B?ekhycm5VL2htbTd1WW1CdVV0aHM5TG5LcmdDUDRpV282VlRCbTh3U0Y2V0tV?=
 =?utf-8?B?WnI3TytYbGwzVkg3ODg1VldWUGVvYU13RlQ2SFNWSFFHd1R3YUtpVlFoQ2o1?=
 =?utf-8?B?S2xQOTc1WlZxRlRvRGNBVnNIUnZveHNBd3kzWjhGdWJZNUpnWTRudjFTdFVV?=
 =?utf-8?B?YmZIZUFuSDgvc29nMG9rd0E3cjlSbXowazhZUFFzNXZIbitTUnh2aTVsQS9j?=
 =?utf-8?B?ZlA2QldYcnNEZDJaTm45YkVBRFA0VUt4bjNnU2s2NVBqZDBnT1dkMFNUNGNl?=
 =?utf-8?B?UzM2MmtwZXNaZDV6Ny9qNmxobXpYMFdvMnM5WVZkUnBOWHBsS0hjTnVXVjNi?=
 =?utf-8?B?UFR5NENrTFFXL0kyYVlVbzNtQkg5MVV3bGdTY2N4UDNrdlo3YXJxeFcwNFlt?=
 =?utf-8?B?RWNPWnNIalY2RUFZeURXTXlVbE1VTXRMNU5RaFBtVzBxVW5qdlFCSVdOVUpT?=
 =?utf-8?B?RHQ1MFB6WW5wR09jdS9LUXhndk5hVU5WL3VrSTVIc2YxUy95dndrcFo1ZGtR?=
 =?utf-8?Q?zWOEivn+pmt3uAZx9WlMPmo3RrmktIcLJQ8MUyW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d95bac5-0bbc-4621-b8fd-08d91ba4be82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:34:23.5446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCGPfZzBiEaxjK131dfjVcfVa4fDjjbMRNOjoixWxGoaq9z+7dV8QS76EfdiCxPidm/iY6bKh76jM8c0BW9AoiRJWDkMi1w6JAjSXV7pyGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> By adding acquire/release pairs, we ensure that .ret and .error_is_read
> fields are written by block_copy_dirty_clusters before .finished is true.

As I already said, please, can we live with one mutex for now? finished, ret, error_is_read, all these variables are changing rarely. I doubt that performance is improved by these atomic operations. But complexity of the architecture increases exponentially.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index d5ed5932b0..573e96fefb 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -55,11 +55,11 @@ typedef struct BlockCopyCallState {
>       QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* State */
> -    bool finished;
> +    bool finished; /* atomic */
>       QemuCoSleep sleep; /* TODO: protect API with a lock */
>   
>       /* OUT parameters */
> -    bool cancelled;
> +    bool cancelled; /* atomic */
>       /* Fields protected by calls_lock in BlockCopyState */
>       bool error_is_read;
>       int ret;
> @@ -646,7 +646,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>       assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
>   
> -    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
> +    while (bytes && aio_task_pool_status(aio) == 0 &&
> +           !qatomic_read(&call_state->cancelled)) {
>           BlockCopyTask *task;
>           int64_t status_bytes;
>   
> @@ -754,7 +755,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>       do {
>           ret = block_copy_dirty_clusters(call_state);
>   
> -        if (ret == 0 && !call_state->cancelled) {
> +        if (ret == 0 && !qatomic_read(&call_state->cancelled)) {
>               ret = block_copy_wait_one(call_state->s, call_state->offset,
>                                         call_state->bytes);
>           }
> @@ -768,9 +769,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>            * 2. We have waited for some intersecting block-copy request
>            *    It may have failed and produced new dirty bits.
>            */
> -    } while (ret > 0 && !call_state->cancelled);
> +    } while (ret > 0 && !qatomic_read(&call_state->cancelled));
>   
> -    call_state->finished = true;
> +    qatomic_store_release(&call_state->finished, true);
>   
>       if (call_state->cb) {
>           call_state->cb(call_state->cb_opaque);
> @@ -833,35 +834,37 @@ void block_copy_call_free(BlockCopyCallState *call_state)
>           return;
>       }
>   
> -    assert(call_state->finished);
> +    assert(qatomic_load_acquire(&call_state->finished));
>       g_free(call_state);
>   }
>   
>   bool block_copy_call_finished(BlockCopyCallState *call_state)
>   {
> -    return call_state->finished;
> +    return qatomic_load_acquire(&call_state->finished);
>   }
>   
>   bool block_copy_call_succeeded(BlockCopyCallState *call_state)
>   {
> -    return call_state->finished && !call_state->cancelled &&
> -        call_state->ret == 0;
> +    return qatomic_load_acquire(&call_state->finished) &&
> +           !qatomic_read(&call_state->cancelled) &&
> +           call_state->ret == 0;
>   }
>   
>   bool block_copy_call_failed(BlockCopyCallState *call_state)
>   {
> -    return call_state->finished && !call_state->cancelled &&
> -        call_state->ret < 0;
> +    return qatomic_load_acquire(&call_state->finished) &&
> +           !qatomic_read(&call_state->cancelled) &&
> +           call_state->ret < 0;
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
>       if (error_is_read) {
>           *error_is_read = call_state->error_is_read;
>       }
> @@ -870,7 +873,7 @@ int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
>   
>   void block_copy_call_cancel(BlockCopyCallState *call_state)
>   {
> -    call_state->cancelled = true;
> +    qatomic_set(&call_state->cancelled, true);
>       block_copy_kick(call_state);
>   }
>   
> 


-- 
Best regards,
Vladimir

