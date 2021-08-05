Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E683E1EEF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:38:20 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm0I-00045e-VP
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltx-00036b-8y
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltt-0006xH-Gr
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:44 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MCRis016853; Thu, 5 Aug 2021 22:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=dzrua3pExd2fNOEDxQPxfH8LaWxcJBFIhk1VbQ18mgV/NmuyZrS3UwjbeM+7A98xqyki
 /XHLfOTJz/ioaTaV2zmbtIMq9Er1d6G0YQsE8azcHxuRJrGgQzkPERdmfSuQt8Ld3+1z
 yjotWjIcrB9F44lPhaufED5lqzcZPvULULO+I7yLEj9A9Pe1emQtqa0BSA/HnlnbKboH
 famAbWmXGp3gCZUAn3V3wAYK0XGDlpO+pS0+Bu6Ym+JVooqzW63jZHX0b9HHczmatYor
 yYKFe4ukGGJ7hHDTT3DCfI+CxtKTBJs2WjCRk2mRwd1AZlh/K5Vw6TwuOGzAFmwEDdGQ kw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=mBHz+caln3DGIa+UwEDp/DHFKYa9v+ATT3UxmuBD5jdEk8qob+xJRYLmMXGWzc1FcCe6
 C2apr25A5z0AQPp9wGbW0ovd4zfv2rvix77N4gURWkAVB2HHTW9f3YDTg/wI2JiV4vm9
 WrUKMfUwjvMpzZabFy2VTPtiQ93eyNeD3XZb+M8uRPrcuPl68vp1FHz7oRqHYj336n/E
 bVaIw9q0ga/uGFxgm8I9vrwEMMFIrA7kac7yCRzJp2cYIltIHyLSMZ5tTRHfpQw3eR4s
 a7L+rCKFQ02PqrX4yTBEZiyyDJYMpZ8gQNbdFq09bEVVdM0RIq4W0S4ejQXWMLNoRDoC bg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a843pamk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVZs4008821;
 Thu, 5 Aug 2021 22:31:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 3a5ga121at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiKVMnucCJyzGcrb7jWoP8hDsL1ENqjJ7NRvafhVLDpjqjSvQe7NW07btDW8fCUn63w73OjJbUZEzr4JjhHmJAdmHOFHqGqZ1OqTpedJlt6j204aUBq6RJL7lg1FKoL/cTlufuLCDH7l833LGxznNn1AyH58QmowEvuKiSpj6/GLiQwqU4cOu4VnlIHZCs+gdh+75NObW15NRbF2y1c0W5xXn7IUUwJct4yOkidW4BczNMcPzvHt8I3viIdvpF8Bpi1LsUjktwWwVSd0qjJ82J0lAXTpiZPE8l4K1oaL276zsdFkWwVMsknCsnmhVdOwH/WxkllS3ksP6Ka1v5BnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=G17Q/7qKrWDGZ1/DLCHyYjCrLM+F1SDhUCo8C5e/7nRT85qhvve5iDnzDeKuNOrOLv86ItWi57GPuW8Yiyjm999n4uVbNxBk9ZSBttx36Z8gYW4bmDzz/BtHAhZXsXF9906fkFDmAES/kYtOxXiZ/9XdDv0WMPkgQk5ZIbJ1tZGE/qy8/xkbGtjKtTbtWeihslSvA2pOmlkttg5k7p5icekYcYANz+d6+alZLqZzLxqWSPLvkztc7Hp+QfplRv2Lpa6Y294G9wxZrUioV9BbtApLYsb05yp5Z6So40JOV189iiN6W15HwVfZoT+9oThUooN3Uxpa1w3V8OFOMk351Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=g0QRbER8HK2Yjx1QztWwN8BH+yxvB6HT7dJQFfOLSh6UIja7qvUvLS08/J8DlQfBCLMC4cNMsdOYiGIfnt9vTSNqX6f4RJjEFnHfNTEhVyFndvkYgqEYffcDNKnwaqHTkGTswwJf5LFH7yWOK5Oe9119E4G8g+/6l0uEh93ztjw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:19 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 04/10] ACPI ERST: header file for ERST
Date: Thu,  5 Aug 2021 18:30:33 -0400
Message-Id: <1628202639-16361-5-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 5 Aug 2021 22:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5df743b-727b-477e-aef2-08d95860bf1a
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22216FB645FA4D5541CC2FBE97F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7/HuB9mhandQuQ80PNHrN4CPT5/+B3y61k0X4uqip/YMBwK2Bl7njM3JeKGLGsiRFIfoMV1iL7SZDWdtqgBIrRgNLwxK1umM244KUnq9FtwQ4oSbTxwQ8XlcFo9umJXTbIy61Vykb2XvaseCD+En4eQ6KzkfsJSNH592b4RJ3V0c2ju2y/BtuXf6LaqBVLayKo3BfFxU8zmtQU/COPx9Yht6KQH+ZepIv6OdLlbeMs3+JnkvHmAF8Q+kRDwWhMw4cdbAQ7b6RWS+4q96otLjrwb3DdLXtU2RbwI8VLL8f8wLyAyedNylaeIV/BxtCNMrbHp6TKBc/7ZmwfJeZcqTtL24G1/MwVIF2/mDCqrNvpJs3cKEWS4zwAzdrNP5nYArER8ivtD1OxfQGfICytoorfhjxBnj4LlXk/vr9LzOp9+kCeuo2beq1IRNZzbAqLgmafP3fOixwrM7yw40UfgmPJRsQfT0qNcF31sFnSBSlQ0Cfi1PLbbOL+NWZ6FmA3r62idrplVAeiOLyzBlNGN7zmjx6iAyXiaCMrlcX2B72NzW7WBjFIj5EfZK92xmgCqxkxn/kQeonDBQgQbiAUStzomx2VDVKC6L7rTuM63xycbJLVDHPfxHyfCKqtHdDhtgERN0HZrRcYbuLzfwd86YL5pR13vyNWCzyD42zrmTiVvTWoot9RWwAmE9UArge4Bm2QX222phiOetp3asGuvvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(4326008)(2906002)(26005)(4744005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bv4BrWqIQ24gYmADhTUeYwrvf3Z7DpHA94T0ijgGwzF59QpcgxUH48UpSk3l?=
 =?us-ascii?Q?ZINYlsy9/VCh9Ws+tTMyPrKNCI/FKI2ko96LcbeZW7B7oc5G/AoSX27rikI3?=
 =?us-ascii?Q?rQE6BfZPUsx0RkacVkOpv6YtB5jogpXkbJdvMyb0rPu8TO8DW3tZxfsN8wAL?=
 =?us-ascii?Q?EUUeh/n6jXdc7khtvh2KQZpqC2waP8rP6I7i2JNFfEFm8lMhI/YR5k8/W5OS?=
 =?us-ascii?Q?jPzPgKIHhy21cBCca1dSwTpKaxp3jvtewLbCJmCIyiCumYJ9ncsvOq5byVtW?=
 =?us-ascii?Q?pxpnIdUsLZ7e8VLUSkfMuquIUZqf+JeMGpJKyqvs8z8ZdD4Rs0ezhav2ainc?=
 =?us-ascii?Q?rrxd69bTHlwJA4vOf1jQ/N9C252FlGjkvMMxjoHFlkyN6jP7zwboKlO1EOv2?=
 =?us-ascii?Q?TqmL95+kSxtdK3OpmfxDFY5ZqLuZAM4OsPlHIzot+t20tRH18oFcE+VnoHl0?=
 =?us-ascii?Q?AqRkK/guGa82N1Dm+q/ArF9FYN5p3ilo5pLR+sEmtEM/8q4QYBuXITvO5oFT?=
 =?us-ascii?Q?DlChWAb87k/mMgLpy89Oh/0CehdTud/te3WO5k/JNUP2grODYNWhUt8391Hs?=
 =?us-ascii?Q?GzXzhdXrcpJ9J53qNuokzgAEGtRnlqPS1Ma0vZrgz+EcreLWU4KaUYOXiXaH?=
 =?us-ascii?Q?0vCY0YzIOlQm8O+TnQj/xtSPkwkPRabNVZagvAySX4ysYWYfa9b4mYxwivjX?=
 =?us-ascii?Q?IVv9a8Axl+NHmxtKw5FGv7kCQ0WNb/Gzfymy7I+yx0ZUafGDrJzm2Ulnii/g?=
 =?us-ascii?Q?uc9H3KJoh+5qAgiTSh0LY8fIORZTE0pJU44d/MhiI17hmmsXkXSICzsOqs3E?=
 =?us-ascii?Q?J/p8PWKArHPyv2kj52iApatF3qxWOOAd5mpWfs3LwshBG1v05Uy4PLxDR+sm?=
 =?us-ascii?Q?Ui3660AK3P5+Eg3RwrYaeyYkhT0cT50zrNHMHBv2OYUJ30dALfLwfPgxckla?=
 =?us-ascii?Q?jOZ8jqiLqwsDt+/VMomnWvY2wEJ/t7tq+1keg/JgDbe9chHzZKqnhAV2QFs9?=
 =?us-ascii?Q?nZ6o1cBIOnnKec4KfZCGFn3u3QApv+OowX1dLRMpLenaazkXbmcSiVLBDcJz?=
 =?us-ascii?Q?0mD4K4hqvE5zu6lEI+BprV1fyDNajDW3+olG5erh2iECb7YeT2F5qHyHfAaO?=
 =?us-ascii?Q?87vzMIovdSnqUV+Eh+GAgSg2BvZ7CsPXoIPKW5voOkZlpILFa9Q+XVWo7UIx?=
 =?us-ascii?Q?uhEo8XLbT7CSS5cRqof2FclRZN/lVXcVPysjgToXDrOWk0FR7H9XKVoKdPUI?=
 =?us-ascii?Q?M5ix5SDOGohrn2D1jSjld87J4qR+0IZAzSCCr5+l5M3G5RUqQo6ZJMUeFHp5?=
 =?us-ascii?Q?SyWcO+Vz3Nw6+z7Qt/JqlsuW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5df743b-727b-477e-aef2-08d95860bf1a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:19.7530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHRKjUcs4y92+Q+W2aMds88IlxiCDRDOmxF0irv3N/z4kSlVEUDYWm93Uv4wuUB87LnPDro16/u2iN2I04p4Tg4jcz97MZC5bA5m4SC7nM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-ORIG-GUID: C4qMiAvqMsAu6ueNzmjobhVkMXrMw81k
X-Proofpoint-GUID: C4qMiAvqMsAu6ueNzmjobhVkMXrMw81k
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/acpi/erst.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..9d63717
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,19 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#endif
-- 
1.8.3.1


