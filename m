Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CABA3211EB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:24:36 +0100 (CET)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6WA-0006A0-8G
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OD-0004dM-7H; Mon, 22 Feb 2021 03:16:21 -0500
Received: from mail-mw2nam10on2076.outbound.protection.outlook.com
 ([40.107.94.76]:64640 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O5-0001kL-JM; Mon, 22 Feb 2021 03:16:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpYEIf6jK2GBk7CvtYSqcjF7JshkVmQwo9G6ZIv9c2EseyFzPxFBPmpsl+h1MOriHqPmPabRADfxaGECLifNMWlyhB6sm+tc+3kJqJSdMOrHlArqIXCNQkt1KgyA6oDPdnNTOpn4xolEwVb3o4WAJDz0YY2vEET569I8j/vaQvfKDA3/pT3TlpC/FI3LZBgqTFLH/LVPwqT1114JoIcpAYPiEiXzMUgF1jPi50pVgZRF/6O5sy7PDfIU4w74cX4gDQQBjy1VIeUOWUQ0JHI5X5067Iq1UT/DZHBbnbW3L+InswA8JgGYTOLxqaCXE/ArqSD2bj8rgJQ8VXPvV2YvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+V58E0lPxN7LZLjHTVHiekcex7/jWy26Xfug+xaXrw=;
 b=N//z2HhGBKmPMJGbkWHzBUtYZBNVI6CMhPJfAAgZMGugcpvbEo98JUM7gMt+6GXtI/MktaPWfPv0VDnrIYPERdZ7hQBF/QiH3NTXpVci++QAIHvafQjr/pX7qA2Q63LE6khs/a28VEVGvmlEfqoctLechm7LP2L2sUYGjAC86YWsad/Z1DWwo/y3Z/TSCgCk3qAD0z+eHAzCLfbzTQMIO33/NdKS56M/eWAR/iyTy9VhJfNVZ+r9grjtCDDJSMAQ4/mgkbCpgwcRJLkKAfQLkrdgpyiMGhcFYQw95TgTeLq4EtDRJ6d6E+Xqdg3RWVRCK4PlTZ0WTbjT8L6lRTtCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+V58E0lPxN7LZLjHTVHiekcex7/jWy26Xfug+xaXrw=;
 b=h8c7y30ojIVzlsvEheIdf9w/QBaBGXf/eEi+V/wpr1d7CtPYZQbP0iEPs8qTD/DHFb7gQxLxfi3uvF7N4e1e+rMUtj3QXia+2RidWOLQYNrgJVpi7NeZ6mHJPSjQ/v8tCtO9jf4gehTlWUyr9IJlyM6Q/4arl1NikxL10XxHiA0=
Received: from SN7PR04CA0259.namprd04.prod.outlook.com (2603:10b6:806:f3::24)
 by DM6PR02MB6249.namprd02.prod.outlook.com (2603:10b6:5:1d0::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Mon, 22 Feb
 2021 08:16:09 +0000
Received: from SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3::4) by SN7PR04CA0259.outlook.office365.com
 (2603:10b6:806:f3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT043.mail.protection.outlook.com (10.152.72.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:15:59 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:15:59 -0800
Received: from [10.140.6.35] (port=59026 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nq-00036o-Ob; Mon, 22 Feb 2021 00:15:59 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id AA04813C01EB; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 01/22] block: add eMMC block device type
Date: Mon, 22 Feb 2021 13:50:18 +0530
Message-ID: <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3338e57-3771-4304-95bd-08d8d70a1bbe
X-MS-TrafficTypeDiagnostic: DM6PR02MB6249:
X-Microsoft-Antispam-PRVS: <DM6PR02MB62499B8AB961ACC7FCE31930CA819@DM6PR02MB6249.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z92fr9Bf3qtq4P8KUzpkfIyIFR3zVeh/gLEQ9RevUciEcNfXLwbvxECzd7FZO3I2GnYwG9U5IoX1E5Zav1DhJ/3+syd/Zp+rTSEK0pqVv/8d8IjmX2kDGK4pR6MW7T5ulSH9t/c9u6zGplGFHKX7XGpyVhtQrXnr3WzkuY5c7EoUzCxLa/VyCnIaYMRR7hWw4viA85jpqKBk1L3+nA8z57+KssedvcX3qKwdGMTB2JsrHQdqU05vBzI1G+6rYf3T/Gai/jfsi5rYTHnFTSjtBln2gEBkY4KJBFO+PghzmiHqvP31htMezs/8Ls/nbzbAn3YdyDTaHUXZdaDMxrYuM1wGlTUAbQMfPUq0de5NCwthTwodVfgr1kvK1jXTN9BKM7qHAulTpsXGBBE+1oijT9soc9x12ScRJGAojkHOW2RZzKQIhP629K5CcikrbL/k6yE0diqHF5cJlUAClqUpnIc0oj7ZmbJxWZXImyrocIWx3SsGbb+Gg4De6w9Rg2/OBX55cqz9kqjmA3mi8Klu5d8mOaf73sOyEim7VmRsKwIL72ae4pnbjqmIiAQFdYSoxvXobcUeEk4AH7miGJ3So4D9IgegKgEbSaAMy/cgdC1tA65GovUlpb5rCKXWtyLw9iFLwqmuRpsKaWX3Ei1+7e+up5Kl0Njg5wOnzOKmrekt42xwkINNLBapW+bxEBZXtGlRgf3ph+Q+Vi/nxbQZ2Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39850400004)(46966006)(36840700001)(8936002)(2906002)(36860700001)(54906003)(70206006)(5660300002)(426003)(478600001)(7636003)(42186006)(36756003)(83380400001)(26005)(36906005)(316002)(110136005)(82310400003)(356005)(70586007)(186003)(47076005)(107886003)(7416002)(8676002)(6666004)(6266002)(2616005)(4326008)(921005)(336012)(82740400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:08.7225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3338e57-3771-4304-95bd-08d8d70a1bbe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6249
Received-SPF: pass client-ip=40.107.94.76; envelope-from=saipava@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

From: Vincent Palatin <vpalatin@chromium.org>

Add new block device type.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
[SPB: Rebased over 5.1 version]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/sysemu/blockdev.h | 1 +
 blockdev.c                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 3b5fcda..eefae9f 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -24,6 +24,7 @@ typedef enum {
      */
     IF_NONE = 0,
     IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_EMMC,
     IF_COUNT
 } BlockInterfaceType;
 
diff --git a/blockdev.c b/blockdev.c
index cd438e6..390d43c 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] = {
     [IF_SD] = "sd",
     [IF_VIRTIO] = "virtio",
     [IF_XEN] = "xen",
+    [IF_EMMC] = "emmc",
 };
 
 static int if_max_devs[IF_COUNT] = {
-- 
2.7.4


