Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF37318541
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 07:43:13 +0100 (CET)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5h2-00014l-FY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 01:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA5ee-0000Ra-5t; Thu, 11 Feb 2021 01:40:44 -0500
Received: from mail-bn7nam10on2084.outbound.protection.outlook.com
 ([40.107.92.84]:12086 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA5ea-0003vH-Ua; Thu, 11 Feb 2021 01:40:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofPrRg+nQoc4I3eUNE3A29OpLWAOm0Kn/mBHYEx3KqaanQe34gPhTf0OWUh91Q8YPKh0ZZJIVDEMQj3TJG6NEvbRkt0aligTiBswDCXBRkb8xYzXKVk35kpgk44ZchNdYiHr8CmuFQxBzzNfhKcjkGtTkT7+6etPaDAXQZBh++aFwwtHFjVqbTpre4XB0+n/qdKZ2d3KBz4DYrVRso+Sb4La7A7Y8PFWUgcb3sjj3d8SLxLKhe1RZtoP0uwJUej03O/NXWpB6QlPHxX1iC10K+lMBJMx2Vtu4JyHAaGtDOgE+aS0MbJ9hq//kGmR4/EppEw4BU79jDipQxgEjAFiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvbYtykFZ5QIMa3iAqKlddGDB0Y0k8m+gdFhJhVUJjQ=;
 b=ROAPlHUnm0QlAyeLICEpsIRuMa7n7+jA1OT7W10U+krj0mGrttxYWJkCnTOLC5/h1Ysn+H+kBL+iRg3O1CC4VUgl4uqnwnR2Kc+TNgr4lOFHg86SmbWgxzK0/5WbnowsEf+pfDfJpEjcPwUA7XJAYwzKYeS6CS8ujncktYa4AxOVi6lTIkE4mJhJx+wbxWdy4jre1eKYVexkJqKSKmM74SNcTLB8rUGjLeUNLjHDlGW6qR3kFttMvFz3ZA+NHcU9//JtalGIFLbG8ya0ocGDUqRHJjLJbS0KMLgyzsXWOg1xJ1Eo79wlxBCE5IiZebNwlGw6sLS3jg8dGtroeS5P8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvbYtykFZ5QIMa3iAqKlddGDB0Y0k8m+gdFhJhVUJjQ=;
 b=AOjjS9ffyVo+CijA669SovO+aecUEO5i1Gr0fl6v/diclG0tNhmlELGATqElxBGx3ftHujWw21ZPd1fZKuREFWIIPXy4PSAm4+kux6v15y1rCjLktKJNnFzVjKhgwTP9nNN2bWCWQqSiaZZcWxd/WmlKodKzm7dZyqmF4ypDWgA=
Received: from MN2PR20CA0013.namprd20.prod.outlook.com (2603:10b6:208:e8::26)
 by SA0PR02MB7130.namprd02.prod.outlook.com (2603:10b6:806:ec::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 06:40:36 +0000
Received: from BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:e8:cafe::99) by MN2PR20CA0013.outlook.office365.com
 (2603:10b6:208:e8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 06:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT051.mail.protection.outlook.com (10.152.76.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 06:40:35 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 10 Feb 2021 22:40:35 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 10 Feb 2021 22:40:35 -0800
Received: from [10.140.6.35] (port=49090 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA5eU-0004yF-Pf; Wed, 10 Feb 2021 22:40:35 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 7642E13C063C; Thu, 11 Feb 2021 12:15:57 +0530 (IST)
Date: Thu, 11 Feb 2021 12:15:57 +0530
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 02/11] hw/block/nvme: open code for volatile write
 cache
Message-ID: <20210211064557.GA17907@xhdsaipava40.xilinx.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-3-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210117145341.23310-3-minwoo.im.dev@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec27e0ed-e83c-4dd3-0683-08d8ce57f023
X-MS-TrafficTypeDiagnostic: SA0PR02MB7130:
X-Microsoft-Antispam-PRVS: <SA0PR02MB7130AA79FD3BFCA0DF83FEAACA8C9@SA0PR02MB7130.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYhJsmSfNyhgktpf/jtuLzFg5DH/JgITZalGAsuwpbE2V+o0ACoNXAdWQMjzeExyhgBjCYc3/M/s1KvB2iNM0jPIxt04J/MogHNKbBmOOhYOChuIvE3VgeW2mB1lAMvbkFOKULh4piv2+rSR5YS0rCmbM3H/HpwFgPytsiPPOc9DgY8foW/7xPJ1i1EMoFME0JP0sTatctQ7PAso3wL3+rNZydtXKOU+uKsCkHsscL8iWQUujn7xcgAdAdujxkTobf3Jwg4/SfT1wYXOSe93liLyaPQybLrwll5zPLXWTQRviOUZvGzgx5YllZI5vgCV7Y9WfBwJIEM6UjVYhAePDe+FWaN3Qu7k2qLO8QHMOsaKuu3PwZ9AJ9y72GkS5fSVi4hzlCEBWdJc9cNvDEdz1Zjc2EcORsHIH+Be5nrppgPESFJgRTPrZvW8xTcMnKSWuuGdCXzPz9Aa0SkucN9v3WsD4tCGk4+TirPu3Nkj+07PpTwFCyjxJklniC6g5h5fywsTrJZwvnn55bHs9O287mIBbOz01qHGBTFjeLfYq67PtDjfpOHVf45xBJjWPYG2LdsV2vsmNXrslHzK68//nmXbfYsIuwznMGvsqHw/0QpIoUhxwgMEBmYQcCCm0v5AU0Da3YY46SvsezmC580XSe+pWtXFFd/9QCKUp98jXotbKqkqQfWeHkGWQwBirkMX
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(478600001)(83380400001)(82310400003)(186003)(26005)(7636003)(6916009)(82740400003)(356005)(426003)(8936002)(336012)(33656002)(36860700001)(36906005)(70586007)(70206006)(1076003)(316002)(5660300002)(54906003)(42186006)(8676002)(2906002)(4326008)(6266002)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 06:40:35.7819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec27e0ed-e83c-4dd3-0683-08d8ce57f023
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7130
Received-SPF: pass client-ip=40.107.92.84; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Minwoo,

On Sun, Jan 17, 2021 at 11:53:32PM +0900, Minwoo Im wrote:
> Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
> initial time.  This feature is related to block device backed,  but this
> feature is controlled in controller level via Set/Get Features command.
> 
> This patch removed dependency between nvme and nvme-ns to manage the VWC
> flag value.  Also, it open coded the Get Features for VWC to check all
> namespaces attached to the controller, and if false detected, return
> directly false.
> 
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme-ns.c |  4 ----
>  hw/block/nvme.c    | 15 ++++++++++++---
>  hw/block/nvme.h    |  1 -
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 32662230130b..c403cd36b6bd 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -89,10 +89,6 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>          return -1;
>      }
>  
> -    if (blk_enable_write_cache(ns->blkconf.blk)) {
> -        n->features.vwc = 0x1;
> -    }
> -
>      return 0;
>  }
>  
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index cf0fe28fe6eb..b2a9c48a9d81 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3033,6 +3033,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
>      NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
>      uint16_t iv;
>      NvmeNamespace *ns;
> +    int i;
>  
>      static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
>          [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
> @@ -3108,7 +3109,17 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
>          result = ns->features.err_rec;
>          goto out;
>      case NVME_VOLATILE_WRITE_CACHE:
> -        result = n->features.vwc;
>
> This change breaks the build on ubuntu 16.04, gcc is detecting error
> as below
> ../hw/block/nvme.c: In function ‘nvme_process_sq’:
> ../hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized
> in this function [-Werror=maybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" :
>          "disabled");
>                   ^
>                   ../hw/block/nvme.c:3150:14: note: ‘result’ was
>                   declared here
>                        uint32_t result;
>                                      ^
>GCC version  5.4.0.
>Tested initilizing result variable, build looks good then.
>
>Regards,
>Sai Pavan
>
> +        for (i = 1; i <= n->num_namespaces; i++) {
> +            ns = nvme_ns(n, i);
> +            if (!ns) {
> +                continue;
> +            }
> +
> +            result = blk_enable_write_cache(ns->blkconf.blk);
> +            if (!result) {
> +                break;
> +            }
> +        }
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          goto out;
>      case NVME_ASYNCHRONOUS_EVENT_CONF:
> @@ -3271,8 +3282,6 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
>          ns->features.err_rec = dw11;
>          break;
>      case NVME_VOLATILE_WRITE_CACHE:
> -        n->features.vwc = dw11 & 0x1;
> -
>          for (i = 1; i <= n->num_namespaces; i++) {
>              ns = nvme_ns(n, i);
>              if (!ns) {
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index b7fbcca39d9f..5ba83ee77841 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -117,7 +117,6 @@ typedef struct NvmeFeatureVal {
>          uint16_t temp_thresh_low;
>      };
>      uint32_t    async_config;
> -    uint32_t    vwc;
>  } NvmeFeatureVal;
>  
>  typedef struct NvmeCtrl {
> -- 
> 2.17.1
> 
> 

