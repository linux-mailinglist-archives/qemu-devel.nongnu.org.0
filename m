Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EBC6ADB8B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:15:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZULP-0008Vj-QS; Tue, 07 Mar 2023 05:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZULN-0008VD-TO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:14:54 -0500
Received: from mail-dm6nam12on2061f.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::61f]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZULL-00020h-Ft
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:14:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1lxciBMGzNkmi5O9YacVwaNula9OPEBpqUVmoSxwusVUUrmHh1vZ7avzJGeL5F1XLLyheJCLkdjD+PC0VpUz8RQNOiM97KQiQjfJOP5Q/jndKFgGV9GXlaatIsWXadx+/xAp4myt3kVA2BCnAj4QfFP6wIbIJIImWwnuC3Ual4N23Zye126nJe4St1CXYgEWpIXophw8DD/YfrCHVoimdvU7OWTChMiupnV6aFh8hqy/FRxRDQTD4P/INSAagAKwByDBhQAGXHroovCv5LDpOFq2x70N9BtXIZe8iozK/Lh0AP5VFkR7DFzwAwu4eeK5rZHct2BHCaTHGdRwl+LfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIGzIen77ykv689LM3djOEaqLL5SvH5hRMrN6MULI2w=;
 b=P3pYtkkhf2WZltV4ljYVBH3LuagqG7aOFktxAc3L52ZFh+4dJPCxyL3or7UsjO5wOHgZzhKz4HFGIBGXZYJhW+YReUo7+kix+rksXnXAVig+QFvWN2sXQYpcUp6xDoR5itqewLyXuN91PyI+kH1/GC7IfNbsAotHyLkoExz9dQYknPVfew3x9MEVotGtV9O60JKQtEZBiUl7XnUK36F4PIcH4/mzCRrBYx4H/jxRwUS2n+JvrauW7U2G1CXDUYaBOenLdCfeqdO6STAMY3KO3dkWUVnbfnu9JdqLotubnvYnL1o3vJ/JlD7dLV2DfPaASyWD8K9/xKUhP+JrVudK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIGzIen77ykv689LM3djOEaqLL5SvH5hRMrN6MULI2w=;
 b=Fao2ZWnM2iTlwS7eVmESWx/TojIGDaIsZgbRN5y+xmAIj+RKbJFMvw56aOCTHfHfk/SBWao4LCbJ4OqAMXgwbPqsffFpRq+3hjkodg+ywyOib1vxfigziatMPo5iCE9FkP485s16iXu0FeBbJOEe3pe4WcxHmppkLlqJL7YUiuhekGbaj+HwH2qnFPka9MHiA3WrlceeiD3S+FOame34zcOgn8yWI5g7Amsc64a2ETgbDNHvspF4gDrRsiLC4Hw1jCBjyn7QSnKOa9Cf5aFGDGvSx6/0jY5tXC5SK/skLIvys8orIr2GUZAcIbNsXHRx5JCQHKFpLCiMYFvtC8FZxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:14:46 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:14:46 +0000
Message-ID: <ce61ce16-a171-a418-b634-96eeb3fc3004@nvidia.com>
Date: Tue, 7 Mar 2023 12:14:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/14] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-10-joao.m.martins@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230307020258.58215-10-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c53331-77c3-4517-b02a-08db1ef4c686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DJAT8bkV6rHzfLPKkUJevQh1+We71gujtVyW6dYbhBpgbJubUc6GQrQfBh11/ewMq+MU8bccFFw3zRonmIBRvYwiVeAMXPBxqfDqNdhrWwh2I7GhZimiKvTeMHF+qCcJ2Ux6cpNjOJJZgLi2s1hImz/qibctGTN6yxUUrY19V0zwzKKyUubZQxs1yE2iQeassukpXWffzpTplMKs7Sijlm3ff7DPHWtTTDKqEDsS14yaPpMzo8cjRnkJdk6Kc+Hs8ciTTyADy/T9FsmniJSOn3RY6n7IL0CGVQverPfbPMc3RM/MZeF6r7FJM/uStBnrMPZb6rIgdxNGTr1E1ghWE1jKnL5/RMM+lCIcZFmjfIjRNeKM6eRcwaN1areeGGce3/APhkzwrphrExc+VAruEMST67mVZ0VJU5T3HWR/qCorn0nHUsjIkjltN0T4o9kUM+RKX9UokaoDj4YHhk2s9IAHmVdb8xmcEihE8ekrcJ/ClrZ/l8K0XH6sWuuKws1Ra3kF/Y1S+Rn3prJ7D0knMw6HP+VNU86lh7JR8aX/czYxngjBtZXlKeBZ8qqaxO8KbVSgc8u0SySOU+Wo333E9uyBLgpZBvshDpaZnMpceCPb+oZZi0P8q6ez9/S54wmK+68U/15LZM+iww3LsBGFcuv1vOdG7GGV2YmRdIriaguvlXI6PJnTc2a58mi89wfzb/8a0dhVcky91VDgK87MNVLPQ1af2fk1/nBzrdme8fwYxQZh45jf06Ld06AlQ6ifFLvg1OG1eLqK000hFXTzqvsqvOzUprheATbIDj03Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199018)(2906002)(31686004)(8936002)(5660300002)(41300700001)(66476007)(36756003)(316002)(4326008)(54906003)(66556008)(66946007)(8676002)(6486002)(6666004)(86362001)(107886003)(31696002)(478600001)(53546011)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(38100700002)(14143004)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTYyMzFiQVBNMytiYml5cEhITTRWNWZnUEd4VTdtMTU3MCt4QlRGeXRlT3FR?=
 =?utf-8?B?enhGbVFGZ2lnTjFpQllqVG01OHNnT2M5MjFhZmFvVGF0MkQ0S0VvR2ROeUVz?=
 =?utf-8?B?cm5ERWFnamIwaWZjMlduUXUyS2Jaa3h0VFdUQnBYUnZFUnVuZ0trL296dUJZ?=
 =?utf-8?B?L3hQNldXQ01XV095clZNSkN3dXZtcEdBZklzTjM4ZkR4cmFKQnJGUTRnRHVY?=
 =?utf-8?B?QjA0MU4yUWxoSitGVytsM3dGOTI4dExsNjJrNCtNN082U1B4NFRXUXoxRVBE?=
 =?utf-8?B?aG05TWpMNVN6c28wR1U4ZkNNU2lMaDVlczU3N1RqQkhBVWJKNGp4QVVidUxR?=
 =?utf-8?B?cUhKcm9naU1NWDdUUmhhdk51elpLbHFIL0NIR3I4MW1nSk1lMHd4WVVyTkk1?=
 =?utf-8?B?R2pCSWgycDd3eU1TU092YUFCM05HcnU1RC91SExJWEVJSk16YlZtVTVESXM5?=
 =?utf-8?B?dnJKYllSSDU3Z3c2YTJYUERkdWxXdlBYWGFoa0dKN3U3VVFIWmo0Y0ZXWk5Y?=
 =?utf-8?B?UEpzQ05LMUdadDRNSy80NVV3OXVHZWVOS3JKRldpMkc2RkpERmVxRWRZN3Vp?=
 =?utf-8?B?RVlNQWJjTDVZNTRaenZ5eVN3ejJvM3Y5cDh5MzNFVkgxc1pIMU5VcmlPbzEw?=
 =?utf-8?B?d0Z0b1FDUFlJdDZJMlRNalpTNklSVkdWdFF5WHp3SXpSLzJhRlFwTHlLNGxU?=
 =?utf-8?B?RDNLeW9DRGJxaWlQOWF5azAvbmtPcXI5a0ZwbkJzamZVNE9aWjE5OGtGdVBZ?=
 =?utf-8?B?eWkwamJCQUdraStaT25xd2gyTFh4ZkNzSnpIdEdqdXZUZjlKOXFVbzV0b2FL?=
 =?utf-8?B?MFBnZ0s5MElTblNuanFFcnRNM2R6Mit2dnhsZktBNXhEVVdnQWdQMkkyVmtG?=
 =?utf-8?B?NGtGQWxHT3hUWkZNWklkcGZiMXhpMnJlSXI2U2xFOTBxeCtxSDB3VGpMQTNt?=
 =?utf-8?B?d2NtaC9lTHhXT2w0K0VpOVVTVjFqMlpvUjgwZE9DaXdiM3E3Qk5ZUy9wdjFB?=
 =?utf-8?B?ZXRGczZPeUZ5NFRoTzlCL1B4SG5Fc2ExL3Rlem1MZGxIdzZqR09PSlZkTnoy?=
 =?utf-8?B?UUl5NnVVNlFuNGdOb0xWUFJSYzM2enJjeUV0dTBlZGpkTUFlTE8waHpNQjJK?=
 =?utf-8?B?RXBGWDh6amVMbE9yUnB2b1gzZHZXMHJROWhrZmtkbU53V2lJbEt0WEZuWXVN?=
 =?utf-8?B?TnZDTXNxRC8xV08zcll6QStValdNVUZqV0xnL0pQc0NtSzlMQ0pUM1dpYVB6?=
 =?utf-8?B?Z25hdmtyT21zdmg2TG1pYlRqNTdTRUtjVXlMZjB6MHBRY1VyT0VMaVFMVEpx?=
 =?utf-8?B?K3I5eVhFbkR4NWt3TUdVNk9ya0RyRTBXazUxOHlCMjBYbzh1eHdGZ2d6MUxB?=
 =?utf-8?B?anl5VHNZNE84YkRLcnZqa2JpdTJQbk40R2hNOCsxOEx6V0JkNGVWN2dJbTFN?=
 =?utf-8?B?dkRiYnlhN2dvMWd4dzRrRE93dUpQcHBQU0hyS080YUsrUUMwNkVsci9GVjJP?=
 =?utf-8?B?cENuL3gzZFVpNmMrbmswQ0dTYlhzdU1zNWxFTlZmQzB6TVhwV0N1OC95MVND?=
 =?utf-8?B?UVJJNXNEK0tsMUpmWmRMV3paN0lrSmdYTzF5OHM2eG85cENFV3E1WVJEajJD?=
 =?utf-8?B?dlQ1L2gwZzNVZXR5MnZnL0hzSCt6TlRveWM0RWQwWlR4YXFLWkJOTVhSZlRL?=
 =?utf-8?B?Nm9UQjFiMDRtamNhNURuTTJxZWlDenYvRkdBcERPRjcyU0hEbzNuL3YzM1R1?=
 =?utf-8?B?bStsdzNYd3gyWFA4Z3BSWjhycFVrQlZxNnJPWm1ZdFQxbk1WOEllRHVmYi9o?=
 =?utf-8?B?dHJUdFl5MjB3bnNYNmd0M0FtZTRZVTBJOWRBRG5zMmxoRnJkbkZSN2RsdlNk?=
 =?utf-8?B?TVFpUkErVE9iQ1ZIdUJBNWc5MjRob01kT3kzTkxQb2pMaXVETGlHeHFkVkhS?=
 =?utf-8?B?MGdUdCtnd1pLMTJsalViUTY0aHZuc0Jjd25lREVxeWp2czIzZXh5SGdxRisv?=
 =?utf-8?B?cFVaK01jd2k0NE0zR0ptY28rK2k0czdMZ1Q1VklBb0RMaFVhZjZueU1aMXR6?=
 =?utf-8?B?MHVWZHJpd2Q2ZWg4UmlGeWVYSmw0ek9qT3U5eEl0bWJVdk96VmVOTmdmbm81?=
 =?utf-8?Q?KaygxYWgT3N3RiBR0zpSlua5U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c53331-77c3-4517-b02a-08db1ef4c686
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:14:45.8688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLTSY1423foEA2XJ9FLMjq+FUY4IidoAdcs7vO9y9A2tHWNstcmXOnRT08aTYyXFQcu2hgmaoHLQ+fwGZMKpVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
Received-SPF: softfail client-ip=2a01:111:f400:fe59::61f;
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
> Add device dirty page tracking start/stop functionality. This uses the
> device DMA logging uAPI to start and stop dirty page tracking by device.
>
> Device dirty page tracking is used only if all devices within a
> container support device dirty page tracking.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   hw/vfio/common.c              | 175 +++++++++++++++++++++++++++++++++-
>   hw/vfio/trace-events          |   1 +
>   include/hw/vfio/vfio-common.h |   2 +
>   3 files changed, 173 insertions(+), 5 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a9b1fc999121..a42f5f1e7ffe 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -450,6 +450,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>       return true;
>   }
>
> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
> +{
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +
> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (!vbasedev->dirty_pages_supported) {
> +                return false;
> +            }
> +        }
> +    }
> +
> +    return true;
> +}
> +
>   /*
>    * Check if all VFIO devices are running and migration is active, which is
>    * essentially equivalent to the migration being in pre-copy phase.
> @@ -1407,16 +1423,158 @@ static void vfio_dirty_tracking_init(VFIOContainer *container,
>       memory_listener_unregister(&dirty->listener);
>   }
>
> +static void vfio_devices_dma_logging_stop(VFIOContainer *container)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    VFIODevice *vbasedev;
> +    VFIOGroup *group;
> +    int ret = 0;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_SET |
> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
> +
> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (!vbasedev->dirty_tracking) {
> +                continue;
> +            }
> +
> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
> +            if (ret) {
> +                warn_report("%s: Failed to stop DMA logging, err %d (%s)",
> +                             vbasedev->name, ret, strerror(errno));
> +            }

Nit, no need for ret:

if (ioctl(...)) {
}

And regardless, need to replace ret with -errno in warn_report:

warn_report("%s: Failed to stop DMA logging, err %d (%s)",
             vbasedev->name, -errno, strerror(errno));

Thanks.

> +            vbasedev->dirty_tracking = false;
> +        }
> +    }
> +}
> +
> +static struct vfio_device_feature *
> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
> +                                             VFIODirtyTrackingRange *tracking)
> +{
> +    struct vfio_device_feature *feature;
> +    size_t feature_size;
> +    struct vfio_device_feature_dma_logging_control *control;
> +    struct vfio_device_feature_dma_logging_range *ranges;
> +
> +    feature_size = sizeof(struct vfio_device_feature) +
> +                   sizeof(struct vfio_device_feature_dma_logging_control);
> +    feature = g_try_malloc0(feature_size);
> +    if (!feature) {
> +        errno = ENOMEM;
> +        return NULL;
> +    }
> +    feature->argsz = feature_size;
> +    feature->flags = VFIO_DEVICE_FEATURE_SET |
> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> +
> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
> +    control->page_size = qemu_real_host_page_size();
> +
> +    /*
> +     * DMA logging uAPI guarantees to support at least a number of ranges that
> +     * fits into a single host kernel base page.
> +     */
> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
> +                        control->num_ranges);
> +    if (!ranges) {
> +        g_free(feature);
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    control->ranges = (__u64)(uintptr_t)ranges;
> +    if (tracking->max32) {
> +        ranges->iova = tracking->min32;
> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
> +        ranges++;
> +    }
> +    if (tracking->max64) {
> +        ranges->iova = tracking->min64;
> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
> +    }
> +
> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
> +                                           tracking->min32, tracking->max32,
> +                                           tracking->min64, tracking->max64);
> +
> +    return feature;
> +}
> +
> +static void vfio_device_feature_dma_logging_start_destroy(
> +    struct vfio_device_feature *feature)
> +{
> +    struct vfio_device_feature_dma_logging_control *control =
> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
> +    struct vfio_device_feature_dma_logging_range *ranges =
> +        (struct vfio_device_feature_dma_logging_range *)(uintptr_t) control->ranges;
> +
> +    g_free(ranges);
> +    g_free(feature);
> +}
> +
> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
> +{
> +    struct vfio_device_feature *feature;
> +    VFIODirtyRanges dirty;
> +    VFIODevice *vbasedev;
> +    VFIOGroup *group;
> +    int ret = 0;
> +
> +    vfio_dirty_tracking_init(container, &dirty);
> +    feature = vfio_device_feature_dma_logging_start_create(container,
> +                                                           &dirty.ranges);
> +    if (!feature) {
> +        return -errno;
> +    }
> +
> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (vbasedev->dirty_tracking) {
> +                continue;
> +            }
> +
> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
> +            if (ret) {
> +                ret = -errno;
> +                error_report("%s: Failed to start DMA logging, err %d (%s)",
> +                             vbasedev->name, ret, strerror(errno));
> +                goto out;
> +            }
> +            vbasedev->dirty_tracking = true;
> +        }
> +    }
> +
> +out:
> +    if (ret) {
> +        vfio_devices_dma_logging_stop(container);
> +    }
> +
> +    vfio_device_feature_dma_logging_start_destroy(feature);
> +
> +    return ret;
> +}
> +
>   static void vfio_listener_log_global_start(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    VFIODirtyRanges dirty;
>       int ret;
>
> -    vfio_dirty_tracking_init(container, &dirty);
> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> +        ret = vfio_devices_dma_logging_start(container);
> +    } else {
> +        ret = vfio_set_dirty_page_tracking(container, true);
> +    }
>
> -    ret = vfio_set_dirty_page_tracking(container, true);
>       if (ret) {
> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
> +                     ret, strerror(-ret));
>           vfio_set_migration_error(ret);
>       }
>   }
> @@ -1424,10 +1582,17 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
>   static void vfio_listener_log_global_stop(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    int ret;
> +    int ret = 0;
> +
> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> +        vfio_devices_dma_logging_stop(container);
> +    } else {
> +        ret = vfio_set_dirty_page_tracking(container, false);
> +    }
>
> -    ret = vfio_set_dirty_page_tracking(container, false);
>       if (ret) {
> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
> +                     ret, strerror(-ret));
>           vfio_set_migration_error(ret);
>       }
>   }
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index d97a6de17921..7a7e0cfe5b23 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_put_group(int fd) "close group->fd=%d"
>   vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 0f84136cceb5..7817ca7d8706 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -156,6 +156,8 @@ typedef struct VFIODevice {
>       VFIOMigration *migration;
>       Error *migration_blocker;
>       OnOffAuto pre_copy_dirty_page_tracking;
> +    bool dirty_pages_supported;
> +    bool dirty_tracking;
>   } VFIODevice;
>
>   struct VFIODeviceOps {
> --
> 2.17.2
>

