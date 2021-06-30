Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A671C3B8649
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:32:24 +0200 (CEST)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycCM-0004E3-80
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <federico.vaga@cern.ch>)
 id 1lyar5-0001ck-CH
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:06:19 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com
 ([40.107.7.54]:18254 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <federico.vaga@cern.ch>)
 id 1lyaqx-0007fM-P1
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:06:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSfFQkQfnpRbMA5qHsctAIc+BWBFX1Td8fEaegl1Hu+0adcCye7LQ+0LTtq+inN78zAG7zaF7ijPzEjJ2JpJDvvTPAz4jaznCQYDTgNTM+B4S/xLALnzuC6amFThYK6X0GGbd274WEBP5DT0WnHa1ZBdskPK4V23Mii5oPns18+fnvgXe90speSv9IIGk6SdjI6lfzDMYVxvcJfGAxHB6ypHpKLCIEYZL/n0dgplSdWeHXm+dcPYTAFnUeHruo8+EAIOSWfaYOGE3fwTmHzpqBrXy9l38MX4Htj4KcKh9Oe39IMDMLNdDOlxcrIRP8pA1MkI3Hv1T0YmUXdgdd31Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOjqHNTuSZUMPU6GzONn4FqJEHp8m/8y5Ilr+08sFLM=;
 b=RaZwFn2clp33MDv0ojyNFi/y00kRSRq0yB/fbLaalDDRKzcQt7mRBfgjb978Kd7fpduDDtKGyStqGYvJBIpm+bKG1oj6xriZpeL/gvmbUAUZPw2viYhB09xwbiGuXwaIYKMj+5sHdc/3Z8EpNWICr6F7qbwWmYBUXoXc8vKi38RhIMhS2xcNMCBbF+4bUXNsOZnmVJHTNMEK++LTzLFQz6/kceaLv487XT+BC/4HqWpyBoMs4/IFvEdmLDlNlAydFwAu6IMDW9klO3WqfcAmTWWpoxdsFVt8fUjC8MaMOgHoTxzXYZYpoGT13eY4c6IJKnYqtsRzdppOMRG4mta2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 188.184.36.50) smtp.rcpttodomain=nongnu.org smtp.mailfrom=cern.ch;
 dmarc=bestguesspass action=none header.from=cern.ch; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com; 
 s=selector2-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOjqHNTuSZUMPU6GzONn4FqJEHp8m/8y5Ilr+08sFLM=;
 b=d73Qv0R3IcepnlyHOPpqr84GhjtyMyYU03hPTDHl9vWXMqGvAXbmRFjzsJRBwCvKhxvQfubCilhrniPfani85sNEm5FxUeTlZAUlyzHiN6WKG5elGqom6Bl+jp5zb2imgS5eSZ7GnXw3u11XOYY7T9Hx08dgxttzQ69k40Mi2tE=
Received: from PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13)
 by AM8PR06MB7137.eurprd06.prod.outlook.com (2603:10a6:20b:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 14:01:06 +0000
Received: from HE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:102:19e:cafe::ba) by PR1P264CA0008.outlook.office365.com
 (2603:10a6:102:19e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Wed, 30 Jun 2021 14:01:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 188.184.36.50)
 smtp.mailfrom=cern.ch; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.50; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.50) by
 HE1EUR02FT057.mail.protection.outlook.com (10.152.11.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 14:01:05 +0000
Received: from cernfe04.cern.ch (188.184.36.41) by cernmxgwlb4.cern.ch
 (188.184.36.50) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 30 Jun
 2021 16:01:04 +0200
Received: from cwe-513-vol689.cern.ch (2001:1458:d00:7::100:1c8) by
 smtp.cern.ch (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Wed, 30 Jun 2021 16:01:04 +0200
Date: Wed, 30 Jun 2021 16:01:02 +0200
From: Federico Vaga <federico.vaga@cern.ch>
To: <qemu-devel@nongnu.org>
Subject: Contributions: Adding New Devices
Message-ID: <20210630140102.ecuyxyeqnthvausb@cwe-513-vol689.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-Originating-IP: [2001:1458:d00:7::100:1c8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21843a85-fafc-4ec9-1567-08d93bcf8125
X-MS-TrafficTypeDiagnostic: AM8PR06MB7137:
X-Microsoft-Antispam-PRVS: <AM8PR06MB71376E833DA17425E791B5BAEF019@AM8PR06MB7137.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0kJnhyaRw9qmG2ZMeCOq907XrIHdaDnvBHdo/T/uec/0/7eCs7Iruh7pWGqQFKzaj/y4jmV2SMPxl30mm8kFVvjFT6433J33iq9xyRn94da0kmPU01jWyG1vLf9yRA6FT569qCWGMBFcPRy0CLvx+HnqJg5x1HZf+0MUUBNEYfO5xzs0Ti2lWqjLIeR5vPdiVD+3FprO/OVMCxwOChZB7A0kRmOAJ/dglCQgdbBn5j3Zuk/djR0U/rKCqQCdwzkPdJK2GWgowrzpJFOK4Ti31UJgnEEuAW20Z7ZKdVB19yznW6kaXkXnB2p0kkuPBbp2S0wiEkVxXgWksqXcn06GwLjIWItrLhLvqlCxeoOc4w6RAhTCX0V0FzekEC8o+a8lQ1G0M6CDFdsd0YAVP6hPCXJKILgOaM8+CNZL7a0ubcw+A8fg4rHRRx5ihxVRGQjzvV7A3Mtoh2/huLwQtr/lQygwl2WGy1l60R2JKQCyz4kO3GZlnNJzYkUpnu6yDZrnB/VfcqDAaM+FTPwiN1XyxVWUqGBjKZktsNzgPmrMLb+htLe7WqxtQZglbaDqcR2MNjl77eCb9BHmxDTa5gH+h0c3zJm8r3DI68x2wQdxxxMLhxvtK5gGc7U8uUHZB3tTylKLTst0gsDzX9bp9DjLp1qJ6CYyfcgzKZtxnTk8eYa6aoYbnqgHbAdZgnjm32DQxzOjnC2Wdg7uf3H36sbnA==
X-Forefront-Antispam-Report: CIP:188.184.36.50; CTRY:CH; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:cernmxgwlb4.cern.ch; PTR:cernmx11.cern.ch; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(396003)(136003)(36840700001)(46966006)(36860700001)(26005)(316002)(55016002)(16526019)(186003)(47076005)(82310400003)(70586007)(82740400003)(70206006)(3716004)(1076003)(7696005)(4744005)(7636003)(2906002)(5660300002)(44832011)(426003)(8936002)(8676002)(356005)(336012)(86362001)(6916009)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 14:01:05.7877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21843a85-fafc-4ec9-1567-08d93bcf8125
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19; Ip=[188.184.36.50];
 Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7137
Received-SPF: pass client-ip=40.107.7.54; envelope-from=federico.vaga@cern.ch;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Jun 2021 11:30:41 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I can't find this information on the website, so here I am.

I developed a QEMU device that virtualises a PCI card that we widely use at CERN.
But this card is only used at CERN.

Clearly, having CERN specific devices in QEMU does not help much the qemu
community, hence I maintain an internal QEMU fork.

But, I was wondering what is the QEMU policy about contributions that are known to be
used only by a handful of people (one organization in this case)? Are they accepted?

Second. Even if you will not accept such contribution, are you anyway open to reviews?
I'm not QEMU expert, so it would be nice if someone can review what I wrote.

--
Federico Vaga

