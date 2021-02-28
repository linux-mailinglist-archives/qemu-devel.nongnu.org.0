Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F596327438
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:43:12 +0100 (CET)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRyB-0000uR-1G
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl7-00008V-8n; Sun, 28 Feb 2021 14:29:41 -0500
Received: from mail-mw2nam10on2057.outbound.protection.outlook.com
 ([40.107.94.57]:17569 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0003B4-Qe; Sun, 28 Feb 2021 14:29:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4fMDYDxBUYK7VcXO+dtwTSFMWFZsZpghITPloNga0SuPF/FJUBBIaT83GOQbOjwqnUGZ55DbJPxGZhzmqaLElmzvLey3Lk1pO9fun9wsjWr2AD/jX2M2PGtiePynf8tmo86AVedYirZauV7tH0w0LayilhjAm+57CVwxIGCRDlLFUmjHOGuoczSDt6hd6aayKdAsnLrV7u74emiW+9Pz/ihu+jmIGPnbjrXnC70DFC3m45hSrNCA7LD3oJQF84Hrv6C8AqGd7T5fnS0Ldl9n7XY7X070EvdBDgmNtIpUwApUt19/TI7nRxTQOe4F3fClu2Lm86PwNpY/g7syuwRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctjkaWEmSZXRuCrFXbTqFcjFBKnsZ7eBlJzNNPJKJL0=;
 b=awYUxJyzyGe9wJ/bvRW2/5QprfiWeaypQCkEwpybsuVVWausb+P2BnGi9mriPtIqAV41zF8WOqj7m2cepM+TYjXJHBmjptkL/FfiDu0YKgAq85JEvBW45ROjaz/1d06z6GSAEO4Tu5XPOsaTyZmV4n4/NeQVIoB/N/3oEwogQ7Wey4eNANPtgiyZEL0MfJvLJl72FcUuI+d0DWzhxspo5jLXw3U1Lw7yGBorv1TZN9Nq65PekyGqVf1RIh4n2+LyLZXGM5yerByQZ5UaReWTHpLbKx5Nb4P/JEe1pu3pzKmafL9VHN/cdqeZjGOnAVVDNzcWGavN4QaK8+Q+LQWFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctjkaWEmSZXRuCrFXbTqFcjFBKnsZ7eBlJzNNPJKJL0=;
 b=AVyISLPUU3rEJ/k1aWXI9R0mdz8qOEaIRiIJwJQ19WF6WZY4VCu4zKdC8uEt2FQGMbflcxJQwYs+Rl70NY6U3nFpLqO3tDtMpHEGHiJjCi283sLrI+ALbI3qo3UTjUfa9SDAPTvT7PrPf/OL4hubxim5+GzoWCiJJD/s6TORBrk=
Received: from CY4PR13CA0086.namprd13.prod.outlook.com (2603:10b6:903:152::24)
 by MW4PR02MB7489.namprd02.prod.outlook.com (2603:10b6:303:75::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:27 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:152:cafe::8b) by CY4PR13CA0086.outlook.office365.com
 (2603:10b6:903:152::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:26 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57768 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0008Ax-3c; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id C547E13C0AC4; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 17/21] sd: emmc: Subtract bootarea size from blk
Date: Mon, 1 Mar 2021 01:03:23 +0530
Message-ID: <1614540807-30686-18-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de7b889c-cc01-4fd2-7c80-08d8dc1f2967
X-MS-TrafficTypeDiagnostic: MW4PR02MB7489:
X-Microsoft-Antispam-PRVS: <MW4PR02MB748918E1B685D234195F3B87CA9B9@MW4PR02MB7489.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+k2MLA2DgW+Sqb4W6p9RNxT14Va5DrjOVAc7CR484hgZnslt5CQil5H0ccMUci1XsjtdvZ0SegmoBD+EodTWF5/84NOnvW2KuO6GxYDvNScOZwk1X/s2Ecp2q2enOopbVxlHQGy0i9RjzgdMUohNuXyV3gtJs9caKVSI0XSOomD0bexopHuvI/brKJUkiAJK8iEEFGTgAw+2p6rZmjDMG2fGPDJea5spysNesIwpyr0eonxJn/LyafIIYrahJWY09t0FtGwTn8bnxDVllOyR/XtszggrUdmZ00z6hlCbnrvi4IHCobrU6v35NGNtyTjJ+9IvQ2Cl9bPowdD9u11r0B+1z9S3D6D8gpWJiJI+MEibM4jtoOs/wwd0L3XZ9ip8wYiMd5YCzE60533h/GtMEwmgj5dlr2iVLuEXHeDcafUNWCQ83GW5UoAzlnYpsNHaZHV8xLhCx845sqPzSHDltB3vJfynK2B58Lzf45oeAMfWgFDyhpzk1Ys7dKkKj3HOWjJqOLPcUYvDgrHVdw2rmGNeAHnrVH+W53tRoj+WdUgqesl2dlRTozElpgg7KMyAwln4h/bc75CnVdOUQYhTKlRbbioVtVppp8d9VqEOg4RwI+6xGfEYJ8uQpDl1CexuBvYDIfs0HK/KhbPvg2emZMcoNticMDcMP39/CmtJUV1xtBvIU65/oM98/Y5et5/5SaeI1IkD61dLRl9ryz/dQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(346002)(136003)(396003)(36840700001)(46966006)(316002)(6266002)(82310400003)(26005)(70206006)(478600001)(70586007)(36860700001)(921005)(36906005)(83380400001)(426003)(107886003)(42186006)(8936002)(66574015)(47076005)(36756003)(4326008)(110136005)(356005)(7416002)(6666004)(186003)(4744005)(82740400003)(54906003)(8676002)(2616005)(2906002)(5660300002)(336012)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:26.9050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de7b889c-cc01-4fd2-7c80-08d8dc1f2967
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7489
Received-SPF: pass client-ip=40.107.94.57; envelope-from=saipava@xilinx.com;
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

From: Joel Stanley <joel@jms.id.au>

The userdata size is derived from the file the user passes on the
command line, but we must take into account the boot areas.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d311477..5135a64 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -657,6 +657,11 @@ static void sd_reset(DeviceState *dev)
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


