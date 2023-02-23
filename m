Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C46A1189
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:56:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIdK-0007im-3E; Thu, 23 Feb 2023 15:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVIdI-0007ic-3V
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:56:04 -0500
Received: from mail-sn1nam02on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::60b]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVIdE-0002BW-5Z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:56:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNj8eYhEowsDpCVWwCx1RP/TzTxBirUSMVgBc6GI8i13rsBmI76VFRf1MwJ6TsqZ5X5VvYcpqypNS/ZSswbkUK7l/hOXl4xlUdbrR1xgp2v5Ze9THmS5axqbivrvkdarfol4zQTFoV30c3nISaswATJ/fc3bOrIaZBh5dkZXtuGtKFWwqzsV1XJ6NnkhkqANd0Ks99eUe812LSx7e2KdH3ppep6HV5fs2XlT/4LuzZhAD65WXKdk0VNTLdzetCK2z/DQehA8/7ag+2JTrfWljFzZzZlChhUPpnCl4Nbabi/6oqDmbA5Dm99Yv2dG6U7c88EF3NaeX4AQGjFkTu/PlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t7j9VMXQKiSUsxD76BiEmOGUmRbDNptQ+7GjgExpXo=;
 b=jVB0JDa1/AsJRCWSQDdQtiuvvCOGp2iFCfiBDbLwa3UQOrb7EhHPdAw1xXyRzq/xIwNcJrnRO2/4G+PH0VyYCmxWGbfIySfjwa/UXIuhRz7i1KxbZrQ2IWjWGWVH/lEmK3ff4R8zCMBagfXumna85lOzNeH5wV5Rpvay+v0BZ36pjcxxJshmuXEsljwlinuaUqYECXxDS8B2AI5Ieyk7uejf3fQYqykdcsrVd84iEtEThTHocjj3LpHamPoC9BfzE0BomvUstJ+1jC6ozd/hSeAtFROqSZGK2h4PFYVOjKJ1yh25iKb9H2Bd5XEpxiX9c8OATBubwr3lVTzbtBaykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3t7j9VMXQKiSUsxD76BiEmOGUmRbDNptQ+7GjgExpXo=;
 b=nnE7RaHYt1iT8VAv61MzvC9upzgqJQ0JoAxnkCUQ58+DpYQmlA/zq+oIKsVIcIp6MQ/l3GXwEb0pKvKgxMQYLZpBpcmCk03uRWuAEHV9nXaOV72mdK7BvLPMtlXYfacaLARkxLWms2WMLtBCrSORYQwTwDyRq+4JPSx4o7u3S3+y7jNLTV7MRbRm8VOtdw8CVqoNSdOk27LmwGF95Cerz7d9Ya9gzjnp+HED4Wwg+YStBdxvIbRqU28gk3Pj1KYyukJy7htqpW2ZKesrmOyaCO8jW3DTFXSJAxRh8iRq7KRt6KkU4rLj4J0cO6WoFq2id5vsA/R6MJGhxAuWzwRMZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Thu, 23 Feb
 2023 20:55:55 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 20:55:55 +0000
Date: Thu, 23 Feb 2023 16:55:54 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Message-ID: <Y/fS2rX+JvYVC9jR@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223130633.4bd07948.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR15CA0054.namprd15.prod.outlook.com
 (2603:10b6:208:237::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a65e387-5cdd-47a5-3bda-08db15e05b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: artoX6xu7tcbnwntsknEQT5griCVP4zXP2qEkVqnwU5zLg/8fTVOfgOeSZ2YCkqpjeJMiY1k4234Spxowu9EgDm4ZaoDN7y7mCWmN364/iX0Kd/SH1r1mdTEGowqaMFp0BhpBNgPtEqPJmXgFqpyBqixpIAtSwkIgqGr4yPgoKj6iOjQHwdLbRFt4wqVFIUCqugGBVbpInhhYTPyrjpYZTp/FG/9G3qpVR6WBolsdBQZ7BC8PGKBYwLBp1n/kFvmfxclA0OGpK63GNxAeYbFzPCAe+Bm+xqhw6pyGsdRs3pFT9McfxW2gb9+z7DPW2l2jGrD5Mb6p8QRz2k3kHIRjsIquMGRw2q7EZ1QMRx+wp5/29YiHFNEoi7oYj5KuFBriemsXTEOwMpQUZkUEkw0xuezfEYrSLv4s8VRXUvAX2HJMP/t/YheTyw8Vk7Kfmzqj9THSFJAKX5Fr5op7uDJARcAG6KyieBAHl44Dd8tAYiABSWUPpJexLHjSQ35rIBupq5/vk0ieP4jbMBfBMDZNPx3u1d+nVZ7gfuJw+Q5daRNHihlrDtdVRwFm+l0XPm/nip0CJzoMpqB3aYJ1pTIvfVm2LFYmZvvBjBWcRAxthFesbFpoxtwrPEpNJJJytUbrjYguMBfnGVZ6N4WHzM4ODsvoKvGqeMRtJja9DT8Ct4QgZ51OyZS8vPF1YSwQshT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(66899018)(38100700002)(86362001)(5660300002)(2906002)(7416002)(6916009)(6486002)(26005)(478600001)(66946007)(6512007)(36756003)(186003)(83380400001)(316002)(66556008)(54906003)(6506007)(2616005)(41300700001)(8676002)(4326008)(66476007)(8936002)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fwVJ4jTv+TXu8U1EqMVBj0y2uWB/yxWsbAGlWtl/CBsZysqmijLFL0u7gBrP?=
 =?us-ascii?Q?z0KkrYiRiLiJCPjQldbA6/DRDnB2uJnDPFQn5V86cjqgPX4MINPeC/TrG0m+?=
 =?us-ascii?Q?jQJgfdhKiIbj34jKAWwK5Bc3tUADMwPShbRhq+Y86g2QTHLvoDBbxRjL/ygq?=
 =?us-ascii?Q?XlNyFUSUpHJ0Gjq+aT1YqS5TS1sES1rmJhwvgpjwxtUmIDWDND/87tijEbCw?=
 =?us-ascii?Q?VQQkBjl6IZjzNg/EfTm661kQjpwQAYDEjGkBbh+vA+swU6bGm3XcczWPlBHf?=
 =?us-ascii?Q?fbSfYB0dfmCDpJ6si+WX3LDvWGQSr3oQ2QvcO4zai6LHiimGIonx3bMlPyi0?=
 =?us-ascii?Q?j1gHr+PFLZJRhTuc7pJe/izR1AValIcVUw5bMCoLgOFCYTSrtXbnkrrpwEs/?=
 =?us-ascii?Q?lIBsNtTAe4GDNOs/K2r2d6CS68AaEcQmdYImlQky+SRy/hVEuUfXk8uPxPsJ?=
 =?us-ascii?Q?FttII3DGXyvgqX9/ht6uixVLKxAiz9aHHKLvegfKiDhC1U0n+17ZQUKz9TSW?=
 =?us-ascii?Q?O/GIfWAL/GhBhn+A6/y6aX8bmdsw3VqHGwbrExcHATrKvY3JrrADL5HWxxxj?=
 =?us-ascii?Q?5/l6zvd9LdwKnKKTlJ8A9OJfYpi/vttkWAwEo0xqyydzX29sByM04pouScAc?=
 =?us-ascii?Q?o68eOjqRYLvwrAhPjJbq02Taglo0CeUanvxeaJzW6vP5n32GyqtVQGBZu3Oc?=
 =?us-ascii?Q?vxpnx31k5NOth/HNmZ+cke2RprcXSmgytgoztu96QoKUUewsslMB3lBWn8JA?=
 =?us-ascii?Q?A5HgLD3gWa5HvhmQW98k4hN1ktddVQIsQonUI3ZT8auM0bxkNb6BDm80eP3O?=
 =?us-ascii?Q?XKFmlNaOI65duFhgBrOBYm5w3myjh9/xhbtnLyv+AdVdSgX8sAwHvtsmDhCq?=
 =?us-ascii?Q?fPLTbaVCqu+mozgJ8DD1FmoQLkogpZAc+r6eclXwT6a1uSvgX2m7BRb0P2V4?=
 =?us-ascii?Q?6CqOJrnurSdM36wLu3Ezgf4DzJ+y9ERQgCQtgqEQRj1Ct3SJEDcsCu/KnDVA?=
 =?us-ascii?Q?AqGKziA0AUHWarO/ZmhDS8vJf+lJxgBG/Mlp8Tyrvfxhx6EvXHPdpNo7aKQ3?=
 =?us-ascii?Q?e9TVZ67YsYXyO12JMHmi5vk+V5joA5YMJFvudYFdVwwYPuQqDochORUfxDZe?=
 =?us-ascii?Q?jMBiVOcZfBoU/xLKjbqtp5k0JwB7TLlDa3P8sHrJ/IaqlbrFWtUv5zaWUUT/?=
 =?us-ascii?Q?CUvRKWMs882vLmqDEiiKVEVAQCB1R6IGVINLG9Hbzhj33d7cpAHSKclIVSvy?=
 =?us-ascii?Q?0P9frYDbaz7g2SjunN+3sxm31Z4H2S0wLf/f/rjnZkHCM4RinbfQcKvJ/0B9?=
 =?us-ascii?Q?FQtCwFCdEw+fmqwjCWpCQeGpONMLSwOQP8WCF70fPncsERs5dISUzT2AWqfb?=
 =?us-ascii?Q?a35RseURkW7aqn+WCQJSL2skUl7nvXBN8sE8itrJhVpTs8iBEfUnABxgJ3lj?=
 =?us-ascii?Q?RjBixJdFVc1YYKVK6spacyMyb+UyXaDDX53n41J3ckScRMkjus9y6hHlNr/C?=
 =?us-ascii?Q?jcRcLUoQfdbzH+2u7hhQMgFLE91HIRo1ZurrjwMUVWt5dQ5kbTvpM+wroxiW?=
 =?us-ascii?Q?3gfRRl0y20kGMgoX0XQU1LwmzhsegrxLwuZSfj+L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a65e387-5cdd-47a5-3bda-08db15e05b3b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:55:55.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4isALDqtWzdqQP34gtCUidl8vh/3agbpqmecS2GZjmhdWhNgdZYKwj4jHuQRfms
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::60b;
 envelope-from=jgg@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
> > #2 is the presumption that the guest is using an identity map.
> 
> This is a dangerous assumption.
> 
> > > I'd think the only viable fallback if the vIOMMU doesn't report its max
> > > IOVA is the full 64-bit address space, otherwise it seems like we need
> > > to add a migration blocker.  
> > 
> > This is basically saying vIOMMU doesn't work with migration, and we've
> > heard that this isn't OK. There are cases where vIOMMU is on but the
> > guest always uses identity maps. eg for virtual interrupt remapping.
> 
> Yes, the vIOMMU can be automatically added to a VM when we exceed 255
> vCPUs, but I don't see how we can therefore deduce anything about the
> usage mode of the vIOMMU.  

We just loose optimizations. Any mappings that are established outside
the dirty tracking range are permanently dirty. So at worst the guest
can block migration by establishing bad mappings. It is not exactly
production quality but it is still useful for a closed environment
with known guest configurations.

> nested assignment, ie. userspace drivers running within the guest,
> where making assumptions about the IOVA extents of the userspace driver
> seems dangerous.
>
> Let's backup though, if a device doesn't support the full address width
> of the platform, it's the responsibility of the device driver to
> implement a DMA mask such that the device is never asked to DMA outside
> of its address space support.  Therefore how could a device ever dirty
> pages outside of its own limitations?

The device always supports the full address space. We can't enforce
any kind of limit on the VM

It just can't dirty track it all.

> Isn't it reasonable to require that a device support dirty tracking for
> the entire extent if its DMA address width in order to support this
> feature?

No, 2**64 is too big a number to be reasonable.

Ideally we'd work it the other way and tell the vIOMMU that the vHW
only supports a limited number of address bits for the translation, eg
through the ACPI tables. Then the dirty tracking could safely cover
the larger of all system memory or the limited IOVA address space.

Or even better figure out how to get interrupt remapping without IOMMU
support :\

Jason

