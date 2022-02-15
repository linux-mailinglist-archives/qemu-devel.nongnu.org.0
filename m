Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A794B74D1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:49:13 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3p2-00063Z-Vw
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nK3bt-0007WN-S9
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:35:38 -0500
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com
 ([40.107.237.75]:22880 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nK3bp-0007TA-U4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:35:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rrwlg194gCP78Z6tDly3s3kG7S0FFn7T4Tdsa7Zc6DFtzGqmu4bO/jSUfGFoTuQSt+XvqJao2tYjWRRrBI+3tTqSMiLphZlmrD0kQhT0MF5/QvfTQmjw0o1wqCKBGzK74jjNMROO55XX+Z7ZREHFSI9Lzw16VYxYy0INFq1In3/V2lrrN/6fSMq0p6mb47yfsabvqIHdlCQsTEGK1iCL+xsGfWDQrQAtVxERs5ER5HeYKGa4Qz5zJMQks41apexcPq+l7n84Hy6KAVGezY58JwaPPk4ZsvNjoZi1pDtJfmP6zLLbb6Vrws45ahsmgElV4c797lX7Qw+kCP//qu/WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0yzDs7J5kZAeWcqRIfVgRhYjdlRtj4vTE4uRMeRv/Q=;
 b=VPs7CUJBg5JF7PmqSye3RqXjQll08YNWDAs/kyDDd1iYjL9LjoFRl5hWoWqrVI8iLq+Gb4IueIvrgYAJEGRsizk6NOeNufZOKLVOtRLxbjhLeebDvcWiGt0fgzhcvFdgFNFFe/z3BVxAyfMs9jL9NXlqOnpfnHOW70YhJRBAI6lmhmnKANDLasfYevFyyUtVH135extX7NKRVgEVjVAh8IyLbAgc/hjsdf1QnqwxkHg+CAP/qNDcYo5mx+b0FAcRiNr7wrs3T9RBRFNlpX9+A4nwxnGh85IOtLnB/b3a7dvVH62b9tm9UPjr1Cyiem54KdbFz53O8KU4PghItEMDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0yzDs7J5kZAeWcqRIfVgRhYjdlRtj4vTE4uRMeRv/Q=;
 b=fjWibu/iUv9+xdZwj0G0z+zrc6tx6JsxH5WFI5Gmod3WJexV5xO/2IzwZV8hxy2+VhemZXVGJiPGFabLzrwCx29aVLbun1NQqs+LEEWvc5R6KZlqMU6O36hlu3axCjOMueeUgRnHHrMgoRfo3Sq6sAhwXH5tk0+/K2Z4zbB3cRs=
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MN2PR02MB7087.namprd02.prod.outlook.com (2603:10b6:208:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 18:57:24 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::d1) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Tue, 15 Feb 2022 18:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 18:57:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 15 Feb 2022 10:57:22 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 15 Feb 2022 10:57:22 -0800
Received: from [10.23.120.154] (port=50678 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nK30r-0001lS-QY; Tue, 15 Feb 2022 10:57:22 -0800
Date: Tue, 15 Feb 2022 18:57:19 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] migration: Remove load_state_old and
 minimum_version_id_old
Message-ID: <20220215185716.e72gp5l3q6gd3upg@debian>
References: <20220215175705.3846411-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220215175705.3846411-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6a4ee4-b740-4967-03eb-08d9f0b500cd
X-MS-TrafficTypeDiagnostic: MN2PR02MB7087:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB7087F3DE1FB33FE4E1F51E81AD349@MN2PR02MB7087.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mixAvMBPJ5srgQyVBgV42nvEaN+bJnC3hqETh9jPPkw0T0+wt4ja9VtU1+AlDZ8jlpbwtJy7MidNKg8Zt/LjemfCPeKhn0QfivcS/Ni1Pwy2/OIemi122wESWrzPqETd7KLh51oDM36kUsu4XmsnfFdpemt3jcIyYDJ7l/2FnKAI4n3wHlCzbgnZHqF9kG5WEp9Lx6N3tevdnrzs/J6fOCgEiQ+ot2pcf1VIhfdOFyVQJrAMz10VtzOXbydQ/+LpReUgLHa5MYKS7ClryStvrgzn/2GMNL2lHv3ZBEs1gHeJvS0+Ou5fS7VpTR4CpBqJL56Bpb6wfHNgJApKT4p33mGTHo7kFSJv0bC08+SQmZ6x7FiqrJXH84OneOZ6oQdNH2RfbISYPacU9pnzN3ZGjxBMxToS8hZ6mXkmCmOQxUgQs7Prkw1QCsr5ZXK3cjkSnnlZlHeGLhwECmRQUfMdqlr5/NNlu38wfKQsmIFurEfTyZbyEO4MIUcyVNBxL88eSgGxOjBiAFm2PbnGs7zGfAZNqysIuPWYriP2xhpz5ovdHjBAqnzGcnal+BA5t8onsPRPEvq7VQREe2MR5cERNEsZWgCjku4vxWHb+3mu5PONL/shisyX+beUIWXmS/hjHa8e3M60w1l7vuC8Gq/BLL75Ml4FTA6WWoe+P6a5/FyuB2CzpAHUx4FJJk6TJNql
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(36860700001)(8936002)(9786002)(4326008)(9576002)(8676002)(70206006)(70586007)(44832011)(82310400004)(47076005)(7636003)(6916009)(356005)(54906003)(316002)(426003)(336012)(26005)(186003)(1076003)(508600001)(83380400001)(40460700003)(33716001)(2906002)(9686003)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 18:57:24.1881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6a4ee4-b740-4967-03eb-08d9f0b500cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7087
Received-SPF: pass client-ip=40.107.237.75; envelope-from=figlesia@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 05:57:05PM +0000, Peter Maydell wrote:
> There are no longer any VMStateDescription structs in the tree which
> use the load_state_old support for custom handling of incoming
> migration from very old QEMU.  Remove the mechanism entirely.
> 
> This includes removing one stray useless setting of
> minimum_version_id_old in a VMStateDescription with no load_state_old
> function, which crept in after the global weeding-out of them in
> commit 17e313406126.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  docs/devel/migration.rst    | 10 ++--------
>  include/migration/vmstate.h |  2 --
>  hw/ssi/xlnx-versal-ospi.c   |  1 -
>  migration/vmstate.c         |  6 ------
>  4 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 24012534827..3e9656d8e0b 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -389,19 +389,13 @@ Each version is associated with a series of fields saved.  The ``save_state`` al
>  the state as the newer version.  But ``load_state`` sometimes is able to
>  load state from an older version.
>  
> -You can see that there are several version fields:
> +You can see that there are two version fields:
>  
>  - ``version_id``: the maximum version_id supported by VMState for that device.
>  - ``minimum_version_id``: the minimum version_id that VMState is able to understand
>    for that device.
> -- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
> -  assign a function that knows how to read this old state. This field is
> -  ignored if there is no ``load_state_old`` handler.
>  
> -VMState is able to read versions from minimum_version_id to
> -version_id.  And the function ``load_state_old()`` (if present) is able to
> -load state from minimum_version_id_old to minimum_version_id.  This
> -function is deprecated and will be removed when no more users are left.
> +VMState is able to read versions from minimum_version_id to version_id.
>  
>  There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
>  e.g.
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 017c03675ca..ad24aa19345 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -181,9 +181,7 @@ struct VMStateDescription {
>      int unmigratable;
>      int version_id;
>      int minimum_version_id;
> -    int minimum_version_id_old;
>      MigrationPriority priority;
> -    LoadStateHandler *load_state_old;
>      int (*pre_load)(void *opaque);
>      int (*post_load)(void *opaque, int version_id);
>      int (*pre_save)(void *opaque);
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index 7ecd148fdf3..c762e0b3679 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1800,7 +1800,6 @@ static const VMStateDescription vmstate_xlnx_versal_ospi = {
>      .name = TYPE_XILINX_VERSAL_OSPI,
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_FIFO8(rx_fifo, XlnxVersalOspi),
>          VMSTATE_FIFO8(tx_fifo, XlnxVersalOspi),
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 05f87cdddc5..36ae8b9e191 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -90,12 +90,6 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
>          return -EINVAL;
>      }
>      if  (version_id < vmsd->minimum_version_id) {
> -        if (vmsd->load_state_old &&
> -            version_id >= vmsd->minimum_version_id_old) {
> -            ret = vmsd->load_state_old(f, opaque, version_id);
> -            trace_vmstate_load_state_end(vmsd->name, "old path", ret);
> -            return ret;
> -        }
>          error_report("%s: incoming version_id %d is too old "
>                       "for local minimum version_id  %d",
>                       vmsd->name, version_id, vmsd->minimum_version_id);
> -- 
> 2.25.1
> 

