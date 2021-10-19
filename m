Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B09433AE9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:42:15 +0200 (CEST)
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrFn-00069Y-07
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqBZ-0002Eo-Iz; Tue, 19 Oct 2021 10:33:49 -0400
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com
 ([40.107.223.58]:7009 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqBX-0005c3-Ij; Tue, 19 Oct 2021 10:33:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqkZKUR9L4XGB/AHvMAfHLrk6tsrwOeZZuRbYK5qU3WlnjX8dU7lyw24REaPSXTckS+Wy3Vx6azv1/VPXN7YbtiCjkgYLULggr98NlMZjptWKIXkH/q8P3kBj52tos2Un6Pv8q5Z8tDb6reRJv1gRMoEArHjBvSgk4tSV3mGW/Aciifiu2RQMYqW5VLwGHrC2RzL7PfcsSaa6FqQELF3O9iV8tryJWgeZE1tcTVT1gyWFca9vWcvGbDUo2/rKO1bxHIWFrSea7k/KnvdJqVCDp/tWp9/cOPHf55o+aizVm+LEw6DezGHCA2hbC8S4MfS+7m8GPmenKSHGd0zKJqh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQWp9p6XxYhKlZMJUvjNkSRNWuzJQVMg4hZ0QzHvWoM=;
 b=F1XniL+LGcPMKAQWCruCQW46ceBpPj+zPsg1Cg5te/weFmS2KgZwQwmRxUOKl28BlXUIxsdGGEHMfETBxm2d+/javgqJn8VV2fswiWOgo7cytTFsR6CzYSJFFu0cdL4NbJhh1qrIlvO9mEFjLcbmw16CSwiGRXm11veDeWbOB52acC1bwhGJAYBqB3oG41Cbd9EJWXIewkpDgV5ljqOSDmQaR0xQt/1TExMnDiqBW+F/BUWw0c9WTywUW6SuhFjkrY0QrAbNpIqJ73ThrlV9pl4IdQhiYvzVYBz5SPeyEM/oUW2TRWobRECm8ktS/MfjxeQuf7X+s9p5DxIl5R6JNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQWp9p6XxYhKlZMJUvjNkSRNWuzJQVMg4hZ0QzHvWoM=;
 b=Ey410sD6famvZCE0okZMmpfY7LMHA3DwoTW/IO47HRfIhS0yrfdGpa2qP5HfyPNbamZ2KHM5VCIZX5IfnUOFVcP30VqP1d+z17fih1EBF85vE8FSlRAdf8WWd5K2GhD44t2hMpRzq6J+LLwKSDXBztgA7BppOgsntKRYMFybAVE=
Received: from DS7PR03CA0307.namprd03.prod.outlook.com (2603:10b6:8:2b::13) by
 MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:33:40 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::ce) by DS7PR03CA0307.outlook.office365.com
 (2603:10b6:8:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:33:40 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:33:39 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>
Subject: [PATCH 57/64] vhost-user-gpu: fix memory leak in
 vg_resource_attach_backing (CVE-2021-3544)
Date: Tue, 19 Oct 2021 09:09:37 -0500
Message-ID: <20211019140944.152419-58-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60fbd819-9540-413b-912b-08d9930d71ba
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:
X-Microsoft-Antispam-PRVS: <MN2PR12MB294148040C094564C7E399F395BD9@MN2PR12MB2941.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLZKSKs8MCdIczVzw4D4KqriK9KcyrTfY0OyKnrTd1niAiMetIOhYgScfisFqlTb5Bq7mkGIFMC5fTwkMuubQH/ga9qxYMmGHxWDZor7dnXXIRN+MKluCKxSMRcHaQuL/SqbF2Pb2Aax+39wWIj84rQRHk3FzbxHDegsTs8mOcJxS2E4To7QnbON8VVK5MJMmUK8qQM28tNHfwtXlAMvUDvfyCZ9zxwM2s3aG+MDUkIkZ9IopQpOs7o/P/EhjsaPaDH0G1Ah9m3f/Ki5f29Ue9Joj0FyUMABXlJfSiB8ekPIW7CjWF/JYepSlFNhtYgI/15PF/QAWPSzfICKlLHLtkS6ky/iZ3/EM9+FVmsa4th1A/s7UW5gVv2AE0DBLZvoM1FimIF8Yw6lQNE3QkldXKSJuYdFflI38M6TqGxELWGwWPfYt+FZ3XCTLN4vqZr1yUTt6WHXAcGrU0MTLKLIOIdjfI2ikxvtlYhJbyRN8M8Ip2zqalRT1Jbits/HJxZv/ofrB6OyHWQCpdvbSGR9PE/fgnl3jea8FYTsF3+AJgvRPryW4fHF0KqqAqLU2MwFwxZLpHW2VvI1x3ntnffmma/8VjJwHYuxXp2YmHr9CaRY1RgpR2lYWzu+oHDtTTtMmX9aVgBPRXADqahU3DJLMy/mwn67PNxuoMsSpw6G7yg2A4lfCFQBxanh52RbWdJLCnS1aZ6kszV4GNdvPAwIbSbyHnLtkaljUeU3eUkmatA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(316002)(54906003)(186003)(16526019)(26005)(70206006)(70586007)(2616005)(8936002)(8676002)(82310400003)(2906002)(426003)(4326008)(1076003)(336012)(81166007)(86362001)(356005)(44832011)(36756003)(508600001)(5660300002)(47076005)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:33:40.0806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fbd819-9540-413b-912b-08d9930d71ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2941
Received-SPF: softfail client-ip=40.107.223.58;
 envelope-from=Michael.Roth@amd.com;
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

From: Li Qiang <liq3ea@163.com>

Check whether the 'res' has already been attach_backing to avoid
memory leak.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 204f01b309 ("virtio-gpu: fix memory leak
in resource attach backing")

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-4-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit b9f79858a614d95f5de875d0ca31096eaab72c3b)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index b5e153d0d6..0437e52b64 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -489,6 +489,11 @@ vg_resource_attach_backing(VuGpu *g,
         return;
     }
 
+    if (res->iov) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+        return;
+    }
+
     ret = vg_create_mapping_iov(g, &ab, cmd, &res->iov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
-- 
2.25.1


