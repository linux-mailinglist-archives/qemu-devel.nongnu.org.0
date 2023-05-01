Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0346F31C1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:03:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU75-0005Su-Cl; Mon, 01 May 2023 10:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6k-0004wn-P1
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:28 -0400
Received: from mail-dm6nam11on20606.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::606]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6i-0006ff-Tb
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkLx7hBw5i4178nxMMZNRarLZi4zbbBpP/aCp53vke9zKJh/v009IdUUpN8TFP6NZ0ieyZNpNL8VOrVDBhxqC/Pi3obvcdfiq+dTTRNWw/LUB6cwxd+P6dFlrp7Q3GEzv+ixj7n6BNZXyV4Wg4SGtvyjOrCp7vaTiN9D5nVUE8++bZ5D2frQOc8Dfeb6ErdFnpmPxpJLi6TkMrrrhlVnIejCpJP2X8NGAuIBNMjg3I5Z6YPtIgbeR1uH/YHTTsS36cS7RtXKF0u26uRubPraSHfv+G3D9V+wpRm+YJwA97cXAcXybPptFFQcEONIcHD4fNlKaZPKWCYPLx+GrNdCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+15kJovdY8T0+ENdJBkufdN6PfdXoc7VUs7mtrJnV3M=;
 b=PJuSydyl5aEwLRgilDeOyHKv23v7rahLR4IX9GyZW8iNnHiUjVshTG9U4TmhXQR+86FChA8w4Tk2M36fwf60CoN31ZXnjd9mdbqvTqX1hz5DCK44WqmxyK9KjtZnER0rrx3Z59a1v8OeXnMUEwHRbeYxqmQiiBoEoKYy4rQJiD7/NR++WemnCIjqv7+SpR+LXHV6fLnlf3S0qtiJfbyBPZ46kTQfVx7SM/XhJczX2gjuPwjluY+Jv/ZbF0Aq2syth+8YUOu51vvJla/KBxk8LiU83l405JngKYSuQ4yUMqtxVAKhCI9XChkeCOgTcD68w2S8eLFaVwOW0PQdy00QDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+15kJovdY8T0+ENdJBkufdN6PfdXoc7VUs7mtrJnV3M=;
 b=p0Ad64S3tXPuZMuOqsIysBEHUWfNTs2FQeMrfp49NsEmN8yUP70TaB/B0ngB6N57DXGXvbcUO1A85IGxZ8thknGj3uulZQcpCl62GghPKf0iSkwysfflpwoFlBbKmjwrtQcKr+0UrMOZ39QJzMs1acXExyIGawX7GWWIVFrd/qxzRgFrPxZgJEeuFetZTsrI6I+glvn/iqyyIHtzphkgZxdaisZRbwUwHupxnPF7xtxhFQLKLWIJ3rfV7lEWL0CnMLOsso5HAYtlkFoX2ni40kR2R0ytyN6Sh90PSEHAA4VHDcPBfPeWLylQGL2p5Mdtd/t1eIDkX3TrI76JVZ0VLA==
Received: from DM5PR07CA0089.namprd07.prod.outlook.com (2603:10b6:4:ae::18) by
 IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:02:19 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::af) by DM5PR07CA0089.outlook.office365.com
 (2603:10b6:4:ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Mon, 1 May 2023 14:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:02:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:02:11 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:02:11 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:02:06 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH 5/8] tests: Add migration precopy initial data capability test
Date: Mon, 1 May 2023 17:01:38 +0300
Message-ID: <20230501140141.11743-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9ccc00-aec8-4357-624f-08db4a4cad95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60VlgvfklhUHp3kzd4ee0kyzbBl/6oPAyR2E/nxwCj539+jfIOgVt5rLQN1qkrYKNpR4xXcfn9pcJBYdZeXrdms1JX6VolA6TuPKfBCDF9poiah3o1uCxhLtD6zdU69U/yvIjmujXuqLasOFEXLU6++t+TsD/MA8obEzso24m4WClfeeNXNosVrW19IWCnRB6BRKrZb/xikq/y5f16vvijS6wYi1as1wnXw7CjNfe0gxEVcUQFJiEcHJ+grYuXKSf6zo6BOsSeNnVuB6l6tZIDJwNzcflFTAAoLZ7exWDEdh/S6QPsqvxa84fT7GvcxSS9voSlkm8E2YOrvrAq0IuWOmOckoHNbE0hgn51yD3Ob7BIddtntbA9FAQOYg4UabYWTe+WxKSHRA5csQgLTLOc0/YcSyrs+xbloPbARN1/mqdwIl+3IH6Uj4hz4Xg1NZ+k/Jq0iQ3R+xL99SEkZOpWdMq0N4Z8QNCOKTqHMi4+nqeWxFwZTbSRFfFt1uGnbn5Hu9VlGUr766FQ1f7Npyd9si3U371EKU3QqJm5G5Z3vNnFZOkipZpzqaoB1W5BLR3pUJLeCnxpy+cOOyROQWGq5h+Hd5qwy/XbI4AMjh9Ug/iPp9u789iuCyrrDfytojb3RhGO1swGeWueguU2lkPIsSSgRrg0nQT9B4IEuIUZjU14WjVzXMW7MSSOzRVb843pS+AivNkMHXx3DSwgUIQA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39850400004)(451199021)(36840700001)(46966006)(40470700004)(70206006)(70586007)(2906002)(426003)(86362001)(2616005)(82310400005)(7416002)(6916009)(5660300002)(8676002)(8936002)(40460700003)(36756003)(41300700001)(316002)(40480700001)(4326008)(6666004)(54906003)(478600001)(7696005)(186003)(26005)(1076003)(82740400003)(356005)(7636003)(47076005)(336012)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:19.1713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9ccc00-aec8-4357-624f-08db4a4cad95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::606;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add migration precopy initial data capability test. The test runs
without migration users that support this capability, but is still
useful to make sure it didn't break anything.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 tests/qtest/migration-test.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 60dd53d3ec..71d30bd330 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1533,6 +1533,25 @@ static void test_precopy_tcp_plain(void)
     test_precopy_common(&args);
 }
 
+static void *test_migrate_initial_data_start(QTestState *from, QTestState *to)
+{
+
+    migrate_set_capability(from, "return-path", true);
+    migrate_set_capability(from, "precopy-initial-data", true);
+
+    return NULL;
+}
+
+static void test_precopy_tcp_initial_data(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_initial_data_start,
+    };
+
+    test_precopy_common(&args);
+}
+
 #ifdef CONFIG_GNUTLS
 static void test_precopy_tcp_tls_psk_match(void)
 {
@@ -2557,6 +2576,10 @@ int main(int argc, char **argv)
 #endif /* CONFIG_GNUTLS */
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
+
+    qtest_add_func("/migration/precopy/tcp/plain/precopy-initial-data",
+                   test_precopy_tcp_initial_data);
+
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/tcp/tls/psk/match",
                    test_precopy_tcp_tls_psk_match);
-- 
2.26.3


