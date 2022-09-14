Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52C5B8FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 22:20:50 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYYsK-0005rO-OI
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 16:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oYYoS-0003cy-UE
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 16:17:07 -0400
Received: from mail-bn7nam10on2080.outbound.protection.outlook.com
 ([40.107.92.80]:41929 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oYYoQ-0005cI-Gx
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 16:16:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=na+0Pe+CwvdGogEPVERTey+APTjxws1sAwOSJp1fQfVD1bfwFy2RzxmGmzl3x1PVnAytQsDHEOfxF6h612pKH30R+VPXPMMcH0SVlTpcRAmgwgVv9kWNea/+RRL3+id9Wv6IG0DmTXvTJs2vnLrp71F+1UbC1cP9oQigG/dhP1MWvlWzjcxma2lK0X2BfT2D12ZEgYL5AEfQxuVdJmNTX6ebwEp5vy0uCzX6RCb5LsIe0dmUwi4ISfipA1acmKU7ll2YPqastNoyemfvAcija5xiwI3Hc78E8Z8ss3OeUumYTrTS5m1BWzUraUPDkkRhzMZYYY7CKXvqC8IIggYB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Homm1po4t+LCzRBQx36OwkzYfd8rHp9nvvsn0h0tfWk=;
 b=LkHKSOlrEW7iCODEnZ2kDs0LiMtY6NgvB93yzXJrjQEY9kqrfz1SX4DPSr2hBEJiplT+LAcJT7DAOj0zQb0ns0SWkWPIkA/jGLBvFDDXTTmuoEOdnrV6EMfloh27aX2sgyo4dBb8Zot0jL35p1n2gYCkvbEhv4TnlnBHZWZeCX0jc9txOb8IWhhGsxuvchm0uFowwtEVdWT2AGxOexMY5RfRTEe3tL3vHhe3KFuxiW6L3MlQoSmxPhFm5ymsampsLRRN7cQVRWQQtCJzeGPUdA81eGqpqux8QeZPo9OITtHRNPJZtsw0Y84RH9dXs6BTu1jVTQMSMtcI3MWbLNsRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Homm1po4t+LCzRBQx36OwkzYfd8rHp9nvvsn0h0tfWk=;
 b=SF9C0qzj+WDg32IbYh2Y7b1yIMBmVoUJ2bciywjEih/WM8sWDo+7LbrnvG5Yezvdg5F7CBBI0+XMDAcwZ6poUux9Qgz17m5A+9BXe60lu2HIBJry4B3GtaNVM8s1NgchzCuhVEuwCU/cHR4OmJ+wktJ/R12+rMht9kL9W+6Q6qVWWJmUJysM0n4UXCUV0pP7krcdTbmfqVgeqZ8QlL+JUWqVfND98H9yYWDmSZQHq+Zmtsj9+cYqsNfH2b5AQ4kC9LS8IfgnnZ0ulVf5uAngjmAFrgUegT6Vv8wakUtqMqEXUTCJOlhqtaIADl4Yra5R7D4XZoFqvr5II8/8L2KNOw==
Received: from BN8PR15CA0015.namprd15.prod.outlook.com (2603:10b6:408:c0::28)
 by BN9PR12MB5367.namprd12.prod.outlook.com (2603:10b6:408:104::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 14 Sep
 2022 20:16:42 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::37) by BN8PR15CA0015.outlook.office365.com
 (2603:10b6:408:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14 via Frontend
 Transport; Wed, 14 Sep 2022 20:16:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 20:16:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 14 Sep
 2022 13:16:28 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 rnnvmail203.nvidia.com (10.129.68.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 14 Sep 2022 13:16:28 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 14 Sep 2022 13:16:28 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Wed, 14 Sep 2022 13:16:27 -0700
Date: Wed, 14 Sep 2022 13:16:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <avihaih@nvidia.com>, <shayd@nvidia.com>,
 <jgg@nvidia.com>
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Message-ID: <YyI2mp0qUFD0loB+@Asurada-Nvidia>
References: <20220910004245.2878-1-nicolinc@nvidia.com>
 <8735cwu5r7.fsf@redhat.com> <Yx+b0t20wtneTry+@Asurada-Nvidia>
 <20220914121029.1a693e5d.alex.williamson@redhat.com>
 <YyIlYK6TKmBRmUqI@Asurada-Nvidia>
 <20220914135339.665b90b1.alex.williamson@redhat.com>
 <20220914140325.41bd470d.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220914140325.41bd470d.alex.williamson@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|BN9PR12MB5367:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a57fe6-97bd-4846-33ee-08da968e0a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbl9asiL5lCeblozc99bkTCsUEwfvFuxvgADbVxkA7ogLPtvy5d1N0GAL6WV/2Rzi1Q1pvaVZEYMCNSBgURlDkZ87LwM97HTd9uMDbHfXXOo0HUn7M21spgNxLT8AUeq1y2dFfwXgDYPILom3kc/1dpVtkG0m7N+iIUI/r5R+8P5C+0ewzhNB2REjA2HkrRB95N+kiIdesB8sitYuaaUkRvxaI/I7EFagsTNXn92KDo8Uwe386ODgF9RnOELoAipZ+4uEzubeGP2fRh59ma7WhwGVsoAVLwgrqZ6y12GbS9HCEh+Cxzo1++JN03BIEU0TjdWoFyVHOEUIasckQT3tAKqmkltOfA2vnYgb94I5FpKrphOzgEbf5RJNxmcAgEM8R4HUGVjNr3SBcUFNXBZ/6GyoW9wwmaP/n5zr+3sZn1jgIFB33QPm6KhDpq4GZJ4d1hc7FMFy0EAM3zS28GZbz6fLKWBaLFD7DkhP7l/Ib4tGBrGkOm5tyR9Fo2mnXVd13fJX++7S4EI4V+lBaQt/6oBJUhecVGavPADfkEJGLyBuM3jcJMoI/Opx/YRyrupWTxU51hMnVs+eOer9ywZylvBJLXJuF4sn1DvjVFRvmPKi/p92XHZLV//QKPxzqfSBOZTjaydAdYti4Vdk+fYks/+IAPyRugDGFAsrJPTXskbueG6gTaqjRQBOkbXY6bPfU12Y7W2mrV39cFfTf3UviOL0AVOgrMih8JT42MCeRktPPDyRIsll4QEIPXPo0ODNjUk3yB6o3ERZz7qkhBYZw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(54906003)(41300700001)(336012)(426003)(9686003)(70586007)(33716001)(40460700003)(47076005)(40480700001)(107886003)(186003)(86362001)(4326008)(7636003)(70206006)(8676002)(8936002)(26005)(478600001)(356005)(82740400003)(5660300002)(6916009)(55016003)(36860700001)(82310400005)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 20:16:42.4940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a57fe6-97bd-4846-33ee-08da968e0a35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5367
Received-SPF: softfail client-ip=40.107.92.80;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Sep 14, 2022 at 02:03:25PM -0600, Alex Williamson wrote:

> > > > +        container->pgsizes = 4096;
> > >
> > > This might be a separate question/issue: I wonder if we should use
> > > "sysconf(_SC_PAGE_SIZE)" here instead of 4096.
> > >
> > > With a kernel using a larger page size, e.g. CONFIG_ARM64_64K_PAGES,
> > > the IO page size is likely to be 64K too. If the ioctl fails, this
> > > default 4K setup won't work.
> >
> > Perhaps, but IIRC this solution came about because we originally forgot
> > to expose the IOMMU_INFO flag to indicate the pgsize field was valid.
> > At the time we only supported 4K systems, so it made sense to provide
> > this default, though it is indeed dated.
> >
> > TBH, I don't really see why we should try to continue if the ioctl
> > itself fails, so maybe this should be:

OK. Makes sense to me.

> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index ace9562a9ba1..ad188b7649e6 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -2111,29 +2111,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
> >      {
> >          struct vfio_iommu_type1_info *info;
> >
> > -        /*
> > -         * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
> > -         * IOVA whatsoever.  That's not actually true, but the current
> > -         * kernel interface doesn't tell us what it can map, and the
> > -         * existing Type1 IOMMUs generally support any IOVA we're
> > -         * going to actually try in practice.
> > -         */
> >          ret = vfio_get_iommu_info(container, &info);
> > +        if (ret) {
> 
> Clearly untested,
> 
>                ret = -errno;
> 
> > +            error_setg_errno(errp, -ret, "Failed to get VFIO IOMMU info");
> > +            goto enable_discards_exit:;

There is a ":" in-between :)

