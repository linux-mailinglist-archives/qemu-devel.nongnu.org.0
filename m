Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280106A0108
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 03:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV11E-0000a0-Oq; Wed, 22 Feb 2023 21:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pV11C-0000Zj-MW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:07:34 -0500
Received: from mail-bn7nam10on2064.outbound.protection.outlook.com
 ([40.107.92.64] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pV11A-0007jx-8E
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:07:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeImPpjMDGDPZx3LTGTxVROHKWShQXmNldmYh1PnsPYFvbYbN+oyjfYZuQk5s8oTXJltlbTQjGRTZsWa4jsL1skfYXfMNBBPEq23+PM4qlqiQLzygfXtDzF2bYdiLDpCC3kvuOypy2KS6yCofsEmcY4x/0+9gOn755dmvVSmLzbjsjyhItt3yj6Mo478lwv1JcJ8n+N3KmQJfWCtP909ZgOKTeSFaeurVjF6q4yNIqF23goobF/ZL+U4ilX1j2n7B64tCFj9RMRSOkgFFJhkQqyvxNF0ojPhVeUOLmZJInuBGDv6AWKYKs/oMwV+Ji7kQmYBjbz+tz8KsEERcneqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCdOEmPvKpSnwdwXK/ZVnCV3rUa/gMqVG70+mjis6GM=;
 b=Kop8d2YI0UxAv5JXL1pSRk2SBK+zgJNOTltuk7TIXE7TmOMBHBIFSGqYhDsFV55i3M9ALj/+jm2gSZM1PWVn+VtZMaFwQAmQ0QmTZO3eTaPbeiAapmmzqcxbPeGCkpTAP+s7RcqLMHw1L3fMwcILa7h+7IQ2gJBJW58487mMIK0z6EfHfPhDI1O1lLA5Gp8lR67PcsKlkgba/zPjmtdWN/v4f6hQrprsdUPNJOon5KIFJsekMdi/upFxC+74p+suFS8HXgDDqAdx8X+rRT33TIbhjrIbHAruOimlHYVRZ+BYbLFgrVem3xTXe3hIi3v8/MUd2i/SZyKhNzu8LO6dGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCdOEmPvKpSnwdwXK/ZVnCV3rUa/gMqVG70+mjis6GM=;
 b=DO3cP5K8o7xC+PsqYEFEmXFhKLdlF17Vdw1oYsMoqbaY/T++G9xEog2pj1kO9R0pnwDH8wpuSds+3srMoK+1rT9DRNphkxaOIuF8Lf5r5k90M5T4dHcKG8661+IHWqAtwHfKRO3/B07hbuUL8xohz6BGScRbndxGXmoTrFeYXLB1AMW87jqH7DoyNbZZSoSqVsUm7NVGFMPlejlXcU2KO6k38tYHa5xwKGAkAL9TQm3B7ZymsIE0MlhY7kKVHZ8asHZyYTXp/oBankekpWfYz08xcJIITZIV9KX8eSEs7q46haAHvre2bQINZj00THruvJchIZ7Lcu04brNKrG394g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 02:02:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6111.021; Thu, 23 Feb 2023
 02:02:26 +0000
Date: Wed, 22 Feb 2023 22:02:24 -0400
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
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Message-ID: <Y/bJMIR8stBcJpW7@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222154043.35644d31.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:208:239::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bb2540-fc69-40ca-bc85-08db15420292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JWQqaHqm+j3rHvPQ2HmSN/1N4ObrfmMUS1/lsbhkfwkNdip6xiFiS+SuuH0rB0RWkX4jM49SgUCsOJyc1wAOSfovUu8DrpNpMukVLGC6u/ib4vu4/p4oK37IOOYKAYij4nKu9pjIql3rWPGh4yVwKfyQOFCZU15gP9oEoy+4r9QLMobECBZAiYK3zpw7az/V+CCyKNzdNwZ9K4Mfvr9D/gfC4Es1MSit/tKjW73KzyevYzzK/q7u/+sq6r7OMIXN1AltFPD5mM0LIDTMwMWBSvZTWKgZ9pIsGGlk4sRYbBICqRdhbBM65x45QEhVzgRAiocUm7Ijv/y7ldq1WkoOlDjKRAoZIbavguroagqLkNVoFCtpaBlS9R/MPjxeT59ziEzl1ATqWZ9X6Hrz1MdkECCEuxtUNA8aLIDiaPkgSgrQQkZ0z4pRnvJTmVTyDjkez+pJtEHwHI3Xq/srVS3luTU/1gi5U4UwiJhuGXFo7vm46u7lAnj72l21Yq92sWylGvj/A1ZqiwAxuudxlzIDQ0nMNk53HrTHllEc0IY8em14Rp0m4cbXsXTfL1iSXzqQ4wuAQefRswUS0KnVp4R2eUEdRjY1YvaXDa3jTYS1SN2rI33Mi5aP6n0QEJ7wJiO8Ra9LvQ5UTnXwIrLyELRowlJHRcvJcHFRB53o4ABHsORDgj8ekoa9WRhQKP+WZuDT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199018)(36756003)(54906003)(83380400001)(316002)(8676002)(26005)(7416002)(6486002)(186003)(6512007)(2616005)(41300700001)(8936002)(86362001)(2906002)(6506007)(4326008)(5660300002)(478600001)(66556008)(66476007)(38100700002)(66946007)(6916009)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?56fTWYeGfyhg799/KdJ5K6CMO1SWjn0k8KCh/gJmWLbrayjhEzeMIfUeHk4q?=
 =?us-ascii?Q?QoZntd9gMgD7SJwStTI2BHQ30p/VbZ5KnS/1CHWbgYfpVOUEj3UmqidKCKAL?=
 =?us-ascii?Q?myfvvamtVGpvEGrm7RgpQMoRXZKaV7g86hUwjyqz7kbQ0Ki5/lcNrwoGc9Y0?=
 =?us-ascii?Q?kuzgb30iFtDuhy69IboD2CHpE91h53V5HQJgzXp8KNxF/4dk1wzgqpaAB36I?=
 =?us-ascii?Q?x0ndGMuoLiZpMEO0l659lMcyiWJyM0EkB+j4Our8CodNDI5iDWIT4zd5OPgz?=
 =?us-ascii?Q?3vlM9Zb8aZXTzMWRzUM2BnhamFkUwY2iZUog8dZX0Q1NTUiz2iGSSWcRtaau?=
 =?us-ascii?Q?oh+XYqfsYx8S4ClHHixcMvSmZAMqjsQh5aCmMqBMwCxnC00qzn/wwo8PqsBl?=
 =?us-ascii?Q?CwdYTgsUf30TZ3y7/upcNW7FyMC836Ui+tpT/eWzkeQdgbwoWucU4YxJ5FAX?=
 =?us-ascii?Q?GKs3aJQWSVQ74vnQRxo0DFn5WsrzqEvDHZA/UADp/MZ1mlm40OoV+CjjLTZ/?=
 =?us-ascii?Q?W+9Qi0vrCTLUjJ/h2GcRCi2Gq6DVYrG2DY9reQ2zSFSQs5qliCGVUC7+O7vp?=
 =?us-ascii?Q?/1lYwh51ce3QC/6jzlrHSJcUfnDynU/kWrvyW83DZoXFhaFq9g9rPtiSH3RE?=
 =?us-ascii?Q?JDUhhzmXGLj+yGwJRNAq610p61r5j386LiUQumXEOEzVM446iYwPX0YHdMIO?=
 =?us-ascii?Q?wEUsyXn/h4LVqeYavOxs3op7z6OZtvHCc3iMDRWDGtVRbc+wuyncexQgVHHE?=
 =?us-ascii?Q?zX1l900zNlIETR17IbDVQCIJVqcaafdNGFS+X1g6KIzaC/WmJ5TsQ6wWprRX?=
 =?us-ascii?Q?sGQer9HQg6PbirkK22J8yVifrOe5H54FFTunywWQSNs9i/Bew1eQEuuQE7ah?=
 =?us-ascii?Q?2+9xPGNxOl9FIyZV+gfLc9y4+onLVr/RjrJ/eKaJn+u5D1AqovtkO1a1uTR3?=
 =?us-ascii?Q?ge3ke4t7MNxZIWcGUgNfsgRCzGy9+EI11CAJ78SYASWYtbZbEyn5fxEHgfDh?=
 =?us-ascii?Q?CQYuVlhC6DfQyiC+alnIVjpWZdsHaFLmaT1I/ih2tU6awRKAluI5/d5Z6SRA?=
 =?us-ascii?Q?ky6amFRk+Qd1h+Hx3tUJWkuguNrTPj8l/xjlDXukiZTeypQuU7idRgLhwGdx?=
 =?us-ascii?Q?6NirWHFAWZ0sKSP/jIrUpFE2X0MRQUcYcgtFTSdj3fInXx4VqvSupUqpXk/e?=
 =?us-ascii?Q?50UcTpIgONF26IqenWE99E7XuGwzfdzEza7GGMkq0ikFsznf7ygAAyZwuWLQ?=
 =?us-ascii?Q?w2Wuw+W2+lWMJwdxsqGQOzMD6zu5BqWcF34BH2Og6y/P058F457ZlMy5VtTK?=
 =?us-ascii?Q?t2T5vueekw9jAr7vhpPdiO1D8YW88syP6o9BsAUZ7utSrlpmaY34r+ajJrsR?=
 =?us-ascii?Q?Nle5ESRX9iZPIEIb2+DSuZO+EVA1Feonp1fTpGBeaBUI4MrtvmGn79a6qfiD?=
 =?us-ascii?Q?CRY8Rnl8Z22zw7+n5PGWI14hBD/o8BJcXP7XcMWKqOOh5JWsNOVv8NEvrkR8?=
 =?us-ascii?Q?9dqSvbuGhaw9GxggzHq6VaGqIOzer4CgwcYlPs9FmPfCRAXYK48YgXnsw4T/?=
 =?us-ascii?Q?sjPMpCJ3L5RoNYKIAHMW2EXfDHnfTI9lN2o7qQdx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bb2540-fc69-40ca-bc85-08db15420292
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 02:02:25.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxSvVYn83uHATAhjG93xAr8Oa/Q01kKhfACy14VavuDpjcbCqi2xrZaXwknl46E3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
Received-SPF: softfail client-ip=40.107.92.64; envelope-from=jgg@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Wed, Feb 22, 2023 at 03:40:43PM -0700, Alex Williamson wrote:
> > +    /*
> > +     * DMA logging uAPI guarantees to support at least num_ranges that fits into
> > +     * a single host kernel page. To be on the safe side, use this as a limit
> > +     * from which to merge to a single range.
> > +     */
> > +    max_ranges = qemu_real_host_page_size() / sizeof(*ranges);
> > +    cur_ranges = iova_tree_nnodes(container->mappings);
> > +    control->num_ranges = (cur_ranges <= max_ranges) ? cur_ranges : 1;
> 
> This makes me suspicious that we're implementing to the characteristics
> of a specific device rather than strictly to the vfio migration API.
> Are we just trying to avoid the error handling to support the try and
> fall back to a single range behavior?

This was what we agreed to when making the kernel patches. Userspace
is restricted to send one page of range list to the kernel, and the
kernel will always adjust that to whatever smaller list the device needs.

We added this limit only because we don't want to have a way for
userspace to consume a lot of kernel memory.

See LOG_MAX_RANGES in vfio_main.c

If qemu is viommu mode and it has a huge number of ranges then it must
cut it down before passing things to the kernel.

Jason

