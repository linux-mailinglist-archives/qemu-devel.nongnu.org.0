Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B903F6BB6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 00:29:14 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIeuu-0004PA-L7
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 18:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mIetd-0003is-Nd
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 18:27:53 -0400
Received: from mail-mw2nam10on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::60b]:3680
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mIeta-00054Q-Sj
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 18:27:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ffz9duup3c629M+sdrdvY/00dYOoeCGBWrOdbJtbZJxdexH4vJ6FAA3v9eJQlZnc2sfCEnUp1d9L++BL9djDF1V0MjXujIfGxFCxMKcW5k/N++xYqDQeC7f4QJABbzO5VDkXyDgTraTtGJLtccg5ZHC6LX5uFjfRIpwpDKWKab2reMtCJXjGAoK07QNjbI9gxUeM2vADgGm8rffKqvSkOvcu7R2p4DVhBEibMu0LDKJVwSRquhqaZrSzqIvdKgbJFyqoGo1Pr0az/hJQafPa8Glbtp4u6HMONMbLovTtFwCgZLlQ2OFh/FNl4z582+/NbLjRPWEW4+AmzGhDVKsNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpWm1N6j7AFTToydZ2t8wFGnVTzN1pZduelIL/l8TVE=;
 b=dHfdbQZok4Xnyvv5FGyKsJO8njOTyhkPrS5SYrHchRi1KyUx11kt15UUR501oKi34zasLJ5SB1FnqrfTYE7KpMPetEh//mIH/q2VKZOTnnShiz1bkvMW43gmJpvJSwCzMR7LWH6prrVLOc7lXHTv9YrlvxTV0/pmsQcAnJZDLXW0gTVLJN7hXjawfUdw/BHyVlQRxhHarR65BwWBpshYPWp8xrquvfJIvUOL5Vd4W1izp4mDPFDu51S9LjFJ3KKN19zH9k05eAMue89nSGiqJBxnND2ooqJqF4xx2HowMX1gDa1zRGrT0v8xCq4rNJPRqmiqRsNYEEzkdNOWqXBfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpWm1N6j7AFTToydZ2t8wFGnVTzN1pZduelIL/l8TVE=;
 b=H8UZ3JsoI7FcGcfoThIfd7dKJ3pwJtTkiqs6n7P63KpKQDim2FKYz4rF0vUcaby1YUhxHiEYoxkT+WICqYhRF68wPA9MCMHhdEoQHYU/UNw3AZXpec6uMZkDsIzZceHLVl2hUZQZwa8Nusg38f9fna8H6cA7qHoMu7QpikMv7gdXjo93ZLuc1NevIs88Ca+xcD7CFkhnE9MH4R1kdY/UFLEuFxA5BlQWwl/PtenRBjghNuHyt9Ko7Ash8ec8QWo+/06ZWCRzMiJAyMxe5zq6by8gYBSTU5MeWxrmRuUP8t/yuIkhrbrvjDfVLo1H13/IVvMTSvmGVZ43nhymt9RM0w==
Received: from BN9PR03CA0199.namprd03.prod.outlook.com (2603:10b6:408:f9::24)
 by BN6PR12MB1473.namprd12.prod.outlook.com (2603:10b6:405:10::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 22:22:44 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::c7) by BN9PR03CA0199.outlook.office365.com
 (2603:10b6:408:f9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 22:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 22:22:44 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 15:22:43 -0700
Received: from eugeneh-X299-A.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 22:22:43 +0000
From: Eugene Huang <eugeneh@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <marcandre.lureau@gmail.com>, Eugene Huang <eugeneh@nvidia.com>
Subject: [PATCH 1/2] Use EGL device extension in display initialization.
Date: Tue, 24 Aug 2021 15:22:25 -0700
Message-ID: <20210824222226.22528-1-eugeneh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 100d73c9-4b59-4032-102a-08d9674db1db
X-MS-TrafficTypeDiagnostic: BN6PR12MB1473:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1473578868A8FE23B65A70E0D9C59@BN6PR12MB1473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTsp0JGvvBsBlwj4l7IHIWyilMJeEixCiUmLo8h+SAzuQg5XiiUMgqH/ghUfZ5VgpZwGeigNxAIVNO3/poyp43qjsPHdb6Cquv8YMp1q6vwiN6JkD7LTTnstcZqDP337NkzSbnMd5OB+yHKRq1+YZ0L4b/ttdce6kD0GNL6l3xN/wrbakVR5jB5lDpvDEW59gTmcOWhHim6rffTUY80xQV2izBB/1NhHYbsttCohxV0GUwsqsap9a5d6bed+k9gkKdPTx5aw9aFC4LQ27CKE28qXLKIDN/gaiEidOVuajm3q1e4CwVH8MfAI6+RAB4a5Rf4vAnFQumh6uEOZbkhHsf7rHIyCMO1+kA5CbWNAOIPM+6y60c1JHE3VQBe4eGB1nu0948kyKP6WYeZsYpKYuMalc2HBbAxqo5EG3isLRoJuLA5ahkJV6W6+JR4BWADwcGYOp2v4JhIOJnvWtQJcTFawk45+5jIXZkwd3XRTEJI8EkiWGYraqBk8c5ew3E8J4WPQRoNygkIbNS+WmBFwFGmWqrqsu8b9VyvdMYEdiGImetdBdpTeaKQHfeWBZ0yCnGgbnh5EYOJ/syr5NVc+Cfx9O81R2kw4zLBfcJ1yp2a8RxcfXsmcoJw/nzbax0G/UM5y207CjLGUmWYSatsqOFh+d9cI0nr0Uyjxyr06XQKi/Z3lu2PfhFrp2rvBPjl7YAb3n5TXWLpz1SkgotDRA+zfI6zXavDxbmuQPy47D9Y=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(46966006)(26005)(6916009)(70586007)(7696005)(70206006)(186003)(5660300002)(107886003)(86362001)(8676002)(1076003)(316002)(6666004)(54906003)(36756003)(426003)(36860700001)(82310400003)(356005)(4326008)(7636003)(336012)(478600001)(82740400003)(2906002)(2616005)(8936002)(47076005)(83380400001)(2004002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 22:22:44.2080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100d73c9-4b59-4032-102a-08d9674db1db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1473
Received-SPF: softfail client-ip=2a01:111:f400:7e89::60b;
 envelope-from=eugeneh@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugene Huang <eugeneh@nvidia.com>
---
 ui/egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb..ce0971422b 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -1,6 +1,8 @@
 /*
  * Copyright (C) 2015-2016 Gerd Hoffmann <kraxel@redhat.com>
  *
+ * Copyright (c) 2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
@@ -351,11 +353,26 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,
     EGLDisplay dpy = EGL_NO_DISPLAY;
 
     /* In practise any EGL 1.5 implementation would support the EXT extension */
-    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")) {
+    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")
+        && epoxy_has_egl_extension(NULL, "EGL_EXT_platform_device")
+        && (epoxy_has_egl_extension(NULL, "EGL_EXT_device_base")
+        || epoxy_has_egl_extension(NULL, "EGL_EXT_device_enumeration"))) {
         PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =
             (void *) eglGetProcAddress("eglGetPlatformDisplayEXT");
         if (getPlatformDisplayEXT && platform != 0) {
-            dpy = getPlatformDisplayEXT(platform, native, NULL);
+            if (platform == EGL_PLATFORM_DEVICE_EXT) {
+                static const int MAX_DEVICES = 4;
+                EGLDeviceEXT eglDevs[MAX_DEVICES];
+                EGLint numDevices;
+
+                PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =
+                    (PFNEGLQUERYDEVICESEXTPROC)
+                eglGetProcAddress("eglQueryDevicesEXT");
+                eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &numDevices);
+                dpy = getPlatformDisplayEXT(platform, eglDevs[0], 0);
+            } else {
+                dpy = getPlatformDisplayEXT(platform, native, NULL);
+            }
         }
     }
 
@@ -388,6 +405,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,
         EGL_ALPHA_SIZE, 0,
         EGL_NONE,
     };
+
+    static const EGLint conf_att_pbuffer[] = {
+        EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
+        EGL_RED_SIZE, 8,
+        EGL_GREEN_SIZE, 8,
+        EGL_BLUE_SIZE, 8,
+        EGL_DEPTH_SIZE, 1,
+        EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,
+        EGL_NONE
+    };
+
     EGLint major, minor;
     EGLBoolean b;
     EGLint n;
@@ -413,8 +441,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,
     }
 
     b = eglChooseConfig(qemu_egl_display,
-                        gles ? conf_att_gles : conf_att_core,
-                        &qemu_egl_config, 1, &n);
+        gles ? conf_att_gles : (platform == EGL_PLATFORM_DEVICE_EXT ? conf_att_pbuffer : conf_att_core),
+        &qemu_egl_config, 1, &n);
     if (b == EGL_FALSE || n != 1) {
         error_report("egl: eglChooseConfig failed (%s mode)",
                      gles ? "gles" : "core");
@@ -436,6 +464,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode)
 
 int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)
 {
+    // Try EGL Device Extension
+    if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) == 0) {
+        return 0;
+    }
+
 #ifdef EGL_MESA_platform_gbm
     return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);
 #else
-- 
2.17.1


