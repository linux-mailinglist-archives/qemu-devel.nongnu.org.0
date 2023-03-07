Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1796AD9B0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:57:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZT8S-0001jI-Id; Tue, 07 Mar 2023 03:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZT8Q-0001j6-UR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:57:26 -0500
Received: from mail-dm6nam12on20600.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::600]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZT8O-0005mX-VS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:57:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKUNRPrds3RAvLD5W+dFfiBki9/Fvn9/C0nTUvQcGcAJli316RAiPfE/LtSykqmMI8wBLGhMCEXeXseKeRSsx5UPKeIYKtu3j1woKW9AO/bI/4l7IBBNZl78DnuP0cRHnD2xhe7Riwu1Zy+Icxx2HzMgemaQmOrxP1yZYqw4PSkiVLZ40UNUzVpQ6UUWdZv3ZS/fdwV16mq8kC3RubmWeXXMfN37peP/Lw6z2QtPGYsxpbRyadf9vTwiSrG3tztHZEcWGanVUPs4Ot79PcmpI2eCujeTmUpXos/4VnCYLe2OQNt8Mz+9iujC4Mnrst+UWfTAQUVybl/nIsi29uEJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eKs96pLurdQZAYpa6p+Q5SfG69H93tE/Tu52dlnaNk=;
 b=P9HWx7yZ1EdPAxoisFSgnURWsvVwOS1cB6c5gRoRKRXNxVE9WfAVxY9k3VCu5uDuk3CwjkfX264FokdjqDaU8tFrGXL6GhuW6hxs56T37SQFBMBcCsOcUa/cSBQ5p39TgC0kz32Qo4ASit//NnXnWb4X0mFM+4tvWWORlqQaAT768QzplzYDDVmcbonoDLr0gFbUVq4jMD7i5/7ulbYcixsZXGuvJpAsPx3kK5hTldTOnyBgclV758R2ynLFXfVkpyA8WJuVyHa9PH3SIKGt/DsYmGyJ8xrOyRwVOEunpl9JLjvqxR6ae9MYjzK3XmeO3dGilkgCuSVum+i3l66XXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eKs96pLurdQZAYpa6p+Q5SfG69H93tE/Tu52dlnaNk=;
 b=SQQgzWClGwnqfHdoQpADOfS0I+pAEG5NWfGXwLGRzh84Us/DHp9NCP+kB/achYsKJ0EUNeplkWmRTW9sPHu2ABRloiwiPCKT3wB9iKuA8LUmQHYHOYkmkOwOZ6o19gNEVFzabukz1BryXmDe0sL+wCcyF7W8IfWNyD9W3s3ZWYxqLLR4ngFvmiwXsmgCvdK6Z1WntluAigyrRd+Do9XBWJJpKvT/quKzj8aVkTgPTWhnVLL/IPZrfo/kak+r2RAQnmcc1YcBrGqokQ8GlRcuTTDx7ALBwVqrFFr1ptCumAl0HyaL1WnMdztt2+w4wuBSOkLM47o70WVrjXyZ6XhAxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by DM8PR12MB5480.namprd12.prod.outlook.com (2603:10b6:8:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 08:57:21 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 08:57:21 +0000
Message-ID: <3a791ed4-957a-66e5-e2e6-34099613cbf4@nvidia.com>
Date: Tue, 7 Mar 2023 10:57:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 05/14] vfio/common: Add helper to validate iova/end
 against hostwin
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-6-joao.m.martins@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230307020258.58215-6-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::34) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|DM8PR12MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: c5015d4e-e0e8-4c15-02c6-08db1ee9f5d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWhZj58fvRmd8xFTtcNEt41u7egO2BMSxTplz04sdNyZjO57msN2VZeHel5wbfLWysyANk5cTPxt35nzAnYxoHQui+WZhciDxH0W4IW+ex3Y8YfMHXB8PXaUWzMzjWpKqppnkuI1sRwEOQZh1A2c4BQUIOW1AkZbVXB8xkST70+cE3KEPyoLNMT4VFW5dKB7az3rqA9UPRX+D5SiBk1aZUGc2slXre0yCasx1wdZaXHKxPXCkQp4+E+gfwY1Ib+5ixtLZlnc63WmU/wSWWuW4QveQhTDtDnQjxv3uF6+haxXY0ByX9AnzhCsyArIDXYHCNDzQWHx/Ltw+etFsfjuVQCmqWb6giCI5Spyu9fWbH2WmZGEmpRKhmDpYDyBA6/3y13Z+l2SPV6X/XT/3LcJ/k8SSyz5z0j2pjrpf3/l0anMhvFnfzp4iTxeR1bEjY7HAMC0NrMvuPgDnSyGqOmYlH5jQ6ZZUMHcOL2yUhD+Zbdf2TSLqjFnAmXbSvliCV3/jD6iNnLpLwy8+3uvCd8XnpW42njCk4pGPyoWCq9ymQ7yMWo8+U1LYjVrYSvI0ESV9bNeh8cU2BFSH/JGJCG6DrJ40bIBaCDPnSeKq9wqaCFlpBZGuWim/e737Jr4MqJt3yIYrNbp9MIZxAsjckNxMD0TWb8uF2DsZGWkTtGyHWtWkC4T3L+8ZzhQo6gGEsf36CaHp1pRNGHKFsmF+sPMcqyELPT+2hHr+KcaSMLg7E8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199018)(5660300002)(186003)(6512007)(26005)(66476007)(66556008)(66946007)(8676002)(4326008)(6486002)(478600001)(54906003)(31696002)(86362001)(316002)(53546011)(8936002)(6506007)(41300700001)(36756003)(38100700002)(107886003)(6666004)(83380400001)(2906002)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWhNK3ZmSWZnUDlKZEhmSHlXN25SOVBTVm52dVczdFowNEZvaFZqckdFQjFY?=
 =?utf-8?B?QUtzc2tNTU1qTUNzQUVJNWczRXp6czl5d1FjS2M4eHpndlRtNVhRNXc0cHJU?=
 =?utf-8?B?RUtvazBpeWpCeHpSWWlvbzUrdVZqSzJrdzlvb0cxUXUzR3JDRGxSU3hpVmJL?=
 =?utf-8?B?d0I2Zlprb29waWhrQjhkajZxb1FNMWU5ZzQ2cms3SGpMa3lkRCtEYk5BNlZq?=
 =?utf-8?B?Tll2NXBocnlLd1BEQjQ3K0k0Ti94dTMwL2NOTUVxY0RWNXliNHNTK0hqVlcz?=
 =?utf-8?B?cUlCd3pIQUtpYTJHUUQ3MjBSbXdyRXVQNGE1dE5FVlhBL1VDYll2NnB2R2Ez?=
 =?utf-8?B?bmZjK09qcThLbElIU3IxckUwWlVpdngwK1VPaVU4RGpDSWtUMnM4dnFTR0Zu?=
 =?utf-8?B?bXRCSmNGMWIyQ3lwVDJLcWJDZ3h1MEYxdXQ0VEw2NmZYcEUvSzcrWjJnWVJ1?=
 =?utf-8?B?VTdyZ0xwUFVhcGFmTld1emF4Y2dNYllGQ3pWTkZUc0plZTYrblowZkJtcGNt?=
 =?utf-8?B?cXBKaTBjbUVWTklNbTFYUUltYTg5M0lZM3dNNmVhdXBzMitCYmROZjU3TlR4?=
 =?utf-8?B?WTk5NlhQcUg2dE1tVm9LcjN0SjJhZnFLUm9WN2YzY3lSWWdZWHJxUGw2cThj?=
 =?utf-8?B?OUJiRE02cjd3dDFmTmVzM25JODQwSDVkaERtdUVGMVV3WjVJS1Vod0FDdXVB?=
 =?utf-8?B?MDh2MFFZdHlaTU8vc056OHpkeklmd3hpOE9ZaFI4Tm1PdlduZ0xIUVpZeHF0?=
 =?utf-8?B?NVQzQWVPVm5mUDRRZ0hJa1hoQmo5dkZuQ3oyUTlFVXVlYTI4YTB4d2J2bXdD?=
 =?utf-8?B?OVgrMldTK0QrckEvUXVGRXdzT3hrNXB0UHR1Wk5FYzlFQ3VBQWt0MzFyb1N0?=
 =?utf-8?B?YmdVWE8vQmptbnhvMmNKR09EUXAvUzVhaTR5REFFY1BVOS9za2RHN2RNZHk0?=
 =?utf-8?B?R25zZ2lDbVlKQkRMWDFpMVpOVlBOOTcvZVB0MG96N21jYTNLcnpQRGZ0NzBu?=
 =?utf-8?B?Mm9LVm1oWkttV05kemdPM0pJSlZVaG9zZzhTRzZ1QlVhZTJ6NlRyWS9MMFZk?=
 =?utf-8?B?ZUxVMXdlclg4WFdVQ1lIUEpvZHlVa0hsOHhFcUdHZ296dUY4SThxWUY4RmJw?=
 =?utf-8?B?NDZjVDZPRlVZWjFPMVVSNEJSNVNLcmtsN0p4Ym1XQTRiNGxmN2xvVE5uMC8x?=
 =?utf-8?B?Y3VYbERsSGdzakYrSFpzU0ZEbzJLeUdENE5qMTRvaldkMmR3L0dnbm51d254?=
 =?utf-8?B?allUUE84V2puYmU1UWp3bVNNVEJZUlU0Qk1QTDJ4QWd2eE5VR3loTi9hR1dN?=
 =?utf-8?B?bUd2SktpTXNob25tV1MrU3FGRERHeHdzY2trS0NFWGRiRVlUTS8vVzloUHI2?=
 =?utf-8?B?OTdEVXZ3UVJCaWVUYVlZeFFqSGxpWTVWUHdLYW02MlowZGJnV1BYYWRCemJ6?=
 =?utf-8?B?SnVxUXVKYzJwUTJSckJCVlZ6b29CTGFKNmlmWUVYYTZUdFdudm0rYnB0YURi?=
 =?utf-8?B?Z1B2czBUQ3NnY3g2MHhSMkNPRW5FVDVQM3g1MCtHNTF1d0V4aHZtMm5hZDlQ?=
 =?utf-8?B?N3ZqZEl4cnRKYzZEdnVrZkg2a2F2b0RwMWRPTEJ0ZFppL2xIdHpiL2VDYWEr?=
 =?utf-8?B?QUVPTlVJVVJpdGlFTU9HQ3pEK3pnZmQ2bkRPUWhlMVhRUy93Z1d4UFI0MTBX?=
 =?utf-8?B?N0Rnb2pqNjE3ZVpueEtrZnZjR01ySVBFRERDOUlxUFFtcWhNREVhc1J4WTZn?=
 =?utf-8?B?SXRyN1pRMlpoUndnVWdWdVVlM0RZcmZHRGpHNEM0MDZybFM3bUdwTmJsRW0v?=
 =?utf-8?B?Z0dvdWtEZytvb293dHpNV0VYVHhFKzZPMUoydVdDK01Obk41TTk1ekloaFk0?=
 =?utf-8?B?Umt3UGpvTnhFdnhBMDhEUFdXdGEwcStkVzhiTXovU1VMUFVkWFE5eUJIU0Vy?=
 =?utf-8?B?SDdOaEZWWDRFZk1wdmVWT2xwa0Rpenk5WnpZOGdtQ05rN29JR3pKWmF4MFk0?=
 =?utf-8?B?aGF4NlJzUllZaEhYUC83K3N1NVhFelFreWpweExITnl4RWNJaUtwRFZubHNS?=
 =?utf-8?B?dEsvVTJ5bWRTdis1dTQza2FxS1d2NDltVEczL3hkMnlOYjVsT2hPMXBicHRo?=
 =?utf-8?Q?hUvL2AAWJKu+wWoW4uZbdN0Yv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5015d4e-e0e8-4c15-02c6-08db1ee9f5d6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 08:57:20.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ujdmj19fg/mR6s0wldj0Ezr3khJ7OwU+S5NJmWzexbKdCJC3VGgZg0ulfzv0XVok2uTTPY1xfPFBV/qeqxAP+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5480
Received-SPF: softfail client-ip=2a01:111:f400:fe59::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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


On 07/03/2023 4:02, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> In preparation to be used in device dirty tracking, move the code that
> finds the container host DMA window against a iova range.  This avoids
> duplication on the common checks across listener callbacks.

Eventually this isn't used by device dirty tracking, so "In preparation 
to be used in device dirty tracking" can be dropped.

Other than that, FWIW:

Reviewed-by: Avihai Horon <avihaih@nvidia.com>

Thanks.

>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/vfio/common.c | 38 ++++++++++++++++++++------------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index cec3de08d2b4..99acb998eb14 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -901,6 +901,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
>       g_free(vrdl);
>   }
>
> +static VFIOHostDMAWindow *vfio_find_hostwin(VFIOContainer *container,
> +                                            hwaddr iova, hwaddr end)
> +{
> +    VFIOHostDMAWindow *hostwin;
> +    bool hostwin_found = false;
> +
> +    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> +        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
> +            hostwin_found = true;
> +            break;
> +        }
> +    }
> +
> +    return hostwin_found ? hostwin : NULL;
> +}
> +
>   static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>   {
>       MemoryRegion *mr = section->mr;
> @@ -926,7 +942,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>       void *vaddr;
>       int ret;
>       VFIOHostDMAWindow *hostwin;
> -    bool hostwin_found;
>       Error *err = NULL;
>
>       if (vfio_listener_skipped_section(section)) {
> @@ -1027,15 +1042,8 @@ static void vfio_listener_region_add(MemoryListener *listener,
>   #endif
>       }
>
> -    hostwin_found = false;
> -    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> -        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
> -            hostwin_found = true;
> -            break;
> -        }
> -    }
> -
> -    if (!hostwin_found) {
> +    hostwin = vfio_find_hostwin(container, iova, end);
> +    if (!hostwin) {
>           error_setg(&err, "Container %p can't map guest IOVA region"
>                      " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>           goto fail;
> @@ -1237,15 +1245,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       if (memory_region_is_ram_device(section->mr)) {
>           hwaddr pgmask;
>           VFIOHostDMAWindow *hostwin;
> -        bool hostwin_found = false;
>
> -        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> -            if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
> -                hostwin_found = true;
> -                break;
> -            }
> -        }
> -        assert(hostwin_found); /* or region_add() would have failed */
> +        hostwin = vfio_find_hostwin(container, iova, end);
> +        assert(hostwin); /* or region_add() would have failed */
>
>           pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
>           try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
> --
> 2.17.2
>

