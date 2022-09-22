Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F55E653A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:52 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNAB-0001e6-BB
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obM8h-0001YS-NB
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:21:26 -0400
Received: from mail-eopbgr60136.outbound.protection.outlook.com
 ([40.107.6.136]:7326 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obM8e-0004pt-6d
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:21:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGmWOUubNGQ/hlCB5AiDztVYD94tf2rm9oGTQfGBGYQMv4WSgH0P3JawA0L728vn0vHXzIg8dgiOHy33PgaDm2GHUeihhZSi6gjqaEJGLGhAgsrfwPwi/ALZjuIiCJHtDWcDEkQIk/iz6VR7juEPFhoii75fI0jO0frkx5aL7dcWisOjWheuDfxlOBpaZHZVio1jPiH6pHdGwlKHU41S9Mm6G4H1wKLKcKmanVXg0+IoB9qx0fPw9Odl8M3hCfHxtGKm3Ah9lgzK/TgSYeCDXXdNNJbDVrLyv4rLkMWk14w4w/cQYxFgqDylSEgH32E8MpIWmlKwGld4rDlbkhvQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnO7doIdUC9xNB7+sP10/LMdPtsJPq+NbTdQrvdFWAA=;
 b=QV25mLHHkJY9ADAGaCXymq0VMnNPLJ6lovR/7Q8orzb2v0j6JfQMvwnJc3YZUR9z91nA3zdc9pXEhsWHpvMej17cIF10ORgUecynM0CmEu8zSL+a+yzrPSa1drxDiC6uPqaILsZXBu7zQTermasE4oKQiMST8+3JMStVnHAp3P9xxgudpEXfv70beUNAijjzh4gnaqd+ARqPCUjvaTP53HoOlD8zsBA3O/uhCGWACivsGM09zQ+TjGsJ1yJ4i0sf7Yhp+elaQXJ8qleQ5dHvaHGkY+cbwqzecGDTerVHzrxb6J+j9TWvZLxpx3yHLoUIEtP/MA8QdvdznrVm7UI+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnO7doIdUC9xNB7+sP10/LMdPtsJPq+NbTdQrvdFWAA=;
 b=ISnIRoR39DbdbJIrQI0yuZ7plQ2laS8YiV23tfanpHNJpdzyv6hGnQ6e/bSrbX28R2j9YnNB8o+Br++da7t+bCXXpss38jSqWBZliEgWQ/A2a8IOrsLT0LRLgnKuKU7T1RXgskIG0DLaOs76LYAagt2QSoA1fHXEIEkRYtk7HC46p/WxbUZjth8WmAQWNVAxqyJyYw58c2gtVFieIxVe6NOvHsbZOHZGybx65jt0nqzAlZ/tLAT2zety3eUza8ejOJlCGMhN/ofapUeXM9oZ9ok+fj1S4kgyHkTR5XIj1Lnysw+5Bm3Iwmx/D7/PAyJ7e2lDga74bygnlNbais32+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 13:20:15 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 13:20:15 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 5/5] qga: Add support for user password settinng in FreeeBSD
Date: Thu, 22 Sep 2022 15:20:01 +0200
Message-Id: <20220922132001.940334-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad83f21-9034-4b18-68c0-08da9c9d2ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZINIkIFbQIhnOgDQT7ACjtTVXKUpR7IU37sqJB2qUaEphjCb54kTkqlkjrTXZLmfgrgFI4Zd2aqHimK7u/Sp3YEWL6gZ0MTIcLPRr4sWm+gxbSPyAtX8x/NfX1/HSX/s4g6Rc53eDSxIs6c0YKWKqF5ltTz7gAxkcN0pULTcDVXlyPG56vXqfv6IIlA3tPOfNDV5SKiE5/9F6MvJlBY1LNy3F0nYFtMREQkYwTJZ4Ovt0KHsq0EXTheSyMx5nGEBwpYiUGolcpyVSKjpIZmJ4yRaDEfjK1YBUuv05LCtQ1rExJy9QF5x3z/LRNwPKOsVTAp+VpaX5XHLWxQxanIzQKZvfQwsMoPGXTMcDaPh1U6BZhRablHcZepzKW6+CvDGyFLtb3WpzUB3zkbJGRpNqjax1hAaeFpJeFQrQ70aDJ1q+kyj2KogGZ8V6cSYH+iNzrM3Q5KWYeQbsRlboJkCiz7EHdX7iqZwBeaJ9uQAIgYDQ31X677YCRKXdOtxxyR4ZMIeT/yU8CaFhXJNAF6OZpSISeZxP2Q2GdEbUWj5lLCd3ecbZy/l/rvGTUwYDV7I/IHqaMRQOauFt4lOzhE7aXphy0cHfI251NOQkotht8hZQ2y7sYBfB+eG/VFp2r2Dm+1QdtlKXCX9v3TQr2VkmDFaJHz1yykEVqc8w4AyFDlZzo2IgSa595LdwVw0+FoNCCEt+L/FLkYewV8g+9IahK4P82YQ/NAphYRV2zW34qlf0nMyxUoYw8DFvO4OlEhGAhW7LbDue/bEpCwMWmJQIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199015)(41300700001)(6486002)(478600001)(6666004)(52116002)(36756003)(66476007)(66556008)(316002)(186003)(66946007)(83380400001)(1076003)(5660300002)(2616005)(8936002)(26005)(6506007)(6916009)(86362001)(8676002)(44832011)(4326008)(2906002)(6512007)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hQYoJRhWRIA0xTqXZCnan0cUcwZqANkGicxN9Yp+D6BgbDM6p2tIWh4S04gM?=
 =?us-ascii?Q?+y6/RwaaDhZUEqp3xH7lArRG7OVgNuC52/n9LqjFagBD3NPu4iAZqgi3SYMY?=
 =?us-ascii?Q?grgNKms+cp3crWMAFCNbdZDOGomJwEhAmj7u8rQYDlftbZNW+K3mIsrqY+If?=
 =?us-ascii?Q?MB1frsTlAcgZK1U04m+/P+EVmzJ51udfiIjEFBy7ReYyALFDhD3uk851a9OW?=
 =?us-ascii?Q?TH1C534yZH315syi1vraQCdscrKmkl0H95euqrVvalAjU88jnc7R1qPOXADu?=
 =?us-ascii?Q?itht7+Xp9JXP8HaHf1BO2UyL5CAIIPQ2EQk8MG/3OzEBfDe8j+iLosRb6Nm5?=
 =?us-ascii?Q?5YdthT78lZSXUO1yQrby3Zqx7u6TgZL3d88n6pvtatf22hCk3zJ9lOgqQEmJ?=
 =?us-ascii?Q?Go2HduERVuftGxUqcW7fKd+i+H/5Sv72Ss+CDj+nt8NHpr+JbfejWvSGVY6X?=
 =?us-ascii?Q?6UagdfHM5EFE12DrvbX3AWdKrmcYsxUrUGjvAljCFPAw3HRemF8OH81HFVev?=
 =?us-ascii?Q?BDB7tJ+ypw5G1iv70kvQDkuHEaNU+waB1GL8CFpAwjU/LOtbUf/J4bfUEthd?=
 =?us-ascii?Q?mS8sdwzc8lNFNI4A8rZYA8kmrI4EBliQNdv5ERMWkqMenbr4lO1cES1FwA56?=
 =?us-ascii?Q?nSYp1epqvKvFgSXe2KE75CxLXiQkudf9Rr/tcT2mWx+gtVc7eNgs/DqVY+Y1?=
 =?us-ascii?Q?o3cKeQxm87Ua6usX2ZeFCvXKgSTrOiJBTUOfUcF06MGhI9HpPk1CeSMEHtEE?=
 =?us-ascii?Q?S8hHdUsR2YzuKbOhMsG+q4FP0gU69C8j8xk3g7pFqxY1AOKJI7vkcfOkgyI2?=
 =?us-ascii?Q?eBcBCD+ox05IjVVFCqog7xbluCneHHuTt2ULoj2dndcjj9FA2KuwcVfiS/kl?=
 =?us-ascii?Q?WaPnw//4B9He0xOpT5Kji+3PiNHR3P0Y6mBoKZ11RGmRooSgBaNq5Kp6zpPt?=
 =?us-ascii?Q?JmXMQvUdYcAiblE2kROX//T3l6yz4UGBUAYul0GY8BTWjgAnNb5sCpSp34op?=
 =?us-ascii?Q?Qpyh0MESCdAVCli+9Wsm++ynwBNkHieR0WjM7z7HG+3cIRnvPNQN9wpAKvCu?=
 =?us-ascii?Q?C0VRDoWCB9eQDylM8WVx/MPX9QKulO+N8Zpnqauukiu36abIrswHJZ6O31hQ?=
 =?us-ascii?Q?ylCccJlk5qEXpiwhPRsABeSbXMbNTzZKBFZWdmgcEJCqulq+ryN92q5Wa9jY?=
 =?us-ascii?Q?pxtP2WJfLDPTGY+yeGbZPS5UDOoWfnvsmWaV8Ec6ubCr7HZvEI3iY600w68f?=
 =?us-ascii?Q?wLmdX7fQZHBU3UkJ0ODJ/h6qdZ7nsarL1PkwZ3jUwsz4HEn8YP9CUyGd8uhn?=
 =?us-ascii?Q?4qFgYKAwTbcY93Ei1c1z/PFr15lcNCpLB7zTvfiExCAhranUm/1lWOT8XcmE?=
 =?us-ascii?Q?RTC40/W/c6EBOILKtVkRlWUteVB3e6x5MQYW7Ecmn/eSXpKOckXEnorQxStf?=
 =?us-ascii?Q?9qDhlclilvcDMF0Kcifw8iHlWutZbhTp+xv2QmarM4n9upX5aadmxuQBB9F4?=
 =?us-ascii?Q?uZ86oKJjrjg6rkLHwuRjw4DMNMzV6xo5h0are/p/4o4S4nbjwBM5K5N9NTit?=
 =?us-ascii?Q?xPIKtXmuzSmbvbmwVm0W//0SvJBVMeoy03oU6SWbMSSiAuBQEK5lXqLNijxN?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad83f21-9034-4b18-68c0-08da9c9d2ffb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:20:15.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJVNcvKeBpo+2ca/RU0jGoOhV73Gm5E7/PnqoaYgHst0qTqwfie3r3870s2lgl5Hma2/1uO+oOm+NgSAez5arGe+OOlvVF/5hI+rP/yh5E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480
Received-SPF: pass client-ip=40.107.6.136;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Move qmp_guest_set_user_password() to commands-posix.c under (__linux__ or
__FreeBSD) condition. Add command and arguments for password setting in
FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c   |   8 ---
 qga/commands-linux.c | 105 --------------------------------------
 qga/commands-posix.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 116 insertions(+), 114 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index 5d3f46804a..fa3933f2f4 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -190,14 +190,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
     return -1;
 }
 
-void qmp_guest_set_user_password(const char *username,
-                                 const char *password,
-                                 bool crypted,
-                                 Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-}
-
 GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
diff --git a/qga/commands-linux.c b/qga/commands-linux.c
index 615e9a0027..1f25c80482 100644
--- a/qga/commands-linux.c
+++ b/qga/commands-linux.c
@@ -1629,111 +1629,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
     return processed;
 }
 
-void qmp_guest_set_user_password(const char *username,
-                                 const char *password,
-                                 bool crypted,
-                                 Error **errp)
-{
-    Error *local_err = NULL;
-    char *passwd_path = NULL;
-    pid_t pid;
-    int status;
-    int datafd[2] = { -1, -1 };
-    char *rawpasswddata = NULL;
-    size_t rawpasswdlen;
-    char *chpasswddata = NULL;
-    size_t chpasswdlen;
-
-    rawpasswddata = (char *)qbase64_decode(password, -1, &rawpasswdlen, errp);
-    if (!rawpasswddata) {
-        return;
-    }
-    rawpasswddata = g_renew(char, rawpasswddata, rawpasswdlen + 1);
-    rawpasswddata[rawpasswdlen] = '\0';
-
-    if (strchr(rawpasswddata, '\n')) {
-        error_setg(errp, "forbidden characters in raw password");
-        goto out;
-    }
-
-    if (strchr(username, '\n') ||
-        strchr(username, ':')) {
-        error_setg(errp, "forbidden characters in username");
-        goto out;
-    }
-
-    chpasswddata = g_strdup_printf("%s:%s\n", username, rawpasswddata);
-    chpasswdlen = strlen(chpasswddata);
-
-    passwd_path = g_find_program_in_path("chpasswd");
-
-    if (!passwd_path) {
-        error_setg(errp, "cannot find 'passwd' program in PATH");
-        goto out;
-    }
-
-    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
-        error_setg(errp, "cannot create pipe FDs");
-        goto out;
-    }
-
-    pid = fork();
-    if (pid == 0) {
-        close(datafd[1]);
-        /* child */
-        setsid();
-        dup2(datafd[0], 0);
-        reopen_fd_to_null(1);
-        reopen_fd_to_null(2);
-
-        if (crypted) {
-            execl(passwd_path, "chpasswd", "-e", NULL);
-        } else {
-            execl(passwd_path, "chpasswd", NULL);
-        }
-        _exit(EXIT_FAILURE);
-    } else if (pid < 0) {
-        error_setg_errno(errp, errno, "failed to create child process");
-        goto out;
-    }
-    close(datafd[0]);
-    datafd[0] = -1;
-
-    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) != chpasswdlen) {
-        error_setg_errno(errp, errno, "cannot write new account password");
-        goto out;
-    }
-    close(datafd[1]);
-    datafd[1] = -1;
-
-    ga_wait_child(pid, &status, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        goto out;
-    }
-
-    if (!WIFEXITED(status)) {
-        error_setg(errp, "child process has terminated abnormally");
-        goto out;
-    }
-
-    if (WEXITSTATUS(status)) {
-        error_setg(errp, "child process has failed to set user password");
-        goto out;
-    }
-
-out:
-    g_free(chpasswddata);
-    g_free(rawpasswddata);
-    g_free(passwd_path);
-    if (datafd[0] != -1) {
-        close(datafd[0]);
-    }
-    if (datafd[1] != -1) {
-        close(datafd[1]);
-    }
-}
-
 static void ga_read_sysfs_file(int dirfd, const char *pathname, char *buf,
                                int size, Error **errp)
 {
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 60cc673f25..e8fc7bd516 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -774,8 +774,123 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-#if !(defined(__linux__) || defined(__FreeBSD__))
+#if defined(__linux__) || defined(__FreeBSD__)
+void qmp_guest_set_user_password(const char *username,
+                                 const char *password,
+                                 bool crypted,
+                                 Error **errp)
+{
+    Error *local_err = NULL;
+    char *passwd_path = NULL;
+    pid_t pid;
+    int status;
+    int datafd[2] = { -1, -1 };
+    char *rawpasswddata = NULL;
+    size_t rawpasswdlen;
+    char *chpasswddata = NULL;
+    size_t chpasswdlen;
 
+    rawpasswddata = (char *)qbase64_decode(password, -1, &rawpasswdlen, errp);
+    if (!rawpasswddata) {
+        return;
+    }
+    rawpasswddata = g_renew(char, rawpasswddata, rawpasswdlen + 1);
+    rawpasswddata[rawpasswdlen] = '\0';
+
+    if (strchr(rawpasswddata, '\n')) {
+        error_setg(errp, "forbidden characters in raw password");
+        goto out;
+    }
+
+    if (strchr(username, '\n') ||
+        strchr(username, ':')) {
+        error_setg(errp, "forbidden characters in username");
+        goto out;
+    }
+
+#ifdef __FreeBSD__
+    chpasswddata = g_strdup(rawpasswddata);
+    passwd_path = g_find_program_in_path("pw");
+#else
+    chpasswddata = g_strdup_printf("%s:%s\n", username, rawpasswddata);
+    passwd_path = g_find_program_in_path("chpasswd");
+#endif
+
+    chpasswdlen = strlen(chpasswddata);
+
+    if (!passwd_path) {
+        error_setg(errp, "cannot find 'passwd' program in PATH");
+        goto out;
+    }
+
+    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
+        error_setg(errp, "cannot create pipe FDs");
+        goto out;
+    }
+
+    pid = fork();
+    if (pid == 0) {
+        close(datafd[1]);
+        /* child */
+        setsid();
+        dup2(datafd[0], 0);
+        reopen_fd_to_null(1);
+        reopen_fd_to_null(2);
+
+#ifdef __FreeBSD__
+        const char *h_arg;
+        h_arg = (crypted) ? "-H" : "-h";
+        execl(passwd_path, "pw", "usermod", "-n", username, h_arg, "0", NULL);
+#else
+        if (crypted) {
+            execl(passwd_path, "chpasswd", "-e", NULL);
+        } else {
+            execl(passwd_path, "chpasswd", NULL);
+        }
+#endif
+        _exit(EXIT_FAILURE);
+    } else if (pid < 0) {
+        error_setg_errno(errp, errno, "failed to create child process");
+        goto out;
+    }
+    close(datafd[0]);
+    datafd[0] = -1;
+
+    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) != chpasswdlen) {
+        error_setg_errno(errp, errno, "cannot write new account password");
+        goto out;
+    }
+    close(datafd[1]);
+    datafd[1] = -1;
+
+    ga_wait_child(pid, &status, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto out;
+    }
+
+    if (!WIFEXITED(status)) {
+        error_setg(errp, "child process has terminated abnormally");
+        goto out;
+    }
+
+    if (WEXITSTATUS(status)) {
+        error_setg(errp, "child process has failed to set user password");
+        goto out;
+    }
+
+out:
+    g_free(chpasswddata);
+    g_free(rawpasswddata);
+    g_free(passwd_path);
+    if (datafd[0] != -1) {
+        close(datafd[0]);
+    }
+    if (datafd[1] != -1) {
+        close(datafd[1]);
+    }
+}
+#else
 void qmp_guest_suspend_disk(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
-- 
2.34.1


