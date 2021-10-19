Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859534339EC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:13:08 +0200 (CEST)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqnb-0005wn-FV
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq9o-0007sx-Qt; Tue, 19 Oct 2021 10:32:01 -0400
Received: from mail-dm6nam10on2071.outbound.protection.outlook.com
 ([40.107.93.71]:26528 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq9m-000148-L8; Tue, 19 Oct 2021 10:32:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsheaD34UYGwhia2v04wiR2ZFUB75mWa9LHuOa1OQP4/2OSXJ4cR4b998SYTiXt8Zkwia7sfMcFCu8L+lYw4hkXn0rop2sEpRTp+piGhdJ6/oM3SUFPJr5ybGPbhKVYxkCwgTsM4aUX00S5rNX7KV1fBwod5h7PbWdsAarYWtj8TgiXAnif3z/yiMBTzftEN2izUejf5OYYxmoFgM+1tTUoDaPEsTGbjjlr0atzWiurnijrvIKeqilPl/T8RPdQsRpP3DsVR+9OHtuvY0rT85tlIXdLxZMKqfNfVe8usNwtMgl+aRaVTBajvKjxjeY4PU1Q8p5MEMGA9dQlqpJdTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukEp2kdWvHI6ZcY8tHjKzAOeloz+/2lidUt1i1C6z20=;
 b=F+XIEwvgUFoLyG0BHskojTlZnY1KPVOyF07ZZGRwEuQhu1eCPGEtVrRUPMxzOG/ekl4yFPv7DILA+St+Cy4Kr5g04e9wpQy4I+4fm+Dnt2wbNo7OEfuWyKLy1FjPg6xJguTLSJ27k8rhqrmh/veYEgEO+cKNp0OqxiazPknApVJPBEjCRgRutSQv2KpZNK+8l6MD3UW/0k0d+52fNVCgloHb9wEF4gntsJ16ExoNjQl1p5w31LqFjOL/eGpoumSROPshtpPwZfY84hdnYmL0GGgeE/DrOSkQ1SerYQXUS0WQ1N9cNfZPJiP5Ao9Oq7XsUHyzsEdYm2AY6VJtDrsQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukEp2kdWvHI6ZcY8tHjKzAOeloz+/2lidUt1i1C6z20=;
 b=xe8w4Q1rWKoFhnJzHuKu2E2qFQp7Fzt21/g7xelMk7Eg8QrAHcxTE6weEnWHqNelwdtH2bvubAnPSEh6E5BoTpCw02l4x83u3BuC/CBCQMImbJAXXGRAhnkpOOKwlKo+YIa16E5XSJ3uPNJfB2V8MePUEyP5wWjFjz7sfJI6K48=
Received: from DM5PR06CA0088.namprd06.prod.outlook.com (2603:10b6:3:4::26) by
 BY5PR12MB3923.namprd12.prod.outlook.com (2603:10b6:a03:194::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:31:52 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::29) by DM5PR06CA0088.outlook.office365.com
 (2603:10b6:3:4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:31:51 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:31:50 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Chen Zhe
 <chenzhe@huawei.com>, Tan Jingguo <tanjingguo@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 52/64] uas: add stream number sanity checks.
Date: Tue, 19 Oct 2021 09:09:32 -0500
Message-ID: <20211019140944.152419-53-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c161e27-c585-4ab0-028a-08d9930d30fb
X-MS-TrafficTypeDiagnostic: BY5PR12MB3923:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3923AECE78AD10E13A920C3E95BD9@BY5PR12MB3923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMZE+mE4RdXzb0Q7rtTQOlswWFnyVa9UAzGywb2CarYTew92Fy/Sbt2ihoCtSHxc1iN5qRD61u6VlJfkP4AgUDEK3Y2iXN0ikXQoXOYH2ZHVZm4wmvkQKZ73a1dcNGW9fJzNbqqOXjWoUwCoil9oIQX/plpQ/XpgdbzHBvNfxEMaTHN10oh2unYo3SymrIO8/zq0nrdUQBX9KsRHeXQ7dvGAVzTYoZdAgQHAcy+vZ+csKE80u2jbPwl741SZ2CgfzzVIbbd6sykaCWj4czPyyQmANqEf/de5Jksj1GSdbQEyXuiM25kfrVt1afPoGYDgZ5Lxr83x68em6fjmtbr1V/7XrTjpz2axaZIPGqQ7j0iKor0RZKy0tQG4tNGQvzA+lX3XTSSD3ylcOBXlZLx4JlTuBwF5vodE+Ls55ijwXvv/46Gz3Sfi/NrpsRCWk9yYQPEIEONei8IHlTHGYe2Sx7gBZLAytNkWo+kux2agDhK2qNPhbOTxwYLt0lhSRl7f654+t3wTYxP8dr/CG+yFLkaKgr5C30AKk/XVwVlkwmQHu3JfkparuGDmdYVC4UgIEXI0vbltoldtPL5BStAiVLkUKQ/ofp4ugq4GroOC+BLfob7lXDxW9s7NDFfZwjfbJ7tDjNhIh+BlQtXLZdSHF/WEWbOcXR++LRDqjEg30rTpla81XiLe7TYm+HwY5hhbz2wWVN+HG44X9fIXKS8a6vw9fMoEAaougXvw7dNUHgU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(44832011)(336012)(83380400001)(2616005)(426003)(508600001)(5660300002)(70206006)(6916009)(356005)(1076003)(81166007)(70586007)(8936002)(8676002)(47076005)(54906003)(36860700001)(2906002)(6666004)(36756003)(86362001)(4326008)(16526019)(186003)(26005)(82310400003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:31:51.4430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c161e27-c585-4ab0-028a-08d9930d30fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3923
Received-SPF: softfail client-ip=40.107.93.71;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

From: Gerd Hoffmann <kraxel@redhat.com>

The device uses the guest-supplied stream number unchecked, which can
lead to guest-triggered out-of-band access to the UASDevice->data3 and
UASDevice->status3 fields.  Add the missing checks.

Fixes: CVE-2021-3713
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reported-by: Chen Zhe <chenzhe@huawei.com>
Reported-by: Tan Jingguo <tanjingguo@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210818120505.1258262-2-kraxel@redhat.com>
(cherry picked from commit 13b250b12ad3c59114a6a17d59caf073ce45b33a)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/usb/dev-uas.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index d2bd85d3f6..4866e0add6 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -840,6 +840,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         }
         break;
     case UAS_PIPE_ID_STATUS:
+        if (p->stream > UAS_MAX_STREAMS) {
+            goto err_stream;
+        }
         if (p->stream) {
             QTAILQ_FOREACH(st, &uas->results, next) {
                 if (st->stream == p->stream) {
@@ -867,6 +870,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         break;
     case UAS_PIPE_ID_DATA_IN:
     case UAS_PIPE_ID_DATA_OUT:
+        if (p->stream > UAS_MAX_STREAMS) {
+            goto err_stream;
+        }
         if (p->stream) {
             req = usb_uas_find_request(uas, p->stream);
         } else {
@@ -902,6 +908,11 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         p->status = USB_RET_STALL;
         break;
     }
+
+err_stream:
+    error_report("%s: invalid stream %d", __func__, p->stream);
+    p->status = USB_RET_STALL;
+    return;
 }
 
 static void usb_uas_unrealize(USBDevice *dev)
-- 
2.25.1


