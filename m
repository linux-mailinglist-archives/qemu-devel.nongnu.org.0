Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D379C33E797
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:24:14 +0100 (CET)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMMn7-0006Yu-8y
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMlh-0005K3-CE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:46 -0400
Received: from mail-eopbgr750053.outbound.protection.outlook.com
 ([40.107.75.53]:4470 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMle-00011A-0E
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f93MATt+KNWfdxyPFq6C7E8PX5oD1gk1dfdt3sS9VtsxwG0jrkAJPhkQgSpCSkRYJ7p5EusEHPGo8ixCXr/Mio1S4JbvAsEVtEGQMWe2fDRxYurB14aELekx8iiscc4V96wzqWSups1L22q0OM0hBgOQM3e9Ao9IeBTeJXLBc7MgKpf3JbuFtDCY0mRTmmbSC2+Fg2L7/H7oc97DPxfhFlty+v3HKb6yvWwQcKHVbTVwaBp48HwmUNVxkUHo/ovHBZ92qjs/Uku7PDYxh/FudeoNdCynQqb/LbuqinM17wY2a2tklYqm89Kpvzj89Cf53t7OF/Re2TQ4APP03BPmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92jsJvuv8ElMBGIt++Co99O6cmWilu72GoEOAarhtRM=;
 b=J6eL8WVhnfBwudr5aS1Cv64fhNuJpz3XPmi8eoW5s/D0+yI+MYQVhRtkISMnQN6kLMitERF3vnWBIoKXZaWw4YS5JTEegDv9Z8ewF4QQ0I/bDkbCqsz8kKXAjbq/g4M1wNOCK8c+b6r+FK1ICenexu++k60hT61gimko4O6leZAMSm/YM6bn47nRtFTXc1PJ88pEiiTF8N4ppdfj9tf4hqKQFG3xbEUUj84tO+CzRjPNy0wl6skOUA7MgI9lO/oF/AyOMwkysuKwOv+vkpIs8VMTWdLGGNKRl0oWkD0DQVHUn/7PIUmxMJFPnQYnho7R8nmwvMhca7uYj/JycK9wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92jsJvuv8ElMBGIt++Co99O6cmWilu72GoEOAarhtRM=;
 b=bS2MdvZz6TwKLchCmxfAdcyPSDjFaIIHYgmSlZJbvS5CNHFKlHVrn3IAB1TrXt7GKYepsvOixMLTXqxm4aWD1+2a2nC5+esRPvuEz0sK190cGIfJrsVmIVo5gmeUyu9ZQmoomlx9B4fb9ra2hQeNrRjUS6mFzZ5zw8LYJNYA6j0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:39 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:39 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 2/6] qga: Add spaces around operator
Date: Tue, 16 Mar 2021 22:22:13 -0500
Message-Id: <20210317032217.1460684-3-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
References: <20210317032217.1460684-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:408:112::35) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN9PR03CA0330.namprd03.prod.outlook.com (2603:10b6:408:112::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Wed, 17 Mar 2021 03:22:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fdab74c3-46ab-478a-3290-08d8e8f3eb22
X-MS-TrafficTypeDiagnostic: CH2PR12MB4954:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4954317AD2A8C2732A1CB3C3956A9@CH2PR12MB4954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPEM9e6uPuiHE9oi0jFBKHwObVwcx8LRqSZleqBu+GU6aEmkEuqjuMKOpdfq909G2glyMm+37bso0o+kP2i04uj5tC8rxS/fyLdk30x53kkYci5CgP5KVMPx2SGfhbDXaWFyZNELLrB6gM5YO6jHtnMsGGKBq2LXUUQlnYuohmOAvmPRDJx99rg349ldEvG/Zhn/gSx7MWjohr/XaiD/gSFqzzTsvqI7GyfLvIBc1JCzApKd7dxAVumM1l88qlO6ZcycbnUv6AF3UmS22e6Ll3X6FbD7f36aZ4HOEf7Tuynsdn8Mg4S9XY0c3xYRmr6RNepz2bMsXpregpJ325cIWzUhSS6AC5lrWg8VQb18+sL0WdkmKTBYGA0LA94bVf07AQNvaA5kNHpOFcRb2LgvucMfyB6Gh3ei+Hkn2dtXAFdWXkGa22NosJtBjl32uG+7E0v/CbImh7o6Q4CKCfSmKACl05ThDhAC7az/POZMZkKpkFrJTROoMZUZ8ewlp+xl/zIxed6bjGizrzGjE3W+nt28Pne5jEWikaKqQQgdAP6PgXcYsAdTBtg6oKc4brX5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(8676002)(8936002)(4326008)(478600001)(316002)(26005)(66946007)(54906003)(83380400001)(1076003)(2616005)(66476007)(956004)(66556008)(86362001)(6916009)(36756003)(44832011)(6666004)(6486002)(52116002)(16526019)(6496006)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDNUL0VqVHRaU1ZXVXZZdFEwYUloWnM5L1hnL3FDMDJOVWhXMitTNlBxamFM?=
 =?utf-8?B?YWdMSUxoc29DRzNCQXJsdDU1S3ZKNVNFd1NNS0V0UXBiRnU0d0EwRktMTlR6?=
 =?utf-8?B?WEI0bTUvcTBYa1FoYlNSOWppWEVacS9IWVZqYkV3WjNNVGNHUzRyc2l1N25v?=
 =?utf-8?B?a1ZKSHZrZlIvSUhQUE9TTmdvTGxibVRqZGlDQTRmQ2JYNFFtRGRaMzRkZ05u?=
 =?utf-8?B?NmJiOG5Ea01yNitrUFVCN0VnQURjSUErbnoranRRUFdzR3hXNGRpVVJyNi93?=
 =?utf-8?B?TzgvSzdnRjJIWHU2Q2ZscWFhUDNxdWhNWWNNMGpPUndJdlR4Z3Q0anNqVmtQ?=
 =?utf-8?B?ZnpWbklDRnlPTFUwcGlwOE9HWlF3cXdXQVVmVnNPUDNqZGd3M1NMUTF0MTRm?=
 =?utf-8?B?TWEzWGxDQmhHZTJwS1N1UXI4eWNJZUkwUEFaNFVuOXFFUVJvTkZwNmx1RUhl?=
 =?utf-8?B?VWhvSUJJUXBUMGYyT0RoaXNyMkREUWQ3N2Q3cExtcXk4c3FIcWtYeEVROERF?=
 =?utf-8?B?ZENPd245cmIzVHF2ckpsL1p3UWs2a0twM29VTVRsbWlpeVl0a3U1QzROL0pr?=
 =?utf-8?B?U3paZGUvTFlXeTFwOXl1VERxZHN0RG5qejdmQnVBZkFldG5YcnQ3YldONzVw?=
 =?utf-8?B?VUpMeUo0UC9CMndLMVBpU3pUZFovNDJ0NWI4dm1seU91aVplcWpkS1ZQV25E?=
 =?utf-8?B?S1R2Z2Q1enRTcnZyaUZNUEVlaTVuS09FQks5c3ppb09TUjZRNms3eWxPQUc0?=
 =?utf-8?B?dmF2dDhFdVZUZkxNd2M0WUF1NTRqQU02UjQ2SUFaTlZQTWllQm96akRPbnEy?=
 =?utf-8?B?ZkFiNmZaLzJXZks1K2lIeVRLNDl4dWRuVlZvWm90eml3bk96NVdyZHRsc1pl?=
 =?utf-8?B?OXl4b002dXJuR21wS0tadWhrRmVVQjRzWGRiNEI3QzgzRUVnMnhVS3IrTU9Z?=
 =?utf-8?B?RDRQVDgwWmEwQmtTMjg1YTFqenhlMzY5Zjg3TUlFRjd5Q1kzeENsM0lXZkVp?=
 =?utf-8?B?T0djRkorZTdESjExOVhvVCtBYks1MkZ0RDFic1c5a2hxZDNJRUd0bWF2R1ly?=
 =?utf-8?B?aEIxRmxOUDMxV3UvSHh2TUpYNVJyblRRR1pPR21ucDZ3VG5zSkM5RnR2RGFh?=
 =?utf-8?B?WjdNWkpZenJmQWdFUlppME1SVTFnZFZ5aDFuc2pCVmp2dk42djFpUkFFREU3?=
 =?utf-8?B?Y201ZzFDcEp4R1BERHpKRWZEbmFvVHhZRkQySXpCc0JWNXhndFBuZDVjbkY3?=
 =?utf-8?B?a1o0Y1JPdUkyL3BCcVE1S2F5YU9DSWRxbTRBc0hpODlpN01iRzUxeHpGSkN1?=
 =?utf-8?B?Ni9XeTBFdkpUd0I5QXNENFFSeDh1VlpuVFU1RzZxUlJaaEd3KzRLS1pTM2VN?=
 =?utf-8?B?Yk9DMHI4ajNHQTV2M0NpYnhTOXJ1VmgzWUNCTzJadmRPd2I3K3Y1QVJFTGd0?=
 =?utf-8?B?Rktwc1FlYzVRNXdkUUpESGQ1UGxpN1pBUHJobWIyRjdKV3plY0JaU1pFRUhW?=
 =?utf-8?B?dHZSMUtxUUM4ek96T0JzOXRVejN2RXlaMUkyT2RsNjhNalEzOU9ReWZlb1FW?=
 =?utf-8?B?MGJ3M2JTd1c5cFpTRlArdlhFRTh0aUdUcFd6RnJkYjgxdVhUTWREOUJmZmtw?=
 =?utf-8?B?WFhjRkViZDl1Q0wzdUJnN09aZzZYeXNGT24xY2g4cVY0d2cxaE0vOGJaZXVH?=
 =?utf-8?B?dTR0TDRncnhyakdlM0FTelhkeC82QzdCU1kvVVZ4UG0rMjBPd2VUUDliR1Qx?=
 =?utf-8?Q?kl50l0s0Sw0Sj6jIbqif8Z2/USNlncsoZHHdSZl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab74c3-46ab-478a-3290-08d8e8f3eb22
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:39.4888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWo/0ZILlf8hhERfwWb0sABxvVI3uNOa0mwUcLsYm1UIOuIw7VcAyP84j9LKMH0hHQKtzSU3L2RCFYTzlYynAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954
Received-SPF: softfail client-ip=40.107.75.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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
Cc: AlexChen <alex.chen@huawei.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
*fix 80+ char violation while we're here
*fix w32 build breakage from changing INVALID_SET_FILE_POINTER
 definition from a cast to a subtraction
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/channel-win32.c  |  7 ++++---
 qga/commands-posix.c |  4 ++--
 qga/commands-win32.c | 22 +++++++++++-----------
 qga/commands.c       |  4 ++--
 qga/main.c           |  4 ++--
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index 4f04868a76..779007e39b 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -292,9 +292,9 @@ static gboolean ga_channel_open(GAChannel *c, GAChannelMethod method,
         return false;
     }
 
-    if (method == GA_CHANNEL_ISA_SERIAL){
+    if (method == GA_CHANNEL_ISA_SERIAL) {
         snprintf(newpath, sizeof(newpath), "\\\\.\\%s", path);
-    }else {
+    } else {
         g_strlcpy(newpath, path, sizeof(newpath));
     }
 
@@ -307,7 +307,8 @@ static gboolean ga_channel_open(GAChannel *c, GAChannelMethod method,
         return false;
     }
 
-    if (method == GA_CHANNEL_ISA_SERIAL && !SetCommTimeouts(c->handle,&comTimeOut)) {
+    if (method == GA_CHANNEL_ISA_SERIAL
+            && !SetCommTimeouts(c->handle, &comTimeOut)) {
         g_autofree gchar *emsg = g_win32_error_message(GetLastError());
         g_critical("error setting timeout for com port: %s", emsg);
         CloseHandle(c->handle);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 665735fd09..4299ebd96f 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -110,7 +110,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
         reopen_fd_to_null(2);
 
         execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
-               "hypervisor initiated shutdown", (char*)NULL, environ);
+               "hypervisor initiated shutdown", (char *)NULL, environ);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -479,7 +479,7 @@ GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
         gfh->state = RW_STATE_NEW;
     }
 
-    buf = g_malloc0(count+1);
+    buf = g_malloc0(count + 1);
     read_count = fread(buf, 1, count, fh);
     if (ferror(fh)) {
         error_setg_errno(errp, errno, "failed to read file");
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a00e6cb165..4f4c579a3b 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -110,15 +110,15 @@ static OpenFlags guest_file_open_modes[] = {
     {"w",   GENERIC_WRITE,                    CREATE_ALWAYS},
     {"wb",  GENERIC_WRITE,                    CREATE_ALWAYS},
     {"a",   FILE_GENERIC_APPEND,              OPEN_ALWAYS  },
-    {"r+",  GENERIC_WRITE|GENERIC_READ,       OPEN_EXISTING},
-    {"rb+", GENERIC_WRITE|GENERIC_READ,       OPEN_EXISTING},
-    {"r+b", GENERIC_WRITE|GENERIC_READ,       OPEN_EXISTING},
-    {"w+",  GENERIC_WRITE|GENERIC_READ,       CREATE_ALWAYS},
-    {"wb+", GENERIC_WRITE|GENERIC_READ,       CREATE_ALWAYS},
-    {"w+b", GENERIC_WRITE|GENERIC_READ,       CREATE_ALWAYS},
-    {"a+",  FILE_GENERIC_APPEND|GENERIC_READ, OPEN_ALWAYS  },
-    {"ab+", FILE_GENERIC_APPEND|GENERIC_READ, OPEN_ALWAYS  },
-    {"a+b", FILE_GENERIC_APPEND|GENERIC_READ, OPEN_ALWAYS  }
+    {"r+",  GENERIC_WRITE | GENERIC_READ,       OPEN_EXISTING},
+    {"rb+", GENERIC_WRITE | GENERIC_READ,       OPEN_EXISTING},
+    {"r+b", GENERIC_WRITE | GENERIC_READ,       OPEN_EXISTING},
+    {"w+",  GENERIC_WRITE | GENERIC_READ,       CREATE_ALWAYS},
+    {"wb+", GENERIC_WRITE | GENERIC_READ,       CREATE_ALWAYS},
+    {"w+b", GENERIC_WRITE | GENERIC_READ,       CREATE_ALWAYS},
+    {"a+",  FILE_GENERIC_APPEND | GENERIC_READ, OPEN_ALWAYS  },
+    {"ab+", FILE_GENERIC_APPEND | GENERIC_READ, OPEN_ALWAYS  },
+    {"a+b", FILE_GENERIC_APPEND | GENERIC_READ, OPEN_ALWAYS  }
 };
 
 #define debug_error(msg) do { \
@@ -280,7 +280,7 @@ static void acquire_privilege(const char *name, Error **errp)
     Error *local_err = NULL;
 
     if (OpenProcessToken(GetCurrentProcess(),
-        TOKEN_ADJUST_PRIVILEGES|TOKEN_QUERY, &token))
+        TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &token))
     {
         if (!LookupPrivilegeValue(NULL, name, &priv.Privileges[0].Luid)) {
             error_setg(&local_err, QERR_QGA_COMMAND_FAILED,
@@ -1116,7 +1116,7 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
 
     len = strlen(mnt_point);
     mnt_point[len] = '\\';
-    mnt_point[len+1] = 0;
+    mnt_point[len + 1] = 0;
 
     if (!GetVolumeInformationByHandleW(hLocalDiskHandle, vol_info,
                                        sizeof(vol_info), NULL, NULL, NULL,
diff --git a/qga/commands.c b/qga/commands.c
index e866fc7081..a6491d2cf8 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -22,9 +22,9 @@
 #include "commands-common.h"
 
 /* Maximum captured guest-exec out_data/err_data - 16MB */
-#define GUEST_EXEC_MAX_OUTPUT (16*1024*1024)
+#define GUEST_EXEC_MAX_OUTPUT (16 * 1024 * 1024)
 /* Allocation and I/O buffer for reading guest-exec out_data/err_data - 4KB */
-#define GUEST_EXEC_IO_SIZE (4*1024)
+#define GUEST_EXEC_IO_SIZE (4 * 1024)
 /*
  * Maximum file size to read - 48MB
  *
diff --git a/qga/main.c b/qga/main.c
index e7f8f3b161..560490467b 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -586,7 +586,7 @@ end:
 static gboolean channel_event_cb(GIOCondition condition, gpointer data)
 {
     GAState *s = data;
-    gchar buf[QGA_READ_COUNT_DEFAULT+1];
+    gchar buf[QGA_READ_COUNT_DEFAULT + 1];
     gsize count;
     GIOStatus status = ga_channel_read(s->channel, buf, QGA_READ_COUNT_DEFAULT, &count);
     switch (status) {
@@ -610,7 +610,7 @@ static gboolean channel_event_cb(GIOCondition condition, gpointer data)
          * host-side chardev. sleep a bit to mitigate this
          */
         if (s->virtio) {
-            usleep(100*1000);
+            usleep(100 * 1000);
         }
         return true;
     default:
-- 
2.25.1


