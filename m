Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205E45756C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:25:26 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7dd-0006U5-Lp
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:25:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7Oa-0003jY-Ap
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:09:52 -0500
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com
 ([40.107.94.46]:17889 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7OW-0004n6-Il
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:09:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Omus9JaPQG9swu/b82KtyA3glzuP3FBA8LWlP4XMS0w1QL3i60VmwlZogXTK7j/+YULuCn4zXEpWVicIVRShm6Xun8Nu68YC5T9b1bpC1XRBK+BRwLa5TbGPpSAzL0aE2KXOyOPRTeWDzzKfUMgROtq6YZwKL5JsaGpKlK2+Ggjq4MGh62k+/95r0oK8VDzk7ovMEcV3Jaoekkp3Qe7gFwNSQKCiESrgiCJGd+ihqRGvXIswwJKSEHGlzC8Dx2kmXibhZctjX7jC9UABxbMBN+spSGfdOvp6hes0WASgbjWU5GoAMXNHEwQTAnheaLdwH/9MVfReVrGyJRE38IdZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACK7UEkt1/ZWXiFB/p0KrkTowWqV1hAK83Mz84HBlnA=;
 b=AMd68lEHXegK8xGJzdw1XZLvqdVdmYkno3ARJlxI2fWT+7x6R4PePlMiYMOv7QE4NI3PSMGrcXuNZUHBRkrDQznFa1S42LyLk0Hz3nfWnYjyHwg9c5aPsRBDP5fqFWQwmpJdZ9C/J8xZRucTBmzv1hmKf2Zx9Y2R7af+01CWbbmsLz+uflSYQoZz/E5FER/Jo/jWG1lt1ukLh3NwnJbLauLWfkMPY8CWkv8IHAt51pQ2cPXodkkdA7m4Nh0me09aRa35dgraJR+4UNqDUQA+WB9D8QgFAycqIld+FmpvXpRhf64F4+i7mD1EnMhIAb/l6LrPtAGkcsegedI6HWW7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACK7UEkt1/ZWXiFB/p0KrkTowWqV1hAK83Mz84HBlnA=;
 b=kU1jS9S6hU1GNdIU7uF1shORkj1M50bcf+r/PALJD3jKn54quKETVgyiRSfmxHIVLV6m1Jb7kHgv1VHme6peH6l4JaNcPJuJ4abot/U2K1SDfxolNtrJlwr75iNkLc+zDlVIIl23QqyDso+R+X36hk9ns1to8kg8Gv5wV3btgfU=
Received: from BN6PR22CA0062.namprd22.prod.outlook.com (2603:10b6:404:ca::24)
 by DM6PR02MB4010.namprd02.prod.outlook.com (2603:10b6:5:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 17:09:43 +0000
Received: from BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::c4) by BN6PR22CA0062.outlook.office365.com
 (2603:10b6:404:ca::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 17:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT030.mail.protection.outlook.com (10.13.2.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 17:09:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 09:09:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 09:09:26 -0800
Received: from [10.71.118.100] (port=61768 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mo7O9-0006Lg-Ga; Fri, 19 Nov 2021 09:09:26 -0800
Date: Fri, 19 Nov 2021 18:09:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 8/9] hw/block/m25p80: Add support for Micron Xccela
 flash mt35xu01g
Message-ID: <20211119170924.GF2341@toto>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-9-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211117141841.4696-9-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b940cf6-3e75-40e4-5a54-08d9ab7f6157
X-MS-TrafficTypeDiagnostic: DM6PR02MB4010:
X-Microsoft-Antispam-PRVS: <DM6PR02MB401056BD852241D3DB0EE51FC29C9@DM6PR02MB4010.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjb2V5ChOHM2gw8/Ezl7xa6fV/oAFhKcZggQ1jxGXmygNnHG3sFuSBLpYq3IivNOJAk/KEGAgnkdMxZlcDrBxZhkfxbIJoCgOxqMFqqNpUN+iDrr8UbWlWLCA4Gzbhezsub346fj9tH4uKoRBtJqVic3dodQyQWWedRQtwbeMP7LW+9nXMs/2+Yl6M7SZ3OMK68ixqVtNsA3U8DTLbCDIwLPS7oqcc+UdUqG4vEXZmMm2OKRxHASrEd0U+IqAtPPkZcl/xQ9P8i1+rD5JmLUkX97O4v22KafKsogOYdcu7Um4IUkJO1jshyR30bGZ95wWLwF7R+2NiG/G2LjOLbTIyMrZBCY8FT1vfeovo2sRCIJ3A92shOPID15xk4A/nf9gbKBep+nuv9p9El7QMWEVsfRnUFipnhwTJtab3hSXp6yX8tONh3S1P93o5KG4ogDLh3CkF5c/U9eZJmfqgyuHeRrCQ0uBvD2bH16EGUWmyd9OBdWYYgVI0+kjXoZmhzjO7FD+1tcndrnnzEX+llN3oVytqJs+53Zu3cjklHfg0ZpgSjbMnLwgteZ8i58U5iORiyzi9A+LmUSezam/65sNiyBOumokXXRdPdgnP2o+QeGzZiTWDvJQ9YP1LVNBLUc1WaUYq6eayUmSkbKqkBfDDFuLPrKFuPg2lF+Rn6kduBCyoV+NovVuaGMQa3Cq0cr6XnpnJZ+ny2IX1OI7+tzKQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(36840700001)(46966006)(47076005)(9786002)(33656002)(70586007)(70206006)(1076003)(83380400001)(336012)(26005)(82310400003)(4326008)(426003)(36906005)(33716001)(6636002)(356005)(316002)(508600001)(5660300002)(186003)(2906002)(54906003)(9686003)(36860700001)(6862004)(8936002)(7636003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 17:09:43.0447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b940cf6-3e75-40e4-5a54-08d9ab7f6157
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4010
Received-SPF: pass client-ip=40.107.94.46; envelope-from=edgar@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

On Wed, Nov 17, 2021 at 02:18:40PM +0000, Francisco Iglesias wrote:
> Add support for Micron Xccela flash mt35xu01g.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/block/m25p80.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index b77503dc84..c6bf3c6bfa 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -255,6 +255,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>      { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
> +    { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
> +                   ER_4K | ER_32K, 2) },
>      { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
>      { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
>      { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
> -- 
> 2.11.0
> 

