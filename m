Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA432741F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:32:17 +0100 (CET)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRnX-0001zq-EA
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRks-0008RS-RZ; Sun, 28 Feb 2021 14:29:27 -0500
Received: from mail-bn8nam11on2070.outbound.protection.outlook.com
 ([40.107.236.70]:15841 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkp-000362-9S; Sun, 28 Feb 2021 14:29:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z69JlYF1ODv7h/kBSqAHmn4P3+QhqZQq8g0NoXlgS29+JGlLGciXUAo0fNwmNNkSYXqK91O119m88/1ICdRTU3nu3/XnZveWdfulFi/PnVNZvSsclPqNQyZXHW0yNhg6lL435XbIeYWv27fmn4cMoZQAsU0YNHfCA6P7r0e8TmWBgRuPIsVGtdrQF9l5arqFsh77q7INMe9OUjVukdw1x3VWqXKQjtQZQ5cq96CxsYt4pIN9lVLMIqKfY58GoHqozLrotUzEySQCt+oxQqsaA6jsGCwyA7XY88LUymuDroQflgVbFcwuhkKWUahFruDCem5r33q0Vl034v+itNKZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGy9GcG0CU7abFaeloxi27yUkQXVPaROea2F52tDwlE=;
 b=cEsVaN2a2BWJAZt6ibDh4HN1QzPSx0D3z1ORks2zf+kEE/YwUKvspV599ILl0J/9sfxKL6kJMbIlFPMcd4XR7V39lj4aKdEfJlnfkvtFy0+ifevND62XKRDbpeRut6T+/e9HslXI01OJWyxol1+nb8ULtdh70O0MsQ+oLciMVlsb+euZayrBhRdHOE0vrGv9UIQGb9J3WowEPvwhPK/ZqDIoR54ZOHnGoGF+hou9Qe9rpyzK4+yJzPcQ6BFGV8xW92YjnNl5oIfh3hYqWzx9SjN8I89WsOI6uryZ2cJLA/S+GtNZWWJQJBSPnM7cJz476El7SzTB0XY+qRhmQPvUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGy9GcG0CU7abFaeloxi27yUkQXVPaROea2F52tDwlE=;
 b=U/7KZGzDA5W9Vw5gXJxChxXFXOK6NbwWrOjbe9GHk/izzrzDLPcp3E6F4xIehc5U2JKp2XkcEGP7ZERz4+T327bTpwKFFVHjntzFofjYQT7aLsAhYFQ0wkYMEvXAOr/ZyCm0iubl6ypIRVaJziuWwrQXMcnF0IuikQZBMhgX26U=
Received: from DM6PR03CA0002.namprd03.prod.outlook.com (2603:10b6:5:40::15) by
 SN6PR02MB5247.namprd02.prod.outlook.com (2603:10b6:805:72::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31; Sun, 28 Feb 2021 19:29:18 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::5b) by DM6PR03CA0002.outlook.office365.com
 (2603:10b6:5:40::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:16 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:16 -0800
Received: from [10.140.6.35] (port=57758 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRki-0008Am-AN; Sun, 28 Feb 2021 11:29:16 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 4FE2E13C0677; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 02/21] sd: emmc: Add support for eMMC cards
Date: Mon, 1 Mar 2021 01:03:08 +0530
Message-ID: <1614540807-30686-3-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15050a6c-9d1e-45ae-0a35-08d8dc1f243f
X-MS-TrafficTypeDiagnostic: SN6PR02MB5247:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5247713D2339C30E340DF375CA9B9@SN6PR02MB5247.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUAFdjyytFUVBw4Gl+qWT/hNp2H8feOKx8wVfl7325N4++RGY5AIuRJYOlHb9zn3ZoWamh3QZP76VbKcOvwJg4jNrB9Aj0GNS3g0TLt6TgBnyy7Ge509OTZvse5AgNB2q/Bqw92RYhaG8WAMG+sG8EWDuSM9gwKHFmaoExey3nDuacjFlTcgASn3JuBg3hTNx29Rye51/3M2YCL8at5+nwEaD9Wc1Ng2BHTBveg4wCCuRUukf38KWaD1YTTGpk+tNaj77b9apNsbQIuc6NDICkKJ9rgR8moqQ4VlN6IPVMGG020165CgXurF7FQaA+EzQLdsnzhC3pEBw8RWtWTbgbHvHRIQ/dNxWF1PVQbMiJHAP0Na6pC3/Vds2QwaDRQbgz87GmU4pBDnVyBTaHcbTx3/6FrripwwgEVS7s5IXk5Zo/CbuWQYGMSCVhmSdWiu088nDgIfin92LzzZFGg8yqKs7dQrGoSyAyrcrpsIHN7PZ4lxUKpchxozSklHWZlJvsKtqrNz/N+DLDqjlWmiSzurRfHfP+H11P2eh9M8MWtyrrWHYZAtOBYrmDnCaUggOxTTkqrBkZAVCmBJlM9s3uoDC0eDEFXAby2Je57Os8h6gAPu5pq5WZPiwOYlFSpgBhsO6JMIaDJ6sGDwge64cE7x+0RNVtFRskjhto/fENNn71ANifRW4u20MDzz1pR20S3qE2l50uF17ndtjml9ZQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(36840700001)(46966006)(6266002)(70206006)(54906003)(336012)(82740400003)(26005)(7416002)(110136005)(82310400003)(36906005)(316002)(478600001)(107886003)(8676002)(70586007)(5660300002)(4326008)(47076005)(8936002)(7636003)(36860700001)(356005)(83380400001)(36756003)(2616005)(42186006)(2906002)(426003)(186003)(921005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:18.2493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15050a6c-9d1e-45ae-0a35-08d8dc1f243f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5247
Received-SPF: pass client-ip=40.107.236.70; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

Add eMMC device built on top of SD card.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 include/hw/sd/sd.h |  2 ++
 hw/sd/sd.c         | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 05ef9b7..b402dad 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -90,6 +90,8 @@ typedef struct {
 } SDRequest;
 
 
+#define TYPE_EMMC "emmc"
+OBJECT_DECLARE_SIMPLE_TYPE(EMMCState, EMMC)
 #define TYPE_SD_CARD "sd-card"
 OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
 
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 74b9162..a23af6d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -108,6 +108,7 @@ struct SDState {
     uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
+    bool emmc;
 
     /* Runtime changeables */
 
@@ -143,6 +144,10 @@ struct SDState {
     bool cmd_line;
 };
 
+struct EMMCState {
+    SDState parent;
+};
+
 static void sd_realize(DeviceState *dev, Error **errp);
 
 static const char *sd_state_name(enum SDCardStates state)
@@ -2105,6 +2110,13 @@ static void sd_instance_init(Object *obj)
     sd->ocr_power_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sd_ocr_powerup, sd);
 }
 
+static void emmc_instance_init(Object *obj)
+{
+    SDState *sd = SD_CARD(obj);
+
+    sd->emmc = true;
+}
+
 static void sd_instance_finalize(Object *obj)
 {
     SDState *sd = SD_CARD(obj);
@@ -2213,9 +2225,17 @@ static const TypeInfo sd_info = {
     .instance_finalize = sd_instance_finalize,
 };
 
+static const TypeInfo emmc_info = {
+    .name = TYPE_EMMC,
+    .parent = TYPE_SD_CARD,
+    .instance_size = sizeof(EMMCState),
+    .instance_init = emmc_instance_init,
+};
+
 static void sd_register_types(void)
 {
     type_register_static(&sd_info);
+    type_register_static(&emmc_info);
 }
 
 type_init(sd_register_types)
-- 
2.7.4


