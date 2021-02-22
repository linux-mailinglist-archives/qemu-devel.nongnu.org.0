Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E981B32120A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:33:03 +0100 (CET)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6eM-0008FX-VG
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OL-0004wu-D6; Mon, 22 Feb 2021 03:16:29 -0500
Received: from mail-dm6nam08on2075.outbound.protection.outlook.com
 ([40.107.102.75]:45295 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OF-0001pe-BB; Mon, 22 Feb 2021 03:16:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHSpYjYW/8fCacLZXB22bY5AjBjxeCFnUSXfdJNDt72Ql2x043ZNqsZ0/qxjVITmwrmNoOy9l98mXdsHeoZxAzauQsGc299JaxgEZEw9i/Kepi5+WQ8041rJJj+NdBgV83tHBeJGGq6CVxuXe4VE9nYJhOdMKMJG7gJOrXBXlLB97ny36CEB1435k39eeiNyXY7hM8Uh9RPmh5LPJpSK4MScNZU/pvLpt3PnR+vAe6QIb9YiYDbl8LeaNpJQvSHGs3zusM1FECO6j8xshAzwuvtfV7Eh0U/n/QvtI44pZpiempPGywMukJQwL0XnGFnvGXA2z6blvk7gpJ44pNWKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZCRtAFYeCGAH6jbrO1832cRDu6eTw00apG72bJmoLc=;
 b=OFiBB/q1yT0R0U3HZ/UQJc1a+rIG9ewZnbuEfoJGGovkL3k2JCrgaLeP0OdP8RPlsCbynojH/2cKDp68OM4Ja13Sfx5CnsJnldidsVvwIaI0REQO5IXgLLf00wxNn8tlHb3lUEtQXtf1esHo6aieCZRm1Jeq3uONO0lObaz3661kHEWMqc8kSpHXNuqKslhzytvrvEEpvsE2ZMY8rAJmKH94m4tcE4YMuqn5YpLL31lvOsaiUb66HFDT0cAJfHYiuopV9T8SmoFtDTp0+ye9RZEifhRQ5g0hCH+IrdDih4GPRWC1XEkeV9SNvWACBZRSRGCznq1Cd3LPhuLwuc2HQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZCRtAFYeCGAH6jbrO1832cRDu6eTw00apG72bJmoLc=;
 b=MOOddonEyv9Aj+OS0v61k9hjrycnNmjzIYDqn+apRM/vGb4yszZy8DaYZ1r0ZXOIaGfMNId99CPl8bjPSCA91zwUsH7xkSlQYEO9iv7OiPqU1evYoOezH+12BcP0SUOueeYx7w7yq6+UsyKPOrHEu/V//HsRX4DmuYoPsHcSxvA=
Received: from DM3PR14CA0133.namprd14.prod.outlook.com (2603:10b6:0:53::17) by
 BYAPR02MB4885.namprd02.prod.outlook.com (2603:10b6:a03:49::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.30; Mon, 22 Feb 2021 08:16:19 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::49) by DM3PR14CA0133.outlook.office365.com
 (2603:10b6:0:53::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:19 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59058 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nt-00037M-3Z; Mon, 22 Feb 2021 00:16:01 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 4759B13C0ADD; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 21/22] docs: devel: emmc: Add a doc for emmc card emulation
Date: Mon, 22 Feb 2021 13:50:38 +0530
Message-ID: <1613982039-13861-22-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa14828-c6a8-4052-6e5a-08d8d70a2237
X-MS-TrafficTypeDiagnostic: BYAPR02MB4885:
X-Microsoft-Antispam-PRVS: <BYAPR02MB48855E4E857FC8985DFF2E66CA819@BYAPR02MB4885.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbJzgz9haCcwxP1p8Kty3gElmmR9PXcZEzswotAXt/tTohTLIyb7QkjZUHiColSfon7Bbe0qZfpCyE0eCHCuluZJE+rpwhOH9zJXpbRWRKi/FotMHnaDtFXyOoDoWdVCBp/WCwVfbjWg0nVZ3PknkUPdGpSJYe2F2Ie/1swAMwh6dZAoB/mUvsBrR618z8RXwhIFMicqjPBA49d07T265thCmIpT8/lznmw5MaJ4zcYC4NAB8hduXKFKVCKxL2xpUGXw5KEwIeqY4B7Ayj5zXqLOrcoUjyspSiQMJwwQ9AQDoQZ9O2uN9oj0DyHfIAuNj6aXZqjY55GAuV1aH1jAA+o+LHlWKDI/z/PIOx/sVl66F+t00USiKAgHN8Tpv+VBDKYfEIMULaASK5tPA1mw+RItNFpvvZTpUqVVdYGaXCBZ0kcbbwhCbFXc9dNQSgJuccbzs7hh3ZqgTCXYIU7tKT2e9Ewn1TClG5VO2gDrzFia3NHnZWRv67Ay71tBRD+T6PFqetl3uXQPozK/BMdsAvG4R1XdMiRJ4URCWVtwliJWzdOiNHiDa+9W5x7FXn8x1lFDOK3TB3B4bvVMH2PdJOPdgf3aCKe5cUEIF45mw5fkGR7uQ5J8aDsumCIKd3z+4TTGbGnlDnukgzi8KEoAEdoU7rreoCaemFYstN9tZk7HGR0lT1z5aqr3D6fnXBKBF7y0WHI5suorpANA9K085w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(36840700001)(46966006)(47076005)(8936002)(26005)(8676002)(36906005)(316002)(36860700001)(70586007)(478600001)(70206006)(82310400003)(42186006)(7636003)(356005)(110136005)(336012)(83380400001)(426003)(7416002)(2906002)(54906003)(186003)(6666004)(4326008)(2616005)(6266002)(36756003)(107886003)(921005)(82740400003)(5660300002)(4744005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:19.5998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa14828-c6a8-4052-6e5a-08d8d70a2237
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4885
Received-SPF: pass client-ip=40.107.102.75; envelope-from=saipava@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add few simple steps to create emmc card with boot and user data
partitions.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 docs/devel/emmc.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 docs/devel/emmc.txt

diff --git a/docs/devel/emmc.txt b/docs/devel/emmc.txt
new file mode 100644
index 0000000..2d098fe
--- /dev/null
+++ b/docs/devel/emmc.txt
@@ -0,0 +1,16 @@
+====================
+eMMC block emulation
+====================
+
+Any eMMC devices has 3 kinds of partitions Boot, RPMB and User data. We
+are supporting Boot and User data partitions. Boot area partitions are
+expected to be 1MB size as hard coded in EXT_CSD register.
+
+Below is the example of combining two 1MB bootarea partition and
+user data partitions.
+
+      cat mmc-bootarea0.bin mmc-bootarea1.bin  image.wic > mmc.img
+      qemu-img resize mmc.img 4G
+
+Note: mmc-bootarea0/1 are just raw paritions. User data can have
+partition tables.
-- 
2.7.4


