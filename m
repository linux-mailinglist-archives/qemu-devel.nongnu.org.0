Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120B474111
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:04:42 +0100 (CET)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5bs-0006jg-V6
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:04:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5Zc-0005KX-5n
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:02:20 -0500
Received: from mail-dm6nam11on2063.outbound.protection.outlook.com
 ([40.107.223.63]:63367 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5ZZ-0006qp-GU
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:02:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gap6TGpCes1PPYmnqYVKgETcY2uB6Sq/jCgW+N+fEqXuxKdit0ZBN/cfj8JanxglgafDEJNb6byqSjNkLRU7Pyw/PwR4RSXDme31Dzt5UtY8X6wHSnROBsauypYtogndyjxRXzR9fqXdiskaIlmvv7abpymRxj5UUQQZquBpJ0dBi+uYmNyRcwKozkznYlAoIxYj9vCNt33+/vwjns956pxLhAFh6q5YGYnusHFd7RfmrhRDqndaYvlI8hQPRI2eDl5E1fmirDGvZ3o0EKM1U7XLQtChhh5OKRs4xlqZ+f08FzFDBVLgj8taAakr1yLM8EtEHD7Eq8Bw1dl/XDYMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O5MuFN6t0+teVtPQEYKwHbdhvI9zeZnVpiyXX/TG0o=;
 b=jAvdeT2FzTgGO+WHPyFWawEhVNIBAKAVEbZIVAVs4VgYxFAmuLdiJfnOJGi3JQDgyhKt4ooUORQD9XA5yuDIJbNOP8tPqeLOJDR7XASxXJMtZuulIYHH1tQOSwq1XAEpNv5r53Sbs44kWQooauUtz7n/uTGQ8gSz1CfDQjCZvJ9UYXrf9EFGoPZF7fZ2i8QuaPnC2tuKZ2TovoA8c4gitnnKu8s0kJVbDRM69TfhHGkLl0DEeY6ZfUemgm1H3YZIquzqAbotyUjRM77SqSlC5HpTmKeXFp7YdlbsZDBXPjbB8KHpAcXjuBsl9W1ov9c5Box7Es2/enogGZ6p5EaUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O5MuFN6t0+teVtPQEYKwHbdhvI9zeZnVpiyXX/TG0o=;
 b=sQHltdIXzjclFBLOt3E1+CaBDZzaTqCHKswKlhkKka7pcxRYzM4nH55/Tw5uLJcE7ztONfbW2VwC6lbyl/OPn7MTsxGBz6mFNh3lVkE+tt47dHMqrQcmkNWZqky0IvYgdt0fo/RQp2NX6aorWivi7FnKeudNSZpcrNiSwXjCaY8=
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by DM5PR02MB3686.namprd02.prod.outlook.com (2603:10b6:4:b2::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 11:02:11 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::e3) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Tue, 14 Dec 2021 11:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:02:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:02:10 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:02:10 -0800
Received: from [10.23.120.191] (port=54364 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5ZR-000EYg-SA; Tue, 14 Dec 2021 03:02:10 -0800
Date: Tue, 14 Dec 2021 11:02:07 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 02/11] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Message-ID: <20211214110206.y2bhpc23q4cnxdks@debian>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-3-francisco.iglesias@xilinx.com>
 <CAFEAcA9qPCqZZCpnkFXe-b4pY8rsQq=pe5k99btS0ALo_FtwhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9qPCqZZCpnkFXe-b4pY8rsQq=pe5k99btS0ALo_FtwhQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36e24cf5-a024-4dc2-60e2-08d9bef12d90
X-MS-TrafficTypeDiagnostic: DM5PR02MB3686:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB36869ED2A9288079B67877A2AD759@DM5PR02MB3686.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpxCqyGbmah7wqm5Qpinf0pbw6M0/GiQa7prZ2DiTnoRFKxqwjY9X9NL/PXjDYJZt6Ab+WOytL+ERJGudsyJO5QCDGJWtyGwHN1bvyyTy2hm6M7De3FYGhW/Rfo9wBREGoju0DqTdnpQxFxw67M/7T9wi9b6fkvaV/ukfSZqDxEw0nSOCMIQ+H0hwJk8HzsI3AHdxSNQuzMy4MaIH3khlsyI3PpFCNTqXZSrasRJ/iZE7HWb5egYmnVIv2TZAPpUVuVqo/4wCOcEittP4CsGjoJRLus9AtSRB93vyuG1s67Kz1O7pIbN5Y9zdAqOt3miXhwGrdq8wQtQr4LOXAbhNtl9Jc2foF/CHA59iEvFUe9dcFDTuTcM5fKqrKjaXjVEYlm80+98vFpQW/aRkFjqJcSc2e8EfNwXsNnzUbPANUYl6FCp+cXRXvmRZ6qHbPW12y9ZtlrepPhDjWp+xlPFTX4pYIRwVcivFVgI32e6pXIAHJqJrCWOpOFkKw+O/nZ9kIOffAtFA4EpT0UQ4jbMBPxDcQ70FMlfM1IZqnLfkC8v+NAoovDZk1hWy8vagcDKvFpPqqKsnkLCTZ7382RWFF6l7D2+lX4Z0STQTM7rApsuREEV2F5R0ZFEDD47b/dN+skHmc91iYiU1InKR+XEqq4Viw8OEXVkg22wzgnweDOZgakC5lV9iWoNX72G/07H/Fi4iduyt3cTsw83uw7poA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(8936002)(7636003)(316002)(356005)(54906003)(5660300002)(82310400004)(1076003)(47076005)(9576002)(9786002)(36860700001)(426003)(336012)(2906002)(186003)(6916009)(8676002)(44832011)(508600001)(9686003)(4326008)(26005)(70586007)(70206006)(6666004)(33716001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:02:10.9530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e24cf5-a024-4dc2-60e2-08d9bef12d90
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3686
Received-SPF: pass client-ip=40.107.223.63; envelope-from=figlesia@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 03:16:59PM +0000, Peter Maydell wrote:
> On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Connect Versal's PMC SLCR (system-level control registers) model.
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> > index 895ba12c61..729c093dfc 100644
> > --- a/include/hw/arm/xlnx-versal.h
> > +++ b/include/hw/arm/xlnx-versal.h
> > @@ -26,6 +26,7 @@
> >  #include "hw/misc/xlnx-versal-xramc.h"
> >  #include "hw/nvram/xlnx-bbram.h"
> >  #include "hw/nvram/xlnx-versal-efuse.h"
> > +#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
> >
> >  #define TYPE_XLNX_VERSAL "xlnx-versal"
> >  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> > @@ -78,6 +79,7 @@ struct Versal {
> >      struct {
> >          struct {
> >              SDHCIState sd[XLNX_VERSAL_NR_SDS];
> > +            XlnxVersalPmcIouSlcr slcr;
> >          } iou;
> >
> >          XlnxZynqMPRTC rtc;
> > @@ -113,6 +115,7 @@ struct Versal {
> >  #define VERSAL_XRAM_IRQ_0          79
> >  #define VERSAL_BBRAM_APB_IRQ_0     121
> >  #define VERSAL_RTC_APB_ERR_IRQ     121
> > +#define VERSAL_PMC_IOU_SLCR_IRQ    121
> 
> This looks weird -- are these devices really all the same
> IRQ number ? If so, you need to create an OR gate and wire
> the devices to the OR gate and the OR gate output to the
> qemu irq in pic[121].
> 
> This seems to be a preexisting bug in this code, because
> both VERSAL_BBRAM_APB_IRQ_0 and VERSAL_RTC_APB_ERR_IRQ are
> being used despite being the same value. I would suggest
> a patch before this one to fix that bug (either by correcting the
> IRQ numbers if they're wrong, or by adding an initially 2-input
> OR gate for them).


Hi again Peter,

I added a new patch in v5 with a correction, the orgate you mentioned
above (the interrupt should be or'ed exactly as you assumed)!

Best regards,
Francisco

> 
> thanks
> -- PMM

