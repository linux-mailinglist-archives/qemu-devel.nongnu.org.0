Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51E474EDE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:07:12 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHp9-0002ki-1u
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHlq-0000rC-Va; Tue, 14 Dec 2021 19:03:49 -0500
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com
 ([40.107.93.61]:37349 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHlj-0004h9-KC; Tue, 14 Dec 2021 19:03:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM9h1zD+Bb2mwCjw/0aAQacJwhaFsW0qqt02qo0FGE8SSMyhTiQR1jTX/2lEc4PAvQ3epmsTItEzQJ+Kl9dzMAfTD0WKc/2JFxw9fw0bIL5uRKfqKuGVHy+8DaqzuLa2ZDMBvg/BgKnBGYUJ7w7K/1N4ZMUMbaUg0OrdDqefVlgfCDIuZcrk/7ts4ygax00LfjneXG6IQzGlvZVHNLTtM2icr19DwNtA6Dyty55eSCDQsv/5eXx1nkLQuC99YX6O98Ec+yBomXAJJZMrErKxjosNaw0nKrWs36lwVrl9bMCSIgKPaufL2gs/wvIEgAV/OK2vHVDfO9/X7aZnHCbDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moT7gGN12IOpbF6pRI41tYe+3kWPqvOuMl/htAVIf/g=;
 b=HiYtv9c7Di9dOyG9jKBxht1ppXFPjfKHHRG01n53iaoqGh8Rl8cMOsJWxmySvchv33kKVCmDkk1rHYVWhgmD5VFyxDfoJcEg400a8DkohyXIkecgP0HXKWU+C1zKPH1zN42m2E7eNs0RMKNW1tvLCF8DpNsq3PP+E3DXd8qBS5UNNw/fLQ3r9zOJiJmErvcILxWar8b5WTtuvL5d9jA5pHCtLdvsWgBwDfJRjq0MS1OSnzEuTjvB1+Mpqaur6au/6My7RNxEUI038wgLDdw3z1aLsVPegwvOQwlOrJqxuRVfiANMpdpup+SzdsLrqJ/g63QQ9GCT/HajLwZ+Crj8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moT7gGN12IOpbF6pRI41tYe+3kWPqvOuMl/htAVIf/g=;
 b=cGI9Y3D4Zl6NePN99BZRotU5OtiXXS+nTiM6CTwaAQrJ5SGNhHjFCF11RjC6rf2tASqInVn8VCS2Od+KLOAPG58D3VRLgu1t65kaFEDMpRJz2852OIJaNDvhgsQ4pDCQEjR4nIMlEwKrInOyG+PAlFXjV8UyYZ8FOEBHvxp/15w=
Received: from CO1PR15CA0047.namprd15.prod.outlook.com (2603:10b6:101:1f::15)
 by DM6PR12MB2780.namprd12.prod.outlook.com (2603:10b6:5:4e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 15 Dec
 2021 00:03:24 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::7) by CO1PR15CA0047.outlook.office365.com
 (2603:10b6:101:1f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:03:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:03:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:03:23 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, David Hildenbrand <david@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu
 <coiby.xu@gmail.com>
Subject: [PATCH 09/47] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Date: Tue, 14 Dec 2021 18:00:47 -0600
Message-ID: <20211215000125.378126-10-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4b441c2d-ba00-4f90-52d5-08d9bf5e5048
X-MS-TrafficTypeDiagnostic: DM6PR12MB2780:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2780D100A2458DAA3C019C5A95769@DM6PR12MB2780.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLgZpNQpzRyA9PZqHQkA0YfkyZS4oK10EYT6UcfHXhs1XdfPqHQhiyIUnMhoiWQ/ecj5C6ggxsO+qF+ypX2bwCcHFZw/pOuEyxjr99vniaQcDXDrKSnVkxEhYf8RTaDQX2BZ1uyv/B7WbK3kfgKjNLmY17c0UPbD/nJkskmko/N4ef/CHWLBFz2nmff1vBlMi/pvlhBHKsCJczymhHhJFfMqyPOO+S/5M62tS+7kIEJdMyyAAuQVLKx6pG0hDAvx7r9+Zi/z4YY6kJUxhLGnRsokmUvGa9bRu7qWO7vfAgk79/FLrersO3DO8P0yQ0Dn9gvkImbh5fl84f7H8+ykhq40YQsk3S83qzxH7/ecwQ0vI0uQciH55NwDO5nnkk4jlZQ0UIXzKmDrzdVS2E7PWM5diWAer1YR896IW+u1RAJ16QJ7SNDUcdKFZpB3y1UCQ7rvKd33pHo1RnELQfS9pWmDPy7EVEGbrboWGOZHNjx3W3WeZk7duAS2+B9SB3gH0HZP6EnUkhI5Op5D+XAil+vwSdgwtlls8ia+fruTNODse5+LcAqQNrkX7bdS8/96VEzVYWgqJeEEy5v3iFHpYeoKv2tTPGyfkX3DJwNKqvuXqIoKBbTHYum7DVXXEaNVRusP9vvK/nedMFxm0jKbsN2xnXf6Xnut1iCjlMOxECZn+n6aYk0UhkLP3FFLi3nbfO3UHEaWpIyGQYOrpms00e4qZQfU2SPhNhfD+JDibgYOqkLFcBvXOtK4keOyACwgcT90irep7/Y+qglztsSU+XgBroLJ9kBQI+wO1DPPEwM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(6916009)(1076003)(6666004)(186003)(54906003)(8676002)(26005)(316002)(8936002)(16526019)(356005)(2906002)(83380400001)(40460700001)(81166007)(70206006)(36756003)(47076005)(4326008)(336012)(70586007)(426003)(36860700001)(2616005)(82310400004)(508600001)(86362001)(5660300002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:03:24.2665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b441c2d-ba00-4f90-52d5-08d9bf5e5048
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2780
Received-SPF: softfail client-ip=40.107.93.61;
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

We end up not copying the mmap_addr of all existing regions, resulting
in a SEGFAULT once we actually try to map/access anything within our
memory regions.

Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
Cc: qemu-stable@nongnu.org
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211011201047.62587-1-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
(cherry picked from commit 6889eb2d431ae962e3e083b57bff47cd573cb1c4)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 subprojects/libvhost-user/libvhost-user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index bf09693255..787f4d2d4f 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
             shadow_regions[j].gpa = dev->regions[i].gpa;
             shadow_regions[j].size = dev->regions[i].size;
             shadow_regions[j].qva = dev->regions[i].qva;
+            shadow_regions[j].mmap_addr = dev->regions[i].mmap_addr;
             shadow_regions[j].mmap_offset = dev->regions[i].mmap_offset;
             j++;
         } else {
-- 
2.25.1


