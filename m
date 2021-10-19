Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D94339D7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:09:00 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqja-0007Ps-U5
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqAE-0008JA-7r; Tue, 19 Oct 2021 10:32:26 -0400
Received: from mail-dm6nam12on2076.outbound.protection.outlook.com
 ([40.107.243.76]:56161 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqA9-0002DC-5i; Tue, 19 Oct 2021 10:32:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=At+VZ8wNcAmXGrVmQO/O6bS/AIlqOhK3MRCSE4UHeLeSOigIdKBGW/uKDXW1K6lhpsztK853025f7UbF3Tj5fCJVNWwhoA9rcN1ci8Il2l/YNDeJLNKoT3+lVsJVcytvScI/Qi52fPMYODg+muqZOz8sLObHZsVCf1T9XkYtKT78YIFBBFxixPJ8MI4QpY4I14T9b5+i0vfHxz5nrdNmUTlu3RrtwavUG7U9a6hiBxuDsGMbLU8kHO1IAlCtmlDEPe5OCg/wOM2jrw/9N0s0+Qr9BD9c8Gehe+0C7NB5CNXswsnlJlfWlqaInR1BBhS2rsl+1B0pHABTDMn4Kgxogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSI4HZaHBOcAjDAqOqUwKpf3VV+6TPKcrPPU80jFBUM=;
 b=bu75DmRQAyTwOGueJUG7ISuVQK4H1MqmYSgC1Bz29eJgcZRJ4I7tG6EssNIYRROcH01PmL5Nkh0NwHLLxqlANVpB8lb9rc3yVcAl/dn5uhG0d1VvIeIusZIkH0gWLICJwAasbPQjePSeytkYVYzJjRQOrg0WuN3ShPmH8y7+f55uTulbVw/BMmA3+FSwPrUdrWCsASYJlyuf5MgT3hjGJquO6Eg5T15uDMpTAlxiI8eCKi8Ga6Tnpu+PRDCJEO+MtlOlO55jppkH5fIC7HVyOlPzHyLtDTPDmvRY3lb3/RQ9TiazvtF9l+VF68k8zJqzFnyUJAjBtYWQ+l9EDEeRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSI4HZaHBOcAjDAqOqUwKpf3VV+6TPKcrPPU80jFBUM=;
 b=Jm0q7LdNjM5K02GChZbMoBgiiJhN2VT0qgQ3M0vPsYqQZfvv8KMoCDCJJEGKpHD0Cv6evO/f7fxdmr48IkzDvVCdy5MDdf59y9YK2mceVT4AnSaLpSJpDh0rj1ElpoHlNIA70miZagutxcYif1xxKABEiE/VuTH5a7MnHz87i54=
Received: from DM5PR20CA0038.namprd20.prod.outlook.com (2603:10b6:3:13d::24)
 by MW2PR12MB4681.namprd12.prod.outlook.com (2603:10b6:302:12::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:32:16 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d::4) by DM5PR20CA0038.outlook.office365.com
 (2603:10b6:3:13d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:32:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:32:12 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 53/64] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
Date: Tue, 19 Oct 2021 09:09:33 -0500
Message-ID: <20211019140944.152419-54-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ec3fc3a-5e29-4436-8383-08d9930d3f5e
X-MS-TrafficTypeDiagnostic: MW2PR12MB4681:
X-Microsoft-Antispam-PRVS: <MW2PR12MB4681E1708A28F1EF1646B25395BD9@MW2PR12MB4681.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTFkxxBB7H050vaPsazJPXxs1K6PEypQwjVYJ8c/fv5DpXw87rJ0FUKLfgudcTJrgbCTC+yEQN1XTPfcrTNEaBZN8cW/QdK+vydfoDkijrxclCHSX5ySstkUC7TUw9MkZn3Mb8xAeKDqvBa5W2L1EBsyuneEkgS6BZaYzRkW0Xnqe7NgYssowarBOyqkEMmNKx99cRtuZdYOzWAsnWcvXEUFiu0BsKCCiucJzlctUqLng0fMg9Ic8ODLVpbsmKmmia2qUHqPGoIuai/zdGnVHpgbHV/bKBuSLcbbWwM+fl1XmsU0dXNsaYwyc5ieK051i/DDRXmKWpyWCg7bQVST10XDui9vUytMn8GqBqW+m/evn/O3DD9634xGK5xSkBlWDpheulJFF1CbEW9D5oleXNWAZPYfDKL0O32biwSlJoqkZ8P9n7/nMjhzC7y8xjOlSdcrarZUHTZupRnNyzakkZHUAmH06FAhVRynqhW5V3uPtOGH9JdV14JzKnbs3K+3/lDw5YRo1GyTr18KxCEIsKy96UGRZXOswvDQkXl2SPXBjWbF9nbELQ3MTkhqL5S+038ZvngFGjx6jv7cv54F8XYD+PT2ZBZMoJ6H/xQUO4ItVheAD8N1jIVun6Y+v7UicaQPlXgPiHR4R3/beQ+qxva26TwQwqlwy5BlrPv7jI619rrcnnuo2gzfViVVcbyOeNi9XAi5KhWK+86T9WSyZnzyb1Cay39vx9RPrBFA/TU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(36860700001)(81166007)(8676002)(6666004)(86362001)(316002)(70206006)(336012)(5660300002)(44832011)(16526019)(508600001)(82310400003)(8936002)(2616005)(356005)(426003)(36756003)(6916009)(186003)(2906002)(1076003)(83380400001)(54906003)(4326008)(47076005)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:32:15.5662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec3fc3a-5e29-4436-8383-08d9930d3f5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB4681
Received-SPF: softfail client-ip=40.107.243.76;
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

Use autofree heap allocation instead.

Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210503132915.2335822-3-kraxel@redhat.com>
(cherry picked from commit 7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/usb/redirect.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 17f06f3417..6a75b0dc4a 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
                 .endpoint = ep,
                 .length = p->iov.size
             };
-            uint8_t buf[p->iov.size];
+            g_autofree uint8_t *buf = g_malloc(p->iov.size);
             /* No id, we look at the ep when receiving a status back */
             usb_packet_copy(p, buf, p->iov.size);
             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
@@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
         usbredirparser_send_bulk_packet(dev->parser, p->id,
                                         &bulk_packet, NULL, 0);
     } else {
-        uint8_t buf[size];
+        g_autofree uint8_t *buf = g_malloc(size);
         usb_packet_copy(p, buf, size);
         usbredir_log_data(dev, "bulk data out:", buf, size);
         usbredirparser_send_bulk_packet(dev->parser, p->id,
@@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRedirDevice *dev,
                                                USBPacket *p, uint8_t ep)
 {
     struct usb_redir_interrupt_packet_header interrupt_packet;
-    uint8_t buf[p->iov.size];
+    g_autofree uint8_t *buf = g_malloc(p->iov.size);
 
     DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
             p->iov.size, p->id);
-- 
2.25.1


