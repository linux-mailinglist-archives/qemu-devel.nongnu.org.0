Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91739686CF1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 18:30:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNGug-0004oa-00; Wed, 01 Feb 2023 12:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNGue-0004oQ-GK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:28:48 -0500
Received: from mail-bn7nam10on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::61a]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNGuc-0007jC-50
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:28:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inhG4i/sRVVGEZysLNsRfnNqnuVqW3+nx2/p/BAEvhU0yR+ShTIEt6BrgfXVJDIcGeXCJ0KDD/w5k/1aiXclCsalBXidlXDwivo9X+HuCU8X/qdOW9s2FWDkC8UCVQncE+0MR4gWwBP//pql7EpoRzsRdU27dYgk4HqgnV3H6MrOY1IloOI9mO0AM332zHR97jGZtLJR+ZRxCswDb8jSCPcGL4zipzqVIp3igCq9iwDFs5bmb8ZJ6mxNYIhgM8BTzsp7UvlXOmeNB7rW7kqAGmwfhY+xxxkydGQbDqV328aUweNi4ygAVEgPi0y3Eyh+jsoGcXbusNaNWUePDp6o3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnBuYE/+re314PioM8XjGwgQDuxDQP5CVJ8BMhwADFQ=;
 b=KuaK19pelIfm8YSgwbqzuvJVAyjjYiiNSiNpj3ShfWgjVWSbRdOKrl1kC6VKdrW0sJ1baSmpfbmoKiudKUtH7ds8VetL0OiiBCpnrf6AkOy7gOqU6bhB1L3+pjXDgFdTBqDuI6nii4HCZ8OOzyj6xyNxZYkftjcRMgKR5HSYzCFu3JyJtIa8Y3PkED6d8Oo4q3NYf9ms88CbVsnXXFx1iSqsDrLgM28d5JT/Iuapor1LnmZEiw8RfLMWuFr+gvuLLkiradCQhmdPvZxPtg1wdWh/bjY+mbTfWMO1CM5Em60xyCQnpT+y5xAO9IPTV8BGED5+qdCPUbQhB1rYQQXZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnBuYE/+re314PioM8XjGwgQDuxDQP5CVJ8BMhwADFQ=;
 b=m8Onayu3EGKGE6MEFCK2mcwSiM3YG+08d/+BxXsXuj9DxxNFH0U9I7o8dpLGcXc5nkrqY1ucXGfYiguVQI8oXP6iKo3KfgECvK8A2vZ9pwkT147vGej+CC4yXFeZn4dc93enrqBCP2/GwAYBfwXjVxxAPpUfmJc5eEMnJ4VCvnLTPhWpATHv8T05qdaX9LGwtV0V92kX7sj7IlOPhK1RcdBxBiUEH0X/M7Z8PLGxfYhEzwuWaRvcj74U9RSy0pWDYAZEpQPDqx3EbAzEeAx0DcIx0x0W4cZCigEdb/OGPUIBXUfdr90yXfh6h3T4W9GgejMd3+H+lYXvIDNXFiU5mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7498.namprd12.prod.outlook.com (2603:10b6:610:143::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 17:28:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 17:28:42 +0000
Date: Wed, 1 Feb 2023 13:28:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Message-ID: <Y9qhSK9ivzBmhnpZ@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
 <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
 <20230131154301.4aaa8448.alex.williamson@redhat.com>
 <Y9mkbLczUb2LFb1o@nvidia.com>
 <20230131211503.3a328e0a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131211503.3a328e0a.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:32b::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f81d829-5729-40d2-8971-08db0479c375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: neF5UJ1KONWeP9ih9/XhfaydoCCBs+epv+HJbsJFus02EsqhfD2gesQ+ZGgp/qSoiPsJAVUDVFi67ZWfurP55sIUmFbitWns/Iv+WZ/xaNvIV/dbe+vBFJv2ERBOM/78gFoEZ5azRhGGbsXKMTJh4F8D1HgVLvDzYvYD9IgnafUVivmK+lGQMoDi+3IpikzaCwW6agHVgL7s66HJKUW7Xd8m2DJVvenWxYD2YnbmGnPVA6Ize97yT1LYCQmgbvquChLtMZPlX8zZXXxlfrH3DaPf4YOv4TBtDXYRq6SpE5EKmmbqItB3MklAzehYQw1JfQ47chnHja0PhvxvHxvzbC5kfzKBCIOxCNjv4FW992gxFCG/JEYe65zJdRd3qNoIY0KcVFxoii+7gcFDLApOnNXGaEDkIJJ9IuYAe/Mw6x0UdcjuR+99cL7ZP2gjFUKnUjehbt9ij7IXDD83KkmqhYWZ+6/nfq88KWF76sKUU78EU924dIV4FTUoqt4E6W5yhqGn4WHj/Kf+nMscGaAw8hYPyUZyryPImldx+NN/gFzrxRwAdMEHPhsK05x/vQDlBb5MhV5S02fNzHPsgWXauAYhgX0vaYrAfGgZtSMes/KSsBGucy94/9B3MBDlzfPWtPBlYLXdFC6Sh19Xik6/mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(38100700002)(86362001)(36756003)(6916009)(41300700001)(5660300002)(316002)(8676002)(4326008)(66946007)(54906003)(66476007)(7416002)(8936002)(66556008)(2906002)(2616005)(6486002)(83380400001)(478600001)(186003)(6512007)(26005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hWa04FZLSqMNJqV7NdO44ViIGEL/+dD0RcEKeYnch4ALrJ+yAhTgR3dYJxvq?=
 =?us-ascii?Q?nXWObDGWPgFPAugA7PCvhICBiTT8i4coH7ICZ+E3n/GLJEph01lAylHNOytD?=
 =?us-ascii?Q?LdNphF6KhJ0i9FLVM6cW++q+tXWc1KlXv7SJulQ3ivcxbEbOj17BhFqJi5Ia?=
 =?us-ascii?Q?bJ7KiVoqrAl7PJ4rDA/Sz4QbNn5JeLMu1cSC9gXdkOgWjwOVlzhN5JNDw4Kg?=
 =?us-ascii?Q?idamakX0YE5r6OGzTeluokCvjHs+RsFtB7xqFTPZXwZ8NwoOtHa7GGLdC3eP?=
 =?us-ascii?Q?IXmOzOr55Ts8qQlYE6AgkwKDwijm/mLUlN3nhu4aSHPr7azjHbM066R6Q34z?=
 =?us-ascii?Q?4ZFkAagNs/jcV2Gdt1UY0/wO18ykD+48a3PB7PekxIZeT3KXsZZJtxuhC0G2?=
 =?us-ascii?Q?uj0vCmDy6LFA5C6htYW+53L2KPcYp6wLaHGp5X88u9kjjvLdOdt9yvjxf4Z2?=
 =?us-ascii?Q?xwKgMHb3qlOuyrKgEo6V2W0SmNYine+xrjg24ZE6krCU3LdMsSwcU210zv7t?=
 =?us-ascii?Q?QDKzTr1FeLtI5V/9VpSU61hVH8HLaAmpb0d4GeJzS5yFCqOkP42DqBEgOxCJ?=
 =?us-ascii?Q?reDOkbjAlEQIkt3Q2LS89Ij5+soVDGyqQ1IgWVmiJTNrgRHt/Ak3hKyfYUmY?=
 =?us-ascii?Q?Gz10x4zZqvYwwK4yj26amyv9UUbgZeN95GS5lr5Qph1BrTR362TStoe5/ukj?=
 =?us-ascii?Q?fKl0PbVRO7U7pdyQ/0+RvOvYXYrj9vSbPJ06cL2SeLIDyZgrF+q0itXoB85k?=
 =?us-ascii?Q?/wI6T1ew3SGO9pqGNFzSh8sWJyVbpkV5aM5pfkSMP7A/XjoRUifR3MmaKzKS?=
 =?us-ascii?Q?G4QVbv1IsMmlJs9/yOgGU9g47PGdNKFozGQesmfMAHV0XJJLn2F7JRmbAEGI?=
 =?us-ascii?Q?hvfTE4coNE853Sis4kBt5yM+qoGBDC1fuMsseVe26qMnRgKjbtd87dbuSfoM?=
 =?us-ascii?Q?HnlqDPF7pRVlo4rIlyd87BVrlnbFvbDl+ksz7UKIdqBVrbQQHW3Qq3WY/xv8?=
 =?us-ascii?Q?qSx8NsBPLdKJF73PC8OZixOCi98wGEKV3niOE62MnU8ZNEpRtNGil3Lm7rR4?=
 =?us-ascii?Q?5QOZuhuyKh5i5d9Rkh3NmljbLjaQxTFzhP9iY6qzwxNG8YxvIu0FrnfsW4Ye?=
 =?us-ascii?Q?3RQNcxP9PCAt4ktQWYyoN+WB+YwGLXxISfS2yFoN5GtOoqJpIzDyxdAFyaUI?=
 =?us-ascii?Q?ozkPyM6vf0BdPOXVShEZ6jvxJ7bO+O+hED8kar2uJjMGY+nIxDH/MEQRNBkd?=
 =?us-ascii?Q?NzNV4aCBuOoXEAyJ+SAkN6CRJiMA7STpqGnRf2x+sGhBl7DAl3/RfV6Acwws?=
 =?us-ascii?Q?rp5yGNumLvmDRbuAD9IAKthr/lVJ2OS9CVGKew8OMzNBgkjsyKtAUs0NEV7+?=
 =?us-ascii?Q?uHst3aynKWdS94NCJ5F57HvG7tDWmxd97RQlEHHd0XiZBbW07szl2+UHm4Zs?=
 =?us-ascii?Q?WMloxTI2Hn2hUtyBmOrC/Co9mSKhGPMaK/yUFl4r7MRFeATlkcGJR9qZOcci?=
 =?us-ascii?Q?ZLBwxHvO/hUzwCOO4Z8L/dh8b3dPEaa0wKo3WavyBxhybeqLzmnO6/Lsgrv3?=
 =?us-ascii?Q?EA1trQnyWmSXMC0ZSixEh8qh3g7215hVPSoRwehB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f81d829-5729-40d2-8971-08db0479c375
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 17:28:42.1589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBnTZ0SmFWOuz3Xx5T+HZmeeCS5mhze4BJVmGTKV6wLGWbSmHoQNB/4iy7V+hL1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7498
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::61a;
 envelope-from=jgg@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jan 31, 2023 at 09:15:03PM -0700, Alex Williamson wrote:

> > IMHO this is generally the way forward to do multi-device as well,
> > remove the MMIO from all the address maps: VFIO, SW access, all of
> > them. Nothing can touch MMIO except for the vCPU.
> 
> Are you suggesting this relative to migration or in general?  

I would suggest a general qemu p2p on/off option.

> P2P is a feature with tangible benefits and real use cases.  Real
> systems seem to be moving towards making P2P work better, so it
> would seem short sighted to move to and enforce only configurations
> w/o P2P in QEMU generally.  

qemu needs to support it, but it should be a user option option.

Every system I've been involved with for enabling P2P into a VM has
been a total nightmare. This is not something you just turn on and it
works great :\ The whole thing was carefully engineered right down to
the BIOS to be able to work safely.

P2P in baremetal is much easier compared to P2P inside a VM.

> Besides, this would require some sort of deprecation, so are we
> intending to make users choose between migration and P2P?

Give qemu an option 'p2p on/p2p off' and default it to on for
backwards compatability.

If p2p on and migration devices don't support P2P states then
migration is disabled. The user made this choice when they bought
un-capable HW.

Log warnings to make it more discoverable. I think with the cdev
patches we can make it so libvirt can query the device FD for
capabilities to be even cleaner.

If user sets 'p2p off' then migration works with all HW.

p2p on/off is a global switch. With p2p off nothing, no HW or SW or
hybrid device, can touch the MMIO memory.

'p2p off' is a valuable option in its own right because this stuff
doesn't work reliably and is actively dangerous. Did you know you can
hard crash the bare metal from a guest on some platforms with P2P
operations? Yikes. If you don't need to use it turn it off and don't
take the risk.

Arguably for this reason 'p2p off' should trend toward the default as
it is much safer.

> Are we obliged to start with that hardware?  I'm just trying to think
> about whether a single device restriction is sufficient to prevent any
> possible P2P or whether there might be an easier starting point for
> more capable hardware.  There's no shortage of hardware that could
> support migration given sufficient effort.  Thanks,

I think multi-device will likely have some use cases, so I'd like to
see a path to have support for them. For this series I think it is
probably fine since it is already 18 patches.

Jason

