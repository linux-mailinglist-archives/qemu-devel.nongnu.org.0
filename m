Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6183213FF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:21:33 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8LM-0005rc-IM
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1lE8JJ-0003jt-3e
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:19:26 -0500
Received: from mail-mw2nam12on2089.outbound.protection.outlook.com
 ([40.107.244.89]:50659 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1lE8JB-00073H-Ir
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:19:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDlh3gfISYI0958oePtJTXVh5U0hnhAuNuVq304osM1krEamFDcCEDuYrFN1xQID/s9VazUP+MpFF6d97A7Jwu91wzoP3Nas4PAucbsftkHMTtyJWsv7qwjGw5mNLCirZSRyQU+7P/hZWvGRdv0XhkYsASorcUPTMduh55iCYrod0cEq6hskr+CCx/MaIcWom730AQynj+kxQpjhyInVZfWCYn0lseAAQ6GVx8VUGU8Q4JK2k9eKvCzW68goYE8nKxubrfxlWlG5UDz5zotEbt0smWitcXEzzJxQkGqXicob4ZfhGCMgN9b5zB9Rf4a4wBdPmZJWpGP9mSIqCxlR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmqExdSGgCgcDCV5+3XYUlNdOBKTuHxB3Go/c7gxjv8=;
 b=V9FJQxI+CxI58YqmNznhmh8jpFdJXQjZDmbafJGvWKjA3BbFGZWpzOXym0FxJq+eU+ni3quZ7bnuqa7JDNHLj/hdL27zGJHxyhdJbVbrTfPztBHSCXHs+GTQLlGL2aKau1uFZgFQqdgwAxT7cZ5m1xYIyDZ5HTnkbrds7CdAsuVF3b1iEhTMG34LCCJzRHsFXig9gZZhOT6tZVwDIsAhgBA76d9d8U8d7PI6FWuJfl6KvMJlT5hkbqyX3z2+YZ6+o0yVLZwe4u1Y9Cv5uGbGRNp+ESGeWE0qBd+wvkrZt1fOLxZslVjUaTi7ebuMmIBl77sWKzACenQCkarhOu43oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=axis.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmqExdSGgCgcDCV5+3XYUlNdOBKTuHxB3Go/c7gxjv8=;
 b=PATXDobVVP+DqAGsiiJBeK6ZP3rWGjUA/WDjEnE/re/eInDuXomXqGXQVC3/R7s338Xr7bncoeqhNH3c0AEhApdGimdaLdLcyFV+f/fRXOZo1QEDvg7gKTdyPsur7HiW27KZ0AZV3R8jySx0oMsZiT7jsw5d24S1nG9h3+n+Yv0=
Received: from BL0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:91::36)
 by MWHPR02MB2429.namprd02.prod.outlook.com (2603:10b6:300:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Mon, 22 Feb
 2021 10:19:13 +0000
Received: from BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:91:cafe::8f) by BL0PR05CA0026.outlook.office365.com
 (2603:10b6:208:91::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.11 via Frontend
 Transport; Mon, 22 Feb 2021 10:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; axis.com; dkim=none (message not signed)
 header.d=none;axis.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT044.mail.protection.outlook.com (10.152.77.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 10:19:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 02:19:12 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 02:19:12 -0800
Received: from [10.71.117.207] (port=58936 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1lE8J5-0001EZ-Vm; Mon, 22 Feb 2021 02:19:12 -0800
Date: Mon, 22 Feb 2021 11:19:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Stefan =?iso-8859-1?Q?Sandstr=F6m?= <Stefan.Sandstrom@axis.com>
Subject: Re: [PULL v1 3/3] target/cris: Plug leakage of TCG temporaries
Message-ID: <20210222101912.GC22843@toto>
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
 <20210222083324.331908-4-edgar.iglesias@gmail.com>
 <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
 <022FADE0-9DE7-4DA3-B864-2CE5B97F26F4@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <022FADE0-9DE7-4DA3-B864-2CE5B97F26F4@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 689bf24c-4b90-4751-ae70-08d8d71b4d29
X-MS-TrafficTypeDiagnostic: MWHPR02MB2429:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2429C0FDC9C8773338507675C2819@MWHPR02MB2429.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BcgkGclJRIORU7AzsvDJS/PqTFjBmChic++Xa3+Goz9NTDo9yypPsf4PvnnZMNTNRb48x1EC8Rwndr/KZAGNwiIdUPs3kJieS/1fp/BTVu3yNtQUUb3PVHOEPZkWagSKRGWslWnR3nEw4dTQPINGyJrDCQjmeAvnQXVrxtQkdFasw/eRKanCsEWqriSOszyqC76sZraGMQs3PqeTiKXWLVK6RVGBbQn7ieCiavEOB1ymvzle/yTUQK6VLIKVvpzaNUpiXjgeITDEsivSUKfMbwCMZiuFBAUVvJQ0LsmXG3APh25pNyQmS5b0g0A5rtLFHPShOSGxILtkO07YxoPKlMHSQwCONECjMISdB7Z9HK8wsiBpvMmzY5UmNJ6cu4LrKZN0f1xQAY2jLRXZCi3FZ2UbKMn4iKJSqX9z68wRsnXtBJSqYW0UF0J0LhZneDQ2+T+8+2p1u88LNlDZeWyGWheV152huOAyXrDTwokI7gRmnM5xFbCW/sdaVESSCKSIHKQWOd38EAPkDYRXMGuROOHYCJtKnYgJ79cz0W91g6hH/nADWV8Q7FI7rTRO9Bf1ReKMmUQRIKeiw4oG/yMf8LHwqegne4gWPAjgblXrOWiQVD0V+JHWIf2w1+khpBhk/2RBmdnCgNMPXVEZoxa/ZuqUR0/2+zo6JvJJ/OfdxnNIEErKg7YvFW3El3b7wDKFt2yi0VSYPqsbKDZ6YQbBNE+DdDNC6WrWz8TOSkboflE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(7916004)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(70206006)(1076003)(54906003)(36906005)(47076005)(82740400003)(8936002)(70586007)(66574015)(316002)(336012)(478600001)(356005)(186003)(8676002)(53546011)(7636003)(36860700001)(2906002)(9786002)(5660300002)(4326008)(26005)(33656002)(83380400001)(9686003)(426003)(82310400003)(33716001)(6916009);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 10:19:13.0162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 689bf24c-4b90-4751-ae70-08d8d71b4d29
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2429
Received-SPF: pass client-ip=40.107.244.89; envelope-from=edgar@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 08:50:46AM +0000, Stefan Sandström wrote:
> Hi,
> 
> > On 22 Feb 2021, at 09:41, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > 
> > Hi Edgar,
> > 
> > On 2/22/21 9:33 AM, Edgar E. Iglesias wrote:
> >> From: Stefan Sandstrom <stefans@axis.com>
> >> 
> >> Add and fix deallocation of temporary TCG registers in CRIS code
> >> generation.
> >> 
> >> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> > Out of curiosity, what is this Change-Id?
> 
> It is used by the Gerrit Code Review tool (https://gerrit-review.googlesource.com/Documentation/user-changeid.html).
> When using Gerrit as a git-server, you install a git hook that always adds this, so it is an artifact from storing a clone of the QEMU repos on a gerrit server.
> I'll try to remember to remove it if I end up posting more patches.
> 


Thanks,

Peter, do you need an updated PR without the tag or can you handle it when merging?

Best regards,
Edgar

