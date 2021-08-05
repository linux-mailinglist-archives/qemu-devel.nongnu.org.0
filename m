Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9CF3E1EFC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:43:40 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm5T-0007YB-Gb
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltz-0003GH-RY
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltw-00071Y-9C
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:47 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MUxjk009450; Thu, 5 Aug 2021 22:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QC1vgJfCjccxJfjMhrNkbpZqQprPRI0WcKg7O/MMIjQ=;
 b=ZvnDT5ZEdyLPMM3BB20Y1br0mccXgZcOU7qqTIdgvP2mw4OmzGf7ankrtzR8l+72ewko
 +P5M9KTcyqVgpYQZBtc+bMBYrLRILSvySsRETpcec/4kcV2esSrF/kxwRW6bxeOcDY80
 gisUAHQVMyY2ZyHnZ3ge9GrIFPEjJwd4LcAqbigjHNNtU+cbkyifxxjJH6VfQ6PUYCRv
 GgQyIdQaiAX6hdH14Su617v9tKE84jDr7aTcq8RQxRTjAIbAJ3F8z5iTsOLoC7kchAnq
 xkCfN/bIyojetC74aJl0qEcjyFPnBcXz8Pf3YwxMP7f16qUudIovlfo8CPJY7a1dlm7h fQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=QC1vgJfCjccxJfjMhrNkbpZqQprPRI0WcKg7O/MMIjQ=;
 b=qZarDfQqefrIYU+Hf7VI3IqeEgJf/VL4cn6nb7eUxk6ZiiBgHhlLGxGZrB7lgRgPqvQ4
 LcUmnPNBYOXgXlArurywGOlmLp+z+bNkJX/78n7qwT/opHxPCpDYlFJ76K5TtO1qOMDr
 PSCl9bBocxZN2ZNf0b0CFU8O6mN+MmaOoUGqE5yLL1OPhFTKdcL6W5VymEDQib4BJiLT
 0XbXrMXtmvKYTdOWenHb/DvwYlF1/R4VosH46A3bE0U0z2CrB8YhTknBYaS3mCnBcFPV
 fAAhPlvv3TOojtjvwZftTg7kDsDp3IRPhW0TJipj5XCV6YCl8ylyALerB2szJIUttG60 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7wqubj6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVYmx008792;
 Thu, 5 Aug 2021 22:31:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3020.oracle.com with ESMTP id 3a5ga121ma-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gdnd4JBpPJrQOqEzQTO+1hqSps+xo8PO0Z8c73a+KppNgo0i/dG/ZeKMJPSwiHoM9dR3EjIRx4icag5VvjoQGjfYiLYhmtPpebSvXkD6pikF/LONdH4VW1hcalbe8boomAlS9mHynFE5ZbvSW35nB/7VbG4hpv8adqJg5Vlb9ajiMpz00GaqkQB9kCeHyPDITZT4qeea0xFms1WSM6jYxi6Dy7Zwi4vQ7m5BBFyB0yU8SmFgZ4Oeg8U1DNPaYdj6Wu0fczqgvQlEPP1okt6TIYtl5MCi1GNcjjlFBvKKi4cndzgu4/XiemDc+Ycv85nSgMucZiTdOF71JPsCZp/Ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QC1vgJfCjccxJfjMhrNkbpZqQprPRI0WcKg7O/MMIjQ=;
 b=nUAD6xroiANRURjjoELPFVpsSRbydQy3HB+SbEQb062rZZo86PnpGGk17R7981PbsyPX90XjXPEFr+NCCI2KMt8h2a+/mVdxslwD9OenkAAqp/wIhPFL1zW2mUq8BYb0RTrU3/93gH87LJ8vRAGSIGmJA8xxRaIV/cUuxGTafI2fF6mnpAhsSm8sG5hrRezvaj8wtXkMm6UTHqfLbxLo82vSi2EreVYmo2rHrbKDDiKTvW341ZtnMLi2PMSzJYlzQqQXQs1p3ANfGx3/pIGdtpfUX++4AymLAUIiNxqSTqdJPypkxiSMuC1zCfKAgfnlZEWWb4Y8kzxHDnuvhFqgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QC1vgJfCjccxJfjMhrNkbpZqQprPRI0WcKg7O/MMIjQ=;
 b=Vy9lKtRsCQu3CMR8nt4hKwra4dtivrqj1LjTcQeSvu8QPxBzH7A4S455nCrVl3bplI5Q5bDJ2eIMOMbuFcRVzjIFxnbo/IiUY1DOWEO1ycua7ODGpcYxfwUbCg81HUdfRPDRR5Rp8xV/Zar/FWElW2mrSZdGSUuyx09B9g7Dx70=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:21 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:21 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 05/10] ACPI ERST: support for ACPI ERST feature
Date: Thu,  5 Aug 2021 18:30:34 -0400
Message-Id: <1628202639-16361-6-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 5 Aug 2021 22:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f441afd-fdf5-4f0c-d86a-08d95860c018
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2221A4C5DDF9E13A0A4F7AF597F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /QxiYEecEA59u9DPQpZ4bc9/TcquO+S/kTAuos57TWKmUzvXk9t7uguRdxTorJRQxkYigm4RICirGsyW8O4J/qANrd5X4eR3scGdwr8xBVbN1gty0G+RPQnATzAwmsbuuihPLtZQEHJ3JrdJtvnZob79N9RTQsHSJh6Dze43DNbHnsOW5uk7RQEgSruKSpj9/lUtr1OobZLI/SyUdpxYBaqHVaDhhoWp8xYG08/MsZe/AfTDdxduFr/Q7S3g9d67vnm5DLFPPV7Lp+Zsb9PUdSnJ4m1PNB1yMEOFi3pZ+iG8UQWwSbJjqKJMYoGfT9Pc+9CvZt9t3srT9HMj1bzgXR3FEmq2kzdZQsCpdLadNTt3LnZdruRZzsa2W+UmpFjSwynlgm0MOF7k0Ar1lpOq92p8SSTWxX49SveglrkQV7GMFo/mVGJeWculeMrqIrMxc9f84CLGOI8Ku6UFhfo5/Mm0ViyjW6ojvHf0sLAOpOVzkgZKxReaS2ikMYtURVzkz7mpdOVhvp+3iOs2vUb7ORIr1hsamNschqzDPPXpe8dgc5KueZm8KYNTEgRr8vzpdmLJJWXhGFYySH7ZVtYn5tPNSSicjhK8EJmRL4ySrQf6CFzLafgBvw3AyzOM+rxSZurDSil93fyfXP0QJjLM20wQFcBQAMgjuujYHICoMgtvdF6dNhjFAx7hNfcE0N6j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(83380400001)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(4326008)(2906002)(26005)(30864003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5uGGDV1qU1DzG2xDJiMZyoIyhYvL3rtAKNvqNH6zWAwuwDCkcD5n87xPP/sp?=
 =?us-ascii?Q?EcM+uUy85pCidt5PumjoMQJadGXAtdbC+GaxUJ8tNmtHtl/00i1Y9lcwrYfU?=
 =?us-ascii?Q?5J+7W+vxizQKCT/0uCCHon+NdsFpQyhQ/GEJ7dsJmDKB0SKKbZkpu9P/3e/e?=
 =?us-ascii?Q?JfFJ1oO9U9CMlfRkPt3lMfh9zJgksjuufZ5GfQlRT4R07t8e2tfMnwlA4jym?=
 =?us-ascii?Q?NIu4t2FHSrm976Pa/UwcOqAvu4TiIsehrW8jIu1WYYoc43N48e+PmQs4rhwC?=
 =?us-ascii?Q?h6zo9lm+o0GtDmtnMvnmgXjnj3LHllR0m7lLx1765IkX1eVIv40nUzMIMEqp?=
 =?us-ascii?Q?FmPTYMEDdo7oaObeFI1qCx80PLHsShabr8KTMRiix3dm00U/FN5/NVmr8BEb?=
 =?us-ascii?Q?qaRXprIhm0R/0sqNm5p/IFDRpdzL114pPD8lUvZ2SgfMGK7UzZcnZuWlfyB4?=
 =?us-ascii?Q?1+pooC76afC56Qmnnjlc9P7TL1WzG9+Qvnv5SPwoDqwjocQ/MaFGHo/o9mru?=
 =?us-ascii?Q?pGilmXRtipPHJGg2suYtm81qDtPD1VCwxYRDsRQi86VpCMUJBkvdCB+bZ0lm?=
 =?us-ascii?Q?n1wk/H2mOZ39ZBlP0gs6prL4JgZCfEGIgNE2s+ztOXuEPkxQcwS6U/rf3Jp9?=
 =?us-ascii?Q?BsiWWRYsHhMllITar7QHhwSM10IQ6Ahvlg4sM+DN9ToXp9ei8WnAwplHesEf?=
 =?us-ascii?Q?QfgBdpbJM76Z4LvuPUV0rMpU+H5LEQe7Edd0o5dS+q1k0qu7IigooFMilkEv?=
 =?us-ascii?Q?ZaTAD4tzZXOrUGZOouN1i+PFZTLRy70XHake4lY+JAHgE9ma49DZsxxknmiY?=
 =?us-ascii?Q?fQieJUL8TkNk+5lB/bLuaLd3hMT52wrNUsuha69xPqCmbtv9yORn1rAi4t2i?=
 =?us-ascii?Q?jVnsim/EbZ2wKt0w++uvROldmvbCfhQ+iv/i86x42tNCFgpFdVpR4rWrNP6N?=
 =?us-ascii?Q?hNNPxOl04d8mo6LL6Thf6OMJyHSqtjTufg1iziEI6jObW0NatYEcrmEdl2mE?=
 =?us-ascii?Q?KnJ1D/1kGf7ff2npK+hs77gwmwKKQugTzlUcTdi+ID8utSqWWcj+8cLfGwsh?=
 =?us-ascii?Q?cEG+MBCn0kX6ZiYZBhZxy8Q6QpoiZEmoKk1pOh51kf8JXsf+xefqhwHG03f6?=
 =?us-ascii?Q?K3bgpKRUyXZx8Rajzym/sF6lviazJ/+IPt9U82oIYVaMQGJL7oEP+yHr7S1z?=
 =?us-ascii?Q?u/kmW521OhDlM84JUF8769C9y0DkCO2YJf7EMBkxC2ljtT0gDc3mhWZ31RDP?=
 =?us-ascii?Q?waXoFAERSbm13n5U+a6I59wQSA8zFEjT1E+FSbZvJu1ZoXgceV3eSPnSyNZ+?=
 =?us-ascii?Q?ddFDPWVycuOdzHqW82AsA+FT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f441afd-fdf5-4f0c-d86a-08d95860c018
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:21.3490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bu0tjnL8cc7xXY7bfIGp1XLhoQSsgPjwSSD29RosQ7I/uak8w1BAN9/kgw7WJWw3jztDG71CcctoRPZmpUFCcw9qYdz1DeRFjgvaCfMBmMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-GUID: zNUMujPLSBLxB4Mb8QO1jOvmbNG3qC0K
X-Proofpoint-ORIG-GUID: zNUMujPLSBLxB4Mb8QO1jOvmbNG3qC0K
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

This implements a PCI device for ACPI ERST. This implements the
non-NVRAM "mode" of operation for ERST as it is supported by
Linux and Windows.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c       | 750 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build  |   1 +
 hw/acpi/trace-events |  15 ++
 3 files changed, 766 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000..eb4ab34
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,750 @@
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
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-core.h"
+#include "exec/memory.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "exec/address-spaces.h"
+#include "sysemu/hostmem.h"
+#include "hw/acpi/erst.h"
+#include "trace.h"
+
+/* ACPI 4.0: Table 17-16 Serialization Actions */
+#define ACTION_BEGIN_WRITE_OPERATION         0x0
+#define ACTION_BEGIN_READ_OPERATION          0x1
+#define ACTION_BEGIN_CLEAR_OPERATION         0x2
+#define ACTION_END_OPERATION                 0x3
+#define ACTION_SET_RECORD_OFFSET             0x4
+#define ACTION_EXECUTE_OPERATION             0x5
+#define ACTION_CHECK_BUSY_STATUS             0x6
+#define ACTION_GET_COMMAND_STATUS            0x7
+#define ACTION_GET_RECORD_IDENTIFIER         0x8
+#define ACTION_SET_RECORD_IDENTIFIER         0x9
+#define ACTION_GET_RECORD_COUNT              0xA
+#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
+#define ACTION_RESERVED                      0xC
+#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
+#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
+#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
+#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
+
+/* ACPI 4.0: Table 17-17 Command Status Definitions */
+#define STATUS_SUCCESS                0x00
+#define STATUS_NOT_ENOUGH_SPACE       0x01
+#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
+#define STATUS_FAILED                 0x03
+#define STATUS_RECORD_STORE_EMPTY     0x04
+#define STATUS_RECORD_NOT_FOUND       0x05
+
+
+/* UEFI 2.1: Appendix N Common Platform Error Record */
+#define UEFI_CPER_RECORD_MIN_SIZE 128U
+#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
+#define UEFI_CPER_RECORD_ID_OFFSET 96U
+#define IS_UEFI_CPER_RECORD(ptr) \
+    (((ptr)[0] == 'C') && \
+     ((ptr)[1] == 'P') && \
+     ((ptr)[2] == 'E') && \
+     ((ptr)[3] == 'R'))
+#define THE_UEFI_CPER_RECORD_ID(ptr) \
+    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
+
+/*
+ * This implementation is an ACTION (cmd) and VALUE (data)
+ * interface consisting of just two 64-bit registers.
+ */
+#define ERST_REG_SIZE (16UL)
+#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
+#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
+
+/*
+ * ERST_RECORD_SIZE is the buffer size for exchanging ERST
+ * record contents. Thus, it defines the maximum record size.
+ * As this is mapped through a PCI BAR, it must be a power of
+ * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
+ * The backing storage is divided into fixed size "slots",
+ * each ERST_RECORD_SIZE in length, and each "slot"
+ * storing a single record. No attempt at optimizing storage
+ * through compression, compaction, etc is attempted.
+ * NOTE that slot 0 is reserved for the backing storage header.
+ * Depending upon the size of the backing storage, additional
+ * slots will be part of the slot 0 header in order to account
+ * for a record_id for each available remaining slot.
+ */
+/* 8KiB records, not too small, not too big */
+#define ERST_RECORD_SIZE (8192UL)
+
+#define ACPI_ERST_MEMDEV_PROP "memdev"
+
+/*
+ * From the ACPI ERST spec sections:
+ * A record id of all 0s is used to indicate
+ * 'unspecified' record id.
+ * A record id of all 1s is used to indicate
+ * empty or end.
+ */
+#define ERST_UNSPECIFIED_RECORD_ID (0UL)
+#define ERST_EMPTY_END_RECORD_ID (~0UL)
+#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
+#define ERST_IS_VALID_RECORD_ID(rid) \
+    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
+     (rid != ERST_EMPTY_END_RECORD_ID))
+
+typedef struct erst_storage_header_s {
+#define ERST_STORE_MAGIC 0x524F545354535245UL
+    uint64_t magic;
+    uint32_t record_size;
+    uint32_t record_offset; /* offset to record storage beyond header */
+    uint16_t version;
+    uint16_t reserved;
+    uint32_t record_count;
+    uint64_t map[]; /* contains record_ids, and position indicates index */
+} erst_storage_header_t;
+
+/*
+ * Object cast macro
+ */
+#define ACPIERST(obj) \
+    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
+
+/*
+ * Main ERST device state structure
+ */
+typedef struct {
+    PCIDevice parent_obj;
+
+    /* Backend storage */
+    HostMemoryBackend *hostmem;
+    MemoryRegion *hostmem_mr;
+
+    /* Programming registers */
+    MemoryRegion iomem;
+
+    /* Exchange buffer */
+    Object *exchange_obj;
+    HostMemoryBackend *exchange;
+    MemoryRegion *exchange_mr;
+    uint32_t storage_size;
+
+    /* Interface state */
+    uint8_t operation;
+    uint8_t busy_status;
+    uint8_t command_status;
+    uint32_t record_offset;
+    uint64_t reg_action;
+    uint64_t reg_value;
+    uint64_t record_identifier;
+    erst_storage_header_t *header;
+    unsigned next_record_index;
+    unsigned first_record_index;
+    unsigned last_record_index;
+
+} ERSTDeviceState;
+
+/*******************************************************************/
+/*******************************************************************/
+
+static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
+{
+    uint8_t *rc = NULL;
+    off_t offset = (index * ERST_RECORD_SIZE);
+    if ((offset + ERST_RECORD_SIZE) <= s->storage_size) {
+        if (s->hostmem_mr) {
+            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
+            rc = p + offset;
+        }
+    }
+    return rc;
+}
+
+static void make_erst_storage_header(ERSTDeviceState *s)
+{
+    erst_storage_header_t *header = s->header;
+    unsigned mapsz, headersz;
+
+    header->magic = ERST_STORE_MAGIC;
+    header->record_size = ERST_RECORD_SIZE;
+    header->version = 0x0101;
+    header->reserved = 0x0000;
+
+    /* Compute mapsize */
+    mapsz = s->storage_size / ERST_RECORD_SIZE;
+    mapsz *= sizeof(uint64_t);
+    /* Compute header+map size */
+    headersz = sizeof(erst_storage_header_t) + mapsz;
+    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
+    headersz += (ERST_RECORD_SIZE - 1);
+    headersz /= ERST_RECORD_SIZE;
+    headersz *= ERST_RECORD_SIZE;
+    header->record_offset = headersz;
+
+    /*
+     * The HostMemoryBackend initializes contents to zero,
+     * so all record_ids stashed in the map are zero'd.
+     * As well the record_count is zero. Properly initialized.
+     */
+}
+
+static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
+{
+    erst_storage_header_t *header;
+
+    header = (erst_storage_header_t *)get_nvram_ptr_by_index(s, 0);
+    s->header = header;
+
+    /* Check if header is uninitialized */
+    if (header->magic == 0UL) { /* HostMemoryBackend inits to 0 */
+        make_erst_storage_header(s);
+    }
+
+    if (!(
+        (header->magic == ERST_STORE_MAGIC) &&
+        (header->record_size == ERST_RECORD_SIZE) &&
+        ((header->record_offset % ERST_RECORD_SIZE) == 0) &&
+        (header->version == 0x0101) &&
+        (header->reserved == 0x0000)
+        )) {
+        error_setg(errp, "ERST backend storage header is invalid");
+    }
+
+    /* Compute offset of first and last record storage slot */
+    s->first_record_index = header->record_offset / ERST_RECORD_SIZE;
+    s->last_record_index = (s->storage_size / ERST_RECORD_SIZE);
+}
+
+static void set_erst_map_by_index(ERSTDeviceState *s, unsigned index,
+    uint64_t record_id)
+{
+    if (index < s->last_record_index) {
+        s->header->map[index] = record_id;
+    }
+}
+
+static unsigned lookup_erst_record(ERSTDeviceState *s,
+    uint64_t record_identifier)
+{
+    unsigned rc = 0; /* 0 not a valid index */
+    unsigned index = s->first_record_index;
+
+    /* Find the record_identifier in the map */
+    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
+        /*
+         * Count number of valid records encountered, and
+         * short-circuit the loop if identifier not found
+         */
+        unsigned count = 0;
+        for (; index < s->last_record_index &&
+                count < s->header->record_count; ++index) {
+            uint64_t map_record_identifier = s->header->map[index];
+            if (map_record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
+                ++count;
+            }
+            if (map_record_identifier == record_identifier) {
+                rc = index;
+                break;
+            }
+        }
+    } else {
+        /* Find first available unoccupied slot */
+        for (; index < s->last_record_index; ++index) {
+            if (s->header->map[index] == ERST_UNSPECIFIED_RECORD_ID) {
+                rc = index;
+                break;
+            }
+        }
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
+static unsigned clear_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, s->record_identifier);
+    if (index) {
+        /* No need to wipe record, just invalidate its map entry */
+        set_erst_map_by_index(s, index, ERST_UNSPECIFIED_RECORD_ID);
+        s->header->record_count -= 1;
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.2 Operations - Reading */
+static unsigned read_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+
+    /* Check record boundary wihin exchange buffer */
+    if (s->record_offset >= (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
+        return STATUS_FAILED;
+    }
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, s->record_identifier);
+    if (index) {
+        uint8_t *ptr;
+        uint8_t *record = ((uint8_t *)
+            memory_region_get_ram_ptr(s->exchange_mr) +
+            s->record_offset);
+        ptr = get_nvram_ptr_by_index(s, index);
+        memcpy(record, ptr, ERST_RECORD_SIZE - s->record_offset);
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.1 Operations - Writing */
+static unsigned write_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_FAILED;
+    unsigned index;
+    uint64_t record_identifier;
+    uint8_t *record;
+    uint8_t *ptr = NULL;
+    bool record_found = false;
+
+    /* Check record boundary wihin exchange buffer */
+    if (s->record_offset >= (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
+        return STATUS_FAILED;
+    }
+
+    /* Extract record identifier */
+    record = ((uint8_t *)memory_region_get_ram_ptr(s->exchange_mr)
+        + s->record_offset);
+    record_identifier = THE_UEFI_CPER_RECORD_ID(record);
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, record_identifier);
+    if (index) {
+        /* Record found, overwrite existing record */
+        ptr = get_nvram_ptr_by_index(s, index);
+        record_found = true;
+    } else {
+        /* Record not found, not an overwrite, allocate for write */
+        index = lookup_erst_record(s, ERST_UNSPECIFIED_RECORD_ID);
+        if (index) {
+            ptr = get_nvram_ptr_by_index(s, index);
+        } else {
+            rc = STATUS_NOT_ENOUGH_SPACE;
+        }
+    }
+    if (ptr) {
+        memcpy(ptr, record, ERST_RECORD_SIZE - s->record_offset);
+        if (0 != s->record_offset) {
+            memset(&ptr[ERST_RECORD_SIZE - s->record_offset],
+                0xFF, s->record_offset);
+        }
+        if (!record_found) {
+            s->header->record_count += 1; /* writing new record */
+        }
+        set_erst_map_by_index(s, index, record_identifier);
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.2 Operations - Reading "During boot..." */
+static unsigned next_erst_record(ERSTDeviceState *s,
+    uint64_t *record_identifier)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned index = s->next_record_index;
+
+    *record_identifier = ERST_EMPTY_END_RECORD_ID;
+
+    if (s->header->record_count) {
+        for (; index < s->last_record_index; ++index) {
+            uint64_t map_record_identifier;
+            map_record_identifier = s->header->map[index];
+            if (map_record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
+                    /* where to start next time */
+                    s->next_record_index = index + 1;
+                    *record_identifier = map_record_identifier;
+                    rc = STATUS_SUCCESS;
+                    break;
+            }
+        }
+    }
+    if (rc != STATUS_SUCCESS) {
+        if (s->next_record_index == s->first_record_index) {
+            /*
+             * next_record_identifier is unchanged, no records found
+             * and *record_identifier contains EMPTY_END id
+             */
+            rc = STATUS_RECORD_STORE_EMPTY;
+        }
+        /* at end/scan complete, reset */
+        s->next_record_index = s->first_record_index;
+    }
+
+    return rc;
+}
+
+/*******************************************************************/
+
+static uint64_t erst_rd_reg64(hwaddr addr,
+    uint64_t reg, unsigned size)
+{
+    uint64_t rdval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    rdval = reg;
+    rdval >>= shift;
+    rdval &= mask;
+
+    return rdval;
+}
+
+static uint64_t erst_wr_reg64(hwaddr addr,
+    uint64_t reg, uint64_t val, unsigned size)
+{
+    uint64_t wrval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    val &= mask;
+    val <<= shift;
+    mask <<= shift;
+    wrval = reg;
+    wrval &= ~mask;
+    wrval |= val;
+
+    return wrval;
+}
+
+static void erst_reg_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+
+    /*
+     * NOTE: All actions/operations/side effects happen on the WRITE,
+     * by design. The READs simply return the reg_value contents.
+     */
+    trace_acpi_erst_reg_write(addr, val, size);
+
+    switch (addr) {
+    case ERST_VALUE_OFFSET + 0:
+    case ERST_VALUE_OFFSET + 4:
+        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
+        break;
+    case ERST_ACTION_OFFSET + 0:
+/*  case ERST_ACTION_OFFSET+4: as coded, not really a 64b register */
+        switch (val) {
+        case ACTION_BEGIN_WRITE_OPERATION:
+        case ACTION_BEGIN_READ_OPERATION:
+        case ACTION_BEGIN_CLEAR_OPERATION:
+        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+        case ACTION_END_OPERATION:
+            s->operation = val;
+            break;
+        case ACTION_SET_RECORD_OFFSET:
+            s->record_offset = s->reg_value;
+            break;
+        case ACTION_EXECUTE_OPERATION:
+            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
+                s->busy_status = 1;
+                switch (s->operation) {
+                case ACTION_BEGIN_WRITE_OPERATION:
+                    s->command_status = write_erst_record(s);
+                    break;
+                case ACTION_BEGIN_READ_OPERATION:
+                    s->command_status = read_erst_record(s);
+                    break;
+                case ACTION_BEGIN_CLEAR_OPERATION:
+                    s->command_status = clear_erst_record(s);
+                    break;
+                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+                    s->command_status = STATUS_SUCCESS;
+                    break;
+                case ACTION_END_OPERATION:
+                    s->command_status = STATUS_SUCCESS;
+                    break;
+                default:
+                    s->command_status = STATUS_FAILED;
+                    break;
+                }
+                s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
+                s->busy_status = 0;
+            }
+            break;
+        case ACTION_CHECK_BUSY_STATUS:
+            s->reg_value = s->busy_status;
+            break;
+        case ACTION_GET_COMMAND_STATUS:
+            s->reg_value = s->command_status;
+            break;
+        case ACTION_GET_RECORD_IDENTIFIER:
+            s->command_status = next_erst_record(s, &s->reg_value);
+            break;
+        case ACTION_SET_RECORD_IDENTIFIER:
+            s->record_identifier = s->reg_value;
+            break;
+        case ACTION_GET_RECORD_COUNT:
+            s->reg_value = s->header->record_count;
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            s->reg_value = ERST_RECORD_SIZE;
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            s->reg_value = 0x0; /* intentional, not NVRAM mode */
+            break;
+        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            s->reg_value =
+                (100ULL << 32) | /* 100us max time */
+                (10ULL  <<  0) ; /*  10us min time */
+            break;
+        default:
+            /* Unknown action/command, NOP */
+            break;
+        }
+        break;
+    default:
+        /* This should not happen, but if it does, NOP */
+        break;
+    }
+}
+
+static uint64_t erst_reg_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case ERST_ACTION_OFFSET + 0:
+    case ERST_ACTION_OFFSET + 4:
+        val = erst_rd_reg64(addr, s->reg_action, size);
+        break;
+    case ERST_VALUE_OFFSET + 0:
+    case ERST_VALUE_OFFSET + 4:
+        val = erst_rd_reg64(addr, s->reg_value, size);
+        break;
+    default:
+        break;
+    }
+    trace_acpi_erst_reg_read(addr, val, size);
+    return val;
+}
+
+static const MemoryRegionOps erst_reg_ops = {
+    .read = erst_reg_read,
+    .write = erst_reg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+/*******************************************************************/
+/*******************************************************************/
+static int erst_post_load(void *opaque, int version_id)
+{
+    ERSTDeviceState *s = opaque;
+
+    /* Recompute pointer to header */
+    s->header = (erst_storage_header_t *)get_nvram_ptr_by_index(s, 0);
+    trace_acpi_erst_post_load(s->header);
+
+    return 0;
+}
+
+static const VMStateDescription erst_vmstate  = {
+    .name = "acpi-erst",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = erst_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(storage_size, ERSTDeviceState),
+        VMSTATE_UINT8(operation, ERSTDeviceState),
+        VMSTATE_UINT8(busy_status, ERSTDeviceState),
+        VMSTATE_UINT8(command_status, ERSTDeviceState),
+        VMSTATE_UINT32(record_offset, ERSTDeviceState),
+        VMSTATE_UINT64(reg_action, ERSTDeviceState),
+        VMSTATE_UINT64(reg_value, ERSTDeviceState),
+        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
+        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
+        VMSTATE_UINT32(first_record_index, ERSTDeviceState),
+        VMSTATE_UINT32(last_record_index, ERSTDeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
+{
+    ERSTDeviceState *s = ACPIERST(pci_dev);
+
+    trace_acpi_erst_realizefn_in();
+
+    if (!s->hostmem) {
+        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(s->hostmem)) {
+        error_setg(errp, "can't use already busy memdev: %s",
+                   object_get_canonical_path_component(OBJECT(s->hostmem)));
+        return;
+    }
+
+    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
+
+    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
+    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
+
+    /* Check storage_size against ERST_RECORD_SIZE */
+    if (((s->storage_size % ERST_RECORD_SIZE) != 0) ||
+         (ERST_RECORD_SIZE > s->storage_size)) {
+        error_setg(errp, "ACPI ERST requires size be multiple of "
+            "record size (%luKiB)", ERST_RECORD_SIZE);
+    }
+
+    /* Initialize backend storage and record_count */
+    check_erst_backend_storage(s, errp);
+
+    /* BAR 0: Programming registers */
+    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops, s,
+                          TYPE_ACPI_ERST, ERST_REG_SIZE);
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
+
+    /* BAR 1: Exchange buffer memory */
+    /* Create a hostmem object to use as the exchange buffer */
+    s->exchange_obj = object_new(TYPE_MEMORY_BACKEND_RAM);
+    object_property_set_int(s->exchange_obj, "size", ERST_RECORD_SIZE, errp);
+    user_creatable_complete(USER_CREATABLE(s->exchange_obj), errp);
+    s->exchange = MEMORY_BACKEND(s->exchange_obj);
+    host_memory_backend_set_mapped(s->exchange, true);
+    s->exchange_mr = host_memory_backend_get_memory(s->exchange);
+    memory_region_init_resizeable_ram(s->exchange_mr, OBJECT(pci_dev),
+        TYPE_ACPI_ERST, ERST_RECORD_SIZE, ERST_RECORD_SIZE, NULL, errp);
+    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, s->exchange_mr);
+    /* Include the exchange buffer in the migration stream */
+    vmstate_register_ram_global(s->exchange_mr);
+
+    /* Include the backend storage in the migration stream */
+    vmstate_register_ram_global(s->hostmem_mr);
+
+    trace_acpi_erst_realizefn_out(s->storage_size);
+}
+
+static void erst_reset(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    trace_acpi_erst_reset_in(s->header->record_count);
+    s->operation = 0;
+    s->busy_status = 0;
+    s->command_status = STATUS_SUCCESS;
+    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
+    s->record_offset = 0;
+    s->next_record_index = s->first_record_index;
+    /* NOTE: first/last_record_index are computed only once */
+    trace_acpi_erst_reset_out(s->header->record_count);
+}
+
+static Property erst_properties[] = {
+    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    trace_acpi_erst_class_init_in();
+    k->realize = erst_realizefn;
+    k->vendor_id = PCI_VENDOR_ID_REDHAT;
+    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
+    k->revision = 0x00;
+    k->class_id = PCI_CLASS_OTHERS;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    dc->user_creatable = true;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    trace_acpi_erst_class_init_out();
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_PCI_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 29f804d..401d0e5 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -5,6 +5,7 @@ acpi_ss.add(files(
   'bios-linker-loader.c',
   'core.c',
   'utils.c',
+  'erst.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 974d770..3579768 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+
+# erst.c
+acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
+acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
+acpi_erst_realizefn_in(void)
+acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
+acpi_erst_reset_in(unsigned record_count) "record_count %u"
+acpi_erst_reset_out(unsigned record_count) "record_count %u"
+acpi_erst_post_load(void *header) "header: 0x%p"
+acpi_erst_class_init_in(void)
+acpi_erst_class_init_out(void)
-- 
1.8.3.1


