Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B243385C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:24:46 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcq2n-0003rh-LC
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpuo-0001YR-DL; Tue, 19 Oct 2021 10:16:32 -0400
Received: from mail-bn8nam12on2054.outbound.protection.outlook.com
 ([40.107.237.54]:50166 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpul-0002Eb-1X; Tue, 19 Oct 2021 10:16:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzFrUTO+YYtIio7m6v7PUhf8N3/8O0lE5WzYJu8wrwM6VLyBNc9a4VDKgOTN7Uf0PPVNTTt0E7yL4rgn9S6IfywbkNgH1YgXlPu4goOpTlC0/KV4ZhdyALuEpor4yGtNOdTM3e98SdCbTphdlskSEnBoDQ1AkxAeTXcanF0sCQpMeugdHHzAYv7nLhIxrzqTVmtp/ZRyWlatP0E6zm3faRr/ddtmfdbHrxAe/xraRdI7XDATOlK0GBI0cIRGtppsFy00/dzScXzvHQ/0+EHQliD/RwxqSlZqmfuGjtnL3KZaD3uKxyDT/x1KDEwgIA4/pBc2OTZQGx7d4iBuks3Y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpH/4Ndqi9AnAoh2mOIgHoQHj6dgTt4PW1etohWQL4Y=;
 b=n2FcGG8wdxlSp76p6p4PQJDy+aT4J+4an2/u8yNAHgVPOcPOIRhC1ULe7kZpeCZF7ImWHldy9KG3PbbxC4t8Z7oPutJB0NyeSbQZy6STvej8GU27TKEfAYry5drAi/IHRGSH/T22koejUvUy2QkdxPDEttTkQhpkIW6AC796xKxMiSlX9RvEM5OhoIMUJilx3Mk5F1ic00Jx+iPCTmb0VCEB4a66PJRw25h3OGIbmz28ch9/Zs1A0FCUMJsfEJTDTSpyfn1Gge3zf1FgQyyjistM6932Pv4oZbqEqt9yS3Ep4nubB3KxKHlBrZU7/Vl1xAhhQE7EC1cLB27O5pOyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpH/4Ndqi9AnAoh2mOIgHoQHj6dgTt4PW1etohWQL4Y=;
 b=ETq1vcgXgcrF4LChG1kXGEZnvuR7e4TH6YPZD8qnW+6oL6NdYTrv5tnAf14MWR4ACpUEFG5+h+KSsnbLP26KLrpM5Qpm/WSwPOS8Fpw76yM4F8rQ0uZX/QHJNys3BUN5owOd9aNnKnwhyJglXXd4ZOjzbV/TopVXdBa4SKBe05U=
Received: from BN8PR03CA0033.namprd03.prod.outlook.com (2603:10b6:408:94::46)
 by MWHPR1201MB0222.namprd12.prod.outlook.com (2603:10b6:301:54::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:16:22 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::fd) by BN8PR03CA0033.outlook.office365.com
 (2603:10b6:408:94::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:16:21 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:16:21 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 14/64] vl: plug -object back into -readconfig
Date: Tue, 19 Oct 2021 09:08:54 -0500
Message-ID: <20211019140944.152419-15-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 85531e13-9c3b-4edf-e5a5-08d9930b06e5
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0222:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02228C790F6065CA135BDB8595BD9@MWHPR1201MB0222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xf0bFFps8S9fUaNK3Pla5pA10CXmT/W0JfPEUWGKwfcmrIpoT/fOu3svjysHm19ATXXWcv5CczwfDLPwhQSpxouna3hPJqiEVEzSJ7vwrS2bdesk3M9VUeqMa9PSWNZxfa499om8hqWe/e3R3yJNTFD9AFuK8MET0JTatQ7/j8NUQBwxHKYAmxjv8zah703ilckOwp1N0euVFqeHo2v4MFir2y3ymIf4rxdVwRj8ehQOGJ/MuhgoT2PzAdKEWn0ECjKS+yGA/Q3kA4Yfo4aYVz2G3Pud4QXkYZ5SovqZ3fZWArKGpCEMQXfLNdzHPies2cBWfDpTXJpgUls6ran+8sNQJOUgV1i7pCTgcPEeGb9Dc0w+5zVBLrZMijiNB8SuuEX/z8ijZ0SM4FTj+kiNQmgIfSKd0lZuo4VIZJzwAewuxWKEbyR5tueVFaEPwe0frziIMncZh7Y5z2s4Cy9hzB61WKjormVLwZn14mULPpTTEshtCRuPO9XzjuXKEqZhSI7/ZofZoCHqzHUFe+w7p9dcJh4lqxo9hd2T7U7+YBmRwN7k7FyoN6Brf4rgS91DeB1hzWd+99i2nf1V3qi8EqLzL8Zr1BAfTJozRvBhmUK2FPnWNJuLmbxovfhPQe96gYufH1m/zj+B9C1WW0ZkLjt5dO9lU4H4KhHLYVsFhEJuoBgcq3fpHEvvFL8kL0p2xYuHrL9rluvzTAL570kSoDHxLjsV6UCcnTM4F6LKECo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2616005)(8676002)(6666004)(1076003)(36756003)(83380400001)(336012)(70586007)(356005)(81166007)(426003)(36860700001)(54906003)(2906002)(6916009)(508600001)(82310400003)(70206006)(4326008)(26005)(16526019)(44832011)(8936002)(47076005)(5660300002)(186003)(86362001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:16:21.8849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85531e13-9c3b-4edf-e5a5-08d9930b06e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0222
Received-SPF: softfail client-ip=40.107.237.54;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Commit bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c
and QAPIfy it", 2021-03-19) switched the creation of objects from
qemu_opts_foreach to a bespoke QTAILQ in preparation for supporting JSON
syntax in -object.

Unfortunately in doing so it lost support for [object] stanzas in
configuration files and also for "-set object.ID.KEY=VAL".  The latter
is hard to re-establish and probably best solved by deprecating -set.
This patch uses the infrastructure introduced by the previous two
patches in order to parse QOM objects correctly from configuration
files.

Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210524105752.3318299-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 49e987695a1873a769a823604f9065aa88e00c55)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 softmmu/vl.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 8f18f506d9..6be510b035 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1709,9 +1709,15 @@ static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
     }
 }
 
+static void object_option_add_visitor(Visitor *v)
+{
+    ObjectOption *opt = g_new0(ObjectOption, 1);
+    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
+}
+
 static void object_option_parse(const char *optarg)
 {
-    ObjectOption *opt;
     QemuOpts *opts;
     const char *type;
     Visitor *v;
@@ -1739,11 +1745,8 @@ static void object_option_parse(const char *optarg)
         v = opts_visitor_new(opts);
     }
 
-    opt = g_new0(ObjectOption, 1);
-    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    object_option_add_visitor(v);
     visit_free(v);
-
-    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
 }
 
 /*
@@ -2120,13 +2123,22 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
  */
 static bool is_qemuopts_group(const char *group)
 {
+    if (g_str_equal(group, "object")) {
+        return false;
+    }
     return true;
 }
 
 static void qemu_record_config_group(const char *group, QDict *dict,
                                      bool from_json, Error **errp)
 {
-    abort();
+    if (g_str_equal(group, "object")) {
+        Visitor *v = qobject_input_visitor_new_keyval(QOBJECT(dict));
+        object_option_add_visitor(v);
+        visit_free(v);
+    } else {
+        abort();
+    }
 }
 
 /*
-- 
2.25.1


