Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0EF3AEA38
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:39:57 +0200 (CEST)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvK9c-0007kk-Ek
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lvIbK-0007mh-VY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:00:28 -0400
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com
 ([40.107.244.46]:43864 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lvIbE-0000Wq-39
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:00:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UamtqBZFxSIAP0O96a3R33RanCFQDCK7hwkA83cL/0H9Qai+8BzP4Ffyowc/jsgabxr0SkcYwbI5fX1SwyHe8AnfY7iDOFkLrpslHpNsnx+xFpvdpyG20j5wPs1BRvBkHOzVPsw8zO7LoCN3L/ZnG/tqlmEVJxB8J07UxL5lpLIVic+tn1AI53AE2uCKEWvGzL8vykiWh5wnulQ8rj8uR2PgVUGbTNjYqcGtdupdyxOB4Cf1pJjSsS/hL4vSuG0cWbLj8P3WlUp2EUplW3basTOCd9iMJyWeKUb3NWrlARgUejnZkBnP9WL7G6QtJ+JgKxNF2HUcZS3UllkqFeWcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cycjTYasQeoo1+jrhQm75YcxcTZPiIG+4GepVHPZUUU=;
 b=Fj+BHh5KAlCvjQL8l/7bB4VCY7yhzZ2FErmFRjF0iEQTwGmZNvKEO748tOHcx1SPsviTiKEqWLXrvlRIOi6vaRQX9U0SacOxq7lCE0Dv280ZWE2COPLJAFbbN52lk1Io7KGix279VjnD9WQFdnhEZzTjoBAxiuOdTK5iipNSoKQusc1JZHpftQ1xG9Srrd4xcm8J/Mu2aTMTmBdqCeCLzJKeRFMLrM4e1XLIK0owRk6Ns0YzGuDC7wL5v+nGcx/8H7LlvCHeFhbFPCLJkp8kZ/b1/nshorKEOpRZLAPoDQoORE0KpOlLzRHL6rS/y4Je+UkghSrPemRJCJuooI0uYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cycjTYasQeoo1+jrhQm75YcxcTZPiIG+4GepVHPZUUU=;
 b=IBN8GbqrwhM1ByVO0A1t0LfCKReullIV5erDi7r9gl6l/adtwpoLXS7PiEGrwhqTYHMNcf3VGSCjxTkir+jUl17+w+Ligyh/zIyvJ7Zr2ZqGIDpCvd/J/TAr2I5AC/aoeCXu2IlQSFZK/867py+U0l9UqJAafTlMjgzSlLwl0GKB6Wp6xw5U1kwVQbMiXRVw2WChEddpN4E+4mNo6PwjWHDAHbhjWQX59eIvWVPQcid40rkwVRTmxy5e14Bf2w0oWVV9u3hAclKz1Fe0Pe3m/ByU05vTwJsjZuVJgi+0pRNwz+eTE2ktrHYSbe6vKvbPyeS2QzgfGe9an5lWYhGkhg==
Received: from DM6PR08CA0059.namprd08.prod.outlook.com (2603:10b6:5:1e0::33)
 by CH2PR12MB3767.namprd12.prod.outlook.com (2603:10b6:610:26::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 11:45:13 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::1d) by DM6PR08CA0059.outlook.office365.com
 (2603:10b6:5:1e0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Mon, 21 Jun 2021 11:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 11:45:13 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 11:45:10 +0000
Date: Mon, 21 Jun 2021 14:45:06 +0300
From: Eli Cohen <elic@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 01/18] vhost_net: remove the meaningless assignment in
 vhost_net_start_one()
Message-ID: <20210621114506.GA143139@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-2-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210621041650.5826-2-jasowang@redhat.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de526ebf-54ea-4ac4-fadb-08d934aa07fd
X-MS-TrafficTypeDiagnostic: CH2PR12MB3767:
X-Microsoft-Antispam-PRVS: <CH2PR12MB376775957F8DBB66976478B0AB0A9@CH2PR12MB3767.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PT9PaFb2yaB+AU2Oraw4WCze/mVSSf20xl54Ykib8Iwa5BCMf1XgHINKKkeHnu+0EioYaEIE6+vORiSaEELeTO3JyQcVUgNB24eRUMs4chUKQnsZNf0WtLnocVaUNRvOlTidqd9cPRfNljdgu8x/xWGba71Vu86avfDzcshf3AlDnX/MCfi9q76xxYTA/gcN2xFnvQozD5+45t2sAAiKpRks5QRNObV2/fgB9Kx0qsuADyhRRG1TPCHVLj/H07a2svJto75m17HgxM2j2qlzhSJQsfgnHT5jPgs5gd4MElDTQOzDmctNJXHF1kzDKuMIeRVjxFPJtYSENwD3fAZ48LT7MiYPSrxa0DMfu1tYm2QHB9w1CUvGXE0RYNYieB+q699jKRfWOoZZE7gpA7a3pEcVoELJ/bMlIDnm65SFDrWRwzEI3ScYJSqx2+hFZDtZN3WBaIxstcZLFDgCfq/sHQUYFGbiH9gYUU/i82ldLYPqaP7c1rSfxmt5nf9Dsa6rFIrD80ifKMW6YnCtvDJNXFXdCm+NkOsNUC5gPPWFjlYu1AMc7ifcvWzPP0lN1/iiW8NtHFaHzBmf7D1/jYXyv8gRMLXdT2zeJg+cztNnERFGfWBRz1nMnvcLUHGr3XvNa1tY7UgnsMihxfQPkXfEsaQbFwHooPTt99Hv2k92TU=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(6666004)(2906002)(26005)(83380400001)(70206006)(7696005)(70586007)(47076005)(86362001)(186003)(82310400003)(4326008)(478600001)(16526019)(54906003)(9686003)(55016002)(356005)(82740400003)(426003)(316002)(5660300002)(7636003)(336012)(8676002)(33656002)(1076003)(36906005)(36860700001)(6916009)(4744005)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 11:45:13.1806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de526ebf-54ea-4ac4-fadb-08d934aa07fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3767
Received-SPF: softfail client-ip=40.107.244.46; envelope-from=elic@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Jun 2021 09:34:25 -0400
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:16:33PM +0800, Jason Wang wrote:
> The nvqs and vqs has been initialized during vhost_net_init() and is

I suggest "nvqs and vqs have been initialized during vhost_net_init() and
are not..."
Other than that
Reviewed-by: Eli Cohen <elic@nvidia.com>

> not expected to change during the life cycle of vhost_net
> structure. So this patch removes the meaningless assignment.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/vhost_net.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 44c1ed92dc..6bd4184f96 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -238,9 +238,6 @@ static int vhost_net_start_one(struct vhost_net *net,
>      struct vhost_vring_file file = { };
>      int r;
>  
> -    net->dev.nvqs = 2;
> -    net->dev.vqs = net->vqs;
> -
>      r = vhost_dev_enable_notifiers(&net->dev, dev);
>      if (r < 0) {
>          goto fail_notifiers;
> -- 
> 2.25.1
> 

