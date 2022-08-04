Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D6589E92
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:22:24 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcg3-00071A-05
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJccB-0001xy-40
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:18:23 -0400
Received: from mail-vi1eur05on2118.outbound.protection.outlook.com
 ([40.107.21.118]:15137 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcc7-0006GE-CC
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:18:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMVLjb7W7SwXnmM1z4fpnzyg0XrWv8dFFfVlRtWBmk2yo750MPMaNyBNf0NKYwWe7iwi01DsIN4TKtzzYYFHdlcC6eXtPpHqmUutQX8UGoBMD2X68gtBWtCx6fU3yEcGxFumwUqabjuQlwRlAFylzibTMHw3N71YpOMh7FdcjQWfBFne+OvBVNwyo4E68OQHPX1nFQnWR8lvkTSkI7Pc/C5RWAbJ11q4fuLjAt+pT1ktakJVwg6LMaSb5GaNWumLHjcCphnD3Wea+BN7TryXXXa3hxalicbhC7ZhN0JXomnBE/W074A/ewIjtT//yZeGmjTIV2hL70raXQRtvESRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah3ANEGQdGo16491DZ8BnJbG3A6nvoBt2cSOl+3/5IQ=;
 b=R3BuifsVbMWrUZaEPdYVdbGSb7IbhTrg327v7GTZ3RSbUGPTXep+FKr7wsmD73sJQyCcCuxPfIHsfR43RKGYhJgzrFbA1zw4VHsCioMTVFxqdDdhlCLfZ9/otshjzgdAjN5JY1FaumGFp7K8K3pSKoHWYpAnw6uE6wjvObmXq0DmcGhHLJVNFPYGOFx+ynQ+upd1tKVGm+50Umn2UETd5iJerReNzEoNAioGK94QIyC+j4fGYe3I69b/9h+fAW9lhno6MIhbktPh2W7dHCafGybPKVJxkKdtNnTmUnpHw6PGAaFuBahMFl0WGtR6Wuf90tP8ZXWQRB/7rYKdt/TgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah3ANEGQdGo16491DZ8BnJbG3A6nvoBt2cSOl+3/5IQ=;
 b=GP/RhPYW3OuBHf1B4BlOR4fLNgyhl18vCyHvKx2fSdLZe7Vu8iQ89n6JoiZoXB821OpQg/+6bwjAiP972+taKbX6sHzwtoenu+DpiOhZAp/mP4S1dBnNRhEWlhLp600BHFINH3QP4Sa5valt7mhboY3a30PowPYg0ThKjzyWnPZGjgyy+XVNN1Ghoq7NS1kEcC8SABnRmMvGE+afXJnIF9yA34QckbNqnpeaXtupXjt/CyolsSS4mBx8VB/sPsTb3zhThVZr1XRMEX/aNbW3zHpgcONCw4bNACTta+BC64l9ens18KYnUi85kJk8A6ZNvc6XuSAgapCIh0Om0URQbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PAXPR08MB7645.eurprd08.prod.outlook.com (2603:10a6:102:240::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Thu, 4 Aug
 2022 15:18:13 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 15:18:13 +0000
Message-ID: <55f445a4-42dc-22ba-6b81-f368ed484ff9@virtuozzo.com>
Date: Thu, 4 Aug 2022 17:18:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
 <20220804145200.564072-2-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220804145200.564072-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0112.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::14) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5056ca3e-0f5c-438a-7999-08da762c8c40
X-MS-TrafficTypeDiagnostic: PAXPR08MB7645:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V65vQBRePKBPqvm4K8tFZQN1azg2cFIQQWXj7FcH48z0V2Pp2v9sZu5BzvqPiFKwOW+Ze2m1j+TjNUwx2nRbeIxk8q5A7sZkNpsQQA4sre31Uw0gq2OBW5j+36JLXQKHTrkyI0hCj8hi8TEz+7+bLXksMz2AxWbcJCkvhXlipt3DzSFrA5JJUi+iLwHwla9+x1P5t9tHafQXScmbGoE/BbFz72v5lvTMDPje3e2jrGLYlATXGS7fe98kDGmfQdF9PqhqH2eDWiGODi6oEwdivn5XJnFhQIM09uw/i43PTfAEzNA8ugNi2ci1EOXC6guf49yxFKaX6oR6Lg9G7rAt4I5mXtkcSIeoC6Phl+8JS8XXHjzJzzc6vHdJ34/xDHQE7pH/+OPOhykL90UtxhHjyQ3pSYIi0jt26gDp99oKrrYlJAYbnJDXgJz8WQjexUcLQbdXJ8BwjuCgTL3FjVJi5oRDHyhHZFIePdaFoq5L2zAWbSIxJ42zrt3RPfo+IyXbvpEHgKMfs0xQIh5BALUkbpbHVGqmHhAdxQ0VUu1NNO7nt/QmM+8zjB3RpfVFG+W9GZ44lOrMu+SMefF4ElvVYw0AwMOdoFXqQZ2YYguD18oNfLN44uzNeh8Goqqe/fUccx/VVeLR5POlTOAu5bLaRMM5+hHo0+moIfw7jcr4Y3IeBU1vbElVaKLPI6RtcdWgOw6loJeR3h+PnV+d7WE415DUS0ZjtGQ6YJ3cyNlxF963UbPKFSi4OU591r7Ymr1LmjvhrcQtL9z4VvvHgvjDi9hsLBvk6Q2U8uGkKUlX/2M0nrsae2lpUz6OltAPl27u4sPrmTE/IgZ8OAgGqnaTxJT0rPo/b5xSJ8VFT4UOtWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(2616005)(186003)(83380400001)(66476007)(8676002)(5660300002)(8936002)(66946007)(66556008)(36756003)(2906002)(316002)(478600001)(86362001)(31686004)(52116002)(6506007)(41300700001)(53546011)(26005)(6512007)(31696002)(38100700002)(6486002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXlSL3ZWMkR0cVUreUJaRU16NFlKSU1mdGNEcWJneXoxUDBXekEzcGhzUmlB?=
 =?utf-8?B?WTRGd0UwQjlpN08wWXZJYU5zYmphUndHbThrMGhMVjU3SXB0WG1GN2NiZG1R?=
 =?utf-8?B?YWJJTktZdXR3SVJaVExuTnVvb0ZYdGViRms3VHdLcERNblZ4dmpOUElMMUFW?=
 =?utf-8?B?Vm1ZMEozQXc2dmozQzl3N2x4VVVXVHNwQmZkcWJjSW1LTkIrRk5odzJ0SU1o?=
 =?utf-8?B?QnZja1NMR0RBODZ3OS9IaGV1MC95WE55Zm1lMkpCN0d1RkkzMTNUSndIOEpX?=
 =?utf-8?B?SENhRzdMOEhWNThGOXAyN0RZZ3hZWlBmSmg0UUoyTWUxRk1RbDV1amM5WExh?=
 =?utf-8?B?U0p5b3BJdlk1K1Y1NVQrQWc4VlM5QmY1c05wNE43ZXlPVGVoUHpUbTM3d0NV?=
 =?utf-8?B?TS9JNEw5MktwN2xEL3dTbWROekVQenBxZVhqbjRSNlB3MHN2aDl3UmlIY1d0?=
 =?utf-8?B?MUNNNUQ4NExQdVpoNU95V0RGemZnZURrdnhIa1I1WGpuRUVSV0JORkFtRWxh?=
 =?utf-8?B?UG91YlJsOTFMb01vWHNBYkI0SEFPTGhPa2RkNkZxWmorL0ZVdmxEeGdTRDlV?=
 =?utf-8?B?NG84UXZMcGhVaUpNSjdkd3M5OXJjeHFiKzRVdk1SdDdjQkpqTlNJNVdabFZF?=
 =?utf-8?B?MXVPdkpiWjRKSTR5NnNmR21jd1QvZ2lPejlxVFcrWVNpNEMrNnJpQzVHU2R6?=
 =?utf-8?B?T3VPUHE5Y0VlYmNQVS93ZlZqUW5pQk5Fd1AxUlp5RE85dkdQQUxVdnNPU0Z4?=
 =?utf-8?B?Z2RDbGE1VThaWklFQnpIR2huTGNxekRtWmJCTmlyUisrS0VtZUl5ZE5ZOVl3?=
 =?utf-8?B?bXR2dlpUdDNiV3UrQVlIeVlBSWFWL1NtS3ZQRTJ6VGhnTHFSMXlYQlpBTktB?=
 =?utf-8?B?cDNZT0FOdzNiUkdDTlFaSGlrdTBWRlhRNGdUcGVPYXdXWHh0a3RFN3pNL21I?=
 =?utf-8?B?c2t0c1ZUYW5VdVIxNDVCandjaUM4WjhTVmU2Q1g5UU14WlIxQVJmTzdjNm1C?=
 =?utf-8?B?WGZtVFdYWkNMcURUTFNaSWJVVGhYeVB5b3VDRm4zdUpZVTZ0VUF1eVp5WHov?=
 =?utf-8?B?S01XbTF1SzFEd0xxRnV1Q1BnaWtFL0FJQjUvUE1jOFJjSjBDbXhXcngyYTlP?=
 =?utf-8?B?aG1ydnp2M0Y5WVNxRERZWGI0MFRNUTc3dm1xMVYzMk9rbVBiT3RBMGhPYUxY?=
 =?utf-8?B?MEppR1hGZDFKQjk2ZzYyalQ0ZlpIOGVlRUFlcWNzUzRxZ1lJQlFQbHR2bU5D?=
 =?utf-8?B?K3hISlA3M1JJTnFtMktVb0hCSFJpd3Q2ZTVPOERrMmR6dW5SQUVBQkdITm1r?=
 =?utf-8?B?aVducTlZS2Rabi81VEN4ckU0TjNHcmVFU3QwQ2wzeHY0aG5iSWJqODRIbUNR?=
 =?utf-8?B?SlBCMjFSeUZIS1RXY0ppR2VCTm04YkJjajJvazlBNFN2T2cyZGlkNmQ1WTdk?=
 =?utf-8?B?eGszd0JRYnJ0SmNDSytubnkwcnd3WDhnSFNHNWIwUWtUOU55cGEyRkRVR0lj?=
 =?utf-8?B?NG50cjFDTmxHR2tuR3VGdGp3dGhrd1RKMHRSN3gzV28wLy82UEdnZnR0WlIv?=
 =?utf-8?B?TGsxcmVEUTAzUXNqQ2Z4cGJIa3E3UGE3M2dFMldPRkpVeVRBeVd6M1RGTmdh?=
 =?utf-8?B?OEVlYXNuNGM4Q0FGektsSS9qdndRVVRvaVlCdk11WDRSby9YZm1WbjAxWFBL?=
 =?utf-8?B?bThaenI3TVRYZW9aTitVZHB3Yk4rd1k0aG5PMzNtQlkvc2M0S1hLbXd1bWlo?=
 =?utf-8?B?cEx3UXgxQ1crbVZMU3Jab1g2N0NWR0s2VXFYTElNNzB5YnpQK3ZoVlNSNWZq?=
 =?utf-8?B?TXlrMnQ4aFR6TDBRcm1OZnN1R3Q3bXNxMFJVYlAva2FxNXJoLzlKbXBZVzVW?=
 =?utf-8?B?L01RYmhPTmx2VDdjeW9SbzdkY1N1VFRQY2Vsb1pFUUprREJHc3JIanFuWldp?=
 =?utf-8?B?ZFVjbzZUNkhXaVBFSTIwSm5DNTJSeURuanJKN1YvcWdxTXlSSlJKamN0RHhE?=
 =?utf-8?B?VFF6eUYyVEtuT0o1R0FYSXQvWEpTMCtJTVdCVjJvejFOTTEreHFJY3Jadnpu?=
 =?utf-8?B?OEk3VmlaUXlvdm5qZ2pDUG1NajNrbC8xUUlIOEVzYlFyMnFycS9HQ0hHaXVK?=
 =?utf-8?Q?swyNa5OusyiWi/1/eOfVEuOgU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5056ca3e-0f5c-438a-7999-08da762c8c40
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:18:13.1426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFbAF+8hL9iWi3xor+oEA6C6GqPqOFWgAkZ6sTJv3hV8st/ZZ5y6uO4npPU9/bErYZAkmsPG4I01SEtJVtMrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7645
Received-SPF: pass client-ip=40.107.21.118; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 04.08.2022 16:51, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
> There could be corruptions in the image file:
> two quest memory areas refer to the same host cluster.
>
> If a duplicate offset is found fix it by copying the content
> of the referred cluster to a new allocated cluster and
> replace one of the two referring entries by the new cluster offset.
>
> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 93 +++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 90 insertions(+), 3 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..6a82942f38 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -64,6 +64,11 @@ static QEnumLookup prealloc_mode_lookup = {
>   #define PARALLELS_OPT_PREALLOC_MODE     "prealloc-mode"
>   #define PARALLELS_OPT_PREALLOC_SIZE     "prealloc-size"
>   
> +#define REVERSED_BAT_UNTOUCHED  0xFFFFFFFF
> +
> +#define HOST_CLUSTER_INDEX(s, off) \
> +    ((off - ((s->header->data_off) << BDRV_SECTOR_BITS)) / (s->cluster_size))
> +
>   static QemuOptsList parallels_runtime_opts = {
>       .name = "parallels",
>       .head = QTAILQ_HEAD_INITIALIZER(parallels_runtime_opts.head),
> @@ -419,9 +424,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off, high_off;
> -    int ret;
> -    uint32_t i;
> +    QEMUIOVector qiov;
> +    int64_t size, prev_off, high_off, sector_num;
> +    int ret, n;
> +    uint32_t i, idx_host, *reversed_bat;
> +    int64_t *cluster_buf;
>       bool flush_bat = false;
>   
>       size = bdrv_getlength(bs->file->bs);
> @@ -443,8 +450,31 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       }
>   
>       res->bfi.total_clusters = s->bat_size;
> +    res->bfi.allocated_clusters = 0;
>       res->bfi.compressed_clusters = 0; /* compression is not supported */
>   
> +    cluster_buf = g_malloc(s->cluster_size);
> +    qemu_iovec_init(&qiov, 0);
> +    qemu_iovec_add(&qiov, cluster_buf, s->cluster_size);
> +
> +    /*
> +     * Make a reversed BAT. The table has the same size as BAT.
I would better use different wording. We need to define why the table is 
used
and what is idea behind it.

"Each cluster in the host file could represent only one cluster from the 
guest point of view.
  Reversed BAT provides mapping of that type."


> +     * Initially the table is filled with REVERSED_BAT_UNTOUCHED values.
> +     * A position in the table is defined by a host index
> +     * (a number of a cluster in the data area):
> +     *     index = (cluster_offset - data_area_offset) / cluster_size
> +     * In the main loop fill the table with guest indexes
^^ indices
> +     * (a number of entry in BAT).
> +     * Before this, check if the relevant entry in the reversed table
> +     * is REVERSED_BAT_UNTOUCHED. If that's not true, a guest index was
> +     * written to the reversed table on a previous step.
> +     * It means there is a duplicate offset.
> +     */
> +    reversed_bat = g_malloc(s->bat_size * sizeof(uint32_t));
> +    for (i = 0; i < s->bat_size; i++) {
> +        reversed_bat[i] = REVERSED_BAT_UNTOUCHED;
> +    }
> +
>       high_off = 0;
>       prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> @@ -468,6 +498,59 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               }
>           }
>   
> +        /* Checking bat entry uniqueness. */
> +        idx_host = HOST_CLUSTER_INDEX(s, off);
> +        if (reversed_bat[idx_host] != REVERSED_BAT_UNTOUCHED) {
> +            /* duplicated offset in BAT */
> +            fprintf(stderr,
> +                    "%s BAT offset in entry %u duplicates offset in entry %u\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
> +                    i, reversed_bat[idx_host]);
> +            res->corruptions++;
> +
> +            if (fix & BDRV_FIX_ERRORS) {
> +                /* copy data to a new cluster */
> +                sector_num = bat2sect(s, reversed_bat[idx_host]);
> +
> +                ret = bdrv_pread(bs->file, sector_num << BDRV_SECTOR_BITS,
> +                                 s->cluster_size, cluster_buf, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
I'd add a comment here, this is a bit tricky thing, we have discussed this
verbally a lot.

> +                s->bat_bitmap[i] = 0;
> +
> +                sector_num = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
> +                off = allocate_clusters(bs, sector_num, s->tracks, &n);
Should we do sanity check one more time? Fatal if that I believe.

> +                if (off < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +                off <<= BDRV_SECTOR_BITS;
> +
> +                /* off is new and we should repair idx_host accordingly. */
> +                idx_host = HOST_CLUSTER_INDEX(s, off);
> +
> +                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                size = bdrv_getlength(bs->file->bs);
> +                if (size < 0) {
> +                    res->check_errors++;
> +                    ret = size;
> +                    goto out;
> +                }
> +
> +                res->corruptions_fixed++;
> +                flush_bat = true;
> +            }
> +        }
> +        reversed_bat[idx_host] = i;
> +
>           res->bfi.allocated_clusters++;
>           if (off > high_off) {
>               high_off = off;
> @@ -477,6 +560,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->bfi.fragmented_clusters++;
>           }
>           prev_off = off;
> +
please no unrelated changes

>       }
>   
>       ret = 0;
> @@ -515,6 +599,9 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       }
>   
>   out:
> +    qemu_iovec_destroy(&qiov);
> +    g_free(cluster_buf);
> +    g_free(reversed_bat);
>       qemu_co_mutex_unlock(&s->lock);
>       return ret;
>   }


