Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83159D69D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:26:05 +0200 (CEST)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQAe-0001mg-Al
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQ8O-0007rr-M2; Tue, 23 Aug 2022 05:23:44 -0400
Received: from mail-am6eur05on2092.outbound.protection.outlook.com
 ([40.107.22.92]:53472 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQ8M-000517-Rp; Tue, 23 Aug 2022 05:23:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTMsPJC5iNETBdFcFKyKzR2JoAN4VFAEB6qvMj+5AythAWpvGLrgP9FgO54lhT/08EBRY4eWRb+WEuTqjvGHJwCVidyw2Bj9R/lcyJJBfTs4jehmeuffHaXo3Vj61diHUxHWR+1lvvYix4u1OwHvHpHqlAhTzve14lzQbIqY3tJh/yxB9bRfkL4/wR8gEWooxQ3/5ONrueOlNacz9fT+noBAYGhosHFByudRNTTmzjaA4lHVlgIDhTQSxN2xpTVnu44su2SxK8Xv7GCuc9LgFSehj0g7v07rYhlEvrzbnzPK1CDfWNrOpeFK6hyLPY78Sp+YTJUwI8NGmQ/r9fxNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fQKyihu50wfLRm1xG8dPeOP38Hr3RUchFxYtKTWD0Q=;
 b=hEcx0lQf87QHjlg0Vh+Qg8sU7kDbyF7de9TrJ01iZLo4P/+uoEA6nGThSQjZKVYQ0IMKbmh1hzH73aCg1ahKw9JDc7ALLneA04zQfdxLTUyORePCpteObjrru4uXHiIwlxTfTZu3mJkRd5UVLqG2hpQe0UkAq54qq+UZv7o1uG6HgME9TNZIvNMZ3sqCZPl0IAxpr117iwExsupXtwrqtJ4NjcTS6TsDbf96Kf5jbemqySY5WL3fLa2Xr+uW7zyh2hYZj6IQb0HWgRdLsgYhvCgXUSw0C/vIdc6Ys/AwkD8qSg1RAKBLrvADOTppon9v9ysehRYsfwxQHfdsJpOJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fQKyihu50wfLRm1xG8dPeOP38Hr3RUchFxYtKTWD0Q=;
 b=bMs5I4mqfty2E6faNodFBqTZZegmdBKVjtt+ReqwtbUDZ98A4yXC1SlaU7R6D8LnFLEl/Edz9HTanCAMXufqHBPtfp/taJ9NY3rKm/8CDcXwf5oUmXo25kVZxU13DdR8OnueVURn2I3qCN2iGRd41AmwqYFfopy0RkSLNt5mqK8yzQVQFTjcF6vQvwLjObO+N8JSZUVNgwdYaIlCPB+Kgoo/vQzCcMCfUsfgX/6uNtYwnCiol0qqLcmx5ilrCSL3nq9UXlXNnGRzHLxw7SXmjubkau1iSB7zS38Jcjw3YFU/2OmHDEnLOpSFgaMagfGzY9fML6c9TT6uglUNNbQ1Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM9PR08MB7184.eurprd08.prod.outlook.com (2603:10a6:20b:3df::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 09:23:39 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:23:39 +0000
Message-ID: <ac737410-851b-7494-54e1-d981157c7aee@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/9] parallels: Fix data_end field value in
 parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220822090517.2289697-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::36) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 443ea6bc-b825-4f59-a26f-08da84e92978
X-MS-TrafficTypeDiagnostic: AM9PR08MB7184:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yP9WcMRaVHO2eAFw1+JIiildeajBbWzaPiO1G+URZv90wjIC2LN04EoorqeXVzo8rxg6c1mCT01dQDhaTkexXmCpHa5gaOMrSMpw+hDwIXdd1lv5IL33mIgQ6Agd6WJSiSZJHLiXXcsyzeN3Uh60Si88snbkLXM4usLQ+0x6PGn+wt1Hl20LDzJyMMxxk8ZMxoJikB8cWYZMEOqO7svzdmQirQDr5CucEC/KlPBgerRzdkbkKh/pBbOfyukyicsUmqoesiSPOOn02waxFk1UjcYGQa53hFJBiVk5dv+PBQ2Gk/UZiLEi8TK8K5FHNhX3icdYmBK0qHi/Av4qCvNnqp5AvvKZuu/T+MuviNLOiuHsbeSuPGn9aAFWtVkCxI3LPecVGcA0fasU9MKczVJ/5tGqg6WoTaSIRjWc1xXs7fubi1YUqYkCaun++hWtDBrDkIQKSiaOCkcsF8yTVwwwJ77eaUlzGC3DL43DS4OpxFwv9EQUjNC9ntelTMqHqJeecPJoSriGRY3tP176ir7u7XhXK3CIOROjWtmmz2TjnBEVTINIvIU2cGvzBo2zC4ilxFZn9gRbRxT4mCjdMRLhwUOYDbf4BO0vRxLcksOsKE8TUPyr8wgmaiUeSWRCiqZiM0sbLwVsIW78eTBg/Iq2v9WAV+wkocn4Dudl7HqD4P/WNaI74shgY6oFwltXcULFfd1EmL8Wx1piGkvETdjjq+elDLG+5MLL3YBBaxZL2Ln7NBp6oc8+1DnXTQ7q5gAbRmfevI9hbNfovwTs5FcwoLSu08K4oBqpeO5yqbj+zdgRIQGn/XBDGGBxfbLo7pkcSub5U6MF0BfjEHR58rjHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39850400004)(346002)(136003)(366004)(52116002)(8936002)(6506007)(6666004)(26005)(6512007)(5660300002)(53546011)(83380400001)(31686004)(36756003)(4326008)(66556008)(8676002)(66476007)(66946007)(316002)(31696002)(86362001)(2906002)(38350700002)(38100700002)(186003)(2616005)(478600001)(6486002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpQbnZKc1NHZFpaeTVyM1pQNUNVNHdxckthMytSbStHK0F0QU91OUR3R2li?=
 =?utf-8?B?azVRWUlBeEtBYkUyS0FVZkRxa0s3cStRdlFtUE5sR0NmRmxlKy9tUFVhelNz?=
 =?utf-8?B?blFMTVlxSUF0VGRZdzFsUTc1UCtQZ0V3enpjWFgzWnZ1MWJqWldKN1JVejRp?=
 =?utf-8?B?NGZiM3JmMG9ZdTJ3M1lBRFFDRDVQbXRKbFZTNDBvT3FudmpYMGZHTG91amVx?=
 =?utf-8?B?VTI5YURmdHdRdXN6dFBNQTlnMmo1OGhHbWxZVGlCMTdtR1lXN3E2RC9hUm10?=
 =?utf-8?B?anhyUzJjMGI3a24rUjJTSmlMQjcrWFZqUGhzK3doM01PamtISjNZdkxoNExL?=
 =?utf-8?B?VVdRdXFDbVhYL2Z6dTArSjZuNUNGcWN0c09LSU1Qb0txdXdGZ1VydE8zcU5G?=
 =?utf-8?B?dTNCY3ZzdkhWN0UrRnd5MjFUSGQwWTlvSjhvbVdKMXl1TjhmOWYxaHhwQ0lh?=
 =?utf-8?B?aExGZnhvU2dsNkZhZGxyeEVSUEJaQjNHNjdkWTcvSkNqc3NIL2Z6aWVadFh6?=
 =?utf-8?B?NnNFOHlXb2VwK21KWERDWnNMUDl6V0o4REtlQTh3eit6R21pZzI5c3BqVnlH?=
 =?utf-8?B?cGxhR01EdnFaL1JCLzhIVXpGclE4Q0lRVHluQ0t4UkxkOG11VGo3R0lKbk9R?=
 =?utf-8?B?ZGxVNjNRK2ltSFdKcmh2b2lBS25oR0hxUFZmUHdyRHNYMGdzUkdDT1dldC9V?=
 =?utf-8?B?V1BlR3g3TG9NS2lYc0Q1N0E3QTdoVDJKano3Mmt5NEY0MHpXUi9ZUXBXRHZh?=
 =?utf-8?B?WHg1akRRQy93eVg4a3gvS3BVKzlwWXB6MTZQRkNEOGRFUWZwNU13eXIvRDA1?=
 =?utf-8?B?VytEQVNNQ0J4UnFwTTNwdlNrUmRtU3JZR3ZLTXc1RjVDa0hDVlE0Yjd2ZE1p?=
 =?utf-8?B?aExQSmJrS2NtRUNmRWRxV3laMVh2VlVFT2s3L0h4bnV4TU85bWxsaG9FSS9T?=
 =?utf-8?B?bjBnRkpDQTZ4bnpIYUc0ZHBZc1ZMcmxtSEZrWjd6Q0VtVWlPL1drcVhkRmkv?=
 =?utf-8?B?aWQvTU1HRVZSRzRZelFGTWlKUWtwcE9QUVJHSFJQYUJ3cUVNb0QwQ3QzWFho?=
 =?utf-8?B?U1JXWHd3MURUSkFDSWtGc29udWRzSWxGNDh6RlFITHdFMlNrQnJCN0lVWjFP?=
 =?utf-8?B?Wm5tZjNPWHNFY1ljY05BdVp2ODhRWFVnRkVGYkJRRGlWTnVHRjFGM3dKWnFp?=
 =?utf-8?B?SWNBbnovVS9XYm05U1FrcytkcU9keHlqQjd2OTE0ajVUVXVrbVp4STgwNTc2?=
 =?utf-8?B?Mi9Sa0FWVTR3WVROc3JRaitFUU5yWUFZMHFhY3pwOXBTUDk2eXpwbjBrZXB1?=
 =?utf-8?B?b0gzaHJLTER1M2dOS1FienBJRWY4bHFWNXYvK3RVTHV3OUlOT0JjTlBoelNp?=
 =?utf-8?B?dE1MN2pwdmlucEJqUFdhM1lFTDc2SVFsV1lqRCtFMzdQU0RpZnY3eWhPbGho?=
 =?utf-8?B?eU9mdUI1UDFLTEdCd2VUVTkyM3dDQW83K3Zyc0JQdGpkZXNPWTZFOFNBODl6?=
 =?utf-8?B?M2pKeE5WVkhWeUlialliK2lZYzhWanZMekVRSWJNZi9CVnUyTjJUNUNDcnhv?=
 =?utf-8?B?SXg1em9kaFlOblowYjVXMFRqcy9SVUEwRmFGQVZ5TmdMNTMwcUtPbmE3Yks3?=
 =?utf-8?B?Y1pwcHBUZm9WNng0ZUl4QnA5L0dNM2VDL1FMNkQ0VXhDODhJait2ak1XcTZx?=
 =?utf-8?B?R0QyMUVIMTlkOFI3OXBTdXJmL0oyeDBlVWIzVCtFSnFvdTJnMDlzR3hyVHl2?=
 =?utf-8?B?NDFNcUFZN2IrZkRSS3ZnMzRMVlJvSEI3QXJTZlRFQzJpV2JmR1YvVWJZYlFk?=
 =?utf-8?B?VGs5RCtXdEpHc1ZyeTVhcjNwcTljQ2Rad1d0UXJuTUZtN0JYRFl0Y1B5QWl5?=
 =?utf-8?B?NEZBSTVLVlQ4VlFKMnBDU3lOVTJiMlR0RWQ3aktDcGVBb2tKMUZ1QVNzbGZO?=
 =?utf-8?B?cWF6cUw4UHM0elJRUmMxUVltQjFGaENQYzBnSDhMOC9iZHg5L3ZnZHUzZER5?=
 =?utf-8?B?SVlac1MrK1B3MXdYWWdBZ1pNY3AydXJLWTAxZ3gzWHdDMDB3NWRPU0tKNzBy?=
 =?utf-8?B?aW1RWmJxUTFIN1MzU3lhWmpPTG5wRktmbG9pRE1DdVVySVRzMXQzM0pRYisx?=
 =?utf-8?Q?s0LAWLJaUlyvtqjSYzoFKHqXO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443ea6bc-b825-4f59-a26f-08da84e92978
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:23:39.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mjS6k1J9CjHAZTeGkKy3G7AcW8As5bApJcO8epDEzmX8HcIrHHeLNrTwhyYkL6HwvNPIrk5rjYt5xoPBFNBaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7184
Received-SPF: pass client-ip=40.107.22.92; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

On 22.08.2022 11:05, Alexander Ivanov wrote:
> Make data_end pointing to the end of the last cluster if a leak was fixed.
> Otherwise set the file size to data_end.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index c245ca35cd..2be56871bc 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -513,7 +513,15 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->leaks_fixed += count;
>           }
>       }
> -
> +    /*
> +     * If res->image_end_offset less than the file size,
> +     * a leak was fixed and we should set the new offset to s->data_end.
> +     * Otherwise set the file size to s->data_end.
> +     */
> +    if (res->image_end_offset < size && fix & BDRV_FIX_LEAKS) {
technically this is correct, but please add braces around
(fix & BDRV_FIX_LEAKS) - the code would look better

> +        size = res->image_end_offset;
> +    }
> +    s->data_end = size >> BDRV_SECTOR_BITS;
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>       return ret;


