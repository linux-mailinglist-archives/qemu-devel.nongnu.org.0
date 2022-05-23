Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5ED530967
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 08:24:24 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt1UN-0006tX-Jz
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 02:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nt1NE-000591-59
 for qemu-devel@nongnu.org; Mon, 23 May 2022 02:17:00 -0400
Received: from mail-mw2nam12on2062.outbound.protection.outlook.com
 ([40.107.244.62]:13953 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nt1N2-00020i-Fd
 for qemu-devel@nongnu.org; Mon, 23 May 2022 02:16:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxnlS4H4eUQ8Io4qDypU1F+lrmzxR5GCP+t4ur33aocTy5BryGoArj5sIcxV2qGAUpj8rizsWS/R35n7jivn5Qvyb09Q2DR870x/AK7MmpjRsUa2D7L5xCVJ37OtG4Foqh0kGVdnw5VHpoNVm7osJYm78SO3WJqoCn+lDBdQcZYS1zuZkBCL0q4xp/LhGM4Glrc+d2MErdV9uHEk5VYi5V8fKaqT83i8hPpT7y4oJLOg8XWDzzxZkPpkO7Y3exeMTeJpNTed0fSZem6Cfq06jvohllzHlgIWcETzGmqgs8G2etJyVYcaX8A8ZYa4iFnIk8tE6LGKgPQ9PtW2GIKgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ww8qGYP9wYRQQFqWUMCj7MyUgK+JxsVTSIC4knJ2A8=;
 b=NM6VEvdtWV+c4wYpT0ZrkbUjIlzq89UmFOpSfQfJyWYiSAqYmlx7iBz2tkPV1ltxhjDKYGxVWBGN3DAy6Yt7iSRnzP66Y5ogMn8Z0htwYVIEkXeBzj457Y0z4+km04U1nU7zQqtfW82azl1nn8xOFgeT409z394QQk6UI+HZnaAA3V/v5ZCF74ykPaGLrLIuNvhA7NbC9QGIHz+6halMrT/QZpd241AwjotWaD/ZIjNhNe8AhKDJ0eaiyYrUvDKm7wX274EM6z3fzHwCc3VaxXFbEE2jG0amZROgh0u+DYpYXpXNYMOhp1LzPi0RHOI2hnG2SFq9CNmLspUWeP8SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ww8qGYP9wYRQQFqWUMCj7MyUgK+JxsVTSIC4knJ2A8=;
 b=rDHcNmyy6AUmM2DNd9U7M42IOEsHUbXpkBUFLjeGLdXFAWaHYVKgJGnluWdaQUC9IJXNum8/s+AafKyulzAE4b0j5HDWtNAc74mtX0jxwyOCDRfX09BlBe/gUdAZ0ZCvMnY4knWNZAEbtEG+tEcppf1a69ozs0g/wa18yhplG2k/M2TalBf9UilraLB1ULJVdxJEPFufNp/2mqURYiw4xNWsqSFvvZY5lPaFDa/stR/WdV1vcfSqgfzNaOYISbYwWeSvc8QSleSmICBu0XfNOgP+0PeYA3cFjnnAut7zL5v5DiLJ8YRyvbqhqLrjWHSjFlpCG/MRuZ6RYaFmhoxurA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by DM6PR12MB4700.namprd12.prod.outlook.com (2603:10b6:5:35::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 06:11:43 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::a1ca:addf:80ba:e6c3]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::a1ca:addf:80ba:e6c3%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 06:11:42 +0000
Message-ID: <9d3084ab-2b5f-8ccf-5384-11d5679ae294@nvidia.com>
Date: Mon, 23 May 2022 09:11:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, qemu-devel@nongnu.org,
 Jason Gunthorpe <jgg@nvidia.com>, Juan Quintela <quintela@redhat.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <49f27f66-33e8-e6ed-c791-fb6e7b7a7938@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <49f27f66-33e8-e6ed-c791-fb6e7b7a7938@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0463.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::18) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd575bf8-e85b-40cb-ad31-08da3c831b87
X-MS-TrafficTypeDiagnostic: DM6PR12MB4700:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB47005238C3EE4EDA530A972FDED49@DM6PR12MB4700.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtGsxGE6vN8QIoZMEWuianaqJx/hk4xU4xcrZ2iFhB5q4x+tBK5QBADjtpbfxacDGZqTlhJOniQvyoOG/obTITkS3au8wibjlITJB+v6JGi46QzX12oWfH1yPV8jctCIrAmIr+fDTFwz4ushdk0BLvdlExyuuEXE7wpu5+gAnpvi3H0s8qmeXNFYNR68qTIx5n0kitwubJoZRUS0Tvw7rw0pqpMRXbv/F/HoaYmJ6EiM417Cn7IYjtba50q28K5av92UEiQr58DNhBr8UPWWydmNKmseASSDOISEFbC4xPeM1fvh/RFZtcYj3pAp1ufzy5QyIg+iEl/sOPUCZY0Az1sAQWu9r2gtuXLV+AkSarZw6SUI5rieOJYFZUoemvixsU7PNsRm9TCQf5K+jBJcuSszjtYMFLTVJJSpaaMIm/4bMGM4MdrsPbWwh90bj7JSRcXrRfaLfKRmo/kipcA/qY9+J8po7Cj5R7AD0dEHj56jKeKTRTZ3cLNDQHdT8Aavmc3bSH0mvnQF1el7UCiID9okatanW9429H5PyBP0tmt6gcdrdR+oOGR5Xkf6BMQTdRly0wYfNdhhKUr5a/XZTflFa2g3fFp2vst9KXC9WL1bAS6dBhpfMbf/RAZEN8Ghmdolrneg06wrS8NH2BR/e/4b3ptLlYZsJLIAFijBODGpa2KoQpHtZz5xAK38DQsM+FJQJm35f3fcPjSNneAJCMIQscxZyzcy57yiiqWR5/myjt8Wf4UcLvD8gy4+vsEU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(86362001)(31696002)(36756003)(186003)(6916009)(316002)(54906003)(6666004)(83380400001)(31686004)(66476007)(38100700002)(66946007)(2616005)(5660300002)(66556008)(4326008)(6506007)(2906002)(26005)(6486002)(8936002)(53546011)(6512007)(8676002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlickRqMmdIT1R1MGQrOWU1cVRZZXlvNlRHVE1MU3RXK2gwQU51YnpQa2g5?=
 =?utf-8?B?Wnl0aUYzUEZEeEJOc0drNXBUSU1JRFAwM0ppbW5CdUU5R3pXNkpia0NLYjNt?=
 =?utf-8?B?UXMxZXNWc05qVkJmWkFFSitITnhCamtiejhyNkkrNlpCR1NSelFWUkZmM1BG?=
 =?utf-8?B?aU1EY0tMZHJpNVlpYlc3bkpRLzZSS2ZHT0JOSk9FdlVVamk3NFFXZ2hNV0ZD?=
 =?utf-8?B?NGdkVTBnaWhzRXJ3RFU3UFB3ajl5ZE4rN1IwOUhPNlB3RHJUcTdaczRjVy9C?=
 =?utf-8?B?bURMZzVoYysxaEtlWU9ZWnpUNGtLbkh6SVhEakFBSGNycXBWMThBbXZHcmxQ?=
 =?utf-8?B?MDBEZDlFMHRGaGhSSmk4R2VrMUh1ZW5QVnk0NEhUdWRIcmZFZS9zTFI0cHZy?=
 =?utf-8?B?K09sc0lwcVFXdDdtVDF0WGJiYVJqNGdKejFvbFc2OGdrNjFsODNpVG5TU1JO?=
 =?utf-8?B?eGhpQmJDTWpiTGF0cU1qVlN0WXJRcHAzbzJ0K05LSzFmdmd0aS9OMmsyOGEw?=
 =?utf-8?B?VWI2cmpxUFNSR0g2OTY2U2pac09weDFJUVhmZitid085QXlIRkpWMkY3WGFo?=
 =?utf-8?B?Z2djV1NrM2IwUENUVDZLMS9TekN5eUtPQTk4dm0xMUF4WG8zZGJ5a0ROZHVs?=
 =?utf-8?B?NzlieVc2aGd4V1cwaEEzNUpLc1AxeWR1NFNBMFZBYzdZN21qZGhQcWN1KytF?=
 =?utf-8?B?NGs4R1pkZ3UydmQxZm1FaGJFREpEbWNtbjNVekUra3pWM0poOW8yaWFmZEJy?=
 =?utf-8?B?M2w5S21ub0FwVlRFZWlMWVdiQkJLWmQ2UnNGeVRtYnNoWFRpcnZUNndQZGhx?=
 =?utf-8?B?Nm9DWVl1REM1d0swb1M4cDN2RjlmSzNBWVN6aXlxRjlqR216T2wzTm4zZmZi?=
 =?utf-8?B?OUdicnlMQnFDZmx6Y2R1T0xQSVJINHNHSEp5K2EwZlJ2U0RMYi9CemVvaU0x?=
 =?utf-8?B?SDBxck41d25hZW1PMHAzOTMwODFhdURidGpYZEU0RVlqK3I5Tnp1ODlNRElZ?=
 =?utf-8?B?NHBHVXJUc2c5QzZVWDBGNVJDazJBSVV5cmoyWDA0Ry95ZnhwOVc1MmplYUNC?=
 =?utf-8?B?OExHSDZOc0R3M0FwcTlzRytHWEIxUnVIcFRiazN1YUxnVVRxbmNMRXBtT3BZ?=
 =?utf-8?B?czZvQWFRQW5iVW1GMWQyKytSdVBUVFNOYlVpZzI1MVQ2SlJRY05icUJSL1lv?=
 =?utf-8?B?c3hzNWZxTXc4R0xTV1k5eGtQMVM3WUprVWswbWxvQlVVbGVyYnJkVVQ4Zk1n?=
 =?utf-8?B?KzcrVWF0NlptZEoxVmp5VjM0UW9Sd3Yrb0pwaHZaTVdJVVI3VExxeGhyZGdV?=
 =?utf-8?B?V2p3UkVPY0FnajhBcWVUa2lLa0pGOEtFS2pXa0ROUzIrbUJ0UVlValkyWnBh?=
 =?utf-8?B?TENOSms2bm9CRGdsZUp3UHZOTllPc1JVU1M1SldNTUpmVGtxQWJPczZEczY5?=
 =?utf-8?B?bHVhOUdjZzFSZE1QUXllRCt0RmhVZEpUWllBNmtNK2RudCs1MVZiWkpwZlFP?=
 =?utf-8?B?d3lEZllLZmhhTGpzTy94NWxWbmppV3RhRzF1eVYzczBMaUJrMURsQ0hRZTBo?=
 =?utf-8?B?RlhNMzFwZ2wrTjc4dTJFMWZueFAzd2VteWxTaWhxSWhQem5iOTBRWmNqTFlO?=
 =?utf-8?B?c3ZWUnNRWEdBbjZ3Z2Y5SnovZDR6NVRwdWJYWU9QR2JEOVYxUWdSQUMwend2?=
 =?utf-8?B?dU9qS1pia2Y3UW52TzdHSGNueUVuMnYwd2FqSzU0dlMvTVQrS0xzVkF5MGx5?=
 =?utf-8?B?cFBIbEJzN0lRZEF2L2pFakh5a2FJdkRHdjNlUlJrQXoweklseXVYYkxxT0hO?=
 =?utf-8?B?aCswQXVHeENiekF2QWZYSURjWkRuTGpGZmFVblQ4YUdYOW9zLzhWOUt3YlVr?=
 =?utf-8?B?NmtRZzdoL044NTZNZmpnY2VNNEJnNEdwYXhWK2MzbjZzMHptUXRpTTRoUTdB?=
 =?utf-8?B?MlFxdmFQVU9SVDk2Nkl1RmRPK0liRzd5R0dtUGZLd2tMdTRYblNtN1pvWkU0?=
 =?utf-8?B?TDNiM0FFN3U3L2FDL3pBSVZndjIrZWswWEEwczNNaHVRR3FrVE9nSkx3eFhi?=
 =?utf-8?B?OXhLUGtrN2xZUUdZZE9MYmhORnkveWpoK05xcFJxTHZDY2VaTGVUaGVWeEt6?=
 =?utf-8?B?Ukx4bWs5eFQ3aVk4a3RHZzJ1VHA5eWhLN2I3RU9MV2x3SVdReWtlMjlzdlR2?=
 =?utf-8?B?TzV1K1A3c1lLenZJQ2VOZkVrbGp2Tm5iT2x4VDhGQ0xYMEhocEhsNW5JYnZ2?=
 =?utf-8?B?MWl2ZzY5alp3ejZGdzNSWVRLbzlMY2p2aStKaUxCMmtoekJ3RDJwek1RR0NO?=
 =?utf-8?B?b0VSYUxNbDIwem5MNSsvMWRZeUVlb2ZUa1lJMDJMQ3ZsOElWSW1lUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd575bf8-e85b-40cb-ad31-08da3c831b87
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:11:42.8948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re+EU7ahGJDgot3ZeVXdD0vXwPfBLhE7NVjwhN/jwUZjz4IWA5VZgZGy7YetbgBlKjJyugFnOh+c99KFYlS7Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4700
Received-SPF: softfail client-ip=40.107.244.62;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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


On 5/20/2022 1:58 PM, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> On 5/12/22 16:43, Avihai Horon wrote:
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 21e8f9d4d4..d4b6653026 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>>       struct vfio_region_info *info = NULL;
>>       int ret = -ENOTSUP;
>>
>> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
>> +    if (!vbasedev->enable_migration) {
>>           goto add_blocker;
>>       }
>>
>> +    if (!container->dirty_pages_supported) {
>> +        warn_report(
>> +            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
>> +            vbasedev->name);
> Maybe warn_report_once(...) given that the following N devices would observe the
> same thing in theory.

Yes, you are right. Will change.

>> +        migrate_get_current()->skip_precopy = true;
>> +    }
>> +
> Perhaps it might be easier to reuse the existing knob to disable pre-copy
> per device that Kirti added some time ago, rather than changing migration core just
> yet (e.g. you might wanna bail of the migration preemptively because the CPU is dirtying
> too many pages for example?):
>
> if (!container->dirty_pages_supported) {
>      warn_report_once(...)
>      pre_copy_dirty_page_tracking = ON_OFF_AUTO_OFF;
> }

But this doesn't prevent the VFIO device from dirtying RAM pages during 
pre-copy phase.
The VFIO device can dirty RAM pages during pre-copy and it won't have a 
way to report the dirtied pages to QEMU and migration will be faulty.

Thanks.

>
> You might need to tackle the fact you will get when dirty_pages start/stop ioctls
> returns you error messages. The errors is just because log_start() and log_stop() simply
> fail because the ioctl doesn't exist, but everything else is fine -- at least that's what
> I observed at least. Should be noted that it's a problem with the existing
> `-device vfio-pci host=XX:YY.ZZ,x-pre-copy-dirty-page-tracking=true` regardless of this patch:
>
> void vfio_listener_log_global_start()
> {
>          if (vfio_devices_all_dirty_tracking(container)) {
>                  vfio_set_dirty_page_tracking(container, true);
>          }
> }
>
> ... And same for vfio_listener_log_global_stop() -- maybe a worthwhile predecessor patch.

