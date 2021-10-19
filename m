Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFB7433896
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:44:00 +0200 (CEST)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqLP-0001MH-Os
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpyH-0007wB-PR; Tue, 19 Oct 2021 10:20:05 -0400
Received: from mail-sn1anam02on2044.outbound.protection.outlook.com
 ([40.107.96.44]:46248 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpyF-0007kE-GP; Tue, 19 Oct 2021 10:20:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry8PDeMDcnsiMin0JpKJuMY2S8duWO4JoelL33DcD6hNnAEjhO3xnGRakSpZDX5ETevwFu36OJ69NX9mbJc5RosH97b0QN4QhKYWO+2IydMsrLk+sSt73+MfViytNkVtrA3odtWWbCmFmXfy5txC25OlPmLEjCwuGlZZ2dFNa2rypzpbZpJPuCINHHJzSavGjM9M0B89N0qt5AKauP5njO8brfJYV9A+N/NXeIsCtc9r/NidWVqqMMM88exQD4yjGKXapcgmu2Ng8HODv9ywyul6ltU4qj6CUAuqgqCyRVUJq884lUQiXZFHEZVzVoGGhaPrEnrcpZfF+2H/w63nFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQswjtRPTwJL8Nv7i4tKKD1IU1m/bQO/urZtle86sqg=;
 b=UCkP7qf7Ur+3UgIMHL9GAM0Lu8d3tdpttnAZ4ow1X6vgtlxgGroiEZ3ViYb7SMSJwbVxkErMnqDCib2IbDD3vhTVGRGndZpIjIaLeww4yEgxekrT0D9Jngl3OnI9hNuvOhiY93zc/RRhBWQ30PYSKtrmych4d15Zw8apSWrRyS7CMPAsTBaDqraIwZ18ywZ7IQ/QdAhlaH7s8JtdzzdPn5ILYt0HPFFckRVohhj8jdmKLkO2lPlw2oUCSCrury9jxWApMZbZFiIq7e4ESLdwduFbNZtG/Obz6eKupzweyn345L9ZjZ4CYdywyuXo7qtvzycMReYH0845yq82nS9VZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQswjtRPTwJL8Nv7i4tKKD1IU1m/bQO/urZtle86sqg=;
 b=IKilvhjkz2WtO9BsZFZpqrm3+Ji6oGmzvXtWLEcyVQMV1jfNQrJv+Y49Tka3fOSYadqMLjw6KGSsYJZPQRfDjINDrqV/JA7Nu6QTfnGC+xXPvBoLmcR+euHjz/T9wCGwjGPuS0z/UAXVMn1Qqk5KnjTBVxqGkHxmWEt5c2SNo6A=
Received: from BN9P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::33)
 by BN6PR1201MB0225.namprd12.prod.outlook.com (2603:10b6:405:5a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:19:59 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::f) by BN9P220CA0028.outlook.office365.com
 (2603:10b6:408:13e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 14:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:19:59 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:19:58 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Zhenzhong Duan <zhenzhong.duan@intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH 23/64] vl: Fix an assert failure in error path
Date: Tue, 19 Oct 2021 09:09:03 -0500
Message-ID: <20211019140944.152419-24-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba5106af-dcfd-4ed0-c39b-08d9930b8856
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0225:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB022507488795BB78BD1ED63D95BD9@BN6PR1201MB0225.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OdnmCGS6/w1u7oC8wrzdVORAbGYNXmvsJxgOhk/cCyvkg8nN52YyIxOR9MDeV0Z39xmOtECnXRL9ZSVTVUK3QVZaSkCEfj/qij2EQp5VzF3p0Xe1mDa+NJhoELoMaLQ6xVc0lfG5Ya0NJK9n+oVZaXYg5GRDfT/2eL9IhmvUi5InjgrrSdj02bLz8O1UvI8c4pOzfW86w9qE5As8oTfb0zzr4/IIuZ5nrl5NsmTgbF3tWhI6PNAVrIWT988MnVnJTBXe63sw9f31Rc1j83HzOBL9i5RNuE5YJ8C4w2oLp7Nj4Hzew8XBjTS3FM8zSFUjMXtUt1xlud8D1GCZiMbfJEqgSc9OOS1Nl7gs6NU19Ds6NMTj0voL7VPTdkECo8SXHLKmtxqVxXRbR0BC6EFzeR6mxSK5M3OZWAokwEz9YtpzeL6g0mggpcDn4ES6yW15LJmm4W4LU6MTmmnrADfGPsiwXwpERnfBqu1QbmFEBHzJApN6P90k8TI6WrUKS3/hpBSaZfG0ChySxqwWuaoMX6ZgZgD/o4SG1ZEbl9ioA4hoj0qqjYVSHpZA4vumJ2yMHPekB6R9NIoV9CiX1EGGzPHcmRT1DN4Qu1Y08j49CbWEHLZ2Y8EtFbOBkay9Wf6xGZyyf6jD+RcGiQkOda5djJF0qOKuRK68dJzeFquXebG0TBJa3B7EqHDYRHphG/MWnxOoHkQIT1gJL8A54LnsUKN+zy5gQqOBnKo4cbilWGk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(26005)(356005)(5660300002)(82310400003)(81166007)(36756003)(44832011)(4326008)(86362001)(336012)(16526019)(83380400001)(426003)(316002)(2616005)(186003)(47076005)(70586007)(6666004)(70206006)(8676002)(508600001)(36860700001)(6916009)(2906002)(54906003)(8936002)(4001150100001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:19:59.0506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5106af-dcfd-4ed0-c39b-08d9930b8856
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0225
Received-SPF: softfail client-ip=40.107.96.44;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

Based on the description of error_setg(), the local variable err in
qemu_maybe_daemonize() should be initialized to NULL.

Without fix, the uninitialized *errp triggers assert failure which
doesn't show much valuable information.

Before the fix:
qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

After fix:
qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20210610084741.456260-1-zhenzhong.duan@intel.com>
Cc: qemu-stable@nongnu.org
Fixes: 0546c0609c ("vl: split various early command line options to a separate function", 2020-12-10)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 38f71349c7c4969bc14da4da1c70b8cc4078d596)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6be510b035..848b98851c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2508,7 +2508,7 @@ static void qemu_process_help_options(void)
 
 static void qemu_maybe_daemonize(const char *pid_file)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_daemonize();
     rcu_disable_atfork();
-- 
2.25.1


