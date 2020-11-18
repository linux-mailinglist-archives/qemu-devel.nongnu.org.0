Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED82B863B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 22:02:56 +0100 (CET)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfUbP-0007WO-BA
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 16:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kfUa8-00073J-3q
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 16:01:36 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kfUa5-0006wG-US
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 16:01:35 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb58b990001>; Wed, 18 Nov 2020 13:01:13 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 21:01:22 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 21:01:20 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>,
 <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH 1/1] Fix to show vfio migration stat in migration status
Date: Thu, 19 Nov 2020 01:58:47 +0530
Message-ID: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605733273; bh=2WyOJjpJ1ah9+HOk8jXRYqEqXV6obKrDhsTVFCuB6L8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
 MIME-Version:Content-Type;
 b=ES0ve54sNCys1mytyQfTvw2M+LWVEP24cwt/E5ZIiHI+tdMuwq1mPnH31Xrpwq7Oo
 3sFp9/GX8F8JHZAqiRmoEQm8Wa9f7Q+TmmUKrFYqSbAWlWrGzJWsPpqdd/ZALoFYI0
 NGYhHqdhxaWknIceLGCnB0kwXDEpOuMx0rOw6fI0HcPyFClxU8bBcfo8u1DesAO/1K
 3+3IrzvAFGdTVGWljXr8FtMRi/4w5PqxjeVjuPSrGNPrhbr/WIaZFKJhXMpuTRlo1k
 nAGN4fQC+wNmqaGHz+HPmvoZK4fVR5pZSZLHo8qAOt++IpziZ4NCP1M6VZ4lwgEFZc
 fRCXDg4+iTg+g==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 16:01:23
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Header file where CONFIG_VFIO is defined is not included in migration.c
file. Include config devices header file in migration.c.

Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
stats")

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 meson.build           | 1 +
 migration/migration.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 7ddf983ff7f5..24526499cfb5 100644
--- a/meson.build
+++ b/meson.build
@@ -1713,6 +1713,7 @@ common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
 
 common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
+                            c_args:'-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target) ,
                             build_by_default: false,
                             sources: common_all.sources() + genh,
                             dependencies: common_all.dependencies(),
diff --git a/migration/migration.c b/migration/migration.c
index 87a9b59f83f4..650efb81daad 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -57,6 +57,7 @@
 #include "qemu/queue.h"
 #include "multifd.h"
 
+#include CONFIG_DEVICES
 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
 #endif
-- 
2.7.0


