Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C7433B1A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:49:38 +0200 (CEST)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrMv-0008AP-Ng
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqEf-0006m6-5T; Tue, 19 Oct 2021 10:37:01 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com
 ([40.107.236.78]:44512 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqEc-00005f-Q1; Tue, 19 Oct 2021 10:37:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSlR4Nzr1QitUUqBEN4OM6h9xMdOway57t0YsZ9naYfupYezvrFeVwJDqD5v1R+/xrD959vfbCJ7YcgahX5sbErYzp/9VL3gfiUV4+DU2fmgqLk5ofQO3c4hsiAyIHs71Kfz+snqc3QtmHG+M+ClNp3DQXCZwVytQECztX9zBaGlB7xDgACXpID1Y4xVP9UFsxjSxZENwhRsVZDovwzuAfPzu7g8JTnYCTzZRkaBy9Kn7JvZSQSvW8czKnFoBTgchZtCdIXqtHYC55Na9H+2Z06jLBvg0lO7kis802Aofg9wH+6kDgXUnhY+SPuzDdf6MgxVouHV+dXu19Av/wNqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dbmu41gzExlIBkRVbHuUTC3dUS0rIqJ126RuElBaMs=;
 b=j2EUjWCUumIlXLzAD2Yap3roBhmp4qHm85mLaFSheovx9ZbYC+hbwa68ugbpB3Sv/XB7xI74OcIQ0VNBAlOtoRuWv3l6iegr/ND0wY5v1HwGK2Gw237n7RVk5F2STM3jfv5hQ6DRYUBGXuOa2NzM7JX4ObdKsydjwgXAFlklu93K5/RvORPoCNfQtbpQhic0RyWvXLK7tvmSu85QnBT3KpP1bSYWOZBQHQvUxZdyaZdlCUTDRvqyP0w8RHEVSTR0W2lrRC0z/4NXLo4MyausgopWhrCKY/5VW3q1KwaZeSkYViKfWKXoLCzZh1VvThqDfJUiK3YdIycpqsRgpRsQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dbmu41gzExlIBkRVbHuUTC3dUS0rIqJ126RuElBaMs=;
 b=DOMHrJzTbuN7B2yN27DgmGbsdpgk4xwu+J/daNlBPGemMuGKBR6lJIsgS3kPN30CWovmIu/YhKX0uVHN6jMtZPaq1J0Bq4Z4kxb9sQw0HdZOMU6j5lXwGB3+4f1BuNz0nEaNxOmdx1g+T69kVJyU4lA0z0qLka9wqW0omlj12Rw=
Received: from DM6PR07CA0102.namprd07.prod.outlook.com (2603:10b6:5:337::35)
 by BL1PR12MB5379.namprd12.prod.outlook.com (2603:10b6:208:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:36:53 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::50) by DM6PR07CA0102.outlook.office365.com
 (2603:10b6:5:337::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:36:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:36:51 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/64] target/i386: Exit tb after wrmsr
Date: Tue, 19 Oct 2021 09:08:46 -0500
Message-ID: <20211019140944.152419-7-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4665dac9-0811-4f15-c8fa-08d9930de48d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5379:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5379A4691E1A776A3EAC84E795BD9@BL1PR12MB5379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:15;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piUR9Myq4egTV7lTQ0YoPwvXFvDFV6HjmDQCDcV62+pjqbZ2Y2JQdDEDjw70D6nND2qbq9lLX2ULXm3M9Eil8n4GY3cqkHwgVO1MA/Fcfaqqq8hWWBRWYWWopYZG+3m3WXkkkfAkan13GoNSM2ZA77JyAfPAfmtcl5gbMHLKElqLRFNOGMsaZZDunP204IwVFMTHYe8J1Gp1zKaxrFMhx4FRPHVoVOpCrRUbM/mECgOzw6/M5f1oixcKYWnFWckw0jRxqNqqd/IS4eypufmhG+au+ySuj0AJJhYuIrJdOrdmpph56dc24uLF9JzodAGUfZZUv1Y1ePD2qlU+n/eDEujx1xcogja58tAsh2dP/O6xcY8pVQ4eq5xCTpp58lDySl/awU3nSF99G8rnpLFxx9jUyIvMrP6XaoP7yaItwnPGxWgW0K37xwXe5nYEDXFlJibRRYCYvF8tYYyfqVRoGTFhLe0mUqijhSHimxbCD1W/bsAmv439q1cDFJDqb81NiC/Wp96DvQ6o0aJyAjW+pSC4qxsDmfB3AGQOEFYnLzbX4myPObJ+wHjYcR7K8F1AEaDf7tmbkjJGkYOpHbxv0fe5Z5A1XZ7Hz+QQ1TQ5lG8kG69UWSeCuFwBQom+O/kduFfhFxsP9q/HfQicEZEMHL3mvpn9w+Soi314YlZ2TQ01NZQJEvy3Sdja/Ql+epNVoYVnh5BIK9pxA00e/m/jPQar7oyiR0Kd3HLAk2Xe/pfqW3DaJSleaAF5C6erIpJY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36860700001)(5660300002)(186003)(16526019)(6666004)(83380400001)(4326008)(316002)(47076005)(8936002)(36756003)(81166007)(356005)(1076003)(508600001)(26005)(8676002)(70586007)(70206006)(2616005)(44832011)(54906003)(4744005)(336012)(6916009)(82310400003)(86362001)(426003)(2906002)(17423001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:36:52.7131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4665dac9-0811-4f15-c8fa-08d9930de48d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5379
Received-SPF: softfail client-ip=40.107.236.78;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

From: Richard Henderson <richard.henderson@linaro.org>

At minimum, wrmsr can change efer, which affects HF_LMA.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-46-richard.henderson@linaro.org>
(cherry picked from commit 244843b757220c432e0e9ae8d2210218c034730d)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 880bc45561..6b713b4fff 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7198,6 +7198,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
+                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_eob(s);
             }
         }
         break;
-- 
2.25.1


