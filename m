Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F65C3B277F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:39:01 +0200 (CEST)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJ0u-0007yl-MB
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwIzS-0007IY-FD
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:37:30 -0400
Received: from mail-mw2nam12on2060.outbound.protection.outlook.com
 ([40.107.244.60]:51105 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwIzP-0007wI-R4
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:37:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/rcudoWV2zziQ98DbgGS5mzVYMzDKNKgb/kRcOOPssH+uUqPikHD7JbnJ2DxK7VMabK45RrVIe2ZG4lfRVGNYePAiP2BlUNupeqz7JGTQTcJNteDh9x6htfIKIjnabeT/F5TMf+lyCHAwigRVjtuU8p3vpRV3KmR3YiAakfSL5VMlaaRT2RUWY2E2raDYh3iRyyNe7Rqq1Gzum1MAV7O6uq6QaXCuJRp5jhdcPfBrhEWIy5ZWoypcDhEbxY1CBbh1rDXMnHFPJLzX7C+WCAxtbPHSjUCjip60+WUxlMM7aryUk/FQVbWV6lSoPmt/VM4BTNKUv/63pF0kIIQ/iMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO2ecd4VC45qgqkZOTtsXVOvqS/6EuN3RQe7HFUw6WY=;
 b=Fat3+C8SFDyGcSxN0nODPo3GZKTlfQNp2t4YTjkbWz6wpjdbf2HX/AIcNE9r5Qml8GMGx61+kQVjeuUznIJ8qamy2VHL+HnvdfC8ZoIsKsj9YwBuiUOhKa63QXokWyzEfZKIc403WUX5KcJ/kzsFap09gWKI9ZUOtaf4xNiur9QAjaqDhNpaJkX0RA3/Qey17LT26vEqTFlmRFmPH56oLmQLklOs5DjmH30hiB4a+c0rJe4Fdgrsk53BngM3UZCAIBzlx3NoMgGjKmabpgvQLXci66oClNgMx5rUp6J1ggwdawUDIrOQuLGlwoHPcWoFSj5TvknFF2nzBplF03yH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO2ecd4VC45qgqkZOTtsXVOvqS/6EuN3RQe7HFUw6WY=;
 b=d4QDLOI8zBOeyDgtzUCMBYs9M1oA92oifAXL6OPP0Vh/yx0cO8UCNrUJgDbXy1iej9hrXZ/4uTpJqW16CQ//yZenzqjzHExuaerK+vh9gs4bQVjOIAW2p14pAP/UmROzOHTZ6HA/bD9fRYjP10XD5jF8n5lTxnPqV5YGBfP27/3JGzXc8pglIIEFZU6t2+hq1YgMQLNPD1bM7gonZaxJpDt6bo5RdhHJslqTMmogaqfBEh4tIrXZogquEZHg6xc2OP0lMk9u+7SmhtIc+oO7MZqJARePhF9EgdBDXsF46qFMHP0+TVp3ticduyHxXXHFvtJ/UVuNF0mbCoFsvhWaoA==
Received: from BN6PR11CA0068.namprd11.prod.outlook.com (2603:10b6:404:f7::30)
 by MW2PR12MB2556.namprd12.prod.outlook.com (2603:10b6:907:a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 24 Jun
 2021 06:22:21 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::6e) by BN6PR11CA0068.outlook.office365.com
 (2603:10b6:404:f7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 06:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 06:22:20 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 06:22:18 +0000
Date: Thu, 24 Jun 2021 09:22:14 +0300
From: Eli Cohen <elic@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 03/18] vhost_net: do not assume nvqs is always 2
Message-ID: <20210624062214.GA38401@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210621041650.5826-4-jasowang@redhat.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eedc0cb3-ac69-448c-82fe-08d936d86c5b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2556:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2556BB106C30D4AB65F4589CAB079@MW2PR12MB2556.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6jeuXzDK5c7ufkfKCY/U1lngnjwUtm7NESyftJDnFUg2rhVFkqM8PS0/6B1xKtfVeKsKYylYH9eFT7JCJPNky7furGphnuNLSwH8Rc2ap/GfM55pn29fgGd2YFkrHDgBrs9cmWrgJZU0v2DjdtNJ6/gehzSXNuL5Z0oxoC1DasIvHLXf6iG/ii9XMzmjT7sApzroGSkut4gKPncnzxHf4RfTgx2LWsb0jENlOmWDvODQzFU554Pv2Q2V3nCA9U+Kg58J5El+r+Xb37WNqBH6fCDTxzlNGtccFhqE4rbFxsoQGlhjmb3AtVHAmelWWvdkySYQtZvVraEwbGwzw0jBJ8vPG6LgQK4D/tNVQe/RL3C0pup51TCT+E3ofCKzRbYT+6l0mtYbwHcUNbxmFjGttcL3KBNSAaTpW4bwZPMDrB9IDnMR9b9gN3ICnXV0vUYqTCLIShzU6I+SmvVVCIvKAUKm3XQntLpvEIS+nRE8moiL7ZNX/+Cy3uZ7w0qaWJFNsucPRRJsW4Zpj6iCGsR88yeB6Ht3qtCePB31FvpHVToCxE09QWga69zyWM3q9xaTG7rjyb0uB6c+EBU9Do8bg9l9VbqD13c882frHGhOnniRauGacPHbw/Z0kRKrx5hDYIeVrf5Tr9EGWqfZ8oCtZA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(54906003)(7696005)(86362001)(2906002)(70586007)(70206006)(316002)(6666004)(5660300002)(36906005)(6916009)(1076003)(36860700001)(336012)(26005)(478600001)(4326008)(82310400003)(8936002)(8676002)(426003)(47076005)(55016002)(9686003)(16526019)(82740400003)(33656002)(83380400001)(7636003)(356005)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 06:22:20.6719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eedc0cb3-ac69-448c-82fe-08d936d86c5b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2556
Received-SPF: softfail client-ip=40.107.244.60; envelope-from=elic@nvidia.com;
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:16:35PM +0800, Jason Wang wrote:
> This patch switches to initialize dev.nvqs from the VhostNetOptions
> instead of assuming it was 2. This is useful for implementing control
> virtqueue support which will be a single vhost_net structure with a
> single cvq.

Maybe worth mentioning in the changelog that nvqs is still set to 2 for
all users and this patch does not change functionality.

Reviewed-by: Eli Cohen <elic@nvidia.com>

> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/vhost_net.c      | 2 +-
>  include/net/vhost_net.h | 1 +
>  net/tap.c               | 1 +
>  net/vhost-user.c        | 1 +
>  net/vhost-vdpa.c        | 1 +
>  5 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 6bd4184f96..ef1370bd92 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -163,9 +163,9 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
>          goto fail;
>      }
>      net->nc = options->net_backend;
> +    net->dev.nvqs = options->nvqs;
>  
>      net->dev.max_queues = 1;
> -    net->dev.nvqs = 2;
>      net->dev.vqs = net->vqs;
>  
>      if (backend_kernel) {
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 172b0051d8..fba40cf695 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -14,6 +14,7 @@ typedef struct VhostNetOptions {
>      VhostBackendType backend_type;
>      NetClientState *net_backend;
>      uint32_t busyloop_timeout;
> +    unsigned int nvqs;
>      void *opaque;
>  } VhostNetOptions;
>  
> diff --git a/net/tap.c b/net/tap.c
> index f5686bbf77..f716be3e3f 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -749,6 +749,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>              qemu_set_nonblock(vhostfd);
>          }
>          options.opaque = (void *)(uintptr_t)vhostfd;
> +        options.nvqs = 2;
>  
>          s->vhost_net = vhost_net_init(&options);
>          if (!s->vhost_net) {
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index ffbd94d944..b93918c5a4 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -85,6 +85,7 @@ static int vhost_user_start(int queues, NetClientState *ncs[],
>          options.net_backend = ncs[i];
>          options.opaque      = be;
>          options.busyloop_timeout = 0;
> +        options.nvqs = 2;
>          net = vhost_net_init(&options);
>          if (!net) {
>              error_report("failed to init vhost_net for queue %d", i);
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 19187dce8c..18b45ad777 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -105,6 +105,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>      options.net_backend = ncs;
>      options.opaque      = be;
>      options.busyloop_timeout = 0;
> +    options.nvqs = 2;
>  
>      net = vhost_net_init(&options);
>      if (!net) {
> -- 
> 2.25.1
> 

