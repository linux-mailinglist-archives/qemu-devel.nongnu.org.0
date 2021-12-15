Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8011474FB7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:59:15 +0100 (CET)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIdW-0002s0-QJ
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI0O-00085R-AM; Tue, 14 Dec 2021 19:18:48 -0500
Received: from mail-bn1nam07on2061.outbound.protection.outlook.com
 ([40.107.212.61]:9802 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI0M-0006YS-9g; Tue, 14 Dec 2021 19:18:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOhvQbADPjW4ia6l7oE1JBJZUTvAi3DimTjoiEGhDeoTEWpMSwIoWjHNo0YQeU0SCK3qJA/OBfvpKBdsk4iq/AB4/gY2x1ND2z5cwEIA+rx8YIJF7G6/yd10Qpz2QwSgW79f4xqTY3HA3YcE275v4CPCOYbaXLoxGY1BvaK69fQq3HHPfAU/FZB1yCYSFJaHNzwG8hBluyQpgrERiZ8xfEA+QTIOrfd84v1uMzoDAg/SfalVBZt/A58UCFZc2xG29JWFrR6YoISTxT/ym+wuITUUmk579MkdoY5Md3n6gHq3Q6/J6fPOTlJ9U9dNU/N76/lk9V0iMxtST705EvICOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ9R7X59sx+ZY/u/jmvHecM0kPcOognPD5Jpkuq/kh0=;
 b=mDktxiQn7O/+0MOej8yhwwXcOkUTk7jY3IdMWcqerhVE81TEh1oKzuJbTlyCYxPwLNMhmg7a/CxPxPfboY/zDFd2fmnbiYdfvTFVXjVmb7CVfChs5jPXxIpZ2wkC4wu4Fy92sZXmpKt9VQk0CZ114URWT74jpDl3EsZO0UmEuBjHk4XdFq5AcQmSMdGnGersN0T1FSR1+cxUzGsG9CBO7GjOvdpOXKyxiED7Kh7kB6M7wGtfZXk+2LyqfJ08dOcUTErVTyUnOJXeDCQuJZGOgPqjPVwv+5nKZiaiRoY8OnFV3uQVWzejLXxyYudg0frzyhRVKek1MAN3/LyuELxCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ9R7X59sx+ZY/u/jmvHecM0kPcOognPD5Jpkuq/kh0=;
 b=4fDrrVJHSKbf9CqhNksJFmGZl4Xp/fzqdVqjkPEWcQSG3lKmOPjSpuN0wUBntI1oP45fCDjR7hINtjL4blY+dW1RYZei+TP79KKk9wkYNt81fS7csmEBGvtCpK4CZ1jZOK/QY1N2WHXg1y0JSt8PtqGAV7jKhr4IJ+vrE99GUW4=
Received: from BN0PR04CA0104.namprd04.prod.outlook.com (2603:10b6:408:ec::19)
 by PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 00:18:43 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::7d) by BN0PR04CA0104.outlook.office365.com
 (2603:10b6:408:ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:18:43 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:18:43 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 05/47] hmp: Unbreak "change vnc"
Date: Tue, 14 Dec 2021 18:00:43 -0600
Message-ID: <20211215000125.378126-6-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d7b040b-b64d-488e-4d05-08d9bf60742c
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5481D066B7786D39F43F60D995769@PH0PR12MB5481.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJeETZ+UKJhdsN6+9yuL1PDV4jHhy8kdcLgYOMf7Z2eeJlN/Pft7zUa02y+U3miJEqdAG80QM9L+C8ASNK4bmlDMMsnSbqTvlsE2WwKaS1ina/JupPTju/EdS76U+VtRrz4m2hZNYMYPSnRXe9Cj8JEvgJ4aZ4IF8IMKZxIiYVJckp3/cMXt0g4hgYA7W8MAcKW4V9lqGWX8PvUVzqOH8wfNfW4DUnKXKQFxQbk6NVehKDR0BDWB8I8ewOxts7dy6k/yHbscN50PUT0pSysEevxTwQWvxzYBLPVbC7geaDPpbyFkxnqSRNPSAYLcIGqFaix25p6IvXwZdRGeBRpjVI+9BZQxX8o1ICZBn0z8DC/Wf+RDPY5HNhJBSyPh60SfHNHC4Hl9kh0PRVlWSHbOKiTZTXSE57x+/5ZN/nQ4ix+VTiqtP+wI6TZFp7/FiXcUmVZeWApmpMPZnHPMD3XpzMUOQAH0woTGY0dgevUxkweCk+if7dXWemBqxg1/h/d3uf9jtPPgqLDu9lRgdzFfGW2+b63li1l2/h4zVxAs687YXzzvwrHe4Se3O8hmD7/IzXBgobCLDG0fI1bFXDQPVTKhPnSCPtQNDwpjrj3Phf9durjpgL+BSDxGiBT2Yex3PpBcVOMoxUrEcurJtXiVQ/MfLFPtcrFanZAco/kwvwSKjLVhBIjbDVu3NtDExhHzab/uRnz203xWUftzQVYY2le7gDyMjZ1M49URRjwpJBAVsBU4BHdIwQZetOMD0Er1Yzozf2cY7ufOQOtvOSjfUhZjyXUhakPyzu0TUFGiJrU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(356005)(81166007)(40460700001)(186003)(508600001)(36860700001)(82310400004)(426003)(70206006)(86362001)(2906002)(8936002)(70586007)(54906003)(83380400001)(16526019)(5660300002)(8676002)(44832011)(2616005)(1076003)(47076005)(336012)(6916009)(316002)(4326008)(36756003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:18:43.6037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7b040b-b64d-488e-4d05-08d9bf60742c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5481
Received-SPF: softfail client-ip=40.107.212.61;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

HMP command "change vnc" can take the password as argument, or prompt
for it:

    (qemu) change vnc password 123
    (qemu) change vnc password
    Password: ***
    (qemu)

This regressed in commit cfb5387a1d "hmp: remove "change vnc TARGET"
command", v6.0.0.

    (qemu) change vnc passwd 123
    Password: ***
    (qemu) change vnc passwd
    (qemu)

The latter passes NULL to qmp_change_vnc_password(), which is a no-no.
Looks like it puts the display into "password required, but none set"
state.

The logic error is easy to miss in review, but testing should've
caught it.

Fix the obvious way.

Fixes: cfb5387a1de2acda23fb5c97d2378b9e7ddf8025
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210909081219.308065-2-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit 6193344f9337f8b76cd44ce94a32c9900d907d35)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee..a7e197a90b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1496,7 +1496,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (arg) {
+            if (!arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
-- 
2.25.1


