Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3423B2868
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:16:11 +0200 (CEST)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJas-0002hE-PH
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJZX-00020v-0e
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:14:47 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com
 ([40.107.236.47]:11296 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJZU-0004ks-Uq
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:14:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM0payrJGDIw3L8Em+/wkpWhYeceff9UAORNPId9ZmkIepYJEaqa9SkQKOhmFH7CLkPz6TXoyV5eWhanmHvMG6SHoWYjNtmbK9o0f5Aej2y28GoBHquoGBsavIo4fywxU2p/EbOoTSxHMN2LL1sMMMhF3BRQKPErnUZoxSaVINjxUlPnoqsJtn/5+yEIWdwqes9TJbSvbW4iIP0Q5T2UNM+nXsZhvXwb7v5vp1b8TC57Ez+g0MaDb7JKFS265ZtBg03D0WVPbcE7lWSvMCRWh2AUdY4XBTvn1/8kik9T3uPzdPJejUc3K6Rz1CzrBqdJinZngmEL29d9xNiIQWBItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyktqzjYSKde1+wXpqZ95tkZjRnTvouCxsAeU3xm+6c=;
 b=hn1CkeNR3QaSyl5CVcKyRjtZ8NvNqPZhsVrPU2Cxe5w4LFxK93kr/5iy7I3e2K3iYHFA2inYLA/pHC8WPryIp4S9tXwQbvycrUWLcRxbKMr3DA5FlPR/MjJPyOZUv8NgLgjX6uOt3CfYUBFsnW7IdTZ7fD/4pmrJGgjlTZmqLEtmIzXEa8hkAH+UDqYxT5yY/DeP1DPJ44D0VN4uaVPr3IUgaO0ABLBwbMPgjjrl0a/3fRvss0fwmVn85aeSRxZ+OpA/ZDuERtI1/AVp3yJk3JcygAaTT/LuztoGnAMfiz3zmR7tLdbHrEjNeEvT0ism1qcdGbKdnEITuUI9grhHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyktqzjYSKde1+wXpqZ95tkZjRnTvouCxsAeU3xm+6c=;
 b=dkmc+nj6KhApYPrOBPgWzrvF+v+mg2elOg7PqybUVmi2sOdKvd+WyD7ftraZ/IMnmCuiZWPm/VzwFcoC6GJuDvh9EXVZuXa/qmbbUMnsKupsPt5hxYh6GBUDGJNCNK9czsqSK9Tw+e3bPH3mUfubg/uOC4GjKRXNP6F9dt6imSqnbGdwyNGI4p7LGFKfEjuHVtVT3MIrMmd2b2UjoCAdzcE54FLA+lF2Sz2ets0SGNnPb5ItW7kbnjXoWE/K2s3CoyHrCQw4o6QbLHJxNoQtAQQrEKvIqX6ZR/eEnjdyOrmP+gZZs4dq+LC6IzZWgYPw5AZoIZ2kF3gjFOwYiaImYA==
Received: from MW4PR03CA0321.namprd03.prod.outlook.com (2603:10b6:303:dd::26)
 by DM6PR12MB2890.namprd12.prod.outlook.com (2603:10b6:5:15e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 24 Jun
 2021 07:14:41 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::e0) by MW4PR03CA0321.outlook.office365.com
 (2603:10b6:303:dd::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Thu, 24 Jun 2021 07:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:14:41 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 07:14:38 +0000
Date: Thu, 24 Jun 2021 10:14:35 +0300
From: Eli Cohen <elic@nvidia.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 06/18] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
Message-ID: <20210624071435.GA41596@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-7-jasowang@redhat.com>
 <20210623150016.mdrk35bkxfr3ww43@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210623150016.mdrk35bkxfr3ww43@steredhat>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b456284a-8038-4ae9-d5bd-08d936dfbc2f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2890:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2890E51F00BE278C923728A4AB079@DM6PR12MB2890.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +tQPfDE3QBwlCC2f+j1YZ3cQqZJbymRInYzg8h+KhGSbLDaL2Zer25FMKovYQ8HdPjJFrn+8xt7LWm09TSmoj1KCQX2EIgnHJI1JiCjH2Qb7u2Eu0X1lrw8S7ofd2i0uYSzSc5PDNgQ571ikcfqubnEvSMShWfbqMW4XxkpaEC0E3zwOl9RIDIZNv14kjzSGorcuHYMQbv7YSw9Tu3WQGKjD5oDqEed9TE/Gbyj0PArX3MALm81k2/pRZc8rPiLXjqss4bGad+6h2o/xcZvSDjE0+dzgxmX5tMSB16pv3T3N5Pk17wa0EqPfBKEQw6hT7QkbWTB7N3JCDqjXfVvKHesMppvKtEGHhW7XjuKkCdyllbacpmxj2OMNnC9/Ot5gfeLwc6+00F1bDIrwVDWNCemcz3SekHFm9Zlwl5OZ0v+ZK2RyluT9uvstn+LBpJtaJMkWoUqEGOUem9iEGZZo4Lvam/zuh9D2ygRPD8EU+XN+VM5mDasPVjH9yD4RHSlQXorZyy5KThNDS4+aJS4Pd17E22EC15+QUfCZnuy6GUBrbC7qCGEr4TXz/86IcbjN7rfQ1H4ehRRqoz8kxMC6sXjgVAfkHlFcDLIeCoLWOzFZElfnJrazee1nq6JRI/+wV0V42dPHYOmLWyFpcgTTo5wGT2KX0wpMvB8Y/soWg/U=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(36840700001)(47076005)(2906002)(1076003)(82740400003)(5660300002)(36860700001)(336012)(9686003)(16526019)(8936002)(316002)(54906003)(426003)(6916009)(26005)(82310400003)(7636003)(8676002)(83380400001)(6666004)(186003)(86362001)(55016002)(356005)(33656002)(36906005)(4744005)(478600001)(70206006)(4326008)(70586007)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:14:41.1404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b456284a-8038-4ae9-d5bd-08d936dfbc2f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2890
Received-SPF: softfail client-ip=40.107.236.47; envelope-from=elic@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lulu@redhat.com, mst@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, eperezma@redhat.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 05:00:16PM +0200, Stefano Garzarella wrote:
> On Mon, Jun 21, 2021 at 12:16:38PM +0800, Jason Wang wrote:
> > Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> > net/vhost-vdpa.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index f5689a7c32..21f09c546f 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -111,6 +111,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
> > err:
> >     if (net) {
> >         vhost_net_cleanup(net);
> > +        g_free(net);

Shouldn't this call be part of the implementation of
vhost_net_cleanup()?

> >     }
> >     return -1;
> > }
> > -- 
> > 2.25.1
> > 
> > 
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 

