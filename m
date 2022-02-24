Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E59E4C2F86
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:24:10 +0100 (CET)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNFyT-0008NI-31
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:24:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNFxE-0007gh-E3
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:22:52 -0500
Received: from [2a01:111:f400:7e1a::717] (port=59009
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNFxC-00053C-1n
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:22:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZxBpeEhBuzsvLNk1ajdt5F0Nkl/nkXUYMfadnnEkRJT+GIO8De0sf7moJpSrRqPk8mbZctXLzqaKv4Tr/8O9BxQnbAaZVtpYp4v1iTSs82SWMQ8IUYzk0iiuI3QJ18gimchrUo2yu5QpVu4E3dA/wcVLQybfAdfaAh62KqSGE3cpYZTtIvuXz3/HI+TOcVlHrcSOQPDOXJ1jvOJu307bawmaeGaXIJCOEPPCKMl194F4DMdLZ/roG1qcpzcRauF/eD3mAVgsPu8tcsEEHllvSTZrnK40bwZ32+kkeWOwG5FbSl0tLxBwDxRFN4kg8oGO/2fBoMw5ILc5L2Mr1v/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjewZbVmKPn+2JRLJtP2Ac2d9LZgQIb+onVi0OVsfwE=;
 b=euIzV0TxP47Zcz6Qaa+zGOLqcWD91XveKwWhR82YERFR1tm/9ApmsR90zsX0O3RV5N2G/jJzGRcKvj0JLP4aolrBd/wYDdz839MhD1HglBdkXWQ3fSZcMRxximdGyDJs4Ucpau6IwtMWeWb4DpG5+ZY6QmDO8ColJLA/TS14cjwcINQA3JuvkjhZLHGCfscTORejnuMRGeL5lInXwTwE6OT2X0unMomQzteMk8AlvNJGv6Lv4oLikBV2dSoTkSmBdvD6fSJ8a3UKieCekJ9LIYke/TsytptREporVXtuMSxs+IgPDqY+Zcvs1sh0EhWEpVFqOGNgSewtO3j32Dfvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjewZbVmKPn+2JRLJtP2Ac2d9LZgQIb+onVi0OVsfwE=;
 b=PYYPP4Yo0Z17B5U1FrcJX+dr3hwijnvKPxDXTJEMaMkb5SmPnW5PR4GsPQEdtDRpGt9ffqrErmgHLGdQINRJ1CpVHJYe/+IlziryN64cM0/RBGY3pTggHln8xcSjwjRoDkIQIt80mNkv5SkQLPBBgG260i2qAifngAp1VWzc0uo=
Received: from FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::22)
 by AS8PR09MB5355.eurprd09.prod.outlook.com (2603:10a6:20b:37a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 13:49:47 +0000
Received: from VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::5a) by FR0P281CA0069.outlook.office365.com
 (2603:10a6:d10:49::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9 via Frontend
 Transport; Thu, 24 Feb 2022 13:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 VE1EUR02FT060.mail.protection.outlook.com (10.152.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.23 via Frontend Transport; Thu, 24 Feb 2022 13:49:46 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 1E2431F6C1;
 Thu, 24 Feb 2022 15:49:25 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 0/4] target/nios2: Shadow register set, EIC and VIC
Date: Thu, 24 Feb 2022 15:48:57 +0200
Message-Id: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cacb9983-1576-42e0-882e-08d9f79c852f
X-MS-TrafficTypeDiagnostic: AS8PR09MB5355:EE_
X-Microsoft-Antispam-PRVS: <AS8PR09MB53555BACBF0C4F6609010C9EEB3D9@AS8PR09MB5355.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ZezJTRVEt9jytqv9dSrqOewOzl+QzRFQLcaFgkaKL107IVpLJKhMRqRqTg6PPd0j6lNMaJ3JNDbodib8sZzIxHmZ0GSEv0aNhoD5rD16+dFs5Tw3yGiWvTvpwrMaIpnLWcEgHAurXdeCgF1O0FxlEfgSO4a3udZ2dw8ySb6r/vbLmAna+HNsj2Bo/5lk07Ab8r6ITY7YtIKxgL7DPszgGaunEEyXZY9Q0VuJyBq7MR+huHje2HzcAk8biM9NBT9IMueekAzC8iylK4sG9C/gPYzo6no9MFmz41mP66fQfQxPBZ62vXkz52fNSMdHTP6XrA0rPUR71rbQ/WpspoNU5IBLQ9YAmwkcMtmTntwK171DnbfFzzTeIenlZE7AxYc39HvhkAZEhiWBLG6Q9P9LKTEqmNq3kz/M/Rx9gzZg/JSQgJRWhzefvQdgnsZmwLZ4Jj33fCxna0pkPSeWOmEjHqrutSxVuyT0SwrHxvOpd2xLrrDbPBwe9NN8XPwLvgenwzwKP8mF7rHKlv9QcmDwmmBcRam63cWy3xgq1agI8+y7OjjandlkESMgU0HPJPsY2DwBrRcaka7HwHMReciq2uKfAE9vjc9ZGMDY9Vx0uW7fKG4EqFxQzNdl7YINOo6NbF8EGabufB0aV0kRWYpzIV3DunS24jNLp3g878/4eSFEVoJj7mCF0bSfu3z44Q4AfrOKGA0mULi1QiH4tVUm9QR7c95b9cFlsYUP7P3k4A=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(376002)(39840400004)(34036004)(396003)(136003)(346002)(46966006)(36840700001)(36756003)(6266002)(8676002)(2906002)(8936002)(44832011)(5660300002)(4326008)(70586007)(70206006)(83380400001)(316002)(336012)(40480700001)(81166007)(508600001)(2616005)(186003)(107886003)(1076003)(47076005)(82310400004)(26005)(86362001)(356005)(6666004)(36860700001)(110136005)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:49:46.9829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cacb9983-1576-42e0-882e-08d9f79c852f
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5355
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::717
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::717;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement nios2 Shadow register set, EIC and VIC.

Currently nios2 on QEMU contains an internal Interrupt Controller.
The nios2 architecture can support a more powerful External Interrupt
Controller (EIC) instead of the internal, and implements special cpu
features to support it: Shadow register set and External Interrupt
Controller Interface.

This patch series introduces the necessary changes to the nios2 cpu to
support an External Interrupt Controller, and includes a Vectored
Interrupt Controller (VIC) device that can be attach to the EIC.

Following Peter's suggestion in the previous version, I've splitted this
into several independant patches that rely on each other incrementally
and added a board that wires up the VIC:

1. Shadow Register Set support on the nios2 core
2. External Interrupt Controller interface on the nios2 core
3. Vectored Interrupt Controller
4. A board that uses the VIC instead of the default internal interrupt
   controller

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>

Amir Gonnen (4):
  target/nios2: Shadow register set
  target/nios2: Exteral Interrupt Controller (EIC)
  hw/intc: Vectored Interrupt Controller (VIC)
  hw/nios2: Machine with a Vectored Interrupt Controller

 hw/intc/Kconfig           |   4 +
 hw/intc/meson.build       |   1 +
 hw/intc/nios2_vic.c       | 327 ++++++++++++++++++++++++++++++++++++++
 hw/nios2/10m50_devboard.c |  64 +++++++-
 target/nios2/cpu.c        |  59 +++++--
 target/nios2/cpu.h        |  69 +++++++-
 target/nios2/helper.c     |  33 +++-
 target/nios2/helper.h     |   3 +
 target/nios2/op_helper.c  |  31 +++-
 target/nios2/translate.c  |  32 +++-
 10 files changed, 597 insertions(+), 26 deletions(-)
 create mode 100644 hw/intc/nios2_vic.c

--
2.25.1


The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in error, please immediately alert the sender by reply emai=
l and then delete this message and any attachments. If you are not the inte=
nded recipient, you are hereby notified that any use, dissemination, copyin=
g, or storage of this message or its attachments is strictly prohibited.

