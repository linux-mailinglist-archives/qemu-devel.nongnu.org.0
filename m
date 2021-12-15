Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D733474FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:55:38 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIa1-00036x-D8
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:55:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI0m-0000aT-7b; Tue, 14 Dec 2021 19:19:13 -0500
Received: from mail-bn7nam10on2078.outbound.protection.outlook.com
 ([40.107.92.78]:49180 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI0i-0006ah-20; Tue, 14 Dec 2021 19:19:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpQNe8CGTp+Bb8hqlp2D6ACkvrnVOs/JqGN6UtJ6FNKYC6Q63dToZBpg+PTagcvDc6TN99ej5h4ehVjDEyb5fjO9Ro/i7kurZOzBr8lfCyoG7zJpduotvH9DZlP4Mr3e69wBScWbVqm14nxddNUW/bYGFvXbewGEcztzYGu7o5fsy64/e7aU40cSrQ4vPA7RCRFgzbNVQVZy41/uybX7csFYw2abIqi/0ju41vFPooQc95UD5u3fEvF9F3DyutMdJgux/nFmrNa9CAjN5BcrUkuxTWsBmXCihP1ry+BRF5YNQB3okmnT5TvpSA3a7kb8jHBPBXS1pQpIh7w76FAmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTuTcfJFG2D2G+EG65F+rhctkWVk5bPCtIxZ5uUtri8=;
 b=j2rMiALohKsrsogoF4ZVa+bVGMtelyrdiUB+AKw8AveyovLjEd9wuvyI/mcFUEZ+eTcAHpRqUlgTMlyE0seQoUuycFtWVEV1EWA/PjmqDL5uElnKttpvJsbfejaGAcduMpx4xXve0ySUNcYWQz5uvvNZ7tDC5lqE0ltbcNGmNgBYNydsa9xNwZXCp6iWqzJondTePBpU0/9iKREu5mhN9rIb369zsOjtA8mFvkBNWrsvLyUnoinRyOazCYP4LDEWfxGN0m6dA6bjUoCziUeqPAdSIjl1PGx1wDPEkYvWk3LI14OaZiqfpwXuu/JlbRxYnWwPfEl+EWS3bnrrEziR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTuTcfJFG2D2G+EG65F+rhctkWVk5bPCtIxZ5uUtri8=;
 b=xMiOj6bysIJdt4c+MVsMCJugYueTTdl959djNuoky4RfK6FCnnfpP5zu644W2Ems16IPxDFmqULT7LF51om2SKqWIkvQshMImOjDmUzxYpGVyGweUes0zPVrni0FFyvxuBA/08+gN0L9lb0KA9pmCO02Us4wJBNVNrS82boY32E=
Received: from BN0PR04CA0022.namprd04.prod.outlook.com (2603:10b6:408:ee::27)
 by BY5PR12MB3939.namprd12.prod.outlook.com (2603:10b6:a03:1a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Wed, 15 Dec
 2021 00:19:05 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::4e) by BN0PR04CA0022.outlook.office365.com
 (2603:10b6:408:ee::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:19:04 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:19:04 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/47] virtio-mem-pci: Fix memory leak when creating
 MEMORY_DEVICE_SIZE_CHANGE event
Date: Tue, 14 Dec 2021 18:00:44 -0600
Message-ID: <20211215000125.378126-7-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3947c229-abfd-43cc-b924-08d9bf60809b
X-MS-TrafficTypeDiagnostic: BY5PR12MB3939:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB393957B809341AF2A7CA0EE895769@BY5PR12MB3939.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xN2JGIhO6htnf+VcTa2pdm7SLtXkEzcBX3LwlBHfvsiEKXDi4goZ2mHkJwI6uwjrYfrJCDUTiNSlqKyZCmi2vODwQGkwVGCcsz4PXUDS96EmqLugcZ3vFwnXNn/JqQfWOpgQvKJg4qvQWtMAkOfKmo+abkYu8lVSIPLvq+IEGGiz7hAX7SgjDvjYfFPa4KxwNV2ZM3HDH21HebUrhsfJfTSnlSBFwQcUWHv5/4bEt85JeQEIA0hOZhxKMcdLAoxCxfjYX4RFt4A8acxyZ+TDh6gDRjTHsjA2zg/1iDP6Qn5LVoguPcN8nWJoBR5Bm+oG4Hr73BgN3k1w+GRzL62w3VG8f/6oA8b3Zo2J2kysDXzoskbpoMMCY6mEItkQsUaokh7MlZyCS82Y4O23Ncsx/7osCNCzm0ouQyVQymmrtaVUFMV96DHhbuMZHx3DMzfqZTZZf/71rhFZSYVH05/g0HkGd9NLju4kD3mV55GB9DE+9TlOM9NMTWrQl6UB68Je5H5pSx9CIIeYl1PakcE3/gEWMUos36eVQBJbKYZnJ9bFyStAefH4v6fe1wMzJF0MUVsHjKUnWY1V9CGiK39+16MnEu71zWQeyEMLI7Ha1H1V0VwPcxZGVF/oBJ8YgBeH1pqq6oR2C7S0P4VkSt4sxVyjS1/6m4st1bV2i7wU8st00d6cbuHwc4E4Tbl3Cauhiw3K0zzhwMGE4BZmGTzn1RjJFAf3jLs1N9jHAY7hFbUCYlnWjAOQvcaZn6WFqlV4H3fN8aCk0e0ab3YbE7devNCOPnRATSEHZPIfwQwQeWY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(36860700001)(2906002)(5660300002)(2616005)(40460700001)(508600001)(36756003)(6916009)(1076003)(44832011)(316002)(82310400004)(47076005)(81166007)(336012)(426003)(8676002)(6666004)(186003)(70206006)(54906003)(70586007)(356005)(26005)(4326008)(83380400001)(86362001)(8936002)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:19:04.4621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3947c229-abfd-43cc-b924-08d9bf60809b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3939
Received-SPF: softfail client-ip=40.107.92.78;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


