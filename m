Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FF474EE5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:09:53 +0100 (CET)
Received: from localhost ([::1]:36152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHrj-0007Ws-V4
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHmw-0001sx-O1; Tue, 14 Dec 2021 19:04:56 -0500
Received: from mail-mw2nam08on2061.outbound.protection.outlook.com
 ([40.107.101.61]:59232 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHmt-0004oK-Nk; Tue, 14 Dec 2021 19:04:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F04DBiHICOUmaFQM/nw1p8F3NtxUqmwBtqmST2cDELSe8thwmuSYnSn9++hgzSQFF0VJ1T7rJnrxDz3gS/1Bo18qjM+I2U+dDPUD4gP10ykSwz2KV9sSSvlWzDjlQWOXRtH7/rE6BFHs94ZDhT4FYKuMTUfZALvN3duNujFEwwNrtgWU66F0iyegXNzjGEwaTLbF/haOJC8G7bJ3D/luUvSgEl/VNZghbYGZ/rNuFTLQoO2wxU4f2/rLl0r7KMPqPZgc1QZKG84uwaeVuQ+lgLLsK9E1NBSOuOlk79lpoTdXfvANAF5pHoJ+ahpJtgxuihCwzel6niV4orfbf/K7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMHAMcAfoDYSZ3VgkuMOaB+k7trTeXTsoYQqxf0JJaE=;
 b=c5OtKlCWaG16jyRM4xWIYp0b9oYwLb4tvGNrywjSrPqmD1RTSmXm0A59/Os2vS0aqOiSXbHxONEt2GyDDlF+hzB1IDuMhriuupHfAhxzHsyz/Jx3xULAf8IyaGe7A7jS4YMO4aN+OC8xkA5hHaaeXVOICDL+alKI3vXq4nY2F4IipjPobqzDgLFZ+5GIRE6j5qV+Ct4LSPg3LaMKwuqaorbUILMumv9HANwhUoVlOmjs2uW/00PkyRCsjmqOC6U6E4oDf75NGVeIcovkSe3MAW0jQ75alYdWt1xwSFLiUSFSdd8IrX9rEqydckzH3OJQrmEGyUxG8Lf/PpJRDfxacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMHAMcAfoDYSZ3VgkuMOaB+k7trTeXTsoYQqxf0JJaE=;
 b=AHyAubVFXtUlIk4aPSDydHX6+G3GNCPm8dUlB4xwgUU5a+tShel1A8uUm7RF8AWese1Jdl+nNFglT97ImsQMJqRLGxj70H1fJzBw6ednuT9LAjCKHSrE/P1sp5xiVj+7Awn5WfWyEQ3SvBgkFiNRYy6zClb/l6N5TkHD4MAyb6o=
Received: from MW2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:907:1::37)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 00:04:47 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::56) by MW2PR16CA0060.outlook.office365.com
 (2603:10b6:907:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:04:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:04:46 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 12/47] 9pfs: fix crash in v9fs_walk()
Date: Tue, 14 Dec 2021 18:00:50 -0600
Message-ID: <20211215000125.378126-13-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0807857c-a4d7-4765-5771-08d9bf5e81bf
X-MS-TrafficTypeDiagnostic: DM6PR12MB4171:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4171DF5D8342032C318D27C095769@DM6PR12MB4171.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boV7ra0/o6N/QxV2PvRQW6X7s/cq7XHIDeACij7qUaokmlyaC/IG9awdIfHtlAfM0BnrvB3iRuqSLL+GccfH+3krcNlVv03vSm4MPV35oyYdliWXFqY41WqyKUjIox2uWKVN9TcSfA5ANp9f0R73kPffTJ+z8y98l8+O9DEPY7ODWIwMfljH/E5FLomEwj25P3cwFnEQXgDI8w9MsRvAFDcJ5pt4pJTqIMDqcMJr7pqvnTtjKXExlAAPNJjgutxSGIsWllQpZBJx82SAJYoqwEMsZPiyL7ZoKRf2/a/DnTozx4A2TnAdQwsVHf3lRdQcievVuueK3h/OdxrDl94BCqVNRE9OfS4AKFpWlfxfaGwrwtjih5dr5gAPCmD8y2z2e5nZrTKywY9oNgW4dWwIEnOR53ur1YK3Foq+q3ln96i5OhjghqiLeEE8d0fYrpSb7UUldO6/sxoOfx59sRZPh2io9CXzTwv05kAahxN8KGzS8SkYDzBLsswrWcci/kjRZpLXbZt02lQvvKA68I9cSOs9sGox7GqZxYVDVuQtGlIczBsDsvq8W+nObQKpeMzh/ZRDniAGSDcMmDwbnz/aE+GaxvNIkSzN6aMpw12PQYsFTeHEHf30QK1memSILkiID9fDwu/fJbzSaiRWZ+f9CgwRHDUpUMPsmsjPtW6TiZns6XvnCkrK/dMJvq/zlQtTX9xGG66mPw6oGMgsOEqaSiUnWdIxzvTfWIqICt39LB8Lus3G5xdCrv9ECYPOtMMnHObmDtHgV3OS1PlY0cEZt4cZRvTqL/K+oaCTwLhomW3zA8EpFGnTDs5gsfxBIP7Z/erp/DIkm2PKnelpNSgvEuw1coEcgC3QxT4hsT6BN5JVb2vaXTMCndJuOmKvLT4p
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(54906003)(70586007)(40460700001)(26005)(186003)(70206006)(36756003)(16526019)(5660300002)(356005)(2906002)(508600001)(426003)(8936002)(36860700001)(966005)(83380400001)(86362001)(81166007)(2616005)(316002)(44832011)(1076003)(8676002)(47076005)(82310400004)(6916009)(336012)(4326008)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:04:47.2705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0807857c-a4d7-4765-5771-08d9bf5e81bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
Received-SPF: softfail client-ip=40.107.101.61;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

From: Christian Schoenebeck <qemu_oss@crudebyte.com>

v9fs_walk() utilizes the v9fs_co_run_in_worker({...}) macro to run the
supplied fs driver code block on a background worker thread.

When either the 'Twalk' client request was interrupted or if the client
requested fid for that 'Twalk' request caused a stat error then that
fs driver code block was left by 'break' keyword, with the intention to
return from worker thread back to main thread as well:

    v9fs_co_run_in_worker({
        if (v9fs_request_cancelled(pdu)) {
            err = -EINTR;
            break;
        }
        err = s->ops->lstat(&s->ctx, &dpath, &fidst);
        if (err < 0) {
            err = -errno;
            break;
        }
        ...
    });

However that 'break;' statement also skipped the v9fs_co_run_in_worker()
macro's final and mandatory

    /* re-enter back to qemu thread */
    qemu_coroutine_yield();

call and thus caused the rest of v9fs_walk() to be continued being
executed on the worker thread instead of main thread, eventually
leading to a crash in the transport virtio transport driver.

To fix this issue and to prevent the same error from happening again by
other users of v9fs_co_run_in_worker() in future, auto wrap the supplied
code block into its own

    do { } while (0);

loop inside the 'v9fs_co_run_in_worker' macro definition.

Full discussion and backtrace:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg05209.html
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00174.html

Fixes: 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1mLTBg-0002Bh-2D@lizzy.crudebyte.com>
(cherry picked from commit f83df00900816476cca41bb536e4d532b297d76e)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/9pfs/coth.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index c51289903d..f83c7dda7b 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -51,7 +51,9 @@
          */                                                             \
         qemu_coroutine_yield();                                         \
         qemu_bh_delete(co_bh);                                          \
-        code_block;                                                     \
+        do {                                                            \
+            code_block;                                                 \
+        } while (0);                                                    \
         /* re-enter back to qemu thread */                              \
         qemu_coroutine_yield();                                         \
     } while (0)
-- 
2.25.1


