Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413FF6143C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 04:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opiIj-0005w5-GZ; Mon, 31 Oct 2022 23:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83040c2d4b=bin.meng@windriver.com>)
 id 1opiIf-0005uw-Fj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 23:50:53 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83040c2d4b=bin.meng@windriver.com>)
 id 1opiIZ-0002NT-7Z
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 23:50:49 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A13b7pd017002; Mon, 31 Oct 2022 20:50:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=E+vVf60KBPluo63slK4A7B4eqsUIGBRNHyB2g0Cakyc=;
 b=Wk1mPguQjDNOF1Rc0FZKg9g/aGu+9EYl/O2RIdilir6rvhiHxD2BarRcFWC0LEjUrStu
 AgC+9BNcu5GrQdtuNj4jVLy1ib0LA7XCgO4lswTP0KNzLIim+xuP49SV60iEgbufhxPp
 4P+DFavsV+MvywFP2Lxu6GZZ0MIY9qBicyTHeJlLJ54mKmzHOwxoAdjkwwJ64qn+WU2I
 X24zahlaplv724hIzsLJnM/0H4NNtwcFxJztPCLbV/E6xkOBnSE+iMxQ72myXupxlfYz
 V0FDN7bqbLOA2r40YNjdEhila1pjQDzi3ToRwzRMEVr02nTJuMZG/u1uDzBoy7J26Dbh Bw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kh3pkhtxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 20:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ8PI0edVXTOEbnvW7Jqv0SNdEPN3Y3epL2jj3v+rHw0isrJdnSA8o+Q1YCtc/ovJgRXs7DeFqJy0smQtJSmw3umNbkuRUyDPPHFY5n33HeBldB+HN0YmIx2rHLyg0SSEHMpqcZDpCYNfVHNWy7aAJdA02tHjVdawR7mIZO1wGVOOIqcBGUC1TdivNhoF1zQMT8noxjBHvVe3SxhsCH2corQtr6UVw1k/bLU6n22aETbBgv6/bRhivrtw5HDujzWPvb2iLAVrNajOrNcjMqWQbfqDZF85G8ijqa7CA60NpDUlpD8BkRv87NBIjz19SVtKkYnOi2llcRa6ureXROQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+vVf60KBPluo63slK4A7B4eqsUIGBRNHyB2g0Cakyc=;
 b=YyGgBDKx0hvho2DnOm1PIlHWdx72QunCNhD0puP5SDvUzPj5rSFJVLvpqG4bDvdfLhEbw6cBxF5wIeQ6UKVn1BdnAiFoXjjLZ++cvkAePRRJphSB4jm88Ra9xDGY0tQaznT8foE6Md8QnfNPuGsU0lNU5ph+/LnjPzxATedK41Nx/Yh4ksPB0Hp/KLjIITohHHsqd7iuKnPJytDDehWivifO5+72QAgDDMcN5N5e1FifK8NLCNlItyKf8ehzSRR264YhNLuL90whhI5f6mBvOl4t9wujUbcTEnQd+MlbMK4+zlmIKqdmKhzRzpmo8mA8Y+0o0xlGqBpk7JU2qPVCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DS7PR11MB6294.namprd11.prod.outlook.com (2603:10b6:8:96::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Tue, 1 Nov 2022 03:50:37 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::a8d0:d779:db2b:fa86]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::a8d0:d779:db2b:fa86%4]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 03:50:37 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/qtest: migration-test: Enable TLS PSK tests for win32
Date: Tue,  1 Nov 2022 11:50:21 +0800
Message-Id: <20221101035021.729669-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DS7PR11MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7c0e2d-f5c4-48c5-5550-08dabbbc3c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0olh4naCdKWUPhvNKtepfPd1pnH+CHXkYXb4kBe9fvvoeJ30++A8rYal7shzPQ4ZjZw4yEL/p46kfGZ6jNL7R30ZJ8f3m9U92PwJdDROjff/8VDQLw4RR9X+oWipV0JhnCuf/erPI7yCTt4TxgFncOA88Z3xkh+AmdgvU7fybTUmGjU5Si6QivR2qSiGxGWfcOpNWsNwtFdJewy91MOBS6Elcr4Dzl0SQD+VyvrORhVyxZS5KMcjUgLP5io4kYGvePyEMS6y+nhWdTIXKQIEobZp/ULdNJC7dLu3ji7SkUvjuFA6YfoTvqSWm9lYphYH6uVtd2/pm7ZovuYc1YRmj9IrruqWgVztVWuq+l6eCmQn9A4rOLnP+Itg9S4oFaJUziXiNwWdHlN8R9U7+se6Ne9EerJvzdy/WUpjrU3NywPaaWIFMj1WEsW1HnfIzuRCCV8dqXqJVk1G303PxXPYl4yZ94uV1ZcHz8OI4VeM5u1QE2/WEUq5DWQIak00GTG4HWlo5WKIlx7S/xYQJ9OJG9OdnHtAdcmQFfCJNM0xrkHsl/pF/Ju0T+53Y0t8987uNh/O72iNClaVXFddmFSHltR/chMFhXDTPQKP4ng/My6Wsjkl1wNMjXZKWWERpbFsky96JBg4uw03acpvXnQdSl9jXzOrtfA8hMtLo/QFsYxT4PPOPVl+fL8sdvCDGCci/Br7CmexMY8rThyZjKl+y6IB99l2l8NmeJKlDXwWycDDr2uimx6aQgGihjFwtFz/gierP4Z1k/x+JVtnMExyZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(451199015)(36756003)(86362001)(38100700002)(38350700002)(1076003)(83380400001)(6486002)(2906002)(44832011)(6506007)(52116002)(6512007)(26005)(6666004)(2616005)(478600001)(186003)(41300700001)(6916009)(316002)(54906003)(66556008)(66946007)(5660300002)(8676002)(66476007)(4326008)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iH5owYXze8sdJStLefqUFRhFYwu+3mYXvE0yGFk+cUNYjDBMmAf6s3WNnh5r?=
 =?us-ascii?Q?YJFUNbQ+1mi2dWyZDREIYuKhdf0Uuh92ulYHCTkphyuII40XsqoweDaQ4YhQ?=
 =?us-ascii?Q?VS+cvUsT/Fw5M4fCoFiqCZCJkQx3vJx+VMxwFIM7/HRGC88kGtmexTEAspju?=
 =?us-ascii?Q?J49PbrwC7byXulLwkFwJynNTYC84DTJXSTJbfbUjeiI1pd5SrIVTHc+3kbF1?=
 =?us-ascii?Q?66XK3T3IbgQ8G6IaUcby/qjuJpO/pSqEm1J2N8496axZ1SsNilSEB54iP8B+?=
 =?us-ascii?Q?dt2MNpVa+Xs8zJNZmFmhPjI3My3dd4d301COIR7oNLz6y0QtSkTxyvDUMdeW?=
 =?us-ascii?Q?/PSP8isBbx+85eScvU67gDG07x/Ovsn3ZBXFY1ubero9zvKI2gqQ6HU5Q8Cp?=
 =?us-ascii?Q?6Us2ob3cG/l0zNgGX+oZqfLB4AmP/4JMNIf8ijxi2LDJPIcAQHUDS10Q9hzm?=
 =?us-ascii?Q?IE7IBt4lyDsUto0WlZ5+4kMX01b7ljAoiIR/87SSgE6vh2zVCfQdurptNR9h?=
 =?us-ascii?Q?hHdLDI4dlOmlLMQl4t4uYBXWx9N6mlLhofqn6QEOCKG8hCaSUGT7JVFZfmoX?=
 =?us-ascii?Q?b7/tgezTZ4YIXlu6uiDE+XKLZ5NQFCQiNNiiI3T31wZuZEm5RO6ZvC5tW90j?=
 =?us-ascii?Q?npwwQxv+xcuS4o9ESI71A3IraYJc4tUAzZaA5T2wL9uNt4H4IbCtHEC9SIjp?=
 =?us-ascii?Q?Fgn+p6avh+g3zCIwm48L1BFVUPfjl8Tm8NqEz9lDavKXUd9ueKjiAlPqmINt?=
 =?us-ascii?Q?84IB9a8GjL3qLE+0zxBbQdzTUj1Isdis+a5/+ng11LIfTubiQO5fEBzmi49Y?=
 =?us-ascii?Q?BOXBssqpeglbe2hmCwgoylEZStuNey+xRubMZ7/j7hNSH5ANg2y1sJd8GcXN?=
 =?us-ascii?Q?nQrhvaxiB6FMwJmYmt7YOR9IP2RDOheJyHyQIL400bOVrfTJ32vc3V39VL5o?=
 =?us-ascii?Q?2BZHhnG99v9Fz2u+RM05laXbvT8IER/4wqlkHO8rcrwat2RnK7yxiBedQUTc?=
 =?us-ascii?Q?uTIVPSENdTovApW5bMcw8Q/gzZBucxJ4MwW4s1yP0Xugra+FK3Agh2p2orUb?=
 =?us-ascii?Q?2euEjH2h0z4J+bumTaT0I5JwmHm5auqp2kz6qCK1jUkk4QNNyIMJrTa15z8o?=
 =?us-ascii?Q?2Df7MttkvT/1NqEtBpclmdvbop20AOl8cMtcnOXJ6dVolqVpzngshN1v5qhg?=
 =?us-ascii?Q?uCCLTHV1/GmWwakjcnl+XkUETkk/salwj1+8Lt8ZukVR+8viBaQ811fhySeA?=
 =?us-ascii?Q?oKHCv1Nq6QBd+DdhhACMjRvT9FfX8aus+AFW5+D3/Pa2fbQYZKHSMNmj111k?=
 =?us-ascii?Q?+qdkQejxrHhVnMJFyU8kEQt4JAeThDr47QKh0kphLhXwx5pU+YrKEefuC+f/?=
 =?us-ascii?Q?7otzDsA6cpCac3boBqmtw6dzxp2+QK+F2nJfd68blmzxC3/ogBuTalaPFMRw?=
 =?us-ascii?Q?DA3ELYoDp2F+YsamswOcO2D1iEuxit/5IX1NoNSZU3ZuzqXxVM3fusO9Js4F?=
 =?us-ascii?Q?9jzSGLj0D0TiAGTlvq9Kqqm/j7qwB1f6xoObDMhukggyenEjPF7SEtACYzW/?=
 =?us-ascii?Q?DmkBGwR745/nwUmXRddILMqnU9hhtlsj9kHEk7EDypnlkaf1yEz2zWDVPBJ7?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7c0e2d-f5c4-48c5-5550-08dabbbc3c91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 03:50:37.1687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln5tzWi9Fu6ZeOCMViBpG5CL7oANr0h6dttYbYP6RY7OLLpOD2q+l3b2iOcjDZZQmHR+eve8aLe+rup8nt1SzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6294
X-Proofpoint-ORIG-GUID: Sin1o7RFauZqIeWg1SqI4BA3DVz_leOv
X-Proofpoint-GUID: Sin1o7RFauZqIeWg1SqI4BA3DVz_leOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_22,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=714 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010028
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83040c2d4b=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Since commit f1018ea0a30f ("tests: avoid DOS line endings in PSK file"),
the bug of the helper test_tls_psk_init_common() that caused TLS PSK
tests to fail on Windows was fixed. Let's enable these tests on win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/migration-test.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d2eb107f0c..4173403cd6 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1402,7 +1402,6 @@ static void test_precopy_unix_dirty_ring(void)
 }
 
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1415,7 +1414,6 @@ static void test_precopy_unix_tls_psk(void)
 
     test_precopy_common(&args);
 }
-#endif /* _WIN32 */
 
 #ifdef CONFIG_TASN1
 static void test_precopy_unix_tls_x509_default_host(void)
@@ -1524,7 +1522,6 @@ static void test_precopy_tcp_plain(void)
 }
 
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
 static void test_precopy_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1535,7 +1532,6 @@ static void test_precopy_tcp_tls_psk_match(void)
 
     test_precopy_common(&args);
 }
-#endif /* _WIN32 */
 
 static void test_precopy_tcp_tls_psk_mismatch(void)
 {
@@ -1933,7 +1929,6 @@ static void test_multifd_tcp_zstd(void)
 #endif
 
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
 static void *
 test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
                                              QTestState *to)
@@ -1941,7 +1936,6 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
     return test_migrate_tls_psk_start_match(from, to);
 }
-#endif /* _WIN32 */
 
 static void *
 test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
@@ -1993,7 +1987,6 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
 }
 #endif /* CONFIG_TASN1 */
 
-#ifndef _WIN32
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -2003,7 +1996,6 @@ static void test_multifd_tcp_tls_psk_match(void)
     };
     test_precopy_common(&args);
 }
-#endif /* _WIN32 */
 
 static void test_multifd_tcp_tls_psk_mismatch(void)
 {
@@ -2505,10 +2497,8 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
-#endif
 
     if (has_uffd) {
         /*
@@ -2534,10 +2524,8 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
     qtest_add_func("/migration/precopy/tcp/tls/psk/match",
                    test_precopy_tcp_tls_psk_match);
-#endif
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
@@ -2581,10 +2569,8 @@ int main(int argc, char **argv)
                    test_multifd_tcp_zstd);
 #endif
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
     qtest_add_func("/migration/multifd/tcp/tls/psk/match",
                    test_multifd_tcp_tls_psk_match);
-#endif
     qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
                    test_multifd_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
-- 
2.25.1


