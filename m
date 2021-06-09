Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5783A3A0BD4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 07:26:49 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqqjo-0002Qu-AI
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 01:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1lqqiq-0001Ub-Cf; Wed, 09 Jun 2021 01:25:48 -0400
Received: from mail-mw2nam12on2060.outbound.protection.outlook.com
 ([40.107.244.60]:16032 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1lqqin-0008K7-RZ; Wed, 09 Jun 2021 01:25:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9lOPEaIDrS9Ghtx8oSclnf7PvZy94x4E9CVkmKuMFGxbV/6f+vF8yy4RAZha6pL9Fk4Xx58OVATw68xlH12XXdSHNKMvoVpG9RPBJw7Y13tmkU7/j6Rj2wWfNq0lqRmsZlBZ5QT2g5SGCUfJdvGjrtokGi8KdKw1y+JtdZnukwurw3gVot32SO2x+BEmyrkXHdPw7Rdn5HJT0X1m9TZ+owEVBIxNQ6ADPdLsiEfBvaYNmlNm6DWg5A9wsC2PcB7kFCt4GM7NtGKdN0emUoUMzdH5qOA401uUGJzlaPVbnF0an1UBhN/T0om0lCtYscXfQNZiRJG2hluNIv6X6MAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg5ZOG233yqLC8e8ioFaMISISzCukkZg7l3XFOxfjwg=;
 b=iIhp7tLSmZ2qlYyOifmaq4eYLW3IOJpPJvJuokAa2mnY0sV66oI/HOtPaTw/bB4e1Yh1xFNTGkfAn/bHjfgPUX17K+Zc+sI7ma4U8TEkn7XAS3NHVTOxzAw6O0uavq0+kjlelirND3FvSFrB7goCmyKb1XMN3US5FHNJodp0/8ob9P+8dfVu7adRxb/uMd9Mhj+PmwTNWPwW99NPYH/rX6qMaj9sWghp8wWkDgB/0Q0RiCS34jbvJyapu2K9RaL/On3C+b17ApcShiF0OrB4SNWGWuWYU1l1e7y02qch6TPSAKcbnoc6CPQh6dA5hIbU1wAy2+kVXF2vIjisYTLsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg5ZOG233yqLC8e8ioFaMISISzCukkZg7l3XFOxfjwg=;
 b=ZLv4uiixn+GIUu/pm0GLTaWZkQxoJkqlSU+c0V2oYlgMW/vRQDaogdFQbVOJdRiP6oWs9+YVRJ4hK57DC0u/VDcRo0cG83pjqs4dCiZpZ31vlqi76uMBiyAOGrUntN1p6iqXcbNxFiL7zyvDnGuxeJElEI4bijVDC+TDdbwj2GO/UEaClZfKRoEnnlYOLzO5TQ8Ll++GkRZOePhZ6RbbUsgjqKrhZBb9e8S8XJkfMd7BqkkvCXZZo9peiVKpVy4XA+a9/nOKTv+qD0VWO2RoqnlwuYHNPqZuxNXdQYAtLhW48FodoXdn8djAFZLnLFc9KtD7vSNGiScGiq19i5zqwQ==
Received: from BN9PR03CA0863.namprd03.prod.outlook.com (2603:10b6:408:13d::28)
 by CH2PR12MB3767.namprd12.prod.outlook.com (2603:10b6:610:26::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Wed, 9 Jun
 2021 05:25:39 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::c8) by BN9PR03CA0863.outlook.office365.com
 (2603:10b6:408:13d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Wed, 9 Jun 2021 05:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Wed, 9 Jun 2021 05:25:38 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 22:25:37 -0700
Received: from Asurada-Nvidia (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Jun 2021 05:25:37 +0000
Date: Tue, 8 Jun 2021 22:24:31 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RESEND] Multiple SMMUv3 instances on PCI Bus and PCI Host Bridge
Message-ID: <20210609052431.GA8835@Asurada-Nvidia>
References: <20210604231613.GC15599@Asurada-Nvidia>
 <a349744d-762b-74b9-352b-ad0a7b16dfec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a349744d-762b-74b9-352b-ad0a7b16dfec@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 471d1c0f-4619-4d33-6243-08d92b070482
X-MS-TrafficTypeDiagnostic: CH2PR12MB3767:
X-Microsoft-Antispam-PRVS: <CH2PR12MB376765C145D47473C248BE29AB369@CH2PR12MB3767.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhFHQ67OqQ5Ps56DoMj1KdGGXtnhYOTx/EbLVrvP/dJ3++Mxj1H0TjonEbqpSXUvJlSyDJj9ljLjRt1CR86Lu4nfEK9tTU+rcwIv8spClC25YLnAXPh6oZ0akI2sM/67wxrpq+p3l7V5htwkEOmVQpw1uvG/ndv2SR8BnGa3PgaadAccBCH5a09jNcdN6IxoHBVqt2YetqnxRTfqZ80lvztcT2IyWa4QvkAcBGH1ycmSF9KCOwuB4giyXpVuClq7oUyHAQe/tGXKOBmHtTkhsDXoiZJRWUKigs5Yl5yNuJlcurMnaFUh8PT+S5J1DFtF/wIq+hM4n8tCGUCf3O7gqIjie2hA/7E3GDqOoN61MKr6op0GsQedzfafj4bLdI2Efv36zbgzFhBsL/rr7/jgSq41qOOIS03wV7iuAhM1s6ddA5fIkM7YaOnnx3Yxoyc26wkqG9psdWYDggJ2BtHPc7jdyLsEULLBFB98knxBc0MeFl+voN07GQ08tiEWrfBRQVd+Fk2n72eaX7Nop9H+QU6Fty4a8te7GqhdgrJ94V4SKbN+kRTRR1QnajIpcSCx143D9QJVUAhL2gXhgmMlwQHkegNCN3W7i4kGgcC9BEmOu8ug0yqqcLmsIrpt3po34p4WktFcYhVwSs4G/k4ammalxQj3DPMS/LKFQLWHWMo=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(26005)(8676002)(186003)(4326008)(8936002)(86362001)(33716001)(6916009)(316002)(54906003)(2906002)(82310400003)(6666004)(82740400003)(356005)(336012)(426003)(55016002)(1076003)(7636003)(5660300002)(9686003)(4744005)(70206006)(70586007)(47076005)(107886003)(478600001)(33656002)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 05:25:38.8246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 471d1c0f-4619-4d33-6243-08d92b070482
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3767
Received-SPF: softfail client-ip=40.107.244.60;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: miaoyubo@huawei.com, qemu-arm@nongnu.org, vdumpa@nvidia.com,
 qemu-devel@nongnu.org, praithatha@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

Thanks for the reply!

On Mon, Jun 07, 2021 at 11:19:39AM +0200, Eric Auger wrote:

> > So I started to have questions in my mind:
> > (1) Can PCI host bridge (PCIE.128) add to a different vSMMU without
> >     following PCIE.0's SMMU setup?
> changes need to be made in hw/arm/virt.c
> create_smmu() is passed the primary bus the iommu is attached to.
> Currently arm virt only supports one smmu instance. So playing with qemu
> options is not sufficient.

Yes. I had my local change to do that.

> Besides that, effectively there are IORT changes needed because you need
> to route RCs to the different SMMU instances, ie. some RIDs need to
> reach SMMU#0 and others #SMMU#1.
> You can get inspired of "[PATCH v4 6/8] hw/arm/virt-acpi-build: Add
> explicit IORT idmap for smmuv3 node for this kind of changes."

I see! I tried some change at my IORT table following the way
from this patch. And it seems to work now. Thank you!

