Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1D4CC20D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:59:17 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnrI-0003ie-LQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnY1-0002Fy-PN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:39:21 -0500
Received: from [2a01:111:f400:7d00::731] (port=1505
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnXz-0001Is-Jx
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:39:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzA98/lcX36xbfFi0Xsf1368TEVW5pkaKNbJzMfWdKIGQn14TIaMG7V2mwX1S1/JCPDhcqU51AMLtfu7nVkPiWBzb4Q+w/T29uafXFlPai/YOtq68t5/wNABee/U1Ms0US4ZhnovQ6KSKUQxu8je3cICJ4hUtJAUO+gtwho78uR4ZSrn+wX3YzlI88AiO72oi9sWPJMBi0TE7Z1exUdvdCUVnSErhBwr8fz9ULHKznXA4r1Qk0bd8lAoOuvvz+speyQuV3698y7Q2I+ChnQQwe/pAkTRyqQBy+pz4sthBJo7f31T9Ok7hl8OSpe7FYDbmWBBKzP0r22PudaBpnW9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvMZnnXoq7ABum4xoQIYpBWVD1T9n29JKJ9rBolgcds=;
 b=M8t2wQqOAs5Kh3ZclcQ6HrpS4czZKjimXbzMsYZpFOFav70EHhnD/ZXn4lgbQHxqzpNFXvtXAlhKs9YVnKBnkJZ5ZM5AnCwYIjLiIU5qaGwbLutcJEiMtMnk90STiePZMbey/LtYKtKAmFS+5A/p0BdZBZl24uQWDqCZ5oKEOSCw710Nx87koPFoaTM5hS/jbkTYgCSAqXfJBrRjzlNYe9eu4sjEX8oAsr3r9NypbrvNWvW5vDUzvQHRlJuOyyIWp63/9hLuaVMIC1xGOTqwoHk/VDgr18ZbU569JQ6q7o7zHFY8Srok1J11eNr2DsUMct8iemcH7dHcYiEroIvSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvMZnnXoq7ABum4xoQIYpBWVD1T9n29JKJ9rBolgcds=;
 b=kPQCXi+m/jkH1jBEzmJ8fQin8dz+UY+TD9m91oHke2RxSOjnhnRUBLn9B0tQ5AM5q69OWQr9LSsX2u6pyXPHnuCsjyJAS7irYuvtuRbzBML8+pAsmjxi4BL/+vMgk11J4m4PDKsjloXNPKKGPQzfnUt/CIzpsa/LVkRapCI72bA=
Received: from AS8P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::14)
 by VI1PR09MB4176.eurprd09.prod.outlook.com (2603:10a6:800:129::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:39:15 +0000
Received: from AM5EUR02FT047.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::f5) by AS8P189CA0022.outlook.office365.com
 (2603:10a6:20b:31f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 15:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 AM5EUR02FT047.mail.protection.outlook.com (10.152.9.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:39:14 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 4F347211B5;
 Thu,  3 Mar 2022 17:38:59 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/5] target/nios2: Check supervisor on eret
Date: Thu,  3 Mar 2022 17:39:02 +0200
Message-Id: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 558315c1-771d-46fb-c6f4-08d9fd2bf8ca
X-MS-TrafficTypeDiagnostic: VI1PR09MB4176:EE_
X-Microsoft-Antispam-PRVS: <VI1PR09MB41768FD95172AA13F4DE09CBEB049@VI1PR09MB4176.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oej0Oci84hhYh1mZDrhU2wz/s802S1k/3HBWFExQ6rBDhlFWwuXfUnNIJp2VmjqiJ0urhGjnTKa2tAW4nglEHPfui3/xssMoTCB+xZ5mhiyh9qmY4wOuGthQMkejSuLR0TEOvNx86zbj7mwC6QNPxlFvYqQPZNLfVrfne9vvYRxaJMzgP1WxGtiHRRODrLlL7O4mdUHzJ3BsMkNhd2DXpBnn04XNWohVv7Ikx4juoc/sO67GdbB2qJwj3liKMooMShWlhT66KA01iLzieJdrX7indvv4buld10uIgWzJzqi4UCeC9Vq/nON556xt6dDdNdq5Un2yQ9Yqfx80hIP08/vgnrdq/cRqbRZKeYqwqZDDViJNysyo97gAKnN49FoHWb5U20wRnvJ0TOmNZcRUMfWwn4J1jAlXGL4DQ5XfyajkqMXqZ3zakq9/15ZC9lhddsAZkzrj0LcAkkxKiOVUaGbljHhACIoYtql8ECoNQsYWXhd9n429n6abyhTYEYlHAvbwuMoeTBn7bGwnXOhdQYnBMSoJ3OKhh9MijhXuNrvjKQMhzp5mCa43q95pNu3vYXMKqQDEKXgrpL+4u/nKyxLvV0ulsjRUXkRm5PyLbfSwjt2cO18JRSVcAGbDQLf2LSJzV3pmfeMtv3XgbEe8nQdh4Mdd+mFEFM6RwK4PFKFQSrmq/clt9q5OL6r/DXT4WsxdJFytP7jzVf6Ng9dm5dRJRWz/+BStPUqtH9u2oHQ=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(346002)(39840400004)(396003)(136003)(46966006)(36840700001)(81166007)(44832011)(356005)(5660300002)(6666004)(2906002)(47076005)(82310400004)(4744005)(107886003)(70206006)(70586007)(4326008)(8676002)(6266002)(336012)(110136005)(40480700001)(1076003)(2616005)(86362001)(508600001)(186003)(8936002)(26005)(36860700001)(316002)(36756003)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:39:14.7377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558315c1-771d-46fb-c6f4-08d9fd2bf8ca
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT047.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB4176
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::731;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eret instruction is only allowed in supervisor mode.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 target/nios2/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index ce3aacf59d..007c17e6e9 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -384,6 +384,8 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
+    gen_check_supervisor(dc);
+
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
-- 
2.25.1


