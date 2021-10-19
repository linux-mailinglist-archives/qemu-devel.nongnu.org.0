Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A84433865
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:27:38 +0200 (CEST)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcq5Z-0007HZ-5H
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpv8-0001t5-RZ; Tue, 19 Oct 2021 10:16:50 -0400
Received: from mail-dm6nam10on2081.outbound.protection.outlook.com
 ([40.107.93.81]:45567 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpv5-0002TS-O8; Tue, 19 Oct 2021 10:16:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jh3SyKYSsqsFl3BFVVg99alqjIZs6aOT+FVsqBy8y2e3ZpuEEN3C4owqjNru/ECaHaZz572mF+XgRp8ySrGsLOGoecfzobG94Cwkvc1fQOv1Cdz1cMRsb+9Cq91XCRKBfAb2drh+L8WB2+qaCW/l7ZgpyCT3lBgPmguYxAgTNLz+QLQY+Exq1neBT7msTuBYgh28RSqHyIE4jDEG166vbtV1aW1RsGteVjWSmgusSYGNb0ps2hYlVdmZlNK17scVkbBD/Yn0afPWAu+i8GYQGXOFVLtM9GlKtQUrweUAALBxpp2FmFzcimpNQ4n4YDeoHjLx0+XW/epfGc4DZP4xUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QQVl2sF84AD/afziiThjimoT3tUaIkXEN0U8QEguOY=;
 b=ihUFyb4kj+DIeSwNlqd1UuXF7GN/DYtH7HblVIpj4ydnW32lh7ieFX8agUyx3T8LKFPc3daaDF1lb8HIhCMr3Vxb+wDBknU46gTlSj7NCyA4XdQXqvumyY1qiWQ6jbOumrzabI5GvxfEs8faB15W5tFnXjVaJWVS/AX4n0FZilBEwnTBRO6QFE/7iWWoCfY3usFgwVaGi/aLyKoXFpk1hSOSXIeVXOQOGVuMjAKvXbFNLu/q0iC8K/NQi8j8KdHhHBBElnXRSSBPDqvmp3rQptCXQnPnIFLPTIGPxZxzLJoVHWHaANqUAPiC+62BRzNVANT0ejb26wDyX2KoggQ5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QQVl2sF84AD/afziiThjimoT3tUaIkXEN0U8QEguOY=;
 b=Rxyt1K511xwtXdgB4FT2w76ITbfFNVDT0ZpFgwnuofeKPCApDm8WGX4Ic0FVF3gjiv8oJwgd5+ORZQ66XBYDhZDwFeCXrIP3xFT8ik3ZN3vewSv4GOpFrBQAuD4omAeIoSaOAj6Zq79PO9mU+l4l3fQGoReR06eXNEUzi8645Kg=
Received: from BN1PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:e1::17)
 by BY5PR12MB3860.namprd12.prod.outlook.com (2603:10b6:a03:1ac::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:16:43 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::14) by BN1PR12CA0012.outlook.office365.com
 (2603:10b6:408:e1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:16:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:16:43 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:16:42 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, "Richard
 W . M . Jones" <rjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 15/64] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Date: Tue, 19 Oct 2021 09:08:55 -0500
Message-ID: <20211019140944.152419-16-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 87a56609-6df9-42bf-cf48-08d9930b1387
X-MS-TrafficTypeDiagnostic: BY5PR12MB3860:
X-Microsoft-Antispam-PRVS: <BY5PR12MB38603210E45EE89D80294CAB95BD9@BY5PR12MB3860.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i9LJNDFMdjDfSmItbbp9bygcD6GE5LYyFNBP+wTyYGkmmDSTJWHhGqW/ckfK/kTCftEb90lQKWXUVls1Y40sjlPnTKOZK9s8AWHwtWyQCuJESbAx24X8UbS7OOwTxRGtglMwQ+ACPMMydfEFCIsffaLpfygB88iivNoaRan3/Lb3vqnrZb0qNplh8j/ouKnSyyw5Y2uP38hl65S2TSNngs2nV/KY2FfYJ6xbhgsbNFvXtX+q7u4yxkWrewtxVCKTfZSbxw8973dn3GVlhcnovNoBHsC8fbWxlU9RsShdzq0HdaenWK9F5sp8EbmGXc96uGUNelq/mxnKdpahF76eLmCBUajWFmGGnY4QSqw7aorPxjIThegTEJYRnVizPuiXCRBzZmhK+6YcTE69Ay6tE7CHUq73foAdXRn93OH573E9fZ4Gs0VhKYVouDcweOiCE+A6ggthyRt3cwKX6W13vkZzcqoIn8VorBzVjOeSo0MOuPBHC4IrLyKNRmykXi78+MI3uWywCF/E2y5RJu2mEIC9LZ4NWPIJjW8+k3OKTV4Rx34fh7AWEgZtdPrinU5L0S5nLlcccRZY4Rb0Myx6IxK6CjvKiR+SP5xJofa9dRskcgMX+I52ZHRJ0yu8D54AZGD4hbOhfHj+oNnzm8PnQrjK/k0XBhI3h36OEoCL5d19ZAdY26LHO66T8UvZelUdkW/v9P0wnAohII+NHNeyifVY2RsQD3DR7u0eMo9rIOA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2616005)(1076003)(70586007)(36860700001)(44832011)(426003)(81166007)(54906003)(336012)(82310400003)(16526019)(8676002)(2906002)(47076005)(5660300002)(26005)(356005)(8936002)(36756003)(83380400001)(6666004)(186003)(4326008)(6916009)(316002)(508600001)(86362001)(15650500001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:16:43.0796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a56609-6df9-42bf-cf48-08d9930b1387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3860
Received-SPF: softfail client-ip=40.107.93.81;
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

From: Stefan Hajnoczi <stefanha@redhat.com>

socket_get_fd() fails with the error "socket_get_fd: too many
connections" if the given listen backlog value is not 1.

Not all callers set the backlog to 1. For example, commit
582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
socket listen() backlog") uses SOMAXCONN. This will always fail with in
socket_get_fd().

This patch calls listen(2) on the fd to update the backlog value. The
socket may already be in the listen state. I have tested that this works
on Linux 5.10 and macOS Catalina.

As a bonus this allows us to detect when the fd cannot listen. Now we'll
be able to catch unbound or connected fds in socket_listen().

Drop the num argument from socket_get_fd() since this function is also
called by socket_connect() where a listen backlog value does not make
sense.

Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
Reported-by: Richard W.M. Jones <rjones@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210310173004.420190-1-stefanha@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
(cherry picked from commit 37179e9ea45d6428b29ae789209c119ac18c1d39)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..2463c49773 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1116,14 +1116,10 @@ fail:
     return NULL;
 }
 
-static int socket_get_fd(const char *fdstr, int num, Error **errp)
+static int socket_get_fd(const char *fdstr, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
     int fd;
-    if (num != 1) {
-        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
-        return -1;
-    }
     if (cur_mon) {
         fd = monitor_get_fd(cur_mon, fdstr, errp);
         if (fd < 0) {
@@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **errp)
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, 1, errp);
+        fd = socket_get_fd(addr->u.fd.str, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
@@ -1187,7 +1183,26 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, num, errp);
+        fd = socket_get_fd(addr->u.fd.str, errp);
+        if (fd < 0) {
+            return -1;
+        }
+
+        /*
+         * If the socket is not yet in the listen state, then transition it to
+         * the listen state now.
+         *
+         * If it's already listening then this updates the backlog value as
+         * requested.
+         *
+         * If this socket cannot listen because it's already in another state
+         * (e.g. unbound or connected) then we'll catch the error here.
+         */
+        if (listen(fd, num) != 0) {
+            error_setg_errno(errp, errno, "Failed to listen on fd socket");
+            closesocket(fd);
+            return -1;
+        }
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
-- 
2.25.1


