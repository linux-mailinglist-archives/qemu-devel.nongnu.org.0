Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B706AD9FE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:15:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZTOo-0005k3-1o; Tue, 07 Mar 2023 04:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZTOj-0005jp-MR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:14:17 -0500
Received: from mail-bn8nam04on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::621]
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZTOh-0008O4-Fx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:14:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krlEemu882kB4h3yybSrCcByw39NLSlFA2+32Lxv5MHAIbtjlxLHqfZR3jBK4VOEEMVlJBzx9cyhoc2jPZhHZAXv2RpBB4XSn1vHNJPsO06ZxFASPE/7gk/O2gqicAGWHPQN4g4BcXxygbZD3/qtFX33GDcHmtasqEoQQT0My09jHRJP5qDE1VDM9jNs7g6u93S3v4CqaX6BELiWmr6Uu2uwZcdMKw3/fTZ7ywDWoKH1T7Bv0tErvCDrLOwTpv61o9Ux4fO9Zx/jzPjZy8Qdat0bHJb1Xm3AhSwdSQIg9SOgayNstSBaAIxw5/uxhJ70GUASWdhTmfi4sQd3GtsuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBdXrUu/fxXC/2jnwVVNBma/y/594A3+mB5670Io5jc=;
 b=bPvz1+myytna32gf5Io4nrovgEf/lXgR4v835suAWtr8RKhaSqKRATA8mZUPPKuM2iatyBIqhKDu+eyAkCcTRG6rC46CDXGxSJ5bgTwIEhCns13DgICJGhAoYrd5RCsnp92W3a45AZku84rXG+47sa+/bLYjGBUQlvUlzK+jMcc1sOoi8rVkfO8nvy/zSfZbotX5uaHKZKePkpCWqvT8zQTSqWLsJU0SlPcd5IbOd3hTORAKFXte9g+7ufU2JO6Bi4kihxjafxm2M6Jt43r27EStURCXU4PMnKMpS2rqheTMWtaPb27pCPAs6L8EmStRl93OYdQIy092H9iCglL5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBdXrUu/fxXC/2jnwVVNBma/y/594A3+mB5670Io5jc=;
 b=I+AF//JWvYqcxFPJXfIWIoXK8iDxC5CQrwmgHQfSXnJIZacNWJMgzVacng0sSqiZwkc5FMkCLN/m8bKHlSFFFmqcNs7ygJL5sMfdEbuw68bOFsmdAYjjnIfNEMsCm2ZnSYO7O687ry4Gf4BY1xrPsr4QKtdX3zUokaiP1hbwa0Wk9VDilbDgTsvtAgAVHtP76U3qbVq0w3IqXr9TisNHYVRHfiakWhODSlZuhdLUrAqpFQX6RK5t+avkLCbxN50seVown2F4eTJBb//doMcZP5EEnCesMZ9+33IsEws7fJxYQDJzaH0iXJzLgZTn2nFpF1ja761CaqqLhvZhHeJvqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 09:14:11 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 09:14:11 +0000
Message-ID: <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
Date: Tue, 7 Mar 2023 11:13:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-7-joao.m.martins@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230307020258.58215-7-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|DM4PR12MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8db3ff-ef23-4a18-8849-08db1eec4fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSFzwMrks356RnYQH8KlRm55AL7uPuGr9e21586wagUJcHyOg2Vm02zhMz35aKshkITd/gl+rHMpDyYWDV0Fanh+dtm33xe+ISBFq63ifNg0WhYq1qOkXo+n9zqjUi8OSbv3+gXxAqLEiaxrcildmceJVVgJI5znGq0lB5FrwCvaMjxh55XrhvtbbsqyX4X+PaGVSI7J9oT6yECb23+agQioNor7O3fUO0VA6Eqxc+Slgkb6gWN7gADJzE8IRBpP0NB+ahQn9Z3X/ro5TMixUtKkpJcGOxIfxVAemWNA+QZ6dIwyh4UaVWwvgApAybNO/eK17UKS0z9zxsgfWQLpJu9t2/jgwy+Mw9H3Ng1neBZ2BsYc3Ry9cv9pCYitr3HJdGhL3EbVNuT8tU32CNb3gBMtdUb6wLOUaavvSPkYNHiQfhq+L8W2WO5RI4QZzbhqi5BboP+FlfoTpnw77sZRbMBVtKARNs9LfWfCtA9qiGDJwXz0eRzHpgxIdjyIs8pDCo0gq9TUpZVfgyva2YGeO1jzvQS54OiU4XsWXHV0AZHAgjpdQpoeLtuGAkte0VFke7HBl4HFuF8p8E/b+vFosTC0RJ0seam8QFRkTLiT5j+COaMK0V4MqarDDf5XvF0FkGexLaTiOgVcnJdZxVbekzwhnpgz5h0mvJTijATlfqNfTrMSLjSpWxGqJki06UM90mujMwUPbZNLmAqG8WbXWlWvx87mO4VyBG/JYem83o4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(36756003)(83380400001)(66574015)(107886003)(53546011)(26005)(41300700001)(6506007)(186003)(5660300002)(6666004)(6512007)(6486002)(2616005)(8936002)(2906002)(86362001)(66556008)(4326008)(66946007)(8676002)(31696002)(66476007)(316002)(38100700002)(54906003)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJZU0tlNVYwQnZISWd0cFpHYW5RSGtKbERSS0UrWHFXek9JUEpNUmJKcWMr?=
 =?utf-8?B?SFBMcUFTS25aWkdQSjc3KzR2UXNTdkJwMS8vM2tYN2ZUZnNmUDAvWnRhSHFi?=
 =?utf-8?B?bFdFYnRhSi9pMnZtT3NwcXlGcktyWmRuL3dvc04rdGROblVJV2ozZDluWWFn?=
 =?utf-8?B?ZzlBUUNucGtnby83WGJsREwzODdhMytDMlNNcnZTWTF1L0VoR2pMWGtWamtI?=
 =?utf-8?B?Nm1kZ2ErK1hEQlJ3ajlnMmhnMVltUnJXcHczS1lkSEpOYVIwaFRSVVd3ZjJ5?=
 =?utf-8?B?WWwwQnR0Y0cxTkVuaktweDZVSmtCYUNUNExEYzVGeUVYZ1VTUWNlS0d3SnJl?=
 =?utf-8?B?T2hJSFRkL2NHWlVkaGhrcGd5YU9ISTMvSUlaSitUaTFmVEl4VkFxcnptSDVn?=
 =?utf-8?B?V0NRSWFDMWVBMXFhY04zTjhvcEJmZEpGZjBrL2tLMUdydFhSU0g3MCsvbmN2?=
 =?utf-8?B?TWUySTRhVTAzVDYwd3F6T2dtWHIvTm5ka1dFNVhuUlVITW1VSjcyZ3k1R3VS?=
 =?utf-8?B?RTVIZURibDJoaGlJQ2NTS25XSzM0NGpCNVZKUjEvV1ZpTXB6WDVTOWEzQ1dq?=
 =?utf-8?B?MUwyMEpHK0Q0cTZXVTcrSlo2NzFCUVI3RVJLS3pDUVFEK1lNVFJOT3BrTnVw?=
 =?utf-8?B?VkZPUmZaNkRkMHV6dURXK3BNalYxSXg5Y2dVdm9WaFFPNlVuZFhRL1dreExk?=
 =?utf-8?B?Yjl5ejNEaWhFM3hWdGk2K1doN1NTdXNsNUR6TEZmZ2I2QmpIRndVRkJjZi84?=
 =?utf-8?B?dTVqWXRUcEFMWWE4MlFUSEpBdXNnZUc5Rnd4Z3BQbTNyakE2YjhxV1NyMEZG?=
 =?utf-8?B?cXk5ZjFMNmZVZzVUTHdIMG9rTjNLVnFTWE1kU1Q1SlJvVHZVS2NlVG0wOGUy?=
 =?utf-8?B?SG1FUGFkVEEvNE5kR0pCWDJybWhPZWZqWDhKbFpOQlBUUllic056Um0rQUQ4?=
 =?utf-8?B?VjBHNkRkUmZzY2JEQWRJL3VXSkF0QXVUSXRHc1JtTnNvcFZ3ZlJvN2dNSlA5?=
 =?utf-8?B?OW9EY3EzR3Jrc2NvZTc2cmx4V1NCb0hDbVhSSGJTY3F5RzJzY1ZHZ1JaenAy?=
 =?utf-8?B?N2krYTZKbkY4ams0bE4ydExTMW1GUXdkN0FreUEvbjhXSkZETHlDNVlMTTM3?=
 =?utf-8?B?VzhsODJySlZGRmd5d3RNU1QrZWgyN3FXZWhWUmFFYzNsVVZDYVBWaGN3Njhh?=
 =?utf-8?B?eHFWVmRoRXhFQUZWcktnZy9KTkVieXcvUUt6Zk5RRi9zZFhHc3laNDRUQlll?=
 =?utf-8?B?bmFPN2tGcmZZYmM2cVZXSmt2Y2REZzVUdGZFYi9TUEFnYUxDeWdmYXRucnlE?=
 =?utf-8?B?VlJCTDdGb1hnNXltcVFPRGpSR2FMK0h4MVZPd2NzYU4xU0xBbWlYQllnczB5?=
 =?utf-8?B?cUdlTmwydWY3QWZMZXFKLzI4NVBEY3hUcjJGM2FLNG1jSzZYaUkySmgxREpu?=
 =?utf-8?B?UXVlTGpydjg2dmlWN2xRVVAvUi9nbWhiMWU4Qk51aGp3ZzUrajhQaHlReHIr?=
 =?utf-8?B?MWc0UitCVDZKVXJXZy9BV1lPVDl0VjF1Tm5ObDZzdUFQM21OLytyWFRYNGxm?=
 =?utf-8?B?VDRKWHBJRjNub1lrTnNPbHMyTzhrb0pPU3VoNlVRTUJJU1lyODEzNXg0dVlU?=
 =?utf-8?B?SThpSWNXdnpmN3hVTjQwaVFPOTM2NVdDNEZLdDV0SmRhVlY3YXNUWWp3YkNG?=
 =?utf-8?B?QmZDaTZtMkU0Z05XSkZWVFpTWG85L0pWSlQzNTR1Sm5aNDZVcmxmWVU5b2ky?=
 =?utf-8?B?SmViZHZqK1M4YkZzL2p6TlpURFNiU1BpWTBrQnZZdmZhTGVtUm9hWEhWcFRn?=
 =?utf-8?B?eEpLRXlsY0hYblVQNW9NZFpJdDdLK1pZM0cxWkIrM0QzM0YzMUtuZm9DYjNB?=
 =?utf-8?B?cnRzcVUyZU9Vd0R2Sk1aOUpxQlVRYUJ5NWpvYUYyQ2VHc2dhNzJISE5aRzNl?=
 =?utf-8?B?QWM0WW9kRnV5TmhFLzVxc08yOGxPbkwyVTYwVlRDVlFuUXRpWEF1aWZZWTFo?=
 =?utf-8?B?aWQzc0xabEVPZjRDTVB6REFrYWxtTnk1S3MveU1mc1dIbHJIZTJ3SkJ0QS9X?=
 =?utf-8?B?SFUrN3NWNW1FODlzbFg0NnlvU2Vwa2VTVkIrZXY2Q1F0N2xTa1luZVBRRVU5?=
 =?utf-8?Q?uxmPofe4kgWQj0VIImswomO7y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8db3ff-ef23-4a18-8849-08db1eec4fe4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 09:14:10.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U93NUBnFXn6v5p+BcKFi8rnvFeAJcaEdXJPf7vKMyBiz2q30/1k0pIamOtp4Rm5XwwsoZ+fMWOatwjxXimgMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246
Received-SPF: softfail client-ip=2a01:111:f400:7e8d::621;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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
> The checks are replicated against region_add and region_del
> and will be soon added in another memory listener dedicated
> for dirty tracking.
>
> Move these into a new helper for avoid duplication.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>   1 file changed, 21 insertions(+), 31 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 99acb998eb14..54b4a4fc7daf 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -933,23 +933,14 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>       return true;
>   }
>
> -static void vfio_listener_region_add(MemoryListener *listener,
> -                                     MemoryRegionSection *section)
> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>   {
> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    hwaddr iova, end;
> -    Int128 llend, llsize;
> -    void *vaddr;
> -    int ret;
> -    VFIOHostDMAWindow *hostwin;
> -    Error *err = NULL;
> -
>       if (vfio_listener_skipped_section(section)) {
>           trace_vfio_listener_region_add_skip(
>                   section->offset_within_address_space,
>                   section->offset_within_address_space +
>                   int128_get64(int128_sub(section->size, int128_one())));

The original code uses two different traces depending on add or del -- 
trace_vfio_listener_region_{add,del}_skip.
Should we combine the two traces into a single trace? If the distinction 
is important then maybe pass a flag or the caller name to indicate 
whether it's add, del or dirty tracking update?

But other than that:

Reviewed-by: Avihai Horon <avihaih@nvidia.com>

Thanks.

> -        return;
> +        return false;
>       }
>
>       if (unlikely((section->offset_within_address_space &
> @@ -964,6 +955,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                            section->offset_within_region,
>                            qemu_real_host_page_size());
>           }
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void vfio_listener_region_add(MemoryListener *listener,
> +                                     MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    hwaddr iova, end;
> +    Int128 llend, llsize;
> +    void *vaddr;
> +    int ret;
> +    VFIOHostDMAWindow *hostwin;
> +    Error *err = NULL;
> +
> +    if (!vfio_listener_valid_section(section)) {
>           return;
>       }
>
> @@ -1182,26 +1191,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       int ret;
>       bool try_unmap = true;
>
> -    if (vfio_listener_skipped_section(section)) {
> -        trace_vfio_listener_region_del_skip(
> -                section->offset_within_address_space,
> -                section->offset_within_address_space +
> -                int128_get64(int128_sub(section->size, int128_one())));
> -        return;
> -    }
> -
> -    if (unlikely((section->offset_within_address_space &
> -                  ~qemu_real_host_page_mask()) !=
> -                 (section->offset_within_region & ~qemu_real_host_page_mask()))) {
> -        if (!vfio_known_safe_misalignment(section)) {
> -            error_report("%s received unaligned region %s iova=0x%"PRIx64
> -                         " offset_within_region=0x%"PRIx64
> -                         " qemu_real_host_page_size=0x%"PRIxPTR,
> -                         __func__, memory_region_name(section->mr),
> -                         section->offset_within_address_space,
> -                         section->offset_within_region,
> -                         qemu_real_host_page_size());
> -        }
> +    if (!vfio_listener_valid_section(section)) {
>           return;
>       }
>
> --
> 2.17.2
>

