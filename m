Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764EE5B244C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:19:54 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLBx-0006f4-1g
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oWL8A-0002Lk-Iz; Thu, 08 Sep 2022 13:16:02 -0400
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:53504 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oWL85-0008K7-R6; Thu, 08 Sep 2022 13:15:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODEj25AdtkfzwHTc5xOPUblyUr04VVTMl1f7sYp2p5w3v7Cu8ncSy5xYIR90m7AyW2NXQ6pQqP/6ckaVV1GW/gkaBTOOgdKtafgif0EoqQ4PjvL3fYOB090gPWd3tXILa4dhTYwAzbs1DnzW7Ei9x1zNQEHXKwIwJHAey1QF/7L6dtaF8JtGC4vg2mfaBtaG1vrX+CzfmsYczk256Jmwvl5BJNNnUhnpOYWAdPR0xhvToyx5UTMTODjECMFuiO/09XwhhAVQvzfdUGD3DYe1QIUyAZZVToz8XAFY+lLFsX7V+iUHRjsrSP4H3v2sGFnTj3ATO6+ek5/oULxPTVns4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjzHBjhQsW35oXdITlFW78kYqDLAOcg/GrmV9/rDcGE=;
 b=ZHANEAN/xBAoPGjV8xWDzNL/ILQprpHbntTpRqHyTu+HNtuCDG3si10yBXDL6LV4J71/gaw0YKOSUveJv0PxuQM8oYCeDOMxs/8ocBIqepal0aAlYy+nm27kETWsELdfWCEOVVnGv2TUAy4CVYpOPh5QTfVuf+O7Q5cGrRM3+5fEOW/ajshgVH6iVd3tnc7YEk2O/25oVAtXdF+5TknGVoLcWVrxlQWPPKuVPs2QLDaZLtqeH6n+sUU5mt7UekleVGyLgzLQcm33uDWcDBPvLiXjFlcCrBUcH9yTKEZD2ZPmNs9EaPclNXYssnxy2P1grZKk/Cam/wUjGh+aE3ELCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjzHBjhQsW35oXdITlFW78kYqDLAOcg/GrmV9/rDcGE=;
 b=uwDOW84kBt1+7Jy7IKTdFMVMXvPN9EY9kkt9MuiZMBbLC22RZTpPCj6qnBTHi6nmQkhtrgt67pBA1B3yZljeS1cajOAU4NgCn/sqP7r5rT55iizMvxH3Lw7HxiJ0aOh+0rJ4ThcctnrKFnT7TBl2stCWpXfSXVJpQle8ROI5i+SkTk5F8P0wEmJTc8PhdDYaiAmt8DUyzsZNqCMvcx6rrgUmC7+YxtSSl8x4WJ5Al94tjIvWRsVJSyS7g8hyIN8qWCMWZ4AcVdWxkQk1dqyp0Vlf+TUrHUa96mhyl+NKyqT8+W/+evEa3/4d1iFKEi+LD6MYgGBu36a90WYd/gB96w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 17:15:50 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8824:508c:fb16:ef6e]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8824:508c:fb16:ef6e%5]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 17:15:50 +0000
Message-ID: <5d046d0c-a618-a7ad-3657-ba46fcee50aa@virtuozzo.com>
Date: Thu, 8 Sep 2022 19:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0171.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::19) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS8PR08MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0f3ce3-9c50-41fc-a1e3-08da91bdc6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zW3pz0l0XK/bFJ4A1+VYeVB+q3yEMieds2Mjaw09ydmfl9bHGp878NYml4WKRLA3g2hgeeJ7NlRoVVDbX5cJ44P0M46eXa0t/bihB2gKd2PLsj/T5FUbOXTJiA6VWDUfcjqAMxuQBDSZRpo88rrbRPV8tmqynVHPyR6vJ2M1ltTZO3B/B8zQZ0xcjegmsqe2meS8h0n9IDkPZ4+bn36rNGfuMsj70KeWJl2c6mRVq87ZB8WZQUlSXavo4wSN4FXsLb+JDZpKzosoHGtColLVcZj/c5TFFxfSwD9XRvd7SsddavConYokT3cLSGWtN1iA5+Gz7t5p7MIByEFtKdeoIC5j+xCC/JzOFCP8lLQooG70nAwZBuMbtjm2YjzX03VQa87nPIchJikyxuBa1pvWrc7FRMANIrz18eZQcxWx7qAcZCN5BmKEe7OBHkOEUZF+u5HCD0RCvoYgbjb2CV7kYeaDZ8MPLhTRgaGchK1phZvpnKrfGxM+9MMIrkvOYlCaX00+WyIeroYXFPYQ9gnjKOKvtZ7LnAvdO6LsKx5ml7g5qDL0l4GXBVIyUX5LP6P7Zx8NwAK1V1NpaMQgrp/3mVe8+VwsvgtzdaDHrNu3PmCBHfSPxrGADoGVK3XS9Z2qmPO95RsGE6XjrCsTb6tOMvqywGHgHFFbJYOo65SgQCQMKocctPTTXeSjQQ9xMJ5dWxmK2jNuRAGO8vk/8DkaT2yeGzp9BLDqGq+uOP6tJ88m1VuDiyN+cOTdjsGBPysfGg6lFUY3f8zgAEtJQSGqv0NYgd8mBFYk9AQLXqY8izFWGfJK67jnVsTqd1HBIO7lG5GCmPpjaeDwLUDgzvs5kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39850400004)(346002)(136003)(8676002)(186003)(4326008)(478600001)(66476007)(66946007)(31686004)(316002)(36756003)(6486002)(86362001)(83380400001)(66556008)(2906002)(53546011)(52116002)(6512007)(26005)(41300700001)(8936002)(2616005)(31696002)(38350700002)(5660300002)(38100700002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmQ1NDhqSmF0Z2lPdHRFUVhOMEVZMFU5RThLY1JnSythbUJUNHM3enkvdlRt?=
 =?utf-8?B?bjRhdkJhT0psK0YzZHZJeVlVSDcxbmtQMTlMaUtNSFlNOEFzY3IrcDlHb0NE?=
 =?utf-8?B?YVpUcFliOU9hRVVRbk1mSXZYdEpiT2d3dEY1Y1Z6Y09LYlVtM3FmMGNJUHN3?=
 =?utf-8?B?MHhWaGxNMHd5Z1B0VWJxazRIYWt2SERVdVUvaElCRDIzcW9OeEZhdDBUb05J?=
 =?utf-8?B?ajZyOW9XTGlhWjBRWjI5TDY1ZHpmemZXVjZwQUM4RHZ2ZDhZSHIzT21hb3hl?=
 =?utf-8?B?MFR2NUVwRWZWdW5DSGVBYUhUd2ZmVXdwaTZtazVCcWd1UTl5b3pkcHRJUWtZ?=
 =?utf-8?B?TmVPVnNQVFlZZVdTOFJSVTdCd2wvWXl5UjVpZG9heWNiK1cvaFpYYjZ6VFdU?=
 =?utf-8?B?YkgrY1dKNmhsTEtMcWRjM2dvVmZRZ3lKTmExNnNyRVoxWlQ1Wk9uc2lQb0tF?=
 =?utf-8?B?cVpuODVKSm10YkZQYmM4UEhPWE1vODNIc2tpYU9JeTM2SmF0ZXVFN1psU0pm?=
 =?utf-8?B?NFA1ODdJR29sSER6YVd5eGE3NjJJc0FTbUpCS1VuR1cxa2l0dXRERjVJNFl0?=
 =?utf-8?B?dVB5cEpOeXFQVEkvbzhjekJQTXhIVGU2MFpQZ2pWV0g3REhDSzJ3M2FQenNt?=
 =?utf-8?B?TjVJazVoaDJ1d3pKdFcwWFhoMDNLb0dpREg0WUR0ZUsyOTlCalRlVW9YcGp5?=
 =?utf-8?B?M2x5VzVBQXBPR2JzakhGTnc3RkptMVBBRHFBT2h6cVMraW1kT3BHMTVXeVJx?=
 =?utf-8?B?MWsxaTVTL25aZ0tHeW9qUGlnU0R3bU5xcnB5K0k3VnhEWmc1eDV3akFSWGpj?=
 =?utf-8?B?clBmZUZva01JaDhSQllocTdrWnprRlBSL3puRWppNzFYa0NWcmdOaEVibUth?=
 =?utf-8?B?cEF3dHl2OENqcEx5UHYzWE9NWjlEQUs5bElRaFZib1pwVmNXTTlLeVNyUGRM?=
 =?utf-8?B?R295a0J3UW52Si9TcDFNUUNxVENBcjhSZklrMjhWMGpIRGZxSmpWNkpiQ21i?=
 =?utf-8?B?T0lQOG1sRCtFUGs0ajZWeEpHVjJzZ1JlNXNudW1IYTJpUGd2RE9rT2Q0Z29N?=
 =?utf-8?B?UUl2cXVqY1lKdHloSWE5ZWZLQzlnbjN2U0NmWmFpMGJKUUQyNFRYUGJiZTd6?=
 =?utf-8?B?VzJRNGtzRnJ6OEJRdUthajdKd3NTeUhaRTNTSmhRVTRUenFlWCtnSlI2Z1RL?=
 =?utf-8?B?UjVabkFUSUhtaDdUdmZ4WkVueW41T21ScFhvV0xERWdna3B0cFNEcElDYmVh?=
 =?utf-8?B?aFUxQnBxYkd4MkxLaDNZZklXSUQ5RkNGczZCSWJNM05lUVRuVjc2V1A2czF2?=
 =?utf-8?B?dWNzR0hjV29iK0RqUjhHTmpsbURNWnVoNlJiUDJ2SHdOOU5tVHpZTWhOVHZZ?=
 =?utf-8?B?NjFTK3gvNHB2MVJBRGV2THRmcHcvZjJCRlEyM0d6ZmJPejVqZ3B0ZFEwcGlp?=
 =?utf-8?B?REtYRmZJTmkyQTBwY2dnL2tkUllyeDJLMXBMeC9qcDQ5K0svdHZ4ajZPVnBz?=
 =?utf-8?B?bUdhaXBjQnd5ZHROdi9mYlpkMDBoSjRQSEYzRDVZS1gwN2xuQmJMdlRxMVMw?=
 =?utf-8?B?WW1kV3RzSVc0WlpxUFI1RFRxZVVNbGRLaWhuZVQrdHN6RGdQam9DSHdTTWhr?=
 =?utf-8?B?c2JFalZhbTFuMnpOcjRJUmNJQ1FSQjdOYXlUTFprbHBYUXd5ZVA1cDhoMGtC?=
 =?utf-8?B?WkUvK0ROVkgySHV5Q3Y4bCthTk9tSjFrb3RockJIZm5sZ2dLN1pYcytJbmNX?=
 =?utf-8?B?U0hSb2tpSXVYem84ZEptV2pWSzFXRk11TjNlU1U3SlAxU0JiQ0hGNTBlVzBT?=
 =?utf-8?B?U1Y1bmRRMGo3UGYyTklYRzJhbStvbDFGWXRma3hNZ0xObzgrVnhKb1lBNGlV?=
 =?utf-8?B?aThZcjI3dldvSllMMFRLT2c2KzhqR1NFUlBnZ0FycWNyQXlHeHFlWnJHNFdQ?=
 =?utf-8?B?U0loNTVRdW9lUEpnaDBGVENhVmdvVlZzbStUSzZDcHYxR0sxRHdOWUNmdlVG?=
 =?utf-8?B?LzNSQUNhcHNjK3ZiK0syYzJwcm9aNHNCMFlWcEtpb01ldGQ0REJhRlBydmJs?=
 =?utf-8?B?OVpJcm0vY3E5UjZlYzBMWTJIb2RJUHBRTnMvOHN0NTk3WWtHbHozbzhGYitz?=
 =?utf-8?Q?SQUXvqpbmo7DBWtBfupHO9dpk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0f3ce3-9c50-41fc-a1e3-08da91bdc6e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 17:15:49.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OLSHsYMv4US79M/+5rPpftfjfQAHy9MBNLLO4mcvJHKH922PsfWEevrYO2hOmLKZXr4DZ6sQR1K7NOWTRwWyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659
Received-SPF: pass client-ip=40.107.5.93; envelope-from=den@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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

On 9/2/22 10:52, Alexander Ivanov wrote:
> Cluster offsets must be unique among all BAT entries.
> Find duplicate offsets in the BAT.
>
> If a duplicated offset is found fix it by copying the content
> of the relevant cluster to a new allocated cluster and
> set the new cluster offset to the duplicated entry.
>
> Add host_cluster_index() helper to deduplicate the code.
> Add highest_offset() helper. It will be used for code deduplication
> in the next patch.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index dbcaf5d310..339ce45634 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
>       return MIN(nb_sectors, ret);
>   }
>   
> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
> +{
> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
> +    return off / s->cluster_size;
> +}
> +
> +static int64_t highest_offset(BDRVParallelsState *s)
> +{
> +    int64_t off, high_off = 0;
> +    int i;
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > high_off) {
> +            high_off = off;
> +        }
> +    }
> +    return high_off;
> +}
> +
>   static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>                               int nb_sectors, int *pnum)
>   {
> @@ -547,6 +567,114 @@ static int parallels_check_leak(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static int parallels_check_duplicate(BlockDriverState *bs,
> +                                     BdrvCheckResult *res,
> +                                     BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    QEMUIOVector qiov;
> +    int64_t off, high_off, sector;
> +    unsigned long *bitmap;
> +    uint32_t i, bitmap_size, cluster_index;
> +    int n, ret = 0;
> +    uint64_t *buf = NULL;
> +    bool new_allocations = false;
> +
> +    high_off = highest_offset(s);
> +    if (high_off == 0) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Create a bitmap of used clusters.
> +     * If a bit is set, there is a BAT entry pointing to this cluster.
> +     * Loop through the BAT entrues, check bits relevant to an entry offset.
> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
> +     */
> +    bitmap_size = host_cluster_index(s, high_off) + 1;
> +    bitmap = bitmap_new(bitmap_size);
> +
> +    buf = g_malloc(s->cluster_size);
> +    qemu_iovec_init(&qiov, 0);
> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0) {
> +            continue;
> +        }
> +
> +        cluster_index = host_cluster_index(s, off);
> +        if (test_bit(cluster_index, bitmap)) {
> +            /* this cluster duplicates another one */
> +            fprintf(stderr,
> +                    "%s duplicate offset in BAT entry %u\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +
> +            res->corruptions++;
> +
> +            if (fix & BDRV_FIX_ERRORS) {
> +                /*
> +                 * Reset the entry and allocate a new cluster
> +                 * for the relevant guest offset. In this way we let
> +                 * the lower layer to place the new cluster properly.
> +                 * Copy the original cluster to the allocated one.
> +                 */
> +                parallels_set_bat_entry(s, i, 0);
> +
> +                ret = bdrv_pread(bs->file, off, s->cluster_size, buf, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
> +                off = allocate_clusters(bs, sector, s->tracks, &n);
> +                if (off < 0) {
> +                    res->check_errors++;
> +                    ret = off;
> +                    goto out;
> +                }
> +                off <<= BDRV_SECTOR_BITS;
> +                if (off > high_off) {
> +                    high_off = off;
> +                }
> +
> +                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                new_allocations = true;
> +                res->corruptions_fixed++;
> +            }
> +
> +        } else {
> +            bitmap_set(bitmap, cluster_index, 1);
> +        }
> +    }
> +
> +    if (new_allocations) {
> +        /*
> +         * When new clusters are allocated, file size increases
> +         * by 128 Mb blocks. We need to truncate the file to the
> +         * right size.
> +         */
> +        ret = parallels_handle_leak(bs, res, high_off, true);
> +        if (ret < 0) {
> +            res->check_errors++;
> +            goto out;
> +        }
> +    }
OK. I have re-read the code with test case handy and now
understand the situation completely.

The problem is that img_check() routine calls bdrv_check()
actually TWICE without image reopening and thus we
comes to some trouble on the second check as we have
had preallocated some space inside the image. This
is root of the problem.

Though this kind of the fix seems like overkill, I still do not
like the resulted code. It at least do not scale with the checks
which we will add further.

I think that we could do that in two ways:
* temporary set prealloc_mode to none at start of parallels_co_check
   and return it back at the end
* parallels_leak_check should just set data_end and do nothing
    more + we should have truncate at the end of the
    parallels_co_check() if we have had performed ANY fix

Den

> +
> +out:
> +    qemu_iovec_destroy(&qiov);
> +    g_free(buf);
> +    g_free(bitmap);
> +    return ret;
> +}
> +
>   static void parallels_collect_statistics(BlockDriverState *bs,
>                                            BdrvCheckResult *res,
>                                            BdrvCheckMode fix)
> @@ -595,6 +723,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               return ret;
>           }
>   
> +        /* This checks only for "WithouFreSpacExt" format */
> +        if (!memcmp(s->header->magic, HEADER_MAGIC2, 16)) {
> +            ret = parallels_check_duplicate(bs, res, fix);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +
>           parallels_collect_statistics(bs, res, fix);
>       }
>   


