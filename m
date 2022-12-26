Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7551A656024
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 06:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9g7j-0003uz-Ca; Mon, 26 Dec 2022 00:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7h-0003ua-Ha
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:05 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7f-0001A8-CJ
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:05 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BQ3Y3TV016008; Sun, 25 Dec 2022 21:34:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=Lvz2KwJfcS034ygl/SCVf8cOZQp7laAp1DBeMg85Rdw=;
 b=pyeqllEDQCMiSTP4qbNFmKQvI/FkNnN1PNKnE1SscuOG2S8eYXAjEba5LaR9VcfLgadG
 ACrw+hwFCekKmZhHtEPdd/BGKExBhFNQUWmxhxv8ajvafUvWTP6N/oZ8at25fIVNbGSg
 RPqglDlw6QlbLoYI+rrzuwnyk0Cmm4hvRqnjOO4Jq88HDG7UsOideSl9K/jvxE0MlJUf
 ekvo+N+bjd7iDyi3V6Y7APrZqQWq4Ck4Fv6oXVf7OCUXK2DIxPPSVpV4+bU6no465/jw
 CtCUbDj9RC2sTIyMwkUovwy6tb5++GofvECIs6Lr8W3G4y/xamw6kC67blAUwFC1dzKt mQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mnxn0bjq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Dec 2022 21:34:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE9uJgC4NNc8OwObyPIRTemT5HnfBVdmIhJlZgS9d/Lm9oSpQ4o0k6IlMm32uW/30BhYwfVhbX9RgsNv3qgnRiAn4CcGLwbkJgClkif712edkwco/R6vWLbYAstINi7jz3sbA7CwzzfqLtCDGWX2NEjXeFmqyp0tH5GaOseXYYgl8ksetPGRQbR9CQnNZXio3jn+WX3YO2GpzFv2VosYcEi6pFHat1rb50yw9u74hD+bgk+OhHfZPmoWoUgAlDgXgosUUZ+4zWxZtTfbVqEfmtJjiSzq5jfjNYQVW9IK7mO6QfIDcSVYR1sLwfBpd9GZDm4S8wzhROgKf1+8vkzXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvz2KwJfcS034ygl/SCVf8cOZQp7laAp1DBeMg85Rdw=;
 b=jhSAWpsAkokl0VsKZkxkDLliMs/+fk8e3virsTMUZq5pC3OlSpPbzq+vsaakHbvJ6yxhTW3mGiwqFJiZfVrjNP/cjn3BNBpaaYmUjCYKumgP/jgsDklulRG06957dwZ3/YuD6nEtV3UBMrwxhKiF349pxJwPO0jUDeKehX+uKIy4zfk+nBkp/4XQjfsCd8XdsKp7GdK4UGBwhdSd8iDc9wBGDqKyz4Jh+MT5ekljqWAdBt+c8rVvQutJNVL45qw2gjh4hiV0VDD4PEPAY7EUKiDgg7FKmGOdK9V9u+dZ9MSrA+Wvy8p2CkH3O5yXoNUybBXiQnRqYW3XaTof6clV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvz2KwJfcS034ygl/SCVf8cOZQp7laAp1DBeMg85Rdw=;
 b=S1ZmR4E35Ap4SUEwTcGTKpUmI8frKNnn/Qa8gSpQgfUhTTI/fPs9TubAQQG+eOSSipzoUUMF0o5zJU5TNX1JQtIIJmvrk6H5Jii6TdYNAWZMhFb94h+BU44HayQZhgcd8EeU9Eg+RC/IraoHKqbMLDH6k7JBPnTEIYnZQ1jK4yymeuzS2cc0LOt8vdeuCroSl4s8aMGhoTx+cMxI4RzmqLTiMjM+6oOja1e7HeT6R4N6iQsIyi09FvhQZg22Q80404qCpepvamfkFhVZX85qTZ9UwH3H+JbRB7MSIFS8aYtMMKgUTc2d8VD5GcRvf3oy7rjM7a/AcnNi+WHqO2MTCg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7655.namprd02.prod.outlook.com (2603:10b6:510:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:34:00 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:34:00 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Author Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PATCH 3/5] migration: Avoid multiple parsing of uri in migration
 code flow
Date: Mon, 26 Dec 2022 05:33:27 +0000
Message-Id: <20221226053329.157905-4-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221226053329.157905-1-het.gala@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: b4acdadd-60e4-48ed-eb08-08dae702ca6a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czPUboKc23RJHH+jJn9eTXrBVGc6wrQui0C14yl6WfJW2tMCKE0qsb+JBax6C3slvxpPyCm+4nHWzqpIYURPxBIfO5057VmmWkCDr0oYJFV7XHUbJiqXJ3zHLNrSkJPWu9yWQJLUjj9WDcQprn/fzLr1WAfFZw4n+drjQiChGzzYi6yz1XCu9Vw6hlXerpwCVKH0vE1zjD/Y6GjGmOl/Mxck4RLTuCiWqyio/eJ62AEhrb3pp3Ypn9Hbo+SX7IajsYv+KBf1iWJhvMF2AWhHWpYhB+jjb3k+cjHP75TNvAbnrya3HHePA11bGZXKrIuOHSEoXvJErh6I+Q3ysxe5SdXIFwZua962hrricMLDfF2rT7vDDOTYm19Dpix1E6qO81oW6F4x4dUqvjVS1cVCiUPSdC7hltTvnn0+OSpQhUQYUJm9MajF7l8Ap789YMvf12zxl7DBHgnjhk56rTpSSNTR4Fe/BmnXZ4TvdZhX8TMONalitTWXs4Az+JXbwlaFvgP9Xa0R5bCJ6E1m95/fJ8kXdpTISPW9X0rlQEp2f2JAzXav62W/UZGYL+fEM3T/eiTNvIntFt65SuL93gt92sR9/RL9vTLUUW61vmh/bTwcWnHV1DiGFBN+3wJamgPMV/qJdyxiBAp+o5lCWcVzew3gAA3QE/XY4fN8OiEF7AkshKYkSegJBWyTW8O1p9Tb9XhBTk+E5g0v3r6HzeIdBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(86362001)(26005)(6486002)(478600001)(52116002)(6512007)(186003)(107886003)(6666004)(6506007)(8676002)(66556008)(66476007)(5660300002)(66946007)(41300700001)(8936002)(2906002)(6916009)(316002)(44832011)(54906003)(4326008)(38100700002)(38350700002)(1076003)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMdjpXAvdh5o9TCIPB+UGlsacxgNNxd30TenzfeQ/UvW4aPgB+Rhjrlsehf1?=
 =?us-ascii?Q?u/kP7ajDqXXXJiwl4C1hU5cd+ga1j09HR4DOdeVd752i41WzaWsnOjDmHQkE?=
 =?us-ascii?Q?uStc/UHJZ4+dqevvk8WbrtiF/eScLus6rvH6pN8FT9jdxog3n6uH7oHE2nhU?=
 =?us-ascii?Q?NhBT5+XAhCpF78JQCOf8x36QMTwPE47odpcYzArzQ3lfvdCTdXWmmntphAKX?=
 =?us-ascii?Q?re3p+MNEGf0NiQvGuWcZs/X90R0pB/gbqUqNjHj+BTtJufYD9PpC1fGpK1qr?=
 =?us-ascii?Q?7oSChqRdGv8Zx5Fn2IT4WFrfnV+y+XIwb+bXVYUQHgvB7rTRe8UFb0+QGsvX?=
 =?us-ascii?Q?6He9A10t6Tt9h83bIaTIG7AmfGbODz2M92I2YLQHR1kiCV58ZwBWhOc2qJhh?=
 =?us-ascii?Q?FHeIhONfnFN9E1pbGu60V8ypxttk0XFBELthCT8Xmy4nGhR6psWK4AZ799sZ?=
 =?us-ascii?Q?lnkVRcN5k0+yh/uHs54vcIS9Wn8KT9euoRSx/nnFnOXu/1RSz6WuHIvWgj29?=
 =?us-ascii?Q?h8yguY1ldcWjy/Trp9yNpvFl8QvfpsTSqyF81hKSER97Um1/lkRCvGBwWaPS?=
 =?us-ascii?Q?tznaH1tXEEyW4Quy/xZtbeJY1Nm3yOmEVMVPzB/TFJqEswAMpX/o6uF3pFys?=
 =?us-ascii?Q?js45LjyrAJOuYJgrlv72KGUG/UGTgfAm4i2NmtBoHhRS8wPweaCmBOl+WeLy?=
 =?us-ascii?Q?Ly6w2vpcV+P8pYGAkDqL2Fo8KZAJCGVq1bvK/0XwzHfZ28SFOVPkGDS+K8td?=
 =?us-ascii?Q?XyxK4HFEpKMocgxR2LJ1i2WYSyOr6ZOXnCrdrUKkWOQ7MoYM9YZQd3qpdhke?=
 =?us-ascii?Q?iG0RSJAWt/+cQHqSavz7gQnMweXVVyt2F4Umm7M9QJ5ZKa8r/5SGneghI6Yl?=
 =?us-ascii?Q?sLYG7B1XFobvOXrj91wk2MJyrm3BmOC2m76ow9XViRcIDcVL1wE/nQFujaIc?=
 =?us-ascii?Q?mj3bmP6aGtHE+q01SudpWYLaFdwvI2NTpKTFukPc7omYoK0USpkqJyGe7EG2?=
 =?us-ascii?Q?A/AUxihSRXZ0p/EKyUyF76fXbCzXXqekQEUdhAhkxOT3eQC9VscyYtQIyrYe?=
 =?us-ascii?Q?myBY5lEY0WA3l/qk6B9MWi+/ztstdtDjFbnPen8rYIrIpLg0XJqpLzKoF6sT?=
 =?us-ascii?Q?SyUua17jDNXFmESO478Tg+APLpEBocLyH1DmzHDBKgYth8NUEAlF6a2rGRlz?=
 =?us-ascii?Q?K6eprckzt14dpn+rVlajRjW7fqmrMqAizaM+FE4ApO3jyu9etLVABfoV2I9t?=
 =?us-ascii?Q?SMU08PEHehOuhECpYmVUL7SuYc5DSeM82VsBukKoUAVqXmnWSB33eJfCoAKv?=
 =?us-ascii?Q?1dSmSCO0LrxSdnoTxGNyQaic7gjkQwRA6TBJq6SpI7TDN5+vznBQ8vr5qMNn?=
 =?us-ascii?Q?EhXzG7EZRK8sEYV/vyXWl2xT5lQDyISh/rTk0Hm3aRmLA1aQJD5eWXsFqvDv?=
 =?us-ascii?Q?zpPhxzNrIVRKAbrHVppNFJ1hFX1TI9DWjOFElky1d8u/6DXTNn6gXrh0zQp5?=
 =?us-ascii?Q?JYcp2SKdNoNH3/M/JzNgrC8bKfTTxuzS7+zVGd5a1V5ZZJOtmyoge8Qmnw/j?=
 =?us-ascii?Q?c5qzjlln6oQrBAlyupdC9T4xwTNU52mmOiXr3K5wAvcN7VbNn7Orjrm/Kw5i?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4acdadd-60e4-48ed-eb08-08dae702ca6a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:33:59.9864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4JWIARV8DoQh2d4/Tf6cbr3eu7rxtVIxE9J+qR9zhLR3VKbyqQpBZ/PpfTD1mEQPx1z3gGAe1+FvenhWee/TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7655
X-Proofpoint-GUID: oF2OazjQ90rSjezWzrzc1egJJWBFa7ke
X-Proofpoint-ORIG-GUID: oF2OazjQ90rSjezWzrzc1egJJWBFa7ke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_02,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Author Het Gala <het.gala@nutanix.com>

Existing uri is encoded at multiple levels to extract the relevant
migration information.

The modified QAPI design maps migration parameters into MigrateChannel
struct before, thus avoiding double-level uri encoding.

socket_outgoing_migration() has been depricated as It's only purpose was
uri parsing.
Renamed socket_outgoing_migration_internal() as socket_outgoing_migration().
qemu_uri_parsing() has been introduced to parse uri string (backward
compatibility) and populate the MigrateChannel struct parameters. Note that
the function will no longer be needed once the 'uri' parameter is depricated.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 78 +++++++++++++++++++++++++++++++++++--------
 migration/socket.c    | 15 +--------
 migration/socket.h    |  3 +-
 3 files changed, 67 insertions(+), 29 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1b6e62612a..36de9f6a6b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -61,6 +61,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "qemu/sockets.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -486,6 +487,39 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+static void qemu_uri_parsing(const char *uri,
+                             MigrateChannel **channel,
+                             Error **errp)
+{
+    Error *local_err = NULL;
+    const char *p = NULL;
+    MigrateChannel *val = g_new0(MigrateChannel, 1);
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
+
+    if (strstart(uri, "exec:", &p)) {
+        addrs->transport = MIGRATE_TRANSPORT_EXEC;
+        addrs->u.exec.exec_str = g_strdup(p + strlen("exec:"));
+    } else if (strstart(uri, "rdma:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_RDMA;
+        addrs->u.rdma.rdma_str = g_strdup(p + strlen("rdma:"));
+    } else if (strstart(uri, "tcp:", NULL) ||
+                strstart(uri, "unix:", NULL) ||
+                strstart(uri, "vsock:", NULL) ||
+                strstart(uri, "fd:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
+        saddr = socket_parse(uri, &local_err);
+        addrs->u.socket.socket_type = saddr;
+    }
+    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
+    val->addr = addrs;
+    *channel = val;
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
@@ -2397,7 +2431,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
@@ -2411,20 +2446,35 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
         }
     }
 
+    /*
+     * motive here is just to have checks and convert uri into
+     * socketaddress struct
+     */
+    if (uri && channel) {
+        error_setg(errp, "uri and channels options should be"
+                          "mutually exclusive");
+    } else if (uri) {
+        qemu_uri_parsing(uri, &channel, &local_err);
+    }
+
     migrate_protocol_allow_multi_channels(false);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
-#ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
-#endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_outgoing_migration(s, p, &local_err);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_outgoing_migration(s, p, &local_err);
+    addrs = channel->addr;
+    saddr = channel->addr->u.socket.socket_type;
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            migrate_protocol_allow_multi_channels(true);
+            socket_start_outgoing_migration(s, saddr, &local_err);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
+        }
+    #ifdef CONFIG_RDMA
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_outgoing_migration(s, addrs->u.rdma.rdma_str, &local_err);
+    #endif
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_outgoing_migration(s, addrs->u.exec.exec_str, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
diff --git a/migration/socket.c b/migration/socket.c
index e6fdf3c5e1..ecf98b7e6b 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -107,8 +107,7 @@ out:
     object_unref(OBJECT(sioc));
 }
 
-static void
-socket_start_outgoing_migration_internal(MigrationState *s,
+void socket_start_outgoing_migration(MigrationState *s,
                                          SocketAddress *saddr,
                                          Error **errp)
 {
@@ -134,18 +133,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
                                      NULL);
 }
 
-void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
-                                     Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
-    if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &err);
-    }
-    error_propagate(errp, err);
-}
-
 static void socket_accept_incoming_migration(QIONetListener *listener,
                                              QIOChannelSocket *cioc,
                                              gpointer opaque)
diff --git a/migration/socket.h b/migration/socket.h
index dc54df4e6c..95c9c166ec 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,6 +19,7 @@
 
 #include "io/channel.h"
 #include "io/task.h"
+#include "io/channel-socket.h"
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
@@ -26,6 +27,6 @@ int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
+void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
                                      Error **errp);
 #endif
-- 
2.22.3


