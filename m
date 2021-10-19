Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71995433B4F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:53:38 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrQn-0006Nu-IM
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqFJ-0008Fg-0s; Tue, 19 Oct 2021 10:37:42 -0400
Received: from mail-bn8nam08on2058.outbound.protection.outlook.com
 ([40.107.100.58]:14368 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqFH-0000hc-7u; Tue, 19 Oct 2021 10:37:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bok5bCbAwG2jG8dRBbX2EjDl/P83jpcYyuwuHsYI4zrBpHIzRCg/t7Xrcw2podyThJ2SdVEwETyZbz7lLltk/nEMm+Dzbt6usiRhzhZiISaJylbatlV4ivNNquNPLkPsE6u/eCSP+Zxck7PcwJpRhMQxveHIRd7Jm8meHc7o44JX8doL0WoYJIH7iSgxLiFvuRjNQRj7GfHWjK30hvH4xVJd5aa8hlkDJhX4ENhlFy4vdEHitFXbNsBOUnqfkgyMJzabk3EXI8vLWxrBgsiokNysS/Mh6JD/gM0p+3q6XQHd/nV2qr/iUaxhv9421Sp5W1gAxuxYfKPwD7yhArAjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX13z+ipEsqqblZelRkWBKWNfiSFy0kyoSmkqtASusw=;
 b=e0fyrVsG6BT7TYL3teMZ4/ScRif2nVbcEyR7yysDzwsOVseNiPTKurnkKfw8z/XGnJ5tBetFqINOJig6YvPHlWanI+tQ649wJqXjEPjtolAJiycgSe4w83N4FB2w2aD3l5HtR3BdTYjJsAQGWOeQMxTlAmuo+oVu/mKPyEM4D51Ph0pqHjqbKvFCP9DDnAZZ0s5AIcwKCYxgCVaXurdYFScpo8WGG4L+Imy95y/bqsYQFntmfUNOhntJ/8YughrbENBZ8ny3vjRq6lFTTvE7IhOwkjIjY2kVJtZ8tvBGaJQUHRvvZcpiS5ZFmA2m5H62f6caj1kVVlUoumhwy5MRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX13z+ipEsqqblZelRkWBKWNfiSFy0kyoSmkqtASusw=;
 b=j87i8/9oNkZ7IWs1uwuKhd6rFyNL2Rx9uXsujRGNnXF8pk92x0Jz1wvO2xexXIfeBNIjSHOTEzZ+cCm7+ouavrQT7a12BLKNYfGFzBw9ATuSoSy9wFLzttrDK3FnD8TLS0anc7Uhbr1eGnDHHlgr26RUmUEuYpG5uahtlY6LbCw=
Received: from DM5PR21CA0043.namprd21.prod.outlook.com (2603:10b6:3:ed::29) by
 BN6PR1201MB0178.namprd12.prod.outlook.com (2603:10b6:405:55::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:37:35 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::68) by DM5PR21CA0043.outlook.office365.com
 (2603:10b6:3:ed::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.2 via Frontend
 Transport; Tue, 19 Oct 2021 14:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:37:35 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:37:34 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 08/64] vl: allow not specifying size in -m when using -M
 memory-backend
Date: Tue, 19 Oct 2021 09:08:48 -0500
Message-ID: <20211019140944.152419-9-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f2d0b98f-1628-4556-1a89-08d9930dfdf2
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0178:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0178F0B7208B7327FF636C8295BD9@BN6PR1201MB0178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UzuDjaLNxch4QN6B9hZl3kit5dyXhufjUdaWQ2S6RhuvxvfXYfng+5oKzoa/PSgKmRaKNUf0ivcUAvy4aMmtC4RmdF2Wzb0zm3NeHm60JdQgo98T6KeTzZCGZrnVZXfN8tAu9xseF3N90FR+5V/petal/e8t4FldYpUAzafL6OSacTX6mQag+uKXomgWWlnRzeTZgPRX26/odJBvF3UgfgU7JKOzio5EWqXkWn5gjG6YQdugLDkdqy15rexnhkpQvb9AkizqWg+dixTncuimUb1VDb4NGL2ztTX4xV5AR0ty1EaQ1gE32sEA0BMqq/zw+mlSt8vHdXc+iwJ5/nA8SSxfoE+xBhR+zVkk/dbkm2dA5UdYd+MFDmj14t4fSVYtDxndD25aNP830naM6FaRcxbbuiyHQhyBxd3zU1KHXQTEyQtVa8BaASHZLZWE5cSyrLg7SdEgBp6KHruuk4slqaO+JVkfNiccWDTzhmc22wKPsX2tRnQo3lLE5jJnhMmbXdt20X/lkni+CTaeajCVsXIbMthmchkaZT5u9QvsRrqr/buiYEOgHrlw7zbKcB0HX3OOViLwvMwloF2SV/lPaYliLzwkleS7OPzaqTF3hZ2uo1yTpG+/lQADvpZxOdu3aa4uF4ehIX2WS0OyZfCErI2Xge6I9UFi/ZzSwbm1yQf8BlvePiAkBhmT5YpkkYrN4VV+duVWf5wJQygm41kruOECP5sACXZOsf/vXtIXLbk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(4326008)(54906003)(5660300002)(36860700001)(316002)(16526019)(26005)(82310400003)(1076003)(47076005)(36756003)(356005)(81166007)(4001150100001)(2616005)(2906002)(336012)(426003)(86362001)(6916009)(8676002)(44832011)(508600001)(8936002)(186003)(70586007)(6666004)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:37:35.3246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d0b98f-1628-4556-1a89-08d9930dfdf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0178
Received-SPF: softfail client-ip=40.107.100.58;
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

From: Paolo Bonzini <pbonzini@redhat.com>

Starting in QEMU 6.0's commit f5c9fcb82d ("vl: separate
qemu_create_machine", 2020-12-10), a function have_custom_ram_size()
replaced the return value of set_memory_options().

The purpose of the return value was to record the presence of
"-m size", and if it was not there, change the default RAM
size to the size of the memory backend passed with "-M
memory-backend".

With that commit, however, have_custom_ram_size() is now queried only
after set_memory_options has stored the fixed-up RAM size in QemuOpts for
"future use".  This was actually the only future use of the fixed-up RAM
size, so remove that code and fix the bug.

Cc: qemu-stable@nongnu.org
Fixes: f5c9fcb82d ("vl: separate qemu_create_machine", 2020-12-10)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit d349f92f78d26db2805ca39a7745cc70affea021)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 softmmu/vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb526138..29d6415d5c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2025,8 +2025,6 @@ static void set_memory_options(MachineClass *mc)
         exit(EXIT_FAILURE);
     }
 
-    /* store value for the future use */
-    qemu_opt_set_number(opts, "size", ram_size, &error_abort);
     maxram_size = ram_size;
 
     if (qemu_opt_get(opts, "maxmem")) {
-- 
2.25.1


