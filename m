Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791953211DC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:19:20 +0100 (CET)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6R5-0006vJ-BA
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O8-0004ZE-O6; Mon, 22 Feb 2021 03:16:18 -0500
Received: from mail-eopbgr700049.outbound.protection.outlook.com
 ([40.107.70.49]:4167 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O5-0001lB-US; Mon, 22 Feb 2021 03:16:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1xXBoA+wxBjwGTxpeuj2Ep2sNDOda2RC7GXM/9fECLS+xuZpsXBtlXjJ8WvSnxNGpg7VboQIKCUC8bSBkwH8u3Anl4FHDHbnTi7DLpN1BEWpmSnMlXEEVtuI6Sxb8OR8ODidt6CsaFVsT0zy5gtwZ7fCAgXR+NY9uax8T2NBarrwqB4j6Ruxrba2vqtqW8YvNIXYKh8nWvh1oSgMKGTqgCGNLSV4fdBCghoqFp84Rucv8Okqz+u5Wi+n/ZoQMFrrrvh2pKj81+Z5KeUGQ++IZb4ElowtE75bOlWlLpGlLKy7niwXuS1ADwY0v9kHusbbsRj+QCqWUpRUaWxQND3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmYgjZOz2YY3wvMI+yY8F7lYFDU30x9TPh5GS6x9oA8=;
 b=bOrjCpt9l70NPTYYAgotNAE0jA/LyqvMDBX9t4Bi2h6SOsDHjBSmRJVneFb41n9CtG9hMSXnmaCRDPIVFNcs53qFIYDbDzd/rgILJnVBXI3wq2Iw9TwbijbSuwYE01jOcjacvZBoY1VsjQ3jRFRpclgqRx8pi1k0XUyYMp+FAEGWa2onTDnNLc2lg+L4Aks7pB4LQZRMkqYQmI97S89lsy+s05vZB/FuQ6h/WpurRIg2Ot1jV4cfe3689hHu4X/1YkFDxjpGlw3Qsv4C808AF/mtzlPi7i/5UCBUPx/TBZoi+9VXElpuo8QMyIzZELJQU9SIBL9tIOIlI7ZNEMBv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmYgjZOz2YY3wvMI+yY8F7lYFDU30x9TPh5GS6x9oA8=;
 b=rGN7BwXErZJzyIBdMKXT+Guumjsxu7JM2CX/EBW4PVt90kZRraHrP5oXN3Twr8v7YQw2o+/XznhEuov2X7Azvkk6+a5EIL6hd+6fhVcLt5xKgwhsNXSsZGoBYTTM6gvnEvywSGf9gfXUpekJ0VMgkUkpYW3R+3fN0YhMUTeuJYo=
Received: from SN4PR0501CA0081.namprd05.prod.outlook.com
 (2603:10b6:803:22::19) by DM6PR02MB6905.namprd02.prod.outlook.com
 (2603:10b6:5:252::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:10 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::97) by SN4PR0501CA0081.outlook.office365.com
 (2603:10b6:803:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59040 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-0004M3-Ku; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 32E2313C0ADF; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 18/22] sd: emmc: Subtract bootarea size from blk
Date: Mon, 22 Feb 2021 13:50:35 +0530
Message-ID: <1613982039-13861-19-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10f664b-33c7-45ef-2406-08d8d70a1cf2
X-MS-TrafficTypeDiagnostic: DM6PR02MB6905:
X-Microsoft-Antispam-PRVS: <DM6PR02MB69051FF78719E44B406EA12DCA819@DM6PR02MB6905.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmPJoylYM89Vu/vvacCUfjLSEEsGi7WPIR+VHY07XUtRyELH0/l+K1wyAU/D2Gu0lE5XgpuEsaDraoSQb0buhfUJ6nCGG+No5xIQTeVttjEbx8WdEkSHkYqukKXP49pUJ5oPCR+VizCCMnqonNpo7YLfYBJR4g2SwR7fBkNCsI5q8k1/8t8koiwmcXpW5YMnJt6/E/JdwNcTHDrujPrbiuf7Ji1AUfl/afPcJuwU3fkeX5C9+ratGpt42HixRTGmjer77gBw0kTTnH0Sm4vAZld1uT9gqnq9NyXYvaXi/AsDIhJau5mBvjaVjTug4lvbWaVQESPpTP1jBfIgJxHmSoP9lCkgloGmJL61FpzDQfsWv7Bdh+dXQdN06NKZcnITdjKB7cHbeVBMfXPD6PiH4okuKslWrRr78S9ZMU47jYbDv6zWAMJJ/ccu0Yc034wX2fWtne+I0czm1KCx83Q/TiQOcn+0dtiMw9ufQVMD8vbhBlWli2F8sqil4KC2TXX9y9aflY5LhEf+Hzxpxn667qtlbYUvvKTTRxMWZnACDC3kS00P6eRirKQFXjF3Lkp42yroKmywXiqyoJt+JuHpSjRb7oFsUy3gIzu6Z6g+khrFlZdlIJ2H7mKk80tVuXnsFEbh9cPU92jB9wjCFn4HeASorf1GrR5o3xbQQ/fVdKRq9D1dVEv8oq7ASqPaWgLq/e4d7yZNImheOnR5PPSGdw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(46966006)(36840700001)(921005)(426003)(2906002)(6266002)(2616005)(47076005)(336012)(186003)(8676002)(107886003)(36860700001)(478600001)(8936002)(82740400003)(26005)(5660300002)(82310400003)(4326008)(356005)(70586007)(110136005)(70206006)(7636003)(54906003)(42186006)(6666004)(316002)(36906005)(4744005)(66574015)(36756003)(7416002)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:10.7401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a10f664b-33c7-45ef-2406-08d8d70a1cf2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6905
Received-SPF: pass client-ip=40.107.70.49; envelope-from=saipava@xilinx.com;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
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

From: Joel Stanley <joel@jms.id.au>

The userdata size is derived from the file the user passes on the
command line, but we must take into account the boot areas.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index ab29e54..a0b4507 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -653,6 +653,11 @@ static void sd_reset(DeviceState *dev)
     }
     size = sect << 9;
 
+    if (sd->emmc) {
+        unsigned int boot_capacity = sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
+        size -= boot_capacity * 2;
+    }
+
     sect = sd_addr_to_wpnum(size) + 1;
 
     sd->state = sd_idle_state;
-- 
2.7.4


