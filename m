Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E491CF5BB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 15:27:00 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYUvz-00026K-Ti
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 09:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jYUnx-0007aJ-10; Tue, 12 May 2020 09:18:41 -0400
Received: from mail-bn8nam11on2061.outbound.protection.outlook.com
 ([40.107.236.61]:26970 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jYUns-0001zv-Jp; Tue, 12 May 2020 09:18:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3ePuXFZg2C7/ckRFT08Myp5ZfHlquL8ILS53I1P+GUxT4fYmX8iHUlDIPEC1XeJDLqTB7pGCPq1spLgK8/9lkn1n0Oix4baEaa+P/nHsXHYyk1NtZxyPcQJmLkHraHMLwdPPMJHtsaPThllPjmGzsWgTttABwdD0CMCAzv79NhF5h9SUdWwBtFMQvx4vTGFzOpL34xWx+njQppkMqr9UUnyX0vgfaF0QkzPdS8k1TaEev8yShA0r8x1Yc8VnCjnzDkHtlyqhF1OQVTQCh1bEcvRL7KqamZjYEiRwN8A5rCCikB55DDMdu2zoC7k8MmXG1CPFUxLHyO49IaJoVaxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDDfQay8WPdmdMcKmLynxs0u9Nr1s4msHPOvoJh9eKE=;
 b=iUPW4xAQSr857fH90o90h3mxkSgQkAQ6gLxblbaggXiJtNLHrH5Gfygdjwo2Jsy1pl6JXQ+1wlnsdyxHl1CObpSZXtj99r0RJ3zc3Tx1iuKnw4AVdgpNCRGx6mwP7WMYUxmDHLmOWei8cJVV0YszVhxAXUgW+uEz/iXbRMK6JxrHh341Gw24T1nke1u1dfizTuuZieUju69aTorkddLZeyY7DaKl4lZUMKBPnDpvoiP3nxTRrrkjFEMFUU3288T/0sQ01PYDD9oaHva6px5wz9ExCCx6n91NKM3vH0QaiRrDKmPl2pUwqB3au+mIHvqo/CopT9Uh332OnpifNCrdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDDfQay8WPdmdMcKmLynxs0u9Nr1s4msHPOvoJh9eKE=;
 b=Uxzrp53PUBJJbeUkrfYda4Q/28IJIVMLa2HL6hEGHPbz2+7QluZEFgwzIOg2qDhJauYzHUtMFjPUoL5vPeEE5FKE6grbOBA2U2tNannScAtibyASRoXvhdx4JL1PO5sBe7pJGa9WWM9hD/vh3ro9nyyX6sAwSAbpp08emjU4V1s=
Received: from SN4PR0501CA0081.namprd05.prod.outlook.com
 (2603:10b6:803:22::19) by BYAPR02MB5543.namprd02.prod.outlook.com
 (2603:10b6:a03:9f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Tue, 12 May
 2020 13:18:33 +0000
Received: from SN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::1) by SN4PR0501CA0081.outlook.office365.com
 (2603:10b6:803:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.12 via Frontend
 Transport; Tue, 12 May 2020 13:18:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT050.mail.protection.outlook.com (10.152.72.128) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Tue, 12 May 2020 13:18:33
 +0000
Received: from [149.199.38.66] (port=47692 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jYUnY-0002Qb-OP; Tue, 12 May 2020 06:18:16 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jYUno-0005ZR-Vt; Tue, 12 May 2020 06:18:33 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04CDIVs5028654; 
 Tue, 12 May 2020 06:18:31 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1jYUnn-0005Yh-74; Tue, 12 May 2020 06:18:31 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 454D613C0170; Tue, 12 May 2020 18:40:28 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v4 07/12] net: cadence_gem: Fix up code style
Date: Tue, 12 May 2020 18:40:02 +0530
Message-Id: <1589289007-23629-8-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589289007-23629-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1589289007-23629-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(39860400002)(396003)(46966005)(33430700001)(70206006)(81166007)(2906002)(47076004)(8676002)(6666004)(356005)(70586007)(82740400003)(33440700001)(82310400002)(478600001)(110136005)(42186006)(26005)(30864003)(316002)(186003)(2616005)(4326008)(36756003)(5660300002)(6266002)(426003)(8936002)(336012);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 558cdf6b-a7d8-4699-7894-08d7f676f896
X-MS-TrafficTypeDiagnostic: BYAPR02MB5543:
X-Microsoft-Antispam-PRVS: <BYAPR02MB554342EB998FFE43AE94DEFACABE0@BYAPR02MB5543.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmh5T9yDtOxMcZ+BhEJ3DsGFC8z3Msan81VHOVVY1qIL6DIm4ChRR3cZSfzObB3EHLz1z4Zq5dUFDo1h1+7MRlwshDKe6r7fei7gEsPLHTUCSNqEFAbcyxPBgxzcD7nMC0jsvVYiVOCIRGaPoz9WGR1KQ2NtjEkMCLUiakqzrv80sM7P4q/WxdYzjXrFQGbuflNopI1Qms6ounBCtpxyrcZWM3d4Zq55IIlgWPLrd3HShasFkenKVjnvcQeMeD4FfAhGIAwXTm7FVHWzamEMFYZR9hsZaaIi+d2brFPifOk38f5ldm97hsLG75KeOcjtt0/ELxCGJBLZcNTRCIz+/20CttfkX0wLNw0IhKMZuHqfffDoa5Uj3oBT+CvE8NfHgcQnjNsoL7Lw2ZFgW5+bS/HBRbkeXbNdZ0/nuCtQh61xAcPpd2jZQ87ytLt/FB0i+EM6ZZOwLZ/ncidxBAGdBJpwQUbktB89vDyrEsA7jkOT2aE6itn7hAPfL1rv1VRtO0HGK9TI9kydz763DJ4X3Dib1UJKs1SHZ3aWEV3UsN1ct2+OKVa3YMOEPVSjmMDcMNypw1SqfldJigxFd0kjng==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 13:18:33.3259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558cdf6b-a7d8-4699-7894-08d7f676f896
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5543
Received-SPF: pass client-ip=40.107.236.61; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 09:18:35
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the code style for register definitions.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/net/cadence_gem.c | 204 ++++++++++++++++++++++++++-------------------------
 1 file changed, 103 insertions(+), 101 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 11e36d0..f6ff27c 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -43,110 +43,112 @@
     } \
 } while (0)
 
-#define GEM_NWCTRL        (0x00000000/4) /* Network Control reg */
-#define GEM_NWCFG         (0x00000004/4) /* Network Config reg */
-#define GEM_NWSTATUS      (0x00000008/4) /* Network Status reg */
-#define GEM_USERIO        (0x0000000C/4) /* User IO reg */
-#define GEM_DMACFG        (0x00000010/4) /* DMA Control reg */
-#define GEM_TXSTATUS      (0x00000014/4) /* TX Status reg */
-#define GEM_RXQBASE       (0x00000018/4) /* RX Q Base address reg */
-#define GEM_TXQBASE       (0x0000001C/4) /* TX Q Base address reg */
-#define GEM_RXSTATUS      (0x00000020/4) /* RX Status reg */
-#define GEM_ISR           (0x00000024/4) /* Interrupt Status reg */
-#define GEM_IER           (0x00000028/4) /* Interrupt Enable reg */
-#define GEM_IDR           (0x0000002C/4) /* Interrupt Disable reg */
-#define GEM_IMR           (0x00000030/4) /* Interrupt Mask reg */
-#define GEM_PHYMNTNC      (0x00000034/4) /* Phy Maintenance reg */
-#define GEM_RXPAUSE       (0x00000038/4) /* RX Pause Time reg */
-#define GEM_TXPAUSE       (0x0000003C/4) /* TX Pause Time reg */
-#define GEM_TXPARTIALSF   (0x00000040/4) /* TX Partial Store and Forward */
-#define GEM_RXPARTIALSF   (0x00000044/4) /* RX Partial Store and Forward */
-#define GEM_HASHLO        (0x00000080/4) /* Hash Low address reg */
-#define GEM_HASHHI        (0x00000084/4) /* Hash High address reg */
-#define GEM_SPADDR1LO     (0x00000088/4) /* Specific addr 1 low reg */
-#define GEM_SPADDR1HI     (0x0000008C/4) /* Specific addr 1 high reg */
-#define GEM_SPADDR2LO     (0x00000090/4) /* Specific addr 2 low reg */
-#define GEM_SPADDR2HI     (0x00000094/4) /* Specific addr 2 high reg */
-#define GEM_SPADDR3LO     (0x00000098/4) /* Specific addr 3 low reg */
-#define GEM_SPADDR3HI     (0x0000009C/4) /* Specific addr 3 high reg */
-#define GEM_SPADDR4LO     (0x000000A0/4) /* Specific addr 4 low reg */
-#define GEM_SPADDR4HI     (0x000000A4/4) /* Specific addr 4 high reg */
-#define GEM_TIDMATCH1     (0x000000A8/4) /* Type ID1 Match reg */
-#define GEM_TIDMATCH2     (0x000000AC/4) /* Type ID2 Match reg */
-#define GEM_TIDMATCH3     (0x000000B0/4) /* Type ID3 Match reg */
-#define GEM_TIDMATCH4     (0x000000B4/4) /* Type ID4 Match reg */
-#define GEM_WOLAN         (0x000000B8/4) /* Wake on LAN reg */
-#define GEM_IPGSTRETCH    (0x000000BC/4) /* IPG Stretch reg */
-#define GEM_SVLAN         (0x000000C0/4) /* Stacked VLAN reg */
-#define GEM_MODID         (0x000000FC/4) /* Module ID reg */
-#define GEM_OCTTXLO       (0x00000100/4) /* Octects transmitted Low reg */
-#define GEM_OCTTXHI       (0x00000104/4) /* Octects transmitted High reg */
-#define GEM_TXCNT         (0x00000108/4) /* Error-free Frames transmitted */
-#define GEM_TXBCNT        (0x0000010C/4) /* Error-free Broadcast Frames */
-#define GEM_TXMCNT        (0x00000110/4) /* Error-free Multicast Frame */
-#define GEM_TXPAUSECNT    (0x00000114/4) /* Pause Frames Transmitted */
-#define GEM_TX64CNT       (0x00000118/4) /* Error-free 64 TX */
-#define GEM_TX65CNT       (0x0000011C/4) /* Error-free 65-127 TX */
-#define GEM_TX128CNT      (0x00000120/4) /* Error-free 128-255 TX */
-#define GEM_TX256CNT      (0x00000124/4) /* Error-free 256-511 */
-#define GEM_TX512CNT      (0x00000128/4) /* Error-free 512-1023 TX */
-#define GEM_TX1024CNT     (0x0000012C/4) /* Error-free 1024-1518 TX */
-#define GEM_TX1519CNT     (0x00000130/4) /* Error-free larger than 1519 TX */
-#define GEM_TXURUNCNT     (0x00000134/4) /* TX under run error counter */
-#define GEM_SINGLECOLLCNT (0x00000138/4) /* Single Collision Frames */
-#define GEM_MULTCOLLCNT   (0x0000013C/4) /* Multiple Collision Frames */
-#define GEM_EXCESSCOLLCNT (0x00000140/4) /* Excessive Collision Frames */
-#define GEM_LATECOLLCNT   (0x00000144/4) /* Late Collision Frames */
-#define GEM_DEFERTXCNT    (0x00000148/4) /* Deferred Transmission Frames */
-#define GEM_CSENSECNT     (0x0000014C/4) /* Carrier Sense Error Counter */
-#define GEM_OCTRXLO       (0x00000150/4) /* Octects Received register Low */
-#define GEM_OCTRXHI       (0x00000154/4) /* Octects Received register High */
-#define GEM_RXCNT         (0x00000158/4) /* Error-free Frames Received */
-#define GEM_RXBROADCNT    (0x0000015C/4) /* Error-free Broadcast Frames RX */
-#define GEM_RXMULTICNT    (0x00000160/4) /* Error-free Multicast Frames RX */
-#define GEM_RXPAUSECNT    (0x00000164/4) /* Pause Frames Received Counter */
-#define GEM_RX64CNT       (0x00000168/4) /* Error-free 64 byte Frames RX */
-#define GEM_RX65CNT       (0x0000016C/4) /* Error-free 65-127B Frames RX */
-#define GEM_RX128CNT      (0x00000170/4) /* Error-free 128-255B Frames RX */
-#define GEM_RX256CNT      (0x00000174/4) /* Error-free 256-512B Frames RX */
-#define GEM_RX512CNT      (0x00000178/4) /* Error-free 512-1023B Frames RX */
-#define GEM_RX1024CNT     (0x0000017C/4) /* Error-free 1024-1518B Frames RX */
-#define GEM_RX1519CNT     (0x00000180/4) /* Error-free 1519-max Frames RX */
-#define GEM_RXUNDERCNT    (0x00000184/4) /* Undersize Frames Received */
-#define GEM_RXOVERCNT     (0x00000188/4) /* Oversize Frames Received */
-#define GEM_RXJABCNT      (0x0000018C/4) /* Jabbers Received Counter */
-#define GEM_RXFCSCNT      (0x00000190/4) /* Frame Check seq. Error Counter */
-#define GEM_RXLENERRCNT   (0x00000194/4) /* Length Field Error Counter */
-#define GEM_RXSYMERRCNT   (0x00000198/4) /* Symbol Error Counter */
-#define GEM_RXALIGNERRCNT (0x0000019C/4) /* Alignment Error Counter */
-#define GEM_RXRSCERRCNT   (0x000001A0/4) /* Receive Resource Error Counter */
-#define GEM_RXORUNCNT     (0x000001A4/4) /* Receive Overrun Counter */
-#define GEM_RXIPCSERRCNT  (0x000001A8/4) /* IP header Checksum Error Counter */
-#define GEM_RXTCPCCNT     (0x000001AC/4) /* TCP Checksum Error Counter */
-#define GEM_RXUDPCCNT     (0x000001B0/4) /* UDP Checksum Error Counter */
-
-#define GEM_1588S         (0x000001D0/4) /* 1588 Timer Seconds */
-#define GEM_1588NS        (0x000001D4/4) /* 1588 Timer Nanoseconds */
-#define GEM_1588ADJ       (0x000001D8/4) /* 1588 Timer Adjust */
-#define GEM_1588INC       (0x000001DC/4) /* 1588 Timer Increment */
-#define GEM_PTPETXS       (0x000001E0/4) /* PTP Event Frame Transmitted (s) */
-#define GEM_PTPETXNS      (0x000001E4/4) /* PTP Event Frame Transmitted (ns) */
-#define GEM_PTPERXS       (0x000001E8/4) /* PTP Event Frame Received (s) */
-#define GEM_PTPERXNS      (0x000001EC/4) /* PTP Event Frame Received (ns) */
-#define GEM_PTPPTXS       (0x000001E0/4) /* PTP Peer Frame Transmitted (s) */
-#define GEM_PTPPTXNS      (0x000001E4/4) /* PTP Peer Frame Transmitted (ns) */
-#define GEM_PTPPRXS       (0x000001E8/4) /* PTP Peer Frame Received (s) */
-#define GEM_PTPPRXNS      (0x000001EC/4) /* PTP Peer Frame Received (ns) */
+#define GEM_NWCTRL        (0x00000000 / 4) /* Network Control reg */
+#define GEM_NWCFG         (0x00000004 / 4) /* Network Config reg */
+#define GEM_NWSTATUS      (0x00000008 / 4) /* Network Status reg */
+#define GEM_USERIO        (0x0000000C / 4) /* User IO reg */
+#define GEM_DMACFG        (0x00000010 / 4) /* DMA Control reg */
+#define GEM_TXSTATUS      (0x00000014 / 4) /* TX Status reg */
+#define GEM_RXQBASE       (0x00000018 / 4) /* RX Q Base address reg */
+#define GEM_TXQBASE       (0x0000001C / 4) /* TX Q Base address reg */
+#define GEM_RXSTATUS      (0x00000020 / 4) /* RX Status reg */
+#define GEM_ISR           (0x00000024 / 4) /* Interrupt Status reg */
+#define GEM_IER           (0x00000028 / 4) /* Interrupt Enable reg */
+#define GEM_IDR           (0x0000002C / 4) /* Interrupt Disable reg */
+#define GEM_IMR           (0x00000030 / 4) /* Interrupt Mask reg */
+#define GEM_PHYMNTNC      (0x00000034 / 4) /* Phy Maintenance reg */
+#define GEM_RXPAUSE       (0x00000038 / 4) /* RX Pause Time reg */
+#define GEM_TXPAUSE       (0x0000003C / 4) /* TX Pause Time reg */
+#define GEM_TXPARTIALSF   (0x00000040 / 4) /* TX Partial Store and Forward */
+#define GEM_RXPARTIALSF   (0x00000044 / 4) /* RX Partial Store and Forward */
+#define GEM_HASHLO        (0x00000080 / 4) /* Hash Low address reg */
+#define GEM_HASHHI        (0x00000084 / 4) /* Hash High address reg */
+#define GEM_SPADDR1LO     (0x00000088 / 4) /* Specific addr 1 low reg */
+#define GEM_SPADDR1HI     (0x0000008C / 4) /* Specific addr 1 high reg */
+#define GEM_SPADDR2LO     (0x00000090 / 4) /* Specific addr 2 low reg */
+#define GEM_SPADDR2HI     (0x00000094 / 4) /* Specific addr 2 high reg */
+#define GEM_SPADDR3LO     (0x00000098 / 4) /* Specific addr 3 low reg */
+#define GEM_SPADDR3HI     (0x0000009C / 4) /* Specific addr 3 high reg */
+#define GEM_SPADDR4LO     (0x000000A0 / 4) /* Specific addr 4 low reg */
+#define GEM_SPADDR4HI     (0x000000A4 / 4) /* Specific addr 4 high reg */
+#define GEM_TIDMATCH1     (0x000000A8 / 4) /* Type ID1 Match reg */
+#define GEM_TIDMATCH2     (0x000000AC / 4) /* Type ID2 Match reg */
+#define GEM_TIDMATCH3     (0x000000B0 / 4) /* Type ID3 Match reg */
+#define GEM_TIDMATCH4     (0x000000B4 / 4) /* Type ID4 Match reg */
+#define GEM_WOLAN         (0x000000B8 / 4) /* Wake on LAN reg */
+#define GEM_IPGSTRETCH    (0x000000BC / 4) /* IPG Stretch reg */
+#define GEM_SVLAN         (0x000000C0 / 4) /* Stacked VLAN reg */
+#define GEM_MODID         (0x000000FC / 4) /* Module ID reg */
+#define GEM_OCTTXLO       (0x00000100 / 4) /* Octects transmitted Low reg */
+#define GEM_OCTTXHI       (0x00000104 / 4) /* Octects transmitted High reg */
+#define GEM_TXCNT         (0x00000108 / 4) /* Error-free Frames transmitted */
+#define GEM_TXBCNT        (0x0000010C / 4) /* Error-free Broadcast Frames */
+#define GEM_TXMCNT        (0x00000110 / 4) /* Error-free Multicast Frame */
+#define GEM_TXPAUSECNT    (0x00000114 / 4) /* Pause Frames Transmitted */
+#define GEM_TX64CNT       (0x00000118 / 4) /* Error-free 64 TX */
+#define GEM_TX65CNT       (0x0000011C / 4) /* Error-free 65-127 TX */
+#define GEM_TX128CNT      (0x00000120 / 4) /* Error-free 128-255 TX */
+#define GEM_TX256CNT      (0x00000124 / 4) /* Error-free 256-511 */
+#define GEM_TX512CNT      (0x00000128 / 4) /* Error-free 512-1023 TX */
+#define GEM_TX1024CNT     (0x0000012C / 4) /* Error-free 1024-1518 TX */
+#define GEM_TX1519CNT     (0x00000130 / 4) /* Error-free larger than 1519 TX */
+#define GEM_TXURUNCNT     (0x00000134 / 4) /* TX under run error counter */
+#define GEM_SINGLECOLLCNT (0x00000138 / 4) /* Single Collision Frames */
+#define GEM_MULTCOLLCNT   (0x0000013C / 4) /* Multiple Collision Frames */
+#define GEM_EXCESSCOLLCNT (0x00000140 / 4) /* Excessive Collision Frames */
+#define GEM_LATECOLLCNT   (0x00000144 / 4) /* Late Collision Frames */
+#define GEM_DEFERTXCNT    (0x00000148 / 4) /* Deferred Transmission Frames */
+#define GEM_CSENSECNT     (0x0000014C / 4) /* Carrier Sense Error Counter */
+#define GEM_OCTRXLO       (0x00000150 / 4) /* Octects Received register Low */
+#define GEM_OCTRXHI       (0x00000154 / 4) /* Octects Received register High */
+#define GEM_RXCNT         (0x00000158 / 4) /* Error-free Frames Received */
+#define GEM_RXBROADCNT    (0x0000015C / 4) /* Error-free Broadcast Frames RX */
+#define GEM_RXMULTICNT    (0x00000160 / 4) /* Error-free Multicast Frames RX */
+#define GEM_RXPAUSECNT    (0x00000164 / 4) /* Pause Frames Received Counter */
+#define GEM_RX64CNT       (0x00000168 / 4) /* Error-free 64 byte Frames RX */
+#define GEM_RX65CNT       (0x0000016C / 4) /* Error-free 65-127B Frames RX */
+#define GEM_RX128CNT      (0x00000170 / 4) /* Error-free 128-255B Frames RX */
+#define GEM_RX256CNT      (0x00000174 / 4) /* Error-free 256-512B Frames RX */
+#define GEM_RX512CNT      (0x00000178 / 4) /* Error-free 512-1023B Frames RX */
+#define GEM_RX1024CNT     (0x0000017C / 4) /* Error-free 1024-1518B Frames RX */
+#define GEM_RX1519CNT     (0x00000180 / 4) /* Error-free 1519-max Frames RX */
+#define GEM_RXUNDERCNT    (0x00000184 / 4) /* Undersize Frames Received */
+#define GEM_RXOVERCNT     (0x00000188 / 4) /* Oversize Frames Received */
+#define GEM_RXJABCNT      (0x0000018C / 4) /* Jabbers Received Counter */
+#define GEM_RXFCSCNT      (0x00000190 / 4) /* Frame Check seq. Error Counter */
+#define GEM_RXLENERRCNT   (0x00000194 / 4) /* Length Field Error Counter */
+#define GEM_RXSYMERRCNT   (0x00000198 / 4) /* Symbol Error Counter */
+#define GEM_RXALIGNERRCNT (0x0000019C / 4) /* Alignment Error Counter */
+#define GEM_RXRSCERRCNT   (0x000001A0 / 4) /* Receive Resource Error Counter */
+#define GEM_RXORUNCNT     (0x000001A4 / 4) /* Receive Overrun Counter */
+#define GEM_RXIPCSERRCNT  (0x000001A8 / 4) /* IP header Checksum Err Counter */
+#define GEM_RXTCPCCNT     (0x000001AC / 4) /* TCP Checksum Error Counter */
+#define GEM_RXUDPCCNT     (0x000001B0 / 4) /* UDP Checksum Error Counter */
+
+#define GEM_1588S         (0x000001D0 / 4) /* 1588 Timer Seconds */
+#define GEM_1588NS        (0x000001D4 / 4) /* 1588 Timer Nanoseconds */
+#define GEM_1588ADJ       (0x000001D8 / 4) /* 1588 Timer Adjust */
+#define GEM_1588INC       (0x000001DC / 4) /* 1588 Timer Increment */
+#define GEM_PTPETXS       (0x000001E0 / 4) /* PTP Event Frame Transmitted (s) */
+#define GEM_PTPETXNS      (0x000001E4 / 4) /*
+                                            * PTP Event Frame Transmitted (ns)
+                                            */
+#define GEM_PTPERXS       (0x000001E8 / 4) /* PTP Event Frame Received (s) */
+#define GEM_PTPERXNS      (0x000001EC / 4) /* PTP Event Frame Received (ns) */
+#define GEM_PTPPTXS       (0x000001E0 / 4) /* PTP Peer Frame Transmitted (s) */
+#define GEM_PTPPTXNS      (0x000001E4 / 4) /* PTP Peer Frame Transmitted (ns) */
+#define GEM_PTPPRXS       (0x000001E8 / 4) /* PTP Peer Frame Received (s) */
+#define GEM_PTPPRXNS      (0x000001EC / 4) /* PTP Peer Frame Received (ns) */
 
 /* Design Configuration Registers */
-#define GEM_DESCONF       (0x00000280/4)
-#define GEM_DESCONF2      (0x00000284/4)
-#define GEM_DESCONF3      (0x00000288/4)
-#define GEM_DESCONF4      (0x0000028C/4)
-#define GEM_DESCONF5      (0x00000290/4)
-#define GEM_DESCONF6      (0x00000294/4)
+#define GEM_DESCONF       (0x00000280 / 4)
+#define GEM_DESCONF2      (0x00000284 / 4)
+#define GEM_DESCONF3      (0x00000288 / 4)
+#define GEM_DESCONF4      (0x0000028C / 4)
+#define GEM_DESCONF5      (0x00000290 / 4)
+#define GEM_DESCONF6      (0x00000294 / 4)
 #define GEM_DESCONF6_64B_MASK (1U << 23)
-#define GEM_DESCONF7      (0x00000298/4)
+#define GEM_DESCONF7      (0x00000298 / 4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
 #define GEM_INT_Q1_MASK                 (0x00000640 / 4)
-- 
2.7.4


