Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444B6B6AC8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 20:50:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbRhW-0001k3-8M; Sun, 12 Mar 2023 15:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbPBO-0006Rc-73
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:08:30 -0400
Received: from mail-sgaapc01acsn2080b.outbound.protection.outlook.com
 ([2a01:111:f400:feab::80b]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbPBM-0004Lg-GW
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:08:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPgfs+l1AhhDQhGnEtvdici4cyjBGEPDODyBG8vBYtCdAu2iZBZsfwLwUnEkweG2H2QKwf7mUTvt+fg+1kROoh/t8GxVLJ5KDZPRg8IhN0amu+JQ2LSaRED08XAaX9JmTmBrjnX55zs1lqYc3MsDqeR2N0on345eUtZ43W8Tum1CzwxX4b/wTsjQZ8WzgZT6EFEA4O1K2HlDk/+R73i0ZcWPaqbmhMWoZdIFgTGY53O3VBu5AAlVAGQbp1kKxZ0CBjOKCxxOHh5/STYbSbe4NM1QFPgXsvC6rJ8Fi+2r/nksVTUOfXJUtpk109kRUhcNDkR4GEgesydBmUi6Fr2rPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Sd8XC3ntktY6qY85agrZT0DXA0S9Txzj4nYaWdkLg=;
 b=QngwmTKHv0hT8c6hKGajE5yyMAVkL+X+oXo7QFcT98AGZqmW3dHbfGNNpNXJkmtdiRsTvHcITqRSX0iA/Zt7+IlR8tlZm4n+8h4r/7Gm0f60MSoK8DQlFDexDs4KKlyWM/Oz4ezsBAd5H+6hgU42cVshkhEzlybbDySosX/Yd0w2lW/8/U8HaSsdiZstPHSHFw8muVoOBCcHyFbLoGWSFgNT0mYp5NwbFQ6yS+edK15BFG7rHEfH2kz1vEJTEtIskSrBbI6QTN+o3BgSxx0Hr3KXPXRb6JQio9j9XC8lFdVe+4ReXDQvRm67gd05I7+6QzahLLynBW2YDBzoc9hy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SEYPR06MB5280.apcprd06.prod.outlook.com (2603:1096:101:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 17:07:50 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%9]) with mapi id 15.20.6178.019; Sun, 12 Mar 2023
 17:07:50 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH 1/2] util: Add thread-safe qemu_strerror() function
Date: Mon, 13 Mar 2023 02:07:10 +0900
Message-ID: <TYZPR06MB5418D45DD9164F8C337672CD9DB89@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678640194.git.y-koj@outlook.jp>
References: <cover.1678640194.git.y-koj@outlook.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [g9E/NHqxctDkodAJnH0g4cd4W2BOyLaWt7HE9x5j09fhedPBnQ7yBQ/yusODNUl3]
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <1f3c6d87924a20acf0a9d7fc42e30d55c1bcc25c.1678640194.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SEYPR06MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 87da36d4-196f-452a-877c-08db231c4f4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5lMNwer4KFq8yq/W6kWcy546ceq3u0fCHGbYJFISAYtxWQFkhLsZomIwsGlBaeFcOsC/G28B3ojgL94JVxTzS6PtJV/rjPLtiFr7IFzgYLUNTSues4c762X1a3lrOX0nT4Bz3TzT42myvoSDx7CpM4BzLogtByfJqj/9gvcCGmsspUWQNgFLi4NwKS6wpJM2At5t1dFgDE9cn4YP3VW/Yczd4nRZtA7N+u3jbOSZKpP3Lv2GD6xwHh/6ik+ChT/2HnmGdmUj7eMhuuMmJB8e9BafAVMvArTV0kPAfO7W8nsW+GuewyKa6e1IuuMxfua3Y7eXsyq34dvKnKLP3QwMEkFywwlbu9TpaIYG7EUIMKaSIMYz7AQBhOl7XyHffthhpnKCAy44G0VYOG/RGm1yeuQ5Ee9NZ9RDoW3mXZJt4tHCSiPnO5EoXLSFgr8mPG+x6K/9x+Ha6xJOstmA1zYX/3+7UzUAHgve/6viGlBa+AnMTS8RqWuDtkcxnFd41vwQieZmyutIH9PeZMm36wHPhPufJahsWCbRqd7HRAuo4A8WD6S4C65jKYfiuX6naOPt9TpTEphctN98B34Jv15th8azUnHzmqoG2RXPxPeFaUn0cJxoFBhNIdyJwyiwrMpFnFFzDh5+/NNknhAKisKfA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nK3Mf39egNoTqSMYaCUgVmk6WiufzAVIgUaPvKOUHBOxP3OY28PHTG5bNCwb?=
 =?us-ascii?Q?2zLAmvU4kOSIah4LEKSPEqOJcd8C9jB4aCu6vJze4dmUHmwdwMuoeRWrVOR3?=
 =?us-ascii?Q?c+tCzJ5FucybqxQ39gOLRFNzi4kYa1LGQW/Yz99YzoFWhUxTE5FfnyIUPJPg?=
 =?us-ascii?Q?4CWfiU4PT/uoa9ROSjLQnfVTczOv9iqHZZD2FWAGEaIX2ynBEUe8zUEoMNM7?=
 =?us-ascii?Q?xk8TZrJ7KSHI+0a5cFaKccHgK3A0CJvPteKUmga6z1JPwv+DdAVLYehcpqEF?=
 =?us-ascii?Q?+ph5B9tjm+JFfm/0AzZMl1mBtG3JkN8FgXUl4VccRTFE11J7Dl77fAJyVyES?=
 =?us-ascii?Q?2XzorPGtlJ/gBA1+3Gt9lP4P2SslVqQVBnin0/Y2wjP+u2uISeCqRhbds8Kj?=
 =?us-ascii?Q?y+16//euGks+GwRiq4oObVItfjYn8YcUQeUSZFoQo/EmcBH8ejwau4BDWHWI?=
 =?us-ascii?Q?jjG2ENCDMx9NPBZ12Dmzy0GG8LdskhvtB6FjjTAZsf2Y98Gxni4TDcywwKDH?=
 =?us-ascii?Q?z+9UvD+pWA/hT9Daxj+uJL2Kh2lpi8PLdeV70FcbX9Gev41nJI7UfziGdIb1?=
 =?us-ascii?Q?4nmkTMLEurf/EsCD0YOLXTnTdoMKdoZNdiieuDfdrfD/Y6qqdmaWNJiOGter?=
 =?us-ascii?Q?OfWaAcz/o3EMAyZeHMPL5ux4MjC7mJmkLHrCSQsSiMcfEDkzmhoNWf4lL6lM?=
 =?us-ascii?Q?hkB5Ph8CjIoc0C5AZGyYc6ilb6ivKKQ02wLr4hkH/uOR4lVePfF6sPWdM/lh?=
 =?us-ascii?Q?H/SvN/JmWJuu9B7qLH0NFh7BeHsenSyQtdbornUNP8YaW9pptIRuKGicWsX3?=
 =?us-ascii?Q?RDkMTlkY7ikG0+iUVTwq2jC73W7rT+u9Lq73G7q/sgdhbDXS9QY72rdbucgd?=
 =?us-ascii?Q?25sP8Lgq3Te3JwGNPsInT0hxFWOGN+VHB4jt/NKXxKayKl+Npg7VjJDkaPaJ?=
 =?us-ascii?Q?pFTff4gy3f2ho0CYzBpFjXwevhaaaHc7e5yAdrB86V6bvwRbBHJ9h+LOKCso?=
 =?us-ascii?Q?dib4n0Cxu774hNX3hXpqqjkNs7U+7EIrXlwQx/YqPfAsx9DJypnHKcjR4Btt?=
 =?us-ascii?Q?497pLMDfdwpxlou+9T/KR2/19j3imuOv/EsLgtpgt7xBNq8YcuzeYcnzrnlK?=
 =?us-ascii?Q?891eNA5May0kmjSvnPzE2P0dt5EbOAt5l8n3OBwFRZqRuJpKBnkZho5EXktW?=
 =?us-ascii?Q?zGaXDA503lpZ9JqQbY2/a9EtGuR+QNYZVz5SGlxVs7PBMuOitG2zErYstzWa?=
 =?us-ascii?Q?qx/p3XvvmWRNS8QxS32JuFPrFFBAvpZD1SBOrSU8L6LfwQpyq79aA/w4HV6+?=
 =?us-ascii?Q?pGJFG/HDnJOhwAdIEhwFIwCD4rjbZtiUoEkySegioMhcag=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 87da36d4-196f-452a-877c-08db231c4f4a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 17:07:50.0491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5280
Received-SPF: pass client-ip=2a01:111:f400:feab::80b;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 12 Mar 2023 15:49:48 -0400
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


