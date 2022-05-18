Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0F52BFDA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 19:03:16 +0200 (CEST)
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrN4t-0000lF-HH
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 13:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrN3T-0008Tt-Py
 for qemu-devel@nongnu.org; Wed, 18 May 2022 13:01:47 -0400
Received: from mail-dm6nam12on20602.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::602]:2657
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrN3N-0002io-B3
 for qemu-devel@nongnu.org; Wed, 18 May 2022 13:01:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUv4FG2tDRQgxh31CY7/vvpJwyXOZi3sDuE+fT50Wey0e8MG9NcT/yDRFT79TKzIdLpHNCaqlfebGzKKJ/mwDW9bNRgQ6LMvdxTSwm4CwfAXI2r9vwtXmxtVMjcqiiq+ULiDmLvz8YSvF/61BC5NQ559+izQ48owdZIugYkMvARD6tgNDf9e30vX026B7UPN6/w0IlougGjxiKfwTEMXSpm1hGnY9Ads0OQRntrsmmIievNPtbaeXWjZYaFrvoDZg/ymDdTugCfDD8NTrPr1VoPTxHS0ShBtFFJ2xM8uhTSZei3Ku6Z/gSfqTRXc8aUpHEvEGLcMvSBkfZLo+vWhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg/rnZjxhpca5cDapvmFSnJxWFgY51OVxeMpmPg3Qi8=;
 b=bp3ybm1hRgj5xpGWYPGhrL9eGq8ElXnNQJx+IFIqNxelHlaftrEghon11s1LCANnc5WLDTW5HwdgJEICS/gKZKkfWC8cdSlZiLpBlAYd9NcwiQNJPM26sPehJ6A9NxbGK19u04PLL888ieIKVM3t/q4Xc+tPg28SaNC19oOBkXUX/MksqfGsCAvmDTtxnZ+mrQSmOz9V56Bwb5dVg0uKB3T8kXW4aVJz9PaVZePmcZxkMv0sVXgDI0xhG1rvbu8Nm+/GSP+ECDjYpjmh0clzu+y5rqQDgguvQy7AhJGVW6MmuMyK8XQutqOTkCXilJEf1IGFxUQhMRnz5uAEBatF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg/rnZjxhpca5cDapvmFSnJxWFgY51OVxeMpmPg3Qi8=;
 b=e/P/EUlMTX81TnJc9nHTLylJTotY7w2O+gLzq7GdnUcVYw/GkLONVj7vUl1XzS/rVnR+ooF9NoxikFGWwf3BmtpnTqjbvUfvKDHI94CNq2Fmg05vaGnZxnMRC80EHEqK0EQ8PmBrtNx7UI4e+GFIMZtzlwYzjzB0tGGgHOCErwB92wBIUuQI+aDcukTVJ/Z9J42HpYy5lRn/+GkswPdzbfZ+8TECsNRtHvy6gCRWn2TdaKMOHYnp5R32SkgqK0lSXYUdq9XhAlEhsb7ANcXfYFbHOpzOIrY0AI0qR1BZsafvu1JD5OIQCcaQ9UogO8T3Jx/IaPwcX2HxLZxKTS0lsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 17:01:37 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 17:01:37 +0000
Date: Wed, 18 May 2022 14:01:36 -0300
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
Message-ID: <20220518170136.GS1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com>
 <20220517112232.7a9f8be9.alex.williamson@redhat.com>
 <20220517173937.GW1343366@nvidia.com>
 <20220517214656.62fc10f4.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517214656.62fc10f4.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:208:256::11) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 800e15f0-9e23-484f-0357-08da38f011e8
X-MS-TrafficTypeDiagnostic: IA1PR12MB6209:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB6209AD3A0D552A438CED83E3C2D19@IA1PR12MB6209.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzwWUELN1mdFqZya0HyoonwRY1imO9dvEOpk2kC37IAm08xJFLS08OgAiIui210As4S3juW/YxVOdXwgxxKbaqNx55rVrB+wtiPLNjFoI1ei4jyZ+jos82EL77ei8UQoOlax/ATjSC1cm4ZPRDdGGKHLwXYDeZ2HJxemb/7pW7wtn1wCfz+8ATxA86Te2w2mnhYoqPTuD2VO+rTkuZlXp6o98Ag4mPKW1bmSnEDcnNpVTkjVx+tcwftV+g+QMOZKblSEK7Wdnj22mkrBiMu9rf9ivriRc4V/5H8V/CrtbX/+DGm90/mnu0McCcXuwr219bBGCmdSAy3JK9MlAadWBwqBDC3tg29Y+R5JrRK3/BBsPZJ28AWgpAJ9Cy+3G3IKrvLv5vHpvgU7agOMGLwMH9zzrH41vNYA1a5OqsJMBiwNXbmG7qG6JjkdDr8s7vYM8mPJAfTlRn+P3i8vA8Ted4leeFKGVaVomzqHV8uZJbe8bIEilt7oxLTcF1gw+EVbKnIAmcQEXKQYLAMn3pksooEJfl/Y9YvvVaoylLX2NkWp6O2b13mbr3EDnA3NsSwyCe/icTKy4RwpSokFfIPIHYWbMGQQfL0BGE/obtTtjYbLVDPxcA0cctOO7U0P9fGvvKKMcTn+4oOtojBFt+dfzeoJH6tmXTE4yvTU5pBds0p4hiKAiCXFyuvS3yiJoBumTl0vAeZskmCQOejB986tkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(316002)(33656002)(6512007)(2906002)(54906003)(66946007)(8676002)(4326008)(66556008)(66476007)(1076003)(38100700002)(83380400001)(2616005)(86362001)(186003)(5660300002)(8936002)(36756003)(107886003)(6916009)(6506007)(508600001)(6486002)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWohuhjUMqQYToAEA0kI5CRW9T1xDncAd1gXFxjAh7aYSYCPdfpHvM8d/A9W?=
 =?us-ascii?Q?lJvAQIUVXoAXlkkOEbkF9YLjuDlbFFUUHXQE5WoJEYqsybqi7DgYHKWiD+mT?=
 =?us-ascii?Q?x5RWujYmYB5al7g4nx/RYDTwQ2xzdKfhXTc1ApLvFZ4cYbd71T0Rq/yaEo1B?=
 =?us-ascii?Q?Yyfl3Un7skZ8W4+VzEOOC8Wa0mcUxJCPDwB+y5+Y44/hLliBFNKCSFTy2LlQ?=
 =?us-ascii?Q?2BZHSC7db8DHw/FwzFkJd+UsA35SelE7kkrtLp+cExmjtcc4Bm1y0rLM1p7c?=
 =?us-ascii?Q?o23GPUja56Unehk8wNCQQLeuc+wNc9ZeARaY5TUSkvQWHP59FtH0kRROKnqd?=
 =?us-ascii?Q?Y+54tOHSk3ukOUvAFY1vlaPPuU7aCDEigRMVeY2+Z5sCUdousygIvzxJZxqG?=
 =?us-ascii?Q?GYqTiuJwVfcbgqHn8GLp+NgQ3Pp/uEduK+wQrgrT9QsgBD93B8yQCkU0H2tX?=
 =?us-ascii?Q?GcDv6eI5cX+kdT8EG/ovbWNLJJVvS9NvbfyW2tgZUgaFIrckhTuoCyX/9WVD?=
 =?us-ascii?Q?dnmZgyCmEKB5Er8g593UjLhowK6Q28ITOwYXrx2tLDVmlPD/DB/EuXOMy0CW?=
 =?us-ascii?Q?/CZVaCPeXfcvPTIQX8OV5fVn4cIzrCp5o2ebLzrjIckdtu7xvvirU56/9sEV?=
 =?us-ascii?Q?IRJqDOPmVmHoPHVkFLOLk0Tiltg/bGiXc+BUEnVemJPe+yLDGVPLDExr1CrU?=
 =?us-ascii?Q?5/ToR8x/xo9A5jKMSn/PCgCELLZRYoyPKMtAJhQH4ujVhl90Ne+6wEx/+flX?=
 =?us-ascii?Q?E3c5aS0UqtIv/sMraKkSeoatVFEc6YvyW7ZNalK/gZRsTyeMsZCmKMn1Rr0+?=
 =?us-ascii?Q?Gh2TJAxHH7mTKanLXBUfC6djkc/SsWqR+0mGonckOq8POZnMIbAxmgqC77t6?=
 =?us-ascii?Q?LootE9p42r6s39G0Zp4PdKlx6GF/Fmz1NSHkC2AUGOLdScYG8JnOb/nGGiKH?=
 =?us-ascii?Q?/dxINEWn81eSTb2mJcr/wnLjn2I4NyZHCbki4MiQUIjnzMkdxGmNh06XLJnh?=
 =?us-ascii?Q?vJ0w9dr89mGqMfyxK1lGyUD01v1NV5JyQIOvWRMGP0Xwu1UCOu6aqn67jj6l?=
 =?us-ascii?Q?nBB9S5r1tvs+egGzAt7C3Ej8Kjagpvca8Xh5Hm2Ez5KhGJDs5WGOU/RDTFT+?=
 =?us-ascii?Q?bLvX1RLdiVdfLfk9OlANIhmZllhjK58agLxwylgyENYY845F47ZhYih+xMsy?=
 =?us-ascii?Q?GDM3QdzNLP3sqnZWvNh3XMQ3wUX490d/jJQpu8lSR8uvwWIVpGxmq1CF8uRW?=
 =?us-ascii?Q?JBezPqqLb2rYwrNRGFHEc3u30TzIiVuJKZeMuhZCQjFpbRDk4s17cBZPOuEe?=
 =?us-ascii?Q?jm2yvWey7etTzrTc5JZpbywUip6ggEgrqQ8kEIySVqZtp+eflC20kK3IW2bh?=
 =?us-ascii?Q?OBXQCWUIiSIDYPlxpTLkdt/G4H1lvIxzicTDgpbdOyvIzRWXyQC31pj/dTQU?=
 =?us-ascii?Q?eH/4+K17XPNA/RZxH2q7kYcxNjBtJzWNyB22+s9RKa26ECJLiDJiRDLZDUPv?=
 =?us-ascii?Q?pVCAi03eEU4Ik0ZrcBNRFuTAGLXCbMi+7bCXk+y/Z6eUc+JfKJo7rvDzA23d?=
 =?us-ascii?Q?4ZxFFmC5k2tsUYq/tBFfIpXSfQWtzWUVxfz320wz92LKkHG4AGUvyhaF61mV?=
 =?us-ascii?Q?A0A8AJ/mjh1MNBNjg//AD5uuCVnpWsDnWka3wSklr+lHEuoo22g1eRvfADj/?=
 =?us-ascii?Q?kvXTgxP4qdPa2nCAoCv03+mh4kZ93ywBqYletW5IYhltTk4siZkj+Y+qoVzO?=
 =?us-ascii?Q?oG9Sy9Qdvg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800e15f0-9e23-484f-0357-08da38f011e8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 17:01:37.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewSixL6kC8SWpCYCiNe2kCVokhHLalU4rbxBXYEz/KF8YnPMNqhnPBCmeqOeI8XL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209
Received-SPF: softfail client-ip=2a01:111:f400:fe59::602;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

On Tue, May 17, 2022 at 09:46:56PM -0600, Alex Williamson wrote:

> The current solution is obviously non-optimal, it was mainly
> meant for backwards compatibility, but this seems like a fail faster
> solution, with less useless work, but also providing less indication
> how to configure the migration to succeed.

I don't think this is a production configuration. We should not be
expecting that the user is going to carefully fine tune some SLA
parameter. It may be the "SLA check" we are missing is simply if a SLA
exists or not.

> > It it not intended to be a useful configuration, this is just covering
> > off backwards compat issues - so I'm not keen to do a bunch of
> > management work to support it.
> 
> Are we then deemphasizing the vfio compatibility support in iommufd?

I'm viewing iommufd compatability with VFIO type 1 as only extending
to implemented features.. We are deleting NESTED for instance. As
there is no in-kernel implementation of the type 1 tracker I would
expect to eventually delete it as well once we have consensus this is
what we plan to do.

We discussed this in Joao's series and that was the consensus.

> If we really don't want to put effort towards backwards compatibility,
> should migration support only be enabled with native iommufd
> support?

I'm expecting that the dirty tracking will require native iommufd only
for the system iommu tracker, but the mlx5 on-device tracker will be
fine with either iommu back end.

It is still useful currently for testing the VFIO device part as it
will be some time until the other parts are ready, so I'd rather not
block it completely in qemu.

The goal is for qemu to do something sensible so when we delete kernel
support for type 1 dirty tracking so there is no back compat concern
for existing non-experimental qemu.

Jason

