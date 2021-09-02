Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624233FE8D4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 07:42:46 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLfUq-00010I-To
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 01:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mLfSQ-0007we-D4; Thu, 02 Sep 2021 01:40:14 -0400
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com
 ([40.107.223.77]:30558 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mLfSK-0006Uo-4R; Thu, 02 Sep 2021 01:40:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgNEHPdNETmf5eR6HNC+axV8SdfIGoTq92MDZ/qas4G/KycCUeUST1ux/8Ui3TzOJpohp7E4OPMoj0R4EIVcxPZ8JIwX5WKFqXYdoNUgB846ukzMuBajF3eDmM5oBDjNLcE1emtEVJh5c9nKy3gnS+piCwtbFiCanPxljHxw6XLPh+okIBxFwEBYLwptnQBQoTBUv9h28d4teUpdW4JWfVBJaj0M6r294B2UbuvxUrCpR2BwJlJxvRUAhgrZFl1elgNd7sDEPWTz1Pv4xO4p0R9mG33wCUXjzeKh/xTxQ0cA65MPOt+jA4YjoKY892jwPcG24M84z7sVKl1HSiJ+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8NWpBEe934PROtXsv59MPCnHWBlA8L7Zw1eJl3nL0c=;
 b=LmKU2T+vjuRzy9Rk+JQVZeu7AvKwPL4DBN6UwXYcoU/GQpp8yqHNSn6S0ZSDrQpxnlopZNEOVQ08qsWU8DKXMVGhih+3y1F/GE1of+FcDpDvsAb6NwxjUC1VkupabSvC52TU3FsR5pTRsLoN5z6cJOhff1ICNcC7Ix/hg6Z4vaouJPtCQGtl18PnnNXjTlK2L5kg+ivZckzWWF362ZkirsPqy6SSWWnKwbCGc3E9KhZ1s7wy3tgZJm/Rt39HY0pSk4pxftv/fyRVBYNQPQdkEfWoNXmOUjA2BUqPDZ6tg2Ia7Cp1B6zHQBskpfWOcacclyWqMZJNd3hCbmyJvW1SLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8NWpBEe934PROtXsv59MPCnHWBlA8L7Zw1eJl3nL0c=;
 b=sEMyPMCln3hckEo/PTTNrlr0Eek1NG/XA3NZs5vDpHWXbxpPK80XmKa/DfBUbVYCACBoNLZlSnLwWMSt8eA4IZfuCu1Xgn3b5pApWLh9eOYu0WpVnNBOQWKSAnjLXr1Wq4srh/y9Y2HhA8k7j8WB+YeiL6Qfgl9tWzChkuZG9T0=
Received: from SA9PR13CA0033.namprd13.prod.outlook.com (2603:10b6:806:22::8)
 by BYAPR02MB4582.namprd02.prod.outlook.com (2603:10b6:a03:58::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 05:40:02 +0000
Received: from SN1NAM02FT0038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:22:cafe::80) by SA9PR13CA0033.outlook.office365.com
 (2603:10b6:806:22::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend
 Transport; Thu, 2 Sep 2021 05:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0038.mail.protection.outlook.com (10.97.5.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 05:40:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 22:40:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 22:40:00 -0700
Received: from [10.71.116.242] (port=54989 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mLfSB-000AhN-MD; Wed, 01 Sep 2021 22:40:00 -0700
Date: Thu, 2 Sep 2021 07:39:58 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: xilinx_zynq: Fix upstream U-Boot boot
 failure
Message-ID: <20210902053958.GJ6340@toto>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0896fbb1-f1c1-42aa-4d24-08d96dd41bd7
X-MS-TrafficTypeDiagnostic: BYAPR02MB4582:
X-Microsoft-Antispam-PRVS: <BYAPR02MB458239F1F54547683CAA4474C2CE9@BYAPR02MB4582.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqexTXcuN+1OKUDOeig+cbIi+BKwuVYwzKHs/ApzqIRO2GstmmxA3Te7SWP+wNjgevOFhJNQanYyG+wofaBD1YrW6O4EAMF3ZDSxQA7C3Wj8pjccRpyMvDupDIuyb3bIY67NOSH+c142E3D9ZaOLl60j30e4G5Co4TXNV2V/+BbGB7ZZuyhU10X+qIpb9Z73V4LHHo7EFc/EtiEuwkuZl9mZek7ZcuwkjpFP+vlTgmKd+TQg60I7xzBkvxt60raXfqcF6xZEthLwBExdtmU8EjHEcrZISCULdHr8yaIJ4GzwPfPa9AeN5ZVsNwnP+Hjs3F/d4OC6Kbr/13SzhahpHi12cOpOZiP9w04AdVTsoByG18N/3TZXInl4L7bLbwd205hnKIhW9qmxPg3UVLYEdxFT9FLD6w8/Nye02qHssxL0jPINTsLVJsYMcigqMBcPkUuwq7Ig7TyDo+NBXVnbKNDLK9ZSoGlw9mWW5pTKz5/2BiK+0bWO/2ECgR4o9PlyfdwudWEb5EXZJrBYlZU5Q9WmDJMf4GHScdg62DxpDojtQUtHnqmfpZrVbxCEoMd72reGJZlQMX9FUE4hQcYF1JAptw3zeR9UFAqBpZLXmlVD1gkELDRsc8rEFCE5MAIKxZuZ6r/bHss2rgAb2D3vuWbZfy1GCzrHQzkS78in6BagpkalxgDN9KMC/7RaHRELruzq9nxs7oXOWbnMUqXNHw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(9686003)(5660300002)(8936002)(7636003)(4326008)(82740400003)(356005)(47076005)(36860700001)(9786002)(26005)(36906005)(70206006)(478600001)(2906002)(82310400003)(33716001)(1076003)(83380400001)(8676002)(6916009)(426003)(54906003)(186003)(316002)(70586007)(33656002)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 05:40:01.6415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0896fbb1-f1c1-42aa-4d24-08d96dd41bd7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4582
Received-SPF: pass client-ip=40.107.223.77; envelope-from=edgar@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 08:45:15PM +0800, Bin Meng wrote:
> As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> does not receive anything. Debugging shows that the UART input clock
> frequency is zero which prevents the UART from receiving anything as.
> per the logic in uart_receive().
> 
> Note the U-Boot can still output data to the UART tx fifo, which should
> not happen, as the design seems to prevent the data transmission when
> clock is not enabled but somehow it only applies to the Rx side.
> 
> For anyone who is interested to give a try, here is the U-Boot defconfig:
> $ make xilinx_zynq_virt_defconfig
> 
> and QEMU commands to test U-Boot:
> $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
>     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> 
> Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
> version used in current U-Boot's CI testing. The UART clock changes
> were introduced by the following 3 commits:
> 
> 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> b636db306e06 ("hw/char/cadence_uart: add clock support")
> 5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")

Thanks Bin,

On the entire series:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

