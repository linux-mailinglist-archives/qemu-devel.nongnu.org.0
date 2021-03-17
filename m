Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714C33E79A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:26:08 +0100 (CET)
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMMox-0000Kl-7N
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMls-0005Z3-L4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:56 -0400
Received: from mail-eopbgr750047.outbound.protection.outlook.com
 ([40.107.75.47]:20848 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMlq-00018F-Gm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgO/B0W9i6vCnA7RDylNwR9+UiO2vWEBS0zIF+HP2fsXjPuJ0yygpWz6ENf7PP5qfw3cjAvLeAFxtbBla4AHcEOKgbE6nfTVSnpgMtvGqcEQPMQwvs1YUMg0gOvODW0jDT4fIJ2Pr/CYT9t2KAAEWCHuF7FK3AYj0M5yXvmTuZhvadvCa/OACJQsczV+Tu756l1gc+qq5lR6k0ClcDhKr1ix3IDvKoYL/pJq32kqTAfIzynhmBgsGSHvbO7oXAEWoGDcuaIEBqFQABOIW+gV/uVWB6PkRvQWqjVNuacGdQFQgr0Wl0EfnxuDaiOJOskcJhD0uuESJvB7c2Y3i08waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spA27DX+d5tWv3ROrnId2PcQlTdRTuV2WvVHXoDWhb4=;
 b=Sza+H/UVDc49aMZMFh3UbOXJaiwMhw83OysksVFMR+3mWmYQnDh4IBDkCZhlSgt6E4RyVlhZZxUDe9Bl6gwvN5gL537js50mV0RrISVI9Xgs8e7/F2GX4f5PW0drClvOW/D0CEg+gSROOsrHBg0Sh9Dp0xQpHG2lJYWewhPqa2b+sDuZPr+N2LAsJ68/U+Lx2Wu6VuA57mHNFK9/NXBwYHCRg9a+X6IV3y0SIOg7Fn1cFn3GD9pA8So435wzta9RTb8NCS2cy7rqZ/2LaPHZPQ4rc24FDh1MU32cYL36ISBqddtlJlxXF4TqTzIRxFfKb4b5pBhOWK3uuhabicgMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spA27DX+d5tWv3ROrnId2PcQlTdRTuV2WvVHXoDWhb4=;
 b=0BfGQWKjuiculbgw2Nv/L0YdOtAdnqX6fhnr93ko9b2r+BmySHuAMPVA40qanWVUMGOXx1mb9TgtbtOKwrqaRQxn4Fro7iEu0CDG0kDa/2QPg2llWCF5UOQQH1d8GetiBttuCmW9v9v+D7yaJzzEWeerqL3Is+iaSmZZHG7gFhE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:52 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:52 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 6/6] qga: return a more explicit error on why a command
 is disabled
Date: Tue, 16 Mar 2021 22:22:17 -0500
Message-Id: <20210317032217.1460684-7-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
References: <20210317032217.1460684-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN8PR12CA0034.namprd12.prod.outlook.com
 (2603:10b6:408:60::47) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN8PR12CA0034.namprd12.prod.outlook.com (2603:10b6:408:60::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:22:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa90391e-2157-4f11-1784-08d8e8f3f30f
X-MS-TrafficTypeDiagnostic: CH2PR12MB4954:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4954F07B42B14A44C2787171956A9@CH2PR12MB4954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YL8glQLUy4HrYsUJhkqix67BTciUjeOnjHeOJOgZrtmBK0uEyWAjJ4s1Q8M/PB+P/V2GwzIdzLTVJy4zkz5cxP3bO67szyf47Jds326XJ63VgXlpUEoZBIwYWrGFZICZtO6V1bpi3jC0hHxxVGLJAJNo++YvwqYdTp4IWpORpc4vL7lCczWBbh63oGCF7BQ5A8iLO/EFhb9GnVDCM7eKEAQ6MklWDGjJJscKvUfU67mJSGvgnxnUlBDvKfhgaoVmBIpSxnWO52v8EvKOJV+8ZhK8CgV585OXKabLF9LFPfezjdsKUSs4mNqOP5mUceZ85XoSkT+RVasJ4zUryvSVPiF1MYGr6scP6wrufSVLnWQ/iFe0Ln+YdDip/vFymkNTJvGBGSFeeMe6IkbSxdPqUdcqTcTl9zNZBeXzodO3cnAyAgM7iW0JCb+YMTN3rG1a/26rjKM2HOinXI3DzHxct9bfq3tSRmiIbF+dgeHNLacPu6ItVH+0t/WHfZRaGoTyxW+Qa6sP1DInFjspN55ZG/EDRGVzSpvNl1nAIzE0eQ27ruHYrSkkcKrpzBCqEjmtTP0pJZHwGY9G64EwGPTUlKD2TtWKTRPCF0MGoOdj1ZhqDPVMfemZFD1mi+oHTwlGNO1MoglIx/Zk1P7GXzRqIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(8676002)(8936002)(4326008)(478600001)(316002)(26005)(966005)(66946007)(83380400001)(1076003)(2616005)(66476007)(956004)(66556008)(86362001)(6916009)(36756003)(44832011)(6666004)(6486002)(52116002)(16526019)(6496006)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWk0MVB4aTlQbzlZdnVQZ0JtYTZXYTdNcE1XVG5obDdxVmZxOVRscThZUEIy?=
 =?utf-8?B?ZEVvUFBUUVNHckhXK0NlcWkwNnIxTUFhN2h6eWNHVE1JdWRDd3grVTJOeVNs?=
 =?utf-8?B?T3Q3NWd3ZVQ2RmpEeVZpVGVyeVVRUXdGWmRMVitsL214YkFHTlRsNWUxWWlx?=
 =?utf-8?B?QlJ1R1RSZWlWNzBXa1NPYk52RUNCVWQ2Y1hGLzJXRGVsaTFPdEJWaUxXWUVo?=
 =?utf-8?B?ZVBWN3lUQm5idnlSQ0Z5aytIUExMU1kzQ3RzOHRwQnlBUTlWaGhPNnhseTEr?=
 =?utf-8?B?NE56dDZjdTlLWXE5a3VGMkhHMGk2SEY4VHZKWHJNRGNKdEY5RlR6djlvbnNL?=
 =?utf-8?B?c1dYa0RhS3kvVlNNcVJlSGhKaEZTMUc0RG1DL2diWC9TWTBOL0p6SW9zTXJE?=
 =?utf-8?B?bEdBSTg4SGRhMzJ2SHdHMUNZbEJlVGVFc0huSks1UXBaZlowbmMyYnJyOUgx?=
 =?utf-8?B?YWhUSW9CNWMrVFJQNTdHZ3JsQWtaWXFnSGdmS2lUUUVTMXA5cjhlUS9uSnJE?=
 =?utf-8?B?aVJBUmhoeDFPT3Q5cHhYcnVwVE9nQStQeTB0YmpOTDltdURucVRYZzVlZzhl?=
 =?utf-8?B?MWJpWXBGelp4SmJZaGxkL3ZMell5OENhbUFsVGcyejFiUUU3cGJJczVmNTBt?=
 =?utf-8?B?SXZDMUhUTmZIbmQvWTRFeVZLQmNUbDF0RE13VEh2cm1KYVBYdEIwbUZwbzNl?=
 =?utf-8?B?RS9Zc3R4Z01LQmR4VVlkQ1M3R2c3RkswVmVyTnIzdWtnRWNYWndBNDQ1cmQ1?=
 =?utf-8?B?MjBjSjNwYThGcjI1WmpOck53cE0xRzNLUWtieTZRdUtJelRKZzIrYW5pZG5F?=
 =?utf-8?B?TXVCUWVqaFpBL0l2c3o3SDVGUnYvYjA3MmN1UGpkUWFMSlhTVGswQ1FDaVNB?=
 =?utf-8?B?aXV1MldENVpJa21TZDVaME54OHpTUDJqVnBTWVJxRStqaUErS2U1ZHZmODUx?=
 =?utf-8?B?c3U2UWowZUZXNkxsWFZ3N0xJeDJ2bFN2T3FWaVNZaWl2b0VNVUpxcm41K3Zs?=
 =?utf-8?B?MXlpNm0vcnl4UUpzVm9DNjhjU3FVZUpBVzM5WlZLdUJrVk14T1kvRHFvSTUr?=
 =?utf-8?B?QUpyRWtPTFhmeXRwSkVhQy9yTkhQWTJ5QlhhQUw5UXFSUGxJWGg0K29RZFp6?=
 =?utf-8?B?S0RvR1ZDQXZ6SVdiMVdqZThtMDFXS0RrR0FSdnAwWGo4b0pYeG1MTVBTZjJs?=
 =?utf-8?B?a0pyNGxhVDZYeVNPNVV3ZDhxWGJOd1lJZHBtcmt5MDBuZys4eUMxMER0dC9P?=
 =?utf-8?B?dll5TFV2S21ERmVGV2VsajY4c3A0NGtmcFUxRS83ckdHMGZyMVBqVUNTa1RJ?=
 =?utf-8?B?WU5xNmYxNWhXU2dNTE5JZk0yTiswUXo2Y29mKzgxQU9OczN6ZHJTTjRpQTJL?=
 =?utf-8?B?c0JUSlRwRlVxZDhhZ3JDWk9RTFo1UmkxeDJScCtOZjRzaWtUbVIzcjl4U1h2?=
 =?utf-8?B?a2x1L204ZEFxK3ovTUFFMzVXb0h5eE1vc2ZkVlpSUWw3WFJwYXc1L3h5dXJ6?=
 =?utf-8?B?WG9lby8yLzgvSkVuYjJnaXliaUNjekxuajF6di9DUXhtVGsrNm1ZUHlHbnF5?=
 =?utf-8?B?U28rK2J0QURMd2JMYTFybEJFTEUzZkZnaHI2SVZGVXRGRlp3M0tRL0Iyb2JM?=
 =?utf-8?B?L3pXanMwZkhTSXNrSGpsY3NsZW1RNWkxUjRaWmJldlRKcFI1d2ltT2UyWEVX?=
 =?utf-8?B?VWc5d0tCemw3dHA0WUdaR1ZWSXgwSE9lZ0d6djM4aExoUUVUU3JPM3lnY1hv?=
 =?utf-8?Q?YbmOAax+2xdmQx9L/l6mr7wRSFJ/HsENgSpBVFW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa90391e-2157-4f11-1784-08d8e8f3f30f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:52.7316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5PmDxEnhMcF5oKGHUG7dnmGfkelk32YHSRrvCLZBk/C4aYhBzZ4k694mIJ0ta56yPbkDVlNv5KSdUG/Jz5oDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954
Received-SPF: softfail client-ip=40.107.75.47;
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qmp_disable_command() now takes an optional error string to return a
more explicit error message.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1928806

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
*fix up 80+ char line
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 include/qapi/qmp/dispatch.h |  4 +++-
 qapi/qmp-dispatch.c         |  6 ++++--
 qapi/qmp-registry.c         | 10 ++++++----
 qga/main.c                  |  4 ++--
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1486cac3ef..135dfdef71 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -36,6 +36,7 @@ typedef struct QmpCommand
     QmpCommandOptions options;
     QTAILQ_ENTRY(QmpCommand) node;
     bool enabled;
+    const char *disable_reason;
 } QmpCommand;
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
@@ -44,7 +45,8 @@ void qmp_register_command(QmpCommandList *cmds, const char *name,
                           QmpCommandFunc *fn, QmpCommandOptions options);
 const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
                                    const char *name);
-void qmp_disable_command(QmpCommandList *cmds, const char *name);
+void qmp_disable_command(QmpCommandList *cmds, const char *name,
+                         const char *err_msg);
 void qmp_enable_command(QmpCommandList *cmds, const char *name);
 
 bool qmp_command_is_enabled(const QmpCommand *cmd);
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0a2b20a4e4..5e597c76f7 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -157,8 +157,10 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
     }
     if (!cmd->enabled) {
         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
-                  "The command %s has been disabled for this instance",
-                  command);
+                  "Command %s has been disabled%s%s",
+                  command,
+                  cmd->disable_reason ? ": " : "",
+                  cmd->disable_reason ?: "");
         goto out;
     }
     if (oob && !(cmd->options & QCO_ALLOW_OOB)) {
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index 58c65b5052..f78c064aae 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -43,26 +43,28 @@ const QmpCommand *qmp_find_command(const QmpCommandList *cmds, const char *name)
 }
 
 static void qmp_toggle_command(QmpCommandList *cmds, const char *name,
-                               bool enabled)
+                               bool enabled, const char *disable_reason)
 {
     QmpCommand *cmd;
 
     QTAILQ_FOREACH(cmd, cmds, node) {
         if (strcmp(cmd->name, name) == 0) {
             cmd->enabled = enabled;
+            cmd->disable_reason = disable_reason;
             return;
         }
     }
 }
 
-void qmp_disable_command(QmpCommandList *cmds, const char *name)
+void qmp_disable_command(QmpCommandList *cmds, const char *name,
+                         const char *disable_reason)
 {
-    qmp_toggle_command(cmds, name, false);
+    qmp_toggle_command(cmds, name, false, disable_reason);
 }
 
 void qmp_enable_command(QmpCommandList *cmds, const char *name)
 {
-    qmp_toggle_command(cmds, name, true);
+    qmp_toggle_command(cmds, name, true, NULL);
 }
 
 bool qmp_command_is_enabled(const QmpCommand *cmd)
diff --git a/qga/main.c b/qga/main.c
index ebb910773b..15fd3a4149 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
     }
     if (!whitelisted) {
         g_debug("disabling command: %s", name);
-        qmp_disable_command(&ga_commands, name);
+        qmp_disable_command(&ga_commands, name, "the agent is in frozen state");
     }
 }
 
@@ -1328,7 +1328,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
         s->blacklist = config->blacklist;
         do {
             g_debug("disabling command: %s", (char *)l->data);
-            qmp_disable_command(&ga_commands, l->data);
+            qmp_disable_command(&ga_commands, l->data, NULL);
             l = g_list_next(l);
         } while (l);
     }
-- 
2.25.1


