Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF25F2E58
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:44:38 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofI05-0002Oi-Bh
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvN-0006TS-CU
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:45 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:34208 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvL-0002U6-KY
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja/g3xOduAAiV7MKbCcVRlmqDP91UWbf/YNLjVj7LN0nONsmVycquRknBT7ff7EX7RyveALg1Xx59gXgfNJQnmeKz3L7Cx8kU9nSTn4X9qNZWoylolZ58oSwt17gVZGlDiFT1/J3bZBJy8KhgBHr+cSPh06S8D86rmtjxiaENTqUqBhOfBytuVTlYiG+iUYjDHU6yoTWnouQ1N8DvrNfUAdza//+9SF7RaFng7PdkkZghjtKLL5TV/HZLUTWLMvj83aiaDRH44B03aXIqfVxYCN1xTmcuXHSGx59AQNQAndo7ZtIQKFavcWcuflw9sifz91RvLEX2/5pX/+rpEXz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AyknErPEb2iK1T9/eiwdanI8x8WzfCDcmkPNgBXRe8=;
 b=B+yiHTCGsMSzkn2fIdQ68u/EM8wjcROlvFujBuKIwcemzJ5ZWwLoz0Q3sBLjUvKapTSAo6xLBdixVl7UNtSn9G6IZb+VGT/1tndn5GXPF8v1sbLkW5ayZ5MxM5Ckx5wJsU8RrSfSB6/SWncrOC2taPoe3vQzi4YGaH9pVRvFuktqkfWxx4/4KyGUWjbP629oMaxEAyxwU5QqxnzyhfClswmtR7LfXOcPGxhixSHhQInEMSEGxqD9A0TX8qWBxk2GeS18dIgD6M2tAkAMmjo8Tfx+cNLfE6sM6a52jBskglRt/K3DW1hS5/mFvt3lKxSWZ8RP3YHLhi3ASXtdNPSv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AyknErPEb2iK1T9/eiwdanI8x8WzfCDcmkPNgBXRe8=;
 b=nmhWMmAhmTxV2T/nSi8iY87e/J2QKyfQQhHyhRi/2A9eqnYR4bGXoeD5D6u0wEGWw5bYWIlWOk3NfrZ86KQjldd3h4Oo7TPZPMYNq962ucMFOWhTKkctftZuq131kjdRz4MKYBARR45ma92dgqz4XVGcVxuFU2/Hsi5Bes55j3KK8bhaRzQ34VR5K/cHy5HVNSG2eEdXepfJh4HrIT+UkEml3aoWvinTbv3yBFkYWLn0VhL/LzH8Bhs+EQXWdY8Q4yALposBu76zw/p/hoVfkUtTENv/RUZrbxtzOfa2C3GGR+zmMp8x4gmIETAgCuksbBYqxhYEFYXwF3vPlN8Gfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 09:39:24 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:24 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 5/7] qga: Add support for user password setting in FreeBSD
Date: Mon,  3 Oct 2022 11:39:09 +0200
Message-Id: <20221003093911.1844031-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5ecf0f-08dd-4efe-5715-08daa52327dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFhFPQCFN0wUrfrL5WYNOnPw2CCpMOm+OvvNCCT+wYKD9lCXDvjjADO4Y+Z60LeOjbj3mYK/saC46GBI4WxQTB2G45YP9fSkSXb8qUgomLgR7gXZArwACHqomqh4bQ95VzbSci2GeGjLYg864+kODwbIBEj4oSAVCz5S+w9qVWw/UhsY5y2+/WpjDPPhliaM1+mJz6/rwzRmpCCFj5p6Xi3VEP8e8YLwVZ648/6xK6bss7mDNrtHRRezu7url/qcXeTTlnTtx1knamyf0RMGsIgvzihDZIybL7CW8lukwnaj5lZEwc11V60skAGLvKY8skAgDHbetLVNcolrZvCh4EG4efMGF41LouNXeqXaiXOJ52tqeqJnKjNhjKS7pGvXZHNnWIL6ugJ0PvcHVmdHYPLVnCfCeEI3D3/WTfX/kXKYnOrLXpVr20J7IkGAS4zb6M6PIWJkjE+/tt01duBYZtBMGo0qMkXwuY5KgN+QaSDt7VbBdVDfqiUzhrWf8qYEDeexn2ZhpNlcRuSaHBNhtYh91jroQWoV6bu9hyiiitlMIgdIDemMThVdm0BivObi+E37moymVD91DcUKtFjIjgW8Z/nCt8aMYwhKFxmEyboU3P87nEaNDZn3CVUbQD9wI3l9MmiQXW0EkaCjNHgRpUOHlbEsNFFP6WNrkDrj1I5ke3wu+wwYVBdvAWz0gM4Ef/pYzE2zICdkEWNv84NC0ofwos/DDnMTjjVdYUZgq8eXKjN5cUEVq46gQ+6vJp36
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(83380400001)(1076003)(44832011)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/WefOAu8DQzqIYLWqZJozUIf8AO+oMsnhZxjrbdMxpOB0PiRyZuPJDxHrj4K?=
 =?us-ascii?Q?y7owJMUWb1vJVjFWReDTWKkzecnq9JsGjm5mtk23lri/jlvHdrmYIWc2QLyE?=
 =?us-ascii?Q?octnaXrFJJhVsHSCicYsW53ZvuVpG3UzAA2mFhJvRJ+EzIaACZWdQS6Eh9jA?=
 =?us-ascii?Q?eLlD7H06fDfHrklLD+MwhQ0Y+Q9WG3KQz5ZoiaUAzFU8SKiBiXK6lM75Q5/w?=
 =?us-ascii?Q?ckxjwf5VfG3jhTpVSEaAwoQ39kfi+h/k8Tt5i7kc9GGQpjHh/6R9iJ4/QuAG?=
 =?us-ascii?Q?HPH7vA/QZzE1+UfzVg1MW80ZAF3CJ2RFN7e5bGGepuPT2KfRUYZ0bwywLgFu?=
 =?us-ascii?Q?OQDQtB/evqGvRjI18/k8PVDG8LIKetEi2SjdUXMnjmOWL3/pWKjR0svWuJDA?=
 =?us-ascii?Q?tsD+4NzTrcscoGuKjjIMD4nsccHeO1fRW3kp0Anpm2lxJWFjJZRafMrrrNHd?=
 =?us-ascii?Q?4QPJ79df/6QrQTXM4fVB5x7teNrW4ul/5HVXsVI939M3fz1vkxmm72MSLO2N?=
 =?us-ascii?Q?lNKRRB4xVv11kEiTl98FAL6pLYRhSOMdLUVmoQsbl5P0tumcyaJBq6cISsHM?=
 =?us-ascii?Q?rbNgM5HhrHgfI/QzyZHaD0KJs2zFtniLhyjOTvV+qnbkEBJElDb/NzCDXtBZ?=
 =?us-ascii?Q?XG2sKz/OpEqbO80zCIf9LhgRljG51hcivW6VA3UGhSQyF+f0SsaCkZvId7XK?=
 =?us-ascii?Q?7F1d3UnyjPsJ0gkUzWXivVLwi9j4/Tiwpqchh0DnIB1qPTvO/t3NcIdePcmx?=
 =?us-ascii?Q?ARwDItFkzXOSfN0e2fTqufjEf+muKQR8SjIlzzbGdmTisXpBgv1rIRtGqgDq?=
 =?us-ascii?Q?pv7MSDlWZpN5J2pQH3Mf5a8G0BKWEtd7Clsxo9AuI8mOEW4LxRth2Ne73B1d?=
 =?us-ascii?Q?ywXSqg0hFKaTORxfv+eNgrxHhGCSK7uyBdTrST0/5ju863ZZcQgprch3HTB8?=
 =?us-ascii?Q?Twe5WXqmACPCkfRSaz3Mc+XN6g78mwDAPEt1tAufIRaxZKongdzNFKTtlBiT?=
 =?us-ascii?Q?xsUB8GUEi6+8l5H1nT4iBmKcwPiTB2T918lEJSp6KmiXdsByIoV9fl/zi6sd?=
 =?us-ascii?Q?duw/zEviWiQ2EJ/xi+/5MfckIR8W7M8cUnHBuwTdxYQEw6DKJUQ/A2MrQugi?=
 =?us-ascii?Q?kIp3prgnCmXjXVHqYTW2FBBZeZRagJq4sHz1zLex1YjnCye4smat6tl5cP/v?=
 =?us-ascii?Q?EN6gnqQHrt5WRrTJjD/tV5yBaBAQxsoN1lMPTj0TIABpyiYHDJ9grQNv72Xc?=
 =?us-ascii?Q?82By4aTO56u4DTdpFx3w0E6bcal2ZHI/UPq/OFAmoLEeJHH19quIROk/dpVP?=
 =?us-ascii?Q?jT0uBHAvPM9n1+nn/nXfJut+wXcEVYj2PijwNqZCsOj1WOL7SqFDVhVFTRfC?=
 =?us-ascii?Q?B7XlweWXRGgw06SX8m6vjl5iLPOuyEWm7Is/ygCGIeIYR4M66R+lmF3VKMQz?=
 =?us-ascii?Q?RUlmftlMUKkh5XpCp3PfXsde+G4zdV875ZfNp4EJttCLeY+FXpZPfGhyYxEW?=
 =?us-ascii?Q?VfTH20ZDbeDONiY+L50Tdy7dujPh10LaEEk4HHzgctPvA+UDsbAlBls8w5g0?=
 =?us-ascii?Q?r0ZTOA+OfAl73p2J/T5DmClUf6qfsysWDQfh9uMpzltbS1eUJcosxnjiqGxf?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5ecf0f-08dd-4efe-5715-08daa52327dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:23.8695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udYl6pZF1ijJMsft3ldIRkrv2G+qJynRdUDUjvvdDY4ZMPF43cPLb6ApO6nHQSSBu56mODAa8qDU1bseLjcWq9ZGTJlAcNnxMtQhu7itodM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Received-SPF: pass client-ip=40.107.8.119;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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


