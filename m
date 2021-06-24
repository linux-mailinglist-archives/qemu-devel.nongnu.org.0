Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373B3B299A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:43:58 +0200 (CEST)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwK1l-0006xc-Iu
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwK0L-0005QE-Iw
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:42:29 -0400
Received: from mail-dm6nam10on2057.outbound.protection.outlook.com
 ([40.107.93.57]:10720 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1lwK0I-0001wm-NS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:42:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSATDSc3r/oFPe9Jr83hjSO0D+n+NMXPkDc6x5kbNxt3HcPir4COpusE2a8YQlKt5Qn/X2dQHs6+wTQJzldgt3We/jY9ENfVd44LvHE3YzFOFsNej5Io6QyNsYljX2BOrdQMkfsjJeeFL0i4KnscdwYVHET2vlm0h4rHUNTcuUYyDGAf2o0ALIaCDVpNBaRtGYeXexMJpNsnDFb6LB3m9+tKWaX98cozP1LFQ2W4K3hqLioUk28bsVaT9UIMAe8TdOGxZqG2OEtOKw6wPh7lHYSm10Ec7BNhcxcAq0EdtVSvEm0vlzBBXV4USvADpIV4H6M4ntgI4Ub3F7bqtQevhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxg3JErzpqanynQrMV6ibqbORXlI2Yvrjz2ZSt5xfok=;
 b=ACavhZ7nvpWj2K2e3wBgidBuNEPoZFPqsBenjvN9ugMRYG+ufiWRWWh9NA/XDRfQFS9ZrPxHyH22OkHbEIe4pPnrqWRd31FHNBZ0QnSUeUgHY8BbjaJjD3ZlziM0x4fDqdF9r+caVVsknSnNGb6BjIvQvgjLAfj+NThIyXZN9VGXjpTLb1mCZtZYZMaAQR8FjCiZUow3r30Mh4kfqKTq+4hE8gnUM0mYyg8xjd+9R6Moj9Ho2+lYR8DUZs+RSAMkipv3hf1lPyJpC74Cu8k1aD1/2bcCS0qTifSGGjfkzZ/wlGgtvXX6f1rYFlok/BPUlQ3ifUtNh+M+wmVuhiYOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxg3JErzpqanynQrMV6ibqbORXlI2Yvrjz2ZSt5xfok=;
 b=L8RWeWJ+m3uCvk59KZbdNDOOdzeRlb+57e2PIIlKYs7SRQlGONTnWQXSYigd3Tep2LzjeakMmpGWdczAHoiLnKJPjXZAyqF2387FOgxVznOWOnEdkTMI480surC7Cgy31st42o/lFl37VD8lUaz3nD+c07sT6ZYX5KRomwviPYPJ/KhHS512n0w75L4Djo+YTDT3tloeCSpKYf80k314zVGGp1NnrPtq7KLtNq9Q98SKgDMiwSLNPLIxiq/xTfguxJKbquCeKj/QV+OyOE7LhLdph6Ri9hgvTTCtBf8S/TpKkf0BUtSUOIOYtUY+jYSGBch60s/5sQKHtR1JAO33cQ==
Received: from CO2PR04CA0069.namprd04.prod.outlook.com (2603:10b6:102:1::37)
 by MWHPR12MB1869.namprd12.prod.outlook.com (2603:10b6:300:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 07:42:23 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::9c) by CO2PR04CA0069.outlook.office365.com
 (2603:10b6:102:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 07:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:42:23 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 07:42:20 +0000
Date: Thu, 24 Jun 2021 10:42:17 +0300
From: Eli Cohen <elic@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 15/18] vhost-net: control virtqueue support
Message-ID: <20210624074217.GB42206@mtl-vdi-166.wap.labs.mlnx>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-16-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210621041650.5826-16-jasowang@redhat.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 628d6c49-4c60-4300-c54e-08d936e39b09
X-MS-TrafficTypeDiagnostic: MWHPR12MB1869:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1869F4182C941C4CF8FFEDFAAB079@MWHPR12MB1869.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82jbbtG8f9Ge3lCDBLEq9+IGnn2wfyeH1rMZ4FLB+zyiGTc41LmI2R6QEvzXlSzXNVNMwTw2Zx9kV7EKsztomDIkpn4VO6bSE9Pswd34oYQ19h+RYVOoWceRxnupT0214dArckB+6K1Y0sXjPCaMlkkVTwYGQBgL/jTSg5Lj5tLpRP1S9zzAymkNOpZdptGdzJvtFnHec6D9IePZ3OJ02y8MTG3RuKBQeHBp/L44ZjoyGiej78l5ZpQjlLU0huN+LPOGAdZ86tR5yQR7IsRLvelHxGIgaoSYgXvTIEQ9n5CaEK+kwrKvVIHlyWdZ0Lz1Omu3kqZyVQWr1DKhyISfh2xLksp7H+Y4rx/j+9hW4wmUvqJ40K4sMditFprg1FlLNLKCe3LFh41/4Z77fuzVmX0psDkX5PZkemOyrhgm8f/GvuEwVbmENPA+9u1OpboOGd0Ut+3ayB9ByQ+Ni3wvcfZRBaaLb6G25VoqdFXv29S1++BDvgFv2EeS9nFbOTCWjdsW6FUNvBgbGlXVx1uIbtDtzXOci7olojRlKxANPshyydBnanM6oeXtJCO27txBDfJhmZllf9QPD+oM4RVU8MNScf8fNNVfxzyCRAPBLtLnmvNXj/IddWL+AFqXwpFiEZJcWWA7fyhEOmnWZ0T30IT6pHzCm+XTh7PTUM0xP9JCxlHWkVaFVgRmE41qlP2+0ILctjgp2MDMWo/jJVpnNg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(46966006)(5660300002)(7696005)(82740400003)(316002)(6916009)(6666004)(70206006)(8936002)(336012)(4326008)(8676002)(426003)(70586007)(1076003)(36906005)(2906002)(33656002)(82310400003)(86362001)(7636003)(36860700001)(16526019)(186003)(26005)(54906003)(47076005)(9686003)(55016002)(356005)(478600001)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:42:23.5061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 628d6c49-4c60-4300-c54e-08d936e39b09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1869
Received-SPF: softfail client-ip=40.107.93.57; envelope-from=elic@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Mon, Jun 21, 2021 at 12:16:47PM +0800, Jason Wang wrote:
> We assume there's no cvq in the past, this is not true when we need
> control virtqueue support for vhost-user backends. So this patch
> implements the control virtqueue support for vhost-net. As datapath,
> the control virtqueue is also required to be coupled with the
> NetClientState. The vhost_net_start/stop() are tweaked to accept the
> number of datapath queue pairs plus the the number of control
> virtqueue for us to start and stop the vhost device.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
>  hw/net/virtio-net.c     |  4 ++--
>  include/net/vhost_net.h |  6 ++++--
>  3 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ef1370bd92..fe2fd7e3d5 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -311,11 +311,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
>  }
>  
>  int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> -                    int total_queues)
> +                    int data_qps, int cvq)
>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>      VirtioBusState *vbus = VIRTIO_BUS(qbus);
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
> +    int total_notifiers = data_qps * 2 + cvq;
> +    VirtIONet *n = VIRTIO_NET(dev);
> +    int nvhosts = data_qps + cvq;
>      struct vhost_net *net;
>      int r, e, i;
>      NetClientState *peer;
> @@ -325,9 +328,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>          return -ENOSYS;
>      }
>  
> -    for (i = 0; i < total_queues; i++) {
> +    for (i = 0; i < nvhosts; i++) {
> +
> +        if (i < data_qps) {
> +            peer = qemu_get_peer(ncs, i);
> +        } else { /* Control Virtqueue */
> +            peer = qemu_get_peer(ncs, n->max_qps);
> +        }
>  
> -        peer = qemu_get_peer(ncs, i);
>          net = get_vhost_net(peer);
>          vhost_net_set_vq_index(net, i * 2);
>  
> @@ -340,14 +348,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>          }
>       }
>  
> -    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
> +    r = k->set_guest_notifiers(qbus->parent, total_notifiers, true);
>      if (r < 0) {
>          error_report("Error binding guest notifier: %d", -r);
>          goto err;
>      }
>  
> -    for (i = 0; i < total_queues; i++) {
> -        peer = qemu_get_peer(ncs, i);
> +    for (i = 0; i < nvhosts; i++) {
> +        if (i < data_qps) {
> +            peer = qemu_get_peer(ncs, i);
> +        } else {
> +            peer = qemu_get_peer(ncs, n->max_qps);
> +        }
>          r = vhost_net_start_one(get_vhost_net(peer), dev);
>  
>          if (r < 0) {
> @@ -371,7 +383,7 @@ err_start:
>          peer = qemu_get_peer(ncs , i);
>          vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
> -    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
> +    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (e < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>          fflush(stderr);
> @@ -381,18 +393,27 @@ err:
>  }
>  
>  void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> -                    int total_queues)
> +                    int data_qps, int cvq)
>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>      VirtioBusState *vbus = VIRTIO_BUS(qbus);
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
> +    VirtIONet *n = VIRTIO_NET(dev);
> +    NetClientState *peer;
> +    int total_notifiers = data_qps * 2 + cvq;
> +    int nvhosts = data_qps + cvq;
>      int i, r;
>  
> -    for (i = 0; i < total_queues; i++) {
> -        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
> +    for (i = 0; i < nvhosts; i++) {
> +        if (i < data_qps) {
> +            peer = qemu_get_peer(ncs, i);
> +        } else {
> +            peer = qemu_get_peer(ncs, n->max_qps);
> +        }
> +        vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
>  
> -    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
> +    r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (r < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
>          fflush(stderr);
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index bd7958b9f0..614660274c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>          }
>  
>          n->vhost_started = 1;
> -        r = vhost_net_start(vdev, n->nic->ncs, queues);
> +        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
>          if (r < 0) {
>              error_report("unable to start vhost net: %d: "
>                           "falling back on userspace virtio", -r);
>              n->vhost_started = 0;
>          }
>      } else {
> -        vhost_net_stop(vdev, n->nic->ncs, queues);
> +        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
>          n->vhost_started = 0;
>      }
>  }
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index fba40cf695..e656e38af9 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
>  uint64_t vhost_net_get_max_queues(VHostNetState *net);
>  struct vhost_net *vhost_net_init(VhostNetOptions *options);
>  
> -int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
> -void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
This breaks compilation of hw/net/vhost_net-stub.c

> +int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> +                    int data_qps, int cvq);
> +void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> +                    int data_qps, int cvq);
>  
>  void vhost_net_cleanup(VHostNetState *net);
>  
> -- 
> 2.25.1
> 

