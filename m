Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92FB45A0AB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:53:58 +0100 (CET)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTR0-00057M-2n
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTLJ-0006xP-AG
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:48:05 -0500
Received: from mail-bn8nam11on2059.outbound.protection.outlook.com
 ([40.107.236.59]:39777 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTLH-0002YK-BP
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:48:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAsMPPdvgKj58W5UUU7/PX/y2SM6WNcE8HX0FR4sp5qYOz3O52xJ+Sf1b5Ca9fuxbNsOzqoweav0Xs829ZQeHYLtQNzb4wEyEw4Xd+n5L7aAn8fBa10AUbIODB6Wg0LLZWPlz52uQaYI8n/YrXt6vvIj3zfxqJpShBboTffRT6S80e4osYm60pFEMFbPwL7hXtmmBcDpXS5/n9O0wv5axXqy09io0gvnT4xoC0Cb9jDpPFXUU8c5BopCjhTQEoyAYuixrSn67KwOCkPrW0/LMjtEMfvUnjdjkHQRnI3kKLPajlL4xmnDOe/Hl4OXTErXuB/9OD2ucAy6wnZxb4x76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4v4AMMpxEetDVMKGq2VLy2fw5aJUhLV/z6q22BIiJs=;
 b=kCxQqPEqBugIrg4uqfPVS1+gbaD57F2Ei0QWOsq8zMfWCNzO1jVwdQBr/Fhm3dFnI2cZ+l7fGS4xH94pwy1oZgbKrmkogvSqHruh9TcFdKYxSE0IV0wI9uq5jhATSwmrAb1G2t3Eqx5KemYPlxnRMbTI8ZsYsXr8UCa76lNVygTHt2iThbVZHSYeCUsg7v1wmW/7iL0da9glZqLJTWIpZQcDkySWxbS+5dE7hrezpjUKcT29wkB9c2er0yfGABri428Es+2qwBp8ZSW4aPaUm/ncla0YrZwsTWoFvrECurN0FhmAUGBzJDSyNhiEXBRMYjPjHIO3FVSwaTj1+0KTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4v4AMMpxEetDVMKGq2VLy2fw5aJUhLV/z6q22BIiJs=;
 b=FZ0XXpiiNNLlEH1xQxKWWfR2BB2/+/7Hy/U27GgoviwIZ9ay6QSDgXzohPF61Qh4gsQ/dJkR9kEOTMhiIRSGulL+6U8aforwDOGzqG6icHAl2ybVX53iixLGpYo6nyNG/29lBJ4s6vmG+zn1m6+PQn+GyVaTCf1MxAz3t5FeQxg=
Received: from SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34)
 by BY5PR02MB6034.namprd02.prod.outlook.com (2603:10b6:a03:1b5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Tue, 23 Nov
 2021 10:48:00 +0000
Received: from SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::b4) by SN6PR16CA0057.outlook.office365.com
 (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 10:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0025.mail.protection.outlook.com (10.97.5.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:47:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:47:58 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:47:58 -0800
Received: from [10.71.117.214] (port=57283 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mpTLC-0002ib-6B; Tue, 23 Nov 2021 02:47:58 -0800
Date: Tue, 23 Nov 2021 11:47:57 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v2 03/10] include/hw/dma/xlnx_csu_dma: Include ptimer.h
 and stream.h in the header
Message-ID: <20211123104757.GF5816@toto>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
 <20211123103428.8765-4-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211123103428.8765-4-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb9a422-6f66-486f-4ed8-08d9ae6eb742
X-MS-TrafficTypeDiagnostic: BY5PR02MB6034:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6034BD890E3CCAB0B705D5CAC2609@BY5PR02MB6034.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/pmxYgt+vDlSVaxyfGLPPKIsAxVxFOKvsjQzdauu0BkPAW5KRgTWhQTxPZvZlpl9JJw8eWUZ2QwQrpCSQvIQWHFH1cmtaRSxEZ7gNIC47xydalxVLDmiHv//P48lrmXjYl0jBL2rtfJdT9e9OkWVApB1W2k7Pp9W5ieHCoQrsutkilN5gzIf5EmaZhVww9ZQiqECAvB40COWN8uLwNyL+lA1pIFDVaq1D0LoleIwTUl48YcasWzXJnP0dKxuhTdrJCTxZNl9UFBX3BDvt6yzlJnMpcAUtxoLmAxZ6r1wUXfyh4ImnGMQdnPtT9JL2nOkhqw8qC8/iM7CKHDVyP4IrfsJnfnpOm8lixm2hU9yrpbRRLoV5JjhQMJcXWCSz7lSG54RAEvzCmZCvmIKq1ykpyFIHA1hUylxqOw11enQAeLm1VftAZ0aNcDRwrmWOmBsCOySkPD2ABILG+F4rZm7HlIl+Zmu6rX56BusC0c/Hr8v2N6Yi6g3HZAsmJPbVLVvPyark5njkGQGbPf4zNJDiAEdPhnJi9+YY1VbLU3n02fAw8XDjrwrT7Cv+hOHUBBO0VDQX/jrvMt+OKWGsBiX2zSNvFS+zFLjf8ittUlBluP+h2uM1nCPoT0z8qlDw4zKj/UAQKxsfmNLBJa7zhrf8zcTAAUteYY69j0/sZ7n7s15/09JPVC0ge28I5SHfykPWdbA5bVLDnghMfhhQ91Vg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(46966006)(36840700001)(33716001)(8936002)(36860700001)(70586007)(70206006)(1076003)(9686003)(186003)(33656002)(2906002)(6862004)(4744005)(36906005)(47076005)(26005)(9786002)(4326008)(5660300002)(356005)(426003)(8676002)(6636002)(336012)(7636003)(54906003)(316002)(508600001)(82310400004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:47:59.3047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb9a422-6f66-486f-4ed8-08d9ae6eb742
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6034
Received-SPF: pass client-ip=40.107.236.59; envelope-from=edgar@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: peter.maydell@linaro.org, frasse.iglesias@gmail.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 10:34:21AM +0000, Francisco Iglesias wrote:
> Include ptimer.h and stream.h in the header for being able to build and
> reuse the DMA model (the first usage of StreamSink, StreamCanPushNotifyFn
> and ptimer_state is in the header).

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  include/hw/dma/xlnx_csu_dma.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> index 9e9dc551e9..8c39e46f58 100644
> --- a/include/hw/dma/xlnx_csu_dma.h
> +++ b/include/hw/dma/xlnx_csu_dma.h
> @@ -21,6 +21,9 @@
>  #ifndef XLNX_CSU_DMA_H
>  #define XLNX_CSU_DMA_H
>  
> +#include "hw/ptimer.h"
> +#include "hw/stream.h"
> +
>  #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
>  
>  #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
> -- 
> 2.11.0
> 

