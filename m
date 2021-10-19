Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F015B4339E1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:11:49 +0200 (CEST)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqmL-0003ML-3F
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq0l-00036M-E4; Tue, 19 Oct 2021 10:22:41 -0400
Received: from mail-bn1nam07on2056.outbound.protection.outlook.com
 ([40.107.212.56]:1422 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq0j-00016F-HK; Tue, 19 Oct 2021 10:22:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpF/gKtkU4AccdTyXKFnajpA93iUIc2/RkcPKGQQNP56ys4vY2Yv/f7EFojblul4+gEohXIYzMeJ2em9OuTr7cTbWENF7ZzxP3CldfFNbnzlew8YpSIQ5LESWX63zTxs0Ed+G1i+RDiNCDNnBHWaOEr4m/usoqItylmddvhh3wa0nG6xxGeft9lu8omkrYvWiafA73bDK5gKOP8rEGbIXBJ4hvrM8GfEhkTeTU/uHubCnjMjfbIF3NJ75sEb/5NZQEK+Q9K7+hWCDyu5Xzyve9j7790ifcNpHB6QPfPevOdWiFfWXCIkRgoJ9Fqi27uHJ64yV92g83CUTQzctRPqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVsrf+YQi1RxxflvWqI7pgqQyzGLXC6WzdhwC3P64nc=;
 b=LohPkGLRJU2va8PpFADuRxlUFeDQH46Jec6vk+vqfAbPGoG2+41YdNatWWRdcXJg7oGC6TcM9Ic0M4ou52S1hQbo1nyFSI8giogMmZB7pVt0JjmZKj2tnZJtibfBXf2NxMtqI+eRPCdI0u/HuSypH7W0WPorTgj7/avWcSnZod89iLuQ4Mc7ixfvrCvjzPQOhwRGKiRlqTVOyskjBW9V5wcWVi1bK9lzH867D8TXHMZnMBqIjActOv9eSzIgCnryW++MhfGQm/oNlEZCelr0HPDUPa7OHUKXsyxCZh0cxz1H3iK2FNDXCjmaqD1GyBgXOi0zH5XquZY0rtrSuX+g+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVsrf+YQi1RxxflvWqI7pgqQyzGLXC6WzdhwC3P64nc=;
 b=VNKm/+CnFlD9jrg034HVOeZDpuLprpDGu832UWwScVD8EOVQY5FG5/RQR+5WoXpj3fwvUe2nc2CPim7phkjvu3ZYH2j/taZogZr/0l9mNU5A7TOKuR9ovjNb2UMM5fnfen5NUNrdoBKcIka74sZ15DXy2SEJK+FvvfRIE+5Qy/I=
Received: from DS7PR05CA0001.namprd05.prod.outlook.com (2603:10b6:5:3b9::6) by
 DM5PR1201MB2553.namprd12.prod.outlook.com (2603:10b6:3:eb::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:22:33 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::58) by DS7PR05CA0001.outlook.office365.com
 (2603:10b6:5:3b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.11 via Frontend
 Transport; Tue, 19 Oct 2021 14:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:22:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:22:30 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, Eric Blake
 <eblake@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: [PATCH 30/64] qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 19 Oct 2021 09:09:10 -0500
Message-ID: <20211019140944.152419-31-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9fa36a38-65a5-43db-6753-08d9930be3f6
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2553:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25536D745F1A98C69C1B72AB95BD9@DM5PR1201MB2553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9OSj9Ny2mMx3oScGGqidUvm1j6Tpfa+8UfsRKHywr/Y4Hq5idMIB18wbCSlYX0nvf9NTQjpHcw/KOI+g01g4Z9Xkz+Jc+h/FcJL97Aw2DTP9u7p8EaMHYeCU7ozW/wMnSK/A/aZbnVlExWzJ1xUWwWaOqWpX7EAuPznzl/Iv8jcaCuxjhwVFR+ro0nrpOsCCz1GststI2GM5mMo0RmHpZbAMlJPYgR1mM3l9djqA7JjwkXyAo0nQ6liSp8nrNi81hisSryHUtPGQ0epC8+xbTNWKzmYrbnd/S+ApEEEQK/XAw+E03BeUZ/2BFa+e0B0tXWnzNxroaRpn+a+mYodaPPmLdukG5EmqsqtKyeFxRmIjp1HTwLecfQeQCnPi7bnTjnyCmAIyrER5y+ZcyMbQgt3uHPfaN56MP3EyFaGr2PhaPtEGHkF3qeoedxgQtL1vRSvwnvGoj6ttZlV00FXNb9ALMhube8zkjrahl9Kfic2PBkZTdpxnz8fdUeHnbRKf0a/HpCbOKzVhcEfpi66UxxwnYhAnBLo/9PMMw1PCnLIR5QjCGp/I+Jbj2Fw5p9s2d10ubbLbLEPm6LmHH0zSBFka4UeiZOQK5PYiPgCdjqUejgljGUzcweCg7LYac3jVQgmsUDwyWOR0fdAw5BD3wOYdIc53eAavUsp1VJikA4w6eHJGPLK6KUoKik0ohr6J3LTphBbiVrPfR97BKpfFqNdgC9FKOLVXGfuLYxEqhg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(16526019)(186003)(6666004)(356005)(336012)(26005)(2616005)(83380400001)(508600001)(70206006)(70586007)(36756003)(54906003)(6916009)(8676002)(44832011)(36860700001)(2906002)(4326008)(82310400003)(86362001)(5660300002)(1076003)(426003)(316002)(47076005)(8936002)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:22:32.7385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa36a38-65a5-43db-6753-08d9930be3f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2553
Received-SPF: softfail client-ip=40.107.212.56;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit 0279cd9535283cf5711768ab6401b204e5697a81)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qemu-nbd.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 93ef4e288f..26ffbf15af 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -43,6 +43,7 @@
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
 #include "crypto/init.h"
+#include "crypto/tlscreds.h"
 #include "trace/control.h"
 #include "qemu-version.h"
 
@@ -422,18 +423,12 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, bool list,
         return NULL;
     }
 
-    if (list) {
-        if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a client endpoint");
-            return NULL;
-        }
-    } else {
-        if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
-            return NULL;
-        }
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          list
+                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT
+                                          : QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
+        return NULL;
     }
     object_ref(obj);
     return creds;
-- 
2.25.1


