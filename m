Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8548433B00
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:45:05 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrIW-0003Mb-Qw
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqBv-0002bH-Gk; Tue, 19 Oct 2021 10:34:12 -0400
Received: from mail-bn8nam11on2080.outbound.protection.outlook.com
 ([40.107.236.80]:45042 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqBt-0005q8-Iw; Tue, 19 Oct 2021 10:34:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVpi7X4DvUwm+iVO/rCBiWd9dGJa86LBqA+G5qQo8CKsO281pydc2iupP0TjIlV8PS+ZOhtAwIN57qxgd+GSig+xlHVnEmMO0FT+0K03VUMW7aHSSejYb/WQMB6OJyfmdLqol5Ib/cJ7TfzWehhei2CEvLMjrl50+JLpP6j5YMdUu7xM6rYdU68hhqWRyrsbcComVUeMk/2xmWLi/3bmqgXJsyWHB6dqn5tocD3//kL1DNm0NRYgbsIo4MksBBZ4USpsmNh1JPY0eWKEpaCu1Q1QNSptAfllEtht353HzGm5e8Pm1CzV1kJQN62viiTHBC6SuLIhD9N3CoDo4Jykug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq0nf964qR9RJYWV+Xhk9OM6/59SFvsu0pZ2p6YQE9Y=;
 b=I26aTLO7ELbwbEVtNn9IHc0ilbhh3q+e4YZHYleQTSm5ouBspHTb3oUjzBIItHW8bzC+F/6FKwe4DNqk+o7JA2HSqeolfYQ5VcRnaGfx5AS66Ho+ZDdKnawn/xRnXLEZBBeuI7fmHe0ZcW1U0hnqb5J1Rqi8BOUR2F4/ISZ0eZErkZ2a+FZlbzjYITSKi4WDXP3B046qvkk/HlCMRp6q4HgePZeCA3s0VSyuEQ42+JBy1x9J9J6Qs2IOQn8qWwnzAo/jmlwthP327G3wuHeGsv5RNgNaLxsS39rlJohnLaFQt+6xnI1jHYvEXGY38kQFRUEhu+Ggfp2EV3HAayInpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq0nf964qR9RJYWV+Xhk9OM6/59SFvsu0pZ2p6YQE9Y=;
 b=llNvS9eRCBIRlSmtS+nyRBx9FGOE9pvAqIetRwP8xTO7Tn/oTFfXXPBfL4VMK6KiQcbpQj29uiwFL6gseuZM5konk1z6r/yzJqF0qCAFQ3qYoiL1ehO6Unhd1TiFH20KeQMdQocR2o1Mjcur2jF7OYhidv34j52J42Sl6v6tU4k=
Received: from DS7PR03CA0316.namprd03.prod.outlook.com (2603:10b6:8:2b::17) by
 BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:34:02 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::60) by DS7PR03CA0316.outlook.office365.com
 (2603:10b6:8:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:34:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:34:00 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>, Prasad J Pandit
 <pjp@fedoraproject.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 58/64] vhost-user-gpu: fix memory leak while calling
 'vg_resource_unref' (CVE-2021-3544)
Date: Tue, 19 Oct 2021 09:09:38 -0500
Message-ID: <20211019140944.152419-59-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f1d9d84b-e6aa-4329-c550-08d9930d7e9c
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2467:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2467F98CF02DC72FE9589EF395BD9@BN6PR1201MB2467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pmXF/ebwHhhW2tJdGfNwazRGYkdYr+bF/fYgfLWCMWI+w+xNFYnEPDZwbrG/JzYUXnhL94EDe75xtQqqgYimYb63kvmrFcta+iHtGX4d1d2mEuaBcviz64oHlgl7gPbsu+6Wn0wqjmgEONTwpOplyRDloifcBodZ9p0gQnYtvQp03Fb8e+SqWywM3SQrUv8NvxANfoXaeKsFSc7nBBZ95K5pDd9ASm++P50nfW2WhLzBYP+a8LVfg4QDnjhRAyrUSGZQDtzlcDoMM2fIvfZVKM+nPbeGgH5ZIalO8ETMNTpgNhWrNnWbZLRdG/5ADnmcaC7KQYzqqTPEhA15BI2BcFKP9sQjKAQXAC8SJGxxfPXvfQkW910Yx19r9mAAUdNfRNPo4ycsjD/2LDQUur05/aNtqoWL21ZP0mUj1WbHpDd03IH9eUuwAAcF0XH834LZBCLbFpEY0yiBQoRGf3kGDk6EZ1mKM8xowEt5eyi2WtSxtJPQ9bUnHtHDVkR373VppSnAmA3rznc+13TomtJJOcK660PL4VD2aVbYIsVh6zJU4g3+K718KMHperDGHnbikGrVmgez48io19xvWaX+AnjqkydyS9qysbLsFQr0IUcRkVPONU8GxjksmFfjrZRPqYEgCvAmvrCsnAQChTohCkh3cTrqu3NgAAV0hQwPTPmp0CAyUVGr0Rns1Emr6gr1eb+x6oEaYbM0n0oNHQd+6LT2+fncRwQv3QeAi3z7q+U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6916009)(70586007)(82310400003)(47076005)(508600001)(316002)(6666004)(1076003)(16526019)(36756003)(186003)(2616005)(83380400001)(26005)(336012)(86362001)(2906002)(356005)(81166007)(44832011)(8936002)(4326008)(5660300002)(8676002)(54906003)(70206006)(426003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:34:01.6897 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d9d84b-e6aa-4329-c550-08d9930d7e9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2467
Received-SPF: softfail client-ip=40.107.236.80;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

If the guest trigger following sequences, the attach_backing will be leaked:

	vg_resource_create_2d
	vg_resource_attach_backing
	vg_resource_unref

This patch fix this by freeing 'res->iov' in vg_resource_destroy.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
in virgl_cmd_resource_unref")

Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-5-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit b7afebcf9e6ecf3cf9b5a9b9b731ed04bca6aa3e)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 0437e52b64..770dfad529 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -400,6 +400,7 @@ vg_resource_destroy(VuGpu *g,
     }
 
     vugbm_buffer_destroy(&res->buffer);
+    g_free(res->iov);
     pixman_image_unref(res->image);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g_free(res);
-- 
2.25.1


