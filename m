Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6DC5FD7C4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:23:44 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivNP-0003nz-KJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRU-0002JP-AU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:52 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:28929 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRR-0004g6-Ls
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vhq04hOu6D+c6O9EgvoX1ej9HudCtb4N/r4Yg84op78mjkbJ/I0kZKyS7/TmTTCE7R8mp6S0Htl3nVv0SjLisQGWtdDgjSB2tUq7gx8XBtL4I1iu576z7ZZvKG0KRPwUmFp5m5h1m8dgN3Zzl/cJkiaqmoFI6IeuwEzdMFjC9O+H+q2vH/Nv6pJlawASYIulX19q5jrwV2NkjdneyPQaGNvAvb6cXh3CzqHYTJY3wY7K7/iZXeMyeVteJ8XX/PIz1sb8tg051vwggCDCGbt21FyqeUPgp4Fmt8HsFH1lj0S4xmXYQi6FuuOVJ1x2n65Bh9tOMO8tEt31HlwEtDuhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT73yPip7Y9KrhTJdJ9NiMxOTh3MLqVE4NRIId7eC2U=;
 b=enHoBXEIPQHoDzy4bVnPsrnjiu+BFd5jQ1dkT+TJyxIHgXR3zBEwI1qsZDTHpJt4/KocHeFEQqsCU/cOgRWGAyZp9BhqHqCFPYGj0pkxTeHQtdkOT/AgfEG6staokZ8stpXJ/kvWzirmbL+gEUTAifVfbkqMUf5AbF/omDdFj57BoxRjm1+ZNTgfq7+v+64NSA4dacUxYuYgtOm+NbeJ5uh6V1ZD+MWcq22BeNQkILO6JVrG0iRJVfF7Jb5SNAokYJ+i9afXnZfbx5G49I3wBdRyB6cTBXNIF8NMLCuEmwuW9I45jL6Wvo3AJu9OtDFqcFjJa3foLJUAilNK9/RSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT73yPip7Y9KrhTJdJ9NiMxOTh3MLqVE4NRIId7eC2U=;
 b=ezCB8nJ/LYIT52E/QBt8tHX+n0OvbZsKX/pZVCZYex30nU5Ac496vGw4kAJ9gnuk1sfcMnR0T33IUMhdEEEYOIGjOy76+C4BNKjvdOnAUz+yFTm2SQBKFW9nYfLoxAxgAhuFezhlMFbANMvz8dxPATfbe7mhxK+7NR9biz+YUwXmfi9TzFz97MGdTY4qUrgMfGHOlv5jSAMtjya6E3ymlHeo4xoNc2UIYvLDx+CmIo/eec1mTn19WeYYZf3PR8ipx6wRD/HM8DRGGnHSZqEhiMqP/EbAx9gPn403zL4/AH0NIiY3Yfz5+1JqfTJX6QwEZnC9uS1Jsr/StVmAeFZiow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:39 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:39 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 5/7] qga: Add support for user password setting in FreeBSD
Date: Thu, 13 Oct 2022 11:23:24 +0200
Message-Id: <20221013092326.2194646-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
References: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM8PR08MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e30ef2-abff-45d3-f99c-08daacfc9caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: we0cty67ycuD4aWo5jy2KqzPy4HD/Gvi/gmEsPC+GCTOWbTMXRdbELGD9tw8ZTt9MYRLuzaT1EuGAR3zIkbxlGJiI3XsTK8bSUO00OLbtOvgsLjB68DQmKypt3/METrFY4v+zSLPqUiUn3m45P3GYvM4nDhTYizWUaMb7QdzKd53tq7QjbMz0fg7vJ25fGWJNbFBM6gI+tcQvlaPvE3PsM2a+9POtqazTszQJSIywslqXnWFJRKjXMP7VvGZ+nh+4tNCtrLCMXXZnPZ5xVJKCJjC4zch5tvghxXySPt5tSquJS0KtxjBU3Tb1YMsj5ZO9LZ9cm6zddReCVC8MTqwvvmCYJKnwPopYr19CNbWqVbOC+lvYHHk104g1RPcDe9pjBgndip7YUU1Bd5Mi5A5eB/5IaENyQSXTsHcReaXNwraU5Rbvn2R90gJRDW3tcQOmVMLebc8K0aZuxFDiGkjUp7ts40mzq6stObPsO9+L3W97H6+/KJYtcxNhzlRhY/r+YOaQULDxwlOKaY4YFjg4oS2/dpM488INr8jzN8gToBi3xY1wl+zlHYM6HY2qPFUeTvR6r5oXPHlYZJTe9cwM0wcz6RVbYi9Arx1KVWaAqrdqVk7ypwJ9eZPCs573tLGMQoSpn5q7u3A2MJIzhB68sGec0fsvG2b83laq2MG+33Gl/8NWdzWuGHHV/8U8/Pv8EMBlyGBOoGRwPH8dYTzmmhPUhwCND+pMCf3yoHvEnRtft04S5SAwmj65K7z/1jk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(83380400001)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1lKT21uK0dOWFNxS2UyWnhYRkc1M0t5akRJLzZGNmxNT0R2VlVpSWhUWUpO?=
 =?utf-8?B?TXdQOTROQlNFeGNCL0h4K04zb2lwUlhueU8waXFGcis3NFROdTMzbzNBcFJV?=
 =?utf-8?B?eFJxeGd0T0o4dkg1SVRHWGZ4SThrWVd6bTFIZUN6bHRDWnIveW1EV2hwR1hN?=
 =?utf-8?B?am4zb0c5VzV6cWlDUU53Z3oyZDdXbUQ4eDRuOGlrb2xsMFEwdGp2VEVIQkJQ?=
 =?utf-8?B?b0QzbG04T2JqNkVXMzgyQjJIajJKekM0bGVaWGxiNFR2SDJVZ1ZJWFY4ZWo1?=
 =?utf-8?B?bGdTWWI0OGEvS1hpcHI4S2o2SElNaXA4eXpDTFZRS0dsbE8yQ21zOEFHZXMr?=
 =?utf-8?B?eXFScytBamR2UUc5ck9pakRrNFY4RjNDeGNFNkEwVTlabi9MZ2JQMmtOcFRR?=
 =?utf-8?B?LzBMcW0ydTUvRklDWEFVZXZ2RWpaOXA1V2cvYW9sWkVzNVFaQlNoaHI4VlJp?=
 =?utf-8?B?YmNlYzJnWHhRc2tVZUQwY3RQWGl5RTBTZHR4WDFLeWJQblppcElGSml1MVZT?=
 =?utf-8?B?ZGxCTWZpQ0JaVUdFcTBNZ1FCZ0loTDhqNHU0WHlZaG5sVHQ3Z0RLdkR5cE9r?=
 =?utf-8?B?WHc3SjlqZlBXL2lpQzd1UlFJR1ZnWldUY2piZ2pNTXc5WlBINTJJdnRVVThV?=
 =?utf-8?B?TEpKVXQ3L0hHazMza3d1NXlEalVENW9Ta3N0djk0WWsxdkFZSktUVGppZ2R4?=
 =?utf-8?B?Zy82SHdRR0dsQUFTaCtGN3FENU14VUV0U05LSFFWc1BETlVta25Ccmo4dWZJ?=
 =?utf-8?B?aXM1VUh5dENJc1hXY1pVaFQ0WmFwUkNmUWFyU0RwdTZSbWdQWWFZSU0vdU1F?=
 =?utf-8?B?dWZlaG45a24ydS92amJEVVIxNXlXcW5paGZteEVWakZXTzRIKzJYWTBJZ3Vp?=
 =?utf-8?B?d05WSjlBVTIzeXRoNjJFUzJPMnVYVG5HaDBEOVFGdThrOWgxbEpyN1kyWnBq?=
 =?utf-8?B?S2xudlJJNlVaTzEzSEZjTkV0L2REU000MkxLYklGZy9oNCtUVlYrb2hWd3Vh?=
 =?utf-8?B?ZWNsYVIvKzRVNDdrTit0TGx6cWw1WE0xKzlMTUNDdGwwSVllM0NnbTJDOE9O?=
 =?utf-8?B?aEVlSkNZcUFoZXdlM3IrNTc0TmpVci95VC9LL2hjT25iK0VVanVoWldDZ1lE?=
 =?utf-8?B?QnBaWGNGN3RrdUUyK1Y5N0ZwWUEyNEFZRUUxSzREbW9UOWZESzBkL05HQ0Fq?=
 =?utf-8?B?ak5GYWNZVUMzUFpJOUN3Szl2ZFVmdkxtOCtySUw5U09CQlp1d3piNWNSZnZO?=
 =?utf-8?B?Wjdsc2I2eFl0Q2kvNVA3aG1hZEV6Q29janZwZnE4emJYaVFHbU5JTUl0TjV0?=
 =?utf-8?B?UkJLeFZhMjhIT2JPdkdEZlVDYklHazZhVlkzaVcxQ2ROSU9WVWxwV09LKzRJ?=
 =?utf-8?B?WlpibGxKOGZIZFR0bE1GRWJUUjkxbzdxR1pCTWQ3cW1TM2dUamFqaWVZRE5T?=
 =?utf-8?B?Q1dDOXhHN0RFSVNldHB4UjVzTGplVlF5REw0OFZKVHhTbkdOZkxsZkxPMmdz?=
 =?utf-8?B?OUUrQUNmaHhLc0dMZG91cC93MXNON0hiZGdrUTZwL0NPbFBxczk1Uk9ySkN5?=
 =?utf-8?B?cy9wbXQ0bmprQkZHMGdBUzJXcXB2MVcyb0RxbGhlL0lPVFlSREJqZVNKRGFV?=
 =?utf-8?B?ZmJhK3J1NlZpTytSNkQrQXc5Z0RYRlB1ZHovdUlLYks3V3R4M3dyQ1ZWQjlu?=
 =?utf-8?B?MGZBbUdZdXpXM0VYR3g1aGhoWlJLaDRkQkh3dFJadEZBdi9lWmdvTmxId0Uv?=
 =?utf-8?B?dU4wd293cG43MDhLcDdjY2pQc0lxeGplb2lhSzVqb1VvVTc1TjliN2EzN3pI?=
 =?utf-8?B?US9ZZTVJTUhUVHhOa1MvcTRCekVOV1l0anJZQi8ybkZhVVhkd2t3RUF3UTdY?=
 =?utf-8?B?UnpzL1M5d0dBU2hGZ2FUU2U3N1ZQUWVnbEZMWnRNQUt1MlRDbXN3cjNpTitE?=
 =?utf-8?B?UG9Obk8vam00ak5oR2RVV2tuZFlHNFRHaGFWS1ZjNE13UXpranBiYkJyNFFw?=
 =?utf-8?B?aTNZN0dueTNLWWZrVWJ3SmhKT0JVdGxlcXd6bkgrLzRuTlB3Q25YWHNxVXNS?=
 =?utf-8?B?cTJiUCsxV3hYMlpvdnFTQ2Q3UjEvNDJjbHR2SVFGRkI0SS9Ib2Y1MUpqYS9y?=
 =?utf-8?B?WG1HdDBuZXdMRjhMVTd1ZHk0L3c1SkIvU2RPQTZ2N3QxakJLdW5WYUh0d2hy?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e30ef2-abff-45d3-f99c-08daacfc9caf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:38.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx3+qW/IhZv1NTGFlZC3EajunSxJ5IB0skIl4Fnnbn4ZKuzrS4qeedMqs4oE1h6OnjseWSbeyNTLi63eMU0OkcnsYBtLYIPVZgvaqYYK8oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-posix.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 88e0d0fe24..f5b9e5c530 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2122,7 +2122,9 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
 
     return processed;
 }
+#endif /* __linux__ */
 
+#if defined(__linux__) || defined(__FreeBSD__)
 void qmp_guest_set_user_password(const char *username,
                                  const char *password,
                                  bool crypted,
@@ -2156,10 +2158,15 @@ void qmp_guest_set_user_password(const char *username,
         goto out;
     }
 
+#ifdef __FreeBSD__
+    chpasswddata = g_strdup(rawpasswddata);
+    passwd_path = g_find_program_in_path("pw");
+#else
     chpasswddata = g_strdup_printf("%s:%s\n", username, rawpasswddata);
-    chpasswdlen = strlen(chpasswddata);
-
     passwd_path = g_find_program_in_path("chpasswd");
+#endif
+
+    chpasswdlen = strlen(chpasswddata);
 
     if (!passwd_path) {
         error_setg(errp, "cannot find 'passwd' program in PATH");
@@ -2180,11 +2187,17 @@ void qmp_guest_set_user_password(const char *username,
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
+#ifdef __FreeBSD__
+        const char *h_arg;
+        h_arg = (crypted) ? "-H" : "-h";
+        execl(passwd_path, "pw", "usermod", "-n", username, h_arg, "0", NULL);
+#else
         if (crypted) {
             execl(passwd_path, "chpasswd", "-e", NULL);
         } else {
             execl(passwd_path, "chpasswd", NULL);
         }
+#endif
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -2227,7 +2240,17 @@ out:
         close(datafd[1]);
     }
 }
+#else /* __linux__ || __FreeBSD__ */
+void qmp_guest_set_user_password(const char *username,
+                                 const char *password,
+                                 bool crypted,
+                                 Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+}
+#endif /* __linux__ || __FreeBSD__ */
 
+#ifdef __linux__
 static void ga_read_sysfs_file(int dirfd, const char *pathname, char *buf,
                                int size, Error **errp)
 {
@@ -2764,14 +2787,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
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
-- 
2.34.1


