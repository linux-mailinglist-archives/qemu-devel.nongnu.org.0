Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91E4339D9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:09:22 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqjx-0008DG-PP
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq9S-00078o-E8; Tue, 19 Oct 2021 10:31:38 -0400
Received: from mail-bn8nam11on2083.outbound.protection.outlook.com
 ([40.107.236.83]:41504 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq9P-0000rp-4f; Tue, 19 Oct 2021 10:31:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5zhPNTMCk1N1ZLqA9sd3mI8v/j/yIgat+4EMWiU9566gcUmNtUU0gpnL5WfuBv2EfirdkzmobAXr20ORXB/k/TfaBx96PxoQOc5uiUIw69VtDxgc8JCPTvJ3xNTBDqM7s+mzg103zblma16t0PZtBCLKOWXos9D599OHVUvCPbApfhz9fqHZnrLUdCQPpMLRrenqaMRUutj8RSLxykU9PcMIn2RBWNdM9aNFxsfeMLfKMDxG5s8rb4TGGPFEskb9ZfZVEQAocwxrtND0Tbkm4gY/anhJogyNOcYb6Wjtb+WI+DNOsbdnllLuBEIzV2apCNZuTUXAK+3sJbDfQfDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTuTcfJFG2D2G+EG65F+rhctkWVk5bPCtIxZ5uUtri8=;
 b=jA99L1E1azZMgYIxa9U/JE6MzucgsrLnnJmjlVpKhYCZF2JjqTw9G/08Ct/CKNOwvHFDuRmGq+zWYkekw27FnL6uzQzRKzYH+m8CuwOqOT49Y4ZdcZpdwrJv+OHohIXfEpNVIjKxbDyRxVBAfthQRhgk+T+DATkDww6rPtKGhatXSDxl0h5XBx5xRVZnmMg/Ya9oqXsWBy2WW6DXE051wQzu9FmfKmlgl45u7DguOoYe3BX2nKQE7IB3iWUqp13Er7pXuup/GpDpgy6lwNJAkw1ueArYbgR3HcIkltB8h1UOeIxZyMIUb+3HVw66419wf2TJ94P9oEjRslyZYVg70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTuTcfJFG2D2G+EG65F+rhctkWVk5bPCtIxZ5uUtri8=;
 b=T+xEOFGkB8hak95acWU1wIKATTnbX+i5MEYQzUdYoNJnK+hLfWxFkhmExbWX7hMK6tKrPupvYkZ97gkELThvFLq+GSJIvZ+z8N434tY2CVYYmgLelwkRmhgtVFDUj8v2hxiqJQmShUJaWW89I9YjPk2mZdg0W+n83YHiWOk7sLM=
Received: from DM5PR16CA0025.namprd16.prod.outlook.com (2603:10b6:4:15::11) by
 CY4PR1201MB0247.namprd12.prod.outlook.com (2603:10b6:910:1b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:31:30 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::10) by DM5PR16CA0025.outlook.office365.com
 (2603:10b6:4:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:31:30 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:31:29 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 51/64] virtio-mem-pci: Fix memory leak when creating
 MEMORY_DEVICE_SIZE_CHANGE event
Date: Tue, 19 Oct 2021 09:09:31 -0500
Message-ID: <20211019140944.152419-52-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a738c0a0-d46c-4d4e-acb0-08d9930d2466
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0247:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0247EEC8CEB941B80BA124FF95BD9@CY4PR1201MB0247.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYYXZMSqVxpsja7fw3AeEGcwwGSj2km6nElss10FJLKtHWaaFtrp74EaWPzgJnWSfwCCoD5guqLQ3oS6bCk5NxsTHdR1VJfAeI0LfqOth8D2S/ApVDdT1qHlHToB2u5qq4l9mrJkOC7fDBO+PtJtkcquThfvem418EwS6Rw5K18hMRvqxrUhI0VKOg8BdwtPHapbOyUs7GPKwPAJEPVMDDS4QFfBcG44RoONlmg5ll2OAFCfgLqOKpAjIwoWvy0QfprDg8vUhhBEukEG/Qa8yjd6XHJp/GhGi1XMGAQEQknkO3fnPR5C8Rh2H459HFS5HNt4G3SbyWfUyQDi/sUXbww3+efTZ8wrO5icXN+tjZFTJKI69s7yTcbmvHpczJsX/JD2tx97LjnyPw+ksT5WkIUBVDRjFngqfMfYGexH/umVHcxrt6DBQeGOnUAOmz6KdAk3BRihlnSmExEjhEUiYMvCJMmcGipBLmvmKxcEJGEqt56Zqhds8vm3pz0FNkWF7GaACh6eWUYk3sVixjA/XAc/3mdi4gSupDi+NW6K7Nqomt1VzTcWuzRu346rcAKu0160mnOc6qAS9OzJTG3/GiOXK5LI9uUfYznJlTtMNEXTJbc0Fr3GIc20PI7WeF/s1UGGuMnV6RUpB+Mqg1gdoawvBqMLSlupt3i4FmvTmXzOF+s50V+0MhDBJgQkAJgH+AfkapRUOofG4cFGlQf+TR9HO+lQBX8pzC0VdDRCNMQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(8676002)(4326008)(70206006)(508600001)(8936002)(6916009)(54906003)(36756003)(70586007)(82310400003)(83380400001)(16526019)(186003)(316002)(356005)(5660300002)(1076003)(44832011)(36860700001)(2906002)(26005)(81166007)(2616005)(426003)(6666004)(336012)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:31:30.3402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a738c0a0-d46c-4d4e-acb0-08d9930d2466
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0247
Received-SPF: softfail client-ip=40.107.236.83;
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

From: David Hildenbrand <david@redhat.com>

Apparently, we don't have to duplicate the string.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Cc: qemu-stable@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210929162445.64060-2-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 75b98cb9f6456ccf194211beffcbf93b0a995fa4)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/virtio/virtio-mem-pci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index fa5395cd88..7e384b7397 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -88,13 +88,8 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
                                          size_change_notifier);
     DeviceState *dev = DEVICE(pci_mem);
     const uint64_t * const size_p = data;
-    const char *id = NULL;
 
-    if (dev->id) {
-        id = g_strdup(dev->id);
-    }
-
-    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
+    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p);
 }
 
 static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


