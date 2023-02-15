Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4226D6985C7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:43:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOce-00016R-RR; Wed, 15 Feb 2023 15:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pSOcc-00013E-Rl
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:43:22 -0500
Received: from mail-bn8nam12on2058.outbound.protection.outlook.com
 ([40.107.237.58] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pSOca-00040q-U4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:43:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HurgEL3eB1W+W+hecuz4L5aIGQGItenztJ6+lL6aWN751/slj4RkeE3MfgDpyUpzKdJm2BnjOXmvyEgzMwOzzjrXSg6bJZaQv+hG+cVFDtb2X29fxaTgVH8gfeQzGgTtJB9MJydo60EjnGPycT3DJTSLUKbpgikJSXaknd4CXiy+LvX/MSqKLCBdRhFz4m20yvYNOuBr3+kscFKZBd9aMXi350/svtMOHw+EUT1xXaaV/tJ7Fe2ydKyMEen/4iv5GrWC/CaLYmySrE+G14/RalxZ0M0tU49VzBs2AntLT8kGwn5ov628871Q9Km8dRkc4hpGwad+3ei5Jp3fCXlfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLSDsZldCUGVz6TDkYO0oK6GeCmw7gJU4RBZlW15qDw=;
 b=axpY28TUD7PUGJueCH2jhORgHA2P+//r9peWuLdXObJn5k4QIm12P575yaUu2AAw1ZO5ssWsMX4fPMVx6OkC6gWL/J2sLD80Cq7aEotmVGjLmbC4FqNxc+7uL4qYoxwLhW2tBqYjRa7uW2rdYW+vKjDpu93egjxJImZPY1Dzb++rx8MDxitWJR/QVsdkGcSs3U9k15Z77oyqyDezCP5PLTZRRnkLJUhR5aNOOjCtG6qgG4k4VibyqGOd7nSZeip3V2XyVhCdtJt9ekUjclMP3CKmTzPsLCSFs4+L3nV9PsEUlxky9XLnqScAm9mvRYe6Zf7vbbBm8INJf+TAcaZYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLSDsZldCUGVz6TDkYO0oK6GeCmw7gJU4RBZlW15qDw=;
 b=Q8QwIXmIBTWC723PDan9zecZD96uuJewVoWdh12BTf8+iJ/GhlgPUouKckp4Uhdbt6hGOwnQhbvbcrYg8jzkMBz/qehN6aN0bgZPvOlztmoC/z8mcov4DxCkl4ymySRjlh7POYqGvv1XqxZnIsTnzaYaiTy4xFGLPomRFWaR4Pu/O0qDPQpG1KrNd2fSLch/ewsArxk1vnCdEQJlIFUtgFwimWHl04pVqirhsx6a8cugrbKE7kA3VGARtw7Yll2H2tvIJxbAS2osxxPi+iNfrZdHPJl0dfU+wEzHoLTVebf1EcHONw8gy2rYfrhWGa/qdJJJTRZsn+2IIA3fJ40gfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Wed, 15 Feb
 2023 20:38:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 20:38:13 +0000
Date: Wed, 15 Feb 2023 16:38:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Message-ID: <Y+1CsmyjkUIOCrvs@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-4-avihaih@nvidia.com>
 <8735773xr7.fsf@secure.mitica>
 <2efede77-0b06-0efa-1ea2-86300307c86f@nvidia.com>
 <87sff6ztxq.fsf@secure.mitica>
 <20230215131435.3e14aa55.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215131435.3e14aa55.alex.williamson@redhat.com>
X-ClientProxiedBy: PH0PR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:510:e::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb93587-58d3-474e-bd0d-08db0f948ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9VvIeVIS4u/HfyKjS8QGT/1JZaYShi5ZaLBfC0/qeIFJIBZlZ0Gq25WWCunLdVncqXquAkJSUXyH6amjeZFXpwBRuyOTzDpepDImyTwV2AeILodN1gTABAuObgrjKsToWoeRT+Aewu8lEukJv6DuwUUJX//TJAZ8HK/7PKIPy6MnDZo/bw70312xp3vkScSVSgNGnpUBc1UbCqo1TiMdIn+UePsirjGfsaNAWL8VL4QyKEjHYuqlDyP9Qr1jSKJwhG/85b6ae6RLbkytAQjiJcbzpp4J66FmsmWuHRY7KTM5IYTZggroLenc+WLBPOAQ0/82LpUsj+lRrixk/ijDc2IFxhmG2P9xYKl4qjNLKfX7VCmf8f1V5/r19g3vVaghEDxZHQts+liDCLa4RbSPYiXXu7GcmSor1FPCu6d4aZ6vTYn/Hkj18C/iLglS/El5QYxiUTwhlD0gjyM4iwjcdLuMIPMLAQpV6q2n7xIdiplEDnf1KD/ax7yd2hJfQ26JYsuJ2RlRfoqJvUYwg3M7T70UWIfpuIbbHSuwH6svku/9awnz5YDHX00TrK07mSXddQReXXo3epnpqj0bB4G6vqzRfwCuzAxpEpqdHHcE7hE8ICC4wmpYeky+HqnPZ5qmanpowHJB50XhBWHJmXAoLGU/mBHLe44vDr2XJgwk3iY3rBgV3wmGESQ+NxOB42aPlYlsWQ9VQbXCaYNADr/L5/YRtR70KFJdxwsZVy+mgw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(2616005)(38100700002)(6512007)(6506007)(54906003)(26005)(186003)(41300700001)(4744005)(66946007)(66476007)(5660300002)(2906002)(36756003)(6916009)(8936002)(4326008)(83380400001)(66556008)(8676002)(6486002)(478600001)(316002)(7416002)(86362001)(14143004)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+etLDOTSmSoAXuhSuPYBvyu+IfKbyKxgAWRv6ZE/8Tqz8I/3OAMPyld3XCOk?=
 =?us-ascii?Q?l4LShYpa3UFzIEzoXxTeGFryqO/MuLn/Wy1xcO4v8ZPx90oX+fjVk2CCBWZ6?=
 =?us-ascii?Q?p/BuDGRC5qBGq8ghEZjs88O4C+UeTFy7wPg+T2LQttKTrKz98OyiyESOVvIZ?=
 =?us-ascii?Q?hKNAfFhyrcTrwH2OPgtGCrhP8fBOMZsEPTIUqaafiCNgxBnwsz5EVM4fKODY?=
 =?us-ascii?Q?hDa2l4ffAYd59V6zxm1DJlqSZT/j9ZcqWYnUOZ4cl0URIaiXxLXAfqnloAuA?=
 =?us-ascii?Q?BTEJ19iM76Jym2I8sDQWYygbckGs1D4vHSwFZ41cbPW9v4j35PVUWQbqcg/e?=
 =?us-ascii?Q?6DfFdeBftjCMpnYMRPFapVIhP1a6bkD3tarNyjGtPvNe28w7MiACvUR5Z/Na?=
 =?us-ascii?Q?WEXhTBFSfiwMQq2l7lX5wRlu82hak4VE5KyEzRN9kbMOioQ1sS9xDhJOcaH+?=
 =?us-ascii?Q?0bqR1xutA5y1+duwozZAmDXydL3P2R3gc3HjYK7Y/6XwQaB28nlsZT+MnJJu?=
 =?us-ascii?Q?AT6EJWleqYgVK0ajQXRQcU2AhbkSq4FaiopjBd/Zi7jg7BV3f+OZ6M10x6Pq?=
 =?us-ascii?Q?kVraimLK2QQ+vzrI4KkcUIBj/Jp41c7RKihtGCAQdw+sIzO2cdxKajgqQhBY?=
 =?us-ascii?Q?dlK7FYv/rz6oB6U3adjzU1XqdWjoo5cCk80PfyA0FGPQHHj5k9l1X9cH4ei0?=
 =?us-ascii?Q?3uyOmQZUoEm5fK7a2T9z2hfujg1CFnYer4Ds3AJ0B9G2zI04B26C2PNEYUR+?=
 =?us-ascii?Q?XavOshjGh1WqG84H91bG+GUwDI9eZcBA7lwaMUEvEMdlqti8FMfaJDkEn4mC?=
 =?us-ascii?Q?DtEHR7alkOXDC+kKuvolAr1pAaBvDi01fR9slD8K2XTCY0HcsFzgCeTzfbfI?=
 =?us-ascii?Q?lrujVNuz74FpL1Wd/DA7VcNpdpnXNcN9duUpypw0rdlstEKCcebIAnxHYIls?=
 =?us-ascii?Q?qjrvoDzG+UGR35Awl9IjP+MKCdwVdDMI5od2XyjiVczDIzWg+RFV+/XRcP5V?=
 =?us-ascii?Q?4i0CTiVJKLavvffu+G8NVJAHWLEF8VVpTzEgML343ivNAfcwwmwogZenCRav?=
 =?us-ascii?Q?soSPf7Bp4pxW75NJcScAL8Gyc3pvrBpFflz5WFQ9BZeggjf6258eoyLtE1az?=
 =?us-ascii?Q?2hIi7u/3V/858UvECDycuK0iSCeap3hEu1gSpHS2YOGvKCAn0rhSI3Z3SMHF?=
 =?us-ascii?Q?HsDSOfaqve8bPCR7r7vdkbasGk6EQkWDgoSMFWgFYt5MicFaN2msLfI3dO2y?=
 =?us-ascii?Q?Urkxuw98x++lQMvQ4XJ/JM8tuQ47xERY5epbcGatsscuSiO/lRmNHXCo3Ujp?=
 =?us-ascii?Q?O9Ve7t/vxOlDUYoKHIoPRiSV6od9Sr+gDHdF4Ybq+YnbkhvPU3GAojGAaiDD?=
 =?us-ascii?Q?7GddsPE3vA3gNFHcwx9Ut0aR808mTDsXUvnb3OJTOsrOLOyGMQipKGmMnFaJ?=
 =?us-ascii?Q?l8Z92NBi5oP7T2sVFBLhmlwAZ0Ak9WzJKqY/KD+x5r0L+3tfefo5oOdFLeHQ?=
 =?us-ascii?Q?cx+IoNs+SQSyIHwZKH1tCeCG/KdqKJ3Z3mlLBUwEp4GrgHkJrIf0s8vwyd6l?=
 =?us-ascii?Q?rodsOLy3EdSKKZOs5hRR7MJuHc/MZE28uwwFIwnU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb93587-58d3-474e-bd0d-08db0f948ebf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 20:38:12.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMqfqGOw4d2DR6t4o3IuurbIsgVLY4HYpjwk5FDloMWuWlT98gREP+NoQ88b6IEN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149
Received-SPF: softfail client-ip=40.107.237.58; envelope-from=jgg@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Wed, Feb 15, 2023 at 01:14:35PM -0700, Alex Williamson wrote:

> We'll need to consider whether we want to keep "dumb" dirty tracking,
> or even any form of dirty tracking in the type1 uAPI, under an
> experimental opt-in.  Thanks,

I was expecting we'd delete the kernel code for type 1 dirty tracking
once the v2 parts are merged to qemu since we don't and won't have any
kernel implementation of it..

The big point of this to allow qmeu to continue on with a future
kernel that no longer reports it supports this.

Jason

