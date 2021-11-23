Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A545A0AA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:52:43 +0100 (CET)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTPm-0003gU-39
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTJr-0005ND-Of
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:46:35 -0500
Received: from mail-dm6nam12on2057.outbound.protection.outlook.com
 ([40.107.243.57]:8631 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTJo-0002LV-MX
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:46:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geBWPdPtLPkjqOYqBPPwH6aGaoMgh+7eE2KSIa9V/de1AbJJvegCXBFnnANFVUHoM/A3Pz/qWToYuPrFYQ/PIihGdgfxq6Z1OOmbrai0TkfpUwdqSJn7skivdj2IFT5QE3z7s0MNQsdM4cS8gSc+NSVMGz4gto6hV/ui3j6gQ0v1T5JfAzNhjpURZ7C2fIOok0v19DcC7pzNPKF4nWdqlBHTBtTmN8Mk7TrHh817Fc2ttLwLHzfeoURCLjk4H6Udw2w2ql7FaSWQIRHrfpoK+JWJsagLAKPqoh2QhGmDm0AjElk//rKhQLHLglcLks2Sc84zcyZ6eoaoUKZlH2CCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN1xzQzPx3UZ8zvJAU/6PtGAB3rK77cVGpzWp0NP5/c=;
 b=ZiYdo3UgGR7luLzHc2dysKKP66Ek1BdbkpIX0WDwgo9ha1RMg2F2oVVVHNKyZauZ9x5uQW1v3S5vC8ewk4xu4VSqtnRnMlLKe/5iuTevYDgmPOdHD81FcXbl7ThgFW60TCf1AYxRbeGPgq1Jm262Ee/KUtschr+RO9Uj4jZBVp9uSBv4K8EiGe+f7l6+QzvDUIRqq45HBvzoXFec2YXzqR2sCBhp2Y0rnJu/j7KZxIKfdaQnJR8/snpfd4SLlbD6hIxZHifff6dJV6yiG0ZHfdP8+UTT9UfIdk6v5yIhEPqgvV052QTRkRY/iVnyKZpa2MTNYsg09+3HhjHnoCG4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN1xzQzPx3UZ8zvJAU/6PtGAB3rK77cVGpzWp0NP5/c=;
 b=WGDGewbkSXRH9h4tcwyOyhfrKAFwfpT3GT14300WZGGqiuvpMAsK9FxOJXHj0YYbi8jAvr8rUT+hc6pH3FUlq3955rwE1Uh3cBo2MQK4RqSu8VHKate4cE/fxO1CRRKX6Ez3QhtWtgAP4yaPJhmP+IvlNDeV0SZOHQRXZth7ooM=
Received: from SN4PR0501CA0129.namprd05.prod.outlook.com
 (2603:10b6:803:42::46) by CH0PR02MB7914.namprd02.prod.outlook.com
 (2603:10b6:610:113::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Tue, 23 Nov
 2021 10:46:30 +0000
Received: from SN1NAM02FT0003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::de) by SN4PR0501CA0129.outlook.office365.com
 (2603:10b6:803:42::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.17 via Frontend
 Transport; Tue, 23 Nov 2021 10:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0003.mail.protection.outlook.com (10.97.4.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:46:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:46:29 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:46:29 -0800
Received: from [10.71.117.214] (port=57264 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mpTJk-000DLs-Hq; Tue, 23 Nov 2021 02:46:29 -0800
Date: Tue, 23 Nov 2021 11:46:27 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v2 10/10] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Message-ID: <20211123104627.GD5816@toto>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
 <20211123103428.8765-11-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211123103428.8765-11-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d72bf4de-a37c-4cec-92e7-08d9ae6e81b0
X-MS-TrafficTypeDiagnostic: CH0PR02MB7914:
X-Microsoft-Antispam-PRVS: <CH0PR02MB7914BE54D2ACAAF346F0A74DC2609@CH0PR02MB7914.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3QWAybQNjnuOApy/snHHyZXMWiAOfroJTse/dpN6iehreGuhfL8byU7OoffSmJ1w57OPTHz/AFOI/8ujnoe1xFbcjOU7ESsxxmOkluQCsl0+W9CavB1g+ngRoZ6T+4J+G6FjWp7OeCtiezAd1NYtr57bERnNJZ5gKmQ1hOo8rM+V9nNlEVXZFA6Rgm+c3Xw1NiZ0inOq+1mDyI1Flo3738S8Tjq6bUQDApOt9ih1Gp1yMYeUQ354+LAaEzJjLgjw5jlMPh6j9pLkwOJWMG4VdGuh0IanKg/Lea+MOLABFD6rxQA8+Nz3454BJS7Kwm5e8uy6QnvhVFuE1k6fhGMNttRmeP0+3l64qTav61vjretmoaMQx5IrYcNWcNGaOkxSJyzT0BATXP6J1oduUTLyVcSbmprirnqMHl49Raa+17IPLGT4p/uXuusHi4h0A6kWMcLfuCDGS+2QZS03xehOcYQCph6F1IH4Q8X6YAm2WFsMAr557nGQmkUh8Yh6sBS4Yj2z6ktRKq5h8rQQspuBOy6Whdj0W3+DarfZ+GkeFi81xgOAdn1CAuAaxnVImGJvQBRKlRH/EB/ruWzhknxugh9EDfGbe3JgbIwljcIQRKWzzQJr+cgHrWXPVuqDOsgIEeer6/a4B57yTdgG3n6gRMxqBc61jU2IZnxYR3KKnBSawGP3obXnFge0OmqSQ4ODHwu8IBJcEHNrqYhpcrA04Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(36840700001)(46966006)(1076003)(36860700001)(33656002)(33716001)(356005)(8936002)(426003)(7636003)(5660300002)(70206006)(4326008)(82310400004)(70586007)(2906002)(336012)(36906005)(316002)(47076005)(9686003)(4744005)(6636002)(6862004)(9786002)(186003)(54906003)(26005)(8676002)(508600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:46:29.4284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d72bf4de-a37c-4cec-92e7-08d9ae6e81b0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7914
Received-SPF: pass client-ip=40.107.243.57; envelope-from=edgar@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

On Tue, Nov 23, 2021 at 10:34:28AM +0000, Francisco Iglesias wrote:
> List myself as maintainer for the Xilinx Versal OSPI controller.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c1..8c2b01a282 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -963,6 +963,12 @@ F: hw/display/dpcd.c
>  F: include/hw/display/dpcd.h
>  F: docs/system/arm/xlnx-versal-virt.rst
>  
> +Xilinx Versal OSPI
> +M: Francisco Iglesias <francisco.iglesias@xilinx.com>
> +S: Maintained
> +F: hw/ssi/xlnx-versal-ospi.c
> +F: include/hw/ssi/xlnx-versal-ospi.h
> +
>  ARM ACPI Subsystem
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
>  L: qemu-arm@nongnu.org
> -- 
> 2.11.0
> 

