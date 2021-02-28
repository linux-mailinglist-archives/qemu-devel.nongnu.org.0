Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F532743C
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:45:03 +0100 (CET)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRzy-0003aI-3C
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlE-0000Np-Go; Sun, 28 Feb 2021 14:29:48 -0500
Received: from mail-eopbgr760050.outbound.protection.outlook.com
 ([40.107.76.50]:39651 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl5-0003GA-RS; Sun, 28 Feb 2021 14:29:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VP9AFLdkMGiPTKBjbCOPwbFgmTnIR4tTL7/pyp3r5lAaBUTyJ6zz+JnadnflowuvdAC8tw7oSVP1L+dMy5xKjflP+I/ZBD6TXM1U7IIlc0ynNkAsTYzQNihYp0SXJJxUys0SxUiMU80mM6eBgXbrQMVUm9bf5fpYTaRtD5j7gBF83K3Kz+yfhGt/KhIxPJZ7ZoIFKdwnsqSn0OYrjh13gCVuTFdiAFI4QmESET65eteesvVso2ihDhyeR7lSMpjV19vz2jbyi2WJVYFGlarMdyMWgE2Jo2R5KnL8sbx3KPykHwmuagrM5fITESxsWHlkJ6SDf8kcsCmBbj8NwieenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK0drmK3qmsWWuhMkAHCjTpGIn2Dpoqsy7kEAMwQCZg=;
 b=TbX3/sRCuniPUhtaexayp0BXddKI98/5B6Q4VrFO0T6nWC6H+HThYMOPdICs/P18ZjGISC78/aBNBOJgO+xyWmKffh36b73lDdPj/xmWcEnbwtR49uXcIhCeLxiRXKmiCRM0W475eKGo5TvE8Zo5bPqdRJDQTeHPTvIujRoyjj37AJJvW0K+8ieW5aF8gJiU8NTe5Pkg+VKabN6SL1oiOT/Fy5WymfXVkWUMPEgJMxu9/y+j1C12oR7tMPmxotWKVHTg7CexA0GmBca2d1mZfQBLfGl969bWiPBlG2ciNsibvSwWKPCNwA25Qj2DYwWt1prdYnpdrsCbvWbhDgjo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK0drmK3qmsWWuhMkAHCjTpGIn2Dpoqsy7kEAMwQCZg=;
 b=Gmq6QR4p4gVSJgK0XfDr/KQbZvO/RC0E+EjubYWNxMahsXXBKh29ey9U/1+MK9GnxCi1YpupYgCoK6DGY8WtS3ixGdN2MFibMfUydWRaugJb8Hh3Vd2BbCrYeOiqa0cKvyyOaKU3lvmWmp/Z+OlbgO7jXQ338q/9TdPDq8VK03w=
Received: from CY4PR03CA0020.namprd03.prod.outlook.com (2603:10b6:903:33::30)
 by MWHPR02MB2733.namprd02.prod.outlook.com (2603:10b6:300:109::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sun, 28 Feb
 2021 19:29:33 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::6e) by CY4PR03CA0020.outlook.office365.com
 (2603:10b6:903:33::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:32 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57782 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0008B1-St; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id B172513C0ABB; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [PATCH v3 14/21] sd: emmc: Add support for emmc erase
Date: Mon, 1 Mar 2021 01:03:20 +0530
Message-ID: <1614540807-30686-15-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c374fbce-f712-451c-ba41-08d8dc1f2cd0
X-MS-TrafficTypeDiagnostic: MWHPR02MB2733:
X-Microsoft-Antispam-PRVS: <MWHPR02MB27333602F45D257B9558EBB3CA9B9@MWHPR02MB2733.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zstPc1RXELP46Q659iwed0Jc6k26V+MgTa6XFNTieQSlR8+0LgnkBUofBJvyB/fQmBNuneAFngrjjDsSPDMh4v/Xbxwg9qAP0f5wHsfP7bCdWpvPqkJnqJbgznK9rdhmFmHLJuSysTDMpeXf+0LvytQRRNBXEU3lr7tpaO21gSTKCFUVwbgep2soH5rztp2aXubMNlUoOWQA40bXyrAP7OQdX47NedwS3AW08WfqbuAvw5lRPCGESsSKoS5YBZJlouapWW9Gt+tbouR+G+2qi4/Dp3Ip4UuARTwLsf9qv52fjSXGHESkfeAHf+vawo8RzRuKWAWkjAKs0FqjGmqQ1qtsfNC05xGqV7GI934M7K/wiYFnIlDIWspnkhXmYtH9U6q42nuAeJtP92oQkT68lkDjIS97ThAUM4klbhSgYLCx2/2TcpKuGZy7kI9bZfiN+SIUYmlxIev9yLZqPd8KL3N3O2SQhcIwHmMmvu8odSvHbi8pY2QnniXGbct0EXVM/9Zzcnr5XxxyjLhHjrOWQ/FydtOdiXmlE5c3lVFhMiQZ5oyP6dl9Jq+QV0646sIcL5V49mzBpgxiGCXzNONH8pH0TFvMUqzQJAKw7PnK2uwh49DPIJ/SboEShIGt/AkQvjQ5cUT6YLhL/Ua0pla4D5IAIy5MjgL2U/Edh5qQKe2uPAHFbdQVCRY4M1bUnKB+cpCqASeBKuSipxS4DNYxtg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39850400004)(46966006)(36840700001)(186003)(4326008)(7636003)(478600001)(83380400001)(26005)(36756003)(316002)(6266002)(426003)(82740400003)(107886003)(336012)(47076005)(7416002)(8676002)(70586007)(70206006)(2906002)(2616005)(36860700001)(5660300002)(921005)(6666004)(356005)(82310400003)(54906003)(110136005)(4744005)(8936002)(42186006)(36906005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:32.6259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c374fbce-f712-451c-ba41-08d8dc1f2cd0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2733
Received-SPF: pass client-ip=40.107.76.50; envelope-from=saipava@xilinx.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add CMD35 and CMD36 which sets the erase start and end.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 09c1222..bba0446 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1552,6 +1552,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Erase commands (Class 5) */
     case 32:    /* CMD32:  ERASE_WR_BLK_START */
+    case 35:    /* CMD35:  ERASE_GROUP_START */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_start = req.arg;
@@ -1563,6 +1564,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 33:    /* CMD33:  ERASE_WR_BLK_END */
+    case 36:    /* CMD36:  ERASE_GROUP_END */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_end = req.arg;
-- 
2.7.4


