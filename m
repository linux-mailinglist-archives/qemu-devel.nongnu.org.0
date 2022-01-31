Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790A4A4D70
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:41:52 +0100 (CET)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEagY-00050D-Uu
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:41:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1nEaWE-0008C2-Hq; Mon, 31 Jan 2022 12:31:11 -0500
Received: from mail-mw2nam12on2082.outbound.protection.outlook.com
 ([40.107.244.82]:16641 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1nEaWC-0003Br-UC; Mon, 31 Jan 2022 12:31:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwdjFdhzdzXwQZ4LXQZCjFobqlpw+sJ7+n3D9w1AAJUhrm6djz9K1kquwNJvMHdK6afWowm0YUqQzJfDY7h+Dotvgov+fCPaX5tvhZc28JUCNu6/MgKpDhKBwMpyk9Nfsc4QlJ7u9ocbesnn0ZA9tMreEFsyX9gvXA0X3T4DnqxQRMpmr3GwgRI5fly9LGwLJh3eVSTUb6PWVbm3eXeETZlgPeSNikpMx9Xr1+0oIu5e38yyuJCiVRvneXhNvPzQJCjGWOlDCFywQigu1igyxguVpbNv5kD2+47+lT6kI+7QLp6uYmp8gIj+V274uh22ayI2Sgfd9GZi+8MoZPwoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s31XuQ47tyr5MQp875bYlH7i3ucmEm7pCgdQN81jIQs=;
 b=PEvNKKd4l5xuaEV+5SPHiv7Is/qIeGKxoZJrxQFcFE9/bJ9jYb+wvZZsPmpUyVtevi0OTWkSY3DdNkazqatlGIK6ohv1qJJWM4Nr6rNvgpCEH64gSaeh0mN3M+xe9DVFuiX1F59mHZYqogN+hjrjkZE0hNVAZTyfnon1aU+/jJrYsqVogYvpqP3CZMCkZUxl/QekOqc1kDzQDEoh4VNZsEvSOkPDyISJ9ldHGTya6jg7kymyADBcCZmEWfh/F5zGIGKPycbMunp0+Iibs8v6Os1Ukjs8JkNviHx3Nrf7qYUrEDvQWYC3m3h2daQWafNsmus0gVg5UdH3oKM50t5Wmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s31XuQ47tyr5MQp875bYlH7i3ucmEm7pCgdQN81jIQs=;
 b=r3eYIEhd7M8mGvV/F3fZXHiN20AMHQANwAyWxsJg+zWT+XbmHMTldQRdSltXOR2349V6bKVRdXjokZhdp0DAjtECDOujMfj9NSCu2ORz2MCoqLZoZGLQgyXuX42xfXhkYT0QugTVFXEXpGWjtJNNESeNIMhzagDGv/2+voU+Mdc=
Received: from SA9P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::15)
 by SJ0PR02MB8752.namprd02.prod.outlook.com (2603:10b6:a03:3d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 17:30:46 +0000
Received: from SN1NAM02FT0004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:25:cafe::6b) by SA9P221CA0010.outlook.office365.com
 (2603:10b6:806:25::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 17:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0004.mail.protection.outlook.com (10.97.4.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 17:30:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 09:30:42 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 09:30:42 -0800
Received: from [10.71.119.88] (port=49929 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1nEaVF-0006Wq-6S; Mon, 31 Jan 2022 09:30:09 -0800
Date: Mon, 31 Jan 2022 18:30:08 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 1/6] hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
Message-ID: <20220131173008.GF8684@toto>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-2-edgar.iglesias@gmail.com>
 <CAFEAcA-UZp943LVdq5VMn9mvDxzieWMFn_3+B8F38g5x_nsKbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-UZp943LVdq5VMn9mvDxzieWMFn_3+B8F38g5x_nsKbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c488b020-5e49-4b7e-ca66-08d9e4df6a0e
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8752:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB87525B95D48AB4414A50202DC2259@SJ0PR02MB8752.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6EyklbOmiihH2cy4j+s3C3DIC3Lkq7q1l0zSEacBAU/LZXEHnYvF1Az/PxBDNvVRb0/z+AD4sRuqhNcopdTJUxXwUEW/eOk71CX41kQNW5N0f7CRnrzjL0WKf70T60oVr6dTsOiolJuAAHvR82kRh5x+ix/5BO+dJUKFZsMxLB9PU1bKdV3IE0acekKleZzxbQE37oaQ5LR4nGQDzOlXOKhQV+a6z+wgZiQ+g0XDD7OvnCasm9p4Yr6YNxVswuZPQNW941lds5386j4JIGIbvIsLRnQvNbBccPR/ztCsF4lQZxPsTViSAeOGNdgbXsNyCOwglYOSUdPd9whBMen1Pl2Gt0cmjmN1FjTVjUBusjEMgFRCRfrsKgfQvozVCRvj6pVR4IZKnYRtEyaoq+dnVCa3MxDOrcnibUxEbL8JvJClHrWjvBOb6XhSvjQWT3E+ZChpTGvv8z6LxWsRS5vilRx6p+zIzl7Qh6yHtlGjb1olBjxMWHeoEAdH4kv0dFcU6aYr5KxHLkRldReAGeloEUXqjrGiWKWlBzX0T6GLp2imCmy3yX06I7IXqLM+NQueXwznu2hJTLOB2aER2q2J0Zgsk4uzmJ6JHlCezcNDPGKfoqew6Hf6X2OFg5nL3n9/0EdHmqnicn6oBob5E6enQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(36840700001)(46966006)(83380400001)(36860700001)(316002)(6916009)(54906003)(1076003)(186003)(26005)(426003)(336012)(2906002)(47076005)(4744005)(107886003)(33716001)(7636003)(8936002)(33656002)(82310400004)(9686003)(4326008)(9786002)(5660300002)(508600001)(356005)(70586007)(8676002)(70206006)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 17:30:45.6267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c488b020-5e49-4b7e-ca66-08d9e4df6a0e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8752
Received-SPF: pass client-ip=40.107.244.82; envelope-from=edgar@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Cc: luc@lmichel.fr, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 03:32:25PM +0000, Peter Maydell wrote:
> On Sun, 30 Jan 2022 at 23:12, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add unimplemented SERDES area.
> 
> What's a SERDES ? A brief description might be helpful in
> the commit message or a comment.

These are config registers for the SER/DESerializers (for high-speed IO).
This patch was not strictly needed to pass the test-case but it came up I'm guessing due to some SW dependency in the test-case itself...

I'll add a comment and mention it in the commit message.

Thanks,
Edgar

