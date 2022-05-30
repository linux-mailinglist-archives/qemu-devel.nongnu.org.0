Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6053871E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:12:09 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjs8-0006Y7-T3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nviwn-0005Oo-5h
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:12:54 -0400
Received: from mail-co1nam11on20624.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::624]:3129
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nviwk-0000jb-Dm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:12:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyDN6OJt8324ZCTtWfDTXHZw9LquGberW12KudK8i9c/cBOJGSIGeXKIFUmqFDo/feAB6TFQPlJajEE/HYGmZDpPfAD5GuyCJSWSGvJwSk31prwQYIQPfmilUo6b7YzXm4s+wqQwiDs+K1cHBydhRCYNgtWEF08H08MX6QMFP9+OzI9G3c6BwF2iJJcmnKoBO2J2AgO/4XBO/D0cM4ohVDZtFTIc5lV2JrGbkpY1519ez1pl8yhn5WmJuzS7FlmQfNeIsXpYFxvZoVgrSG1+XOQzKEAM4o53FbuDguDHuQCNsd+3R1fyaZENWZfe+PxVho4kHbBH0ZmOi0eJpmMJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxVc4zaSL1Y4UFUf2QQEUd0bZyAC5oEAZFN/XZJ51NY=;
 b=aVTiFM6TKKbwzu5q4tq/a9lojeTbuhVOTVgOUbQaiAu9nT87whdXhIjgdt7OLiT81roJAvDYK+J42JrodVV7GC/2wa3os86dvXcrUnU4eVQ9Vq60QNc+5y/4N+vTYuAXbgM5CMexWI/2GB77MHNYk1uh4g+WW7ZqITLsHszqknG2O46+DjD8niG0xuQEdIuFyc3SMvkCImg7R/w83WvtjKKrQjKceskC1fCGSkLB75n8uuKLJhrgigdzIUEUnrzNTJEPSm80nl04KTVp1/e2VVM4MYdoCjdCURAOM5wYVgFqwJBWoY3D6w1dW6oCfXznUgckkhXbHsTP8PszvWDtvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxVc4zaSL1Y4UFUf2QQEUd0bZyAC5oEAZFN/XZJ51NY=;
 b=JAd9mCVRyclOoPM9GMmP2s9wKFiW52aDqgQKbUy4n9oY3uCWsoxaB7o7/R+Q/ThVwDRTOoJXOuPOgh536IB5815G6PXuZ9f4sfWuTaMZnPnfcd977zuWDNR2pZpPXMxbLir9zWNPNlhS8rbnTY7a7fspkcXRUg9qmAahKB8ViV7KVN05mLy35zCIsF3n0o5fInwbne7BWl9n/ZlhdOKiKXGoWhvswaTFVrVWbTfO6a0ax4+d3mN5fvLDTOx1o/bIvJwtulOswrKExTD45aDQxxmfgi3O39eFFRSULobAuVL2BPAoaOFCRXUGcUsXHEvdsE0iqjub/2+DEyxVUr9NVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB3642.namprd12.prod.outlook.com (2603:10b6:5:11f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 17:12:44 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::d4a3:9322:f9f4:391d]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::d4a3:9322:f9f4:391d%6]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 17:12:44 +0000
Message-ID: <4c9fc435-1ebd-2bc1-823c-9b20f423ab44@nvidia.com>
Date: Mon, 30 May 2022 20:12:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 02/11] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
Content-Language: en-US
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-3-avihaih@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220530170739.19072-3-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0455.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::10) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ec5c13-c21e-4bc0-6476-08da425f9c84
X-MS-TrafficTypeDiagnostic: DM6PR12MB3642:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB364205966C24381978A720B9DEDD9@DM6PR12MB3642.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVosvJ9Q7tDqPEMEHbiNHb2LxhmxygOj+aZxE+LewGMwhk5trfI70IadzMz1qG5hRKxo3/x0BY/lCg5xChK5+ePRb2+/mbX9PvUz4UqvnjO3qUgnlul/7ab+Tj081NXAcnoHaqS8CTuZ3CrEcKKCYhJ5wpBdoL8vyb+a+JFf21ZlhluS0PM/Z70gflGlf3LGLQFoJhofk9sBW1851OCSzE4EhENaTTbEyM+8gNB6P4tuf/EqrOLjy6N7jJs+N0Bwc50SdfPhgf1k/uYVxhhnksPpsGKTxEZBbkmMsrAw7Il8wN+bAW11X7PbDKliJoCjE40+SR9cZj5TqOTC7x9zf0CNyOlDdLb1vOBVo16LpNBV3OrfXg070KVznO0atFwsJRujZtOpiULw/ONeV6VW7tRLYqs1+1o2L90hO2TsH5lOUI8zOGyDe+5058kk1ieBPP8euaoDxUS0TmQOxNa9bcag3p5xZIiVaqHBgT4n6qQ9mYNe5Q2aiE7lAeKnHoSj5M+fvLohy07H2Zfb1p86T6aPIeq9PICTwaJKkXUARjis1pJBCe03NDhkEcPfm+4nsSMhRVy7aYZHUv4AHMd9ojBvtPS1cNZojRftef4RLUn/21qhcna49VDUlz4UwExNmXkuW/vvM+fDUEhP05Um5u9zgwQBBpWr7tufeimbvWuwflZ/xXksYi5qwoWbETOZL2HBADrItzAf1qeCNpQj3o9XBW+KV9oSXRlJVvkMmsaKNGfB+OC3Y8iJOw5Kf3AUnCmDSmjK+KvMhqkpVLuTzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6666004)(6506007)(6512007)(31696002)(316002)(54906003)(53546011)(8936002)(26005)(38100700002)(2616005)(186003)(2906002)(8676002)(66556008)(107886003)(66476007)(66946007)(4326008)(31686004)(6486002)(83380400001)(36756003)(5660300002)(110136005)(508600001)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3pwb3RwMVlwUldSQ3ZVZ2ltTFI5NG9LY2RDNVRJVTZNWC93a2xCVDV0QTJx?=
 =?utf-8?B?aVc5RnFGZFlRczZuUVJKZ1hZR2tpUHpXS1JOMFd5UjFNRkw0VGRSZmJZWkVz?=
 =?utf-8?B?RFg0ZlJTaEZ6WHJ2SW1nTlNJMnR3ZU0zZTJSVW1TdjRCVzVxMk1aZXZkWjJR?=
 =?utf-8?B?cnZrTmhrYS93elA5RUluUUtDb2UxWnB2b0xlc2NWcVJ0T3B0MHFPU05YRkw2?=
 =?utf-8?B?OGFnb016TEZqdzVBeEVwVklpT1ljTXRDNFVjWEZ2VmlyeUJTMTRyaVFkNzdQ?=
 =?utf-8?B?VXVCWDMzakJGTE9uc2YrUngxbTFSWExPUitOcEdFdmEyRUVucmdVLzdsOEdx?=
 =?utf-8?B?TUpleWNLdWxYcEZvVGZ3QnBUM0dYWGFtNC9CQ0thbnMrNERzL1NhWjRYVnBF?=
 =?utf-8?B?emc5cmlhNmZZUDFnUnNaT2svVmo5MkNCK2Y3eStDclRnT3Q0aGxNL21keWZB?=
 =?utf-8?B?SzJCSnoxYVVkK1ExWE9rK0dNUlNCeVVRS2U4SC9xQTg4KzZnNkkyUkFCZUlU?=
 =?utf-8?B?SUxFc05JemVuY1MvN0FDWXRPbkUvS2h4KzFsaXlGdzEyOUxWWS8wUGtMYnN3?=
 =?utf-8?B?cFNpVkZMclZ6Uzk4Q1lHRWtyeDVGMVZVTDM5bDZrMWVtY2o3aXFHWTVYOU9I?=
 =?utf-8?B?VlptSWVhQ0FNeXpDUUpMakhGd3JNV0M4RmQwd1dLZ0ZnekxCd05rL1NEbzgz?=
 =?utf-8?B?ZXg2VDg5OXdhNkU0aHova1NqanN0S0I4UDFiOTJMaWxqS29VQjNlazVvajh6?=
 =?utf-8?B?OVlNNzlpVnRIaCtkWDBERXlxRDgyRWJRMC9lVFk3bTFxaDBYVU1EYnlhQ2s3?=
 =?utf-8?B?OEROVTk3MDhaeUlUYm1qNmVueVE0VXlNQUEzYVJpZWFPVVY2MDhsakhuaW9o?=
 =?utf-8?B?RmJOdmZWa29meUQ4ZXlsd205ckxTQ1VLSVE5Ni9iNEhidmJhSnVTYmdmRUc3?=
 =?utf-8?B?dFdhMXVJWUJVZXAvaFphcG90UGZXMk5yR0tENFY0SHlNR1hFRGZIWkVTS3cv?=
 =?utf-8?B?MCtUaGNHMGJaODdVZTdsMWlCS3dRYnUyY09wb005U01MSklaWjNrUGVHcHBj?=
 =?utf-8?B?ZXZVSXBEQ3lvYmc0L0RwV0hMK2M0eUh3cXhyTm90WnhlbXN6K2ZmSGRneEJl?=
 =?utf-8?B?Zno3TXU1WVV6ZXJyMDAzN1lIUmNxS21mcGFod3oxMTZKM0hrUmVyby8wRGR4?=
 =?utf-8?B?ZFRDSE1tODBMRkFsL2drbHlSZ2hjQjQrbW9ncVNPbzhuZ1owcUJBcDBwYXcz?=
 =?utf-8?B?bDd1QlFMK282UDE1L3RvSCtqNnlMN2hrYW9INm9RMDgrRkErL3U3TlByeWJi?=
 =?utf-8?B?STZLM09QRXM3bVRJMWhwZDlJM0M3NzA2MUdESmdvS0JaOFRvRC95VU5FNzZh?=
 =?utf-8?B?K21VTVh0TkdsSVVKMzNibW9MbUF1dkZ3U0tUMXR0NEV1akNmM1FQSXUvV2VV?=
 =?utf-8?B?Q0hOcWdaM0lCSzNtemFBd1BwS0Q5RGJyTzVPbmRrWk5iWjB4amRpdlRuSERn?=
 =?utf-8?B?b3FMYmJBN1JuQWRQK3ZIYXJMSEVPSFo0YVdQUWljMTBvczVvQlA5R2pTRGkr?=
 =?utf-8?B?UDFmL1d3SzJ2N2RNcEZnc0EyZTZib3ovU3h2WElGcWk0bUxJeEVBeU5sUVpn?=
 =?utf-8?B?eEdVbGpPTUw4b2VYOTlsZFVUWEZwUkpCMlFhUDdJSUZZZzhKckFrT0t3UlVR?=
 =?utf-8?B?YXdkaEpwQ3RWQk5jeEt0cnUzMmdqVXNoc0NSa0dXT0J1UnpqKyttMFY5UGFt?=
 =?utf-8?B?ejYwcWRibVZiMVFLd1hLayt6aldOK25TVnc0V3l4aU83a2t6MnlTVkpFTXAr?=
 =?utf-8?B?VlNYZUtPYk9xQWc4TUhnM1RrRHZIMGkzcnNUNVczKzFGUEtNSlVCM0ZaWXhL?=
 =?utf-8?B?a2JsZEF6UmlEUUpaODZ0NDVzVDVNVlpDeE5oanJBczd5cUdjS2J4bjBmRmdT?=
 =?utf-8?B?RzI5RklWVUpja1JwMmgxenQrcXpkeUdsMWs4c3B2MTVVMkhueURJQ2JJdW91?=
 =?utf-8?B?dHo5OXdPbWxWT1Y4cmRtZTlRaFBmcHlBbmxGbEdDcGJzaUZ5MGxHU2JUNHdQ?=
 =?utf-8?B?SWFBdHNZelhCeDNjRXhXQmwwN0MvLysyb3RjU3BGY0xrQ2pMUXJtakpSSlZv?=
 =?utf-8?B?ZUtGRFJ3WUEzcDJjNDRTdjVLRTBmdzZhZm1oN0dMeGlYZW5SR29Kd2ZNLytw?=
 =?utf-8?B?TnlKTkgyTUNMSEVXVlBSVjFlaEZvOWVHSklaQTcvc0lZRkNwcVlub3Nma1VS?=
 =?utf-8?B?THE1ZmNJSXNoYjJRVHpDVmRoNkh3Qkg5Rkx3Q2xaQWZrRk12NDQ5SjgvWndo?=
 =?utf-8?B?WVBGMXpwVy9JZHExTld0QXV3RXlpQmtLQVpCRTdEdHFyTDVjK2xXZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ec5c13-c21e-4bc0-6476-08da425f9c84
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:12:44.3782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUv2KfIVXLFCQktdi83UoiNmkLbXTH2gpVfTag/kXpcltQ2NDMzb1xTtre6wLBSLPCJwvZ9IbbWSDpdgToQXeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3642
Received-SPF: softfail client-ip=2a01:111:f400:7eab::624;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 5/30/2022 8:07 PM, Avihai Horon wrote:
> Currently, if IOMMU of a VFIO container doesn't support dirty page
> tracking, migration is blocked completely. This is because a DMA-able
> VFIO device can dirty RAM pages without updating QEMU about it, thus
> breaking the migration.
>
> However, this doesn't mean that migration can't be done at all. If
> migration pre-copy phase is skipped, the VFIO device doesn't have a
> chance to dirty RAM pages that have been migrated already, thus
> eliminating the problem previously mentioned.
>
> Hence, in such case allow migration but skip pre-copy phase.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>   hw/vfio/migration.c   | 9 ++++++++-
>   migration/migration.c | 5 +++++
>   migration/migration.h | 3 +++
>   3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 34f9f894ed..d8f9b086c2 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>       struct vfio_region_info *info = NULL;
>       int ret = -ENOTSUP;
>   
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>           goto add_blocker;
>       }
>   
> +    if (!container->dirty_pages_supported) {
> +        warn_report_once(
> +            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
> +            vbasedev->name);
> +        migrate_get_current()->skip_precopy = true;
> +    }
> +
>       ret = vfio_get_dev_region_info(vbasedev,
>                                      VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>                                      VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> diff --git a/migration/migration.c b/migration/migration.c
> index 31739b2af9..217f0e3e94 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3636,6 +3636,11 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>       uint64_t pending_size, pend_pre, pend_compat, pend_post;
>       bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>   
> +    if (s->skip_precopy) {
> +        migration_completion(s);
> +        return MIG_ITERATE_BREAK;
> +    }
> +
>       qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
>                                 &pend_compat, &pend_post);
>       pending_size = pend_pre + pend_compat + pend_post;
> diff --git a/migration/migration.h b/migration/migration.h
> index 485d58b95f..0920a0950e 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -332,6 +332,9 @@ struct MigrationState {
>        * This save hostname when out-going migration starts
>        */
>       char *hostname;
> +
> +    /* Whether to skip pre-copy phase of migration or not */
> +    bool skip_precopy;
>   };
>   
>   void migrate_set_state(int *state, int old_state, int new_state);

This patch still has the problem that it doesn't respect configured 
downtime limit.

Maybe adding an option to set "no downtime limit" will solve it?
Then we can allow migration with VFIO device that doesn't support dirty 
tracking only if this option is set.
Can we use migration param downtime_limit with value 0 to mark "no 
downtime limit"? Does it make sense?

Do you have other ideas how to solve this issue?

Thanks!


