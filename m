Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C96B8B6B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:42:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyLn-0007BI-Qh; Tue, 14 Mar 2023 02:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyLl-0007B4-QF
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:41:33 -0400
Received: from mail-tyzapc01olkn2081e.outbound.protection.outlook.com
 ([2a01:111:f403:704b::81e]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyLj-0002cY-F3
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:41:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSTtBfgu+NgNCeGoqIPSJnM9OSKu6Y6d91Jkda/7g8g+cUGpnU0DKbbCTlJOi8s6Sm/giRO2zvRsIiS30Ro3I5/f3SR6LpyEEpruyUYLik+5G0586dTW+42lSO0wFE/Kp9cG/OPdJNUGwGygAhJKH2LwJ7DBxlx4mFY9JDohHaS2REJCMIjRryN4yj22mHdd/WqV1ZuaNkAlwQVJ/VNJvaGqz5KNfFdkIOm6v05Y/z/+52xaysazvpup9MTi1136CsGRDAzvOtn4c2nocALYgCYcObnQOqlmSfaWjWc2ZCMF2qH8+EjTrbsZm1F5r16oo3m+lbUHgCF2kJXrzYhlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Sd8XC3ntktY6qY85agrZT0DXA0S9Txzj4nYaWdkLg=;
 b=C9xs/wU6mM8QH4JDZRPV6iT4aHi1ndkRNJ63EwxCIT5AIi0tZNKBsMLi1rqL+Me4Mg8MtqpAVzMYgMzwdZymAj9L3rhb3ZUJ/NOSGePD2+JZwidKGNGGTcGiORkyu/GuHeiKsw/015GDNqmXcYa/1kQcpmsUAfIi55jNfdL2JnyhJh5ypC+tGc1thGwNc0+i20W7i0I/3mXnCoLmMeNPqa29D1IwutzVw5l5sJQyFMJUioFS2Aa5BcI5R/H7MFl4HCY0LOkqDzUjoZ/5Ce1WPt9HvYDue1FZal7EN/PFpy0QfnhqOc9qGPdmm8zXc/lml7GhYdvbzw07k35L8DBytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by KL1PR06MB6019.apcprd06.prod.outlook.com (2603:1096:820:d1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Tue, 14 Mar
 2023 06:40:49 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:40:48 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yohei Kojima <y-koj@outlook.jp>
Subject: [RFC PATCH v2 1/2] util: Add thread-safe qemu_strerror() function
Date: Tue, 14 Mar 2023 15:40:32 +0900
Message-ID: <TYZPR06MB5418B64D371016CCEDE577419DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678770219.git.y-koj@outlook.jp>
References: <cover.1678770219.git.y-koj@outlook.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [zMyKE2pmFYO1poodyd9ueo3ZnSU7H8UDPDHEZ2WW1/FTSxyloaYMTwYRWe2sLD2/]
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <3d89a554fc274d63d3242fcc56fe135e43e67351.1678770219.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|KL1PR06MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: baadf154-61d5-4737-97c0-08db24570c20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnuH/2rzez3FHB9XeaOZTNpYjuKK8LbXbz6pturbzTj8utvweJCMZa7F8ezt85nC0dUM+8Sh7tc5ipQp3ZYuKu7jdwrDI+qTLkKCJWbBFk8Rd7qai8BCE3mJ0eGGmodoEMmEfwH0RQYKEp+Un1dHLTXOI8F/21o78uFkaQ0mBN4jF1KrqwmT3GhxOkcD1qAHWskcUDP8HDx6QjBFXMbbHuG63Xz0K0KOmmesfloW7y/UeU2OMGFSpFMeLhhJbJXUEJfGIVa4C5RMuRWw5YKBkFK+B07nN7J0NPcLHmk+UXkFjYYKx0qXFMJRqMV004pWvZ8oDPuNsfhFaipiQXsaMNvwgVXnItA+Jv8sZWc40M4wjWgJBJ5bcHf5c8302qDYR9d5ylZqqMXxD6+lDkkRWKnghEPN37Lkh/gk6T4SSoldrmSAlFoOoegDP+I3qFdsE4pr/DcgKJ3hlO/Nico5S5Ft+pbeAAxQjwL+fn1Ziry5kJXSOKdbIka3lTM5Dr+cv11XrVBkT6NGGGyKRzfBW56W0BD96bOMdywj77FSWKzloCsd/pDaEWAwOJLsMoFKCMdeYk8JvzDuBH3qfuyRFNH+TVARFNyIWX1d7CNPUA+iZTgecP0eItPfDMn8m9hqfuUlFBj5yetSyQd1vUXa2w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vykKHXJDsrogsdLW6WExyKGctdttbNHfLVHVYAdjj0hKrAzPfOp6pKp/O6op?=
 =?us-ascii?Q?OZ0+KjNfvf89bxm60IlWyQRBjgJas9/tVp9cYfhqbjZCkB9hEknoghsxEcb9?=
 =?us-ascii?Q?gw3S64xTEFteFB/JEwms3kfrAEpex3xm/7ckoWgi57LNV3ktwJB6R+mzPdK5?=
 =?us-ascii?Q?MbyXWrG0LRxHE1MZX3hQEnSgANV55DkKi6teM+OzRy9A81tA6bVsCgFTJ/DZ?=
 =?us-ascii?Q?6+7YPhv8qwjD6Et2J5DG2OrfIzekyFPrsnBRzNjlz/15SWMQhF+5GyETlppj?=
 =?us-ascii?Q?YjIxiWmNVfzncT7Whf0NxE/WhS6CUQVqsBXjbpeGuoejJ/OySIgurfIZ7rB6?=
 =?us-ascii?Q?e6W0BzT0+N0a7T94psyMrBbJIbQV0G+J/IilBvyTaSfZv0M8Xc4pWIheOFjE?=
 =?us-ascii?Q?PPZAM1fgEh0lq3V7Qfgdqu3eAEQInmbaqU3Ovwvezj6k1hLe61YScIqLedS8?=
 =?us-ascii?Q?1kq7RhPbFfV6mHaYuRlqwsv+pn6YlKshe8Mjl39TlnOh9KXWRStdKK45aWIm?=
 =?us-ascii?Q?eg3/xXjtrl0ZANHiZIYLkFGhDGP5FudRdDknfoxCxb42fWrsjaUuaAjCRIw6?=
 =?us-ascii?Q?Njpf0gFKGeUUROUm0K0yGiNxU+20Qyo1eTvjbSM79nsuHu14T2yQyBAwb/KY?=
 =?us-ascii?Q?fblrNlsXYn6b1sSDQKKjT0SCm6BuoUyNUYgi5TIqsdau4GDyoMIJRaLyJKk+?=
 =?us-ascii?Q?WyS9r3/yRc6sg/MS7ZrCcBprppnJZzRcf95gMfd3YNhIOyijtwiItcJuALJB?=
 =?us-ascii?Q?3JhgsWjPqkVuSt+brLYq9tyZpplr6Lhi/S/fPGtVxD8Aaohm3V76owA9yMWx?=
 =?us-ascii?Q?SSTEXZVI4kg6GmOMLaVpb4UBrDVe+ccL4D8q8K660iYLUi+zoB1mT2NCPSi5?=
 =?us-ascii?Q?8Y+BNcu4IXMOM5oroz9DZyglUoa4P4pNz5AjnGNDGzQCeuPxHrZ/0UerWPyi?=
 =?us-ascii?Q?w23d10XqdX1jTF280QNzjE8k9Q5902opr7zDVr2sI6ldO+T24J8GWTE3vXw3?=
 =?us-ascii?Q?b7FlyLC7Vyf1RwM9jas4Es2Pvj3FwwKqWEukvBtSms2g1UVtUKeqLyMC6uHE?=
 =?us-ascii?Q?FaUmxHp5gPaD08ifk+wly/Y6+zuySeJaKoAb+djJj4u/WteNdlvJx8VqhCUV?=
 =?us-ascii?Q?4n0zMxVAvQzqLcr/MP+kMXfoKWClUIg9AIjnRhox3tRMIl5ZzGto6GzLVs8T?=
 =?us-ascii?Q?5ka3T9+druwBv8ytWzuVkfu7fSS52The73S7+nq6rP31cpT9UwwGlprCZcBJ?=
 =?us-ascii?Q?p6v8xfWWGaMch9lXW4A+6u3YKu5Tqw+PTgbwSANChJ1IsQzignZaGPARljSQ?=
 =?us-ascii?Q?Utex/NKVPUXubHYVA/kHQ2Dz?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: baadf154-61d5-4737-97c0-08db24570c20
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:40:48.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6019
Received-SPF: pass client-ip=2a01:111:f403:704b::81e;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add qemu_strerror() which follows the POSIX specification for
strerror(). While strerror() is not guaranteed to be thread-safe, this
function is thread-safe.

This function is added to solve the following issue:
https://gitlab.com/qemu-project/qemu/-/issues/416

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
---
 include/qemu/cutils.h | 20 +++++++++++++++++++
 util/cutils.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 92c436d8c7..0bcae0049a 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -117,6 +117,26 @@ int stristart(const char *str, const char *val, const char **ptr);
  * Returns: length of @s in bytes, or @max_len, whichever is smaller.
  */
 int qemu_strnlen(const char *s, int max_len);
+/**
+ * qemu_strerror:
+ * @errnum: error number
+ *
+ * Return the pointer to a string that describes errnum, like
+ * strerror(). This function is thread-safe because the buffer for
+ * returned string is allocated per thread.
+ *
+ * This function is thread-safe, but not reentrant. In other words,
+ * if a thread is interrupted by a signal in this function, and the
+ * thread calls this function again in the signal handling, then
+ * the result might be corrupted.
+ *
+ * This function has the same behaviour as the POSIX strerror()
+ * function.
+ *
+ * Returns: the pointer to an error description, or an
+ * "Unknown error nnn" message if errnum is invalid.
+ */
+char *qemu_strerror(int errnum);
 /**
  * qemu_strsep:
  * @input: pointer to string to parse
diff --git a/util/cutils.c b/util/cutils.c
index 5887e74414..3d14f50c75 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -131,6 +131,51 @@ int qemu_strnlen(const char *s, int max_len)
     return i;
 }
 
+/**
+ * It assumes the length of error descriptions are at most 1024.
+ * The concern of write buffer overflow is cared by strerror_r().
+ */
+static __thread char qemu_strerror_buf[1024];
+
+#if (_POSIX_C_SOURCE >= 200112L) && ! _GNU_SOURCE
+/**
+ * In POSIX.1-2001 and after, the return type of strerror_r is int, but
+ * glibc overrides the definition of strerror_r to the old strerror_r
+ * if _GNU_SOURCE is defined. This condition handles it.
+ */
+
+char *qemu_strerror(int errnum)
+{
+    int is_error = strerror_r(errnum, qemu_strerror_buf, 1024);
+
+    if (is_error == 0) return qemu_strerror_buf;
+
+    /**
+     * handle the error occured in strerror_r
+     *
+     * If is_error is greater than 0, errno might not be updated by
+     * strerror_r. Otherwise, errno is updated.
+     */
+    if (is_error > 0) errno = is_error;
+
+    strncpy(qemu_strerror_buf, "Error %d occured\n", errno);
+    return qemu_strerror_buf;
+}
+#else
+/**
+ * In glibc, the return type of strerror_r is char* if _GNU_SOURCE
+ * is defined. In this case, strerror_r returns qemu_strerror_buf iff
+ * some error occured in strerror_r, and otherwise it returns a pointer
+ * to the pre-defined description for errnum.
+ *
+ * This is the same behaviour until POSIX.1-2001.
+ */
+char *qemu_strerror(int errnum)
+{
+    return strerror_r(errnum, qemu_strerror_buf, 1024);
+}
+#endif
+
 char *qemu_strsep(char **input, const char *delim)
 {
     char *result = *input;
-- 
2.39.2


