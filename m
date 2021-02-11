Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7331859A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 08:17:09 +0100 (CET)
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA6Ds-00074E-As
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 02:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA5rC-0005Jz-7s; Thu, 11 Feb 2021 01:53:42 -0500
Received: from mail-dm6nam12on2086.outbound.protection.outlook.com
 ([40.107.243.86]:47232 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA5r9-0002CH-Ek; Thu, 11 Feb 2021 01:53:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BohoKk0e4AESeyHvFMWlOEMQMrHfNmpJUjb2pJrzStXlPOP2xVAbSAUvQ9EzVrZq9a8LhqkKIKJtwHMhOxk1FUEMlDVuRNgZgr/HdmpxnSMM9s1ZZmYTSAvb8P3fuuxtD0tiJ20ALUZDCh30fV9MvbVf+sNog/5TRYKDPFLD9SDwinSf7z6d7K1EUgplt06nJF+mqZsU+JJJaP1d5ban1pSeKQmXfCUw/mhKZCQMgzs8FY71seO17xfYGlDodSk31qVBcahM3wD8TPw9uedUV1RwCTS34EWWeeTamkohcF9gpl2lwBtaHwhRNg/9XP1EPZcnidJc0rNiWLOrp/uDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOQ1zkiz/nrW0OB0CUz7v0D50biFsLChcFcUD0DakIE=;
 b=fm9G6arJ3RofRMdnsJMI8zaGkWvkgrj8AS2MxH4k9fZiNnpv5yrobdFX7o8/rj4FsyRTAZmeyTblCd8Pp0zj7QE1ZhZli2TuWusc6jPQp53bVy9rKBoAzDhy8DmUDxmgJwgne4Z2Q5omM9COldaL8JtQ9S9zJfNCJjPSLNM4grjveRABw5fOuEB4CRH1/NYSk4kgYFMNmvH2st8MOVmz2n2VexdVmBd6V/W7WAlNIf++8Qz917/NnCF38thcmrr+lq/l26SjK5g4ewJJKpdNrtGL3i79/JJxTiJ/Zdvr758fQqC8Iszsi7WUX9L/tYf+XQpCTSN+h+eFHV8v5qHjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOQ1zkiz/nrW0OB0CUz7v0D50biFsLChcFcUD0DakIE=;
 b=WHRA1pmJIqJEwVMaEhX9CiJ88z2hb5xRfDob3fohSlLNjCitulpHnAf1xt6w9pRUxErOieeU7AuUbSDrym7fOl7ZYGuMGv/tp/yfYpcISiGv8IvEzkJYUmx/A27m7vDtJX2+JfKh/FctgIRa3T3C2yU2TcH8nrlV9qh8sFmi+rY=
Received: from SN4PR0601CA0012.namprd06.prod.outlook.com
 (2603:10b6:803:2f::22) by BYAPR02MB4582.namprd02.prod.outlook.com
 (2603:10b6:a03:58::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Thu, 11 Feb
 2021 06:53:36 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2f:cafe::3e) by SN4PR0601CA0012.outlook.office365.com
 (2603:10b6:803:2f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 06:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 06:53:35 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 10 Feb 2021 22:53:34 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 10 Feb 2021 22:53:34 -0800
Received: from [10.140.6.35] (port=49196 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA5r4-0006Es-BF; Wed, 10 Feb 2021 22:53:34 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 02AC113C063C; Thu, 11 Feb 2021 12:28:56 +0530 (IST)
Date: Thu, 11 Feb 2021 12:28:56 +0530
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 02/11] hw/block/nvme: open code for volatile write
 cache
Message-ID: <20210211065856.GA5604@xhdsaipava40.xilinx.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-3-minwoo.im.dev@gmail.com>
 <20210211064557.GA17907@xhdsaipava40.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210211064557.GA17907@xhdsaipava40.xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd2ea8cd-155f-49c4-0f45-08d8ce59c0de
X-MS-TrafficTypeDiagnostic: BYAPR02MB4582:
X-Microsoft-Antispam-PRVS: <BYAPR02MB458283B8B5D67BC7C7688D49CA8C9@BYAPR02MB4582.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Zl2T+QR0HWsYFzOeDeQu2zNMmZzP34JxsH7Xhwg2bEulePk5hHmCkJaC2K9iVnBXk/xfEihjgYIcOt8MerMqfaNoHZGLVffL8Gx2YaM7vXtBIKfHqmkq4KTjOolTHUoYeqbM2eARJJWIfEWF/+QGgDHQA0DLa83S6BlFt4PV6O5y/qeluNcOxZxgupbpaxdMlO9/okqhk/3jgXWzRp+Bb1b33t9qNFfh2RNIlGrGZj0ajZ4loTjNT9cRbqiGx1D6cvjuu3i0Vgiupnc+X9ZvS8oAnODn2F22wP4utL/vZyk2KbxsFRzFCxS9lshVtap5x5j0/mc/7NOX3ji0WgECSI3ckQxjeMoeWKgrrSe4zsCSbqrVigaEUJlAU13xklgO1tiJQev/ZuDdrgGKqqUSGNTWEIY8S2jhPqT8KceIkXlc1gqQpvCzBIoNH1YrXdvu2HQZekUSqUQ8nsF8StrFK0xNP6kaAMcOXnciVL3y+zqKu/oJPfqRsFMu+xslUaqQQImtTe944ousv26wK1mDKRscHo9sLGKa1ATR5YfgFtnzIksOhaeNMQqwCeKTOIdMoxiRILG+D1X3kYwpHjagsbLy38Ps+EuIfHDE5zkIhV+oy12BZDD9j+OAoUXM631WZWabj35cK+DqAE3fyKtQlDJlJcQe1VGO9V+IjM4INAd5dBII4JuaQ74Ypv8qIaV
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(36840700001)(46966006)(54906003)(7636003)(356005)(4326008)(8936002)(186003)(6266002)(70206006)(26005)(70586007)(82310400003)(6916009)(83380400001)(82740400003)(2906002)(1076003)(426003)(336012)(33656002)(36860700001)(42186006)(5660300002)(36906005)(8676002)(316002)(478600001)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 06:53:35.5305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2ea8cd-155f-49c4-0f45-08d8ce59c0de
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4582
Received-SPF: pass client-ip=40.107.243.86; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

Please ignore this mail, I see a fix already floating around in the list.

Regards,
Sai Pavan
On Thu, Feb 11, 2021 at 12:15:57PM +0530, Sai Pavan Boddu wrote:
> Hi Minwoo,
> 
> On Sun, Jan 17, 2021 at 11:53:32PM +0900, Minwoo Im wrote:
> > Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
> > initial time.  This feature is related to block device backed,  but this
> > feature is controlled in controller level via Set/Get Features command.
> > 
> > This patch removed dependency between nvme and nvme-ns to manage the VWC
> > flag value.  Also, it open coded the Get Features for VWC to check all
> > namespaces attached to the controller, and if false detected, return
> > directly false.
> > 
> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > ---
> >  hw/block/nvme-ns.c |  4 ----
> >  hw/block/nvme.c    | 15 ++++++++++++---
> >  hw/block/nvme.h    |  1 -
> >  3 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> > index 32662230130b..c403cd36b6bd 100644
> > --- a/hw/block/nvme-ns.c
> > +++ b/hw/block/nvme-ns.c
> > @@ -89,10 +89,6 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
> >          return -1;
> >      }
> >  
> > -    if (blk_enable_write_cache(ns->blkconf.blk)) {
> > -        n->features.vwc = 0x1;
> > -    }
> > -
> >      return 0;
> >  }
> >  
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index cf0fe28fe6eb..b2a9c48a9d81 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -3033,6 +3033,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
> >      NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
> >      uint16_t iv;
> >      NvmeNamespace *ns;
> > +    int i;
> >  
> >      static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
> >          [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
> > @@ -3108,7 +3109,17 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
> >          result = ns->features.err_rec;
> >          goto out;
> >      case NVME_VOLATILE_WRITE_CACHE:
> > -        result = n->features.vwc;
> >
> > This change breaks the build on ubuntu 16.04, gcc is detecting error
> > as below
> > ../hw/block/nvme.c: In function ‘nvme_process_sq’:
> > ../hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized
> > in this function [-Werror=maybe-uninitialized]
> >          trace_pci_nvme_getfeat_vwcache(result ? "enabled" :
> >          "disabled");
> >                   ^
> >                   ../hw/block/nvme.c:3150:14: note: ‘result’ was
> >                   declared here
> >                        uint32_t result;
> >                                      ^
> >GCC version  5.4.0.
> >Tested initilizing result variable, build looks good then.
> >
> >Regards,
> >Sai Pavan
> >
> > +        for (i = 1; i <= n->num_namespaces; i++) {
> > +            ns = nvme_ns(n, i);
> > +            if (!ns) {
> > +                continue;
> > +            }
> > +
> > +            result = blk_enable_write_cache(ns->blkconf.blk);
> > +            if (!result) {
> > +                break;
> > +            }
> > +        }
> >          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
> >          goto out;
> >      case NVME_ASYNCHRONOUS_EVENT_CONF:
> > @@ -3271,8 +3282,6 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
> >          ns->features.err_rec = dw11;
> >          break;
> >      case NVME_VOLATILE_WRITE_CACHE:
> > -        n->features.vwc = dw11 & 0x1;
> > -
> >          for (i = 1; i <= n->num_namespaces; i++) {
> >              ns = nvme_ns(n, i);
> >              if (!ns) {
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index b7fbcca39d9f..5ba83ee77841 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -117,7 +117,6 @@ typedef struct NvmeFeatureVal {
> >          uint16_t temp_thresh_low;
> >      };
> >      uint32_t    async_config;
> > -    uint32_t    vwc;
> >  } NvmeFeatureVal;
> >  
> >  typedef struct NvmeCtrl {
> > -- 
> > 2.17.1
> > 
> > 
> 

