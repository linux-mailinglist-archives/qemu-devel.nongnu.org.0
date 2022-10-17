Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7F60080D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:50:00 +0200 (CEST)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKso-0000rh-QQ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYU-0004PH-Ng
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:28:58 -0400
Received: from mail-eopbgr00109.outbound.protection.outlook.com
 ([40.107.0.109]:35648 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYF-0001HN-G3
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:28:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKA+Lh9N1OFLSPHGyxRjo7EJnSTwhrgijvr4ErqukTzih4vDRbvsdN1RLW6lQ9CUfGvI8nH2MC1qvjO3hRaVhtH9OhQocKiXvxRFFC3zTUhjaS0qWN6FhTX+GfbO0VqxYUNO63Grc3kf59iiXGOW0b1JDbhGG5krK69yjjtpyYVZDZ+k5w5s2xboXQcRA/Tf3sPBC3UN3CIInvrCE/wwYMT5NzIzeGW78yuJqSBQ0U+yl3CcAjckxtQOj62HXp89+RCVVlODU9iutSKR53WqIXc0RgnqDEHytfQLqVIyo3c6KIH+2/zl537rJSUFjYrGDlfElOAJAzV2rrID0aWcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q3/Bc7F321/DYdYUKBzwEL+ZcqV9hd6HNm5kUp3zdI=;
 b=YDHMkDh+sr60b5+z/4rr04wMKnjVA/4V2CxUcl1PGLCQ78jG81sL/7ToNsxug97bBAleM4GSyf1sKtIRsnudGE2Ny2yD2epMX1g4Bob/1ffxdb1W17fsYngoNdjDiCA2ObCD9cCgDoIOPl9HGNaPY6TmAdY5Iv4tQ5Z6/OZArLEctnrIlHX4M5R0fDMcrXCpWovLripONuz+hXQMLHv5eF9YYA7Wlat6MvnMsC674vWK2ILpb66Rdocrmm93BmljaSePxwG757MlFwM91u4eG5O7ik0Uk3FuH739mC48oZAScvS7FXERI+M6vCl5nbG0bFQpBOUlmQ2eKbDVxb70+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q3/Bc7F321/DYdYUKBzwEL+ZcqV9hd6HNm5kUp3zdI=;
 b=uRs+IX8Z7KcKjmZVT062E4v3ZO2QbX25EVmWStIiLak6XiIzLrLsLXEB9EgrFPbTDsH3K6Mh5hZSQ1tkjITIHZGhklMtxcmIfJbX4/QMsfD7G937tGnFg6Dv4H3PaNeXVrrHYDIveRFmJaGqjoMcdwUUoQQfGYpbXsC7Hk25CWfywt42t6Z8smF2vS6R7YLl0OCxHCM2Bxt+Iz8gZvV/oan5mvcDoD5k61aN8c+WMoLx1mZHVr+j6ERXamHC+5oAJqxK8/NhIcUehxuvkFXXcW9EPJLddmQ7lqPqWSw0OjIYGPpDpDnZkRjtmErDjQpYfgE1slksw/YeGYK79ZAD8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by GV2PR08MB8653.eurprd08.prod.outlook.com (2603:10a6:150:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 07:28:40 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:39 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 5/7] qga: Add support for user password setting in FreeBSD
Date: Mon, 17 Oct 2022 09:28:23 +0200
Message-Id: <20221017072825.72867-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|GV2PR08MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: e086770f-661f-46b5-2e23-08dab0113647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1AVdaJ8WrlHM/wh5iEVPouJCQQ/OuUTNEE7jDHcLtWdDQOMolzcV64r7b9k+INiWmMijWXJo1qm2Sg8SsijXfvQpo6TPicKrhtdQSRY6JAY7xZolgIeGLv6CyAd0YnctrD3BQafL03Bu6qF01Z25v5dmHJDhhbznT1lW+44x2pYDDPCxX2OzIv/sY+3c4ELvSFOUR8QKF0R57wbj+CccIGRZ/5U7Q/4q6ePjXcm11sPSrzCYsa5eGBpw//F/eQufa4nc6qAaS4KdF3107uiVttc0k8ux07ibQvJuY7fiwd4OXZr0Q6gqaTYfVYQ6EIV9kL8FnQ9liGsknVLF8EoE7TlXI8IksZgFbH8sHCarF/1H2eAje9iOi9D42durj8jO83FfQMTAW4i0XTbsezu81h5TQw9htA1vWYdW8QvjGUdGnpIl9Lb44RmOoXfr+DjI9Ypla9xGXuGDKulw6P4lS7MDMokCfJhKLnQgzdVFwVsN8LVpvT0yGwLWvwa0qGVlWticsem3icW0NtOfPZkBUsC/rrbxLYy0w0pE3Y6byCudYxBHrmINY6MSkjJZpV4Z+7ere/sDqfKry182IKm/Z3shm4xApXzZTTacvrd2RMm2hoQlr68J+MT+ZbHckcDW41UllFCeuRQzlfpVosUaqTQp+E9xeBof0qY4hF7+mwT9Q54f4gLy5DMplOLs4DG9PDKrwFQE1AXXrSG6E59XbjY2RhwWIkCVAp7mOPIenkMwI4qisDcpCUgdzq9GwtJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(396003)(346002)(366004)(451199015)(36756003)(86362001)(5660300002)(44832011)(2906002)(38100700002)(38350700002)(1076003)(186003)(2616005)(83380400001)(52116002)(6506007)(316002)(26005)(478600001)(6512007)(6916009)(6486002)(66946007)(66556008)(66476007)(41300700001)(4326008)(8936002)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHU5LzZQdDVNWjhHRlZUNVY2V3J1Z0N0b1dqbUVLRngwbzYvaDRjaEVOV2FZ?=
 =?utf-8?B?YU9naTdhVi9BYU02V2ZjVFljbzNuZFdtbDJYOFJtaDV1UzcwK04rTDJSK1Ru?=
 =?utf-8?B?UXdkVnVCWjlUbDlmY1U3dkRIRUZXekJMRE5ZWnFmRVc1TzA1WmVoV0FwK216?=
 =?utf-8?B?WVN4bko3Qkd0M3VocW54aHNoemxPUHF5RDJIbStZMXRhWkd6KzYweDQxTDcz?=
 =?utf-8?B?SlU5cHZlTmt1NXhReFZrU0V0dER1YUZjZWZzT1VWWnczOHFjU3RRM3EyNkRH?=
 =?utf-8?B?OFpia3Q5YnVRLytCRW9iN2RXbGsxVVVVeS9ZdzMwM3NaQ25PYUtZbHRnaUNB?=
 =?utf-8?B?VjRzS2N3a3dMSi9nNUFLQno5bVkrSnJvNUZJS2xFS25CSFpYSmJaSnpJMUlt?=
 =?utf-8?B?aTkyTWtoZDZJL1NvVWF6TGJYTlFTT2JydklnSnloRFpmSnF4bHFQcGVHR0JQ?=
 =?utf-8?B?RjVVTUE4WG5MbFpRZTlqOUVkTzU4VUZla25UWW8xTjVPOXNKeGxsZFVuY29q?=
 =?utf-8?B?U3ZFYUlvRC9ublYxT2dObTRtdzZTemQvajhEbWlKdGpGNU80RzFycHpCNjMy?=
 =?utf-8?B?b2tCQ1VHWFh2VnRHUEowRi83ZS9adWFoSC9LaVc0MDMwYjd5S2dZK2cwcVRK?=
 =?utf-8?B?ak1nRUZuNzZjVU5nWXJvSmhmWjRGRENIUXhUOStRSVNheGQ0S0ZiU1BmaWdz?=
 =?utf-8?B?WjVGSHFQNC9qZ2xpQW4zWFl2T2hJeXVGU1A1R3IvQkxrTmQ5MkdvbmoyNVBX?=
 =?utf-8?B?N3dJMWY5L0hYd0REaXlDdUdJV1hOK0NXUHkweGhMaVFlQW9xRHRXNFZmbmF5?=
 =?utf-8?B?WVNpNW9DTkZiRjl3UlN1TktGQkQ1M1lRMWNSNHZjZmtzK0dTNVVlRWdzK0U1?=
 =?utf-8?B?bk5TbithZkhjTjJXTklqVkZTc1ErU3NFZ1dqU0RqZ3RRRVpNWlg3aWVyaWFp?=
 =?utf-8?B?aUJPSnY4RlR0WDhzZXJiMWYyd0JtS3NDdEl5UC9ZMjRBeXJPaHlkd1Nsemoy?=
 =?utf-8?B?dVB1bnZUT2VQTHBza3ZsZk5KTTBhaGVENlRNQVJ6MlBrS1hDd3hFQW9rV014?=
 =?utf-8?B?dTNVV1JCRjBoam45WWdTMVB4Z2hxcnJJTEF0eTVVV3VUdWp0RFlpTEdtcEV5?=
 =?utf-8?B?OTljdEVxMmRaZEg1U0FISTYvdjlMYlpIcVpSZWZNR1B1WnJmaVNOZFd0cUxs?=
 =?utf-8?B?eFVxR0ZMQ1dPdGpwbHFYYUhka2g0aFF5dVQ3N1Zac3dEYkdldFlZczN4ZzEw?=
 =?utf-8?B?OFVzVjY3UFN6cGNTb0dGS3VQQmh4aG0va2JrOW1WazdnQjVjM0dnT09ob3BB?=
 =?utf-8?B?alQwRUdRN3Z4NS9ycXR1SnhSaC9zMlFkcExON2h6TXJaeGNHd0lLbE5zc0Rk?=
 =?utf-8?B?UmZFdTZQWksrTHhrUWlUWHJWSGZmWFIrNUd4Q2JHcWFlYTA5bnBCQnRYWUx5?=
 =?utf-8?B?YjB1QWZJK1gvL1A2bGRPVmtZbHZwVEIwelc0Qi9zaUVwN1oyK05wOC9ITHZR?=
 =?utf-8?B?WS9XbU5ISk9BNGpqTklLY2FvSXUvMDV2aUJoNkRFV3ArUmI4eDdRaURqN2gy?=
 =?utf-8?B?dy8yYTYrdCt3NU1Gc1oycFEwY3dUOXBrbWdkU3B4VUNGT1JTY3VadkpKenpE?=
 =?utf-8?B?eVMwcGR5bUhVbVdXNGhubnZYeFdXcmtORGorRVd1NDgwbFBVczBpUDJPS09C?=
 =?utf-8?B?WXEvb1R1a0srdEQ3dWR5RlBERkdIaTgzZ29RbWt1YTFNUllzRmhPQitDcEJD?=
 =?utf-8?B?NXJwZkpDd29SOEVlTlNWQXV3cDhrQ2VQaGFvcis4N2FKU0NuYkhsS0RuMWNt?=
 =?utf-8?B?S0J2c1VMZjQ4QlV4ei8zR1RLMnN0OHM2M285L0xDd1pZUE1rd1grWUZPVGNY?=
 =?utf-8?B?S25QdkdBc0lkY3JEUVFGTWdnOE0zdkdDcldncFhQT0R5a2dmcTJPTkliUGh5?=
 =?utf-8?B?RDVMbTJSR2VNYVFoOHp6eG1nT1VCUnFEcVc3eGJFTS9YSGdzRVNmanhvMjhl?=
 =?utf-8?B?OTNDa0YvRUNDRXIzTHZOL2lwam83YTRPd0h0N0g5TG1NcHptV2FnWjRwT01j?=
 =?utf-8?B?N0lsU2w3YU1UVkoxWitRL1phdXhudURjMmRxdExyS3F1WVVhbnhNOXB2a0Za?=
 =?utf-8?B?SkxyajhjSkNEMXlBTGpuUGJHMzNsTXA3S2pudWkraHdZZmgzajc2eXV4VkEz?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e086770f-661f-46b5-2e23-08dab0113647
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:39.9163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZmUc3JH5HDsbigM+IJzMCNAgN6L4y2UuaYpviDNTv2waUptDffhSQ9epKSF5KuLMLb0zX2YepjZeqmPq6ln1aZKS9xObGO7XGTscMp3eQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8653
Received-SPF: pass client-ip=40.107.0.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
index b0b467ebdb..e0ee0bea00 100644
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


