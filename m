Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E143E1EF9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:42:22 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm4D-0004Ui-GX
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltv-0002z8-B1
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBlts-0006we-LY
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:43 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MUwuL009440; Thu, 5 Aug 2021 22:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=VLrcvTGSeYnuaBBLKjqRwVgUXuJNQ2C6zzV4UzhyKyU=;
 b=WvStCqUmp7E3pcoajz8YxgaSX5ODng2jZj+QnJr5maWktq058Y3cNcp49dL847+O/Ave
 nopG++GPPWl0rsps3mkWMR2Wg+bJA3S7NfN/8DBd9U2mxFySCs/Ck0pD+aJ3iTQWp2QY
 ZfCteMkTbztrT06HlcdfTcK7qmuq5vetGjk/51RIUs5Gh983fUEoKEPJRVtlcnSpSPyi
 vOXdpe9OrQh3l2oWra/Zg/4B+wZ5TkgCw17rN+q7zanjqwFAx5Yjt6UFVbJN+uELa2vb
 63KFknYsUo9DCEBNiHI5NUfMzrxKJy2Ok0QmvtDEMtTU+OODFbWsbqdeyNxSAgfVmfKm eA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=VLrcvTGSeYnuaBBLKjqRwVgUXuJNQ2C6zzV4UzhyKyU=;
 b=sPbU/8UEiZvbHJe/5BlTSGEQbP8+YxyPo9LOD6J2kUApG1ncNGl4+IE+5XJT2sEh+nwN
 1zSP8ChaaTC4/vOUIPiGt16N7cXJHZ3vBbYDE1ai0mqSj02FWitbtrqNP+fM1XKKBrqP
 geXz8S3T9nwT+6R9aydtsVa6lZa+eZBnDpcH2mFC9CB49fj/BVc/0jzSLDospVlzA/8y
 mTRnYBMxgdQ2wGQWwUmIA/HJSkKjY3doZj9XSnU305PMmsW9gnV87sYAsqpLjo0fBZHJ
 rHjEBSL28fEEu9BJ/6f9Od2oElDUya41hqBH4R1t5AhLtS1w6xCvWQlg4v2YwxBOWtZ6 7A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7wqubj6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVa0p008919;
 Thu, 5 Aug 2021 22:31:38 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by userp3020.oracle.com with ESMTP id 3a5ga121dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpfnJGCDHk7bqlmBrUC61r3IrhFrRTDrb478IpdHwZ/Jt8+/LmD+ECluBeRt9h1izjCkMoyoJRxk26UpvFOU/wwOKS6LF8GZumZuVrSbjGyAaj5vYJCGiCPu2X/KnV9K31HIMzXNdTqYlvtZ4W0dTOa4CokeuTwyPUkYNhjFNbCZtGOYZ+5v//UHPF3VVbnkQirEQOzQqLbrB/ti1mdnD/GKaJU+weOwD/qMD45x5y/7sn/pCVWLQp19bwmw2NrgbHktPEZth0z2lmUP/fvwCEAOwO28MXho6ty27DJt+9E+fLkAjPOgQ6Qr8lL52QfDLJ+wHukB03nL5w+xzXGQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLrcvTGSeYnuaBBLKjqRwVgUXuJNQ2C6zzV4UzhyKyU=;
 b=QpXZ6+MtM2gKhebY55mhu/8poV/vNKohbJFXAPESFfozGODYlpea/zn81qVUe0S+0diVapO7HZ/i1NAuPHg4ZTs4sYURZC1xBCXfxJS1b4+2/TcgaLYN2DkwjfO5Olw/QZQFh8cJjPjSJxM+URedxl6Mq7LFlda8WZ1Dxr9g5mdFLJKq3o0lS3/nSBkB7GZXjf5RCXHEyKKcDFh6YzJDNftzxrmamLlo1OUlcQQX+cMWjIX5Qehs5YvHly7hUmoxASPJhYmH/aewOKoZNjxCFm3V0xcNrk0nqmU/uAGzlNLWXa0HNug9+/4d5YJlTafw/n/dqq1aT1binkUT6JyDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLrcvTGSeYnuaBBLKjqRwVgUXuJNQ2C6zzV4UzhyKyU=;
 b=UxX9Q6+Ei86NYdgZ2xEdNYDBQhXnzmPXFs7FrpVVVsztP+ZOEyfBVVToudI4WMYO9C7cMzAyDsfpMmymOPknSNB7kz7rQWKbk3lzyohTwbP/XCtaqH21QvCeQOnIj6Ip+Y8+4qQ3LGTiiYfcIzxyHhAMXQJsOoe1mhqlOWfN8Fk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1518.namprd10.prod.outlook.com (2603:10b6:300:25::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:22 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 06/10] ACPI ERST: build the ACPI ERST table
Date: Thu,  5 Aug 2021 18:30:35 -0400
Message-Id: <1628202639-16361-7-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 5 Aug 2021 22:31:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b567b82-14f2-4119-fa90-08d95860c100
X-MS-TrafficTypeDiagnostic: MWHPR10MB1518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB151858E38071FCE8E4196B4D97F29@MWHPR10MB1518.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aekU1QdLkY+Tm3ayhqxB0Rju2h10e/GESzXKjq/EAg8LdtdygBPr/eNMsZIDV5Ng/LBhbTKh3YfDbgtfA6lYdq5MuifGMh9IEk5OvcgE6qcx9sYJ4wK7pbM9ZYd3gYixo30hqKd+UZgZjNJsYR76yHdCKqUas8z4zltjODoQzkjiutRNcCQsxWNNQLCHFtT4GCi64adTMoGDR+Hr2uHr6Ml0LLGBDF0U1j34AyrSaRFFmOlcHzmDERm3rguEIWOWEiuMwiJqtnsnjMp4t0e3ZBIsB6pCeOQXPHNCeYsRFaiF2qYW7j0w2qZ9K+zcpez21HLf9wK0KX8KnFq5xQiEpYi5hOvZQpQFDvOD7fq120qkGJvZ0romDknxvy+l1H0a5hRT42UGUYpZMt6ODXPBgv13m+nWNs1mLHjPcY+MWz5N9fG+2UUAjeStiY4MvqvAFcz2rB6A9wqWdH7em1MJQIienhYwGcaUN/jE1u33z0nz8WnvveUdx7AlyEnrnvNotY8jEmxVrjSQHIlqFUT1qvoz5EI0XFb/PfdHa/sKY6G/N7MbKmJYxU0EKF0i5NVd/BxcyVeWPPI4fKpxNU7H1Xx105R61wJH2awD7ySOOEDKgFzdESCRnVhjqL15mq3DrRjsU0vGaJ+FC2NAgVuzzE0WG1BOCCeMkoOXmiqltXNI7GQSANkzlwAIxobGvTxi/6329dmd9OAdP0XffIhjIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(396003)(366004)(136003)(66476007)(83380400001)(86362001)(4326008)(66946007)(5660300002)(478600001)(316002)(38100700002)(38350700002)(6666004)(36756003)(66556008)(8936002)(107886003)(6486002)(8676002)(26005)(7696005)(52116002)(2616005)(956004)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qWSBBveqVRHgi/lmZQuRPQcY7YXLCV9K8EBfjJJAqWbXswuN//nLFQdNsUgK?=
 =?us-ascii?Q?sfPe6guCsJA/ufNb085yHLq1WXAYcKy2mVq13xbWU5aUUgxH74HSM954AWY8?=
 =?us-ascii?Q?Ju7but9Ccm8Xitej5zIO5hVAPRkjc+CXFcGNbZluO1e5GmuGOZWd8ETPfCrD?=
 =?us-ascii?Q?TdXp3xAtQArWkmwdEF5An/2E4QQk1ybDCiGDK6Z83NTHSlNHBgcmXm6rb4Qh?=
 =?us-ascii?Q?B0qaqUTJNZeDgQyxUS9f4XaZmHJ2Y99uRfUa0rm4jnw0qHW9D1k6/ZDdnPYn?=
 =?us-ascii?Q?xVlRE0d2USJly2C5TjuQdoWiTX+w93pQ7WU0lYtueWJieLvtKjYs4lcC4OnH?=
 =?us-ascii?Q?mids+ZqgEdhj1+EaB+BKZCEHtFMKZbVhYaDm08gX27v4Dv/fEN22xoYCeHMA?=
 =?us-ascii?Q?6/KkcfifKMcGg1FBBJrCO4L9GBtqzIoS0Y6QGTIcZakFefSOHYGDS1HCLXDi?=
 =?us-ascii?Q?AJWigJQu1Wr3r52jEPvfVeFj40BOpUp7++OEXzxNpBOVuwfVtaM+VmgckoAM?=
 =?us-ascii?Q?ZrOmF0EG9GVNHh4r4zn9DjL4Yez/KPK2dpyhI1oRlsRNWe89WUJeGoTHv+gU?=
 =?us-ascii?Q?dSWr3SPRaloSFNeirAt1vUUoNxGwtne/tjzN6tOvExmu7PQQSwNC9vigq3EC?=
 =?us-ascii?Q?ycElx+YcIz6AwenHQSF2Sv+GWyA9W9oQRJnMbnDQADGreQcoZKoPvKq2+YXR?=
 =?us-ascii?Q?YR5XeNa8AbAzNs+ik2FLJX+XrjwQaLoQ5zHU1c1TCU7yvsjgOssi8YXWJFKw?=
 =?us-ascii?Q?5zUQ6x0DYtkO3inQ7CtE/VHVWN6KuWh+Axc3CCvgAqraBRvWMPF9knn2jId4?=
 =?us-ascii?Q?L0Dt7ucw1H0sTandcrBo1JFnSM/cJG+TaUfElcct3wGyTDgMnQWZIZzGTijN?=
 =?us-ascii?Q?VAKfvshRSZmzkyqaxyWhL/p9LSvag2uEWAs3KYJEAguCp6Lx7LYyJvAufaeo?=
 =?us-ascii?Q?olS20bXxczPbB29apNRwAwN/gwLdg3DNUrv18lOhVvHUc4nhAT+s8tw9B6B/?=
 =?us-ascii?Q?/WTL9FPyVfPjacFUMlQk3S7yoj8f1zuH7LYbeio2/lyDhem37AayaaJYkUJN?=
 =?us-ascii?Q?KeOO6QD2Soyv52TmVYfh44x/HcG9qamuztr9m/4jYXuCdzmCjyCuK0K4PtV1?=
 =?us-ascii?Q?LzgL2Ft2jopX5bjtsJ5GihMumTMNYTulPIAIx5GPPOJcDUCUNYZIGl1kt0mI?=
 =?us-ascii?Q?v2yQkjzBbMXg/p0C5kVjVlk+icTbsBMthbgx9k1iHHpPDm5uVkk340g+Oz7D?=
 =?us-ascii?Q?r7HJXsZrCYwr66EnCXQUuiIFu1I834OTkLimrWktFFHNTK/yOo6R/U1x+g1B?=
 =?us-ascii?Q?JipuWVWU6ey9Js7qhavjt6Md?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b567b82-14f2-4119-fa90-08d95860c100
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:22.8623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3svUSaN2LneugypRmdOSCAhQpMe4r9McYfA7PKh5OzhZ5P6Xk0tXIqZrLG2WyTRvBVLAU2Z127OMexqHO8VMTYE0lNEjJts4BVYKkNlH0QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1518
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-GUID: q6Gp-ja49dGg51FUWBjSEXFX3_c5q38D
X-Proofpoint-ORIG-GUID: q6Gp-ja49dGg51FUWBjSEXFX3_c5q38D
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

This builds the ACPI ERST table to inform OSPM how to communicate
with the acpi-erst device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 239 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index eb4ab34..ecf1533 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -601,6 +601,245 @@ static const MemoryRegionOps erst_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+
+/*******************************************************************/
+/*******************************************************************/
+
+/* ACPI 4.0: Table 17-19 Serialization Instructions */
+#define INST_READ_REGISTER                 0x00
+#define INST_READ_REGISTER_VALUE           0x01
+#define INST_WRITE_REGISTER                0x02
+#define INST_WRITE_REGISTER_VALUE          0x03
+#define INST_NOOP                          0x04
+#define INST_LOAD_VAR1                     0x05
+#define INST_LOAD_VAR2                     0x06
+#define INST_STORE_VAR1                    0x07
+#define INST_ADD                           0x08
+#define INST_SUBTRACT                      0x09
+#define INST_ADD_VALUE                     0x0A
+#define INST_SUBTRACT_VALUE                0x0B
+#define INST_STALL                         0x0C
+#define INST_STALL_WHILE_TRUE              0x0D
+#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define INST_GOTO                          0x0F
+#define INST_SET_SRC_ADDRESS_BASE          0x10
+#define INST_SET_DST_ADDRESS_BASE          0x11
+#define INST_MOVE_DATA                     0x12
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction_entry(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t register_bit_width,
+    uint64_t register_address,
+    uint64_t value,
+    uint64_t mask)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+
+    /* Serialization Action */
+    build_append_int_noprefix(table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(table_data, instruction         , 1);
+    /* Flags */
+    build_append_int_noprefix(table_data, flags               , 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = register_bit_width;
+    gas.bit_offset = 0;
+    switch (register_bit_width) {
+    case 8:
+        gas.access_width = 1;
+        break;
+    case 16:
+        gas.access_width = 2;
+        break;
+    case 32:
+        gas.access_width = 3;
+        break;
+    case 64:
+        gas.access_width = 4;
+        break;
+    default:
+        gas.access_width = 0;
+        break;
+    }
+    gas.address = register_address;
+    build_append_gas_from_struct(table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* Mask */
+    build_append_int_noprefix(table_data, mask   , 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    GArray *table_instruction_data;
+    unsigned action;
+    unsigned erst_start = table_data->len;
+    hwaddr bar0, bar1;
+
+    bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    trace_acpi_erst_pci_bar_0(bar0);
+    bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
+    trace_acpi_erst_pci_bar_1(bar1);
+
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 32,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER_VALUE , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 64,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    /* Serialization Header */
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + erst_start),
+                 "ERST", table_data->len - erst_start,
+                 1, oem_id, oem_table_id);
+}
+
 /*******************************************************************/
 /*******************************************************************/
 static int erst_post_load(void *opaque, int version_id)
-- 
1.8.3.1


