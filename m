Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B0302AB8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:51:35 +0100 (CET)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46xa-00068m-Gt
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46ua-0004IX-J3
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:28 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uZ-0004xv-2x
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtqiyaJeFPfEDXdo00oGWIgUlId/GcjoOlHK+r/nXbfkgLUyu2KqNr70xqsNj/3gOBeP2uM8UJHNftomCIuNGObodvI5VRTvXxUS/k5AS1nZWQLm4DUCx/5P6uS8AdlLSaLCrUFq2mVRsAPKOmhsoMA9q3v+ulcp0dKw+fjc811DjdID67E9SmPBofmexR1+NIhkGpyscP771qUsK21ci3KI3nPJtO839uyjGgWaz1AN5hP57pCUfKF5QLE0ZAYe/YEQFy77etpAVDdo+7Sy3N/JFze8l4rdeGAsnI6paJIm5S9i/A65Y6afADOj6aOKeuwVsnERHyxzUnkW8Z+0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hhdo7p/vW8hU3vYuOefZwl0z68bsWvgOfxCNdDUUNg=;
 b=X5N9KbDadgm4grqy8vmDJQ3Gx6d6jN5A0xzCpxYG8gG1cieD3Jle0CvG+X0bqGrJ/Z5GCa8+7Lp3h2JakBuaiw159mjT5RdkG0efLZwaRFdFQXTuzu6M14pIYfuPDtW+EIQ1/2nXisIZD6zo+TBcNyRPZrSR/8S0rRffrN5ryWBt94BDGBNXBza5DLMQC2wVJ/A+qwUToqMtJoZmogw/7D6a6Kt7skWIcDXSpJQ9RcTrtfJCGhEgTTZ1RDAYAjPbKlnqW8dcKmJUiTc1cY3CWD3/B4ZG05kEgrwzgVVMhvCaSxtzmfKQCTFmSAvf0m1iFkEEmOtDMKl6ipyjEbvqyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hhdo7p/vW8hU3vYuOefZwl0z68bsWvgOfxCNdDUUNg=;
 b=UCvLlElxSFw15uAZtsTA70lzFmPl7tUplfFl2bSU2wuCGBgQ9/hoSDw0VbGdRPkFeMSRfUDVF+Jfw+EZdDUjqv4l5se8aGCgkDqbt4/q7ESx2D4BGUl6grjLwyj1YLswC26+Wdpqc8q1v+UYAB8+4o86QOn59UfJW4rVRgo1LWI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:12 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:12 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 4/7] fuzz: log the arguments used to initialize QEMU
Date: Mon, 25 Jan 2021 13:47:53 -0500
Message-Id: <20210125184756.319453-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125184756.319453-1-alxndr@bu.edu>
References: <20210125184756.319453-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76815065-c354-4189-3a3f-08d8c161c472
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB556337E0F3A299EA32D13A69BABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iLXs3A+zRfthvO152Z2HcSGcOtYdpR95nMX2gmCrW5rrp77e6HE7lkgWs6adY92jj/wfLMwH0CI0brFST2YlWfDDKyyw6rAKuM0RuXrVbRx4GBP2DLr1OEHB0i7y/vT4g9N9T6m74iOZV+PX59mXfmXKn0nqRp+C8yQilJ6SRceTNtjARN+JXgqxd25ejQyermBcVtN91QOfc1rj9nm1D4CDhiCJ9QsA80mQMiGhb7iJJON0JN44AwB9yNYEercJOAOtalZDAzM5MiNVZs/eMxE5pMXtCB0T+WEf1segy2UidSNUAhdSw6bVuN/464qBWmjy6nUhj/xQiNKXBxtJuKJS6JkZWkYVeIs9soAVGlxwR8NX7gTMKmQhwM1aleEZRMRG/GpMMnAEK2OVgj4ofg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vXMdfAk6PEq6vkUr+XTyBRI9VoC03BCwv/Vc73gIfgx0UuRS4JUyJGmtoAxR?=
 =?us-ascii?Q?FTnoi1bTYOox1CBMVFzAXfX3Wl7HaW3QJL9PwT8bZov0xpHUu18v3mfwUsIS?=
 =?us-ascii?Q?XbvnmsOw3CbUuSnWge/sYPrAN5rHzW4Cq4S0lPrXc8DBsfNYEc6Afg64MerP?=
 =?us-ascii?Q?IDcW9sOSI9eX9E3clW4/nDiQPOZaxadu538VcBGyeNERuccwlJz9mKVNbMZ1?=
 =?us-ascii?Q?z433N0RM7oBISle/EuZezw6FQYaDew9GQ0eUXMnAaFf6g9tlzuZ1rMlD+gV2?=
 =?us-ascii?Q?Q8aTLlu+heOi/fvkRoE79JXdDXGbyMYtSRPsEQXuKEGq7MRTL3DA9LDNaVMw?=
 =?us-ascii?Q?1qax3ALJC7MtVRcZuDW1aenQrAoCs27RcPOObeugiPZ5Fa93EjRIwmOqmxbF?=
 =?us-ascii?Q?XMsJrNmblXDZimQ4W6KXdoMjOufCKrZXNnH9NpNG7T3yVgk9wXVTNX/krtfc?=
 =?us-ascii?Q?NXlDGzrMOPaSpN5yW94RNXq6usKP+qsmhsR13+NRQ77WNhpcyzUntHqndqee?=
 =?us-ascii?Q?n/e+sn1Y6cBca8BiNDREjShNUIixv9orMA+5m9c0SbZ8Lz4ikl2hN24CvdK3?=
 =?us-ascii?Q?068dJRBrJt0DMTEFE3BPUiMKy4Id3w/jOghKjlFPilgTGh8zocW9tct6cS6R?=
 =?us-ascii?Q?ch8dU5BBQ1Q3/M8VdkeWbG3GzOmez2CkSMQN3ButCK6TL8qI6n9vHFPXZyst?=
 =?us-ascii?Q?hzS+lBQrJ32QGNb/Ss2DGCK4nehjwsfvOci8fi38zY4ebc5gQEb3++372Q8m?=
 =?us-ascii?Q?eLOzZ/xbLd/LSAcB03PhCrmD7MjXdnoHFSg++xomTHDkr4f63PvNTH5wr99j?=
 =?us-ascii?Q?CieUvX3Kao8kszdfSkG9qUpNcyTun+Mld5XUF8HVnTKZ8CiGIa8mypR24xxj?=
 =?us-ascii?Q?Jbm6ns6yDhh/33uttZFK/BkWswq9znSBqAsSYbT3yCRxxPiNGoEGVX7VG84X?=
 =?us-ascii?Q?JglNnfUZfIf2IUxHAZIqrDXCRUJPJTgaeU33iPkvSU6/1PjFlM6MiuVHTATv?=
 =?us-ascii?Q?aH9wVtmkmLT1Rzjr1k+HzhWUetSVUrKAqBzts6VKgmNYH0Q3CT0uhpTg7f2S?=
 =?us-ascii?Q?6SP29SDm?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 76815065-c354-4189-3a3f-08d8c161c472
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:12.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWqwfo5eoGmPhvSO01pZfP40wiZ9KyZOBKPBXEzQ4wak8vMBnkrFPh388AXRixbz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.237.112; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful for building reproducers. Instead checking the code or
the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117201014.271610-3-alxndr@bu.edu>
---
 tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 238866a037..496d11a231 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     char *target_name;
     const char *bindir;
     char *datadir;
+    GString *cmd_line;
+    gchar *pretty_cmd_line;
     bool serialize = false;
 
     /* Initialize qgraph and modules */
@@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     }
 
     /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
-    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
+    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
     g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
                            getenv("QTEST_LOG") ? "" : "-qtest-log none");
 
@@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     wordexp(cmd_line->str, &result, 0);
     g_string_free(cmd_line, true);
 
+    if (getenv("QTEST_LOG")) {
+        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
+        printf("Starting %s with Arguments: %s\n",
+                result.we_wordv[0], pretty_cmd_line);
+        g_free(pretty_cmd_line);
+    }
+
     qemu_init(result.we_wordc, result.we_wordv, NULL);
 
     /* re-enable the rcu atfork, which was previously disabled in qemu_init */
-- 
2.28.0


