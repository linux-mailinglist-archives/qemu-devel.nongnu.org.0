Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCC6831C8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:46:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMspU-0005QL-VC; Tue, 31 Jan 2023 10:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMspT-0005Ps-9G; Tue, 31 Jan 2023 10:45:51 -0500
Received: from mail-db3eur04on2107.outbound.protection.outlook.com
 ([40.107.6.107] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMspQ-0005ZQ-TD; Tue, 31 Jan 2023 10:45:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ll3weMbMsYB5TYKI6wsk7DP1wib03mEKuLIVcn8Cagmh6YTwlxzSx1bD8bgzjgKkkrcmXUFIlS5Pzb9zUhTQtuK4V++54nptEIl+GD4q8+s15nOtjBKTj8lL/gKDF5u9V2LNXodZZ2llS8HxE7ofGEbQelFAezQjCKdodsMny035QrX5M1BOYmuubvjKlgmzkmx2lJ0kmddP+LhSDVds+oxUkURQRH3arJffSN4KTtFSgHT2C2tqkxkym3Gzlw6S6dbFdDDRSrlrELk05pQfxMqCdqWBXPMoJscdApSW6r+Iw2JtKaFLhUEN29vix0yVKFf+Xu4MYhV4ymIuiLu7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeS19xzLZ1XF9aE2YpDg6B6mNUXbXdhp098ujNC6Ix4=;
 b=G9Je3NhrTsLq9OzmZQMs9FGjiILqfcbYVUp9zE9RxsBnFzA+K6KpXhKw4GEu6zCSoZWfxd4zRuSvIoIsTcOcH6ji0XAG8IuGLkPn1sMItNYpa0/f0PHEdxPTJlgfcQAvoB1k0hW1b8E48RG2O8TMIeSxF2l6gPmd5uMLPp47XKRWVLO/DGQmcv/w4bExDUy80GsVPZeVGYG7vZCJBwfylj0FAoS4rmWgCcG8CZ+4ylf7sK2EyDhObcjChe9fp9TvrVqhgQL5kZwByiOi/2/Vb5tJBd/gS6qPOXoyxTBIH0kzKDFELyUyXdZfIXbFlM+EdQvexoZIsbXYIREeHcTK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeS19xzLZ1XF9aE2YpDg6B6mNUXbXdhp098ujNC6Ix4=;
 b=cuDXLynakqr6uKv/JHBRvUVgv6NmmXPl/Uu3+B+DUF99CilxbvMeAkG3kTZLgvvDsEHf31OTleA5BV3y5EjvSdS694CtG/HqQHGyeZsjrvoReoDnJq7mjaoj9fxD9xAUZ27X5uRuhVydKfzgz+kB5Zi8LvjT99rsD1J4xYldPF99ScKJX72uZXXhrhLaQESk96jFC/QQrkEF/LuE4ar5fQofRsDbRq434G5EzZ1SU2cH9VJKVmeZ3qKbc8UQFvx3REHUBTLABLl0d+78br9hSNgX2rerpqLzpsRcAjv4FQvYJPtMawdbJF/+yp4ehWnC8NzfQrrypxYcU6gs0LxQJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 15:45:44 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:45:44 +0000
Message-ID: <cd203778-0e3e-d63f-90af-c93f1136c825@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:45:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] parallels: Replace fprintf by qemu_log in check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
 <20230112150149.1452033-5-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230112150149.1452033-5-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0302CA0004.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::14) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DB9PR08MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9f5af0-4378-44f1-aece-08db03a236a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w640n+o1PRJmuOu955LdrFkaudohHFo9bP6zSXqSR4XbU/h2MndrucwjsjIRkpVtUKM8fipMVieySb2koMYB37u3jqkBAoIPLTi00GUhamPXjmUQSjd2i3qazolcnjNkgOv9siVx05Yq4AjsIKJBvOfU46iOfJvpPQ3Ycuy5yKR6bsxr19rz00T/cA9Ko8iDl5uIAmVNMSJGYcb608k0Tn8+0efQU1xn8bZLYLQv155mYFSkOqe/znB9nFI3NV7kmCRGJNgassMe816LWc//cH+ZoKZt1k2xAr2MSZFx7pIFb4NQay8+3WxQ8KUCf6G+Fas3xoYbAdDmHw95DseBdn4LftORxUb+AFOZdywvJaCe+HryVqUtxzB7EZRF1BHGbQUtDeHXjz8r/CdKZgoxhqP9HmsueWmAXyUQ5ees6ucujs1MTI6f7lTvX/GpPzFLbztNMchqjnA2z90Q+NPKK+bWYj5O/13NxYWuuTSJjV2riGWcOlo8v7XGP8akn/1266ovmehlgMaWRvefKQss05xA8e6HFDrrt0RU7uS+QGqAr1/ExuUTz1NLXrMIyEhkRbZ+NyuPFEXM8s+DMnpamqJ7pfQ/7pKM7kNReLka7fBcLt63VUEoNGqi6G3p9kMFGGdMVMDkwvuc5CFVfejTHywPZywk+XwB015kJV3dYNd++dwwPywNE2sVdpk67E7BtQ5DYhGHEat79kCFgP5r++TZ2Szwo0GrbrLPb0eJHx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(451199018)(41300700001)(6506007)(83380400001)(86362001)(2616005)(31696002)(38100700002)(316002)(478600001)(4326008)(66946007)(36756003)(53546011)(8676002)(66556008)(6486002)(186003)(66476007)(26005)(6512007)(31686004)(2906002)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVEN2t1S0NpZWovS1BKUFZxRmQ1ODMwZnFZNEVXZDBsdXZWdHNWS0hveE51?=
 =?utf-8?B?ZUNUTWlsUlBzTUVHU2NYVVRBYmtuRy9LYkZpR2lldzJsc0t1czFVSmJZQUpN?=
 =?utf-8?B?akdtVTVyeWhUREppS2F4Vjd1U2ZvRzl0WDhhL2gwUzVLWHZQUThiMGN4Mngy?=
 =?utf-8?B?VjljdGtSd21rZmV5WHRSSTFUbmxHaDV4R1JQTkxjTFRVQkdhOEVlMVR2UDQ4?=
 =?utf-8?B?SzJTYlc5enRWN09XVlBvak5MaXNwZFVkL1piK0J0OTVLejl4bDI3bGI5N3Ju?=
 =?utf-8?B?SnNqSlFYM1B1bzFaM3FkZGpvRmUvQk5FdkFiOUxBQ1FkNUhFNGI3RzdkMzJG?=
 =?utf-8?B?L0ZWTEpTVUVrR1Y2ZFl0TTd1S1I1dGZHb2RxdTZLZ3gzSU5aUS9kbUxiMFl0?=
 =?utf-8?B?QzBZSXZ3NEkzMU13MzNRczdzVHQ1U1lENGpyNlpHc01YN25RdmJBejJyUVhT?=
 =?utf-8?B?V09NNXoza1EydnlhellNWWRUemdIcHRDNlptM0lEQlhkZVlud0xOUEE1N1ZK?=
 =?utf-8?B?ZTdKcFJnck00TzRjT2dIc09OanorZGlYUnVOeCsrVkllMlFWREN5bjJ4ZU4z?=
 =?utf-8?B?YmxaZHhoMGFuajlhZERFUDNCdklZdWdxSUEvdDgzZCs5U2hDSkVSMlRiMm1L?=
 =?utf-8?B?Y3RIcG93djlnRmI5RFhWaXArekFXM1JaTXk1THRqUVFhQ3hJbmNZNlhMVTdK?=
 =?utf-8?B?Y3V1YmxLMUFrdWYxY2dGWkVkaEc4aFNwYnp1c3lTZzQwa0d3NDQxSjBRVXB5?=
 =?utf-8?B?QlE1ZmRrZW5tOWRhalZ3TEZORTdGRVZLb24vV1NuYmNNS1pHSHhHUXlrNDR4?=
 =?utf-8?B?UE1wWFRtYmpLNEMrMnhuOEFaR25GLzBkaGpnRXBUellwWGpzdnR4R2k5WjlU?=
 =?utf-8?B?cmZCOFFRWjMySldML2IrZFpyTzFYdEVicGhnRkNZWEdzakVEUmpGKzNqdm9B?=
 =?utf-8?B?NUxLWVFaSURMWm9ydTRrYldLd2s2V3JjeUo1ZDhueUdGdXBxeHp3djRiOWh2?=
 =?utf-8?B?dnlUZWVUK3UyNEQ1NTlXY015Y3RGSVFmUzNhdW5zTXR2UStMOHRlMzRiZHNE?=
 =?utf-8?B?QWtTSDdBb29QbE0xeHVhZjYrSHhTdnRzcHllL0pybHJrdkpNelRxejhYNjZk?=
 =?utf-8?B?bUFPZGlOR3pWNEx5aHlRL1NubG9DSFFjNEFnSnBvamV0QXlkejZvN3pMdmtH?=
 =?utf-8?B?U3NVN0ZheXJOSGhzTzVKSlF2aklCV1p6VVJrU2x1SzR2WXlNMlNzOFYzZUxq?=
 =?utf-8?B?OFZ6Y2tRK1dzTXF2N0tERU5Sc3ZUSjZGNzU4Y0x3QVFtYjl0RlFoMDJaSnJ4?=
 =?utf-8?B?ZUsrNUhGbW53bGQyR1V3L29WVnVWTERwdFF5Smx0cTBhbFVhaysySUprcGZD?=
 =?utf-8?B?cWxFTW9LNk1UalJiRitRcEFWOFdkb21aU2NsOVJRM2lFZGdpN3ZDSi9hbzEr?=
 =?utf-8?B?Y0NlMi9XOWZwRDBNdWROc0tmdXRGdCsrQTIwdmxTTDF5eVU2eFVHQ3NGOUhJ?=
 =?utf-8?B?b050OTVzZW1rM3ZMeXNpYmNkbk5SdVZHZnMyTW9xTlZndEFRYk1PQUJobXpY?=
 =?utf-8?B?U21Pc0hpUE1HN0craExvTlY3TU5WWWFYNVJHZWtJOHI4NGFmZWZpaVo2Qksy?=
 =?utf-8?B?R1ptWU9Zak9yeTdqcDhWdy8rYnd1dXVBL3VQNVNWYXROZHNQVm9MMTVlSnh3?=
 =?utf-8?B?cVVsWFh2cFJ3TFBsSVRGSmpVSDI3bnZ0Q1J6VnN5TTFSQm9GazRpZVVmRmti?=
 =?utf-8?B?OWtOdy91TWxZSG12V1hyVXRaVXhBN2ZzQVdXcE5hU251UEtzVStPNlVXbmcy?=
 =?utf-8?B?bW5xckR5aHZqVFN0Rm9xNkNXSGdxSjVuOHl6ZjMzbFZtMWd1c21Xd3grNXlH?=
 =?utf-8?B?UWlzalQ5NXd4ak9jcnNQQkc3NDVVQUF1dndRVFcrbk5SYjNETDJqcWZvNG1O?=
 =?utf-8?B?clREQlBqeTdRc3E3N1k0SWRpQ1lmQ2M5d3NnY3lWUExzL1I2U3VoM1dmUFVQ?=
 =?utf-8?B?VHRzRjVmdlk4VS9IeHdDRjVzNVJUdjg1eDBCeCtXdXFESHRxbXpablNLWVdT?=
 =?utf-8?B?TXdOMlZXVlJ6QUNEU3I2ZGk1N0xxanVtbG4xay9sVm9rQndpdnR4dWlNZWhO?=
 =?utf-8?Q?BrIa5vqnlVk52V+TndWvD87jg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9f5af0-4378-44f1-aece-08db03a236a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:45:44.2166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+THV1v9ch+UIKVMVQB+8Jl578LcY+3bI3tIsl1O53Uxs3u4fwW6TjyrSZRL/+de4LadSRpuRaIQZAN5pF4HTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7584
Received-SPF: pass client-ip=40.107.6.107; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 16:01, Alexander Ivanov wrote:
> If the check is called during normal work, tracking of the check must be
> present in VM logs to have some clues if something going wrong with user's
> data.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 73e992875a..5c9568f197 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -42,6 +42,7 @@
>   #include "qemu/bswap.h"
>   #include "qemu/bitmap.h"
>   #include "qemu/memalign.h"
> +#include "qemu/log-for-trace.h"
>   #include "migration/blocker.h"
>   #include "parallels.h"
>   
> @@ -448,8 +449,8 @@ static void parallels_check_unclean(BlockDriverState *bs,
>           return;
>       }
>   
> -    fprintf(stderr, "%s image was not closed correctly\n",
> -            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
> +    qemu_log("%s image was not closed correctly\n",
> +             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
>       res->corruptions++;
>       if (fix & BDRV_FIX_ERRORS) {
>           /* parallels_close will do the job right */
> @@ -476,8 +477,8 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       for (i = 0; i < s->bat_size; i++) {
>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off >= size) {
> -            fprintf(stderr, "%s cluster %u is outside image\n",
> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +            qemu_log("%s cluster %u is outside image\n",
> +                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>               res->corruptions++;
>               if (fix & BDRV_FIX_ERRORS) {
>                   parallels_set_bat_entry(s, i, 0);
> @@ -554,8 +555,8 @@ static int parallels_check_leak(BlockDriverState *bs,
>       }
>   
>       count = DIV_ROUND_UP(leak_size, s->cluster_size);
> -    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> -            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
> +    qemu_log("%s space leaked at the end of the image %" PRId64 "\n",
> +             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
>   
>       res->leaks += count;
>       if (fix & BDRV_FIX_LEAKS) {
> @@ -608,9 +609,8 @@ static int parallels_check_duplicate(BlockDriverState *bs,
>           cluster_index = host_cluster_index(s, off);
>           if (test_bit(cluster_index, bitmap)) {
>               /* this cluster duplicates another one */
> -            fprintf(stderr,
> -                    "%s duplicate offset in BAT entry %u\n",
> -                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +            qemu_log("%s duplicate offset in BAT entry %u\n",
> +                     *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>   
>               res->corruptions++;
>   
Reviewed-by: Denis V. Lunev <den@openvz.org>

