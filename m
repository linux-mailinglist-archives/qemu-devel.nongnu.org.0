Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210CC524F12
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 15:59:22 +0200 (CEST)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np9Lc-0008Nt-DM
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 09:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1np9Ki-0007gV-0G
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:58:24 -0400
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com
 ([40.107.93.75]:33490 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1np9Kf-0004Wg-CS
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:58:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY/+54wS/VJX7j48Ir8ibfXk4Exu0D7Uvi9ZHn8G0VnY558uYzjLcMpom1FrmGtUQ0G3ey9qH6hec6qZwn/VQJ5LAFds1VVNVs9THXC4+PqEcAii3bU9bzP7PYbClZP/Zt3NgNSQGVh/Zel1LEdzDPoaKrboKpnSTsObTHBxWvA+vyFB2glIRY6yUMkeIkTIYXYRE59z1sTVaduMmwUDARGwwvP2N00mxeFUNFrGE/3E7S5KvjHYebBBf82cBVySEYwcGyc2mXzR0QhIWeXZOH/t6HRM+5QkJAue/wApFiKk3t0qTf5Si86gRuBAdlks0RTF7NULnSAKwtY1r8p0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+5nq6oNVEjFxN3oOguvl7a3cLOKNvhhIXYNsZchlL0=;
 b=SiuRNMN3y27FGi2aejlANxBxa0VI7e7LPb++aHzHKz0sO195Vf6cxn0Fy+MBjzqjVp64gKP0bGrVFRoR8920ADw/YP6ABGCn6UYPG7fVWpRabkzW4+Ju2gJ8Nz5WeGPX493smmVhhCv0rdes/VEuQxMY4mQa1XK60cjTTwsCMgTP/5Pc068ZTqkQdnELzuUZS+S9p6xIn7LQ9rAGXgeJ1BFSQ5iqLgmB9l/Hd100fKoMuEX6du9C1KrYs6Z896q1iBFko3JH7yTUuXYzjDupZdbLTPKgSbSFC2Lx9XF6BYQxBmiteOIqag3ZHBEE4QdSaz3PxqAIB37KoYZ/xdeO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+5nq6oNVEjFxN3oOguvl7a3cLOKNvhhIXYNsZchlL0=;
 b=YGwRr/sZhshoZMc+xthkwHdorugTlvSU4F9dk/kR7teiBkZkSpBJs21JEa+z3Xqa5+xC5+KNV7OIIytkG6PhhWmb+XcqO+oyAm6E2QmQ2y0NiOKSryFliqP9SHVMu2qURrG9ewgwIMiB2WwLlOHdT8kxVn6M95ToAraRAD7wt0s0SGRNfS95UuyH3y5DQURlGZ36xE/2AUHlc0tlVjBXqJ+U+OeoCAdABsInp6MlWCxS7Bl7cYH5yVY4+WBJ8nrTRE5MKPb7ox1eBBZWhNHD4sGBpbgOJLUGO0yle75c9zBlzm1F3EpGytgS2++y87rOR6Obo4vYXvgzDUk6aYwRwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MW2PR12MB2427.namprd12.prod.outlook.com (2603:10b6:907:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 13:53:15 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::e809:1a:872c:b495]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::e809:1a:872c:b495%9]) with mapi id 15.20.5250.014; Thu, 12 May 2022
 13:53:15 +0000
Message-ID: <b248ca40-c322-69d0-799f-d0a95bf0c31b@nvidia.com>
Date: Thu, 12 May 2022 16:53:08 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 2/2] vfio: tolerate migration protocol v1 uapi renames
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20220512102942.1134141-1-thuth@redhat.com>
 <20220512102942.1134141-3-thuth@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220512102942.1134141-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0504.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 590fcca8-c53d-4249-727b-08da341ec315
X-MS-TrafficTypeDiagnostic: MW2PR12MB2427:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2427C7140394DB1E7AD95E50DECB9@MW2PR12MB2427.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLemShSh69R7VC8ANBCWhtJ+almtxbuW8HXIXnDAqVf+mGGNpDRFa/zgTh5+NomUhCvnXyhNPrUwqO0OVSGWZe4CEeEpRUsCTNDKUegJZHs1ZGigMYyXdr8mRNFT0FMfyzqolIf5Jt0apCoA8JsISHzzbcZa3ITH8l+NloU7Ke0q0LydTanUgLdsyMFFQ+5GJWN0tYKg41fhiMtuMLfILA3/SoXV4kNAV9K9brXGIjkbNgik5j+9zeFJ/i0Coc2N8bVQjWu8GrWDCNwfdEEtOJjNu4WMQ+LHyy7H1CtfFd6RngLCYl6eOr3lFNwJwktCTCSWzIKNRnEj2eJqETRgJqZzL1VFWTT/TdqskNCxInCSehqMdEr4Pmjm/g89IfZuafdVZ4wSpMbnTCnVhZ/UMAhMO8IuwM38SC4prhpVZcV7ZrmObemZGk76gBJ7uICqrlI4JqAQ5tgD1EKiKVXaoEqFruSDhfgNQRD+tXU6CrGEdNucf+e4i7v88FWP4pJaq90S384dpyxGdGE8btSj3WMJMtE42kBiTTiyAq/CJ6K+c1PnLrPfVjsmlYHb7QePpE163C9+wYYPLn38CoRxmyKp7yT/uXfGZ9bE8T7WrL8A/n58t3uCpH8ifbmL4lbttY6vU2WjXrJIJnVeuWXS0Sq8qNHSUv5WW1rC9PYONhH1IQ+Coc0QkqayXvFoK5QrluLG9hwVhm/bf6Vj37ksVMfJ6saAjpKxq3sszHli2QE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(8936002)(5660300002)(4326008)(66556008)(66946007)(38100700002)(8676002)(110136005)(6486002)(186003)(2616005)(6506007)(26005)(6666004)(6512007)(54906003)(508600001)(53546011)(316002)(83380400001)(86362001)(31696002)(2906002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm83ckRrM1VQYkw2WG1QWXhHQkdmYXBwWExRQmdrbVhZOUxRTGdhaWF6ODdN?=
 =?utf-8?B?VzhjcmRsT0hKcDVVaHlkK002Vkdpbi9SMXBYRGdTSDFKUFdOUEdtK1VOSmQ0?=
 =?utf-8?B?alZ4c3gyU1B3ekw2anBkTnRTYVBIL0NtNWdRaXFOUDhHbzd3YnFUdXNjVWZU?=
 =?utf-8?B?Rjd4RTduSUNLa1hLN2ZJZjlZTFhuOUh3R09UdmtBRlp6amRBN3VXTE52cEEv?=
 =?utf-8?B?OTRXNmVHdVAyZ09ZRnJLaVZtM1dQWHBCa1hHeFJQcTc2VVZUSXl1Ti9kNzgv?=
 =?utf-8?B?R1JFRVdNWTBoZTd2UzI3SWVqMWlLU2J1N2R5bXhIMHRmRTdPZ0JZUVQvaDAv?=
 =?utf-8?B?bURyMkNSMFJHRTZWblRDaVhEQjdyVmJlUU5FbW9PaFgvakk4Z2lZOE5JcjhP?=
 =?utf-8?B?MHRhTm5OUmdjYy93cEtTRDczeWE1Q3JNVHg1QVFib3R4Vm9BWkRDZlA2Uk9i?=
 =?utf-8?B?aFl1NW9FMzZUVjdzS29HZm94MjgzbG54NnZwTXUyRlhsajNTY3VBWE1zTnly?=
 =?utf-8?B?QVMxSjN0cEdjTHE2bVRFbFoxanZkaDg3UkZOY1RLREwzMm5odERtZnhQcmJj?=
 =?utf-8?B?LzA2U0w2VXAvRW84NGdxTWF3UGZsanJOMGcwTXd5TGxxK1E3ZXdadEM5NHZz?=
 =?utf-8?B?N0Rqdi9FUWdKWm85M2hPMnhSS1FBak9QTk1KWklEOXp4VkI1V09TbDFxd0J2?=
 =?utf-8?B?dU9iaGdwUDhCUzQrY3dKdU5yb1RIUWI0c3ZKY1A0aFZISDNNS29qYk1rM3JK?=
 =?utf-8?B?czZDUm5WNWhleG91ZTRUZFYyTVhtWVN6VVl0YlZrSWYvSHpXaHphaDg5L2NP?=
 =?utf-8?B?YmhDbWQzcEtYaStNR1RnSHFBeXpyMVVBRXM0eW9KdzN4MU5ma0FVZkhCT3RZ?=
 =?utf-8?B?eFA2T2xLVUQyenJWUDF4RUcxLzFTMmZSeHFYcnB3Q2lLVGt2VnNJcjIvOC9L?=
 =?utf-8?B?a2MxaG1aalVQc0pzVTF6S1VhSFZNaDZOUzArZ3pQKzNuSVhjSk50WGU2RDV2?=
 =?utf-8?B?UklsYWVNM1BsK2ZOaVczR1lId1kwM0dWUWJJYzMwZGt6dWZzT2ZNRHpreU82?=
 =?utf-8?B?K2FmdFBJaHp4YXhUVmVIZkxiVExUNGVBeUh2bWR3SVNralp2di9VR2FCb0Mr?=
 =?utf-8?B?VXg0aHY1S3VodzEvdkxlTDJ6K3orM1l4eURnOTB3dm9acVhDVVd6T1lsWVNh?=
 =?utf-8?B?TE9panllV0FmbE43cTI5K0NtMkNMVXVLRFI1OU93czNtbUdwbmxTUFBPMWIy?=
 =?utf-8?B?YjJxSTMyaGUxTnRYNHFyelErdkM4Ky9GVzJReWxESEpWYU5UbEx1ODhnQzRF?=
 =?utf-8?B?OUVWWHFlTTlYR2tieVgxUmY0S0VzUFZqMWh0OXJWS2REbEdHWmNDTHh0b0l1?=
 =?utf-8?B?WlMwUUU4aC9HWW9FNkN0Wk9vZ2VhZnpHeExFeStDLzYzcFNNUEl2SDJRUjRZ?=
 =?utf-8?B?alNRaTFWMGJ4Y1ptd0hqVlRXcmszNjN2WUFZbklaZ1duaHdrOXZSS3ZsRWll?=
 =?utf-8?B?ZXdqWE5YWEFCZmZ0L0U1eUxaY1VKY0I1azFqNElOckpJWktSNlBWd0NwTVBS?=
 =?utf-8?B?ZWErc1ZHV3VSaVFRaUZCZHlhck01NkFGRDBMUWgxMUpyejFOV0FmZmF6OFhD?=
 =?utf-8?B?N291SWd2QjJYbW9QUHBNNm1wd2lCcThRNjI0MXI2djlMMTdiYzZqWWtSSVlN?=
 =?utf-8?B?QkhhNVFScUYvdGFnOHlJY0pXMUE5d2JERW1ub2FnYWtscCt0L2ZYZGJydVlJ?=
 =?utf-8?B?ck5MQlc0K05aQlRnVmxFQ3loYTdwTklWZE9vcHBWWTN5NjhNYmlhWStiN2Ix?=
 =?utf-8?B?MzhpcE96Wm93N3hjMXZwWUxFelhRUkozMHRGa1I2VnVZL2lKV2Vzdi96U2Zs?=
 =?utf-8?B?aDh6WHdzRUgyalRYNnlXeDJ3TGI0NEtrMklCa3oyVVBlcTR0N0xFc3hVWDF6?=
 =?utf-8?B?OWxXSXRNUFNIeW5kRGR4R3BCZUFLZVFPa2tRUEl4MkE5emMvRXNMeVNOV3JS?=
 =?utf-8?B?eTV0eHhDTkZ4ZnltR05rS2VJaXFQUmQ1MnZBczcrYVZiWGdGaHh5YmcvVkww?=
 =?utf-8?B?dTVLN1dKN21US0xyY0JpVy9JRjI1M2tGNThreUNsZmQ1WmR1M3BpR3pvd1d0?=
 =?utf-8?B?SnFkT1ZUL0xkZTNkT0NnZEFVdUhRakh3WkJOajlBeGlHeDRiVXphQVpGM2Y1?=
 =?utf-8?B?L0ZmQVJSelUyOFllcVZqN3NDU25xU25DVmY5NTRoZHFDNmJ1b0pwUU4wYlp4?=
 =?utf-8?B?TG83T080b2Y5SXRwYzJDaEdvdnY1bnM3bXpjQjEwSk43YmROeE5Fcm1XZ2FJ?=
 =?utf-8?B?VzlyRU9FVG51OWRraGd5SDFUeHJPMkFvUzFHY1FOOTVKbVpEY3FoUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590fcca8-c53d-4249-727b-08da341ec315
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 13:53:15.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EpXo7N2RbviJRoU7NaYKomoTk17GoTq1n/mpwN5Qmo1W/VwC2+a/J/6qbeIIru/cQYALh6s/7Elj5I/W//UNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2427
Received-SPF: softfail client-ip=40.107.93.75; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 5/12/2022 1:29 PM, Thomas Huth wrote:
> External email: Use caution opening links or attachments
>
>
> From: Matthew Rosato <mjrosato@linux.ibm.com>
>
> The v1 uapi is deprecated and will be replaced by v2 at some point;
> this patch just tolerates the renaming of uapi fields to reflect
> v1 / deprecated status.
>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Message-Id: <20220404181726.60291-3-mjrosato@linux.ibm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/vfio/common.c    |  2 +-
>   hw/vfio/migration.c | 19 +++++++++++--------
>   2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 159f910421..8e73d3714a 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -381,7 +381,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
>                   return false;
>               }
>
> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
> +            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
>                   (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {

Only now I noticed this, but all existing VFIO_DEVICE_STATE_* enums 
should be changed to their corresponding VFIO_DEVICE_STATE_V1_*.
E.g., here VFIO_DEVICE_STATE_RUNNING should be changed as well to 
VFIO_DEVICE_STATE_V1_RUNNING.

I already have a patch that does this. I will send it today as part of 
the VFIO migration v2 series I am planning to send, so you can just take it.

>                   continue;
>               } else {
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index ff6b45de6b..e109cee551 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>       }
>
>       ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>       if (ret) {
>           error_report("%s: Failed to set state SAVING", vbasedev->name);
>           return ret;
> @@ -532,7 +532,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>       int ret;
>
>       ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>       if (ret) {
>           error_report("%s: Failed to set state STOP and SAVING",
>                        vbasedev->name);
> @@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>           return ret;
>       }
>
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
> +    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
>       if (ret) {
>           error_report("%s: Failed to set state STOPPED", vbasedev->name);
>           return ret;
> @@ -730,7 +730,7 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>            * start saving data.
>            */
>           if (state == RUN_STATE_SAVE_VM) {
> -            value = VFIO_DEVICE_STATE_SAVING;
> +            value = VFIO_DEVICE_STATE_V1_SAVING;
>           } else {
>               value = 0;
>           }
> @@ -768,8 +768,9 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>       case MIGRATION_STATUS_FAILED:
>           bytes_transferred = 0;
>           ret = vfio_migration_set_state(vbasedev,
> -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> -                      VFIO_DEVICE_STATE_RUNNING);
> +                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                         VFIO_DEVICE_STATE_RESUMING),
> +                                       VFIO_DEVICE_STATE_RUNNING);
>           if (ret) {
>               error_report("%s: Failed to set state RUNNING", vbasedev->name);
>           }
> @@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>           goto add_blocker;
>       }
>
> -    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
> +    ret = vfio_get_dev_region_info(vbasedev,
> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                   &info);
>       if (ret) {
>           goto add_blocker;
>       }
> --
> 2.27.0
>
>

