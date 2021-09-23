Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D1416641
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 21:58:29 +0200 (CEST)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUrU-00064t-Qi
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 15:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoX-0003tG-8f
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:27 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:59503 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoV-0002vM-JZ
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHlwvOnkFsXuTQlSh79CFqadC1VwK/wcfOJt6M+l+giptMkKsKzDbcD0p7XVOav5CfhJUI3CrBC7U2pCgn45ynYhjDaQI18cpFVc+x5SP8XmLys6pa3gLCCom5nuFXyVzHgFX+j/5UHnVp1DZkBuNzc+3BDbQnN0cFxSQA/7nW5s5jygPwyfOVD/a68O+1+yqhTrvQbCpCQUKjsmdvwOpxRZZY9aTF88sd2lq/ja6yaU10luwVSokFHXzPrda2HjGC2c7/w0ZqvE5c/rscCne0OUgnzD85GaQaQkPGZiuSJnRiywbm54pTZ1DUyxpp/baWx7Zaakx4znL4S5HnIOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KIjDM+6BaYrqq/MK8+l4meIycBWd/NGx7tzi8zOGQA0=;
 b=PlPVq+TvA1TnuRlofBH+vxk0wq4OpZAk1Cf5kkTwfG69DY7mV33/MbQeQXL93hcKI5d49HoFGPbcD1LD+VvRJGzAlC6YelzO2rE/IKvAzf6kZNzcqxdxI2UNtrF1PcRhMet6evyc2vp93OWmTnO3pwfuc10d+oLulIChap+azU+tnxR36MLVp8QIyrIUBl4EUe35jHueoCjI/4drVDEJqTySnBI5R0/ubQ8w+nTxsyB8wBOBH/0azI38YUzYmQZGzkSUQWfuQ8P4A4zJvqYpjZ7OnaqqTz1bFcXE3Wwb+GQOAFWkRAy+9Hq5DIih830b4Z29Gb0gHhwwxMVnpwXR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIjDM+6BaYrqq/MK8+l4meIycBWd/NGx7tzi8zOGQA0=;
 b=Dv+HysEfyjXEC26Y100ODH7kGVHhsiWuFNrHtzdpI+VqwTtI1J40sPNj6MYooG4iQdA9zmiyzY1D5Pm5rX0blzI2++byp1NvbqApIjQLlq87K6hWUd8ZzfsiRDn6oVYjL29Hwi2cm3RLfj7eggDGDcJxDkWxGE7AkdNCJB/qerc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 19:55:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 19:55:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, pbonzini@redhat.com, michael.roth@amd.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 3/5] monitor: add qmp tracing API for qmp_commands
Date: Thu, 23 Sep 2021 22:54:49 +0300
Message-Id: <20210923195451.714796-4-vsementsov@virtuozzo.com>
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
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 19:55:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ea0407f-5fdf-48a1-01c6-08d97ecc0c4d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32244BD8F1AA0280428E4605C1A39@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BbZnbrmYBZnqmTVkyCT5coKIkqL7+ZlCUbZeuJsFpuq5Sgw9r/hLGOhbsjqqG0tkHH12x3oZjMkMTGCHhVUmdU8DtMmd1FOdSTabR0a1+hLdlBiqWHkMQLUHfaNvS8zpPzJe9pSoaKEVjVT9Ug2IvfpQuhXvZn3i3XZkm2fZNIRgs4p7PHGM42F5AfzJY0z4l1EGAOLZ3mSNrimAwwEYyo3i4DLrkAX+4xlc09nkiMo/sQREA+4s18qQj5uG9FcRUHXj+qn4Hexj1Kb66ucV4Z+wV5LC1Qw4rpn5eKLFJmlcHfVwE7aHIYPwPU4FCmSq56J+/ZGkVGdoqwXR6smPVXoCspSdWaz4k6/mMtukYH2YfEfDOdzmglZQLRE64ePvkFCMg/o0y8aOLu3jozdFsnIcsn7yB6GmlRrKFIFTLK6Vjy+DLWUveJX0o6W0/UuOjb48m54M4MhL6XqfTqUVvoxjNvYIgq3i3SHlZaH628gNrQfuYzhAsKwNtXf2ZeNT0ZTv0i3SA/W5cPg39XeFt37puDcRlsLIgsVDXcVigCWxkFZtZzi2/goWowdHhNQgdabTph5jwxNXcoxpypTyzN0oSDUoyP1v0eB5NYf33RZAEm7ynPFBVQUK+CLoohFHHgqDNauu9UvjqHR/oL2De65IFsQTt38P6U4buWXlm3vooEan7ERhnbte4qgacTjjbdNGzLw0YO+KNbS5J/kEhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(6486002)(5660300002)(38350700002)(38100700002)(86362001)(52116002)(36756003)(6666004)(66476007)(186003)(66946007)(66556008)(316002)(8676002)(8936002)(107886003)(956004)(2616005)(26005)(1076003)(6512007)(2906002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QNVhYlOtgsLTZAJ9kuGf65EIV7xMMKxyyGhLwKQartyruxRhQESgVh6rSGTt?=
 =?us-ascii?Q?mfCQw/VjNIP+9GncTUvbRKJ8BwlRwx4phXxzx+u/Qacs8eOJI05ytcJewTxZ?=
 =?us-ascii?Q?4fxFop90YVX6SahTr0xWUGW0XEiNcfEqHxRBiLk2geu0p0qj9ANj7MV7a3tu?=
 =?us-ascii?Q?Op9YNtmJAFyGpUv1tNVVwziUzwx6l4tj03fNTlqE01psOS3OrW4ryu6XKN/D?=
 =?us-ascii?Q?BNtaQOzbC4joIX+ENfTLUXnQ/yEDEikpZ9omNLeoJfParfHfj2unBGH4lJYI?=
 =?us-ascii?Q?Oud7jtjZgglyBOGPt9UWe2CIaidkfIWgdt0B+bQyGMoL8N4zeFevo3NpHnkp?=
 =?us-ascii?Q?Glz9NocAEeVhQBYKX8++xEF6g8qujcxc+hy0uXx0Idq/TzB3k3CBi1bAzRtt?=
 =?us-ascii?Q?NyvJS78nYvOP07gdcKmuBqzQz40blOVU6iGDhotDQ/9BFsTZpEluo0ehaebm?=
 =?us-ascii?Q?XrePsE8JKJxLgVfHqPxYthgLEG65agCDYPdLNN10FOHXnG1iF5ZGTyG4s+Sv?=
 =?us-ascii?Q?3wX/vGBaAfLAy6l4yHvhNt5vsEVrBx6I1dJRKW3f6owznB51ikw4YvHb7R0Q?=
 =?us-ascii?Q?3ivK1nQmSEQvXtxWh4JYvnB6jjiMu9yBIVyq+ogqsEJ3/ZyvUHrwUbHrI+HY?=
 =?us-ascii?Q?L2ag0AZpASu7zttqOsl65qtz2PwnLG035pLRmgw2NZeH9tPxfvrMYk5YUjzd?=
 =?us-ascii?Q?ZZHQ3mzobaQWXKVbM+Z538NuqTQkReGQBYZuSQZ0sz5OsEY6fEapgBXRYqk4?=
 =?us-ascii?Q?zlyAxQbjPhZs03uPY3YgT0V38T4c4797Hh6F5U54MZqTXqU/sj5tRse6bjNA?=
 =?us-ascii?Q?x1gMTvIzVd6hrbGTEnMbqHutn5apa2OvIS47FO6LU0SKmnAyfb5CTjiT2s65?=
 =?us-ascii?Q?/q/RM5Mt/F6S+/OCNQeBW/ioMQsc9SXjoNu4/h0CYe/LeVtKJ6rRftPC+tZm?=
 =?us-ascii?Q?l9iUDh5jHdtxYfcq3ds5VZVajkGtF9CslO9vCoxQWATxBOPV3kMvET83rX+C?=
 =?us-ascii?Q?Bk19IRTpL6Hb6iyDogS8o+EAospQt3mW0AkLCJPhs9GDNyO/EzZk6cabk5Od?=
 =?us-ascii?Q?pJT6JVTOIxoTpYVOAZZPTJJSZgVp4S+LzW5N0rkaHZDOnAJbkqAtY9OO5fq8?=
 =?us-ascii?Q?CsIVZwOPLhfLkMOg/jvvZpjeRdzEK97FBz/O0RQQ3yoCfQ2IlzkZLVpjciK9?=
 =?us-ascii?Q?vDrPjzNWo2ZqAgd6L8rJwg9ESlP6d6NUDUj+zZPBqAsVQ9Grnu7vH6US+69w?=
 =?us-ascii?Q?T4KqeRlJAf/1eUtZPU2DRGm4+M0zfYAXpngo5ga4i6+UJE+Y6Q6pp+zknIky?=
 =?us-ascii?Q?XZrmz0Gdckd4Yfe5Sn7vOHem?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea0407f-5fdf-48a1-01c6-08d97ecc0c4d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 19:55:09.5880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsSI2OXP+2sYzd6H91s58PzdbJFVG+vIHA1YAGZcuwRRs9Mqi5bWaXIDeXgMfheCMnAy4NQBEXyj9tUk7zCih3EPxcGIWIHSnOzXb8Wbuyc=
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

Add wrappers to manipulate with .tracing in qmp_commands list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/monitor/monitor.h |  3 +++
 monitor/qmp.c             | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1a8a369b50..9587998217 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -54,4 +54,7 @@ int64_t monitor_fdset_dup_fd_find(int dup_fd);
 void monitor_register_hmp(const char *name, bool info,
                           void (*cmd)(Monitor *mon, const QDict *qdict));
 
+bool monitor_qmp_is_tracing_enabled(const char *pattern);
+void monitor_qmp_set_tracing(const char *pattern, bool enable);
+
 #endif /* MONITOR_H */
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527b6f..def2c7d1da 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -536,3 +536,13 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
         monitor_list_append(&mon->common);
     }
 }
+
+void monitor_qmp_set_tracing(const char *pattern, bool enable)
+{
+    qmp_commands_set_tracing(&qmp_commands, pattern, enable);
+}
+
+bool monitor_qmp_is_tracing_enabled(const char *pattern)
+{
+    return qmp_commands_is_tracing_enabled(&qmp_commands, pattern);
+}
-- 
2.29.2


