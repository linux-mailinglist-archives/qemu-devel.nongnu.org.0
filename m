Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB80E433A47
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:26:56 +0200 (CEST)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr0x-0006hu-OD
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqAY-0000GW-DQ; Tue, 19 Oct 2021 10:32:46 -0400
Received: from mail-mw2nam12on2051.outbound.protection.outlook.com
 ([40.107.244.51]:45063 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqAT-0003Yk-KW; Tue, 19 Oct 2021 10:32:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPhWdT1h7cv9+Ki+OgJLJEGGwT4+gzy4/dejxtl0ZVXVLWRz//hA4RZ5aDi9bfvFj94i5hP0vw2N27eVuH52q28i87zPEpXuwAYr/E821DDXrq6dbz+9XAdSnPJ/eCu2ken6r8g/c35qhV1iq413aZTSPrgO566oL0SHKdLt71mIlHgMcRgX50zP/k4moxDvylMfJUWgC+kVZeMGdU6HdkjmPrCQIHBWuA2CUo21y1+DRcVHaBLlyb1HOQEPFaZhjJ0hESSpPsklfiwzMHyj0GCPlSgvl4qSEIt3mq+XUvEQiFOwiiyIilZtpT8SqnRHl1R2Pa119G7c34PVbTNG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrL4aylYH3ae4cuUcay6KWZpjG+ZdRB5xVMOqFoqJpc=;
 b=Cs2NA8mycAxCmrzj7/47jmBaNrrFxCaqSsuLJWem5rD5GcgrdtzV/ooGfCRHG8f9cgYz/0/J7IWUyttlmWWvZjcUFUaiayyegMOY6IErrk5afGlxUtxirdMhstDrANqtQNqt+BebSkKCtZwlVFJ7vNEylqQr/0L6nMckVHAQqlNb6yLA7zEQQApJEee8HSgA7Xs1x9kdKw+Rf9lFUiIh7T/GgVj7MCS1a1CZRNW6Z+5JfJEqh5UkmwOzwz3crtUdtri5D8wvHwvwVTlObxkfiw7+2WLwdxCeWIF1cgSJ4MNf1YR1E5HNz/yTItiKaJ8JHWXYrQUneGpNz7uSHAyBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrL4aylYH3ae4cuUcay6KWZpjG+ZdRB5xVMOqFoqJpc=;
 b=odawLzVqNb9iC0PmHcUACt0CK9ODWwDYvEER3Qpy4bfimpcOr9wTxUZKDTouuWQx0Rd8sjqUfg0sUWpYu4/K06BxDwbeoZkq/zSyEhcFTCWlq5uKLPJN0oSwPNU0pE9uxeGdh05/iRpm67fSvoCap8lCIvVRykRWTbQWj8UAEoU=
Received: from DM5PR13CA0022.namprd13.prod.outlook.com (2603:10b6:3:23::32) by
 DM5PR12MB1323.namprd12.prod.outlook.com (2603:10b6:3:75::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:32:36 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:23:cafe::c5) by DM5PR13CA0022.outlook.office365.com
 (2603:10b6:3:23::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Tue, 19 Oct 2021 14:32:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:32:36 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:32:33 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 54/64] usb: limit combined packets to 1 MiB (CVE-2021-3527)
Date: Tue, 19 Oct 2021 09:09:34 -0500
Message-ID: <20211019140944.152419-55-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 86984d3a-dd4b-48b0-3a3c-08d9930d4be2
X-MS-TrafficTypeDiagnostic: DM5PR12MB1323:
X-Microsoft-Antispam-PRVS: <DM5PR12MB132397496958AF322A0D5F9B95BD9@DM5PR12MB1323.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5XkSiKyDXHX0IVHML150tvNKHJYhVJKK03GhuxywJn3RutvDpMdTT/JkQy2KNV0ObCfNrwma0eNUs54/BzM0xEpQqiZkvqcI37KI20aslhABaMEMUyEGXDvANNCNoHMPRDKJCnivdJ9Gm/GPCWOPfjcUdf7/pd/A+0zLfqKBoh/oQyGqxWK8TfU3YrnQaqJLS4wVzmUTANYRTZGn/1p5O1GdVKFUWXYD9S67LGEcyK6peIMraQiqSpoW9+IVHNpzYddqtaG+pUt2fQVm+L+Uvc/AuoSV2U8GH9LGvY3Qt0Pbv+zk94cFX3W2/uaLEjZC412b2uQC6KkIXewuhS2iMWF7yn4pyLd46/cOxlBtt8z2iEUWsT6IkBOQx5FwwFUAj9on59u6VMFtLI2AeFfPPsd6RcDace4Bbu+NbhTb3Z8Jw6ZpmcZ4m6BZ1sW0O5SFhSBGJwzrOBYAMSAzeAtkUBn9HfEI88nTNMz6BzCHuQdoak1BHNbgFjna6r5RIOvPGvEzp9HjfuDAIUN1fvCb5NV0Z/ToNBkAXGf2CcS6Oafhy2SnCLrK2YimO8EBr2el7ggUlk9gLnxDkOBPcjxHBrd7I6dCr+rd+5U8buCxYJlHS7tMWJz7NDz+LliYneVC+DI4D7DjtSjQ0gHa07C16I8BF/ji2d0oQW4pm+1yIrO1NCQa7LzzrNFXXjO2jKjmlypv2n2egjALOfGc0zyAQ5Z7BLC4U3/OX+IsnleQLo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(1076003)(36860700001)(8936002)(54906003)(8676002)(336012)(70586007)(70206006)(508600001)(2906002)(426003)(2616005)(316002)(86362001)(186003)(5660300002)(4326008)(47076005)(82310400003)(44832011)(356005)(16526019)(6916009)(36756003)(26005)(83380400001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:32:36.5791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86984d3a-dd4b-48b0-3a3c-08d9930d4be2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1323
Received-SPF: softfail client-ip=40.107.244.51;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

usb-host and usb-redirect try to batch bulk transfers by combining many
small usb packets into a single, large transfer request, to reduce the
overhead and improve performance.

This patch adds a size limit of 1 MiB for those combined packets to
restrict the host resources the guest can bind that way.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210503132915.2335822-6-kraxel@redhat.com>
(cherry picked from commit 05a40b172e4d691371534828078be47e7fff524c)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/usb/combined-packet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
index 5d57e883dc..e56802f89a 100644
--- a/hw/usb/combined-packet.c
+++ b/hw/usb/combined-packet.c
@@ -171,7 +171,9 @@ void usb_ep_combine_input_packets(USBEndpoint *ep)
         if ((p->iov.size % ep->max_packet_size) != 0 || !p->short_not_ok ||
                 next == NULL ||
                 /* Work around for Linux usbfs bulk splitting + migration */
-                (totalsize == (16 * KiB - 36) && p->int_req)) {
+                (totalsize == (16 * KiB - 36) && p->int_req) ||
+                /* Next package may grow combined package over 1MiB */
+                totalsize > 1 * MiB - ep->max_packet_size) {
             usb_device_handle_data(ep->dev, first);
             assert(first->status == USB_RET_ASYNC);
             if (first->combined) {
-- 
2.25.1


