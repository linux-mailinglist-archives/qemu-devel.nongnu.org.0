Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF39749EAE5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:12:46 +0100 (CET)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDACJ-00064G-Jo
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:12:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nD9l0-0000tY-5m
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:44:30 -0500
Received: from mail-dm6nam11on2069.outbound.protection.outlook.com
 ([40.107.223.69]:36547 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nD9kx-0002hb-Rr
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:44:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed1n843w+HUY6YBdxiYDkLyxQZunU2LWb/VWDsZdGhaYpUzYuOeC9yM9wI6QniWBeLbGX/ylc2bWzPWqwFYpazpIvL6cvwCmtBio5RZUdwYQ5EAKTQ+SFWTG9G5iH9A7m2CrT0/KF/05VFug7XWK2HivsqmZpf7kVVoK8NLLDq1GFe7j+ipm15JLX3adg8m/Tt4Lmnk0dI3Y0lSvN6dD0ANN1hV18AQejZjyXm9ou3XZguXlVpX0SCj+rbozJbt6D4j9vRQGJfk82eBtrUdzBBLSrAB+a3JUrRzGlwjr0/CM3jBC71+ANYdAXhvBH3bN66xK5DQC8x5gdF+ekjB5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrYyBwQuVifczbFPy7ImVEdVKE3BJyPuapKkVJnNiOo=;
 b=iyPG/h5bv1sxCwgjIAuLvlBDuVO+RPYkWHnlvsA4xoSdT87nLFNsJepwtGgGkFDfu5NcjOM56oYDxdW1VlUnwzXjnmU0pHiwQPqgPgrZLKyoUcnJoyiVW0i1vYZj5id2YyUFhsLKTb+upkZTeKeTH8uN+ADfEZ1vu09qUfoTFt0rN6FarjY7a0m4sG2L4rdkhyDUoEZblU7v0MnkY+AB5xHsi3ifGvqgbms/q/BF7eyXRHpLOXv59eixt4bEufmDFerbRnSE8TzP+892Qgyk2tcb8FVnt9VgudO784+c5ItMe05Y+/J0m27oNrLwEIFHrgWWRS9J9b7pVcqESt78cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrYyBwQuVifczbFPy7ImVEdVKE3BJyPuapKkVJnNiOo=;
 b=sF9GTH31oXp+8G2+XCgbyCFgcIqDnbNntOWdgwgQBX/vGCKcGG9Br2k0wh2ZnfayjHd2nPnVQy040nfLYXrau6LN1Xur7MdfB5AFSnbrS7dmxbgTGSLG1xOkEzpbwokHHtoFVtgd8YH+U4AKUlt4a8hSdtLQ3ec4p/Cb8lKfT4Q=
Received: from SN6PR05CA0007.namprd05.prod.outlook.com (2603:10b6:805:de::20)
 by CH2PR02MB6712.namprd02.prod.outlook.com (2603:10b6:610:7a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 18:24:10 +0000
Received: from SN1NAM02FT0040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:de:cafe::4) by SN6PR05CA0007.outlook.office365.com
 (2603:10b6:805:de::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Thu, 27 Jan 2022 18:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0040.mail.protection.outlook.com (10.97.5.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 18:24:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 27 Jan 2022 10:24:07 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 27 Jan 2022 10:24:07 -0800
Received: from [10.23.120.224] (port=56258 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nD9RH-0003oc-HQ; Thu, 27 Jan 2022 10:24:07 -0800
Date: Thu, 27 Jan 2022 18:24:05 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 00/10] Xilinx Versal's PMC SLCR and OSPI support
Message-ID: <20220127182403.jwludtmf7uc4aa24@debian>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
 <CAFEAcA8xvw3rR_bKWtiYuecKhHJeqVw_Yhy7h+Lci9behw394Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8xvw3rR_bKWtiYuecKhHJeqVw_Yhy7h+Lci9behw394Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b41d9c19-8d71-464c-9c7f-08d9e1c2361e
X-MS-TrafficTypeDiagnostic: CH2PR02MB6712:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB671219EE11BA0215D2DB88C8AD219@CH2PR02MB6712.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvCRH5mpF6agPlx3DupKSLjhxR910rMf00MD87NeuB7E0zivvW5BT6Oa2QtFYoKq/3A8lsdZIqXKdOVli7M4Lo9LVm+aMlLRZZuZ7uKA1Bw7KbLQjKtC3YEpO7OglGfMcNV0m+h16z5kS+UrQc/z1rlCVo/hZXtS9QQokTY8XicSSuh0IZJZlDme0l2mBZrh8IVFAw17rRXr/uqxp6Q1LjCwtXxYNjNb8LjeJ9wH23R2+Fmzr0NNg8JHNbTtH7nGBpr12ue6xtewWzIKTwUdV5u9KcT+BGQtT5O+4B8Cx/MN2Uu7H3Ca78j/JLcknNGfzh6y6iN9aW7rTWHjKxd3Lkmh0E46KBoRbHyDzjRpgRms5yDoS7NO9PpAc2pDtwdsBGb8/TcWcemBZEOPZjWsjrKRb1k0Gx1FIk+RVQopN8SQmdoSOuWNq5H7rvjdrSqeK/q5yZbax8YbnRYXYxw/3lQ+fh6gBoY9gh+G26+OxU/fD4AZwqY1lwhE4QrTn1PVwd+da6sTIPkKfoRyF76DwCAWdxD4GPYn0YT88HLeWuynWqUqg/JRG2GC+UnvG+oICWI7klclznKHWchNtQeoCoAApuY0tGNeA7A98z/9mB85Ta8LsKr1KbqWb86Ny+FywFrKAh02n/sC9EayQFu2jtIwIWteZGv6YgRQJcSE5oN1QCMQvi9pUVrZSQo69K7O
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400004)(8676002)(8936002)(4326008)(6916009)(47076005)(1076003)(54906003)(83380400001)(5660300002)(7636003)(9686003)(70586007)(70206006)(316002)(26005)(186003)(426003)(336012)(9786002)(2906002)(33716001)(40460700003)(356005)(508600001)(9576002)(44832011)(36860700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 18:24:09.6735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41d9c19-8d71-464c-9c7f-08d9e1c2361e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6712
Received-SPF: pass client-ip=40.107.223.69; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 05:27:55PM +0000, Peter Maydell wrote:
> On Fri, 21 Jan 2022 at 16:11, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Hi,
> >
> > This series attempts to add support for Xilinx Versal's PMC SLCR
> > (system-level control registers) and OSPI flash memory controller to
> > Xilinx Versal virt machine.
> >
> > The series start with adding a model of Versal's PMC SLCR and connecting
> > the model to the Versal virt machine. The series then adds a couple of
> > headers into the xlnx_csu_dma.h needed for building and reusing it later
> > with the OSPI. The series thereafter introduces a DMA control interface
> > and implements the interface in the xlnx_csu_dma for being able to reuse
> > and control the DMA with the OSPI controller. Thereafter a model of
> > Versal's OSPI controller is added and connected to the Versal virt
> > machine. The series then ends with adding initial support for the Micron
> > Xccelera mt35xu01g flash and flashes of this type are connected to the
> > OSPI in the Versal virt machine.
> 
> 

Hi Peter,

> Applied to target-arm.next, thanks. (I fixed the indent issue
> Luc noticed in patch 6.)

Thanks a lot for above Peter! :) Also, thank you everybody for taking the
time to review and providing me great feedback! 

Best regards,
Francisco Iglesias

> 
> -- PMM

