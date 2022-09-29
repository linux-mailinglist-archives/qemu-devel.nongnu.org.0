Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2C5EF108
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:57:37 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpMO-0003qj-Ii
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoLq-0004yH-9q
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:00 -0400
Received: from mail-eopbgr50137.outbound.protection.outlook.com
 ([40.107.5.137]:58243 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoLm-0000hg-4s
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:52:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVuuy6jI7XQa4y5v45HR8+zKHNGq6cp9QhdRTbXOEDnjt+9fws2OO/A5vAnF5lOBSd3/YvWRKii/6+k2ozjNi9z3NLN34U1hyJM+mclLEi4nf9nApI6xS86yNq76WPSuv3/0wmagJCwdrxyEh6tOOi5nzcKMLWe1IrQ7eWLlvNRg2bOq7QBytj/6DnpaIF4RMbEb2wp9zUwrutrq215ILi39jYXMEntMQv5S/aK+/UNtxi3JRi/bBho6SIynac+rdG/7+5tBMfDC1ne93X5e8+I3HEKncTGW8w2AP+g1FlXQ5dJWv/H3exW+RHxkdWmfN71L5joldkAPqnhhm/NtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qXr0XSfpeFEa750zuWHJLcULj297xzhC393Kuyr8AU=;
 b=Qf1ssCGAPdkI5vH4GiT9Bi9b8FPXX2aGC1anQLQ1DMnFDvoWEvPqvIDhtHnlodc45zwriPC0umAy3npK6+6mnsxCvOK93YMLLoZE2xTbQWuqE8dSPdx8XvcrwqTv6ys5/vb5JFitgi+zPNTp8NUNjA9AztxPlo6Freb4B0nowZM9pVsdEdUXCAOy+FMMQoG1bg7KfCubR2/CphhO+4TJmzYtq3Q3HFdqKXKvXI7FChOnaIUtb3byUP5vKloJ+DR5yd6wPBGclN/CcCWwqHdByg6Y5KQjyYndHFycLXqdkmXKlsm3gkskj7ZbzW/EUTvVzhnBY5Khn8Y8vLnPOm7/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qXr0XSfpeFEa750zuWHJLcULj297xzhC393Kuyr8AU=;
 b=KFrAxpFbLIi813zpDnHU0/OlTweXnG+iKtThDdg2SWhMeIoknIwgGxGbW9JqCddp6chRK5EFLd327pN9pDCZOQzF+Q5GIs3kjESqvgSbcGijh/kvB2aHZ2nD31PEdKwfQUCQFgfQUsSHajHTvKtYLUQhDSxiB18N9uS6h9QdhP9tZcFU142TuLM9ZCB+L0CrR3hhXjScvqJMJIZsosivlknfLzmVu/c3++RRq7nAAsJYQTpl6Z3whD2aHHbSsFII+R+KgaOpvEk5glAvEdnD4RW63kQYju0SnqY3ce60zqtkz0ZHDgiLCIyu1xFCYDds2Q8ef18p70oeG1PbNaT8Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 07:52:49 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:49 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 5/7] qga: Add support for user password setting in FreeBSD
Date: Thu, 29 Sep 2022 09:52:37 +0200
Message-Id: <20220929075239.1675374-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: ff203256-e632-4a95-e1a3-08daa1ef9a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GlHvzCWmL0HUHrOelDzlJcGjW9QEnqdJo9Awwb+1jIo1hY8uo9nVJ4kayc+cDcup7TQjxZW/6zGHVCOrvTMYC8z3AkjnU+wyVt1PrenVEpvY9y7AcDCblBcJYIY8ucp1xxFGor1+mSL/boK0EiSQ5btYVPbFV4MyalFSAHsUyf9/OTqm0ptu4X59W0wm45DX9HnwgHs4vonzf6jCWiQdisncrq4CZB6xM0Y/BB0eyjYY34/kSe2RIhi7RhXgy8p5pX/S7QxWBI0dTt2BH29YaiSeLyS+/b6Di/RV/amS42GsBnuz9mKg3QzDe0+N8ZobnGsym2La6cCTPnvxYBbrtgg6TK+Tjb0s3X4xTM6dCpfDL+085lyLbl1aU/qTesUeS3LcfNaSyFpR+um7hkluHA7h4B7b1FyDSQLXvvgl7zBNcaU/I3z7UYJy9TIEmrxqEztL58dEwgnXubkxGhZMXwt+EDTFJ0GtdYGAnduWZ6IAqZ2fX7b5QlxNxo3vZO/VpYoL0Pjs83rR9gdR1vpcW6VPJRCwTAteRMcR4549czg7VEOp58BvGK0TbzzVq20THYvXQ6g7cRPCrx2BGz/DNW4tfFHRiwxhs+fSn7WJRyRbbnAZWzUlXk4Iow4fpu7ibmcJI6muQq4r1CTICNVJS9yCB8fSpTMZdXdrn4CB8FX7AiCuAO1CAl+nUGdAbDx0mp6BHwt9o/eTL+hRZPsM9ZUQq81z2l8FCSrX1vNtj4VHZk1DIN6vvin8UADaAANu2e0J7+xqDzsdJv223a4B5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199015)(38350700002)(41300700001)(38100700002)(6666004)(6506007)(478600001)(26005)(186003)(316002)(36756003)(6512007)(44832011)(86362001)(2616005)(52116002)(83380400001)(8936002)(6916009)(6486002)(8676002)(1076003)(5660300002)(4326008)(66556008)(2906002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZUylDQrtUeGB/BmK1N2C7vm8MxHFCNtPiZWKMcgtQ4mw0fmxeZlJPcyKZpEE?=
 =?us-ascii?Q?yxkbv8Zn/eoupXOfs8c6rULYFp4zaZHQyLw6gxzRDwkOh37mudybVXlcVUcw?=
 =?us-ascii?Q?rXDHVLQDw5SVOWZi7nkHUZU7SZgViK/hZaHmguzJ5TTdR5gLIVZORXWh6tU2?=
 =?us-ascii?Q?ELgPQ0B/ajjK3DHx2AVlZZFblybjRhGKi3Ade+EhXdhYYudLb2B0nRbb5F5g?=
 =?us-ascii?Q?9ohsU2L0eHNclLasDyDNav+7nS4zwf/Z88uSjmO06dmA0Obc8DjVoG48IIeK?=
 =?us-ascii?Q?eYS/xz65weJgPOM9zTrtZCNeEeuwfdZ7gwceC87skibXBbehCGLNoPorP88s?=
 =?us-ascii?Q?Bc1oepOsKvAVXXRB4QK/o6UDvhDr3HU6oIomvYH2qiWK+h2g4iISG4NY5pzo?=
 =?us-ascii?Q?r5bEdRAvyXiq21mYSMeGhlo6sSHUH+nyeHoB6zxv77bfnkP9anUstnlG+2F7?=
 =?us-ascii?Q?88/QKscNK30kYyqClBUV3H8Fk/YhOrzWPtC3+0YSMi03do5ak3wUOp/LI/Sv?=
 =?us-ascii?Q?6ogybWvPhbbyVsTc6l1ircXKPO010nkO/ZwjnpZvZAW2sIGBeKdleZl28uc4?=
 =?us-ascii?Q?QfRku0etsXy+M41mpw4DDbP1g5TMIxgRLAZ1WIKjyksd+BsuD28taIVv7C+H?=
 =?us-ascii?Q?LKHoAzsrPbEvHd9v9Wit4IYC3YEyAdfPSQDCMq/6O9sThPlbDhSBnQaQ9OUU?=
 =?us-ascii?Q?UUU3ofe1ggFlZABo4ZR2w2s+NBz6POW0E710MlRXf3Z4vBtQpkubQ4fFxYT+?=
 =?us-ascii?Q?P0g9n4AvJTUR7t1T+gqBIU0GqoVUZ5lQOHOukaEScm8v+WpWdKlsZ3Kk7gGt?=
 =?us-ascii?Q?D+OsMYZPPspSTSTV0rtk/nQvBnsSJxEzC4huLUJuVL1ED98RwQHR3CTrYJXO?=
 =?us-ascii?Q?dx2Ota9GY3mH8zmgMNnwSceVUQu1r+yd7Vj0vg/8CsDBqjxrfuuWL1p/+rVo?=
 =?us-ascii?Q?28y/e7bMGta4jT74ZJZBTxxF60ta+2HpheE0CLwulxCf2/WigqTet6+t73j4?=
 =?us-ascii?Q?sJ7xDvyecEtIOLkH6RRifTsiR/wghL1Okqap7CEaIbDKcWJ9A4R2Yr7I58v1?=
 =?us-ascii?Q?QnS8hV2CCI0olk5I2phxL9Cimd1zeQY/IeyTz8LKmK5GIbTzMHufUOheta9u?=
 =?us-ascii?Q?dYf0B9VwZ/D6827BZJiCyogyLc/5JM7M8A9C87GOFjTtazJ9EXnX3x5VMsA6?=
 =?us-ascii?Q?AzjuRVE8/Qku7nwTErEThR9z14GEP/qiQRDiPtGGexPXTFhsXqWmA/j90qXB?=
 =?us-ascii?Q?JFWMesga1jOAYymHNorAWGbwHNnRWtg7pWbCJaQHxwXGzomsesAcYHdCf/kf?=
 =?us-ascii?Q?1Da6tiFGzxNdui7Od0p5xhS4dTVN79yKO7Mjf166H/ewPqINgEeFtLCQDjX0?=
 =?us-ascii?Q?+jv6UgRa5GzOJsfKJtrqfICmBXihCoPCcMEbFzkkQKPX9g9yUURE64HeuXr/?=
 =?us-ascii?Q?Omz1T9ujrKq+/9CFzRpWs/CjKfQIJA1MAOzDcKkEBI34+v1HomIhUuBzAlxC?=
 =?us-ascii?Q?RKqmiVVzdMXzGxQzjIHoQ4hCXSDzeUFB0M1105tnvY8dyrDPVF1tQWYvSUcd?=
 =?us-ascii?Q?JN5lDSdM8D2vP8khrKInZpK+LYQ0FOZ5WnoHHo+5VM2bH02bLWqohSf5KSwK?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff203256-e632-4a95-e1a3-08daa1ef9a88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:48.9670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm5R6hU8614gFKQY/5CxQlbwk0sKJGQ1LF4vSz+4AGrUg8oOt+9JNaQycHzjOTQn2R4Box1K1Lo6P8sZfMTnrZVpeYyThFeRvaWeoDrIHuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
Received-SPF: pass client-ip=40.107.5.137;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Move qmp_guest_set_user_password() from __linux__ condition to
(__linux__ || __FreeBSD__) condition. Add command and arguments
for password setting in FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-posix.c | 223 +++++++++++++++++++++++--------------------
 1 file changed, 118 insertions(+), 105 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 88e0d0fe24..6ce894ca6e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2123,111 +2123,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
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
@@ -2793,6 +2688,124 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
 
 #endif
 
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
+
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
+#endif
+
 #ifdef HAVE_GETIFADDRS
 static GuestNetworkInterface *
 guest_find_interface(GuestNetworkInterfaceList *head,
-- 
2.34.1


