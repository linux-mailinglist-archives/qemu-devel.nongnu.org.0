Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D06B6401
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHwj-0001dJ-NU; Sun, 12 Mar 2023 05:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHwh-0001Or-Oc
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:51 -0400
Received: from mail-bn7nam10on20622.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::622]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHwe-0004ZL-Mh
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDxG38gN6o3InzwxdsiS0pdsSUyUcpkLYB27zCiDLC7KyDY6cdg4imH3a4gJQjDnCQaJGbU5yxkOCJRW2zjuFwakupl+gxRvFDFoGjtdkvbO2mV/skbhS0/AbnuZJvp1uaP54txefRESK60pJW0RZqddfk6AJlN3fpIy1FAHRjI1EoNAmKmeRU6W2XYC/FX4RyBQXxKDsAs0McnSs12hRALJp1oZRu8x1eseVckFRoCdETisPVd016WxnhQFm+NZEnikOvpLGOg10jOEYuhK2iEZF1kw+hKz5olibFQFb7rlaiULgP+f8v2G7AQ7vT+L1d+dHU/b6KPMaHSbaJQzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONcZvV/3JhVdOa/JNutn7iJ/bvID7ShJBlvTVgAdRIs=;
 b=KcaW8FIKuQD4JI4o67xgsUW4hw4Y2z6p6E86AASbgTFWGltm74IjS5ldvizdXeXqflnMyNUZY0iCEInLx7pSHNWO9GWBZ7BL7vv3Gy1RDs9knVkKolJLokB+v1KbnJPu1qBjVJHMWYew3DazipL8o+pB3hlfmypjkTVp7CG/JUmhrp2Yhhahc5C0gLOrctcvqpSft+Jt/v2UKB94md3gU3BKAy5RZOAVm+SNAqw/UiydDVs47RgUYhd3ybf4CFUcI+tXyIvld+RfPrzX26fVrdsse/Fd9RPV8qVUQB41JJwh0wVzvV9fEhKqx16ym1eAXpF7Sf6K0Xjvb3TUXT2aiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONcZvV/3JhVdOa/JNutn7iJ/bvID7ShJBlvTVgAdRIs=;
 b=aRKb5y0/t8LrvwnfB7g8HXEFes1DVbFg2/OPIyt+RXNMf30Y0PB1wAoZ1w02iV4TS41uPJRIHv2y+kIa7KXh8lCplhbz04v04CdSqq65Ry/DrDZFXlOIBM1ALXuK+WDden82Xfcn1mWrxevRdUevLxyfmqciCV99T7Og037QJ+8=
Received: from MW2PR16CA0059.namprd16.prod.outlook.com (2603:10b6:907:1::36)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:24:25 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::a9) by MW2PR16CA0059.outlook.office365.com
 (2603:10b6:907:1::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:24:25 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:19 -0500
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
 <antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
 <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
 <burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
 <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
 <ray.huang@amd.com>
Subject: [RFC QEMU PATCH 15/18] softmmu: Enable qemu ram allocation with fd
 for Xen
Date: Sun, 12 Mar 2023 17:22:41 +0800
Message-ID: <20230312092244.451465-16-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT023:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 320fbbc4-3ebe-422a-ab2d-08db22db92a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XkZ9taQILHR0OZ90dxiZRfwAFgw/6CfL4DrM9E48dgM040CHWp7IozkZrznaCg9GKRAXXUr8XF8K+TWTWaBRhv74DPVKjtknJS+YP3S4LbFv8tdFMj8ufhpUpIs5nBy/RIcFqyYB/U1Bk+LckmLcJfRXkSMKZd/tpkL1Azp32fM2S+r3oRkTRlpXRN8tgl0zKdIPNQpH8xINo/In0dZT2XBG7rb+sMLZQEAFLPZCVQkevGrvEmgsPxGmEfE4r1o/o81TVfRmYSVDACekrhBe04kkgw9w4FF5tMyqrJNp6qRkqTc6qRHEOX+lT06KaXLp2dHTd+wSNo/74LImwAbI496CrUkDoSP0cAXm4q1Fe/ZVhK+Xfr0v0sFa58yTvKzV3mtzjKqk2pkin4d7tADWygQGBShrlSSaQmXCTIwn9qCEbSC8ODmXgP+URxeShkdw6hw/4Xct/GdpxfiX1wBnuMvQkhz1W2Pxe6Ge6vw8E4AmZ7G37stGjV/ONvPq0ru9ZsVNa6uetY+GR3ZOXri+EsDmN7D1wqQA2L+vIRi7in6Y8EX2ZcEPMkY6VdOpPeKOf63Oli4go4+oJJeuWncOWqr9gf6sDJPXAiDi2GFn05QNDu1FfbUt9phihs/vgFRL5S7cAXtXM3AXdgZZRQj0RCToGAb1S0ARcJoN4v4a4YDj0/irzXdNk2gk5dGCwfpMVR+piiloufY/RHmlmfCEiREyFSc7XucXtqKSzZ4hbCspSk+agj4k8YhJEYOpTzUN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199018)(36840700001)(46966006)(40470700004)(5660300002)(7416002)(40460700003)(4744005)(36756003)(83380400001)(47076005)(426003)(478600001)(82310400005)(7696005)(6666004)(1076003)(26005)(2616005)(336012)(16526019)(186003)(921005)(356005)(4326008)(8676002)(70206006)(70586007)(40480700001)(8936002)(41300700001)(86362001)(54906003)(110136005)(36860700001)(316002)(82740400003)(81166007)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:25.4680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320fbbc4-3ebe-422a-ab2d-08db22db92a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::622;
 envelope-from=Ray.Huang@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Venus is requesting the function on Xen as well, enable this path on Xen
hypervisor.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 softmmu/physmem.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e54561bace..2838dee2f2 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2060,11 +2060,6 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
                           RAM_PROTECTED)) == 0);
 
-    if (xen_enabled()) {
-        error_setg(errp, "-mem-path not supported with Xen");
-        return NULL;
-    }
-
     if (kvm_enabled() && !kvm_has_sync_mmu()) {
         error_setg(errp,
                    "host lacks kvm mmu notifiers, -mem-path unsupported");
-- 
2.25.1


