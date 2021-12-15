Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECF474EE9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:12:12 +0100 (CET)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHtz-0001kt-3J
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:12:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHp3-0004Er-RR; Tue, 14 Dec 2021 19:07:05 -0500
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com
 ([40.107.93.58]:15840 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHov-0005Ad-QW; Tue, 14 Dec 2021 19:07:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NszNREGKcwkJwESd0F1lo0KqSDpfULLYpqDtotXZtYOkMsbx7EdBQuy38LwreaQmAsNm9aZfnlTF2oqh7BFodg2r1bzaNUBhoN1PPBPNFRPDHuASez8IDCSs7ETk9nvdjTepCS8+xhKGIY6KVau5zzu94+LPGvt3krTxXxnsUkVHs+pKDmvH7z7tri6kLNMEk0rmqTpvMoH8urkaVaPrjWXb35AF1Yb8pEny0rDoJoQWdD+HRly2jiqPFgj2/qougfiWSMAEby8NbW769+KZWfQCqVuGhWZNkU6aAcd46PML0qTh7qR0KFO7ty7FymcW4BVzuBlavhHR5061rH+WVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6HA9xHW0rIbRYLi4CQzDQ7qsAC3V4YK/kUChnEVKuE=;
 b=WsRI7zcrhZ+CZaqu++BwrchAn+ecQmoSetzuD+l2yL37uCDoOPCxtGVXoC7FXb7lL54d7NyuJYZdr8ANxpECOP0Wgv323E5eRH/1vl0Q1axa91vCS43or02T3tnTxUt/xL57Zmw/Khl7QRZm/0/L/JaqUMcrXf4GXIbUWjfOKZ6fLwVEY0kD8sYq5YFTu+vs5Mn46CGsh1xRGC3yTDvWZAumhWmTNEN6hyxk1fPzXhoZADRC4AXWYk7JaFdHgX/P+ZljrwWgc1EFtc5+MMzKZBpeHINeqhdYf7UBy0otyLguA/10x7wY1V2njKvh92idhPb2R4sP/qoyyMyfiVpo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6HA9xHW0rIbRYLi4CQzDQ7qsAC3V4YK/kUChnEVKuE=;
 b=oZLVYi3endDKbim5nfMhQ8vPVgteWXUEl0Q6QLRZl49U1JGYO/gorjPvMMayz1+0Ji1hcft1WsdzO2dqC7k/265iOX9ZMXDE4YCPouKhemV7PHJnxLUYm1E6OtfNoE8tp38gS/aUmn/0IhLqfAcMPzGMnkHBaz1vTctHLknf4q8=
Received: from MW4PR04CA0369.namprd04.prod.outlook.com (2603:10b6:303:81::14)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:06:55 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::7b) by MW4PR04CA0369.outlook.office365.com
 (2603:10b6:303:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17 via Frontend
 Transport; Wed, 15 Dec 2021 00:06:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:06:54 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:06:53 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH 18/47] hw/i386: Rename default_bus_bypass_iommu
Date: Tue, 14 Dec 2021 18:00:56 -0600
Message-ID: <20211215000125.378126-19-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 52130fb4-94bb-4ebe-418c-08d9bf5ecd82
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB45578C78D2A1296FCD0FC1EF95769@SA0PR12MB4557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DMj4K0TlLLqUsg9YiGPOBeBTCOslgudlOywnuh1IfcybkQ9I3PIxtKVtANqKfrmip2ipxdyTCx8K0Mfyy3yZJ455Izks6HljKlBJsK1KSMTLgVicUB7F9m8J6Bkdn/aZh9QNaLGLiW4lhea3WunQZxBfoqNN/tqNCQIftmf5dBlS8skgmYPlKcqlMdn4+va/jbVyHfru+A149l75cAcpLW8jD8vvyCv+viCp3NLE8jzVt49dbsqPpo+PQXzD+WfKZ0YmlziV/OO62rTULsQy1ERjCpmpG2d7Dw8wZZw7YEDHh8iNGUjjPxX15FevW9SDLSafJcFQAwgUvL7l47JeTFqILdWfZNNxIOyJeieu7kUT2zsjgQkNn45HgDf+IfU52+ALLnxTe9GlAFhqfJ+wzCnFY6ARZ/VeIkf2LZKvE5EFD1YmhyQTZpRssMZTkF/L9TR6T5zeE4Qwbz7qyoxTeuR5LNChVj5B3C/wTQQ3z6naxSMtTaCZXP945qloX5tHql2roDbW5RYD25L4qKXA+1Y5s0AIt/uTr1cpL61d9uFr+fDs08nflOo78AmUsszvOElIs2DWLRDDbDKQ/mUbuC23doapTE519XFWdvRAPlZFnoV9bgXuAqfPdZdB8/AkMC5ehzIAHTHs3wlmJZ/4ksrhe3wb+UfEyKFEipLmM95tUkMsDRf0CCnhrSu6WCb+/jj5cB1BcYCoO7dX0ZvhYXvRZDSE3/P5QZGK7JwIuYwaYmBswxWyjczSVt4Z3zgW//KAqh/uxcAKie2/9f+61diYLY+R1PP+VKvPdXFUquI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(70586007)(54906003)(6916009)(336012)(47076005)(81166007)(356005)(83380400001)(508600001)(8936002)(1076003)(86362001)(316002)(44832011)(8676002)(4326008)(82310400004)(2906002)(426003)(36756003)(186003)(70206006)(36860700001)(16526019)(2616005)(5660300002)(40460700001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:06:54.3613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52130fb4-94bb-4ebe-418c-08d9bf5ecd82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
Received-SPF: softfail client-ip=40.107.93.58;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
parameter definitions cannot use underscores, because keyval_dashify()
transforms them to dashes and the parser doesn't find the parameter.

This affects option default_bus_bypass_iommu which was introduced in the
same release:

$ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20211025104737.1560274-1-jean-philippe@linaro.org>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 739b38630c45585cd9d372d44537f69c0b2b4346)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/i386/pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a35..1d421ae2f8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1763,7 +1763,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
 
-- 
2.25.1


