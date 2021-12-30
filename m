Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC71481DFE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 17:14:26 +0100 (CET)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2y4P-0006yZ-2W
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 11:14:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2y2U-00055B-57; Thu, 30 Dec 2021 11:12:27 -0500
Received: from mail-eopbgr50106.outbound.protection.outlook.com
 ([40.107.5.106]:53063 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2y2R-0005D4-MJ; Thu, 30 Dec 2021 11:12:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAsGtDNXxbk+aZcLxCpltWkUvInsyRjoX5jvXgXIJ9pcz/QyxW3m7Mz6KEdPVBffA2rl3aMVxX8Sa62pByRgZjXJqNt7gC3byeWQriZMoXeoCmo8Q3wdMJRldsdPlpSzD7c4cSImr/PHuthHA4h4JqCdp+5jwrT8IDnfv7LwMVm1+k8xHKyhZvB4U0JnXl9tkpFNAjIgZ8iD8Lgf7ya0HuV6FBGD+JtVWBhfNF8q4VY+And3S7DLphy391QaWgvG6POMtVvqtFEVM5anWa0NIsqumelhYMmAM5b/hcMnkQfigoq71klIvtW/JZAwcZhcvTXRFShfqwxjJurojPTeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OyVIMJskd45u85Ndbq+bD14PXTimJ/UGJJrAaIz+7E=;
 b=BENZACM12DLWQ/ZwE/SjeyHWOtcZ9apBxQirlP6+T2YoUSgd6a3nIRlC4H+XnGaurKLVQphNQ+//p34/DS56x7muiommjRsDg8w/x15fUdNa6PxYg84zox5+VldbVGj+o0SDMuo+PeYoyM2PZkWMRuiEczCj+T5RRwXs+1drOhhlulSBHj1YI2jadQ7PHMKCUrfuM7wQrduDAr3H6eIqJiJAo7HE02p8SSgvDfMwk05nrC9WGVrh0p5ShCmJSJ9T8niCv29Zzgna/+8rSvpI5wfKoxZblqo7YPuO/JLvQkDfNECdERb0AB8jVwE0ltDeySsdKuC1HE6z4QDo1Xs6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OyVIMJskd45u85Ndbq+bD14PXTimJ/UGJJrAaIz+7E=;
 b=ZKUi+rdD1OZcahE9O1dbLcxBRC5SXirgMX9S2yeZg2iGD8F9QSW2/mWRR803/rrtjB4rnECALDbKYSokpOMtRsx1u398M36UFy7d0szc4mhl2NlnVxZ6mw5Lqy4SApGmeM0+U3GcSpe0BIjK2V8AhBicKkHBzzEyTzKysV001nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3844.eurprd08.prod.outlook.com (2603:10a6:208:101::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Thu, 30 Dec
 2021 16:12:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Thu, 30 Dec 2021
 16:12:19 +0000
Message-ID: <cd049715-f17c-d605-00db-1bdc75944fb5@virtuozzo.com>
Date: Thu, 30 Dec 2021 19:12:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] qsd: Add --daemonize
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211222114153.67721-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0065.eurprd06.prod.outlook.com
 (2603:10a6:206::30) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 519f1520-8a62-4aa6-e8ad-08d9cbaf27bc
X-MS-TrafficTypeDiagnostic: AM0PR08MB3844:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB384434363D864702D3099E27C1459@AM0PR08MB3844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uv0XQjnPvMlF2xZmlA+iMNfNo9sfRgnMU9LUvGFtF+RXrDX0ySPIEZYctrU2VRoaTO2pqjBdj69gdmtsjgYR3PmqYLo97k/KpnUkedRpUogGNraT4GEyCkvGDywkTIegvkd0LMJUEJmtoSy+RqKhmIPCXIh0WA+i1JQrDjIKAovhEu1CfTvNNCKmvzFnkMyKmewcM27Ih781U280itWayu682PpSwWG2Cz4jEbbcFVguTX9VEwqWkZU0wkLUKODJyRYqrw/jAZhqFA6fu7RA4O8sgUDhBA4cQj0nARXsG3VMHCPMAceDuuEK0qxEvaFwZ6n2taPNzzdTYL59DTfZidvFuNbV9urYq9VjSO/+uv653CrpGAsVQ3aPtmjoNC0WQjPonVfmh76auAV4lrKeuEiFblWRTNXvTEaVZnYpPyO1pjvo/NG0ok7GHGOMV4Vz4OPZDQrDVnrdjkRLswjbfPOzUHK9g1h2bxz4BbgmKmTy4wfLpQxEuWSflP+OJpaUCBnM5+wzYQStNXJZ3pDi9XQWxk6gQL37fvqQ3Hlt1FWKSGfQlWCDNiWh3N5XOQHN2eNqUcNoxfMgPp0taWWAWG+Hccru8D1k1U7f343jzih2gbE1gHWqL8Xdin0QUpWwPKJKgWtACqKVt3Ob0KJtPJV4G2Bn9hHXnskARXqJv2oeR301zVfcXESnq/HbWXZfs0LvE4B4blLNUq3EtIO4nJyTdH/dY4j0yygp32mkfiLDdIl4qjeNwKhB5MfToRO04Gt85IprLzDGEoeMNsrtKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6506007)(38350700002)(8676002)(66946007)(186003)(36756003)(4326008)(5660300002)(38100700002)(83380400001)(6512007)(6486002)(4744005)(508600001)(66556008)(316002)(31696002)(2616005)(86362001)(2906002)(66476007)(31686004)(26005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZllKU1JocW9WbjFiUnByb3IzWFF4bHJNMEhvQUQwWGFCN3pXWldzbkpVL3NX?=
 =?utf-8?B?d0lCQS9FTUE2eWdtVmZKcXlBbk95Y0hxREwwUVY5Nno0d00vNTZUVmlzM2RM?=
 =?utf-8?B?OHN4cnRpdTljT3BEZng0ZmtBUjNrQlg3YnA5eWswSmNQK2hnaEpZekNkcTNU?=
 =?utf-8?B?clpCaWIyMEtjZldQaVMrR3o3VnVOUy9PRFg5U3pLajZVbEk4VjZRQWQyOTN5?=
 =?utf-8?B?VktXNjVRQmRKOFozZSsvWkgxWHQ4Wms4VU4rMHdOc0c0T1pUNW5tY0d6VFR6?=
 =?utf-8?B?Z2QxZ2V5Z0k3MUFEbStNcDdFS0ZBajU1d05GVDNLQUhlUDJkWFIwRXlkdENL?=
 =?utf-8?B?RzRUd2hxclhtejZIRnNsamY3bE83NzRhSkM3SWg5VmNiN0E4dlR3TTZudlZw?=
 =?utf-8?B?L2Z1UEwvVEhMNk5nWSsvZWY0Rzkwcy83ZzhDNy9weFRQQXg3VGpmWEo1Z013?=
 =?utf-8?B?TEZpeTJyNmo4TFh2VnlxaHc2c1VsTzhCdUdST2QrUlMrYWF6eUNrRXNNSXRv?=
 =?utf-8?B?ZFZPNjlKNG5abmoxOG1FK3VJV0xZQnl6TGJVL1NkaXI5MzBKdk96TXBYT1Ix?=
 =?utf-8?B?ZjR0YWhkNzFFbzVYMXFDckJOTnh2bUh4NU45WXg2dm5tbml4bVlMdmUreU5u?=
 =?utf-8?B?K3N4b3BkKzlTb244cWJ0a2pFbkY5NWNOT0wwNHpycFdnU0djTWc5am04cjg2?=
 =?utf-8?B?eU1vRVRUTUM2UGhtWUl2SHhyMlo4QW12Z3RWSDA3akJQZGxoaW9mOUJkN3Bn?=
 =?utf-8?B?VEJ4ekZBUk5yZ0JlaDFUT1U5aGM5TC9CM0FPbEowNmRLT3dzd3RQaC9vRzhj?=
 =?utf-8?B?K2xKL3ZObUhhaEYzQWZuUFI4ZU5ranY4N050VW1RZGFRS0N0NmNWYzZlb1Na?=
 =?utf-8?B?bVhwemF5UzlTbzJHT280anVUQ2FJRHJNOHl3QndFSWFZZkpRMUhQUHgyVEpy?=
 =?utf-8?B?WUYrQ1dBRmFvWXBSb2VJQ3ZXTHdhOU9KbFpJMitSMUk3U0V0dmtheFF0ck1K?=
 =?utf-8?B?QU1QSHozaGxBWGJkTGQ1QlNMdGI2WHdkQmV2VjF2VHFROXFweXQzTGJxVHpE?=
 =?utf-8?B?ZGd4ZmQ5d3ljSEk0b0t3MXZ2THljdzNQSThwUGpjMzRseWE3UWUxMndxYTB6?=
 =?utf-8?B?bFRUYmIxcWtrOEU3Wk1PYjgyekhOSERuTVVxajQrQU53SkEzZ1ZWbXJnVlJl?=
 =?utf-8?B?Uk5ieVRRclZNSzV4bzQxOUFaMVlYSDd0TFByS0cyQ3BRek9xTkdrTThtU3lo?=
 =?utf-8?B?ZlhmV2NkcDlCYmJGTVYwMkd6djNHRlpldzVGaW51UFhmQWdjTm5tUTVBMG05?=
 =?utf-8?B?d25YeWZYTXRsSmZWUTlab1k3bW9JbjNzUUdYNkM0Q2ZtZUhUTjBJbE14MzZu?=
 =?utf-8?B?N3JFQi9nQ0hTYUFYZW93V3FDN0IwNUhGRE9IUjBiQ2tvalJ3WWdwNjNwY1lQ?=
 =?utf-8?B?Sk5rTHlKNHpGNEJGOU1tNS9FMHh0TFdOekN1a2IxQlpMK3ZHSnZlN1hTbkxQ?=
 =?utf-8?B?bDdGckpTU2ZrVktMeERwR2NsZFR4ZDdqR0Q0cXZLZDBxOTNwbG0xNFZZZmJ5?=
 =?utf-8?B?SitMWFk4UGZLV2s1UEpFL0tabFhSY0N4V0RSVzNGYUFwZXlTbW9UUmc5Nitt?=
 =?utf-8?B?OXZTWlVWY2p5QTd4cjNsby8rL0wxRnNlUHhxVGtKNkVJUnlSdi8vK3Npd0N5?=
 =?utf-8?B?Rmo0L3VmWHVSYjZEakNCY0trQXpZakFJdXFUV0gyMHJMNEdYWlZzQnI5WTNu?=
 =?utf-8?B?WVo4bkQ0MC9TQ0hzNUR4REwrRmc4aENTSXN0Rkk5UEVQazNBaExRNWdNZElH?=
 =?utf-8?B?RUZvUDQwZHQ4QXJhVkwyTmt0MW0zTUJjZnRaMkkrOWY4SkFLU2FaSzNxQlow?=
 =?utf-8?B?S1ZVYnBWc01ReUJvRkxaTjgzUEV0akxiZmRJS2dYcWpKOXdhYk9Gek9Da0E4?=
 =?utf-8?B?OUJUMDAxS2wxRWFEam9tYlpDVS9EL2k3YTJwblBDNGFDaVE3bnBUbzk0NmRQ?=
 =?utf-8?B?bmprQk04aWl1eVlWM1FpSUEvTHprc2d4Z2hoWGZmMzB2SDJ2MW56ZTFteUJK?=
 =?utf-8?B?SDhyODJpaG1XQzFvUHZhUHdmMDBnL0RRaUt3ZUZQNkxZa0UrVFh0c0N1SVlh?=
 =?utf-8?B?VDRPMG1rdTY1RVRZa3hVOHBnZmlPeFRxa1FSdFR4cHMyQ3pzMVQ4WldtVWZK?=
 =?utf-8?B?bXNnR2dhTlo0V0FQVXdXdDVEVzI0WVgrb0VTcmcxQ2lGZmdMK3dDNHBQMXdS?=
 =?utf-8?Q?A4BhH16k1Hh07s7vKqKk86cE1jQ51yTek5jMTBqyoc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519f1520-8a62-4aa6-e8ad-08d9cbaf27bc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 16:12:19.8542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWsVaIHv+DUu4bmbpma87p0LfCgI2clBWbSyGGqISwFpt7o3nPqK5j8ypm9YFuazBApU+IY49AcUWNecYkEMXV/IL8hqA210LUuBUiyZvfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3844
Received-SPF: pass client-ip=40.107.5.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
> This option does basically the same as --fork does for qemu-nbd:

Can we share the code?

Before this patch we already have --fork code-path of qemu-nbd and -daemonize code-path of QEMU.. Now we have one more. Did you consider improving and sharing the old code instead?

> - We fork off a child process
> - The child process is daemonized (closing its stdin and stdout)
> - stderr of the child is routed through the parent, so the parent can
>    see errors and adjust its exit code accordingly
> - Once the child closes its end of this stderr pipe (done right after
>    creating the PID file), the parent exits
> 
> It is not named --fork, because --fork was probably a name that few
> programs but qemu-nbd ever used.  qemu (the system emulator) itself uses
> -daemonize, too.  (Besides, QSD's interface is not compatible to
> qemu-nbd anyway; compare --pidfile vs. --pid-file.)
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>


-- 
Best regards,
Vladimir

