Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F03E1EFA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:42:28 +0200 (CEST)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm4J-0004j6-3u
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltx-00038B-Md
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltv-0006zf-GH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:45 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MVc0Z005499; Thu, 5 Aug 2021 22:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=gQvHGEngwOEn1A2b3mlIeDMzvdMLGv5xXvpMb68B63E=;
 b=m7ZY0bLFVg0cvz7K9slqwFm425cmx5HjGYP42yNm/oZcvF5vade8qIATe4c+7zMaqDuF
 xd1oHQiY2Tq6MeEmmIIVod2nPHQGly9/JzoyU9BJpVzPNMtO6J6myk2+xIC9vyQXJd+9
 JaEruUNfmllK9mSu+YNt9hRaQUM6gqRs42rPbwELt6ayg4tAUeyOsUKvBantI9B2ZqWe
 Gq4Dz3FeH9VE+skbbspfRTNF+jYzKNfgsVSQLcDdssvCP5zj5w56D7L5B6+11xpbvG8O
 4ecRum4VtI6Y0cY6Y5ooEEStMoL8/rLbulzNzqhg8kiO4rHg1exEst30LUSqNFg781i3 ZQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=gQvHGEngwOEn1A2b3mlIeDMzvdMLGv5xXvpMb68B63E=;
 b=hvA3ZyGfNLMLBMTNTQ+Ir5Eca75oFpMlg+UYClaF4PE9vvmgbtA8b8R1C+YtC7Pw8QJj
 +ydkPMOyE73GZcN9s4qP9LJtxtFyfQTxAEyTG7jdtx9q103hw/mt1GV7U4mfG0e9Imhk
 hXDS56+YYvuj2l/Oe6NdRVU+jeuUTXV5q0BuyFasLf+SXeNCVFQ3sDLW7mmLx/WzyGqM
 ScFlt20R7P14qLfrEACapLmW6MvN7FVidGAat1ldfl4XjgKWsBMx0qhYs3uGfr+miEo8
 5ppCBzTdQHMTpkkyjAXDNdBCLIHHlLhgdV749Fu9bjH1+shujP6YG5jOMBt8axjiW+In IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rg9q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVa0r008919;
 Thu, 5 Aug 2021 22:31:39 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by userp3020.oracle.com with ESMTP id 3a5ga121dh-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSpcwS+K41sUULbUlnrQOW4Kj3065hKsQhE9zxkMq1gUylaZA41I9DhyK9GCC+zhLo2T9nrOSRFTKqtorbH/shRyIqoswwZPPCe20Hq4oGqmaaOgIoUsqqYoEBGKvAJmzF6jdjuVBd8PXDmEO0Ymlal+wVMPoJG2w2oxcsqZn4C9DgzBEPozqDIaOUagNTML8TEiBwEs+gFM71ECFqmhERiGJTKbaadaTOG91TK6fgqGJaeeosHX4AMYUt/X5LBHAnjCOcMUQbUVaAoXnNHcp3VKN4NEQQdr2lR5Pmh49BpDp9J9LKrb8ciP9+aueDepOmfWVg8s3Lky1ejlPKBung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQvHGEngwOEn1A2b3mlIeDMzvdMLGv5xXvpMb68B63E=;
 b=nUlsNodg/eAf1h+lBX9Gtdl19nIvYfLIC/HTKjrvoapoXHG5UuYaUBiwIyJ2wcaFY18dQIVCMsLLiozFHt/KljMRaDN7ci3ia0/G+AheOoDldQ6i0zLpuURKmNcZ0sSjAHJUzTAkpfB19oSl1pxcU7BlNpwGrqnZtaVlu3fpQQCg/zeuEwLbchjbShIa0OeBujDmqcBHyEomMdoUP4LSSsUpCe0RgfDIDwJdHSHlGMdrX0x1FCrtZdtb4zhsnK4ZWfNIJEXxJsQsHlkT6IkVVKNjcC+cxXJGVRN/Wamzlh4JaZaSCnlSvLI76rR1bvrW3wy97uOrMc6zNfUeTLe3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQvHGEngwOEn1A2b3mlIeDMzvdMLGv5xXvpMb68B63E=;
 b=iSYH8wE/9OyC2/NOeis9Ps4bWoQp3PXvXhnMxZwdTfAeD3kfYXpc912Win1UYUIxRNVxFsXYDvh/xSklfe+Qc/TNxkQDDWmfB8tRm/qYqxBUQPcgVE+O0Xp3D6fUnlkJSot/0g87Vt+eb7Ku/E9hvmMjNWeCGriNHyuKE8X7xAQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1518.namprd10.prod.outlook.com (2603:10b6:300:25::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:27 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 09/10] ACPI ERST: bios-tables-test testcase
Date: Thu,  5 Aug 2021 18:30:38 -0400
Message-Id: <1628202639-16361-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 22:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6003360d-036e-44ca-c28b-08d95860c3bf
X-MS-TrafficTypeDiagnostic: MWHPR10MB1518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15187CB8A39F143CBA67A53A97F29@MWHPR10MB1518.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mG99gYZqcJebS36Yz3JF1ihBnr+BU2lCELxb1FF8zyIItjg37u+FI2Gx9zGgF0B0gqVAtoDCq91FmrGz5Df2vevPvR/MjFS5toUsC+BFA9N44KQ1IJbs0rlvtl+OD7sgs2nqcfgiJQanryjkS7x3jIibzc6QBAIoyGDlJySHfn+SBj1f4u43azLz6q9nunsbbICCUPpPADIwAS75FurRDfNed9iJi0XhKWQbkx9SJjsQdo5DjHfktTxjaYO16cAuBfKzgmlOeJ9+FdS4yFs63eE0jNNI9Xl7MLhh4wiThVtah5nqFBCI56EFbjE8ZDmFR4tlz+i295wRYMW+Ss34Wr86nevOYsK6pcteg6JNBEyvg9h2UawbbTI01E+EzCkyHM1OmwVYLQRxpzkZOLbkujQEe1paVi+ipAmEN4WQhA2Xw8AfoTzSD8CUmBjkknsXWLOPFMivIsm/6S4MtL4jd64ei3ETHTGGE31Cplbv8A0fT6z4wgCitIk6HTSnVGWPK2ba+VjNJDC2RxhR465t+wYULmNopnpM53Iv8ol424ndZpye1OXMD38wG/1Li3+LVqQfdQUnaXggxcsKkUb7unMHP04gicWeJbyEnrWVdq9+JKUCItMWN1x+hrpFDQWc6oTXR64/J7F14ybMKMiM0sc0xJhyIcz/GcP7eC7wLbxtiEMIO8bxsl+r1AD9n969y2i3PbpQaJTIclAuZ93p5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(396003)(366004)(136003)(66476007)(86362001)(4326008)(66946007)(5660300002)(478600001)(316002)(38100700002)(38350700002)(6666004)(36756003)(66556008)(8936002)(107886003)(6486002)(8676002)(26005)(7696005)(52116002)(2616005)(956004)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kVQPgoRlbXbrcRxHBI4L8dWLqs3hgwgKe1t7MwjHkAwk7Dl6JQ06Kvmx+6vu?=
 =?us-ascii?Q?ec+UFLJWYor6rtBvOnSdkaQ+iaMQvSE9VjTcHuG11bAnu4bbkPbXmM+CGIVz?=
 =?us-ascii?Q?LSwSgb1DePHrN/JsAwRZQSSQu+6OZWrCVb/D8NsoTUOJWXlEEt31pZm9KBWV?=
 =?us-ascii?Q?i5pEd1sP6Z6vRD1pHmsTY6bfRILzDiwYWsx/kdIvspbF4dUsf8dLZeiLbT2+?=
 =?us-ascii?Q?KS8xqMI5/z8CDPYtXSF+n6NbJ+GrfvPt5wtuSztyGFM+3wGe10d8OmBEiWD8?=
 =?us-ascii?Q?aF1zgnBEM3nRA/a9xaw1FO4yJcP2cO5JZ4eFvXo14Wusji90nWd7Ynv6IsaF?=
 =?us-ascii?Q?GyrBsNehIS5wuFq44pUsdwjr5FJO44vCClBt33Ojj5UBWzGwFWCESPTmM+6w?=
 =?us-ascii?Q?Y2he0QmCY6EoUmzq/u6UES7G/0ryOfEhX/DjcPV1ThaAJc/SvSdTrlPAhREe?=
 =?us-ascii?Q?d4os4VdAcPOqCaH5s3SOmrsEVPOqrk7lr9X0nm5flUGwop+oD6ZBQyJP1QKM?=
 =?us-ascii?Q?bPLQ6BfPjDYkBjv+dfgi0S9vkme+O7xQ4j1N0AXsKx9uVTHbHojbs7wAhUVD?=
 =?us-ascii?Q?bUeWExaG4L07qs77hdixpBQF4vTPBPywimtwnyQ3cPfqJyp4SPZyLyqDtDVd?=
 =?us-ascii?Q?MPzrfHjd7sfxV/lb/P65VcKGT6z/vS1FBeiIbFRF2LVNWzddy9BVCGsFi15N?=
 =?us-ascii?Q?IuNwQZUODTiXp/RA0ecjOFPb/YvGtEWcOzIt46XgZd2FI51RFMEB6Y5UtZjA?=
 =?us-ascii?Q?h9kgj31FF2I+fx2GmBUJg4CUmgDMdrDUmI3gtiihV6wsWNBE5bFQQ93FKdCB?=
 =?us-ascii?Q?wR6+nLZ020kViTFbGv/FXeDorh1TFNeFxaJazrMhi5XIxwBVJ+tjrP5KZwUK?=
 =?us-ascii?Q?Xkt2EUBXYyZF1M4dSkSTk0amntx1Z9R2d1HWFAb6TYkpt8Gz6OaSqeAKhqZt?=
 =?us-ascii?Q?tiaEw3ZjaHViWYu/9UUz9qSmQgBSEPb8Ws6tf2blJlmlqFyyzjJNBKacai07?=
 =?us-ascii?Q?X6TyYb1bqei/tcuVeYHHXXNTKO5ryfOAwK2boWQZ0AjUJRXL8EnRvjkU+kWW?=
 =?us-ascii?Q?a2q8Kv9D9PxF5eYI9SNCJdgkMBoQxfF+g/nl5nJPj+zS9sWdIODfRYtRXJ24?=
 =?us-ascii?Q?yLBnzhuiOoKYpL06Pxp5U9p0k/i0O4guZuDBYf5NzWSbcMoXayuPRRSGuPCQ?=
 =?us-ascii?Q?lmoTj0QX3J/5geYyXWUKPK3L3jQFlnowOru/3PkLGR+Oq7oANBUONh4+jU55?=
 =?us-ascii?Q?kP/egwZMxWAfu4oAGAPKLY83i7msIQ/PtL0mpMwGrFpJEnQsV7fSy93ktAkT?=
 =?us-ascii?Q?7TZA0BeGAajOl0i4p++8ary7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6003360d-036e-44ca-c28b-08d95860c3bf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:27.8375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zQ+JBfMuDmk9596XmpL3ingUd/NprfUhWVESIIHRTeVyhDxLf2czfDKzN1D04QvPDuqfiTB/1wZBREDTy0kC07DR2Wz815CLkxFISOY9k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1518
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-ORIG-GUID: peFT45v69nKfCD5vxkk_zPnMkYNYDKK2
X-Proofpoint-GUID: peFT45v69nKfCD5vxkk_zPnMkYNYDKK2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change implements the test suite checks for the ERST table.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/bios-tables-test.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 51d3a4e..6ee78ec 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1378,6 +1378,45 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_erst(const char *machine)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = machine;
+    /*data.variant = ".acpierst";*/
+    test_acpi_one(" -object memory-backend-file,id=erstnvram,"
+                    "mem-path=tests/acpi-erst.XXXXXX,size=0x10000,share=on"
+                    " -device acpi-erst,memdev=erstnvram",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_piix4_erst(void)
+{
+    test_acpi_erst(MACHINE_PC);
+}
+
+static void test_acpi_q35_erst(void)
+{
+    test_acpi_erst(MACHINE_Q35);
+}
+
+static void test_acpi_microvm_erst(void)
+{
+    test_data data;
+
+    test_acpi_microvm_prepare(&data);
+    data.variant = ".pcie";
+    data.tcg_only = true; /* need constant host-phys-bits */
+    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off,pcie=on "
+                    "-object memory-backend-file,id=erstnvram,"
+                    "mem-path=tests/acpi-erst.XXXXXX,size=0x10000,share=on "
+                    "-device acpi-erst,memdev=erstnvram",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data = {
@@ -1560,7 +1599,11 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_erst);
         }
+        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_erst);
+        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_erst);
+
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
1.8.3.1


