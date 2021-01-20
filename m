Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA62FD788
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:54:05 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HgB-0000kx-AV
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPm-0000Tt-8z
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:06 -0500
Received: from mail-co1nam11on2129.outbound.protection.outlook.com
 ([40.107.220.129]:63396 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPk-0002uY-O9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSm0kYtgKO+HYi/VSIwqbPYNCM5GyeKo42thu4gdbrzNvJ2J3qi3YU8wcD3bx7xA6EsglZeuNlUZ8XdY9Uf9foag+sDc8IEk1Z2XaX00vqfGXKdIBOxoeQiL450SIaYE9QO5jDJUi3kcdQRyBCDr2K5cS8RXGDV632luc3VzX6AX/1mHFpJt85pPOwKnyXKytnYS9FV7jnBbve6jJerE+2UCwWK0So0uupfVl7p3gB+7dCtZkOSF7P+2zilKA2u/V2UEchEkg707RLxyaQ0BazuX/HGA4Qi8Qe6taTpnCJyvJLhi4uq+2slwhw58+j2l3o5xeAXz5mknhUKy0u9GEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo6IHh+X4/6fqDol/gGkCwHUM19DBsF5BOSmYYUFXd0=;
 b=bm1HD1TlqFl0cBrO2kVWmzawAO8mlGcpBQrBOLs+2gvg8VOSNPxxQ2bTtY2uY1uH7QTfR3lnYLsQg9/cp6WmWMwkpLX1VVouHgFxouJ+9Rm7lO8WpRmMXkvxnXc0nEXB4DvUl63njgDquiy4oywALKoBfpC3XtpXUt4ShswO1h/QiGU+1z9/Z0gyyGe6PYM6/d3VwicaKCzEzvMtH1DGOmR8Zfsf9TKwxbjVB+MChfMi6eixdlW2TqWVywddDc1KBDh5hjrl4Lc3/GvTMzSUhAAyKHeYprKJuzCnZD/CAH0mQ7eHXtupuuA7ApVYj1ebmkQSiNAEn5wX89edsOs0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo6IHh+X4/6fqDol/gGkCwHUM19DBsF5BOSmYYUFXd0=;
 b=dHqnp+CWmbSIHMW6MfBq122Xuc1V1VqaO09mvaU0mkxTjRlV2y4cNit6ls0cOALwtesfV8IiFyAlzVLZ2NI/d+BGBhwjcvJxN+ek8nGgQHrZQHWGzK7U7cMI/2h1mH4UOZ9qNxVe5SnG1zNiCQRfadI6qvz3SVnd7zDMS5art70=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4576.namprd03.prod.outlook.com (2603:10b6:805:102::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 17:37:00 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:37:00 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] fuzz: add virtio-9p configurations for fuzzing
Date: Wed, 20 Jan 2021 12:35:35 -0500
Message-Id: <20210120173536.265601-14-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee043dbb-7d16-47fd-7fe9-08d8bd69fcf6
X-MS-TrafficTypeDiagnostic: SN6PR03MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4576ABC0AED76DF4C40AB530BAA29@SN6PR03MB4576.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5OWYGKvxo+tkjsjUJ0cm7cDkUgdn/zAbv4PvLDbmLleaH1acy1EeoM8xkRG19Evd4O8dZL7vdwuaNqpxdJKVbaiaBqACOAkEYZjRPLZ6R+S2aIek1kKWa5XnDz/8W7ciWPi44Wdqb6gilci/MqFUn3t1Vo5bSsz/1/VHfxheF+7szZbyCIb6ktgh95isiwOC2pR+brCZF7I0uLkpGDpI7VwJqabzA9k+JPeVPS6eWvaFCx2Xcapam2ek5q44NO9qGv6ernIc0B0QOHC6fxgmSZj4SKekBnTukbc0fwMWa76WnBOTOXDioRPaWjzVNuBpULxaROQOigo4zTWGXLDcwutgJtNjkIv3Bs9tDJqP3SrS8ddgTxqA30tsp/1QV69RG4s0mF/rG13UrDvv38GxUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(83380400001)(6486002)(26005)(2616005)(8676002)(52116002)(4326008)(6506007)(6512007)(86362001)(54906003)(5660300002)(2906002)(66556008)(66946007)(66476007)(75432002)(956004)(36756003)(6916009)(316002)(786003)(186003)(8936002)(478600001)(1076003)(6666004)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s0IozzMT7PbbtfveV3N2+RJ4yC+uu27XeuOIffq0zzC07fdX1lQmXRRIPI9I?=
 =?us-ascii?Q?0/a4R6PW6vpuKO2Sev1aa7fg3HYBXYtm0KdnK6PnzyfwcUeQoRr3sBAXj0gH?=
 =?us-ascii?Q?WOIvEJ3BT4HdlScrhP73vG+EBlYDW/kXpKjZEptWyQTYIgAvuy8a/LnTfl9w?=
 =?us-ascii?Q?FpanpgISFni8mvyt3VMy4H5pARsG9eeAPsyeHasf1GOSFrWwzPwI7slc/l2g?=
 =?us-ascii?Q?BxkhmaungloPY9pmH5hc/GSg2ioMqbyXgcS1A/v6tBv2y+UiG5AtF+Yc+j9i?=
 =?us-ascii?Q?GCfl38rHelZ9xYCYM0al466fAtamypcdigiO1zur2WUwwNNRzgqm/7xqrKYK?=
 =?us-ascii?Q?cW1ywQQR5Ey2BG2EsKz3jwVrCHzcJHXutYSrqM6kx/fOouKDDSat1W94/Hap?=
 =?us-ascii?Q?10V1gSDosrbrtfwR28yPffeABQOahxlxLTlSIPuJyLLQ79Z8P/eqtePyIjo9?=
 =?us-ascii?Q?EJ4TYxlpeJ17MmZe+X5lVfAJo/rSNqiJESy+3QnVmsoIaNfcPLvRTs/UYCqJ?=
 =?us-ascii?Q?ghaTj88j03KCSpVKx4N5k1Z1V+SMb3wHqoMzm4hyFy4f3M0dryeV5w5Dh/J9?=
 =?us-ascii?Q?x6OQKAkmen/3hIMA6R6owdFWh7EaC20YeF4lcB2Jqxw7Gmp117VRjiHpBQ2B?=
 =?us-ascii?Q?kWygWLlobFZpjalyDMoB2DheNndeg7B4JfXqhL3zuJul7QplBTT5cFAsyxrA?=
 =?us-ascii?Q?nxG0ciZwmUM7drOmbiuNyHeSPl5ke9wpAgj5W77VsIii0luoa1+T3A2jR9eM?=
 =?us-ascii?Q?975f3Y/+e/ifVq6VgNtpEqi1TkM4KlbMsyWYe7FM8YtsgCKucJzgp6B849SD?=
 =?us-ascii?Q?72MrKhKig5V8D4yVDaDIgB9HN34Gy81z5GRYThqPvzFEA1WNbhyU56qpVATv?=
 =?us-ascii?Q?9Q4dObvFoji32od5XPQCQgE4gnwMMFOQNTQ4J5gH99vxBnMuI6Rc1JBpB+7U?=
 =?us-ascii?Q?onSh+TBRQjOh/2tOIwYtB2nN86vrFhIPkwQZt2lK2OQgBuSWffSF/CBVQTO/?=
 =?us-ascii?Q?ofwg?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ee043dbb-7d16-47fd-7fe9-08d8bd69fcf6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:37:00.0485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1ihpng6DKEq86Rxe7CBNqEMdBvNlIBVKvGGDVsC8I5esvR4lx1wzIJmaKRQQ6UO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4576
Received-SPF: pass client-ip=40.107.220.129; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 51e69c6e42..5d599765c4 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
+    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .argfunc = generic_fuzzer_virtio_9p_args,
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.28.0


