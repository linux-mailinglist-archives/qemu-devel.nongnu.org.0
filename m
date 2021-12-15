Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7F474F91
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:53:53 +0100 (CET)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIYK-0007qF-J5
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:53:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI16-0000nA-0J; Tue, 14 Dec 2021 19:19:32 -0500
Received: from mail-dm6nam12on2086.outbound.protection.outlook.com
 ([40.107.243.86]:58049 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI14-0006bZ-1X; Tue, 14 Dec 2021 19:19:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcEYwJ3gOZw1b/13XSoC85b84PF5+XkcIadl38Y4ngSwCxXNN3uPFNsZZ9KZ1ZqzRpk2EYv7gbfBlPBQlUvL9hkMQ8MuT1ECwjLTnZ2RrSDjy900mP8WmG1/sRRgVt+FMpFhMqzU0ThnZigx1uVunsk/ZQ7Qso1xuZOVqNvfls/WLWkP16UOiBSC8bOhji8kdzxN6UkvXZXaHkUUvGg4H47PpjU0j18nm0nq098kXuVW/xoId9nnsy9b0H6PbvIfp+RDmwI1F8rB51fEBcmQu6VWC5vJ3kDgC8HDb3ebVb/i/ZrMa4AvTvo8+zekXxdfg9kZVTClqcm/MYSk/zm3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3t0Of36ttc9Am/ojr/s3rUYC8SOMQj3BSwKT/cJ0pA=;
 b=eqBKeiYHXc8Yuow1YXTmwjirPN6RwKayGnmQfqjJL6qfZ34bFqYmv2gh+H11/lqHkg5yTrEC27Jj349kIN3AW3vM2rm7Jiise8HMTykQDD6k2nI4tBFTZkflCNlfQSy5/KSZXEFAIz12H5YCtv6dtcTbSakqRDEf5uIH5PSrZTChefuYbQOIcibuIb+PeiiD79Jt0zWisIEn2vmTvJrmUbopWO54sxmT2/vQSmBgBrmWBRFkaMFAieqwONxMPIUynYHWbg4AoQWweIvOTFZ7rrvxKXzoFaSTHUhieBv/QdWJZLWyiDqEXm8F8BbC1kXzeOn6Rb0LS22VKJ+TEsezfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3t0Of36ttc9Am/ojr/s3rUYC8SOMQj3BSwKT/cJ0pA=;
 b=Fn19ptPWqGDZ9cY6V6ybg3UZqSF7t+xlYvZv1DXvp8HaOAwOwyQarXFLPMGKajG7zh1uqS36gr+26W/7MXRaNkWfzN9UDoq0cd6Aez6XSg6nrHkZAVCeYWWFeBDYIFFXxuwWP4RTJCBjgvH5FUvBseS7XQkzgoFlj4cb/hJDG8A=
Received: from BN6PR11CA0022.namprd11.prod.outlook.com (2603:10b6:405:2::32)
 by BYAPR12MB3141.namprd12.prod.outlook.com (2603:10b6:a03:da::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Wed, 15 Dec
 2021 00:19:25 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::ca) by BN6PR11CA0022.outlook.office365.com
 (2603:10b6:405:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:19:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:19:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:19:25 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Chen Zhe
 <chenzhe@huawei.com>, Tan Jingguo <tanjingguo@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 07/47] uas: add stream number sanity checks.
Date: Tue, 14 Dec 2021 18:00:45 -0600
Message-ID: <20211215000125.378126-8-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6dfea955-ce83-495e-2c2b-08d9bf608d0f
X-MS-TrafficTypeDiagnostic: BYAPR12MB3141:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3141FDB9CD13A9578BADB56F95769@BYAPR12MB3141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YYB47b+bdU7gJiF4p/43Ifn1pMjNLLgoSOR4LMsY+PcowYWCNXaCG5RLTU4TfWTF+uj3cqwZgxTfYh/6G/P7qmsjDsCeCy4crWaA63ysnzXwUAI36ZfUKnvyDiywGwU2SXNm2VvT9f76EEu8Q7kuN0npM6Rm/rvS3QA5cywBghNr8ucAQpUs/Dp7/PSdjZpMTJtjMZkV4WIpZi9PPr8LTpFhe8lRQorx+F5elTQTFDfBSck9L//ux3aVfI3y6Z+CjEbPCCUvIA7o8VQy2qMKQCLTepk6cPGnstUUZKxCo9PLoDM9PK7l2d+s42pfVgWqOya3Awb9DdesYO9zAr1ovFP+sPiOLVORs/JTfImHTWEqbJm1na1cS37ELJ/gUSTMD738dqLQ1Itp1qIUTwhYv68CuJ8chfkcRel+zdncPIbahn8muim1wUTygqhmLEGKiQ8T6/RqZVWrmVUl8mYVmrPV95SdILCtvMrKrrY9nfS9EuZ50bCVSUsEklk60CXbs7G0UL5tvKL9PuMPY5Ve59vvx0rptdIRe9JmVOhxkQFOr4aVNeFeNf5a8Ow5YSW+Z1dbEXUtKGZ0r7Yq/tN4BG7/Oq6xw9GprQpb8QrtJW2HdRdBPRzDogndljaObmjDtPCw6aN+DunHYv4Ae78MFWPy4hrsg/8e67JHGcKsDVxDni9VKOoA274JbS9MHKvoTt4wolVdsXFAnJgNTnNFlGTDtiTzG2+3CtOWu/oLi0Gd6WEbJYTL9AC4CybCPAGJ+5XCz6RhMA5ldu7W379H3YbQVdK44WC6WXMdfJSkYk8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(40460700001)(16526019)(186003)(316002)(2616005)(47076005)(82310400004)(36860700001)(426003)(1076003)(5660300002)(336012)(8936002)(508600001)(6916009)(26005)(54906003)(8676002)(6666004)(70586007)(70206006)(36756003)(86362001)(4326008)(2906002)(83380400001)(81166007)(44832011)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:19:25.3549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfea955-ce83-495e-2c2b-08d9bf608d0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3141
Received-SPF: softfail client-ip=40.107.243.86;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
index 263056231c..f6309a5ebf 100644
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


