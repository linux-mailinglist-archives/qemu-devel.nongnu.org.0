Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5267ACB8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbP6-0002hd-Q5; Wed, 25 Jan 2023 03:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbP1-0002QV-K7
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:45:07 -0500
Received: from mail-co1nam11on2086.outbound.protection.outlook.com
 ([40.107.220.86] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbOz-0007qp-DM
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:45:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6GieLWep7fHehfvtO0P7hxmp62pV8AyyOXQ+4WMhZDO8667MwB5/I+XmVm8PoYlfnPNP7R1Gm7EqtCxjXDCffFD2jNV/blLYSh7sCgbuhMxjFQ9G5k9+1HE/RFC0BQVvyTJsoDGRgyLBqX2o9wglmv9pl98yIuuWlBg64eEm/GBdjmR2gacct/GYpv3JHXl2Qn4iJj3oJfFAehTQMaFt6KfkOOmAYZ94azOmYpjNzc6U/tVAgfUyP4vjhXYjMrPw96GpfRRXXLcpXvkHMKb7zDvmyZgYI4XzzfVQ/BF0CvxlVhFBm5ePei4zW1ccciPRJbNrYubS5wpt2AUZwelhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URxTp3Cj5zWl6imZ6G51I5Cd2LY5Q6C4OO3dPqmmi+4=;
 b=GYyvDxPxnwwehsB2XdCkyPJImoshu+qrGPsy3uhPQo0H+UKylWR7pgPcyVAk0nhcOIJ1b/gqcNqhRyp4P7eNHcYCxhwc6C0l9I7pXMzb+lJJz94hYJ60vlxPtCOiMMCr0hR1YHEh0CzDfU70pALAUCzBAs8hLNAl/SDGicEg4twpTiUhcohNUA0ReD4ml6zetGQwyfK2tms25c9EVEKtAhSgp57UzuVnRbbnDA8p7gDfeOArV0HNo/SeJ6eVluJ8hIUidQl32Rh7tbKpFlNM0jb62CzO1x+UmcmjSv6wpXMBOAdCVF46nn9S7xP9lExDBrZVKp91gTanUNUNCz25TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URxTp3Cj5zWl6imZ6G51I5Cd2LY5Q6C4OO3dPqmmi+4=;
 b=OzN/oGFGZ/17Pbl6+cdTxHoOS8AaWzRb3syr/0+m42Ii5mOw7KOO0RKA69H4Km208CzdmUMGy51w8vO6J8kyUYkzbEMwwaO/wHzj789eDcE83uMQ89QTcHjIG6ltkAOB8aHr1KcIHvhbSiT9J4O93kv9Pve0E+uyd8adBjTnNGU=
Received: from DS7PR03CA0229.namprd03.prod.outlook.com (2603:10b6:5:3ba::24)
 by DM4PR12MB5167.namprd12.prod.outlook.com (2603:10b6:5:396::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 08:44:57 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::a4) by DS7PR03CA0229.outlook.office365.com
 (2603:10b6:5:3ba::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 08:44:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:57 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:56 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v3 06/10] hw/xen/xen-hvm-common: skip ioreq creation on
 ioreq registration failure
Date: Wed, 25 Jan 2023 00:43:52 -0800
Message-ID: <20230125084356.6684-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|DM4PR12MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: e7226f32-1b6c-4f14-8ea2-08dafeb0703e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OarZNzlyYufzoapGTPFK6aLHsMCMHkniKdDziHZ7pyAzGW60lwZmwqQQYNRP+7+YLuGyIMigTuylaREeSsCrR8yXKKGsNtGFqbMDQRQpvZKhttpTtEmLDgoDbMZLsMkFQPgEXWJj2GL+5DO0FHsml0oKqbfSIN1QWK5poiQuTPvWHHTFjR0R3okIqxkvz1n9zX1nmL9xJLzciqEUeRAAv5IVnonNcxnb227h6DNj6nCWryp3yls5EtmVLeqcZcLnm+0THwsnBpXJ6wPiOdQdGFjLqN6fy15PwtUmyESBh4gK9CQ0K0it7UfgCKDzVQ0HxMu/ClORCQwGFcZg+aXAkvaH4UyrpAYR2e3v2FTrryqxzq0sYaBBV/dYbN8fPgb+ulSZlSafRqU3uMqzh3ap9vvv3gWeXdFdY9XNh3YMaACk4wSSS/31ZMAsdLKKlxDBN9U5hu3vIUFDzCJ/GQRn1ZNpoV+vfuFjoEDuW9U9qFWIaIAGQxPOQBM3cdYhNcKMvJ+XQatVbAkXE66+V/YVjoz7UnVbhL4GuE1qMPHvTaWf+ZtzNUCC68QqwgDFnDbMVlhdQ9NxbtlFUjv1DedphMtm2awILugjuk7YijIlXlJq6WVvl25umeAL8NpWjvVYS5YU4duaFuA2ZMnVUPbtfSN0cn4Q3SoExiqWlErU+OTVJdM+TGY4DEZ9PVNXWRKtV/d0+HXvyotCwzedRXFQvrEt8Ub/mVWYpzz+pSzo2Fo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(40470700004)(36840700001)(46966006)(47076005)(82310400005)(54906003)(86362001)(40460700003)(36756003)(40480700001)(81166007)(356005)(36860700001)(82740400003)(44832011)(316002)(2906002)(41300700001)(4326008)(8936002)(70206006)(70586007)(6916009)(8676002)(5660300002)(186003)(26005)(1076003)(2616005)(83380400001)(426003)(6666004)(478600001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:57.6412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7226f32-1b6c-4f14-8ea2-08dafeb0703e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5167
Received-SPF: softfail client-ip=40.107.220.86;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefano Stabellini <stefano.stabellini@amd.com>

On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails continue
to the PV backends initialization.

Also, moved the IOREQ registration and mapping subroutine to new function
xen_do_ioreq_register().

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index e748d8d423..94dbbe97ed 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -777,25 +777,12 @@ err:
     exit(1);
 }
 
-void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
-                        MemoryListener xen_memory_listener)
+static void xen_do_ioreq_register(XenIOState *state,
+                                           unsigned int max_cpus,
+                                           MemoryListener xen_memory_listener)
 {
     int i, rc;
 
-    state->xce_handle = xenevtchn_open(NULL, 0);
-    if (state->xce_handle == NULL) {
-        perror("xen: event channel open");
-        goto err;
-    }
-
-    state->xenstore = xs_daemon_open();
-    if (state->xenstore == NULL) {
-        perror("xen: xenstore open");
-        goto err;
-    }
-
-    xen_create_ioreq_server(xen_domid, &state->ioservid);
-
     state->exit.notify = xen_exit_notifier;
     qemu_add_exit_notifier(&state->exit);
 
@@ -859,12 +846,44 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
     QLIST_INIT(&state->dev_list);
     device_listener_register(&state->device_listener);
 
+    return;
+
+err:
+    error_report("xen hardware virtual machine initialisation failed");
+    exit(1);
+}
+
+void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        MemoryListener xen_memory_listener)
+{
+    int rc;
+
+    state->xce_handle = xenevtchn_open(NULL, 0);
+    if (state->xce_handle == NULL) {
+        perror("xen: event channel open");
+        goto err;
+    }
+
+    state->xenstore = xs_daemon_open();
+    if (state->xenstore == NULL) {
+        perror("xen: xenstore open");
+        goto err;
+    }
+
+    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
+    if (!rc) {
+        xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
+    } else {
+        warn_report("xen: failed to create ioreq server");
+    }
+
     xen_bus_init();
 
     xen_register_backend(state);
 
     return;
+
 err:
-    error_report("xen hardware virtual machine initialisation failed");
+    error_report("xen hardware virtual machine backend registration failed");
     exit(1);
 }
-- 
2.17.0


