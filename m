Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D9C67ACE1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbYB-0003j9-Q4; Wed, 25 Jan 2023 03:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbY8-0003ic-W9
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:54:33 -0500
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com
 ([40.107.223.71] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbY4-0000yt-Kj
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:54:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgV50fT1m/j3iQ4CYF+16+F+pUcFGY/i24169WJ2xmreMYrggyhyPYqaUWyngZsKgOAev912mR59bonx5Tq+ISuMuKDFVYJ59aULzyHLMhcTK2nYhyAIJvQwgsBRmBByy46nlx4jlBwIwM9M3sQN/1cmzWPlwBsjwICuJP8hfbbdMQSp9IITjP3e8JODJApdsC2tQ3aw/eShzyOXAy0BlHEvfEfzkJpAQlE76f1xwkC6O2HSmtXugDIYeWROal7/Nxgetcjx9RuV2WSmw8p9C2yFjn1OxT6v5yAniEflkR7SxYs0jskikxXgNHNMqQQzt0ha5SDKD7NxoIvJwlWi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7qBBSFtT16dKo24xhhVW2fFUFVUWqNupyxQmZ/Rxf8=;
 b=nObe/ObNQ0St78OeVXgMcWXShbX7KsAG+V5dLpyNcuIXrVHOFewLGGIQ0oG3VZS0NB4jTbyxDH8wf/GVy7Dz6YD7UEhO3OpO6se4RYjHGYXqxec4DJ8u38HtMqcIeS/IyrKxO6mkdFc3hH3IjmS1U//t0rYamzWntaNHE1x5AnjkJ99nq5wGzamZzFxBqLUuQ8+hCBjiqh1kD/EIgtRLNOyvlgif1hzxntMXidchg08FQdm+CdRAi3VfP5Z0zw6B6z2v1OIN1rPu1EODgi/1q2J/Xhac3TNGlwmY0BZqDoCWPFyDDV5n1tgd/wUXva0l9sWAZO6MHUmRDB8DbgZj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7qBBSFtT16dKo24xhhVW2fFUFVUWqNupyxQmZ/Rxf8=;
 b=izip4ENKNevPyyqu5gkt87AXgE0Jj5ZazEJTypsMcDLCs3ffrWOCLK3zxK8kqKi6enZj9yfTWKwKLjBWgPK7ihuLqTtsDjJM65ZW8wtpw0Y8tGxLbDfNZIw/EJYJP6ZxSY4LR/hmaTdazLzsVi3gwOg/85FYguorojVJCL0PgF8=
Received: from DM6PR03CA0016.namprd03.prod.outlook.com (2603:10b6:5:40::29) by
 IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:54:25 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::ef) by DM6PR03CA0016.outlook.office365.com
 (2603:10b6:5:40::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 08:54:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:23 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:22 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [QEMU][PATCH v4 01/10] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Date: Wed, 25 Jan 2023 00:53:58 -0800
Message-ID: <20230125085407.7144-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT078:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: e095d815-3abf-4042-6778-08dafeb1c220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOpLBQnMfwGAg0Y1y5ZtTt0aUgrDIh7Fe1/5bETPnHOPRHlbTwljkAEdFUejfYmBLYz01w2VifAqXIgyoRmssiQRJH1EwyZkAZ3EwzHKeiygI3ojVPpitDP5E4H4wjUNQBtqxX0Tam7JTb22U6VbYB+UuZ+s393BHiq4X0NR4eL7R1FsT+DWtYEsEonvFN1bUMLwGP/cklt1GhptjMsT7CfbP+axFRBelFmQnBis/JFxAdeJ1KZITYnMqHl0Rsp1OADyzCztC0VHdt1QDySLH9jA4Bu+qyKTgdFP6t+kQkoLo3Ko/va76CjnuEa8zSLtsfO45sXFk9rESlWDhDWErZc7xMiIyJXP5t4JJqGf1azTYwQSHTmVLFFDMgDjXIZA+40GUj6PIhJrm0ngLonV/g2lLVE307TVsYZc76laZb7e2i44C4ob94+eMvWXVCW/wWHkOZIfXgzTq3tbvyYOJhtLM6qEMSNyjv9t4ofd25yyMf1RTTBVh1NKJYa5+5Y913HjBYKils1HBNyg0g2/miKiwz5Qb/bB/4k5wu2FAqmsHVJ3vYBkUKxPiuR8DBP5grhFcEvA6POnPobSNsU3z8jRKb+bSVTplvo7W+/BxiA8Kdz2Cv5rulmrais64saZfh07rzT+1X7tZQvc5j/tUI0fiUwE20l5FShWZF7TjqN3YOjZ2S8UJcKWBIzi4bkgZ4o8BqqRbI0Mwso5EjbRt3HqUzTotHEsrZnJLDREtQU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(40460700003)(36756003)(6666004)(2616005)(2906002)(54906003)(26005)(1076003)(336012)(186003)(41300700001)(7416002)(81166007)(4326008)(70206006)(8936002)(44832011)(70586007)(6916009)(8676002)(316002)(86362001)(82740400003)(82310400005)(356005)(478600001)(40480700001)(426003)(5660300002)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:24.5135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e095d815-3abf-4042-6778-08dafeb1c220
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
Received-SPF: softfail client-ip=40.107.223.71;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

xen-mapcache.c contains common functions which can be used for enabling Xen on
aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
accessible for both aarch64 and x86.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/i386/meson.build              | 1 +
 hw/i386/xen/meson.build          | 1 -
 hw/i386/xen/trace-events         | 5 -----
 hw/xen/meson.build               | 4 ++++
 hw/xen/trace-events              | 5 +++++
 hw/{i386 => }/xen/xen-mapcache.c | 0
 6 files changed, 10 insertions(+), 6 deletions(-)
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 213e2e82b3..cfdbfdcbcb 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -33,5 +33,6 @@ subdir('kvm')
 subdir('xen')
 
 i386_ss.add_all(xenpv_ss)
+i386_ss.add_all(xen_ss)
 
 hw_arch += {'i386': i386_ss}
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300..2fcc46e6ca 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_platform.c',
   'xen_pvdevice.c',
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index 5d6be61090..a0c89d91c4 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 
-# xen-mapcache.c
-xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
-xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
-xen_map_cache_return(void* ptr) "%p"
-
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index ae0ace3046..19d0637c46 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -22,3 +22,7 @@ else
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+
+xen_ss = ss.source_set()
+
+xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 3da3fd8348..2c8f238f42 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
 xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
+
+# xen-mapcache.c
+xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
+xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
+xen_map_cache_return(void* ptr) "%p"
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
similarity index 100%
rename from hw/i386/xen/xen-mapcache.c
rename to hw/xen/xen-mapcache.c
-- 
2.17.0


