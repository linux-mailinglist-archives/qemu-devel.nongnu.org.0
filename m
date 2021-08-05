Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73B3E1EFB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:42:28 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm4J-0004jM-5F
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBluB-0003jq-8j
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBlu6-00079s-Oe
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:59 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MVpGx016771; Thu, 5 Aug 2021 22:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0zOOI6D4Wyou1/iKSG00EWJHIuqW+jLmSOttLCDLEmM=;
 b=vTsiSGjiiizhyMR708O3izCSoZxQZNar7LtatSS42pjjBMElyBMtO84mHHx0/FU3vure
 u3aqMq/mL9jqtCs2tbcYq5YAPv41TsDpvWXcNuoveTuqQ5VNuV8mi3OoWOAZi+NcV+U8
 J05PoMF6LfVxnIq3U0EThWWvAy7LZBIr7NtQXbVOvCeJ8NC+znA6d3s/jOOrtWNZ9G4k
 h0qK317gJocqizhZYwg5ViauYuRil1DhL6XqXP4L4Ee4MuZtT+dNnSpe96ktCyTkLrMx
 +MDX4+63o1a1l6ygzTRmOIeY0bjp8w0sUL8s88XrIu8qB2fha8GJngxYfwRJqnpq2bBa 6A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=0zOOI6D4Wyou1/iKSG00EWJHIuqW+jLmSOttLCDLEmM=;
 b=Ypm6v/29f3TImA2PC6OL6wajU4YwpBSHlJZCQsdGScdUJrB6QmVdsm1D3A5827RW5759
 ZC6DKljbDc/2YrYEK1IqJCZzR2tQQk8pV/qWcMvAlHJxkW+qqkRtIeG98dUVF29Y/K3v
 0Hj+fssY1dSgTCDNlbPqaOppStBHvrgjqP1q480e0UoceJlOmBwqgrAax4iUC4T1a0Ga
 ThUmbbHamg5yQcfUSZ/QpHyN1MTkbBKq4tI+yV4PeTTcKC2VkDowGLPG2ZjZeEplSe+1
 KXMPalmjV6ZNgz92OOzRh09hVYeGc+BnKs/fLUBX6o/+QHr5GYiJknVRI6P4dxe9nn/U Dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7aq0dwkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVa0q008919;
 Thu, 5 Aug 2021 22:31:39 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by userp3020.oracle.com with ESMTP id 3a5ga121dh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hp2lhZ8oLvBxuJzQfziixN04Rfzrz3gWtL80N7nHOMbKVDgj13XxZ3PMlh+Fm78gVaUVeGc2UsWiTwVVrYrQPgmI8aGJyGvJ/3a6qje4aR0unqJldKKMPZrruRAP5LP5mz5Z2+yRqTNysUHuHaWJMA2SV76lLwFIr5iAkG7RhBnjRMBo/CQLEoEb/c4M6CEwa/E4zn5iQKxDJCgwxFZI6qQDKaA9hojUSLtvmwycPA+oAyjILbsRI1AOO+gBBaRtrzFNmSFENHfw2pull/kx5rQlAMTv6M/8cFZBiykQUZklmikXQf2xPKuxp+DYS3AorZAYUjtPerhzk7NwWiPcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zOOI6D4Wyou1/iKSG00EWJHIuqW+jLmSOttLCDLEmM=;
 b=kvfqIpeyvxXFjNB0sefyAffM5Jly8rN4jJ5FcGEksoSqOlef3VFw9aiGH6K8D5N3tgKOUz8lI4TRumdZDWIByQ4zvP8G07DDgejvb963aPBTlAOvPvw6ufqIrnOO97rF+FrAK+KVAi7D0nJ3UqU37h9OxBI7gePLZJ91y7iuoEEWvCBhvLbf4JAiox4widDqJnx6FCjnxv1A0ABH6aFqpCyqNRNi3rSqsYLWrorEdtKxmgT8TlgSqniFhunb4Ro2erXaQhcJnAZW6CsseQWhNAmBLHO22VgDLFZUdu9lTt0PtJmDu1RycFx4rCfQfpbkKShF1rf7TyI0UnL87g+Kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zOOI6D4Wyou1/iKSG00EWJHIuqW+jLmSOttLCDLEmM=;
 b=UaaKb1O3E2UYBwTfOZMxHSOjPM+GfLd0sF1/Ncu6BED200i8gSYSYs4QBE7ZGAQCgnNvFAxZqwPfnN23tP4+c+8WwWO0NJNbWVDmcCmEV94ah/kmfMLcjU25LsTuMpuLHKY6yeEMf+SpdTApViRaUx0L3MmtGAAuRBFp793MsNc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1518.namprd10.prod.outlook.com (2603:10b6:300:25::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:26 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:26 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 08/10] ACPI ERST: qtest for ERST
Date: Thu,  5 Aug 2021 18:30:37 -0400
Message-Id: <1628202639-16361-9-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 5 Aug 2021 22:31:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23a39531-98e2-4f1d-6643-08d95860c2dd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15181C1CAB41DF70986044BC97F29@MWHPR10MB1518.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6/XCdbrrbKDzq04iIJpUcdE0J6qfznlKsmO6/fIQzM8H+YIAghmqihcap1Yqd7fFOE2R9bZAt/GkzlMaPx1IRtRdNk15NTX6WEv5HIyD0gBikwafwYNKfK6h4HYAmwm+vh5DM/R3uMFxWx/WsVCk0YSnjho5sUn4TsBkoFDLmRVDl2U55iHZ9IGGyeYjKrR3iAVF7Zw4TTH3guTaV0qDTNA/dkwYQIRit7PO3qGUV+P/UPh2JZ8Oqcxcg5tqx3XfumiksZIu5MSnMpO8IAOYq/dGZ86ZJcy+x/iK+EPBIi21KX2ArNeq/HEyTUDemp269UG+5+BYDGC9ofVoYTqDsOWqxZQ8J6LRjHzc5t1lgBj4ra1t3xAiABEygH+DWyTLlhH068kxJt4cAn/KXhqFPvNq4t3e/jsHhbKmhqMtKkGsi3fxumJzuk7NDSpya5TJkOYZ87a59kvvFhzexJuDR0Q75yTXBTdlUJu1rHw1lARR4bFBC9bWv8sjtDpAZUdmp8x9q7mft5pXFLQ4lWJnM6C9DZCtF4dsFvKjRLMfeCH8Bq2G6MHd3p5L77anAyGw8+1trokMV4/vdnpe3D7R0qDHeJA34BMN5DIyQvrXYgW0l0BsyUcx1mdimKu4spdxAtHdN9seRdF6Mx2RWcO5A6bj1dMCIoo3t6zfNuT9lOU8mAcvFtnvLaStiy5pQqkvBvHSJBMfw/a5tu/mqBubg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(396003)(366004)(136003)(66476007)(83380400001)(86362001)(4326008)(66946007)(5660300002)(478600001)(316002)(38100700002)(38350700002)(6666004)(36756003)(66556008)(8936002)(107886003)(6486002)(8676002)(26005)(7696005)(52116002)(2616005)(956004)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sFDcaPzcU/R07sLvpptBHR/De1sUR4oXKFtzMOzlgfTESdMXGq0LSkgVxOX?=
 =?us-ascii?Q?KmoqmYSLBZzTMosJT4cmEonzkSlVBcwrduOX7ZbFChJ/BUvJt2AS52/9bJVr?=
 =?us-ascii?Q?1EFyLjKYyfzHis1HeNVzz6ZDW09a/Y4s3ouQc+nHsaDdwZdXGyF9fvZcYszI?=
 =?us-ascii?Q?rVDaGJdVgvQ1y+vWSFO29FleaPBbpmtvUjpz88KDOvmflq1j+cO3Rup0sWEM?=
 =?us-ascii?Q?g3hOSWBLt8r0QzkFt4T59TCLK1eSXIKgpVAvt3tRPKOTPy8mm/Z9+P8G8jIg?=
 =?us-ascii?Q?ux3OHDc5EYEQytSmqjLNDnbekikorXIhe1d1iqazMiAfyioqWyASKf+zMbYr?=
 =?us-ascii?Q?W1lNgCOg77LtulEx0h2HJVT1n/PAr+GaY0TLpxzHZYK0728D1yeAYGcjzV67?=
 =?us-ascii?Q?xy0gNogV3HwuEsSehkf8SM9/i59bfQpnCVACgz+MlKoGHtzoOOhRNrscBdNK?=
 =?us-ascii?Q?w2OaimzYOU5KFFcc2+a7cu2saub5vrtboI1lEuOwLLm5dgXFqpElqk+XDwmi?=
 =?us-ascii?Q?ET8OWMXPLdgX9MIo8a0DKZw128Wn/Y2L7fwTQbp0A06c9uFVNJTzros4H2Z4?=
 =?us-ascii?Q?3tAn6hIFYlJPFAt8mpAsBREqJ+zTh8KjbjXoYGrpTMqf2UZt0UHPKjDzi8ub?=
 =?us-ascii?Q?GWAxne3pGjnugwa/J+/gc2MwWpnhtLQxd7KlZ9m14LB5USf3RhTsfx8uwfOb?=
 =?us-ascii?Q?kO5Yfvlpij2OaVNTSWR9zz8eGVba5nnDIvi881LchsUEsZvY9SXVJGLQM0tU?=
 =?us-ascii?Q?z6yUxuwDtbdCWZKF164Hfjol7WJobpIRYucY1TTsBy7wNgemQsfxrTv3RP05?=
 =?us-ascii?Q?sOpj6LjuzfkYa904XuX7+prJnL0O28RQ8dF03ZMzZ7iu9QWaq19s0JwFQ3ts?=
 =?us-ascii?Q?91/r9r70QrwXhLfLyYBJpV/DRPrO5r/u0/2SX2LFWSGIWzPMDpK4mIO5bEUM?=
 =?us-ascii?Q?UGko7ufOgIj3D45Ahvo6/tF/gU7+xMs2cLGdXK/xoqa01bS4ULpsXj2wOE/3?=
 =?us-ascii?Q?6zr+Vyorzp/3WnTY7MnGDE7zsICaAZIdO4QbOBQYBguvKoWLp2zbXFmiKZow?=
 =?us-ascii?Q?bR378nkSYhXntlEyUmduvjnLaowiDbO1+eSS+TKypOfiT3ZS1Wrk1kLok87O?=
 =?us-ascii?Q?LjlLyo8mZhU5QswLyQx5xXz84595bhUXZm7ALdZrNgX7mKrwurUuJmmnpJeF?=
 =?us-ascii?Q?RXEKT9f4/VBs9Y6Gbs38th+PClZg/BgYxQH55QDRiFQbxpg2oTbiWhP0V+Vw?=
 =?us-ascii?Q?fOfk6n0EhnpK9YcO3jPLOTz5Z7qqQci516M3LAzuzfaScncpCxuog/Mjaqdp?=
 =?us-ascii?Q?y5+a9NsReHtgCskpIv8PdawR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a39531-98e2-4f1d-6643-08d95860c2dd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:25.9906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCKa02GDHkonTMiiAzYd4F2X2wGfJ4X9hX+jIOsM6c5JsZs8hwGc8D7DewadzWuv6mSUAvYCGA2XOiC/t8Ci4vabdeIGOojxyXi0DsIbEOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1518
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-ORIG-GUID: Gx9LL5lO81bTH4HfeuzUj0ylzZGlUZpt
X-Proofpoint-GUID: Gx9LL5lO81bTH4HfeuzUj0ylzZGlUZpt
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

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/erst-test.c | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 169 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..370c119
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,167 @@
+/*
+ * QTest testcase for acpi-erst
+ *
+ * Copyright (c) 2021 Oracle
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include "libqos/libqos-pc.h"
+#include "libqos/libqtest.h"
+#include "qemu-common.h"
+
+static void save_fn(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice **pdev = (QPCIDevice **) data;
+
+    *pdev = dev;
+}
+
+static QPCIDevice *get_device(QPCIBus *pcibus)
+{
+    QPCIDevice *dev;
+
+    dev = NULL;
+    qpci_device_foreach(pcibus, 0x1b36, 0x0012, save_fn, &dev);
+    g_assert(dev != NULL);
+
+    return dev;
+}
+
+typedef struct _ERSTState {
+    QOSState *qs;
+    QPCIBar reg_bar, mem_bar;
+    uint64_t reg_barsize, mem_barsize;
+    QPCIDevice *dev;
+} ERSTState;
+
+#define ACTION 0
+#define VALUE 8
+
+static const char *reg2str(unsigned reg)
+{
+    switch (reg) {
+    case 0:
+        return "ACTION";
+    case 8:
+        return "VALUE";
+    default:
+        return NULL;
+    }
+}
+
+static inline uint32_t in_reg32(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint32_t res;
+
+    res = qpci_io_readl(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %08x", name, res);
+
+    return res;
+}
+
+static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint64_t res;
+
+    res = qpci_io_readq(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
+
+    return res;
+}
+
+static inline void out_reg32(ERSTState *s, unsigned reg, uint32_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%08x -> *%s", v, name);
+    qpci_io_writel(s->dev, s->reg_bar, reg, v);
+}
+
+static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%016llx -> *%s", (unsigned long long)v, name);
+    qpci_io_writeq(s->dev, s->reg_bar, reg, v);
+}
+
+static void cleanup_vm(ERSTState *s)
+{
+    g_free(s->dev);
+    qtest_shutdown(s->qs);
+}
+
+static void setup_vm_cmd(ERSTState *s, const char *cmd)
+{
+    const char *arch = qtest_get_arch();
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        s->qs = qtest_pc_boot(cmd);
+    } else {
+        g_printerr("erst-test tests are only available on x86\n");
+        exit(EXIT_FAILURE);
+    }
+    s->dev = get_device(s->qs->pcibus);
+
+    s->reg_bar = qpci_iomap(s->dev, 0, &s->reg_barsize);
+    g_assert_cmpuint(s->reg_barsize, ==, 16);
+
+    s->mem_bar = qpci_iomap(s->dev, 1, &s->mem_barsize);
+    g_assert_cmpuint(s->mem_barsize, ==, 0x2000);
+
+    qpci_device_enable(s->dev);
+}
+
+static void test_acpi_erst_basic(void)
+{
+    ERSTState state;
+    uint64_t log_address_range;
+    uint64_t log_address_length;
+    uint32_t log_address_attr;
+
+    setup_vm_cmd(&state,
+        "-object memory-backend-file,"
+            "mem-path=acpi-erst.XXXXXX,"
+            "size=64K,"
+            "share=on,"
+            "id=nvram "
+        "-device acpi-erst,"
+            "memdev=nvram");
+
+    out_reg32(&state, ACTION, 0xD);
+    log_address_range = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xE);
+    log_address_length = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xF);
+    log_address_attr = in_reg32(&state, VALUE);
+
+    /* Check log_address_range is not 0, ~0 or base */
+    g_assert_cmpuint(log_address_range, !=,  0ULL);
+    g_assert_cmpuint(log_address_range, !=, ~0ULL);
+    g_assert_cmpuint(log_address_range, !=, state.reg_bar.addr);
+    g_assert_cmpuint(log_address_range, ==, state.mem_bar.addr);
+
+    /* Check log_address_length is bar1_size */
+    g_assert_cmpuint(log_address_length, ==, state.mem_barsize);
+
+    /* Check log_address_attr is 0 */
+    g_assert_cmpuint(log_address_attr, ==, 0);
+
+    cleanup_vm(&state);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/acpi-erst/basic", test_acpi_erst_basic);
+    ret = g_test_run();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e22a079..b69834d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
@@ -245,6 +246,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


