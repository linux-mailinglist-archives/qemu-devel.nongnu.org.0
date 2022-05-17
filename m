Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B152A98C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:46:21 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1Gx-0003jJ-FJ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nr1B8-00080A-WD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:40:15 -0400
Received: from mail-bn1nam07on20609.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::609]:51428
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nr1B3-0005jq-OM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:40:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlRAe9Dez6RbWnBMpczedzIm63KpPHquoXbQTnu8fYzmvbGb28E6hK4FckIv3CknimYVCpnPJZR5gbSJSnWVcIow4d7e3HCY4ZgGFSshdGYLGIVYyNXcB/BImPZYwAvk8W+t7p4HdZXJP7Drffjhi7qmZKVnDnZkACgf1ZnLkoJMojQAF0jjH5ASJzCUFuLRHyAi9Tl+676I0uw59reRaa/Mr4KdYlYbQpNNxdEAq5pcS/kVlOH0e9uTFiELh6VXitd+stswmgNs08ifEtmNVsnWL6r5J7ej3zfkpIU80AVfp8PyQbyKPgWE3/Rj2F9SgTW4GcgmKgQeUuIzyXJm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQICXBMNiB62atH9A0Tmb1e3IMqHwch1dCMauki97Rc=;
 b=QtqP3Mv7wMAvirz6+H9WN7Y5TnBTNKb6h8SCRAcsZ1xpypBCxtT/LNlNKS2hXT3w2Z34y1nKheIchU4cWCw4z+xrNYND+u58nJfRwf/e0xPzajjOsXR1PiBV5pLVJJ9CnFmv0hnJjaf6NpDwplN7cphcv64ImuKoSVDJj4Aa8LduRzNOVIGytzf1P3RXX+FQUsIXIvqzjluhI7rxAtr4UT/09A0DUB4Gp+s5mYEdHSv9C6eOlqiVWbCVz3pVKNFCHp4Ae4D3RhBlcWgAzjiwbzAytBOKwAC7JCoeucolz5wKXO9M5eb7TEzDBiYePNlHmuiujUj3vkw4xCwqJPsvqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQICXBMNiB62atH9A0Tmb1e3IMqHwch1dCMauki97Rc=;
 b=aBs3Ze0vKYGU9KfdsubTFoRPJWzlvOH1PPD7QEB7QROSdPmysTVRYBnCwEoPMm30t7SNpamHeY7bK7vGHnopY0k75qgzwrbVcmfgXSF4VNSfIiXa/V5TWiOee6jiJV3vdWTnuDMqrUY3KxI8Vsi2yJt8s/2gQchKnrSTNlS9pOAog4Qv8du/twiXdGjsoZuYeM2gZCDlSaQECl0yTo2hKhU/Tl1hT7KSdi+IfzwDlwtpgR4G1ihDYk4JMS91/LivfSBjA82GqlLc3ErhkF8tawOQm5mrAE5K0yZCJrhWotZ1LIMtzpk/cIP7Ffx+qDgeTUUz3MkGk146j/UqXd7g/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by MN2PR12MB3183.namprd12.prod.outlook.com (2603:10b6:208:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Tue, 17 May
 2022 17:39:39 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::182c:a653:21b2:b351]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::182c:a653:21b2:b351%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 17:39:39 +0000
Date: Tue, 17 May 2022 14:39:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Message-ID: <20220517173937.GW1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com>
 <20220517112232.7a9f8be9.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517112232.7a9f8be9.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:208:134::35) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977a2c2f-3768-4d6c-a2b7-08da382c37b3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3183:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB31837447EE99067D295FE98BC2CE9@MN2PR12MB3183.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KTp9BosM+2XNE0HAoL/rm8x95KIMdFTdU2ivY36R/Wcj/drz9Kd1cT8WEaHw/tms7poJYX45woAjyJlysvmv+qrL3GhGXOzNIqgnpNQyZAzlniBUHXKxTb+a23HSf6JNyYpJIIkGQcmh1IuifBSNDljOF1ddw5lnuzlZKZW2tVsr/jgOgVN68ynUynMAbvtgRg68JkY1+GOP7jeeKciWKLay1L6xwFSBdfaWKC01wbuCzOQZR8AANyf+2UDd9wImkuKsqppRYR8VicypAsKMVDl/oMosbSTSXbsvqlm4yRcyUIpLp0LdBIEs9U6+W+VgjwZA/mlzoWIqmbk2mhnJ1a0bh/iUmMiL5f/dLMpkiAxhpaqmo88D7C+7UFd2VsQ+UTB6awPgeBNZEwO6rSW4XNP6bWB25HpvSAHw8LMVLZbds0DUhRE3lVNI6/X+dTKyVri/6QCEpajL2EALFJzx0yfFmkBu8xqORj2+fspB+KOYpMS5fMopvIFE4Q7AbG6GCUBCCPRC8niTeh2y2aG4vYjFPTjOR9sdVhABevFhoNNZMbp/pBpXmXC4deUGqr0mPPEBLehzCBrecFXlSpQCq4FrcM0gQwnmWIYldu+CTYTY4efq9cvOeLI6/4FkMMPMSV+LB+b3UVTFlF4sVSrlMhSPS7e13FJsRmo/bXwQ8NGVz61/eWcVSXw6CwDdKQjjL4Oq9X5vmqBAIO+/wwZ2Ln1F6D0maZeKTqkmd2dcJqJE+46Wmkq50+bS5P4e9Dy26AMjkhhicv3VQn6n1ShQgdS7lDzGPkaZrOeQhSoD+X8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6506007)(186003)(1076003)(38100700002)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(966005)(2906002)(33656002)(66946007)(66476007)(8676002)(4326008)(66556008)(2616005)(8936002)(5660300002)(107886003)(83380400001)(316002)(86362001)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NZOSf/W4kscYvQTV/AIIWGpoe/DCeG9/3RTd+Fxv+lrj4tEt1rCwQOaIyy9Q?=
 =?us-ascii?Q?+WlRKmWQ1zN7bEiVfCkvNF8dr7xImut711gG7Qgt0HaAG+SX2TlGJZE1gb0z?=
 =?us-ascii?Q?/mQunj8Ig2I9ZN7DQupspu3m8tuyySDuMMQ53+27IIQdVJzou9Vg3GbVOcpK?=
 =?us-ascii?Q?7MFyfaDPfzPbD7gPaTr6ZgDDjAnUbdSlLy3E2OTc3UNGPmJFpp0faLCNuRca?=
 =?us-ascii?Q?19oVn5bVwtCkKR0H6L/CNkFBi5bPvQBlyotWlnEGkpFZf9Kamuj2XXtBRFrn?=
 =?us-ascii?Q?MlM3JymWOkVzjJ2pic832fLktLOKVaNDuJ7EuLaufBCFqM2arNqSic3Xl4ql?=
 =?us-ascii?Q?+gIPIBDo1YEG8LcUUIfjAObFOQ87fujpgbdffkl7rmSG+4P7E9N4ummAO1g0?=
 =?us-ascii?Q?Y6vAZBf1p6Uvj7X4R7rxRbl4u8KLS+blKjXbc4ztmswVA3UJMy3BqRs3QqBU?=
 =?us-ascii?Q?Dl7xTeXwMRUQCus9C4hoY/PFiUGN3vVhruSjl+hgqh09nGeufO5LpdLiEeYf?=
 =?us-ascii?Q?5tVLHE5G2q7xTEoKkYyUpMygU2fYEwyug8FP5P+tLgwpbemE4mGa8U94ZJa3?=
 =?us-ascii?Q?Z4oVGqzhBsEEbaNMibO4yVgQlxsnAsHJoOn80ykBoh7ZdWJOD+NE/ocNFdWc?=
 =?us-ascii?Q?JDFhyOqlBApjF/RQrPN5Ff82QRPEHuZB9ARLgPzlZmcD3NRVwRykrXJI3f9g?=
 =?us-ascii?Q?a73UncPibPA14ZzH8stE9ZIAbR03B2et9wGDOvgRhLfGqnSYykk/POagPjLW?=
 =?us-ascii?Q?ULkhusDOSITOVADA4LBI8Ngqe3OvehXygCf2AYAxOu/yjKVf0HyYb8a+N/VC?=
 =?us-ascii?Q?RiDWhEGRzpBwaf/cviwCuQzLlXazxclJAJliZHtxlTQ42YCHx3xS6cVaIo28?=
 =?us-ascii?Q?M6jBD/RqlpWx6Z43vOhv5ngwZSjHA68TN8eKy0PRco0SIn+6gZeQHoXvC6Zf?=
 =?us-ascii?Q?NRMvup58XIxiiew39smSjGuvP2vko+W8QyMJsoizuP2IVyBU8iEy4Fsu1RER?=
 =?us-ascii?Q?FUoHInMl6e/D49q17PVTxz6E1XIZCyekpRdTBUvtWD1phnOrzt9FN6b7Yv0m?=
 =?us-ascii?Q?7ULjH8OMVdq5Ey7UTrcPK+7198Ouj/dZ6EV/mvmPyXC+QfR4rWijL+PBAy45?=
 =?us-ascii?Q?geS7aC3C4FjmOCZcx+DqtkLC5JZ88+FGOC60UvtLfljV8fEkB16506obfZat?=
 =?us-ascii?Q?TY05r5w4DGbcwjctUBR5MPi82T3tgBW6LRhxAEK4G5Z8DZe3BdTxYhoEKISS?=
 =?us-ascii?Q?/Z1VDpJ3R2+dqi7jgsB9s59j1N52snS47M+OWLtvLK83rRtUI3UsJZOF9Ijt?=
 =?us-ascii?Q?YtoAk3paG4tdz+M+/lNB6qHY40uQGNuQhgdTVPVLzNO2wharvgoZNCjh6dMz?=
 =?us-ascii?Q?y3qSPQnWKRxGff3fCyUnbeRDNjAmKOsApHahShIohjJrpwkfqVZo0dQ0OBTw?=
 =?us-ascii?Q?4N4RGRTW98PKf/b09mXXXijeoZi54rB4gNnN94cAwfLQ1osKky4TSyuWiA7x?=
 =?us-ascii?Q?4r7gyR42dcjZdnDsshDa0iu4gML5opH8JlMHOXjetJCgq+NgGB+RFONlaB2d?=
 =?us-ascii?Q?O6+m2+V7PxHTOdfBr2Krj/hIbcpruDMg9K5HsCEtGSnrVfZIT0l/gvWbLaMp?=
 =?us-ascii?Q?bu6CwMe2Dr4PsW+7pi49pTsViDMOJu9z9OCe8b5IfbPRsxqA/Ys1TfG1M2n9?=
 =?us-ascii?Q?a7CtuimHIqgtyxcF+2ZP099w2Q1zO6YEs8XNcjgs6NEYqjkFBycaFV0LaTSC?=
 =?us-ascii?Q?DX4OprSZyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977a2c2f-3768-4d6c-a2b7-08da382c37b3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 17:39:39.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: at+WdPFQd6y9kXkaqgIOh7FINGZCh+lDzcRShg0xuOesnQyGfi54hqf9ONWeVDER
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3183
Received-SPF: softfail client-ip=2a01:111:f400:7eb2::609;
 envelope-from=jgg@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Tue, May 17, 2022 at 11:22:32AM -0600, Alex Williamson wrote:

> > > It seems like a better solution would be to expose to management
> > > tools that the VM contains a device that does not support the
> > > pre-copy phase so that downtime expectations can be adjusted.  
> > 
> > I don't expect this to be a real use case though..
> > 
> > Remember, you asked for this patch when you wanted qemu to have good
> > behavior when kernel support for legacy dirty tracking is removed
> > before we merge v2 support.
> 
> Is wanting good behavior a controversial point?  Did we define this as
> the desired good behavior?  Ref?  

As I said, this was intended as a NOP, which is what I thought we
agreed to. Missing the SLA checking that existed before seems like
something to fix in this patch. This is the discussion thread:

https://lore.kernel.org/kvm/20220324231159.GA11336@nvidia.com/

 "I guess I was assuming that enabling v2 migration in QEMU was dependent
  on the existing type1 dirty tracking because it's the only means we
  have to tell QEMU that all memory is perpetually dirty when we have a
  DMA device.  Is that not correct?"

The only point was to prepare qemu for kernel's that don't support the
legacy dirty tracking API but do have a v2 migration interface. IIRC
something undesired happens if you do that right now.

We could also just dirty all memory in qemu and keep it exactly the
same so every SLA detail works. Or completely block pre-copy based
flows.

It it not intended to be a useful configuration, this is just covering
off backwards compat issues - so I'm not keen to do a bunch of
management work to support it.

Thanks,
Jason

