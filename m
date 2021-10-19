Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E43433897
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:44:02 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqLR-0001RS-Up
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq2G-0005VZ-KQ; Tue, 19 Oct 2021 10:24:19 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com
 ([40.107.243.70]:11186 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq2E-00021B-W6; Tue, 19 Oct 2021 10:24:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR+DwZ4gOfe9OqPJO3x1O/Gr4KrDbBkXZomjNa7XUK7JqFLRrq8JdN9xcoTIPbzB/TqY8cckju0xtLu9sn4vAGdHA3UFKVQicew7FQZZ35Xl4/UG5w77WBk8JLwoORU8A1UMk+loA392NXp7X8Enhc5icerTJPbGf3KmUluoB5qYV5VirQBt9lvdsu4OfJaOYM/EEqA+iRaXkBTbeq6//J7Rw0HwJdOe8O3ozUU/TsaSCFgS971e9YVGY2Y4qpgIO0kd1s8E3+HQnvcAyHVxQ/HY9TaH5z1AmusP9yZjpYXAdoSCFMXiryavs59nUoyuBRlQLdZ+1yU4luEKTHZloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcFjAoOoEG1GphI3Oy83reiuqUd6FcmJ6fcUF6RiG/8=;
 b=j+XTo9qB3LeSkVuk4UWT3hUrM1gRMRu8gNOf13CUS+chz9chOFwtcWNl5wsAfw5G7SV6NvjFAQSYzs9a917PHk3QY9Jl9l/rBmEWkao3mQRkx8BNIAjp2PvLudIxy1xva3ilK220Bivh97bzxekF+TaBgjgZkm/prb/ExFO6AfvYJHj2bGl/qiulhl5i+cDtKSKXfw1vLrQnESvscKllg7jMzBVYersjdgIKRfGufewqriVHYxgkVAwb88wSY0FWohjCmKH/dWaw0ZQRYQ8YiTIqzhiPKVh8UML6YYqUlA0TEFPIHl2PN1GXgsh/cwvNcJ5q2zP3GsBd7iNoqybJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcFjAoOoEG1GphI3Oy83reiuqUd6FcmJ6fcUF6RiG/8=;
 b=5B/7HS394wzpQwd9/h0il+JwYUqF1JV5dTaFwcBdbm9IEsJ24bbhoW1i3n0BatyO8FFMnuZ81SWMv/RLhsBq5dew/Wr4BQofAw1ZRKFu1MDmHU+Z44c8yMMeaUBHaK5yF3L/IFJhpNaEHgd+jasRebNCCCH3FHblNM2uc/HfP+s=
Received: from DM6PR08CA0031.namprd08.prod.outlook.com (2603:10b6:5:80::44) by
 CH2PR12MB3829.namprd12.prod.outlook.com (2603:10b6:610:2c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:24:04 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::48) by DM6PR08CA0031.outlook.office365.com
 (2603:10b6:5:80::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 14:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:24:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:24:00 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: [PATCH 33/64] ui/vnc: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 19 Oct 2021 09:09:13 -0500
Message-ID: <20211019140944.152419-34-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 78956799-f3c3-4a05-4d4b-08d9930c1a4c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3829:
X-Microsoft-Antispam-PRVS: <CH2PR12MB382929DCEEC650429A8A72D495BD9@CH2PR12MB3829.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ozriMX8Obzvnu0dlsCwapqDCEoKm17tfK+QFydqBRisOI13CRK2HxRh+23g9catD5xqnkXm5ieOdUTY8v6wj5yVAAHV91kR5TFfyXzpeHp8/j/xl7DBMFwnEMFEQIjwkozUyqbA17dCLZgtqopmAUYn7/JCLp21pAY/HUW+X1JtWzTO+yfWjYKGJ4cpUVZfCqFouHILVidKfif7awf0MOO/81REReJMOZlWhpIg0oHbU8o+ptE/yrCq6c0lsaj6LDZ84Cr5SWfoohpcYFO7gCgNAUY5+cszXC/4fZmW5+w0c9KXxfttdhK5yX62mOYwnRMh3rMQO5t5+zQ+wnqbmZ4jdP7IY6UYxluvq1kRuJUkXHaX+/CAs/4OxhL8wqR15fZiEuI1J7JrJKaFOW2yi1BDUD0UMYDh6LuqBsGBNGFIgKrVbxopiNpXg+fajtOyp49S5dCyFRycENjD8lvTHqZVSHo9lYpURvvDtOn7cIbcNt/XdC0FrecE4hvJm0Bvb9irLvp/m+rfx/3rJQ1DbWCp4ZH8pHe2Sj0FfhA9q4yHXurM8kSS2E9x8peRDMCpxOtVoJHxxiCrXunRCCTygD+gTYFdSIAq1X0fxaXXEFyl/hNgDmP6V9Cs6Lpiok0uJViOeSxwp3lR9UXFNpHk8Zlg8/gTzutV+r++yRucvmld2iicZ2auPOJVzq7G0CbuzMwjVDhi8vzu37eY7IDoMG4E3uXteed4R+02no08CtvE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(4326008)(8676002)(47076005)(186003)(316002)(16526019)(5660300002)(36860700001)(6666004)(426003)(26005)(83380400001)(54906003)(8936002)(2906002)(36756003)(86362001)(1076003)(508600001)(356005)(44832011)(70206006)(2616005)(336012)(82310400003)(6916009)(70586007)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:24:03.9005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78956799-f3c3-4a05-4d4b-08d9930c1a4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3829
Received-SPF: softfail client-ip=40.107.243.70;
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit 3c52bf0c608419d7892fea95f2a0af8f2e99633e)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 ui/vnc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 456db47d71..36fe1ff412 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -45,6 +45,7 @@
 #include "qapi/qapi-commands-ui.h"
 #include "ui/input.h"
 #include "crypto/hash.h"
+#include "crypto/tlscreds.h"
 #include "crypto/tlscredsanon.h"
 #include "crypto/tlscredsx509.h"
 #include "crypto/random.h"
@@ -4071,9 +4072,9 @@ void vnc_display_open(const char *id, Error **errp)
         }
         object_ref(OBJECT(vd->tlscreds));
 
-        if (vd->tlscreds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
+        if (!qcrypto_tls_creds_check_endpoint(vd->tlscreds,
+                                              QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                              errp)) {
             goto fail;
         }
     }
-- 
2.25.1


