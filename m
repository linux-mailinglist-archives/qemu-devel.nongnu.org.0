Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943EE581055
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:50:45 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHDA-0002TQ-Nv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oGGz4-00031k-O0; Tue, 26 Jul 2022 05:36:16 -0400
Received: from mail-he1eur01on0704.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::704]:19110
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oGGyz-0007Ww-Tr; Tue, 26 Jul 2022 05:36:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRRaeQTVRiNO0ucV+AE7/yEuomwJpi1zsY+booq4Fzw0VYr3aN45rysRElLuN0n6uBhCyGbYg7x1uikM9Em6kYUmGMPtNeSa3mRukaQG5zYDT9nRjwz8BCC0+E7WHsy+J+WJuHkhXCuRUXhw+z9f+9hthf/QyOrA1cmsReg4rA5fz3AgCqoJB0CEVdUPKIS4uROZVIlw6rE0PueTKCxA7rT6/W0zB1jwEeTK+4SgkvT1sA6j0O+5AT4eSnjPJtH8JXJ8a5EkyNiN+3DNrY5BiM2CNb/8EsaHtYj37aFIa9L2msGljWf717XazgkE7cEwCHFf25NGTaWgQFWsMhn68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8+ShRSTv/mxWQh7pwCrdeaudeGedP4tmkBvd1Jve8M=;
 b=XnvOtRdjD5CunajANoZNE6TgMW0ImH4NQV8i6nZJphaKkrqtmaOb5vkWWCnd4VSpOiAXsz2VrQHjoCGQu4nXKLlbfwIDQFCL1vVFeob48+LjZ2Lxh9+krKr4Az8wxhbwEMtf/DXSR9jwxeCuIpk4E+eTIvWmSoXZxGsk6J5Ar1WQYzpowZYcba0zSYxbVbn46gzkbWXTh+473MtYMucHHHsmk9Kde2iemTY2Av55Bf7cI0hEgi7UsGT7oLrxZOEOofFOXAdgHB+s+s2T9yaGTWBgMFztgia7YPJazB0DdR/aBSCYYL7wnSMLuiqzPyzYNlALmGBB/JTH0mkw4DgnLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8+ShRSTv/mxWQh7pwCrdeaudeGedP4tmkBvd1Jve8M=;
 b=uOfX9vcvVFvpYTokwR1srU0disWZFXpQbh/tuJSvtXXxVYjZA8s/LPgow+ikwuprws0N76ypUhplv+U+FrXP4Oymyblunfgv2kvoUiWf1w6ANy+9lvVBLSGfIETFw0lrPLoG9mNI1LsDkdgPEBpKwuH9Sd1qKFpCbwxr+/N3HE5zG1+DWbgqMe55UmuREwSljGru7ulbiFv7OwHU6ZI79dbdC3lyQ7qnQgLYYnQpwvit9grEMA9TQksyyx5fliUDXQ+Jm8XFS86ANdiuYX9gNdRXBWsTmk3buKZetkQQCKSX4RPCxBxxgO+nKf/kvwu3aKySmYhxOb7r4Mi4MVDlgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV1PR08MB7729.eurprd08.prod.outlook.com (2603:10a6:150:50::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 09:30:54 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 09:30:54 +0000
Message-ID: <69ad1874-440b-ed0f-0403-e1296103bf6f@virtuozzo.com>
Date: Tue, 26 Jul 2022 11:30:52 +0200
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
X-ClientProxiedBy: VI1P195CA0044.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::33) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd13db3-7c91-4ba4-9568-08da6ee98976
X-MS-TrafficTypeDiagnostic: GV1PR08MB7729:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jyxWH9VM0jkFjuyNRe6Fhnm446RCJ7eRhpmuhX4pAVSiuD4urKMPH7A/ps3O7N6Uds77/SF6vks3NaMoCvQEV8jyXCALFJGzuhkC0mzNWzbfTrHF51V4qiXUkF0pvfVDqIEFWP8P+WXPaJmCNAOr7pPrA/i4hc+k1YuuySvamfFCz3S9C9O23ayqXIUWLXq5N7d0zfQ9oCW4wP0HwH3iOIKBf2bZbJ+3gmrSR77qUB/xWJAexxSu2IFnma/XtbluSEPMj+wpe+zb8uy9nQ1vZVltIkUfq1xuHW7thjBAjYIB8u/leIs6OXriglJd3UXpqpLYdj0+MaJaP/BZRspwy36ghI8n/nfsARS7fjLyRiGVvQ3kOw8IDZUC0az8EqVTyZSOtUOdNH8An7lsvz+LfAcRpd9j3HjTeHj0m09E3xcep6Mo0TQMbMNxQFMZZXcp+ikcGMFbgN3hQPPYG8IDC64dKf+CCUdGJGBDvAWXJlJe2ijIRY+O/QphsOXrwuwR898dwL4Rl8/2g3PZRur1ujOlU4DcoQJzilI5zsf2FSzRUhFLE3SBnYjioWIa+TQD2TDEZFQK9ah1Mod9u0k8pughNUGI4gOppuL6xhFTFZ+9R12JA/fSf8zTOS6gLcxp9o+zzHYBnEHmz2t8wNFZStPsqOKsP/Pzc1YcReHnScUPpkHMKqAReJUaHgO5vAxJO8VxaoxYw9EER8vQKKEGrWTIFB/7uMCV2/yUOa0bFgQTOD2g5RbGjUZOrwgltSk5j30JuLxOPpl9NVng0u3rolIGgoP0KJYh5x0FonTVI1+wZVHH7kMdfjcoAiUsmJST0Ncc52E+LjZ+6HUGAf0d6c3IMocsCge8+15ix4tU7lZQV9UzmJS8ca4vjT0xm+rU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(41300700001)(2906002)(31696002)(6512007)(86362001)(26005)(6506007)(6486002)(53546011)(52116002)(5660300002)(83380400001)(30864003)(8936002)(2616005)(38100700002)(478600001)(38350700002)(31686004)(8676002)(4326008)(66476007)(54906003)(36756003)(66556008)(316002)(66946007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDd2bUNsWEpxdjEweGRhQzd5VXc4UHB2ZVFIcDFPR210Zm11cWpxUDRyUEtV?=
 =?utf-8?B?aTNPMUh0eG1OYUo1dGpiN05DaXVmaFlULy9pcHdHOUM1MXZRKzlQeFNpOGlI?=
 =?utf-8?B?WjBDamIzMVZaSGdubGs5Z05TR2hJelVwalJMVklQMXppeWtoSFRvQUJ6SmEw?=
 =?utf-8?B?amoreUZGdnFCdkR0ODY0T3pGQkxpYnZTMlUrOTZoTjR2TERGZlhGUlBDMG4w?=
 =?utf-8?B?Z2RZMzQ4MExFdFZCcFRGUUhUTUNKVmRqSXFpQUI3L2V4Q3NMb0o1MjF2ZFpO?=
 =?utf-8?B?Q0VGdXE2eDdhWjgrK0NjMGcrQmZ1SW83eWJ4TGNOTzJ3MTVZcmdSdnJwVmVk?=
 =?utf-8?B?NlM4eUY0VDNFeVZLOEQ0cmZqeERTckNUZWdPMXA5dndHcHZCOHc5VmJDNWhQ?=
 =?utf-8?B?QzBDUXdsa2tQZUp0UjFJRDQ1TW5oeHkyVVVtWmd6ZTdVOWRodHQ3UnpyVi9S?=
 =?utf-8?B?UnRITlllVjgrQzJTc3VBZmpPRDlyRzdvRkZjbHlGVEdSMnoyb1RuK1gralFH?=
 =?utf-8?B?K0YyZDlPMlVNMEdERkRhek5Oei9RbmpURVFSMitJeW10QkRKZzFIcWNzNWUx?=
 =?utf-8?B?NUtrd3lhVUl0Zzh2NWY2Rm1VNVJBVUFraUU2eTg2ZzJ3R2wrSlpTRmxsb2dY?=
 =?utf-8?B?a0RPQWpPRjBqbGwvNzgrcG15RmcwdFJSY2FwNytRZjd6SU5qSWVCN2ozbTZU?=
 =?utf-8?B?ZTlKOUdyOVhLb01wNWVpZzhIam5nNi9iV0FVRUV6R0ZhQWJzb3FQdm1ybVpM?=
 =?utf-8?B?R24ySDl3NkhBK3YvV3EyeGNpWkZSSWZvTlBTbjkwYm9wVzd4UURTc3VRYXpW?=
 =?utf-8?B?aWZuYUlhZTh5WGZrNlg5bXAzWGE5SGc0dWgvL3pSejc3bHN2dmowanNWSWl0?=
 =?utf-8?B?VHFFMmp6QUwyMTdnWkI3NHZaK29XTlhjb05WdGRRVzhrS05tUkNVUkt0WmRV?=
 =?utf-8?B?MDgwbVB4QkM0OWpNREJ3K1k3NGJUcWdERTFaYkNmZy83VUxHL2R5VDdZV2N5?=
 =?utf-8?B?cTAzaE95TjJNajVmTEZMTEFmTnFPeVIyY0NpSUtCbm5SREI4TjBsQmd1ZGpN?=
 =?utf-8?B?UmZQMDFkM0hMdGY0S2ZmN205UXdIei9UaHdPRjZKQzgxMWxESDJtb0I2TTY1?=
 =?utf-8?B?WHMvTFNpTW9JaURrMk0xOTR2TjhWekwxbFlvWVFBczUzOFdRemdua09NYWU3?=
 =?utf-8?B?S0tVZ3plRk5NY0hnSklUUUpjWDhEQkxSaFFnSjFha3ArbVBSUFhKTzlBQ3dN?=
 =?utf-8?B?aDhsREZHQzBiRklqbk0zajBCWitYeVl5d0MyaHBoa3pRRUg1L3F1T0xERWF5?=
 =?utf-8?B?YjFJejNMSWZjeVkvNCtwUTREbXdWVGU1RS96KzZCNlNaWHZ2aEFzckNlMFlE?=
 =?utf-8?B?OGhnNzV4Z0UwMnJQQXo4VXdpVWNrOUVhSCt5QmZlM2pOd3dxdE95WmdhZzYw?=
 =?utf-8?B?dG0yWEhKU1N5ZnlHaXFwYmNEZ3oxcE91cE91Y3YydGRzTkUrQ0ZoelBKMEVK?=
 =?utf-8?B?MldmMEd4MGMwVmo2Q2o5cXAzcXJmUk9VNDYzSmJZSTkzd1lqU1dQYmxhZVkr?=
 =?utf-8?B?cTVyWEVVcDJVSUxrdklMbmgvV09tZDZmZytSbTFUYk1NbWZXT0Z4aEtaQVFG?=
 =?utf-8?B?R0RWY01FSEErWVFkV1VNcE5yOEtvWVVIV3BVcEJlZk9rZ1hKb1A1ajBkb2Jv?=
 =?utf-8?B?d3QxSUY4bjRjUmZpVU8rSW0zRTZ5NlMxaUtsZXNUUWZ2MTVjK3VTQ3dWUjBW?=
 =?utf-8?B?blJhWlN3MTZETCtsYXVwWmNSVklUM1J1N1dnQWQ0WUVTcEFqSnhOTnNBaEhE?=
 =?utf-8?B?S2UrM0ZETFB6RmVmVkhkcE81cnErSitlaTErQ2JRNnA2MjJtQ2lLd0ovRnRz?=
 =?utf-8?B?UzdCV0tHRllRRUZUY1haVlZKYmJrYVNjTXcrLytxSVdPZkpaTGxiem55SDYw?=
 =?utf-8?B?UmlUcnM3RXRXdjhkZytsMFZaU1p5UzlQQUd6YVpPWkpIaDgwRWl6Z3hnTmhV?=
 =?utf-8?B?Uk45YUNIYlExNE5qckY2WlFrY1IxVUkydlVIV2JGUlh6YnlVcmpJV3pJeEZm?=
 =?utf-8?B?d0dIODkwclM1MXpRUmNheDArQ1hrSmFIN2xHeTR2Zm9zWW9BMW10cWdpU2xD?=
 =?utf-8?Q?z3SBWc1rA73gfIWJFbIQjNeDc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd13db3-7c91-4ba4-9568-08da6ee98976
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 09:30:54.0437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1biYbsDJ6h6gFvCM8PRhh5DKxLLOnYum98bzuKLj+BYTo9IpeOdUv92UJL81Ne2RPD8vvDzIg0O6tri2ArXBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7729
Received-SPF: pass client-ip=2a01:111:f400:fe1e::704;
 envelope-from=den@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
ping v2

