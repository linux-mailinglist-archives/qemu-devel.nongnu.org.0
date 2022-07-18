Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B819578394
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:21:29 +0200 (CEST)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQgh-0005WJ-7j
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oDQdm-0000tN-IH; Mon, 18 Jul 2022 09:18:26 -0400
Received: from mail-db5eur01on0723.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::723]:17437
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oDQdh-0004KH-KV; Mon, 18 Jul 2022 09:18:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL5vCXrXPR7ie+Y+J9a24r+OD5opoYHwBlbv3QtPtKFVfCTceF4FKIB3Fzqa+og70PyUPqZACfdxfiprMqBUemEil92PjzohZcTMDQzH+SlyE5FekKvUQTJ46AifBqXdoml6CEEGJDPAEsy3409rXYYi5JCmkUscxTQSONUbwILJoqEy0syt8jrmmQZFFT9Rql81gY87H/M6AkHBSdqawSO1a5tDD1vU7yfU/ejhfU3DnJWsMupE4eqC33bPvgrWDTWJpGU4yXUKRMPtgqnOZ/F+RrWoZID1amuArJoOi4vSoRrPEvvgiu6ysdmi+ysP2ho8zM0w6lsn8ssJzY3q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxWBe1MANgZ+MmYQ4WePuKCOTLbeFs+reRNoUr58PGo=;
 b=M7oBVjEwW+lg9ZOifiyM2uTVcJ9+XevGHpV57Nc/yCKKBwps+vy6LBuErEkzHtILvgJUbgNdInj3RgC0LzWREaDdfcveJ9VVAzWQg94Q6rZryCYQMdIfr/Qq7zvJDm3lUpN57BHFQ2mwpNkfjALe194k9qQY/E4ifbHwgWzFySGTb7Ix0w9BLLqSkcto5HrZ3waAx7zat661OwV3KbXhketo8+i/ba+OUPDkzQdeJ8xcuBxV02uVfk4owCEZkNfYGrZ8tTP2AMo21VH8omUWGBYgYR94Trf65y50FNIIODlHK9ysQjaDEIvpLh846v3tvHAZJ6VPfzKhtugXMXqN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxWBe1MANgZ+MmYQ4WePuKCOTLbeFs+reRNoUr58PGo=;
 b=AviRUQlPcQNrLQBEQQ+YwpvUxJLjA/Hp/jCjBzf5/qUWGnF6df4CNQepmX+RpWkwcUg1mHrtXqDr0cS6yi2REaDew6IkGebV9g1n7bVpL54CUUHsIo8OTDPIdQNn8XhmeHkNgJdKNKUqK3BA8R/tPdAsdhGqCHCNTd0uxAwzTI+wkaSvq9R8sZNMDXEb9VtrZ7oJkoDhICWu+XLiPAcseFmskcpfq/LKF6IQ02VHIL4j25EU5SEUxsdVRFUKtY0LVCeeB3KwnB7wzw+FtsLwuGHulIESejgKhkcx4ZFkTRAF5qa7E8caZyR/kBcofjvKB7KgzPR1b2ia2axRsaQneA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB2894.eurprd08.prod.outlook.com (2603:10a6:802:1c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 13:13:12 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:13:12 +0000
Message-ID: <25d506e7-47d7-d936-1c68-7fdc1eb4aa8a@virtuozzo.com>
Date: Mon, 18 Jul 2022 15:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220711110725.425261-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220711110725.425261-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0092.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::18) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16c5b763-713c-46e6-fa90-08da68bf44a8
X-MS-TrafficTypeDiagnostic: VI1PR08MB2894:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghbYFam1B2hP2pGICOAhTYq9GnrnzkR4ExTUAttgujSID8o+wZAMgEVh7/K6uqx7wWif5bHc5M/et9w/3roRXiH1CG+peP/8FvhUcVTwX0UurLOPhy+wMShRiNbH8uqFwLxb6dKoY6T2fsr8p6fkFVYHlN+PT8j07uYkoyNFjR30to7u6Cgt1RNIHSocp79WYJDSiP4jqBvfDVq0lN2L+lz+y+I5X6+qbeRZ2o61RHqfo/FkJGErVXRgFrjKSYB1eAtarSXd3CqAgxmNPJ8syA6P+3HPzISaGtNJOvJzqm68UsgyTw1Vy9Ww47wQcTyqWknLJRTKPBTtzVmUeKgY/or4YbKAs23KgX2BwcWQccjpkVGO2XuU+Ctmy/mB93O+jxYp0h+DeV/mRhswgcuT9uimKBn7EZHYSGUOaDfcYc+H7yZjcordMtOwAH6DqS/Alx5Eae6IXn6RnNpQYzV3HCQf+HEbOsBZybY260XRGzWH3fhEsDi+q7uJNM8f1kdawTQwQMw0TGO1xhXNLMrKsD1kYIoaydxiAToNedrOcGKlsFpbGHaApaFKL21jgzpE3B/97FVwsSMJM0AfOrJxnRFSjzukqAeoAyro+ID9uGfffUZIKbF7gE18AA6HRKGnxg7xm6db2e2cIHt/lTMKmFFym9ry4W1wj8rfubEtJCG+/TQRWOoK9wo/RLwgO8HeQEqaPT6/HAVLJQxyO3C3+2tMX9Bw5aMLWijgyr2JbQDDAZRwULl7RnWbn2Fdxhle7hBsSOsjFhuqvpOFifOp7Xi5ujAA7dBPUKmAR8I1luLK8HXv790rsjrQPp3lM49839wRlAtfY5BZksDYJLpvAT9sml37e4CRPSAxtUT7oqQUtQ51FsvQzbFaD2Gl9Irb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(39840400004)(366004)(376002)(83380400001)(2616005)(186003)(4326008)(8936002)(36756003)(66476007)(66946007)(31686004)(5660300002)(2906002)(30864003)(54906003)(26005)(86362001)(31696002)(8676002)(6486002)(6512007)(478600001)(6506007)(53546011)(41300700001)(52116002)(38350700002)(38100700002)(316002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUxscUFSL2JWTjhOclcwcENyOVJxajBGR2dIS1g5d3lwM2UwNndCQk9FenhM?=
 =?utf-8?B?NG5GRHZlWjZTMERaK2UvYkI0Wmt6TDZqaFhyRmMwdUhzRkFBejZGTVRVSGdM?=
 =?utf-8?B?a0NxUTIycWR2UmxHUHZXYTQzb2JnbmFzWHNXZjhod1kwcWJWOU1QL1EzY3JY?=
 =?utf-8?B?ZUU4Sk02M3p1d2ZnNTA2R2F6OERwdUpYczVtUE5IUjRrbEJsVXRDaEF3eXhr?=
 =?utf-8?B?aE5WRUdnZ0xId0syendHbW5ua0hSOHBTamYzSGhFdWViSnVGV2pZOEMrR0Jo?=
 =?utf-8?B?Tk5FNytGaWxadnZMY1h1bzBnQk9BbWNlM3R0aDQ4WFpydVVNOElwazlqaG1w?=
 =?utf-8?B?UWs2L1NyejBSejB2d3Y4ZkZxaEhkSXZGR2pjd3JHS2FqdWJ2b2VsTWVPL3h6?=
 =?utf-8?B?d3RPc1p0RjhBWWRvNHRKeWFYbHY3czRCdVF5b2tQdlBVZWdiUjVjYXFiV2xh?=
 =?utf-8?B?TnlwdzZSSXB0UWNXeE1HeTRObEJqWENFUDV3WDdnc1V1ZC9qRmVET2s1bldT?=
 =?utf-8?B?cjlYUFlOQktDbndYcVR6ZkY0VWVtb3FnbllrdmF4aUd4djFwQkoyMlQrTTlP?=
 =?utf-8?B?MW1ab1BOcGxEYnpKM2xNR1pSVnVmWWVuU0QycVFrUnBQVTNxaWJua1FrVkwr?=
 =?utf-8?B?MG0zZmhsSS9wdFc2U0JML3JzZDdOOVl6T1JQd2p4eThhMjZqQ2hWV0d6d2dx?=
 =?utf-8?B?K1FQUDlBTTFkMUk3a0tIZXRpWXdpRUI5NWlBNk41VDdhQWdXSktFUW1PZkdq?=
 =?utf-8?B?WnBtR2FrbnBHWHhkOGhEcDFnb3ZXRWZLMHZpbmJuNG0zNGJxQ085dE9BcHlS?=
 =?utf-8?B?QUlKeVZadnAvd3dxWGx0aXM0bWFYNVJJZFBUMWZWSzBrR2xGMzRzWmZwZVVO?=
 =?utf-8?B?R3VZU3o0VUMya0plbWJjZUVOUzM0QmxPWjBsL2ZiM0JUT3ZtalQ2R2RvOHJn?=
 =?utf-8?B?cWVLK2NIS3YxVVNhNFNyR3hPaW85WWZNUUtEb1l5cDQzRW80dThxWDhZbUVL?=
 =?utf-8?B?c3h1bGZFYlpUZVE4eE94U0xrUUhlOFJ0bGthSmJuMCtpWU5EQWUrSXRhbUE2?=
 =?utf-8?B?cGk4bUFJMThZWlVqandKRCtXZ2NZYnZITUZoSU1sVUJFSGp6VUhFMS9qZnh5?=
 =?utf-8?B?UktKMXV0OWdxQVl3Y2U0Zy9Zb3lGZ0M5RlFJbWhuZzc3RGQrS0w1R2Ywdk9y?=
 =?utf-8?B?UjZ0WUhKaGhqSEx4Z0JaZzFKNW5YU2xPZ0dJQm1TbXBPTzEzd2VWVWRHQ3do?=
 =?utf-8?B?YjFsd2JSc2E1V1h2eFZCa3o5RE5pY2QzcmJ4K1hPdkxTSk9Vai95ckxTc1Ay?=
 =?utf-8?B?eUdaRldPT2ZyazQzdEZxTjlheTJ4R0RnU0JncXJvaGMxWVZUL3lUbzQ1Sm5x?=
 =?utf-8?B?cTJtSGRmak9lZTFzYlduaU10eFhwVlVQMjA4STdwMUsrMmlzSTZ6VVFuMW1Y?=
 =?utf-8?B?ejlpb3dHUi9YQ2R1SHJqdWxYLzkvaFlxcElyeGNDYkVaUlJybGhxQ0JhOEVl?=
 =?utf-8?B?Sm92N2xIZlBHa0hxYkQrVDVyM3ZPMS91TVpGNWN2ZkJtdyt6c1VpYXI2cS9W?=
 =?utf-8?B?Y0FpRWw2elBXRDdmdk1lRlRscldzOUl4cUdnQ3cxeE9wcUg4cEN4VG5iRVZ5?=
 =?utf-8?B?cEI3VlQzNDBYdmZVcjJyamk2bmErQnFsem8wMGNrMDlpYkJNMU4zOTVheEU3?=
 =?utf-8?B?SXozZGtEaW9tS1lPb0JOV2ZMcWJiL09pTjJWejd6TzZYdER4MmpsV3o3ZStQ?=
 =?utf-8?B?bTNlSFpqeTdGd3RlTlNsSll0TFg5SXhnbDBiR3BPeUw2bktnRmRYVUd4djQx?=
 =?utf-8?B?OGJtbTRTelM0OStJbmtJRHgxcnk5M1VxQW9pdDZzNlJ3dmpEdWRLTTc1SnRZ?=
 =?utf-8?B?Y014WTdTck5yNVljOVNJemYrY09GdlpMVitTVFZiZ3QxMTFhTWJJTFRiM0pt?=
 =?utf-8?B?TUE2S0MvNHNtb2RLc3E2NzhaTmRJdndRTXVRUVRBUGpXdFY3K2Nkb0tkenJm?=
 =?utf-8?B?d05FemVNSVRaMVIxMGhsRlN1M2xkakcyenNXaWxHMVFpTFc5SmRXV2pHc2x1?=
 =?utf-8?B?Qk9pS2lKZ09JYjNHaEZLKzdtb2pUTlBIdHJTbUtCR0Q4NE9ITFNIQWZpbG9G?=
 =?utf-8?Q?xQ3ujFgLAADUd+WY/02DWaFUb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c5b763-713c-46e6-fa90-08da68bf44a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:13:12.7719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47zwHW2wI/ulD1PwRsOPzlCaLIgmSTEiX0+B8vvlacCWCO4/b4XgYU3kTMjrluNi9cW3ORqMKyxshV+Acd8W8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2894
Received-SPF: pass client-ip=2a01:111:f400:fe02::723;
 envelope-from=den@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11.07.2022 13:07, Denis V. Lunev wrote:
> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
> the first glance, but it has changed things a lot. 'libvirt' uses it to
> detect that it should follow new initialization way and this changes
> things considerably. With this procedure followed, blockdev_init() is
> not called anymore and thus block_acct_setup() helper is not called.
>
> This means in particular that defaults for block accounting statistics
> are changed and account_invalid/account_failed are actually initialized
> as false instead of true originally.
>
> This commit changes things to match original world. It adds
> account_invalid/account_failed properties to BlockConf and setups them
> accordingly.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Peter Krempa <pkrempa@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> ---
>   hw/block/block.c           |  2 +
>   include/hw/block/block.h   |  7 +++-
>   tests/qemu-iotests/172.out | 76 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/block.c b/hw/block/block.c
> index 25f45df723..53b100cdc3 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -205,6 +205,8 @@ bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
>       blk_set_enable_write_cache(blk, wce);
>       blk_set_on_error(blk, rerror, werror);
>   
> +    block_acct_setup(blk_get_stats(blk), conf->account_invalid,
> +                     conf->account_failed);
>       return true;
>   }
>   
> diff --git a/include/hw/block/block.h b/include/hw/block/block.h
> index 5902c0440a..ffd439fc83 100644
> --- a/include/hw/block/block.h
> +++ b/include/hw/block/block.h
> @@ -31,6 +31,7 @@ typedef struct BlockConf {
>       uint32_t lcyls, lheads, lsecs;
>       OnOffAuto wce;
>       bool share_rw;
> +    bool account_invalid, account_failed;
>       BlockdevOnError rerror;
>       BlockdevOnError werror;
>   } BlockConf;
> @@ -61,7 +62,11 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
>                          _conf.discard_granularity, -1),                  \
>       DEFINE_PROP_ON_OFF_AUTO("write-cache", _state, _conf.wce,           \
>                               ON_OFF_AUTO_AUTO),                          \
> -    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false)
> +    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false),        \
> +    DEFINE_PROP_BOOL("account-invalid", _state,                         \
> +                     _conf.account_invalid, true),                      \
> +    DEFINE_PROP_BOOL("account-failed", _state,                          \
> +                     _conf.account_failed, true)
>   
>   #define DEFINE_BLOCK_PROPERTIES(_state, _conf)                          \
>       DEFINE_PROP_DRIVE("drive", _state, _conf.blk),                      \
> diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
> index 9479b92185..a6c451e098 100644
> --- a/tests/qemu-iotests/172.out
> +++ b/tests/qemu-iotests/172.out
> @@ -28,6 +28,8 @@ Formatting 'TEST_DIR/t.IMGFMT.3', fmt=IMGFMT size=737280
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   
>   
> @@ -55,6 +57,8 @@ Testing: -fda TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -92,6 +96,8 @@ Testing: -fdb TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -104,6 +110,8 @@ Testing: -fdb TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -145,6 +153,8 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -157,6 +167,8 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -199,6 +211,8 @@ Testing: -fdb
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -211,6 +225,8 @@ Testing: -fdb
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   
>   
> @@ -238,6 +254,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -275,6 +293,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -287,6 +307,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -328,6 +350,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -340,6 +364,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -385,6 +411,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -422,6 +450,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -459,6 +489,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -471,6 +503,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -522,6 +556,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -534,6 +570,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -576,6 +614,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -588,6 +628,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -630,6 +672,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 1 (0x1)
> @@ -642,6 +686,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -684,6 +730,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 1 (0x1)
> @@ -696,6 +744,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -747,6 +797,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -759,6 +811,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -801,6 +855,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -813,6 +869,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -861,6 +919,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -928,6 +988,8 @@ Testing: -device floppy
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   
>   Testing: -device floppy,drive-type=120
> @@ -952,6 +1014,8 @@ Testing: -device floppy,drive-type=120
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "120"
>   
>   Testing: -device floppy,drive-type=144
> @@ -976,6 +1040,8 @@ Testing: -device floppy,drive-type=144
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   
>   Testing: -device floppy,drive-type=288
> @@ -1000,6 +1066,8 @@ Testing: -device floppy,drive-type=288
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   
>   
> @@ -1027,6 +1095,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "120"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -1064,6 +1134,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -1104,6 +1176,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
> @@ -1141,6 +1215,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/peripheral-anon/device[N]
ping

