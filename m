Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D9700A61
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpM-0007qc-5D; Fri, 12 May 2023 10:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpG-0007qP-Bg
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:54 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpE-0002ai-2g
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:54 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9Qai0020415; Fri, 12 May 2023 07:32:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=+WKgGW6tXUBQ7Xlk8jGjqtOAvZmWrH0/5OY1yrfbgPw=;
 b=G1SiC1qiJocksSJZfwVLYIiRpsOCFeI9AhjfqneCSG8o4i8/bPYoBbjAzQE6E9XdxzGJ
 dvbTx5+FozlozrNVM22+Vkj7wIT0zws7yJVuUlMPfH+0Xaslso/MSur/CGciWJO5jyld
 pWr2wy/n5qcJTb7+TNkHV9+9AYmtKNiJQewFo/bAMmZoatFHJd/QlfYlpxL4U+i41cPK
 H/GT16uU3Zgzq6PUZbapIViABJmUSWyM2nNom3MVGZxfvNfaQEsrSLHzCwL7Fpj7m9Gx
 oVhNdu28LxDnuK/6WZ9ALM/m5Hxw5Vm2CWlJbpljAyvHOYs90gN3rx1TA4kh4pLQCt61 TA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf835sx3k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnYw5hib+dvt1C2a+d2VlGFY5DCIrH22Q0ay3dc7AOmsAF4ghTxbmyVA+8yhN1HyBwKzg2eHJ4E5g6T0O9PVBjqKptXSa3KkUQpSJrhtNlo4LLAHvRuM+2ERt7Eo8rLeOhvAp/pr/SnDQOV14BdD+ATDYU8RRehAr5vlw1b53c6fdc/ShoIUCrsA8s8GcvanlSJhpS68k3K4bDB1jLTT+bfSmrQ4xg2fdkpL4w5SZ1632O2FQOgNAA0xBrgiWMIv6R+dcvDSdUk8TkzckdCPYXofVV/X5O1EZ19t3FIMemU1O7ZS4wr3aX/5ZEwzpWO62aOnPgTm4SQn8nZlFAAOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WKgGW6tXUBQ7Xlk8jGjqtOAvZmWrH0/5OY1yrfbgPw=;
 b=X3og6HErziR2wNj5rJbKdAXLXLjOT+cOngHzeWSo64Gt5tRvTzJMBKFLPQSdvcfA6p1fftbbyLCKEkoXyO+FYVoUWT6/iC3i+WD2753X2J90ruTK5BZUpPGqTZQ3aUCXoSCtjzqbgrzlH6nebzcVGBZ0Mlvtl4+nbs5m06qzVbaadGQFiaS17J8ffXHuLeuay2Yau+3/QgwCp58UsiNLMAFNGZTxkhIWlvSN65FiO1YdCvjlgp8VwQVDeJLf2rsScBjub1Qv1yjMQ0xWSuA2t+SOyug6BkiVlOjCpZWnr5tnLSBxvMcG9azy4jURChM8Co5YRHnMcnU38tP+14DRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WKgGW6tXUBQ7Xlk8jGjqtOAvZmWrH0/5OY1yrfbgPw=;
 b=WDZ8c3saIRX2QP8+USgLCMMOSLqVcTyqqzgPOTAtHPO206qlIXkwW5f98HDZZuEDS9gqU4oDvtTJrZtapr/LwIR3x8yJKcf6fxmRxBcTPvxYfqB3MUMTejyU/VXRBXUx7bV013L1oCprCOvieexL9W3RPvT1Ghd0moQjcgYeNaJaBYIoVTiWjQNCKEM6G80KiMJODs0IQh8FORWNeHRQzXWAy0gseLBoAG6XFuQOn0X53/0t5vHRiCPsDcadA0xf2kdn2u2E2dNmpR2mUnnraM5naa528RRBop93cGqqDTLsPqtSuodqInWMKM4JK3GYltPzNaa4XOlyEzlDLeE85g==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA2PR02MB7657.namprd02.prod.outlook.com (2603:10b6:806:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 14:32:47 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:47 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 1/8] migration: introduced 'MigrateAddress' in QAPI for
 migration wire protocol.
Date: Fri, 12 May 2023 14:32:33 +0000
Message-Id: <20230512143240.192504-2-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230512143240.192504-1-het.gala@nutanix.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA2PR02MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d8ad19-7bd6-49cb-b8d9-08db52f5c1a2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cApt3eIGmc3lQfx3PRdonlv1zfJS2vIzPxx1jfs8roj8F6DoWxW5Y/3hp43IHAfvCeN8TJXA/g+BbX0uutW66/2zQbZusExnyOGuEb44e8wBgB0S8peXgHKkXXNdYUkHTki6ztyujwGV9rOtcC7Q0BZYNavNKfGXJtLd+SOfn/2bnaRFBuKqU844THnOUM5UJhR4jwdB8yhcm7O8bxIkW13tS6yRRsZDYz2CjRBjMfayzS8Dj8jjsst6L5JpfMpcoDXglsSL8KXXkYkqNsErNCSzzJqw6X4IH96Sti2X2h/7oQS62JIqK+NLf31TPlYeTuyaNt1UgKBHiHRZTE9AJH0MNIbwG7BRgoEI1ATuo+8M2HkcqwEO5J/pinShb96P7tXGCWu5rz2dGGjS2g3FzPceXDf3EeYElM8qbWpYyimaZvawgLRbPhjBBFMf/k7+KxlJlGOFFlYn0v3Ava2ijjiZ02QnVCbP4jSS2ebAW370do/Cy3yZQ0yqfsY9i2CoFCTfbZtrMWcGwQ1cNnkvU/de+RdNh5irEeWuYpG26WXmN75BM/thSn6OOl6s4MMOMJe6bFdPnbHExaFGMRw4hVxJLJaEgH2euZ5NJ6yXB+JtcafR88i12840l3k5i/vM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36756003)(38100700002)(38350700002)(186003)(26005)(1076003)(6512007)(6506007)(66899021)(107886003)(2906002)(2616005)(86362001)(41300700001)(6666004)(6486002)(52116002)(66946007)(6916009)(4326008)(316002)(66556008)(66476007)(478600001)(5660300002)(44832011)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tJRKf27FR9Y0GpUdlGm8d7uP7NryEQClzBCSJ9f7gm9/BlS+dmWUVWBWnfje?=
 =?us-ascii?Q?O5llXWz7I1UAa+9hmg635eT/acJ6wPAzo8Z+XkWfURJ7GiEnnGNRVOLdL310?=
 =?us-ascii?Q?TfmjieeVaLJey1IRUW0Ob0qNnEk7ub1KykMGLS2+0JMU2D4z8zTfb0OsgEIM?=
 =?us-ascii?Q?F4wXYhjgG6754g4psL1ft5Qkk57+f2HE7HcmahYQS+Q1Jg+sKloWVU+ENskN?=
 =?us-ascii?Q?XXq+PrpowlclEfUzdBOpmYispq6kXw6t6/PMrq1idUzCMwShsJ4JhsamfZlQ?=
 =?us-ascii?Q?Sav1t9cTJ4C9wgPCmHC8ecHCwNSIuna1GjIqNOjmkrogHdY1v73LUVLW00DB?=
 =?us-ascii?Q?Kv5jxc5Sw8P8OxIHpVC/3wib4dtWBV1BzjZkUkp7np8WNxnrfQVHtG/ysAln?=
 =?us-ascii?Q?kOPUnp91uITiefj/j7eurKf0oE2C3QBmjIpThs9wsyXrYxTFNHd4eMaYP3+M?=
 =?us-ascii?Q?M5sg/PzZaNgQVQ5AVfe9HoQ9hi7t9UbVZ9ZnylNgNMKGQoAkwK7JE0t7ozcH?=
 =?us-ascii?Q?spTp80K4OLqsKVkRPsaWbySSflIn0RIy9jtPKK+vNwoQZUDxtY5gfOK9tbM0?=
 =?us-ascii?Q?2XxDTdUIWPDMADs3joEGJ6ftdIvm++MJ4ASvhyouh9d3GVB1sRXD1pt9sH1B?=
 =?us-ascii?Q?s8Yin9rfwu/81cWfIYmB+xVA02V3dC0wmr0w03LZb4PUMOj7GTlq1Ce1xMkg?=
 =?us-ascii?Q?0beYtMmiAH+kmF2EiYB/nHbunSUiPUs4nY0RQosvMcDKpWTxPY1V2WVw1SqT?=
 =?us-ascii?Q?ywN3icb9XgX+MNieZznHObhfi8h4cLLa2G8vCesT+xM1BvdP5L0incqNA404?=
 =?us-ascii?Q?7oSrAYMZPTZhe+PCBh238UYLf374tiky6IlvLWmkDcvHDWSu1FMTTWNAIb8j?=
 =?us-ascii?Q?vIa/1KKUqEh3ItNLRenLL66oz0jncEXiP5L7F2dkvEqNyHHlJcCe6iAPsRMx?=
 =?us-ascii?Q?kBif/4HULwNMFF4DmLvQTWZH/oxWW7mwADlQrdk+l9vLfmKkRTwuxoq4+xiF?=
 =?us-ascii?Q?SEE8KvRmt+Bbh4Qls3hdN5DJMp39bBH19WZTCsrUwVG0iB4eLzIQ4KfsESrP?=
 =?us-ascii?Q?M/r3ZOBJlIA1VdjNbE1/97YYyEZCiAh72sfZ7V9/qOw0Ih+yrd2zRjKCIajl?=
 =?us-ascii?Q?CRGXZfHXE60Cp7x34tbdzSFphMbVziEguuENIaD96hcwnrDMw0weOAJsCQNP?=
 =?us-ascii?Q?jgDCptYwSjAM6vx9fBPyuR2SO20T17vzoFdRo655b4sddNmB/ihZvsEJF0Nb?=
 =?us-ascii?Q?RLLIDeGCgseQfjWiC3pQby2IN+d6JOA33jdV8Z9EBRNYC6lt4ao3GGifgiwO?=
 =?us-ascii?Q?8kOU3z4xekJ1uMEZYTTwPQ53ewYdd7h+bGJZsKouPq7SVjOk0eoMfcOHL5c+?=
 =?us-ascii?Q?elMcdRggTV7ErdVwxkQjdQqygkGdWZxCAZ3XsvctoP7t/lmZO2ZnkpuGYvG6?=
 =?us-ascii?Q?RkU1IXW6bswL+WydxUXJkN76XP7+r9LNMqqPzlVF/Av3YaECKBCUF9AcPSiD?=
 =?us-ascii?Q?7+i11JRMvYAzeQ8k5rV8TTYqMvIN/oUO/Jaq6Eg5wFCBfvdQKDQPa0uKFD2n?=
 =?us-ascii?Q?BPIad0B7LSVmZ+ilVWeo86N9qQeNtB5cVzPPYBXf?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d8ad19-7bd6-49cb-b8d9-08db52f5c1a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:47.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnU8+P8C1RDf5QLH2/MK8heqcYlNWwYNFqiJihq3WWQ7KRSwbenqr81BhPLzeWHNJQyMcuvVBHTHpm1V37JRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7657
X-Proofpoint-ORIG-GUID: t6UyDk2QoFIgjbvOt8CPopmZ_hNpyNRG
X-Proofpoint-GUID: t6UyDk2QoFIgjbvOt8CPopmZ_hNpyNRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch introduces well defined MigrateAddress struct and its related child
objects.

The existing argument of 'migrate' and 'migrate-incoming' QAPI - 'uri' is of
string type. The current migration flow follows double encoding scheme for
fetching migration parameters such as 'uri' and this is not an ideal design.

Motive for intoducing struct level design is to prevent double encoding of QAPI
arguments, as Qemu should be able to directly use the QAPI arguments without
any level of encoding.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 qapi/migration.json | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index 82000adce4..bf90bd8fe2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1423,6 +1423,47 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrateTransport:
+#
+# The supported communication transport mechanisms for migration
+#
+# @socket: Supported communication type between two devices for migration.
+#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
+#          'fd' already
+#
+# @exec: Supported communication type to redirect migration stream into file.
+#
+# @rdma: Supported communication type to redirect rdma type migration stream.
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateTransport',
+  'data': ['socket', 'exec', 'rdma'] }
+
+##
+# @MigrateExecCommand:
+ #
+ # Since 8.0
+ ##
+{ 'struct': 'MigrateExecCommand',
+   'data': {'args': [ 'str' ] } }
+
+##
+# @MigrateAddress:
+#
+# The options available for communication transport mechanisms for migration
+#
+# Since 8.0
+##
+{ 'union': 'MigrateAddress',
+  'base': { 'transport' : 'MigrateTransport'},
+  'discriminator': 'transport',
+  'data': {
+    'socket': 'SocketAddress',
+    'exec': 'MigrateExecCommand',
+    'rdma': 'InetSocketAddress' } }
+
 ##
 # @migrate:
 #
-- 
2.22.3


