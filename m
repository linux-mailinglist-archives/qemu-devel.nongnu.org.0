Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69341664A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:01:33 +0200 (CEST)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUuS-0001fK-LF
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoU-0003sE-7D
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:23 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:59503 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoR-0002vM-EA
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng1Bnv/hhEsVg9tHOOP66279VVKT/iqna9eIbCY6UfZA03BGTNaKruhP0o/53Xyp9ZeoNGhLYHgQYahvZByIcFdOECFV9SsGEFlcNYy3V6c2mtLINpnpU54Lu64sc7AMJCfNMc9ao6tVKz8eMrEitEK/mxSPLiW/ms2SLrQ3/levG5/ltHKyAnJnD9YR2A4GH7n6sawM8G8scVm4O0wvV9L+adLX9k0Kz6OorXyFYLYbtDk1AuZI31eJ39smeBAqQk8LZS0UvovepQAOtRo2IKx2rP+pz/xfNl/ObU+IQWxnsbB6k0nU2+nWYFPwP92GXwY8tcTtr7+tjT983LCOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G422sMkG1S3zyHGEaBPi+SV34Vm2oY6ZcrDKHENH6rg=;
 b=X5x5B+Sg7ldSPCXHVp7u3cW5SzN9GfZApyvJ4AT6b+B9dJ+g9tyvMYchloRGYcKoTbhBm+YHJcObXml5xo8B5sdYSQsHyr0um055f9wfJIxFbZEEvbj9+BnUe0eeq0wH+T/pzVG3+xv6DKW8DyHLfNuhH1P/H7ZaN8tVQIalLq4uLoUJSSjnIL2CCC+KewnJSJzOQ0ScxEa6P2RF0+NnZdvOf6EGxtVzDXRNkRnZn0o9hFDRo/MqQi5XCyATjrct50TNsoooEZEzJlpg2VuKmoJX36gvDfPjwcMysHwp84iKQXlmCoKNQwDNTBmglR+itM5pN4dNf7ffoo3uGkr6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G422sMkG1S3zyHGEaBPi+SV34Vm2oY6ZcrDKHENH6rg=;
 b=l23ea55dgC0nuivtx9TMsnntnvFZNo1mEDkbtU6Emdr/WVjDSbKpqh0MK+ZD9MFHAkiCZZOHr2INyFLeCcanIrvNQOzwu3bzilbfOmNJrriS76ZlCMsIz1GZeuzB3DvcPQzEnCojBBhgPMHfVcyDgv9vY2EarNzZsu9vLUy+Fv8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 19:55:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 19:55:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, pbonzini@redhat.com, michael.roth@amd.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 2/5] qapi/qmp: QmpCommand: add .tracing field and API
Date: Thu, 23 Sep 2021 22:54:48 +0300
Message-Id: <20210923195451.714796-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210923195451.714796-1-vsementsov@virtuozzo.com>
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 19:55:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65da6d78-746f-4c3b-a44a-08d97ecc0bad
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32249FEC725A12AF25B69EE7C1A39@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7J5YHNxLzL7swy7iqYaz2I0AyH0tNf3DMOihaLjsydMV+KyWsTLQAhB+9RdsQPhU47jGIMM252shn50QzL2BF9pf5F9TbrLtFEUkZGRL0iat2eRJk25k+8g/n9RxTAsY1gButqNpxidmqvjsz7sEB8i2afgKqS2CEWea6prC9SKclR34vF/JTB4NAIWVP9EqDKANHVLLtIbjlbztsAcgOplFHk3vdryPDXN+ptmzfgmasa4Zv7td/MMTDm8ZRhjjOSph1EUt/O9JT0z9c4kIdhinFDtwoUXPjnvpKzghhFq/TYsCyx76GCqWU1nDn/mo4p+u7h2NlnShVQRGJuZjz3kvQwunieyKMRY+QRRItkrt5VwPl2lGAuGY673a+QCFXcecKyDxTsmrW8aOEKme4g4u33ZiaWgMD5WQg7RgSDP90E/N4GzXQgzBysQBtOMF1R+tpwHVR9OuSNxXsVe2aLcApQpvjjLNQEWHIgLEgCFS59cILIX0jEKerf0LUlWVtKYolpFIwqPVtc7R5EqdhbgynCML3xT2mS7wkIDNth3dEYjffSqrtNXY3dzwX1Z7W6FEjSu7ZiGSxeaUR0Op8iyxumgqcd6QNHWh1tvN7r5/OQLA/K14TkzcB9N5qaRAowgdFqxTzkZR3ZrFkPF+VztbfypJLb3JzbdUl5pkDb3y1448h0pI0Uywb1rwYWUJzP/p832oR1dZVoK2JNGLbT18yg817l/KyLQ6Ehwmvjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(6486002)(5660300002)(38350700002)(38100700002)(86362001)(52116002)(36756003)(6666004)(66476007)(186003)(66946007)(66556008)(316002)(8676002)(8936002)(107886003)(956004)(2616005)(26005)(1076003)(6512007)(2906002)(4326008)(6916009)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smkWMEhs8EsvBcjmTVrVNXrDf5ahqNZHubHSGczr+O90fnE8MUYES+8PQC7E?=
 =?us-ascii?Q?Zgl4pp0PYWUv+TDHR4T9MAcXjomja5KlRpAyWZ9v3YO4AEoGMoWeJNK9uiTx?=
 =?us-ascii?Q?0Ez3QmBe4ZNpsqt/TwhV5nitv+XD/tiQyBZHkSbad2gvrnkh+K21/7VMIVKV?=
 =?us-ascii?Q?NZQwRhEnElXhdeaj2Zqi8b/EV66XHkkcayzhvm4G6ctpXDRQDSM2ByuQ/Lz7?=
 =?us-ascii?Q?gCVIJrG0P4SkUdGAz6GVJHdMn9Yon08hcMhCU3D4PqLp0YSxykENf0EkKato?=
 =?us-ascii?Q?27R3MHT8ZGL/8FSnJGykQVt3FJxys4/nvWQC/QkOLAphvKXFhyhcS1z0jetv?=
 =?us-ascii?Q?njnHfdN7bfIIYR3QxI/dNCwGlZzPb54CFqpkXw5Qq+wGHpTJR17+aaSDxXz0?=
 =?us-ascii?Q?C778k4mFAYZZJ1lDBCV2HvjZIdYbeDOq1c02ea8gprHgHoisMecWzw7fJnrD?=
 =?us-ascii?Q?A12oYoFqg1votCbVZuJ7ENTXwwSVPtJoF9yO0ocvW/AVuY9zBou4wZbSi+q+?=
 =?us-ascii?Q?rxwIK/Owib5r3sgJfvobbUYWGrEbo8MVPvL7PS208bYVkkzwLwPGqfl97DnA?=
 =?us-ascii?Q?AeRkGU/9rx+2ZtmVF3/rI85p1/4mZ5JsYQw9Rc/9SqKko/ZQ2kMVmJmZDmM6?=
 =?us-ascii?Q?dIslLPktjEV3RJDBoOEWNSvw0SAw4aALIaAhPgg0q5m9sVCMA7BuXqe9Heug?=
 =?us-ascii?Q?eTIM5guTgFBiwWfgsZTqKQ5VNXHzK0DYaEClzYpY5wfJTobWHRJf44BO6Lah?=
 =?us-ascii?Q?gbOjNEaFnLpq+J5hs1NmujfsNFabIc3Nt3yvWcpT6D2IiZh05iQTnpx3tpM4?=
 =?us-ascii?Q?EfY0Mh39WeynR3uUgY5vr420CYRUbyIlmtWYDCEW/kJy2uokE8DuBl+9FSlM?=
 =?us-ascii?Q?3wOxuzfoP/+gPGzhwy08E2f/ZHHC3kVK5lPS3Ld2ot79hTv4PxpUVm6/Y1oZ?=
 =?us-ascii?Q?cqc+GVA0GstbZq4nDTwn5cYkKbLeTMZ15ExAfVtqyXfeqQ27+lygG4pyw7vc?=
 =?us-ascii?Q?xPV9kWi8hmBYaGBVCWn6IrV1Aan8I9SbtnH7rP9NELMo99hihbGLKFfNekOj?=
 =?us-ascii?Q?MV8MAgd9l5NjJRBJD7On1jFCDYJlTnZMPjDP5sr2u0MGukoL+qVGT3glbUL/?=
 =?us-ascii?Q?ahOlgFWx5wK0GD49d/1a/DwWfH8PoYmhcp1GRgG1J1wtozKyRVmUXqxW/Qf9?=
 =?us-ascii?Q?ovYjXeVBK5iVIfgyyJxQGF9+vv36j/6+jMPIlHAVt26MvKqf9uWfbLET9DwS?=
 =?us-ascii?Q?nSeW9kX9JnyAJU+wJnwcqArpb6HTZoVqil1BAyVWvAyO1SVPNR9vySzSkKIz?=
 =?us-ascii?Q?YE550YvOb/ONVWpwCFOwzD/s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65da6d78-746f-4c3b-a44a-08d97ecc0bad
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 19:55:08.5556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1uujMP1FYrLsFrK0R1d4RLexFnAN8CuHF/KPD+4pt58hB1wxB1WyqrElGCW6NQKFe5yS/ua8K6ZygjA4Q9kxnF/RJ1O19rVd5zk/0Su6Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We are going to add a possibility to trace some qmp commands by user
selection. For now add a new field to QmpCommand structure and two
functions to manipulate with it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qapi/qmp/dispatch.h | 14 ++++++++++++++
 qapi/qmp-registry.c         | 27 +++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 075203dc67..5d0df2f984 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -38,6 +38,7 @@ typedef struct QmpCommand
     QTAILQ_ENTRY(QmpCommand) node;
     bool enabled;
     const char *disable_reason;
+    bool tracing;
 } QmpCommand;
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
@@ -64,4 +65,17 @@ typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
 void qmp_for_each_command(const QmpCommandList *cmds, qmp_cmd_callback_fn fn,
                           void *opaque);
 
+/*
+ * Enable or disable tracing for commands matching the pattern.
+ * Pattern matching is handled by g_pattern_match_simple().
+ */
+void qmp_commands_set_tracing(QmpCommandList *cmds, const char *pattern,
+                              bool enable);
+
+/*
+ * Return true if tracing is enabled for any command matching the pattern.
+ * If pattern is NULL, return true if tracing is enabled for any command.
+ */
+bool qmp_commands_is_tracing_enabled(QmpCommandList *cmds, const char *pattern);
+
 #endif
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index f78c064aae..56e761857b 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -67,6 +67,33 @@ void qmp_enable_command(QmpCommandList *cmds, const char *name)
     qmp_toggle_command(cmds, name, true, NULL);
 }
 
+void qmp_commands_set_tracing(QmpCommandList *cmds, const char *pattern,
+                              bool enable)
+{
+    QmpCommand *cmd;
+
+    QTAILQ_FOREACH(cmd, cmds, node) {
+        if (g_pattern_match_simple(pattern, cmd->name)) {
+            cmd->tracing = true;
+        }
+    }
+}
+
+bool qmp_commands_is_tracing_enabled(QmpCommandList *cmds, const char *pattern)
+{
+    QmpCommand *cmd;
+
+    QTAILQ_FOREACH(cmd, cmds, node) {
+        if (cmd->tracing &&
+            (!pattern || g_pattern_match_simple(pattern, cmd->name)))
+        {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 bool qmp_command_is_enabled(const QmpCommand *cmd)
 {
     return cmd->enabled;
-- 
2.29.2


