Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF46D0C71
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 19:14:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvqN-00043P-O9; Thu, 30 Mar 2023 13:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phvqH-000433-QO
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:13:42 -0400
Received: from mail-psaapc01acsn20806.outbound.protection.outlook.com
 ([2a01:111:f400:feae::806]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phvqF-0006hB-Vw
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:13:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S++XMXjEEHBAmpFvwQyd0LMfSD3g/aAlcVU1CnTJTRj6kXJyD8oxbumyajojcHWjkU1aOzMKJj1Qi4908c64VU7aqzMBZWrQPeakCyhhwpaFSJf68FZT13NxDwthKqWkIPAc5cC+b3uksKoNZsFzkMs/GGf0cjYpnjtkpQ2FxZ/8+P3N6a3ME+qtv/YiAkMTd+NSOPUQ6WN43SEi5l5OnK/Zh3sNH6vdvDFtAccu+05f8FyGSCYxvGeepQIfiNQtrkDwT9TaPWTpAsKKDZHIf49J1Y01f4GBCQ/fpPD98rJB2ZFK/SdF683JB9HokvtTmZ4C7Tx0bDftMRasLaaLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcKSB818sAbhow/w7dlFfkvXqb/eBZCpRfXoKCQSzHY=;
 b=PnTuwEwZJ+GTk5fwewstsX60g7j0sY+PCaUFwwheQNfwYEadJ4uxSvzBOZDuFRtYTTrV5ViQNUXs3MfmQSpCqMeKNTTFjNuHtuyTrKh8XnqxEOpv+eXGZFDpvIxO6g3B9Q304h+9mqTzdueNJRNLHSh18zmNSUBLKJ3K9x2V61vgDNEXXSmNq7h8+Xoes8Yt1EXFGAlos7q2N6KbX1ROQ+qkpkKf8r4i5pEINYDksaGCHE83ziffoTDIB0xJuKatoOyRYR5TTp0+OEp2NecL2WbA6BKOvYJ5vvvuJJUFpCWVg5YKfsSEDp25uiENeUJ4jkl3EC6+XSl2oiNw7aF//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TY0PR06MB5331.apcprd06.prod.outlook.com (2603:1096:400:214::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 17:13:34 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6222.034; Thu, 30 Mar 2023
 17:13:34 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH v3 1/4] util: Add thread-safe qemu_strerror() function
Date: Fri, 31 Mar 2023 02:13:19 +0900
Message-ID: <TYZPR06MB5418A6BDB94FB0D97ABA31299D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [5BSn83azn8RjFd0Lqhf4BJwyY/Qun3s6xok93c0dtgzgAeqkGihO9czfKHqRvk38]
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <1027069ce3aba1a9a8208d0c74e4bb8a073e132e.1680195348.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TY0PR06MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: a2263591-20d8-41fa-5ea6-08db314217b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SDgKIQ7Q0W2RwjYdIXyuYabzSu+4ZmR/TkKHd0qwRSST5Zm0bN39nGgdvL6uYXKsBzostAIMMHzi7DTzjoKWlLWeUy/Mm9dQUyHNQ9SicqnV4w4ZMnrKuRrnH2JSRYFck1h1Ro+NVWeTXpLeIlEUmtPmZG3wUVYU+i5AiApdBqP0/EIqVOpc1x1srqbLkZx0LAbJmxRz4TvudY4kY9/1kvAdoOJTV79ma3AxawcdbMiDl8c+11U2RswXGNmqIKgsD177a03xs9UIWUkeXecspDgGG22wJoy26SGrQEGlb7F9MQ1yTNK9jCrPEjn2XA91PqFcybzPc09qVIqDcCmAuKsRNr75PfJX0gb1E8gWfGHhDFqg5mE2R8gcIIpRRUz0kZilsUJ1uA9u6zS0Cql6OXiMJQWIM46G/pN99s/ml2LyzPAzWlLxLdsEEx/Zw44gmJl+duColoZ6iFGtTu95fKF+I/Oyehf5QIUVIkPrzsh/x+z2qBPiKILFAYD6bhN1bnUeJdHNGVppTkz6Ixj2T/wq2FceAR5wir5yRi4TPS9h7lIoRMt1L9I3rBJ68VJy4blI0xYBOCiuiSFw1GK3V9T6l2Kts1bFHglj+apb1A=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UnsWuwc36xoWNn4/hLFOZyCwhcKOSw6s2ncvk9qsvWLv18eKP/OJrfvEDWFH?=
 =?us-ascii?Q?k/Hz6O1YAx3XkQsfafFm0v1KhOyQZQcdyAB85zR1cCmqLn+M962/MncLn5q7?=
 =?us-ascii?Q?UH0PZQ6t35wscZ+TFFSs/ok8T4NR/BC8k65ZTW98q3nQLSuJwLpoDlGj9JdF?=
 =?us-ascii?Q?khylLaMlg7W2Nwi97de9aaflh6m48IjRr+Em/Cpz0l0WaNp7WOGfDTAT1eHo?=
 =?us-ascii?Q?AtHxEqvSeW6W97urteXDcZOKgVkS55lDk7s4s5eYgUVJ+FYK2SeF7tn5MIwq?=
 =?us-ascii?Q?I1JPg8QdZBMCelaxqhhaG+r3zU09Q4TQDL7sxOZ/iLp9+G+kyes3V8oXuiyJ?=
 =?us-ascii?Q?QfX8htt2/NkwME6Lf3/hF0mKRNugIqgAXNBeE22MtH4HBvdEK3VVt685v4FG?=
 =?us-ascii?Q?cZ86vZveCf7EcNuS9A8iRFbRKxZUl834zjMPptExg8enycBav4EDyeQ6qf3O?=
 =?us-ascii?Q?B0xohwvEJYnYqD8NSiC8b8vGsCbEzKWNow5M3d9cky2fb6grxwwsVbnQWsQV?=
 =?us-ascii?Q?l+F8O5Mvky0uCaavUCW/xjf9UsCPEfbiMgSmSo5/QekUjsMgC4iw/dy6ozCV?=
 =?us-ascii?Q?xWl16mnfp8SzwV7vbQFnwIVIqO37PtFqIvaeALzZOrw11gFv/FlFtCmV0EIA?=
 =?us-ascii?Q?D03l+wjKvFzEUlPe12RRBr3lGm5cdUqaW+l+SXJzrh7ixh1c+hQzbwNozBuf?=
 =?us-ascii?Q?5RKA8RU1XX3DyBdo8n5js1zZFsBB4v73lB+guyvqhXpVv7vMD9WX5/PbB8JN?=
 =?us-ascii?Q?AjxqIVEweQzglHkVNvrHBAVwdqrdpKtiK5h3fxzkhOmR23zMz6qhp4IeQ6/i?=
 =?us-ascii?Q?n9KX9EykbUf2YB+RSuPXzO+w7h8Qow+xYfdx6e8ijAwA24l1V6gKziG+N3Z4?=
 =?us-ascii?Q?gHFnGPDDBSoBEalZJNTjhSNwBV6iFW8IUQXvEHC5QBQ7Kys7dG89exeTkEiW?=
 =?us-ascii?Q?UCfjAEzBJvFo2c+iMPoO0PDH9UKF2vMwAkgHTFGVZShZpT/Izknktw2lKDDv?=
 =?us-ascii?Q?SlUlAPz6jl9SOD7bpfZr3hk5S6/OwRmpw8z4Ybck71C7XdcLwaNUcx5K4Kcq?=
 =?us-ascii?Q?MwKlQXaoCclWt1ol/DeYKlqmUZaX19r9aQlAes8o0pDhGv7LdpqQZWOLFCnE?=
 =?us-ascii?Q?+ifzYaUTD3P3CbA7xo9YVc6t+71+NSzFK2tuXlIh0ueYkcu7OxheK0rTYgW/?=
 =?us-ascii?Q?H3vLCjntSYOV4uyXQCMkxkYM1kggQGJkwMdaaEIwfNDYE8TDp70GVI+gnm0g?=
 =?us-ascii?Q?phPOoov9cPwE4unfY5ThxrE/oI8jIPKSbAySuzo0Yw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a2263591-20d8-41fa-5ea6-08db314217b6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 17:13:34.0089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5331
Received-SPF: pass client-ip=2a01:111:f400:feae::806;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add qemu_strerror() which follows the POSIX specification for
strerror(). While strerror() is not guaranteed to be thread-safe, this
function is thread-safe.

This function is added to solve the following issue:
https://gitlab.com/qemu-project/qemu/-/issues/416

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
---
 include/qemu/cutils.h | 20 ++++++++++++++++++
 util/cutils.c         | 49 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

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
index 5887e74414..571edd768b 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -131,6 +131,55 @@ int qemu_strnlen(const char *s, int max_len)
     return i;
 }
 
+/**
+ * It assumes the length of error descriptions are at most 1024.
+ * The concern of write buffer overflow is cared by strerror_r().
+ */
+static __thread char qemu_strerror_buf[1024];
+
+#if (_POSIX_C_SOURCE >= 200112L) && !_GNU_SOURCE
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
+    if (is_error == 0) {
+        return qemu_strerror_buf;
+    }
+
+    /**
+     * handle the error occured in strerror_r
+     *
+     * If is_error is greater than 0, errno might not be updated by
+     * strerror_r. Otherwise, errno is updated.
+     */
+    if (is_error > 0) {
+        errno = is_error;
+    }
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


