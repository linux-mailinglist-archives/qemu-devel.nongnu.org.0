Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4A5B8F2C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 21:11:36 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYXnL-0001aa-WE
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 15:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oYXkm-0006pW-HV
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 15:08:56 -0400
Received: from mail-mw2nam10on20617.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::617]:31041
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oYXkj-0003DG-Cm
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 15:08:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBa7lDIFJvcMqdGc2tjzl+bBC/zfTgnijdpX7kLkq0nc1pEvajAXz3mvxBuqo6F4XoDqsaMTUQBspq7Eny0FWjT20oE3XDDnr4sZsB/vq0x8FZTLxOneBJBSq3cHTNXVFH7sUw+YnrAJc6FGysIeVEZ7R93WOzsYRhw5HUgUzAyvn2E+mKQ67t5jnbrnNIBYrlrrGApjn+DG/Iqt8xHET/b4JlA47Xnk4WyxTABmnnEiqaZS0NrNixoZ5XyUQhR0kcIWif3lvUEsKq/77dndld2+kgBZWj0Z9rUNmNSta4Vms4q2e6XRUoDLuPwNXdhK17MEB1+EQnuHRDogN+93Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNSB4jG6ZoJR/X/aJaQRBLpQEjPOU7QE6sAkLI5Hnag=;
 b=ec+Vj88ZufPSzgNFnDf5xWVumVx7S7wuSJwu0n6zC87iQSrOiThq2bvz/BG4K5vYrhF/hegtFLPxbn6rHQKk94P6ySmyqAACtBZWZvJlGvTnNSYHCNjoZj1oapIs6mBGxyx7RAU96kt4c7VTfTUf0Nr+iKUMIxcDe8YBmaPU0CqkvJHP4HZkQSKyDcmBHVAwEpUMUiyNyltqFDHs+NPZ/LMAyz+k6uNSVfqbLS8hYxgjv4R40teAbqI1dZCc+tS8+KGfwKGzvUaaccyGZBWT1GlQCTHxLkLRkR0fAuBHUSlppx9hFLimlj0XdtbgyQbxIkkw/0UCLDkK2sv9JGO3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNSB4jG6ZoJR/X/aJaQRBLpQEjPOU7QE6sAkLI5Hnag=;
 b=dxYSpuDyoFjK8fUOYQCKBim26PRd+GAm91JrlIzQ0uAAJ5ZiKmKh13WcemmA2i5k4e1YJW4HQ++Zk0OpX9FAsHsjsntw3oiakK7Y7q/jnlLymyZ/b8XvFw9gYJvladZsqZDST93wA1qrKo0Oguirs6kht8ObV/lIWLV9M96uAEO5vaF5Euqtf9UW3OKOEnS8xU9qySrDIw2ryOnGm3tu6H+dMtPkRsxODujCIfuOtmxtU8nGWIEPLf7/hTKqu5Yhy17Cwnt2cm94B7yP8fCnk7gzna9JOAu0soVJYRg+RZ/aPyjjY4hnrhapAqc9MfFvVnGtDXzFUc9bkLthoA6gRg==
Received: from MW4PR04CA0361.namprd04.prod.outlook.com (2603:10b6:303:81::6)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Wed, 14 Sep
 2022 19:03:45 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::f) by MW4PR04CA0361.outlook.office365.com
 (2603:10b6:303:81::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22 via Frontend
 Transport; Wed, 14 Sep 2022 19:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 19:03:45 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 14 Sep
 2022 12:02:58 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 14 Sep
 2022 12:02:58 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Wed, 14 Sep 2022 12:02:57 -0700
Date: Wed, 14 Sep 2022 12:02:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <avihaih@nvidia.com>, <shayd@nvidia.com>,
 <jgg@nvidia.com>
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Message-ID: <YyIlYK6TKmBRmUqI@Asurada-Nvidia>
References: <20220910004245.2878-1-nicolinc@nvidia.com>
 <8735cwu5r7.fsf@redhat.com> <Yx+b0t20wtneTry+@Asurada-Nvidia>
 <20220914121029.1a693e5d.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220914121029.1a693e5d.alex.williamson@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT053:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0d7521-a9bf-4a73-77d7-08da9683d90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4q6AB3l+QTP4TSpHlDUWifKKmgeEtLRYJIaz0NfHLp/XReBv6JGZmOlFLa84XDdAk/f0DC2pVwFEo4Nwv3hngRnFXr1Be8BdLvWfxfnXiSrH2oS7ptBu7EUmFty6eB6hvBFXz/lSeSwVaF5v/XnBx6pbW2ao1k7EZlMZSsB825Lstnnzho1jmfGILKqLJCYwoivd5WVFO0rBqbga6Hn8hQ5ZI/6SivkHTsciYPWhS1B/0vKXqK0F425qu0PXaoCZSUDla9of34aSitVHK2afsVN+NmEgY8q1FLqlMvu0Xd4X8aQVoviBF4ZpEKSrn3KbW+rjG1b5gTblxIVhSNQDcVf8sqbXfb1K6o0cmA30KCFHjI4dDOH+rw1G4OAJu4kGFiX6aGYA+cnG7uyNuEllTnLfdHYS8Yi1Z8kungeGgJsNeGOcmKbcU8zxnSI8zFX5UGyPQLovU1ZXVgV0ZZ4WN+87RfM+3iieN6PZAJ7mnNNqO9t8eSf0OdVB4T4i01iasIOKm/XrQxfSpftF7uGn5x+HoOc84moNiE6FfkDAvWUX35EqVxsjkoOfM5bWuuU0ZvSXWwnhNGQ3xusO4kXiEGlK3tAqkUMSUdRmdd7GxG5rc183sMeKiv2o1gGhufVn+o0nwMHZR4xUN0o2g2UwK8TTP+W2xekVzKCVUVxhUW71pz/hT8ypC6vaJ34asqkgCoukuz3Rs4lNUqrp/Rm4cRvBuW+6sM/13isCIgrl5sW8XgfjOg1zSBRcNk29BNOSB9k4oSuEmQy/n58vd/mZ0Q==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(33716001)(107886003)(40460700003)(5660300002)(316002)(55016003)(2906002)(41300700001)(9686003)(478600001)(7636003)(8676002)(47076005)(426003)(26005)(8936002)(70206006)(336012)(356005)(186003)(83380400001)(36860700001)(70586007)(82310400005)(40480700001)(54906003)(6916009)(82740400003)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 19:03:45.1829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0d7521-a9bf-4a73-77d7-08da9683d90d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672
Received-SPF: softfail client-ip=2a01:111:f400:7e89::617;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Hi Alex,

On Wed, Sep 14, 2022 at 12:10:29PM -0600, Alex Williamson wrote:

> > > > Its caller vfio_connect_container() assigns a default value
> > > > to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
> > > > This would result in a "Segmentation fault" error, when the
> > > > VFIO_IOMMU_GET_INFO ioctl errors out.
> > > >
> > > > Since the caller has g_free already, drop the g_free in its
> > > > rollback routine and add a line of comments to highlight it.
> > >
> > > There's basically two ways to fix this:
> > >
> > > - return *info in any case, even on error
> > > - free *info on error, and make sure that the caller doesn't try to
> > >   access *info if the function returned !0
> > >
> > > The problem with the first option is that the caller will access invalid
> > > information if it neglects to check the return code, and that might lead
> > > to not-that-obvious errors; in the second case, a broken caller would at
> > > least fail quickly with a segfault. The current code is easier to fix
> > > with the first option.
> > >
> > > I think I'd prefer the second option; but obviously maintainer's choice.
> >
> > The caller does check rc all the time. So I made a smaller fix
> > (the first option). Attaching the git-diff for the second one.
> >
> > Alex, please let me know which one you prefer. Thanks!

> I think we can do better than that, I don't think we need to maintain
> the existing grouping, and that FIXME comment is outdated and has
> drifted from the relevant line of code.  What about:

Your patch looks good and clean to me (some nits inline).

Would you please send and merge it, replacing mine?

> +       /*
> +         * Setup defaults for container pgsizes and dma_max_mappings if not
> +         * provided by kernel below.
>           */

Indentation is misaligned at the first line.

> +        container->pgsizes = 4096;

This might be a separate question/issue: I wonder if we should use
"sysconf(_SC_PAGE_SIZE)" here instead of 4096.

With a kernel using a larger page size, e.g. CONFIG_ARM64_64K_PAGES,
the IO page size is likely to be 64K too. If the ioctl fails, this
default 4K setup won't work.

Thanks!
Nic

