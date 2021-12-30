Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE91481DEA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 17:02:12 +0100 (CET)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xsZ-0006Mg-6v
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 11:02:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2xrF-0005TD-9P; Thu, 30 Dec 2021 11:00:50 -0500
Received: from mail-eopbgr150128.outbound.protection.outlook.com
 ([40.107.15.128]:24718 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2xrB-0003lq-Qi; Thu, 30 Dec 2021 11:00:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+0WLfGYKMDZNHwUrAcXmDz40M5kZuqWYVviZEnJeur77KaCqs8BqV5byj+vEy5ktpi2+91tmPujAkcPRz7NjXRnMYe0zLLg549zoOXnXvWt0wUPcdSu9h0pqovZzkxqUF0dPRHcE1Mq9FCqqGNzdEzkJ8Jrg8PdjiPjDJrVDC1LAP9mr8VsD59O4GZX80D8S80hJqEx1DF3WE7XIp0VYZmMo0SR8B2myvcDTiRQbcslA6cAquc2+IHsLsqOmN3Cu4rovWKHjhz2RRsbILlTkMhlU/xY542Kp/QN+465yv3um+K7wm1PUfPO9UMTvnLv88SOFS8nHDLvM/HYIWZVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK5X56380ZdpKKBijeXvwE6Phj3D+aOc75Gu2M2DPx0=;
 b=oQgz341JRNl+IEr9KLPfA+Plh6EAmvc6aotjEdanHZsJO0wOvYYaoErVaOsuzyn+3W3tU1pvEPCtLQUHfqxDDZZxXwAEI7PeVxyTKLX30zfqVDjk1GGsSRuP2BxBStZYggScCwzTzXm/tYCx9YNtxwkpsMs3VZCvXQk34RhWpphaRq/v+zNRqCSt68D3pvSn+oQqML/R0PXZH9n466bBh8pJKwzhAcqFgXXOxDiKE3xl3bqb9eH7AJn27lGeBw/azzBnSEdWSIpdNgWsb9bMLXu2gyAjEMpsJymLdcnqvmUlQje5I93zGoALWg42zNlQ5oshc8uHCw2oTdD6vLBDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK5X56380ZdpKKBijeXvwE6Phj3D+aOc75Gu2M2DPx0=;
 b=L34H67b9hDZaEqo52t8B0FL7kVopmb2FKVgVI4q2LpV9IEaAlTOFkCI7YI8ZwSBrLw3a+oc1ESlX/AgEc6YaAIQUe7cYKjGoGV7g6E52bXOy21sK+xX87FtlqfQcP3hTsNvEn0OyIiHHr5YaBL3+ZYpRAVvkWNQXtXT/+O9I9v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Thu, 30 Dec
 2021 16:00:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Thu, 30 Dec 2021
 16:00:43 +0000
Message-ID: <45780114-34ab-a0c6-87ed-3b26ba4cbbd2@virtuozzo.com>
Date: Thu, 30 Dec 2021 19:00:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211222114153.67721-2-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6511ecd-032d-4f94-c686-08d9cbad8860
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB285171367DF18242857B26E9C1459@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0az5EkUqoJPEznPUGFgJlcBWbPmwlmBReQILmZuqe0BYCvaP7jaX4MkfKZa7nqJHC8D5rka7mZ14w6sz1uMEYBo1uUryNd0EMRVj4AIoizGgv5VNHYV/LohL4eATipkW7cxPx7OHlz3MRhfD2jxiUXZTziFID7W6TAhxzuUcwt0dC4r6ymFFPnHCEuPZPwOw1mz93NzsGo34/JBF6xNuNbZLEgB2utwsgofftAmRyxpQ5piuEaR8EQWPjozDy002h4qlegIpnNJvL5ouPwam03Dr95h4Y8AJ79AafHsGmzulEkCZFd8A+ydxk2gWJ6EE6P6IkaRAFZpureql4VtOgXqfzeN0CxuPXUq8w/DTDRDj6s4hOgARHva91rdfD7s3fW5FrRfcrQcXMdzyV4oQexOs4r8M2+lSbkhB4x2fAPr/CrZ8nhewcR42vOXuPO8nuthBRuJKEkuzzm2z9BojQP+ds57kQWTP3xxLD5Zl6/GiEL94aQPG0i5k2J2zvxHxbhrDj7QoUWA64gtfqorX01mIPoSYxta9UaMl9lpCAZ/u8RXCa0S1+5Em3+jlzRAIPoGP255v8+uned9+UE1VKEIub5wQg2zKo1EP/z6y+LhWACnpffTV2W8vUUpxTBVvGDrQh+8gKhd8hpjlitmtkNnPd98luDWIerjK6dEUx07bFpY4dmkRoDZSC61I2gNZCJoizOuL3DtTLwNRUS94qvjMi9/pXZUcYhvhWhFuYaTj7zsoQiwRRc8trbRqQNyRxKn15r4AvL912QakXq+xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(31686004)(86362001)(5660300002)(4326008)(36756003)(52116002)(8676002)(508600001)(6512007)(2616005)(66556008)(83380400001)(66946007)(316002)(2906002)(38100700002)(38350700002)(6506007)(8936002)(66476007)(186003)(31696002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K090MjBTQ29TMnkrV2hVbSt1dHpkTnNBajRjb05MTGJLYzFkdUJhTHIweWZI?=
 =?utf-8?B?QmtDdERuTXR3Qlg1QVByYmNoSVdtSVpZZ1NSekY3dHM3STErYlQ5dkVwTER1?=
 =?utf-8?B?cGM0dUxpS2VxbkNZMHluMHhpbDNlS0M4bURodHVKME9uZWVpMkl1NVMybVIx?=
 =?utf-8?B?em9Yb0RNNEEzUlVpNTcvemF4UmM5aVB6a0J5OGxka0h2SlpGTVp0Q2pqOXVM?=
 =?utf-8?B?NXJwSk9JU0tmWnorc0t3clV6VVA4cnhHL0lTZVRlK3RFMEE4SzIrU2Y2REYr?=
 =?utf-8?B?WENuY0tlS0NVbUFFZzZ3K2I0MW5oZ1JaejJPOWI4RXBVd3hFWk1ZeDBWeEJW?=
 =?utf-8?B?VUd3OGluQ3ZJdkhPNG4xVjVwV0c3WVdvOGxlOEgrL0NoNWQvZU1hZFJRMStW?=
 =?utf-8?B?bmk5WEo4cEpkQk91dDZRNitrWUtDSWpwWVZVTHphcklGdTc1d2c0eTUza1Yx?=
 =?utf-8?B?cmFkamw2dWNNckJlaHVBQUI0NVNlQk54OEd2ODlIUnI4MDNlTHhXMmlaSlNy?=
 =?utf-8?B?NUxYb1hhMEV0MDhFL1F5Z25qWDlLQVRrZDZpQlZWZGNLNVV6Q0RHcm5oRHVT?=
 =?utf-8?B?S1lkTUxvc0oybkpZN1BrVzRvOVJnbVFPNEZ6a1pWa0pKQitEa1Z6OU9jTlpN?=
 =?utf-8?B?RG5lU0FlZjhIUWNSYThUNk5SeGEwNXl1TSs0Z3J1c2pMNHJkZjNGY0loZlhH?=
 =?utf-8?B?OGU4MlBCejd3NEwxSEw5ZER1V3BsbW5qWTNxajJ3SGtoclBRQTJOU2ZlK3cx?=
 =?utf-8?B?K0VCQ0s5MS90MG1tdVZEYnlNcG5pWml5ZFpNdnpHbmMyVmwzYms4TkdWV1Mx?=
 =?utf-8?B?UUVrVUtHOFpZVjU2UTM4cEtiZ1JSckROMWJVSi9ybDMvaVdaalhPalRFMDg3?=
 =?utf-8?B?QU4wY1p6SGZLZERFYlkxUmUrWC9hMGwyREdUWjJ2NmNCUnRXK21GYURyTFFq?=
 =?utf-8?B?U0ExYmFKUWI0a2RUNjJmVlZySjgzaTZkMzVhWUxLamMzaDJDQzdvbVJObDlX?=
 =?utf-8?B?QXprbXFVc3VrNGdidHFKTjZwOGRzaERadGE4QVRKVjFHY2MzV2E2S1g1ajRh?=
 =?utf-8?B?WEtNd1BET2JNZ3ZUMU9oUGRqZVdxakNRUDBUSXBXdjR0RnBlOS8rTnZFTXRh?=
 =?utf-8?B?aUFpRkU1RFpRQlZFdTBMUUJ2WEZVN21peGZJaEw0VWZKL3lNR2lCZnVISEJB?=
 =?utf-8?B?Z2R2NFBFVzFmRzJiNERReXRMOC9sZEE4VitWMzZmTnltQnBMZmtNRytoUkRq?=
 =?utf-8?B?ak1zSnNrazJXTmNzclQvUmRjRkNWSG90UUExV0JBS2YrTU1ia3NIQUZVN1Zt?=
 =?utf-8?B?aTFIZ1FEbjJOeGdoWmkwVnZDNitQTWZRakd4L0pvc1gyMTk4cmE2eHpNNEVJ?=
 =?utf-8?B?dEV1NmJvbWhnSHZva3hETzF5QzZhamJoVFp6NXRpM2JJY2hadE1SbEpxYzly?=
 =?utf-8?B?dnhLdmRZMVFKRUhtNjB6a045QWlBUXFJdVJnZUxRbENQZUlHSTlHc21GMzNi?=
 =?utf-8?B?OU5ua0xsZnAvU1Z4L0M3RWdweVo5VjQ4R1JsSGhST2s0WTVyNm9vRTJFSG9R?=
 =?utf-8?B?eFVOUUlEZlJ5dmc0U2hVcXlyTmxCZXJEYmFHbXMydnZLcXhpTGIvQUVuaXlV?=
 =?utf-8?B?bUE2cERLQnBRQ3ZSNE13ZzRvSEJBRVRVdTd3dFRrZXNOTks5VElwQ2pPU0Zz?=
 =?utf-8?B?N2drQlI2ZTkyY011VlFFcVZhMTVNdXFUeDJ2VlprT3B3ajNYS3dYVmpyMkE5?=
 =?utf-8?B?OCtNeUVVNmNBVXpVdVRmTXp0VnZjakU1NEdmMUtONWNORlRGWVkvMnBvNGhj?=
 =?utf-8?B?TFV5cHI4MVErZjJuTEhuUXUrUnhGS2d5UkVLU2FGbjV1Y0dFZ0tEenUzS2gr?=
 =?utf-8?B?S1FIWjArV3B6WmpaaGRIV1Y0cXZYdFIrRTJBZVdyVVMxbmtaR3FiQTRPNkJM?=
 =?utf-8?B?QW9KWU02YmxWWThMcTZLeFl4RjVBQmRUK2NTeTh4bFFjaDB2OHNGZVFrZmF4?=
 =?utf-8?B?WjNSdzdsaXlxdkRaSHdZdXpCREM3WFBQSGNMTTdwczh6VXc1YU9DcU9Ka0lv?=
 =?utf-8?B?bVhybmVudHhVZWNZRjhhVGpWWGxHUW5UZmFXSTdkQmVORlU2a1dOQ2ttVkJL?=
 =?utf-8?B?bTBiMUd3QkdSS08xS1loaENNM0VFVTJ0NjUwL1M5WkxjZEpybmFMWklhUUJy?=
 =?utf-8?B?Q0ZTcVFwVUg0UkRWZHd2NEdtMDZ2a3pYUWhGWWZYV1YzMC9jMTd4dkdCMERQ?=
 =?utf-8?B?Qk9NQUpXdGR1LysxVDlsMkhRMmV3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6511ecd-032d-4f94-c686-08d9cbad8860
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 16:00:42.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PivGvdEHKJpzHfvqNuQtih5bU/k/BSPzFdLreuiy0n+7OaAGOgG7/aV9PvJP4FagWGN4Td9W7OKMRGRj2qFbLHOq1IXin1SUgxoSh/tOzvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
Received-SPF: pass client-ip=40.107.15.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
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

22.12.2021 14:41, Hanna Reitz wrote:
> We want to add a --daemonize argument to QSD's command line.  This will
> require forking the process before we do any complex initialization
> steps, like setting up the block layer or QMP.  Therefore, we must scan
> the command line for it long before our current process_options() call.
> 
> Instead of adding custom new code to do so, just reuse process_options()
> and give it a @pre_init_pass argument to distinguish the two passes.  I
> believe there are some other switches but --daemonize that deserve
> parsing in the first pass:
> 
> - --help and --version are supposed to only print some text and then
>    immediately exit (so any initialization we do would be for naught).
>    This changes behavior, because now "--blockdev inv-drv --help" will
>    print a help text instead of complaining about the --blockdev
>    argument.
>    Note that this is similar in behavior to other tools, though: "--help"
>    is generally immediately acted upon when finding it in the argument
>    list, potentially before other arguments (even ones before it) are
>    acted on.  For example, "ls /does-not-exist --help" prints a help text
>    and does not complain about ENOENT.
> 
> - --pidfile does not need initialization, and is already exempted from
>    the sequential order that process_options() claims to strictly follow
>    (the PID file is only created after all arguments are processed, not
>    at the time the --pidfile argument appears), so it makes sense to
>    include it in the same category as --daemonize.
> 
> - Invalid arguments should always be reported as soon as possible.  (The
>    same caveat with --help applies: That means that "--blockdev inv-drv
>    --inv-arg" will now complain about --inv-arg, not inv-drv.)
> 
> Note that we could decide to check only for --daemonize in the first
> pass, and defer --help, --version, and checking for invalid arguments to
> the second one, thus largely keeping our current behavior.  However,
> this would break "--help --daemonize": The child would print the help
> text to stdout, which is redirected to /dev/null, and so the text would
> disappear.  We would need to have the text be printed to stderr instead,
> and this would then make the parent process exit with EXIT_FAILURE,
> which is probably not what we want for --help.
> 
> This patch does make some references to --daemonize without having
> implemented it yet, but that will happen in the next patch.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   storage-daemon/qemu-storage-daemon.c | 37 ++++++++++++++++++++++++++--
>   1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 52cf17e8ac..42a52d3b1c 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -164,7 +164,23 @@ static int getopt_set_loc(int argc, char **argv, const char *optstring,
>       return c;
>   }
>   
> -static void process_options(int argc, char *argv[])
> +/**
> + * Process QSD command-line arguments.
> + *
> + * This is done in two passes:
> + *
> + * First (@pre_init_pass is true), we do a pass where all global
> + * arguments pertaining to the QSD process (like --help or --daemonize)
> + * are processed.  This pass is done before most of the QEMU-specific
> + * initialization steps (e.g. initializing the block layer or QMP), and
> + * so must only process arguments that are not really QEMU-specific.
> + *
> + * Second (@pre_init_pass is false), we (sequentially) process all
> + * QEMU/QSD-specific arguments.  Many of these arguments are effectively
> + * translated to QMP commands (like --blockdev for blockdev-add, or
> + * --export for block-export-add).
> + */
> +static void process_options(int argc, char *argv[], bool pre_init_pass)
>   {
>       int c;
>   
> @@ -187,7 +203,22 @@ static void process_options(int argc, char *argv[])
>        * they are given on the command lines. This means that things must be

So, --pidfile already breaks a bit this comment. Still would be good to adjust it now..

may be, s/options/QEMU-specific options/ or something like this.

>        * defined first before they can be referenced in another option.
>        */
> +    optind = 1;
>       while ((c = getopt_set_loc(argc, argv, "-hT:V", long_options)) != -1) {
> +        bool handle_option_pre_init;
> +
> +        /* Should this argument be processed in the pre-init pass? */
> +        handle_option_pre_init =
> +            c == '?' ||
> +            c == 'h' ||
> +            c == 'V' ||
> +            c == OPTION_PIDFILE;
> +
> +        /* Process every option only in its respective pass */
> +        if (pre_init_pass != handle_option_pre_init) {
> +            continue;
> +        }
> +
>           switch (c) {
>           case '?':
>               exit(EXIT_FAILURE);
> @@ -321,6 +352,8 @@ int main(int argc, char *argv[])
>       qemu_init_exec_dir(argv[0]);
>       os_setup_signal_handling();
>   
> +    process_options(argc, argv, true);
> +
>       module_call_init(MODULE_INIT_QOM);
>       module_call_init(MODULE_INIT_TRACE);
>       qemu_add_opts(&qemu_trace_opts);
> @@ -335,7 +368,7 @@ int main(int argc, char *argv[])
>       qemu_set_log(LOG_TRACE);
>   
>       qemu_init_main_loop(&error_fatal);
> -    process_options(argc, argv);
> +    process_options(argc, argv, false);
>   
>       /*
>        * Write the pid file after creating chardevs, exports, and NBD servers but
> 


-- 
Best regards,
Vladimir

