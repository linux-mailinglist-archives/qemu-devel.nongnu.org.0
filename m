Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40E3B283B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:07:59 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJSw-00076s-Rd
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJRQ-0006RZ-1X
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:06:24 -0400
Received: from mail-mw2nam12on2072.outbound.protection.outlook.com
 ([40.107.244.72]:4450 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwJRN-0006Pk-MC
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:06:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFQRbu+ykTUPBaIDWqx+jzG+t5FskIqgtb4QNrSk3MG+nHztenAeJnTaLXJoWDlEmm/7mNUqF6Ml4jWSBYWxr7JtsulQQUzLlmsDwqBziZNcDAlk41GSWfwa61PkLtcQk6fUBgbImMC3MOyN1IcV4peKhzYJn6WSC6UP0bIRGNFak06oc9k2hHEocH9t6CBGmLBBUc9S0pDAtSbkMvK4iDQmxnWFtTG6Aw10lcF9xoulJit/Phnsc2YmUknuBVXymHapqiA6Yx8U8fChXsVKIrs1mOdL6YoayVuOtyqCZHN8BuBv6LkqUF+W0oaFppz8HgQ2ZUqEOr9JQqgHxk42/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpW9XDWTPPFLNtZ6x7FdyeiCXxT4zNRLNa5nGBqP9tQ=;
 b=E2WA+dnXIyCU0PcWU46j6rI1uxuzJkwQ2CIZ3/ZBjJ6OlHkFepx6eeP/n/mzkA51c2p0XXjGVN0N3tWQ8Na6xQbeBmSMinzVy6zRz6Jyavzrjur5caH8x3zro4GpqSjRUSFYYKMMPpffT7BslAhdU646aXD0jBuN4FPZQ8ULyVsfYxRY5QqfMvFEWZBISrfGKboHwgQkNphvjomSBm3cCbZdmeFs9N252wkkgBWmWPRAS2WcHb4VmbRJBRllddjq5NbYG983U4D470xR32PyQ8kQ2rWDo6ZncRpb+zD2gqDdj//u0AnDNJWZvBkkwB2xLBKf0dQiTmdCk6Bjx24Erg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpW9XDWTPPFLNtZ6x7FdyeiCXxT4zNRLNa5nGBqP9tQ=;
 b=NHPeJp3OgKJcMZ7ryQT7JdeD7WlQfJXpQYqKknzgc2zjT2gd0n+RJIHemnIN9wkDyneWwKP4eHzqLCZoitVqPL0HBqfMYD0i4ocFvI6p9jzyVlEAh4XfzrRJYDMxrXgP85biMD0ckS4PvXYOcatC8ju6wzrGuZmgsW9q982moI1ZVnT2YVrD1gDm+ovNOe6drZBy7vpHc4h5Hjo0kuAJeQ91dNc8fei/zMG2c7eAJtPFTU24UtDmYN1LRKe1lUJPUFAzJFUIJqMn4Gs9NM7X4h/MMjYNAHYeIFc5BmSOLXGT/u+Tybe5h357vOyQIuriKq1k9SUxaDbtix5E86E7Zw==
Received: from BN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:ee::30)
 by DM5PR12MB1628.namprd12.prod.outlook.com (2603:10b6:4:7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21; Thu, 24 Jun 2021 07:06:15 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::45) by BN0PR04CA0025.outlook.office365.com
 (2603:10b6:408:ee::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 07:06:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:06:15 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 07:06:13 +0000
Date: Thu, 24 Jun 2021 10:06:09 +0300
From: Eli Cohen <elic@nvidia.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 06/18] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
Message-ID: <20210624070609.GA41237@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-7-jasowang@redhat.com>
 <20210623150016.mdrk35bkxfr3ww43@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210623150016.mdrk35bkxfr3ww43@steredhat>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ecfdd4e-5215-4970-2bb5-08d936de8ef9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1628:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16287692C383B8D820B5DFF1AB079@DM5PR12MB1628.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7uCEMV2lHNsFPUa6T74mOTed+gl+hVVwv3IwtSf6N+wVxfca2G6brBwzhZD55KkOjhWQlqkS6gyWMPFuR4w+frHIo/nWpt0doi6Jp7+0slDQt/DeGhm2wWxlP9S2kbsEJN97sef4hqKClvkD/8MwH12ULX6b9M6GTR6WbMexJCRSVDU9mkzKhq++5mXXWQ9QYqg2Jae9xxarROpMX2uFjb0pLX8LeFH4kcA8ucpkZzLxQDXF07a84Bbs2ozEzvXxS6A2Nw1iJrO5XBPAuos/05T3ZoSXb401EHX7K0/bWZyyPoC053x1kFTBUC9xV8LPFBu7p4wMCB3kSDKhYiXuovCkZYltvxyg7QnHuzXLkZyEk1FFBuRpq8d6vNHrmZeZW9r3aTAP4c/9fGB+7RJWnkyjG6V3IowKnspE3a9R2uGE/FOQqvxkW42E+EQ6RXw8N6obigbkDV3NcfrYccOPLyN8ga1LXvAd0wom1BCzGouHcswQSzFKtbiLWSY8zRhIlNw5bzWq3Nmx+mkVdRSeWJEge8oyVJyi6n0a7YopAM5pPMUrIKmWAnRotpEOamQd05nEdW1dgbWeXS2v64+/fpBOm/Yai8W4+c5jStiaE0tMSXRQybGGGfQHSh8WQCv4aOe3tnRXTA2Db2oCtEKL4zzSovi7IEJ1vrVvPzM/088=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(70206006)(82740400003)(70586007)(16526019)(83380400001)(4744005)(4326008)(186003)(6666004)(478600001)(6916009)(55016002)(1076003)(54906003)(26005)(5660300002)(9686003)(7696005)(316002)(336012)(8676002)(2906002)(33656002)(82310400003)(86362001)(36906005)(8936002)(47076005)(356005)(426003)(36860700001)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:06:15.7170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecfdd4e-5215-4970-2bb5-08d936de8ef9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
Received-SPF: softfail client-ip=40.107.244.72; envelope-from=elic@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
This check is redundant. net is not null.
> >         vhost_net_cleanup(net);
> > +        g_free(net);
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

