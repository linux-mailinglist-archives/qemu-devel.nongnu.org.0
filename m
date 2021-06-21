Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26673AEA24
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:37:46 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvK7W-0005Dd-09
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lvIO2-00023o-Sb
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:46:43 -0400
Received: from mail-bn8nam12on2080.outbound.protection.outlook.com
 ([40.107.237.80]:20385 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lvINz-0003RP-Ml
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:46:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+pFC7LYzwo8aX5tA1zVLQ8FdRKQgLcaMQSfXCVIP7Tn/xi+MBMao6i0zxHhzIwpnCZQRejg5eOlxa+N89vPVsQoRHCjEFHhmnNwgKk/368E7PBNmjPQMtEWemh3bAjqPTMQhWekc+hWrzN0Jnhw+5OuqOho8Kx0D3IyR84AJFdjTQD8gKY+xhSO1GyA7+E41+2OuhGQXjP1wfYJLjrt02mwI/HvR+gjAi+qPtXmbuxnAlEnhk3ZpM/DQiN5ws3Qff7JziP8fxtN/UOvDZukHyRxA8UgBu4yf9/dO7xmvPFH06sz7UjgrseVfeswjfSI6x5IjJSbra5wCTlPqu6EoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouFc7axxOfrfN/eZpPWLNEARE1xllEYStvTB/x+ABPM=;
 b=InLLBprZC7S0f7uPVkOG4GdXY+g4IqRlU0VuYsLZqyLXdJkHg9T/SFMLHgiUMSwgVHDSwEJBh262E+VB7nmoppiAgigbr36UAaAFmiO5sZd1undr4k+6PS12XOSG6doDoHzTT4WzkajBK2Qbp4qUbsXj+YyjE1KT+pRwsQgyBEHVniixqTqi0JFLt83DNELn2JKX+Rtd9cMH9f3zv0B07bdv8qaJYGnFBne6HdQd1NP4H6nlRso7eJoO01xOLHtyd05TAonJcfdxhLVm/NWvJixWHA9wvBQonJ6gbWS3nFf0kNPPoIYcP2DdI1e8frFhn1MZB2G7cOWTqPTvi83jEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouFc7axxOfrfN/eZpPWLNEARE1xllEYStvTB/x+ABPM=;
 b=WVLmDqGkAR3cqp/YzP/29G26bGD1UN5iBZK3sXR7yhW1zXGQ3pCzO207F4Ly1ms6VoSasXs9a9e/h7qekJPDgEgO9rFvo33wrdNLA/7In4H2v6tbCpUUcPrMIlKSZnz0B5we43Xq0dWuVGO6i+aWKLWoYLKr8T9wyOI4nb8s5GN5+M3MCIwI3zDaTO5IVSQ8zZweLQ4s+RyC79KAm4ZDq1X5NMj0MsQXzMjn+Mx8Q5nFNBY+StETnfuQC8vSO/XShNijC/gzPX5CbjjWYevga8i6xmryhQa5btOx7DOTKaYJOQRRWH9lOK9pMJirU+Y7KBS7K+azF0Kgl2RRsPGWwQ==
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 11:46:36 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::cd) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 11:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 11:46:35 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 11:46:33 +0000
Date: Mon, 21 Jun 2021 14:46:30 +0300
From: Eli Cohen <elic@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 02/18] vhost: use unsigned int for nvqs
Message-ID: <20210621114630.GB143139@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-3-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210621041650.5826-3-jasowang@redhat.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ad8096-1bb8-4e5f-0a62-08d934aa393a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB48983B9DAEF03D5B5803CCFBAB0A9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59NLJz1f8Gc1d17HyOU5fHsaHVv4sZcpD0MIu+qNQqhIWAy7izzuqqWQeGF1l3N+VABai4/G45w4AcsDPNhDhYe1nKXsMXdg7NlSQlJppNQBRNwU52db+i/7Vyg7BaJz0Ap4eOO4NANfUFIHmfWknRHQML5YCBGA9RMTfcljWQK0P4ZtJZwLaOTZJlpxpFf90IDiov37iVnk7KlKFPESBNqwsG5HWN6TSqZMjFYsAd4lWmf6h2L2mi/YTVZM3qUZ/G86SFQyZoC8PRIO5ZOgyZsHfMtRUXROzHujeA7vYsjhgrCWNQhP4pjDY8cPWMrLFciIE8dhUzyujKmP9V0Ugp72pCanupouoh55kc3LlyyHEfkrNRN2hwXxRjFrSRMJo/GOuAggJF3Wl9Hm6+qaQjwXGskSvfz5Noh7S1Ogcc/UB4OVBRVsumUWr9ebNDCTlqyWGzDXIJt/dAZyyqRJDzc/iUniunXtJfkplAurxBYrBZYww4V9VXtMXsFnQ/rDvBkk4MoMoMiukmmCtGVsYxK4HP9Wzx21P7DlmWWE7t+J/epU4bSjDLvQ13dZvWzjZ71QJ/iW+x6IKk2pb85nQAEP/WnFGj9NfLD3VJdrSL9GameL4aJbqaxBw5S2dRhBT9A4kciKnZuBgQ8FrtYnKvX9SSh2Acr0/znfvQX5pa0=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(46966006)(16526019)(8936002)(47076005)(1076003)(8676002)(4744005)(26005)(186003)(83380400001)(2906002)(54906003)(6916009)(336012)(86362001)(55016002)(7696005)(356005)(36906005)(5660300002)(36860700001)(4326008)(7636003)(316002)(82310400003)(33656002)(70206006)(478600001)(82740400003)(9686003)(426003)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 11:46:35.7786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ad8096-1bb8-4e5f-0a62-08d934aa393a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
Received-SPF: softfail client-ip=40.107.237.80; envelope-from=elic@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Mon, Jun 21, 2021 at 12:16:34PM +0800, Jason Wang wrote:
> Switch to use unsigned int for nvqs since it's not expected to be
> negative.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Eli Cohen <elic@nvidia.com>

> ---
>  include/hw/virtio/vhost.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 21a9a52088..ddd7d3d594 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -71,7 +71,7 @@ struct vhost_dev {
>      int n_tmp_sections;
>      MemoryRegionSection *tmp_sections;
>      struct vhost_virtqueue *vqs;
> -    int nvqs;
> +    unsigned int nvqs;
>      /* the first virtqueue which would be used by this vhost dev */
>      int vq_index;
>      /* if non-zero, minimum required value for max_queues */
> -- 
> 2.25.1
> 

