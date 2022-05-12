Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87025255AC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:23:55 +0200 (CEST)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEPi-0001AP-Va
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1npDaG-00030Q-Bv
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:30:44 -0400
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com
 ([40.107.223.70]:4894 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1npDaD-0007R2-1I
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:30:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1GWoGPTYfEKW4zZF0iyUV7TaQgsJgHcs65GuGXvVdW2OHddlTKQ6Hzq3xizqhL2nXtsGqiE0DvRIvM+QsQ5d8JB2f4RpMsjGyKvtNXhhy1rBXNAhQkefofn32CJoTFvnnE0hd1mbEH9b/+xv84kzu+Rsdlk+cLif/P9EWx2nAtxv/XzqyTBw5ZGgfJCZoYApWt+TWEs4mpXGDWrdE4XySYOAEdSMZ43q7gZyKjAZu2jIoDr1T9+XJrLUkvDJERYGXSXhI3v/dBLD/M3xbhDvdvZoAJoBpHt+9KmVFZToDU+2O9Mz19//bPgx4rwgGWkZceAc9dizPagQ2rC8+6GPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqdSKkCSk01llXCeeOe/n258TB14aK+1ebMNFzPWXXM=;
 b=QQPhawzljldZbphbpDpRp9QqWbDz+i4YEduiWs/c/efAFyzr4xIK8/6x10OTXY05NHRe9K4On3RC5FPRbmaa3LqYLuRctmSJG9yvwMY7A5vWfQlDqxHVG0A0TlnmdZsNvOVODXp7tYZwMmWigApix4qBJbsAM6qPnlXMJLewIXAUiW0aYLklxD7bRY5HjPJZnj4AASoxig9wC42s/jMWv25CwZm5yb44+f3CB9E5pRqWpJ1b5Xo/gtz7VtF7gDN4ZpadvzAOr61zUPa7yby1/ZHhwc89UilHJEi2s72HINcnIiMgyQgxCiI0/YnltdJf4hc2KsrbyLih6OOT+QGakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqdSKkCSk01llXCeeOe/n258TB14aK+1ebMNFzPWXXM=;
 b=JdD97tEfG7jBvkV9Po19hftELgVCZHeHFy0vXqx+GQH8NdGjQWcgEF6gojOHD7iCMbQPmGoWQ4eDlSNpzT5wcwJYUzoPCEhIx2sefxfLfKeCc9oQM4o6gU7K92rS8xstM6hXvxbuqMFoRxGudPADL4WIsioMIwNfxmcG3Z2e6znIHScl+bkReLP5m0h1ujhhQiCzEgj2ojteHy7P5/5tdvhAEBVqtEC4hfGW5zeo+T9w41UxWHYATau9N2jwsc8DUet0fswTkg82iVR1st4VOrLWZZQc8HdEICvNDHSUYfLA0k1NJI/16dJdRD2/JSnRNjrIG4aHLhEqgExo5Hwt8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ1PR12MB6267.namprd12.prod.outlook.com (2603:10b6:a03:456::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 18:25:34 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 18:25:34 +0000
Date: Thu, 12 May 2022 15:25:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 2/9] vfio: Fix compilation errors caused by VFIO
 migration v1 deprecation
Message-ID: <20220512182532.GG1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-3-avihaih@nvidia.com>
 <20220512115710.413c7e34.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512115710.413c7e34.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c918cba-7d6d-409e-7bf5-08da3444cda4
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6267:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR12MB626766E616BC998B4869AC73C2CB9@SJ1PR12MB6267.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ez8BZ9meZ6hBnkcBvsyq3POGiDwK4Sq5Qmp7cCy8dNtKUrqbFeZ8ahFSd41VGBkinAy9MwyWutT4LDoUFWSpBTMloXfHZAZPTtlyz7UY5KnXTMaNfXzRCjAyxHAE8OJ9Xae0jQwNXeKlCTEFPrd762oc1dJcVTvlrIDD8gRSe3PptuClOlUfhDOVIarGIirLcM03Flrg28xLZB9CDN3Ncy+cBJmmHkQYswmTDcWbECROBYxzTGcpSps7uF7MhpcpcQXIOFQVhvCA/nce3P5ZxVwv3cJZwBnod1Dr1E76HrTKcNFcjaPXL0cWs3JqOsgNETgZC2PY7B+pVRBU886Gc/AmH6r8yrkIsR/LHQR+0w7JLExWlxOqdvruNvVSVpAtQCirlkQHftMP7Ei7HJI+rNTtbDFzS7j7t1BeyraX/fRCdu7/pbniV7B3txohT2NvYUZ4IkbFP03iLRgRG1euCpCdIxy7uiihrG+yPwjiEyd2SM7OhpOKVLsW1xVkupGJrAERWpdbhen7zYX/eJrN8LdphV5ERJIQuXwKbvFVZw82016nTYInds0yHjiGmbITmJELEoOBUJUZwqR4h6UT9mLYLLx1bxHgjZ7wKrD3f9Eb9qPE2hUWsJ+dkyPF7uXOtqWXHpo5TcTvv+3I1zdZpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(36756003)(8936002)(2906002)(26005)(508600001)(5660300002)(6486002)(86362001)(6506007)(54906003)(6916009)(316002)(66476007)(8676002)(4326008)(66946007)(66556008)(2616005)(1076003)(33656002)(107886003)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUKls51HbxwPlsEIqai1h2N3XOoGwuXsqGcCJAOpiXg1/LUuIGo5v51XNBms?=
 =?us-ascii?Q?DxY+kpzr6QLlPeaqRA2nw9gny0ZZJmlh6c4yizqBEMfOdK9WbpyfP6ZmE+BK?=
 =?us-ascii?Q?JISd2Zr8ev58zOeOeCn122Pf+EV8Cjro9BfVfti0EuyFc4NYXcXCUuV+cs1D?=
 =?us-ascii?Q?6s5ddLzEC5O2mCGCegPrK7/+H29FfJ/4N+TsLrL+sO7N/H1iaEwS8X7ySeIS?=
 =?us-ascii?Q?kfIF0LxJExahKSQgjDG6233I0dFtMQB99cJKHafSSzcdv4kAVkKokpG7xDPO?=
 =?us-ascii?Q?34kZSPnuogGRjHol7FGKJxkq2w5l64uPUqMeI6LejYenbFnuS/u92bFcMHt3?=
 =?us-ascii?Q?TTF4AfU430V15B71TI1Im8k9p6AovE9kApi4fZ8V9GnoZAAHEh8VElB6NbHo?=
 =?us-ascii?Q?DYCrhdRZ6in0kxqW1DOyKpIo74gbkpSs18yz6WCfzOWMvA18fcIG0WwiFZ/P?=
 =?us-ascii?Q?wroRB7jZfW3XB0NeR494IyHLleROhgVeoWi1U8LNEr6U0w6fPIi0NYdifuiJ?=
 =?us-ascii?Q?G9j6OOkJjvscKBTJgS1r6FSlP7C55y6Chi1l2yA4OWcCXzQih2WjQ65XW2JS?=
 =?us-ascii?Q?kVSNZwSakrOUxhpwdwJh8UGm4lxL++KgymQxf2K0nSiWyfcCExG9xbA/5qWh?=
 =?us-ascii?Q?VifEXTffP3AGvs0mLlU56tnnt7terqckltJP5LpgaaybWutNpWfQSFwpCYVb?=
 =?us-ascii?Q?PAd0Igvy6+qZxSRPTQzfL7SezH/FG5B977tCPmd0sMKsnoqgE5bmvZCzbrPW?=
 =?us-ascii?Q?Et31Fbbs7Aah64W/9SLToB+b2SA6ZmTwoN7Kvi7v1TvNoI18K7lmGyLth+G3?=
 =?us-ascii?Q?DulRnhBJsBmdBzIsAC/+HFe2OGqtYr/oW02JM2eT7qDLdNKHUhvvJxN657Bk?=
 =?us-ascii?Q?gNcSdYEmiZgTykITILg0AfOuhrkitHb+4iOjBIsNHkrDR651kbx/hxbISjEp?=
 =?us-ascii?Q?tAVxOEsYIMePB8bnZa/LmCP2GcAb0BcjoHyYKqqLw76q94RiopGxBZbPJbIu?=
 =?us-ascii?Q?C5Npc9w47sPmHaiJCHNlmdoA0UpOPkG0N+F5aMfYrPr6zRHPpuNrtt/MIEIl?=
 =?us-ascii?Q?vJoVWAedfxFUhH5i/4C9xonu7l4e6d7W57qm7Wed8ootFNgRzl5KoFd67NpB?=
 =?us-ascii?Q?g4UvZORJV2evJDetUU9U6iAFemFIcCdnJETCApEZA8n7SzHLuPcxyecfJr6L?=
 =?us-ascii?Q?+TFWA9RwNHiHSVSxfiTQY5xsJPV0Risqx2mnfoiHKF+6VewcvUdIZPUKszEH?=
 =?us-ascii?Q?9VwNhrt10QlvWb22UtT4ABahFsTJ92OL9gJYS3KtutVMGOAlcRTAy1IXn2u/?=
 =?us-ascii?Q?lO4jOse3KZwwYohRKUMw6QT5QPsfd71yri0CDd1GwST+TdQ/7xGeQ9n5RDtb?=
 =?us-ascii?Q?/f8Pwmb/Jdtn+vZ3xT6DZP07RWLjP2m2sAuYw9tvebRz4lkcY0JH2tVgh4pq?=
 =?us-ascii?Q?PRMzSjlvICNdSf40ne42jfBvQs+XMylANheDpInYFZKSSdYxxJ+8nd4qCEYq?=
 =?us-ascii?Q?adTyzJUOvS0H/B0IQQZUEBPutCaBzwmMkLw1YC5AEii/U7kvEa+ESvrIp9gU?=
 =?us-ascii?Q?ilnTBATSKO35/1NUoK73kTN6Kb6/GmHtt3JhZrGuNUQ7PdwdJyk+NQjCkjYR?=
 =?us-ascii?Q?ZpiYTD1qTyM/A4BfHqQoA8kE54Q68/WmQcgspeCuTqSQm8I29cqLqztOIhj6?=
 =?us-ascii?Q?WOMZ8wrQtf2VOXvyAfOmtX7FUIGxaCmwEtj8mhDY5o63rW8UzQFeiUS52kdN?=
 =?us-ascii?Q?sQu35y5QgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c918cba-7d6d-409e-7bf5-08da3444cda4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 18:25:34.0125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmSxdyFIsErlzsrnGNmP1fkDRDpLTu4w8Av89RvTAmP9iHycV1Ktt7k0fnYJRFq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6267
Received-SPF: softfail client-ip=40.107.223.70; envelope-from=jgg@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, May 12, 2022 at 11:57:10AM -0600, Alex Williamson wrote:
> > @@ -767,9 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
> >      case MIGRATION_STATUS_CANCELLED:
> >      case MIGRATION_STATUS_FAILED:
> >          bytes_transferred = 0;
> > -        ret = vfio_migration_set_state(vbasedev,
> > -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> > -                      VFIO_DEVICE_STATE_RUNNING);
> > +        ret = vfio_migration_set_state(
> > +            vbasedev,
> > +            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
> > +            VFIO_DEVICE_STATE_V1_RUNNING);
> 
> Yikes!  Please follow the line wrapping used elsewhere.  There's no need
> to put the first arg on a new line and subsequent wrapped lines should
> be indented to match the previous line, or at least to avoid wrapping
> itself.  Here we can use something like:

This is generated by clang-format with one of the qmeu styles, it
follows the documented guide:

 In case of function, there are several variants:

 - 4 spaces indent from the beginning
 - align the secondary lines just after the opening parenthesis of the
   first

clang-format selected the first option due to its optimization
algorithm.

Knowing nothing about qmeu, I am confused??

Jason

