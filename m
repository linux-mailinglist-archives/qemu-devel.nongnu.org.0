Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BA4A5C45
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:28:28 +0100 (CET)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsGp-0008E1-7D
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nErBV-0006Xh-As; Tue, 01 Feb 2022 06:18:53 -0500
Received: from mail-eopbgr140115.outbound.protection.outlook.com
 ([40.107.14.115]:12334 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nErBS-0004Gw-OZ; Tue, 01 Feb 2022 06:18:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAAtDmJg4P4mC4GesDVOlYEnzCXQayxskZyaMK8C+/7LC13yzrQv7N5fy6bH/fR3frkIZgEdB8wP8revKkrUnx7oI6umRMDDqxlLCoGmFK/o81osa4xClsIxKscX1NwMDcEvFyg+B5mhk+6wuyvwyvtc5zTIoAXL+aP6s4VXzWBHuAnFPEyQ43z1DFT2te2d7Sx5HqRa4xwWVnYg6dIj9FOkD5MKTybLq/My22aM7l7INjI8txAEmm/xQYXqhHAWMTG7wOx6D7I54K/pGA3/kXgMcr0Ji00Jn9X63PZy+1X6Zjn77k2TMGscwscNTuyKvJwfAVVTT9izODRtIRBQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyYtypCXuV0XEec6LSWShYqhV0BaHM97EknN4IUR1Fg=;
 b=jGLTcMsfJ2yMu3puyvwpLkqt9itTSYOMtj1PHttDpe7ZDRjqT7jeuRRo/9S4l7My0zDjuWlaOBvRIwWFK6ZzD4t+Pcf8mvlJ3g9VQ0fVZ8xrPTftG3645z3r6oocllry0dgajPgnFgsYnn2sk7IRUVo/J1UnNyL3Qu0+mlgAcui3AydxKc7zhVlFOQaDOG26B7OQYNsmF1P08XZuplIGsViCp6QElqiPg2OXur7mHFVobhPL3wTE5ezRWwsCF5ytykLVIHyCkCtRJoQlmeaJ0pS4uMlkTsfygEUBTcuTPlDpcN+jGB2EIrY3qT/F2sr3z8vHEzCk8ZIG0YrWNe2/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyYtypCXuV0XEec6LSWShYqhV0BaHM97EknN4IUR1Fg=;
 b=JgLO50ppZwJ2q9DmcLKqID76u+ryjkr58Ic2jl0VqOi28OrrprppQpe2xhwmia2QBKw7a51+hO4v5ipfLtfsqNLUVMEUBhXbkdqiYwxFEVscoKP6ihT2+AR7WQih0ExYlUlBTl8+6BIqeW9S9oBtKs9alaP76iXJGJ4Lpq5lDj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB6909.eurprd08.prod.outlook.com (2603:10a6:102:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 11:18:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:18:47 +0000
Message-ID: <4836201a-a469-c063-babb-4e293daee297@virtuozzo.com>
Date: Tue, 1 Feb 2022 14:18:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC] block/nbd: Move s->ioc on AioContext change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220128155130.13326-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220128155130.13326-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc34575-1771-4951-f24c-08d9e5749d48
X-MS-TrafficTypeDiagnostic: PAXPR08MB6909:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB690998BC66A8E565DD1D94A0C1269@PAXPR08MB6909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLhU3CaCk7FHfMaoakczG0YbdfxL1zBzJnlETeXU9lpChjhP2grX1aoa7caF8lUBOkw8TAB1WxkPRJWe83z4HyoCw+n35FANNWF/OJvs84DKrdEtqIQoTAn+fvwkxRb6ypcUWaZEVcpYInve7rhKS/ucDKjk8ejMYmq/hrR9A7+BaAuytvs2IOYx7UuD5yPmLmyRPOHt2UjadfXFjolCQO6uODbQaqbMWUe0i+aIdSBrPQR+9sDBDM4Gmm+3PIcCwuSEzZINxj0c3Qz/hl6erMTR4j0lf4srHeXhrLQz9kN8kAiYJ43oypNNreA3tbvcst7CxW9f1QIp2ZKmOpKj05DxIpVveY8hVLKurLYTKaS1Tec1aOE9hcKc7pnAXkg1WwP5dy2p6J14QtrEkycd5RFolKp3MT8iYU0hQYK5UZy5SOvqRMxAL8J2TeWwcRyyhvlCwBVvvD6IjzJhgnkGAUMkF1eZx/a1piVsOI063HbthHyQ2vxFiuPknq+CgQ+iBZD0kBGjSuckqzARnKcbCYJ6hL6xLdOD7FJkSsIAptbZ+Y3bDM02P6BtabINObAPkeb41Gix6b7SOm6PofyEViJubZo4haEbjVaMPG/Fk3lhbNcZ4iceSbMBAXF7zh0c8X0i13m8GAQB+JlDN440sf7CS51ksVNHL7t1NrAJBoad00DIMe1Nhvxi+UpSEyvflC7LC7GQT9l0JkgbO5D6UF5iQcr8TS+bV2DreLuqQiU6nnlP5ZIRwYDlhnomiSumSbVSOqgyDO4vJK13pLn4eAius3ajeTW45W7YryuaTXDwWWLDREydF0hYr5QHOj6D17R7mosLtWqzcgfQiG5LjQAHFYYohYbuPrCzTc/1Ol0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(5660300002)(83380400001)(31686004)(2906002)(36756003)(4326008)(31696002)(2616005)(6506007)(186003)(508600001)(66946007)(66476007)(66556008)(8936002)(86362001)(52116002)(26005)(6666004)(6512007)(54906003)(316002)(38100700002)(38350700002)(6486002)(966005)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRlUURVbSt3VldyRFB1TFlZRUEycFZTODRzVkQ3ZCs0N3BLU3FNcCtlMi9I?=
 =?utf-8?B?UUcyTXRydENtTFlwSTZOMTJJUXl5dnk0b0o0anR6dUwxRWMrV1haNWJraERG?=
 =?utf-8?B?bi8zSi9vTTdCWDBDWmxnSFdDdVFreStoTldhR0h2SlRXWVBORjNoSjAzQWZW?=
 =?utf-8?B?WjVEZ3o4bmcyMjI4eC9nSjZRZ2ppaVJSdmp4NzRyRkNrMjRYL2hzL2x1YkV6?=
 =?utf-8?B?TkwrNDZsbmh5SU9oeVIvRGJFL0pJYWN0SDYyRTdYaDZHY1l6d0hpaFE3czR1?=
 =?utf-8?B?d0xkQXdWWjUwWXE5SUNLV3oxVDluaFdiZnkyUCtYWDNrSGsyYURUNVB6dHZE?=
 =?utf-8?B?OXd5YXdTNURLOXppOGMxYTZFRWFtdXA1LytWWDlDb0dZaHovbDVzRTRLcDJD?=
 =?utf-8?B?aTY1WTZodVpENUJFTVYwNEN3N2RCTU43NlZoZUxLbExPQlBTSDNiREU2R0p3?=
 =?utf-8?B?UDFHY0NLYm9ZbGNRWUhWa25XdFFtWTBXdEdBYzB1dmlxZEtOZHBMbjBiVnIy?=
 =?utf-8?B?NUVpRnJTKzF3VWJKZ0lWZzVKaEVhbFQ3TmRJU1JKMm56bHFtQU1aQ2plZ1cr?=
 =?utf-8?B?SkMxVGRLRDFrVUZ4QWlhRSt6TVZHUCtuUjFkM21Pbk5qc1d5MGZkMmtzTlNa?=
 =?utf-8?B?a1VOSGVDdVlWRUhRRnEvL1psQ3JtUFpic2JocHA1TFhOUXZDNUIxaEtXVmV2?=
 =?utf-8?B?dWpKZ2NLN21OUXJoOEkyM1NGWHVCQVZoUmczY282TTk0VGgvMU90ZTR0cHQ3?=
 =?utf-8?B?SVZZQU9HNVg5Y2JjZjBjRG5TY3N1RnZad3RkcDZneERRZnhTZkVMVjI2bVhh?=
 =?utf-8?B?YkVKaWtBQTlXUUgwUm1zMGtYams2YXV1NVdHTmxMMDRYelQ3VlFyVkdyZmtn?=
 =?utf-8?B?dFgyR3hPMkhQVWQvQnZlYVBCL3ZEdGpHNzFDcGcxYkRnajRsSVJ0Sk16R2g3?=
 =?utf-8?B?Tm1XN3JnNHNYUEo3eUlWZEw5OTJnN21NRUd5UVFFdjR1bDVDaGRTRS8xSkNS?=
 =?utf-8?B?Y0FEL2hPLzNLVFFkVHJSazJ6dFVEc296S1R0ZzRUZmhLNmZXR29kTXpFVjRq?=
 =?utf-8?B?SmFPQmg0RUNwZ0lBYWdhY0NoTzJ6c1AwekwzTno1V3VUMzNtK3l6Qjk3OWJP?=
 =?utf-8?B?Q1diMC9MSjhnQlZScTRrRTZSYS9xM1JHWG45SHhhN0JyYXVKbEpKQ0t3eVM1?=
 =?utf-8?B?eHdIZnJYVmMzTlNNUzhpQm9OcHNuaGdlY0xLd2ZtMC9BVnpubFlDSzZyWDFi?=
 =?utf-8?B?bDY1M09VR1dyQmkrYUJZOUY4bSsvTmoraGd6RmxEdkFQUFNjNmlUOGVRQ3ZK?=
 =?utf-8?B?T2pSdWJqUXA4MlVHd1dONTQ3anlIYlR5dkdxY2laUXk5djJ3ME4rVnZKMTFy?=
 =?utf-8?B?RlN1K0NwQkx4RTNjUGR4Vkk0c09IYjIxTm1mNkxXRi9mclFUTVhUa1dkVU1B?=
 =?utf-8?B?YmlIZFFNV2hPNHYrL21XTkpnL0RzeVVSb2VKNk9lNGxJdkdRalV0M3dsZmJr?=
 =?utf-8?B?Vm9JYmJobzRtN1lBZzlrVU1QNlpBUXVmdS9oQ056M0lWRmpvZHdWZ3VYMThJ?=
 =?utf-8?B?OVR6TjFqRDVBeHM2YzdVNE1ZSnpnbElkT2E1eStjcjZwVlN2VTAzVkFkTUhC?=
 =?utf-8?B?c3g5NGhJK0c5VHlwcVozRHQ1d1lzWDR2VDVBWVZVZUpEQnRQTDIvYm9mb2JG?=
 =?utf-8?B?bkZEcm9ORkRYVmg0NmdSQnRGaUZhOFd3L05nRmt6NjNqM0paZDZvWnRwM3lQ?=
 =?utf-8?B?dGs0N1JNQjhVWnZ3TkNNVVh3dmVEZnRURk1XbHMrV3BvVCtZSkd2VmVIU0ZD?=
 =?utf-8?B?YUJLakZrRkxsNnQxY0xTSlQxZFU2Y3h2RTUwNEErQndIK1E1UVpyRndoUUNt?=
 =?utf-8?B?bWdCU0dGd0crbjJOOE93aEk4b3p0TWRQK1BRTmRWQnkxRnY5eDI2T1k2Vmox?=
 =?utf-8?B?T1JpOVBmNTFXT0x2Z0E1cDhNZHZqZVpFN2JIL3JNWTg0VDRENStvUlJDRW1J?=
 =?utf-8?B?bVhNaTlicjF1c0t4dFAycTFFTHVxWEdmV3NRSTkwOGc5ejdDakJPL1p0Z0JD?=
 =?utf-8?B?V2RnS2NKVURrNmcwdlRYejFjbjRMbXFsRzQ0RmNtdjRCRm1VS0hUMHdRU25o?=
 =?utf-8?B?SG5PODhXSEpvMGtEZ0xLM04remNXYkNXcVEwU1RUVFpYZzBaMEQ5bkxvVm1y?=
 =?utf-8?B?MEpkR1hYUTJONUFGUk9Vbm4rYi9FZHFlWVdXa1g1a0NyRW5XNnVRamQ2UkNL?=
 =?utf-8?Q?RTh6gEEBwO4QVfUan5Of/pxPANbBJM1yR4IvBtxP5M=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc34575-1771-4951-f24c-08d9e5749d48
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:18:46.9640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aapGqBsPQEHXuodr6/mMj/sK9/m9+TqoUPni4cdFE70BgY2T0rb2215ZhkP9Pthll/FsHyOCz8ULzPxc7EekOg9JCsy3oB6z5eXGSQw+BYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6909
Received-SPF: pass client-ip=40.107.14.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

28.01.2022 18:51, Hanna Reitz wrote:
> s->ioc must always be attached to the NBD node's AioContext.  If that
> context changes, s->ioc must be attached to the new context.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1990835
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> This is an RFC because I believe there are some other things in the NBD
> block driver that need attention on an AioContext change, too.  Namely,
> there are two timers (reconnect_delay_timer and open_timer) that are
> also attached to the node's AioContext, and I'm afraid they need to be
> handled, too.  Probably pause them on detach, and resume them on attach,
> but I'm not sure, which is why I'm posting this as an RFC to get some
> comments from that from someone who knows this code better than me. :)
> 
> (Also, in a real v1, of course I'd want to add a regression test.)
> ---
>   block/nbd.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 63dbfa807d..119a774c04 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -2036,6 +2036,25 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
>       nbd_co_establish_connection_cancel(s->conn);
>   }
>   
> +static void nbd_attach_aio_context(BlockDriverState *bs,
> +                                   AioContext *new_context)
> +{
> +    BDRVNBDState *s = bs->opaque;
> +
> +    if (s->ioc) {
> +        qio_channel_attach_aio_context(s->ioc, new_context);
> +    }
> +}
> +
> +static void nbd_detach_aio_context(BlockDriverState *bs)
> +{
> +    BDRVNBDState *s = bs->opaque;
> +
> +    if (s->ioc) {
> +        qio_channel_detach_aio_context(s->ioc);
> +    }
> +}
> +
>   static BlockDriver bdrv_nbd = {
>       .format_name                = "nbd",
>       .protocol_name              = "nbd",
> @@ -2059,6 +2078,9 @@ static BlockDriver bdrv_nbd = {
>       .bdrv_dirname               = nbd_dirname,
>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
> +
> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>   };
>   
>   static BlockDriver bdrv_nbd_tcp = {
> @@ -2084,6 +2106,9 @@ static BlockDriver bdrv_nbd_tcp = {
>       .bdrv_dirname               = nbd_dirname,
>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
> +
> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>   };
>   
>   static BlockDriver bdrv_nbd_unix = {
> @@ -2109,6 +2134,9 @@ static BlockDriver bdrv_nbd_unix = {
>       .bdrv_dirname               = nbd_dirname,
>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
> +
> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>   };
>   
>   static void bdrv_nbd_init(void)
> 


Hmm. I was so happy to remove these handlers together with connection-coroutine :) . But you are right, seems I've removed too much :(.


open_timer exists only during bdrv_open() handler, so, I hope on attach/detach it should not exist.

reconnect_delay_timer should exist only during IO request: it's created during request if we don't have a connection. And request will not finish until timer elapsed or connection established (timer should be removed in this case too). So, again, when attaching / detaching the context we should be in a drained sections, so no in-flight requests and no reconnect_delay_timer.

So, I think assertions that both timer pointers are NULL should be enough in attach / detach handlers.

-- 
Best regards,
Vladimir

