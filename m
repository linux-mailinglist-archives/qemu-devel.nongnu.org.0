Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C82B1B8D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:06:43 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYmo-0002d6-MG
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYgJ-0006b5-MJ; Fri, 13 Nov 2020 08:00:01 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:5175 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYgG-0004NL-Sx; Fri, 13 Nov 2020 07:59:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnmyfR0/gfoj8dZc1+N2/eqgtYe5mwenHF+FLyg6snd38CyOPrYG0amKS9hI8BkHDbwz6mR0BgHZ35XfeOexlhg7KurR/SNDYmR+ejkKDyi/44Iu85AJDoqJRDtVf9C0oLsgZorwB5BYdLvB2krRKbVYcNPEyZx91vPfvcO76nOxEFRIuuaNiPF6OLqm0ZFNcRxIr9Vv5mo1F0PJWcfDaE89kRtdT571+b+8NwXpZFYfZfyyfOhh8o7yvXZMujU0FWOj8j4HxANJ0uH5K12lPwJ6YtZj2YQxVF34ReRUMdejOgtfFWBFcusqmJZnr9GYGemg71r899xNt0uHLeNX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v51cCkMPs4a8QvrTMHuAFIwHrB5tdwfkBQarhSyMSo=;
 b=CKgBnTirbqrWqhUNJmggFasVFPUkOYrb3hLDqAglUGizuYOF9lRRfQ5ijXZrPGX42IhAzz2OqMrMJdIW05lpteyRAGKU4RcWFUVUry1Um0mdYDhdUxmXD5XjlpFcpnEH9N6KO6zVud2oZNwnXfbfvtp/J83uOE5XUxzjaftBYbCy/ZjDkK/fUfYdZJPT8TeAskFsoGym2LQfSrJDics1ydOMMjypQfIqpXyhmymOBSPeFfQaee+QFlMlrNOxfi+J7QhXRXcdN8CXwb3VXq4wIRiaVlVbPN6XAj5ENm/zHzAzT4kHqW7qKt8H7kMrjphrqW8O61CGPSFXmG9eqWXI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v51cCkMPs4a8QvrTMHuAFIwHrB5tdwfkBQarhSyMSo=;
 b=ddpuxZcjrvxw80CjbrQJJRsOm/WZ+CaeXDuBAfQZDwu3wakTbeHTIDvktESaPZFnomotWzyYlpTRHKkzsCMUUxGnNazu8T3dnC92a4eNHM0BqrQRM5e8eGdaKsEfxO0dCzpYw714wVyMxPVbSVbQ2ZYBNoxGNxbr33UXKaRY6MU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 12:59:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 12:59:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 dautovri@hpcdlab.com
Subject: [PATCH 4/5] block/prl-xml: add bdrv_check
Date: Fri, 13 Nov 2020 15:58:47 +0300
Message-Id: <20201113125848.20498-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201113125848.20498-1-vsementsov@virtuozzo.com>
References: <20201113125848.20498-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM4PR0902CA0003.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.71) by
 AM4PR0902CA0003.eurprd09.prod.outlook.com (2603:10a6:200:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 12:59:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5abbcadd-63d0-4a5e-b281-08d887d3e766
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB58771AEFB6D55FEEDD533713C1E60@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H+vEOphr6ffTX/5Btjt8QqetIqs3cQAhl2+a+u44IlmpAJK5nYjH6ANIXqFDGccwnbCiHYU5EI3N2vmC4Y5zDcfYgHJyUkzmj32ZHWpHNusyX134WM5yf0H/zOTmZKdRlV8vnhLDKHC8FrfbN2gCYQEsZ4lqwZd4yHyxOZ2jevK2kRBKRH7SUgez/WJmlWc1S54rIV7HlJNLWwOSbfijj3o3g+/kfgpnbsHb7M+MYWi3cMqaT2FYHtpQrsJGq9q8RnxYn/MQN54QkTYpX+viqwWx7aoFfm6UQ08Wj7M9uZtgPx6KyWut2nWooyNFn5jeW618y882kGk28e3kT86syg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66476007)(6916009)(26005)(83380400001)(8676002)(478600001)(52116002)(6506007)(86362001)(956004)(2616005)(66556008)(8936002)(1076003)(5660300002)(316002)(66946007)(16526019)(2906002)(186003)(6666004)(4326008)(6486002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ME9sxnXVA0+qnYHSnth56NUztoqDdJ/MZHqSiE0p95vJPXj4Wh0u7Nxe2tbMCexFjfFB2xDFYp8NgrmcuviX/eSy+O51XcPHvxPx76dqjlYOWnhPCx7MmBV4vj0/BkEEne10mETqFD3eZfiz0ZqsaDIvGQjtmD369YxoH7i6CbvoLBpagy6DyM/h2gX3oDrHqFdTleGXBBrGazx8mwGfIlz2x4AHXCPnEbfWvPilwz8IK/CyGxGhNJyovOG/7OBmd8O6yrY1M2uUXjgvuxBf9SL2ADnbfyFOo4t4GbPk5tLRrHGMO5U/OyjHphaZb06/FE3uNLLZQwUs/ZA32Zno7EhJsp0VtgraISRgToQ7ix5dl1qqoe9PIjGF6SiUSTSlOgpycObLdbw6YibpswcnUP0FagJLrF9/OefuYAhhgtUNBl95It94wQ+A8SIZQU3jONhWhQs+XSZyfXbbOL0lkf6IXvKLok5SBAbCwiIuXZj9tLdOqMvYljgxjx+3SeWUdF6cq/CZjGBM/gRIKBfktdGbwevNUfYre1c3IB11H9QTOmEy6+y6N5ouxU8VfYCtxSLJO1pgsaKXf+JOgd+37B8fRbbDja6y7lCMOtijzoMUeqQAkkUmlijH2WT9Y3DbZsgxqLzNDmXVbYFMdspARA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abbcadd-63d0-4a5e-b281-08d887d3e766
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 12:59:06.4564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtxK/5Q2L9LdaH+XyiMt7fMTUNc0BXmt4azz2nqUh3lAZV/hP6sk2SCyvY+AvGKq1mZGIR8IS8Bny/uZjG6hDAqAnfLVIfghwUGgo+rHnAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 07:59:54
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Klim Kireev <klim.kireev@virtuozzo.com>

Add bdrv_check, which just checks child image and all backings.

Signed-off-by: Klim Kireev <klim.kireev@virtuozzo.com>
---
 block/prl-xml.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/block/prl-xml.c b/block/prl-xml.c
index 023651342c..736cd98469 100644
--- a/block/prl-xml.c
+++ b/block/prl-xml.c
@@ -520,6 +520,23 @@ static coroutine_fn int prl_co_flush_to_os(BlockDriverState *bs)
     return bdrv_co_flush(s->image->bs);
 }
 
+static coroutine_fn int prl_co_check_xml(BlockDriverState *bs, 
+                                        BdrvCheckResult *result,
+                                        BdrvCheckMode fix) {
+    BDRVPrlXmlState *s = bs->opaque;
+    BdrvChild *cur = s->image;
+    int ret = 0;
+
+    while (cur != NULL && ret >= 0) {
+        if (cur->bs->drv->bdrv_co_check != NULL) {
+            ret = bdrv_check(cur->bs, result, fix);
+        }
+        cur = cur->bs->backing;
+    }
+
+    return ret;
+}
+
 static BlockDriver bdrv_prl_xml = {
     .format_name                = "prl-xml",
     .instance_size              = sizeof(BDRVPrlXmlState),
@@ -529,6 +546,7 @@ static BlockDriver bdrv_prl_xml = {
     .bdrv_co_writev             = prl_co_writev,
     .bdrv_close                 = prl_close_xml,
     .bdrv_co_flush_to_os        = prl_co_flush_to_os,
+    .bdrv_co_check              = prl_co_check_xml,
     .create_opts                = &prl_xml_create_opts,
     .bdrv_child_perm            = bdrv_filter_default_perms,
     .is_filter                  = true
-- 
2.21.3


