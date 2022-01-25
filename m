Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E749BE20
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:01:11 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTsE-0003Ph-GI
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToS-0000Lb-JD
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:17 -0500
Received: from mail-vi1eur05on2093.outbound.protection.outlook.com
 ([40.107.21.93]:28729 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToQ-0002I2-H8
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQAF+U8ZRozDom6q9kZ7iEgrU3zoExLSOWI7SdXJ5KKh/u4JV2bO261cPBFuYKUHmQwdGjus/7LLPqeK0DqvqWeNGRwc1iLgtAlZlWu0DyNsoB+nxDPIXcoLlPa4foYeK7PEV+wBjYuT3uHPDUxnx2MMrTGOXIzNKjoAPPnmjsbyDQwU3wSqaGIC4yalJAuDvxxPIFiqs3I8gd6tdR+4A/wkpMIYdC+Sa6COFxnoFg68t5+vbPZGPHigkrjDlcF8cl1XcRy2xYkJec320pNbK/dQ171rMuSDs+KXD1Km8sWXdjJiarFlV+eyLb+Kn4uVRG6oOU+BdeZH115n4okQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG1EuzgNQGqMZ7TQb2cw5tZE13GEhErF95XCAykA+0Y=;
 b=JDa0mR4L9Gv7pnOr2hhR8/x3AmqQuoorXNTqJO2hNYMRHBwg0aoOIW2cdF7kz/+sv6Cy0D6CGSAtfyXDaKmKG3L1esYKbCtgfY0hv5HNHSZQUmImkzsK8FWISfB47C4ogVs1bHfaA+Vu4U0nVFv8yR1jEsmtms8+W0mo0lMneQbitOfPYGaRzzsCt0Wx/GL+Hp+dgQLNMpDp9zGvT2jAFUdks2P4nt2++ZWdz2Klx9K8FblAUVUv7wmLBmS4my6LvshY5b6lXrIlDQpm7QUS7Tj5vovdT5WmSLlPJtVO2Q03Hd0CovpcOeKw7jwMy/eiKAEzJRgoFO/X5UQPUjDLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG1EuzgNQGqMZ7TQb2cw5tZE13GEhErF95XCAykA+0Y=;
 b=FG41PX3P/cKvR6fQxJumo6EkKX78P+0L48PtqC92yoRGlZIXgHd5kOzLPeEhjryd3DOGyw2Oqr5n0K1o4T7Klv67r4sOtyDvyQepLyTKQF0QXjyTdu/5+ot+1AANp2Qx2Dc8jn2LhgpgjbjUk8JgDjXuQwShCdFJPkLbLh3fkFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB2946.eurprd08.prod.outlook.com (2603:10a6:208:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 21:57:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 6/7] meson: document,
 why we don't generate trace events for tests/ and qga/
Date: Tue, 25 Jan 2022 22:56:54 +0100
Message-Id: <20220125215655.3111881-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9831dd2a-50da-433b-2b08-08d9e04da3ca
X-MS-TrafficTypeDiagnostic: AM0PR08MB2946:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB294694F1F0002AF80808FD52C15F9@AM0PR08MB2946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJpboHkZxMl0eJGAEeDyY8L4c8SjgmkTEi7mCqR6GuAiq7FhiRN+9fD8lUHebuFTEE+ZRXDFZN0FNnD0GvIy8I7iV32YZ7rs9qboB5J9Yymz3bhoNj98sWO+6vDWDWdjdboSyUJk4fhhytjeT7mjF/ka4a2SSw/+uWzwJlnZBbviQwNF0tJ19L9UgwOQZOfBrbKt1YB2kHergy26q8K2ob+7VT3UJZiKf5M/cBR5AdxE+mku2WwhVAW32+w2YJT8A65GyjtRFSl8ilOT9t0GLQt+Jk3wp+Ill2aKlZhfKmb4DfvY9k3U+cZlZakFpzdPk0jLKjlBKDKZl0rRD63QnfL1LM88irh7EuqI9tANVswsv9OALiVugQEb59mQy25WeYbCcCk1lmzhLE3XmbsomHqS4RFg6LONn7I/AG8b1UwSPpjhjLn1K+JGGtfhZqty2pVyokGDPHH7hqWAhLObL+h2ctFB/9JnM7pbtLvoDpv5neJq9OOgovBNN2WzQZzMEc+g7m9mPgrLmnfOg0Qty7Vdqpd5u9TN28JT5dLNkUnmbhAO99zm0Xt2P0wV5ZYlYF4ZsrkVhJCQPqnpm5BVtzSYbFLVQPHoaFq9YfB3aORBOjV+nEawF+mhN4nxDdMTnkjLH2pBQ8qWDaUtGvhwJ65SMASAqID9VubXF3xRLLNZD8VAjhFKo8dSHYtEzWovXv3ljvGHPv/q4tNNVbgI5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(508600001)(6916009)(66556008)(6506007)(66476007)(8936002)(186003)(36756003)(2616005)(52116002)(4326008)(6512007)(1076003)(38350700002)(5660300002)(6486002)(8676002)(38100700002)(316002)(86362001)(6666004)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZyPh8PUgxwnLZLalh4TTLMaC993erLRCbDuiDZV2aWg1+d43fGpoeDPu+/P?=
 =?us-ascii?Q?BD5HtfKqXih5RC7YfrYP8T03sS6Synw7oee1nKNAfTkr7VA+p1HWL3w5Qs0E?=
 =?us-ascii?Q?H7WD007NxoxANnVWS1fA/4Ofoi7+kWY5UlEvj+cAmhzhOSWEI0yJ0LDmn+Mc?=
 =?us-ascii?Q?uzP0TXMOLeVBBNkYzlUybQJBZXvTfyTS5l8VTIbGUjNWFRW/loclJzpiRI42?=
 =?us-ascii?Q?sZljWz79xS2J/nDK+++Y6uvGaqIXafsOTeEE+kIKF1FS7uo7kukj952SlKs8?=
 =?us-ascii?Q?LVuczFDGHLMpuG1n9s29SEnkx7G2zxMO0Fb0QHPM/jkMVwTHX37mz3DBkR/T?=
 =?us-ascii?Q?eJu2oVR8P9NJfsan/4U6jK00YiI2FaNBz7sN8+lavN0WURUwwry4zXgUxVIb?=
 =?us-ascii?Q?GOU3KOCo7rLvYUrYBrRd/8Qu63hOhTXZR72Snjfn5sIP02JOKNlyR334aPrT?=
 =?us-ascii?Q?y+sE15qYwaXcgSvwtibwMTYWTArPa11w+gN1/Apsoh4eURW0v1czap+rUOLR?=
 =?us-ascii?Q?+ez9ixKv6ZZvif2iJCLaSyW48RjnahO0wOR31kiAkPh3dw2+o9jfWUYSlq/V?=
 =?us-ascii?Q?eQgZiKRBAPxtkDjvdHJRnbWahq5MJ8ssPNPn8Vo9ZuTXqc8mVXsaQQEprCeu?=
 =?us-ascii?Q?U8Zx1Byme4zZLQaKkPDUDpXCRhIZksSMCTm3Bj0PDZacI7yw2MGpEkYVX8yP?=
 =?us-ascii?Q?qfrI7SW6nlRK4Q+OnoF0AFKnZxubNk2AfHziN7nL/4wFX+NozjPjMz1UrmXN?=
 =?us-ascii?Q?goqPFs5lv5RMS9mKAT8GvFKiiqJu5MUdQtfikC5PaEEhQww1gAwHO8XXsaKF?=
 =?us-ascii?Q?AUjpGwqAC6hqfcS3WrEdk4/4E9KmTJIiYBMmuOR4d9/NkBBAUhxHvh09uHAh?=
 =?us-ascii?Q?wtEHyP7gnK0DK/36Qy3PkQkJUSXNhnR/GRMBqsaOJVFzFzFfHLW5ISbWS7gH?=
 =?us-ascii?Q?54hPqqXQGskqc5Xe1gapzDX+KKcgMKA8XQ+qJBj7WlKpGATNpmrata+5i/al?=
 =?us-ascii?Q?EK3yb5drUxt2j36LsRmWdUc90SFuoVA0Om1quOdLa7DE+wcJ1Y4kHStixwfO?=
 =?us-ascii?Q?U7e41O2RZtsH8uGIbfvihk1f+41Y4vfzfFZO5t3maQdNvO/SwcmX3OPcmdka?=
 =?us-ascii?Q?aV7KKBfSsKmB16lV7ncPgF9W2d2B6SEAs4RCaiDDyA77JCzVi3LlqEa8cksl?=
 =?us-ascii?Q?Qv5q06tk8fRKX0mbD5Ne9rPgtWyAFDNTw1hHBZCx7wTypnX48BIB8o0lwrS5?=
 =?us-ascii?Q?V3o643vcP2hKWj/LctibnY756tFSemBZKtvArY/D7JnWybwM5GknrT4SeKN0?=
 =?us-ascii?Q?SV7kDqP7B0WdN3CmYFhaI7lrIVE+0oyZee6gkWBELA89tmqCiisazz6h6HRE?=
 =?us-ascii?Q?gM9ssHohQp/XiSTVnLvFEjtuIOno39+myLE7RzBvnQJCudx2vKFmvCkvqwcf?=
 =?us-ascii?Q?ff6vWP6WPe0ev15iaVooL8l8zxK30PmOC57bw3ub4sZ0e/KZ2N/76CHziON1?=
 =?us-ascii?Q?u2XWDCL1Pu4e0D0cD2fDmZW7hS6pHK7tQBU+yN79K+4JA49yEviqNBWAoimi?=
 =?us-ascii?Q?/inHitTgraKfsfQ+kTfjdeZYtZz6dupcVUqZp/M8YznVTttCuSR+dcNrD3RO?=
 =?us-ascii?Q?A/VqXmSbeTnZKR673F31K8MR94gsDu4wNXQdB4/S858CTyyzsqoTCrS2HBiG?=
 =?us-ascii?Q?CZHv8w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9831dd2a-50da-433b-2b08-08d9e04da3ca
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:11.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb/G0gHSY3lmRwxWhLfLCP2gmmqmuWicVsgEt8MrAdacU9mAnOskN6UqSMlDS4FVCfWSqbWp1Thz+ZpT/d5LTP3exg02QYEydhDs8cVpta4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2946
Received-SPF: pass client-ip=40.107.21.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Making trace generation work for tests/ and qga/ would involve some
Meson hackery to ensure we generate the trace-events files before
trace-tool uses them. Since we don't actually support tracing there
anyway, we bypass that problem.

Let's add corresponding comments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qga/meson.build   | 8 ++++++++
 tests/meson.build | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc085..79fcf91751 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,6 +15,14 @@ qga_qapi_outputs = [
   'qga-qapi-visit.h',
 ]
 
+# We don't generate trace-events, just because it's not simple. For do it,
+# we also should add .trace-events file into qga_qapi_outputs, and than
+# add corresponding element of qga_qapi_files into qapi_trace_events
+# global list, which is processed than in trace/meson.build.
+# This means, that we'll have to move subdir('qga') above subdir('trace')
+# in root meson.build. But that in turn will break the dependency of
+# qga on qemuutil (which depends on trace_ss).
+# So, resolving these dependencies and drop --no-trace-events is a TODO.
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
diff --git a/tests/meson.build b/tests/meson.build
index 3f3882748a..21857d8b01 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -31,6 +31,14 @@ test_qapi_outputs = [
   'test-qapi-visit.h',
 ]
 
+# We don't generate trace-events, just because it's not simple. For do it,
+# we also should add .trace-events file into test_qapi_outputs, and than
+# add corresponding element of test_qapi_files into qapi_trace_events
+# global list, which is processed than in trace/meson.build.
+# This means, that we'll have to move subdir('tests') above subdir('trace')
+# in root meson.build. But that in turn will break the dependency of
+# tests on qemuutil (which depends on trace_ss).
+# So, resolving these dependencies and drop --no-trace-events is a TODO.
 test_qapi_files = custom_target('Test QAPI files',
                                 output: test_qapi_outputs,
                                 input: files('qapi-schema/qapi-schema-test.json',
-- 
2.31.1


