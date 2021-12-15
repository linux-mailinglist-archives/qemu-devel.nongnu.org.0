Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CE474F0A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:21:45 +0100 (CET)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI3E-0002lJ-9E
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHoI-0002OF-JZ; Tue, 14 Dec 2021 19:06:19 -0500
Received: from mail-bn8nam08on2069.outbound.protection.outlook.com
 ([40.107.100.69]:55134 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHoG-00050t-07; Tue, 14 Dec 2021 19:06:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNTaMbQHSwI72WOrT0OFFp7ky4p1aNuslmb/rb1h9q0kPpxybVXwtXdrwbr5G2pgF2Mzcm6jcdVBfGkDke5uWVULUtPTcmKpVxkJUERubSXLq3eSr9RX9Tf6UgkCUcnmQhzF4udQGicX7ZbYeNCtlU3CPrDdM1Ry7BLTlzYUpCORAgJSnVbRCcOOhJc7Etx57FpXv9Qg5yJU3SBgNWdyulXlIwOhEaYJR8a+Y0ZE9QxWv/8rcnk5CBRMeXhrCAuzSBUCfr2IF/SUUOze2zV3svm3//y642XrdHTwY3nPU7bLZ5NGSkrPXemAF9YyL18RTVie5PogGW7TWLqKG1qxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3QNsBIAAxpvtZw1T1s65QvgScHWIQWsUJXQgjEMl3Q=;
 b=cy+xj/o3aNHxQkFgtNh4e/jqOz3IwYsw9e+vsw0bpGG7VgZX9f5ti/T82EnkVQQJ/PthFgNxIr3lJOXJWdKtdb4NmfbdIzAxFACQg8kC/YkUuQk1GDlboR9CySkShM5cBmWBvy6/Itv6mm98ey8ck9lC8TRyoN5CoBizQIUwOMmkcZ5Ui/NhnNVfGTKVjAUZ4O4tqRXQVTAS4abEIwdzMLMuO9EZw+mtV5MQEdMZyDK6Dm0RSlrmHDdMZwdzJHwbi70elGhbBfb7bNPqVkK0XAbS2esSHIVrxuLBzp/ioYPmb7dzeauWExstEy6PfYkFEbyoP+YnZ7y8GA6xbXdJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3QNsBIAAxpvtZw1T1s65QvgScHWIQWsUJXQgjEMl3Q=;
 b=iFmITa88SBSMPrLM7ns/2000nKiP/Nkyo+vNhnOBWPuz+7MmyfA14hEEE7oRfHqw/viyRgIfSIVxoE6901vNNQCd+rgs2o+oIEekULiIdpYczmOnTUdif+ZtLD+7waDwu3SXIAlvm3zz2BXxDcF2Bv0VJoVvgxoqojoEa49rEAk=
Received: from MWHPR15CA0026.namprd15.prod.outlook.com (2603:10b6:300:ad::12)
 by DM5PR12MB4663.namprd12.prod.outlook.com (2603:10b6:4:a9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 00:06:12 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::52) by MWHPR15CA0026.outlook.office365.com
 (2603:10b6:300:ad::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:06:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:06:12 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:06:11 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>, Jiang
 Wang <jiang.wang@bytedance.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 16/47] vhost-vsock: fix migration issue when seqpacket is
 supported
Date: Tue, 14 Dec 2021 18:00:54 -0600
Message-ID: <20211215000125.378126-17-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 33e42a78-b9b2-4892-d6d3-08d9bf5eb476
X-MS-TrafficTypeDiagnostic: DM5PR12MB4663:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB46630581B063A220927AF3C995769@DM5PR12MB4663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZSAtjjRXd8gyNBBy3FGfxsabBZsSHkMlZSFxO6jNnhQj2jx7zKK6lfzkZevmWNlm0SKWOp7ajAzL2xlKt0Wjdz9J+aLLhROX47Tx7s8FMpWhkjJ5wTKFne9AwZquWOj0dGlcE5KBTOR6v9S4fuwMSWNsDOm7oeVHxgc+KG7S1BmULBjYTMfSENdrhafrUSFgaRfiJQNWV5tSG8o/vQgyhEjXr0y+vl4iMbBlaLwlkhvUz7hdrLMpMpLTLiyhQtNSin+3ADIMLjCvIps8P/HRcsCT0OFnuy3TzlecZDPkCmBYZG5nvFeOm3D/nSz4VUpy/8B70YoQWCOCiphegHaIwGjQK/VCteRIxxYlIC1GcwzFCwac2/AZAgUngEoEBFQo8MeLBOmuP8UVcdLDzs+nElAyIr/kkYiD5bd67Ph/SUra05SFmY0nwvB5WG/z/v0dCduYyI9e0MniQbr1LWEDbRXTI3mCtClCe2AJ6IlDJwOJ3leAvml33goTrPnt7hKqiWZVc+C1WBk7X//Dvl/iW+Ffk68+DeYzdo93igpo2uRe9Xn1fLWoSQl7dhlnIzUVSKPshoYqjScgMqK/0L6bGzFSh2IVQ8u8q2M+T6lK2zwcrY7P6SLyZh2QZaon5MLK+IE0yUikZzG01l6jN9Z//Hpgz7D5ajADiXUgPUH07UcAJUNcS7dAEQZdLZrvCwqGKYbvloMQyGWFkH3ZlCcdeeXkcToDU2R6i4PkKk9o3A/9LL+cc1LMrfQGkDWcPTN/WFShHsfBJ/hdeMOOI7TToPjWlQdZUCJxsaMj5yf/F8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(336012)(70206006)(2616005)(5660300002)(36756003)(70586007)(6666004)(1076003)(26005)(47076005)(4326008)(316002)(81166007)(6916009)(40460700001)(186003)(86362001)(2906002)(356005)(83380400001)(54906003)(82310400004)(8936002)(16526019)(36860700001)(44832011)(426003)(8676002)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:06:12.3591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e42a78-b9b2-4892-d6d3-08d9bf5eb476
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4663
Received-SPF: softfail client-ip=40.107.100.69;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
enabled the SEQPACKET feature bit.
This commit is released with QEMU 6.1, so if we try to migrate a VM where
the host kernel supports SEQPACKET but machine type version is less than
6.1, we get the following errors:

    Features 0x130000002 unsupported. Allowed features: 0x179000000
    Failed to load virtio-vhost_vsock:virtio
    error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
    load of migration failed: Operation not permitted

Let's disable the feature bit for machine types < 6.1.
We add a new OnOffAuto property for this, called `seqpacket`.
When it is `auto` (default), QEMU behaves as before, trying to enable the
feature, when it is `on` QEMU will fail if the backend (vhost-vsock
kernel module) doesn't support it.

Fixes: 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
Cc: qemu-stable@nongnu.org
Reported-by: Jiang Wang <jiang.wang@bytedance.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210921161642.206461-2-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit d6a9378f47515c6d70dbff4912c5740c98709880)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/core/machine.c               |  1 +
 hw/virtio/vhost-vsock.c         | 19 ++++++++++++++++---
 include/hw/virtio/vhost-vsock.h |  3 +++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587d..2cf2f321f9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -43,6 +43,7 @@ GlobalProperty hw_compat_6_0[] = {
     { "nvme-ns", "eui64-default", "off"},
     { "e1000", "init-vet", "off" },
     { "e1000e", "init-vet", "off" },
+    { "vhost-vsock-device", "seqpacket", "off" },
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 1b1a5c70ed..dade0da031 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -114,10 +114,21 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          Error **errp)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    VHostVSock *vsock = VHOST_VSOCK(vdev);
+
+    if (vsock->seqpacket != ON_OFF_AUTO_OFF) {
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    }
+
+    requested_features = vhost_get_features(&vvc->vhost_dev, feature_bits,
+                                            requested_features);
+
+    if (vsock->seqpacket == ON_OFF_AUTO_ON &&
+        !virtio_has_feature(requested_features, VIRTIO_VSOCK_F_SEQPACKET)) {
+        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
+    }
 
-    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
-    return vhost_get_features(&vvc->vhost_dev, feature_bits,
-                                requested_features);
+    return requested_features;
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
@@ -218,6 +229,8 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
+    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSock, seqpacket,
+                            ON_OFF_AUTO_AUTO),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..3f121a624f 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -30,6 +30,9 @@ struct VHostVSock {
     VHostVSockCommon parent;
     VHostVSockConf conf;
 
+    /* features */
+    OnOffAuto seqpacket;
+
     /*< public >*/
 };
 
-- 
2.25.1


