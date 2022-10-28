Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87988610982
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:06:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRo-0003lW-4l; Fri, 28 Oct 2022 00:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRk-0003ki-FQ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:20 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRi-00026i-7x
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:20 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4wHvC031759; Fri, 28 Oct 2022 04:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=yeE4BaMqTy9r3XtCBfy2Ls2Pu0c0qV3Kyaz6ba5l6k4=;
 b=LB4bAYSPQuSSOTF/jOEhnI8mTziSACqVr0ix0lPqL4m+ifLlhhbvwELTWeEi9fL/CeeL
 nze9a+uWom9vrNLTGKnDIGkKDAri/sc37eGI0a4upqzh9U+MY055YFnFd7DNFv/1gZLC
 5ZAHSAIsX8WF6OJaxhAG4zDvrEGvz2gyCVZLrDPyuh0XwcLWaIkE/PofdFRv51POaDrd
 r1EmAxbIlXv0+3cSY0eybonZEHKvdU6E3GNIHCju4Oqql6vErKpx3RkZdmlLkgrUPOCt
 EFfS70NttbebpTi9XLoX95vwx23ZmFqpRVhKHopMF9M4A6gXkP3+cWshg3k/SoR/05qd Tw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3xh30t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQqpVvYCniIx/8dFV4h5YzZw7MOsmGlhGiORbPWRwR4+yDNSsjcIgdiH3wuihBLa2wFwIAptTgRviq6ZBbDP1NbWoXkwRsPrrA/ROlLbM1FLj3pvu7hJQVLCx9B8B08wBgodcXuEhaJwgFBt2umnHwLl5BFKp4TN2EmjbR0pCujv9xKTV4rg69fOG6d4s/ASs7/p3Hw3fctjiWB1G9r2FBITZ6Xax45cXfxhb/wXvxPjAu5assPScMRpnKFBtNYa3GxPmsksNs5lgaTNi9Gct2kz8knPv0PW/tLb3Eweh74sB7oHndK7z1/jgMYns2aFgmLNPWCCiFt1OKkmSwtVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeE4BaMqTy9r3XtCBfy2Ls2Pu0c0qV3Kyaz6ba5l6k4=;
 b=AJesfZeqLAm7jUPMTP9WADcv39LqaEKPgDMUi7KYmPwj5Ugt1VED6SoSy2p0tMycQ2nAl30pKCg5ltbjPpjgdz4Ioaod7iaM3PyygAcwy5CrU8f+WtzbjI3S+3F8tURCyFQagh8GqBwlusfGzs1Y9DvzwNLj/nJ3tp1E4nWCS2p5EC2B/T3rD8Ib6UVpNmxxDDDtCyym5f+g92tPQLrLWW9GUDb7FEjOXzBAJTIabFZ3wnSEbhU8S6Vz6SpWztZWGNgzdGeu4ieqBGRRjEUSam0Tt7TN4ABfP8RCQkeZLAqFs/H7NmYeWoXg/2c7+wxSvQqMYqma8zoSEPOICXCIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:16 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:16 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 05/11] tests/qtest: Use EXIT_FAILURE instead of magic number
Date: Fri, 28 Oct 2022 12:57:30 +0800
Message-Id: <20221028045736.679903-6-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e83ba4-a53e-448a-1f6e-08dab8a10611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaOXgNG7cAu871E4CEFZquKkd1pWbW6+h8NBZpkVmZJk95+qNRCL8JP5yOXxpWVUsoq8xPVAm61l8nBOylSb5flO0hShm/0GSn+5jc6u9zsp2ze3sZE6uGAKrhpNGwNGuY57LsGy+dDhK7B09CacTym7psc/exlOueXfzXEaDGacwSf8V7taWoBfw9KAQIf9Qb6n+QK1PZxyvJGO1YacEtZGZCkyLH8G1o/O4JXacaKQ/bNijLUgSw6iM+y9aJrE/SQqsmMplqsiOgpskYTmAHP6BTLoM9eaiuPHgZrVK8ct4YPELjP3vWF6KPata9TDbKQEoTwX2hFUXTI5iJRiwZUWmSDFYAeRaZaI54knq+jCkQPtMyOkkb69v6GHr8mnHkywNkZegjmz2Kq4JyjJzVOC63wZa67vnt81tBPrkzuggmt6Abj+7AWpgHqAZreKWt3Qp0H7Sh0/4Z+gwSWtHfqhj+EcO/gL8VjnolxO3W3CRZAQPQmp4NEg9stn0B6+Q15ilVmXjwan0yvNhR1izUk/Kw2EZBEJ8iMtFT3uIssv443UMrgMD+Q9/XYfcRVXlMprdgrAgNhRxi/z/vpCdD45a6r7EBYg767skG1h9UckOPyvPdMLdhMLGvDLJnqTu4ONyg3wtoig2VC9EV+S0PwIVyZiSvdv7ByUvPqPDXjtIHCotW9Mp2ybXA7h3g6IF8QQ5zfz5IoAsmPE0OBeO2tgRwrlyoP/kTgyiX3fpZMwjFR9HDaLWN/3HFFSot1wZAJuCgaKdDVCmdDjMLt/Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6gUCtAITlNgslO19fUU9euR1B219fdtg5L5L9vCs2aft1yBBq22hXns/7nhO?=
 =?us-ascii?Q?gz794+KkHnd29Zif8ssinH6vndYYgakGE/qz/g4MRhJaG+3zdWqfUxemx/ss?=
 =?us-ascii?Q?CMtqNITVkpp8lobrjn9zM0JDAzcZJy5G2IJHqYFA+OfPQQ41j9unQTX2sJim?=
 =?us-ascii?Q?U34/viGinCHZ0n4dTi6NAD1u3Z8bl8Yd+r5DZrztpvDDCWFSCjllJf4A3Y4n?=
 =?us-ascii?Q?JuP9Qc4f6hyU1wCA8qre7oytGTq6WItnqURA03B23wAv1NKLEw+V18LaBjsr?=
 =?us-ascii?Q?wZZ4wX6xuEANVSbdeT8miykyE3oNTYu2RH0i7FaDxQ2fuWaV5PEgN0uGd0xD?=
 =?us-ascii?Q?2aL4FWh8Jp8Sx4rVetKT1FOGO5rRRqaXQcY+OP/o3zdFxv5MrcEoALFLpKBb?=
 =?us-ascii?Q?MuVzBvbLONid1XoLNuR/fhlaMZdERYPeOYTsU1z3SNa9oASIduC2kuZlxng8?=
 =?us-ascii?Q?zxM3I+y6Yq6QplmhVdQDsxeAKelOXokEkA/tyiDqkoNuRmcyzl3apz975t9M?=
 =?us-ascii?Q?nanv3Z3ZfdXAfu9zd/BbeiIInFwJ+w8yXC1FJSDw60JjnDs/vjoeYdTY395x?=
 =?us-ascii?Q?g+OL/nbA8LOSMwjTUicfp9vRn02sSSJcLMXkqwD5UCm30WlFFTR2lN/sQdPp?=
 =?us-ascii?Q?reAET46LSj+JhkWcRXPqzDil6hCtf8iWN+eN4FNcfUVsn9c59jD6G+J7c7VQ?=
 =?us-ascii?Q?4TswMFW89PrxXY72FYEtqbryKHNtXxiSwunqt73svZtqBdaQ8OoSUPZ4ASvv?=
 =?us-ascii?Q?lxHye9jbnLzfFq6fj1HniwUynkHfEjrRj+rIQEzFQJ426xMKvZYoY0KRoZpZ?=
 =?us-ascii?Q?SYqPNxQ5/c1wT/MZudbdOK0d2IkULOVsOJgFqh7lIpbxk6Jk88xOJIy0Oosb?=
 =?us-ascii?Q?7WUNGmMR2xWUc2YKmdZLwqGCTw7Ul8fU0bP52cuglUnDy0Y6gSalMddB6UQK?=
 =?us-ascii?Q?I97SmQK9rdZEkJBldD0tFoTXG30jUEPqD+M3UnncEOijIpdye3gdpx1fNBU+?=
 =?us-ascii?Q?Vkyyp5b4N80FquMyK0cDUXF2FPil0iWOhxuMK/XSE5JzN0vxbezTGacqts7V?=
 =?us-ascii?Q?809gndATrbswljm1CaKmDkJugZ8YzPX3ZFix0PwFOSLQxXZCIU2yJcpSZ0tk?=
 =?us-ascii?Q?o0hPDqViXcxj+SerciwB6Pb3kfwSOwkP5NiqWwnsbrjj3ysay5nSp8CdyfOz?=
 =?us-ascii?Q?vra1/ZQhD2lDYjJhIh6lY+LDXrGsAMTHvDzH3y67TRuexw78OuD7RnwPhI5X?=
 =?us-ascii?Q?zcciP2oSDiSR99AM1kMfR/uk6s7u/qcUMKRyQIXa5ip5TNq7oBY9UAZ0wLRQ?=
 =?us-ascii?Q?EYpgmYxOvkKd+lDswHefpsaKqXEhFm28sAJs8H8jaHUUaRwmiOf2w3SrHlAM?=
 =?us-ascii?Q?6rsQvCkii+4qIugbqu6MPhJBXaHG4c4vl/W8kOskTbxb3wlAKqhU/Ik45Zkc?=
 =?us-ascii?Q?hl3atV3XEK6onMCpP6qzq2fnrcWbU/ektwGkkmJq26YF+6qJUuFzEK6vcoN9?=
 =?us-ascii?Q?RotBzhbNtgU2GPiZdsCZO/eSm8vkg9bRhHfW7Dgcb3e7z31NYeYujQAqXcYV?=
 =?us-ascii?Q?rU1wIgb0cMoi1k4xsadVhsqnwYSwf3C88doVlAYI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e83ba4-a53e-448a-1f6e-08dab8a10611
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:16.2532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atr99oLWpXz1S3PHv4JJlSLjt2IWVPl6r29FXgTWcjh2ysSUwtrGulDF7NEE5wjXZacs6+wdXo8h3gQPb1c11w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: hb57DzcHUm7Y14pQJMe9aUfIFCp3KbEe
X-Proofpoint-ORIG-GUID: hb57DzcHUm7Y14pQJMe9aUfIFCp3KbEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=419 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When migration fails, QEMU exits with a status code EXIT_FAILURE.
Change qtests to use the well-defined macro instead of magic number.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v6:
- new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"

 tests/qtest/dbus-vmstate-test.c | 2 +-
 tests/qtest/migration-test.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/dbus-vmstate-test.c b/tests/qtest/dbus-vmstate-test.c
index 74ede651f6..6c990864e3 100644
--- a/tests/qtest/dbus-vmstate-test.c
+++ b/tests/qtest/dbus-vmstate-test.c
@@ -233,7 +233,7 @@ test_dbus_vmstate(Test *test)
     test->src_qemu = src_qemu;
     if (test->migrate_fail) {
         wait_for_migration_fail(src_qemu, true);
-        qtest_set_expected_status(dst_qemu, 1);
+        qtest_set_expected_status(dst_qemu, EXIT_FAILURE);
     } else {
         wait_for_migration_complete(src_qemu);
     }
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index aa1ba179fa..28a06d8170 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1342,7 +1342,7 @@ static void test_precopy_common(MigrateCommon *args)
         wait_for_migration_fail(from, allow_active);
 
         if (args->result == MIG_TEST_FAIL_DEST_QUIT_ERR) {
-            qtest_set_expected_status(to, 1);
+            qtest_set_expected_status(to, EXIT_FAILURE);
         }
     } else {
         if (args->iterations) {
@@ -1738,7 +1738,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     migrate_qmp(from, uri, "{}");
 
     if (should_fail) {
-        qtest_set_expected_status(to, 1);
+        qtest_set_expected_status(to, EXIT_FAILURE);
         wait_for_migration_fail(from, true);
     } else {
         wait_for_migration_complete(from);
-- 
2.25.1


