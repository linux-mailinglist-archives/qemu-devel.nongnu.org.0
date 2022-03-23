Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F84E537B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:46:18 +0100 (CET)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1JY-0005fg-9o
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:46:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nX1HW-0004jY-T0; Wed, 23 Mar 2022 09:44:12 -0400
Received: from [2a01:111:f400:7e1a::70d] (port=13248
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nX1HU-0002vt-Mz; Wed, 23 Mar 2022 09:44:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dozHrJtkz0vqyAXdJjowwcrCwxYRJa3SuYndp9BlyfvASxgzp0+gdiIcKfRbX7jM9/OFkeIgJLqNp+UEHw2Ii3hOzZf9Jfy97b6ugOmz5rw80zTZYIRbpLF781euNOpimpgSK8/HM7Xlb0lbWh/RULXZL3QIqV9r81Zaf4Flfb9+z0I9FHywxPibGTPkMnRWz3o2/uJQ3TGppB8Rp+pTHjV2+r8yQ9zwjDrZs2i1920JeNkiPUgJybspsoZLMej4LYU+UojrvdrqPL1+5GgSZ02RFMNE8tviWV9/wQhFgc/MDAgYy7teZBAXm3Zvy5WVidGbnAtXRAXpsQ8HZlu+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a25IEtsTya85TC3wYeB2LvV4OsjwG9EcyxmcZjE5eqo=;
 b=EqaMZW5ZdkgnGp0zc8Vob62foNeduDUgZg3g3pDLVcr9+85hXcstBlC7GXFuhJ/jmg3IgPEnHn8X250OLFsjMLJbHuW6JWteFffqDSLoKf6npXPGjFU5DThqF0SdIkbRUazV/7B6Vp3Pxf47E1ew2Y1QcK+ltHFWbcjJFeUdwg0NW1rO2GVDn3n+iuxwnQOHFIi6HyS7gZsZL86w8DKMvE1jI81wgtej3IxV9l+M6qJTQQQUZlivLdV+CtZC868Dn1mm2+X3da24bNNBmfT99dw1OGlpV2U9omJQWXSZ+jhk97xLh8jc3AkV4dAUpzZVR5yVadJWmAAHbkYq+0UZrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a25IEtsTya85TC3wYeB2LvV4OsjwG9EcyxmcZjE5eqo=;
 b=dNUgYluMuXR2O057TSyiokmOwijqilXWjJYRderJdUC9nViE7YnlrukLwgbzlizres5eWMzI3gzX+iUrTyx8/X4tPWOv4HKSWXB9wARf+9DNfknRhsJllru9Zf2ExxykWEzPIYewjxcv5H2+diXm2bpsTwx5bk4EOLRmR3LSxJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 by AM6PR08MB3014.eurprd08.prod.outlook.com (2603:10a6:209:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 12:12:41 +0000
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::b94b:97a0:971f:bdd5]) by AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::b94b:97a0:971f:bdd5%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 12:12:41 +0000
Message-ID: <99437393-2970-71cd-d922-bc3b985b611a@virtuozzo.com>
Date: Wed, 23 Mar 2022 15:12:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH-for-7.0 1/2] block: Fix misleading hexadecimal format
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
 <20220323114718.58714-2-philippe.mathieu.daude@gmail.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220323114718.58714-2-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0205.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::31) To AS8PR08MB6946.eurprd08.prod.outlook.com
 (2603:10a6:20b:345::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b7b4de9-f164-45ae-80b3-08da0cc66da4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3014:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB30149870780A5E560BB8742BB6189@AM6PR08MB3014.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apfBhoWEO9RQFVBIX8pS5v1SgiPjh1OB9OeyxVy5QkLZix/Tbuz/4wdpYyA0eyDoHFq79wo/mAItJThcsAB4sAGr9n2/zB8HhnTsH2Xn4xCHEWVCEwPPTRggeuW7pCrBn34KBOK8cxnKda8lxmLJDDz+xGdPRdT6LgxS0+T3T9gAWcbDrmNH9a1AoN2U8icuHvaBodL4/549Zuq12Lbrnxvun+vx0d50NkW9w8C6wFHJx0xvJ037WoPzh1GWLs8ksiNvn/9ZwUH40qdbmR/XsQWHCRaS0hfiP3Y783DinjtUw/RYAUSIA4paUSsHs7srCOnCGilkKp0fm88XdE1H1DOhteUVCsTp5zBRYiAL/3V6JIyZLW/TQdlxzBXO+iKLzmyjHFckiuaZW04AVv7vutjIp9Rpm3Xz2+DRXhzeXYs+9/HKMXMvnOiJPwmMrMq0MvQXO1lgpQEX+ydrbTdkM9VDNGVE9QjXdv/iBCCZN5wwNl+VxWJZ6Zyunh+vZp+okL6M+mK2j+DGGrYPh1GylkBBMdNlnLhT9VdI/jWMJ1IudBF34uYMOgr6mvGG/CxZY0HGiBjIkBjBlvlTZgAUDEe35DnV7YbRPLrHICZTU2G8sWEgsROq1R08rmdv6A5go9xvP9rArhay06LpH61L+VTm/TeC0o6o6DEKbEcfL8iofx23LuUXxwHnEWBVlHM/n/OZ3+qT5nB3YflepjH6F1wJO9hxPhqEoqPiIA90ZCxYFpv10COtinSOD+2/CjfcSoVo8xQK7srsUJJETO1pnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6946.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(4744005)(31686004)(31696002)(26005)(186003)(5660300002)(7416002)(8936002)(38350700002)(86362001)(38100700002)(4326008)(66556008)(66476007)(6666004)(8676002)(66946007)(36756003)(316002)(54906003)(508600001)(83380400001)(2616005)(6506007)(6486002)(52116002)(6512007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJqTkxXWUV0bjc4VnB4c1MwQndvSGRSaHZaOWtKdlg2dFVST0dHdTh3azVn?=
 =?utf-8?B?QlR4SWdubk8zNG84TFJ6d1JBZjJkSmpCYTVYS0pLN05LdWRmOGMxSk5vU1FI?=
 =?utf-8?B?VlJ5dkp0em1zY2xXTllsb0I2MERVZXJFSlpOZzE3cXcwMXpQRmphZ3h2Rk9U?=
 =?utf-8?B?b2dnRWsxZVBYeDhhcldpLzhzaTZ6a2R5VHloSkF3RURxREFwUEljWlo4dEgw?=
 =?utf-8?B?TEo4NTY5VnJXb0pZUnpVZUZWSnM4Tm1LeTNEaXk1MzkrQ1g0dTJOdkZqZlBw?=
 =?utf-8?B?TDc1QW9iU2xSTFFjbWNsaHYza25XRkU0TlIvclFncGt2VkcrTGk5OEpQVytW?=
 =?utf-8?B?cEpOV0s4U2Z3Q3ZsS2E4bVlabGJiY2wzVHdWbllwVFN5WHJoL0xKQ3lMSERm?=
 =?utf-8?B?NTg0R1BZQjdFYWVOYlJwZmNIaWk3YndJeU1oSDNmRkd5bTVocHl5YS9paWs0?=
 =?utf-8?B?UVFEa2hVNnhONUZITlJOaURkeEltRTdoU3V3enV6cURkdFhiMEZ0NDQwNmRv?=
 =?utf-8?B?MWI3R0UyRVp3bThmNGhkOWJEWEhuUFhkWnE2QnVYV0RQRC96aE5GTVE2RTFq?=
 =?utf-8?B?SE5DTSthV2lyZWF4eDNIeHJPZTVVNHBNZCtVWExtLzQzQnI5STkyZnJMMVBn?=
 =?utf-8?B?Um1WbHlKOGFrVU5yZEZ6UnZzMU1QeGdnbzRGV3ZrSG9PMnFxZEVGMTdxbnhI?=
 =?utf-8?B?YXVZbVlJU3hWMHJlK1d6MFFSTDVrcnRGN1NDeXpiRHdpbmtDcWprTENkVWVW?=
 =?utf-8?B?YVZKQWNGL2xmdmZKSHpSUnRPcVdYZUJDRFVsSXd6RzR1dloxd3JOUzVZQUs2?=
 =?utf-8?B?NW54NkNFOS95cDMxS1BISjFwTkR6TCtHZnltWWpaTGFwMkVPVHB0cW5JUFVG?=
 =?utf-8?B?Mk5tdWl3UVVkZmlhNXNnSHJ1S04zREUvRHUyeWN5WWh2WkVhZVlnRGJEa2Q4?=
 =?utf-8?B?eFBBbCtuSHEvY014NWlkYVRreEVHQ3NPcy9kUDUwUnQ1Y2ROZW9RNU1zQXNa?=
 =?utf-8?B?eGFLL3RSdW43Y29jL09KU3ZicG1maVVHSGgzTmdhbnhtNVlNLy94L1k1RWRJ?=
 =?utf-8?B?Y3k0RS9BRmw0YWlrZ2tldnRjQVcvVk1SRnBvbGUrT1B1L3Vsalp0Q1lmMVdH?=
 =?utf-8?B?Sk9oanl5L2diVEsyVDhXNkhjd0d1SDFzYmJVY3JnYWpZeXJ3WUpaOFc5NXVi?=
 =?utf-8?B?c3NQS1lGNFRvM3g0VU40S1NnMEZjbWtqcTB3Y3Z1VHRLd0VjN2c0MWpNazdC?=
 =?utf-8?B?MUZpTXVxTlFKaXFMbFJPV09EaDVrbHczQk5IZ2krejh0MUhjUlJRZXAxU3F5?=
 =?utf-8?B?YlJmdU1FQklDOXpZenhhRlFtcVJlVkhoWHF6dGp0dW5SOXNPZ3lVdWdNUUZo?=
 =?utf-8?B?azJhSEpUZ2poMEo1ZjFVSHNuOXlrOWMyNVV1eXF5d3pXdmZxMm5BRFZKZnI1?=
 =?utf-8?B?VG5meFcrbVdpVTNoU3JaNnM1OW03TTJZdHVLZFVJNi9lb0J0bVMrN1V1TG1o?=
 =?utf-8?B?NXplMXJKMU5PdnBaNHlTdm5oU01ZaWRhUStEbmxpT0ExRWJ4V0djQjJpbm9m?=
 =?utf-8?B?a0ZvdzdPSVYrdmprb285R2ZWbmhmclB3MlJVd3p0Rjg3N3A3MEJwcWhNWVJj?=
 =?utf-8?B?TS8zcjZDUCt5Ykw3SHZRSFoyaDZ2UmRRWFVHUEZ1WW1tbkJETjVzSFAzWFg4?=
 =?utf-8?B?THBDdi9wY21rWTlqNHNJeGpleEtiOWFmYUV3SCs4YUMwYWxiOWMxb2g3QmJT?=
 =?utf-8?B?MzNiNnBaZFB1SXVVcTRGV3hXam1BK3hTOWFiZmUyQTBjMS93NFFTZU41M2FE?=
 =?utf-8?B?NWFFdytYRXI0WVd3SmlIOFVDbzBoWWRvaVRhT2tGMHZtbkZ5LzVqNG9FdUFk?=
 =?utf-8?B?dXI5RmQzZE5hV3pJb2M2djQraDlJc3l2ZDVWaU5xVEc2VlRyb3kyZWxUc3Vi?=
 =?utf-8?Q?wWSrCV7Mjb/ytCsi4T1NzJk0FCpQG4AY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7b4de9-f164-45ae-80b3-08da0cc66da4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 12:12:41.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+YK0nLv/5k+6x71rKEi7Tf3ZWIHnyGlaJpq6oQkDRUc/3UXcqyD3/Tevndomzq0MnWLBIGZGkIVUdd5C1Cl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3014
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::70d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::70d;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 23.03.2022 14:47, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> "0x%u" format is very misleading, replace by "0x%x".
>
> Found running:
>
>    $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' block/
>
> Inspired-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/parallels-ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/parallels-ext.c b/block/parallels-ext.c
> index cb22a427d7..5122f67ac2 100644
> --- a/block/parallels-ext.c
> +++ b/block/parallels-ext.c
> @@ -261,7 +261,7 @@ static int parallels_parse_format_extension(BlockDriverState *bs,
>               break;
>   
>           default:
> -            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
> +            error_setg(errp, "Unknown feature: 0x%" PRIx64, fh.magic);
>               goto fail;
>           }
>   
Reviewed-by: Denis V. Lunev <den@openvz.org>

