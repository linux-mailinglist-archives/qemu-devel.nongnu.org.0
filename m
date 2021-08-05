Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF843E1EEC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:37:44 +0200 (CEST)
Received: from localhost ([::1]:55740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlzj-0002rK-EY
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBluD-0003lF-4l
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:32:02 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBlu7-0007AW-Gu
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:32:00 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MVpa7016768; Thu, 5 Aug 2021 22:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=59x1T9zv+o4pJbI37iM8vQupKYDFEzPsrOXGN0yNsBE=;
 b=untneudEV4rpZEVTNgJ8Bme4i5FGByiMehGcGj9inlM8BbO0M1lJm7AGd1RY+zfn+Z6H
 +6HYrJHfK/NWUk8Ck73aSWmuu3dkxS0befMClyc8QBd9o4lqQaRG9DKlV9iHYDH+Sqvp
 5nRXHHKFH0nn6HG8hwdkQGTcx8sDp9O8AYfCb7WWNgunfIopH/HNSalAwUx0RxVljsbJ
 GY6NTVasvSY3RXlZh6EGojBt95NDKvHylOrfiStE12vXvQPK7Xa7F9KDgB/p1fvdTFjL
 VX7L2KbcfcwMxRqhcjIga5aIS1bZYsovxNguTEz/K1dFepxM3qsK43iLs1S15Gnx+c6f lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=59x1T9zv+o4pJbI37iM8vQupKYDFEzPsrOXGN0yNsBE=;
 b=IAs9Yc5NR1u9fnHe//ycjVlhISD1FeZfJWOT+1E47JGEilpkz1OlB/EF7GASo6/RRON5
 whizdqG1NeIlMaTO0/GvSNk4zdYAel47hRZNfOKPBiJYYOi5q8zR3DYdOxgNO88MZmuu
 ntcf8wYHPezOh12gnuPanKjUY6/AR7cru8F+Ywf/QxE9H8b1Ywf5y+N1MOUGUXLusxHi
 HBT9LrcYNuKoXF7yymqTHOjmEv1pQxgXFZbvNWJeoRHLZUHHeQagY/lE4muZiJ+zPizC
 r9wIYIdscPWmfsKm4N7SFFSWD8UVVVy8ZJQQ43oMk69PC08OrLBRiXDbIOOghqONvYXY TQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7aq0dwks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVYmw008792;
 Thu, 5 Aug 2021 22:31:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3020.oracle.com with ESMTP id 3a5ga121ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axBWcMt+cYNmwqRE0I5iz+MF1PoA9Iq69OD/LdFqzT5YViZUaMmaLk413w67/XGFCss8dOatgozIvwBRvgFQBpEsn5Pgccr+axlm2mDzMQCVT/5zaDLfus+0uICfyQ5XPTvS6plUvBzGuCYDkdW9O0F1tsVsYkILv+wIqe/iKFtzhlXFIvMLEAopcx557fUkQH1E2dPqTXiWy7DdjPid5Z57AgT3DjxA7YUM4KrjVlXSQJnFIjM5y4a3ntyqdb49A9SroQ9eWgjkFXtN4sHIpZuK1mPTCqX04/uyRLPWztYjzTgabtzksmEsAj7/UWzqvjtn4mxB5XBayelyWr7Y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59x1T9zv+o4pJbI37iM8vQupKYDFEzPsrOXGN0yNsBE=;
 b=NEsDuSkcs3+bPi1+bDlCmHao0HGtcmsPmp3DbFUQV5j48SPQplq8QgHEo0HvgxK5EyhnntGvkLWOtRh358zSv+xhqKrs3lD0zwPTiQPL2xgcnTmbiBa5X7QkN5nuFPWkFKZIL/h+UGHOyWYoAtqbFjtF2sPLekpRXSwqkLRsGHs2tQQc8qT3HrBi/piSgCJ742kdLafCiZ+/cF1Nuy81YVblpdor37cL637MiWRy3Zy+693DoL61Bq/OkARUY1ZYJsJihYy3T6/Z4JMEwKilN2EY5CP4zrM5dC9QvzQQewYj1D+P2BP68pmd/m0qFiYT2MCe2ZbIypDoA1tZ+RKrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59x1T9zv+o4pJbI37iM8vQupKYDFEzPsrOXGN0yNsBE=;
 b=zZQjE9BVos5OJxs28GFyZ7LWtKVeZFF71gwNkhOE51r/bsjJZLG/t9A5YQnoIMDp7pOq5Zxu0GF3Q/xo/NFR0b9RsdMYkvXZR5IFdFvOFTjrWWo5uLehNozF7VFfLFHMgCHN6llLnw9nf6gnM+QiT6vkGMMNa7bM7rQWeUCkPuk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:24 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:24 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 07/10] ACPI ERST: create ACPI ERST table for pc/x86 machines
Date: Thu,  5 Aug 2021 18:30:36 -0400
Message-Id: <1628202639-16361-8-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 5 Aug 2021 22:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ad8f27e-85b2-4f14-9e39-08d95860c1e5
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2221D24475425CD28725227D97F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXCj8t5hoo9rntQrgXZaI/K0on7DI/Ig75ewfANihgzvnRpeAum1eQejRaM5qsRahDgQiZnuVjr3177wE7aox0pnHItalBlC+PTl/ZZyP5qB7Fpy7+MPBO84eUb3p8MFm098CJ/z6Bv/uz53G0aywI3TUYpIUZoxCCv4IND8xNHhrj3nt3r24QMEf7Lfv/nxyeLpETxyr1dNWVO8dYbICy4lA7A6fyFOMN1FNmPReFelfpTTgkYoxFbH8dYGxttY0sUQJafXWCPzbyeZwpSEoJ6SMTKwkzEVvuanzRvAVlIcAbsVVSJAad/sPh05t5+T339H51ARSJN4e0595RQEqOee7ED8NjKNOwaRpFhB2WBtmjzny+nEu13PS41N+jyd1F+2lpHbmzjyN9oqqYs1c/3mlbFQqJoALjHYAvXVXUFId3VAdyVK9Y3m3pPYziVGHtddzh4gh9AYGKe9xlx086PE/KsKsXyn3wmOpaXTFySn3EsWZVrL20w+rroWG2D0+f9kTD2JwT8jgnIjb/gzueJUsH4ZtqY+q3mhNoCIykC59ml5vN7Kmtj/y18ipds38jNELhx940rYMeajsQDx10UlPHcCMjbDsLfRxUoykOtKbLLRAjr0OLWMzbHpUWhShZlLu50/lrMDmZpFE3FaNZNdyaL3KqPJX5aXgmHPxsISAcO6ttN+drIBpnthYlEQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(4326008)(2906002)(26005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8RHlwNg8KkJ9IzQNRaIMpkHur0ZiheIqWXdXX8jSDV7wRdeWdR4X6gLns7l6?=
 =?us-ascii?Q?fUrpT4U5ZFGCn+KQ9jxIxBqSzDg3JytzxrVpevD6uOQsyI9U5m5WhMxipQip?=
 =?us-ascii?Q?F1lgnMOcAqaZnIngMUZsqQXa9gcvYqayTiu8b7PkChRrOluso6I+rTqmSnHW?=
 =?us-ascii?Q?ctzBB2y5zndHqSqTOScK+b4WU8JlP6Oz/BChl3tIvCMtPFB81UdUefACkifp?=
 =?us-ascii?Q?otW2YJ13H8Vw9hsdsEdohb+RufviVjOkWBS+GLBINQh/x/dnle3QqDPe5gYf?=
 =?us-ascii?Q?TvVHMuWXba7WypnDw25eO09D9UBj7t9dLm5O0KtEOZs4FlRC8gU5IloJGIUY?=
 =?us-ascii?Q?fHXFbaUPUrMtqZNn2VIbiJTWmTurPxVZwHAFzSXCBVDWpTga/L66pNz3D+aV?=
 =?us-ascii?Q?kryjBye15ei/bklBwf2d1hVK+KnFEkGlu8nGGfThRt3x1lGlzn65vtG0XhID?=
 =?us-ascii?Q?2wNS+hKlkubIOPaW4KLOk67IZDGMXv8TQ7mvAzXXmQCmRCs7uVBRgBugMk/P?=
 =?us-ascii?Q?QlDzEirUlGoXQsifH7TTrs9xu4RE+iUmVkYeibFNcWhBH/m8apTl3OKpi5CU?=
 =?us-ascii?Q?sXjQwW/JB0/ev6XE9MWe5mDYeP98XIBTKTeqsQNUh0uerVmutQVGdYj5rh70?=
 =?us-ascii?Q?nLXw+1ebKSuCuGl6XiwNHiWUtlEr+b04IQ+HHkOYiBs1QWYtsmaNyx1XIyYz?=
 =?us-ascii?Q?3gbGyRvzNpJhoXHvn5YZ4GLVAWmLOiUVu+pL8xZBuUzvxSJF6zInPzUDfmD5?=
 =?us-ascii?Q?ZNqoLuXpJ/fR5cdlmU1DT2Z/C1AOMV6o6GDXhGpcxS4RvdBoUsvMNBglK8z2?=
 =?us-ascii?Q?ZXRkX+g9Rf003sXknznUtbEshIWYfCaXzQhEB1OQQRat2a9WXUSFXWHCVWjI?=
 =?us-ascii?Q?oNSG8To4FWbS5leALQuvmuK16FTLeKfP0KOHUCtFjTNKLNsPCvxDqMRTQiAP?=
 =?us-ascii?Q?H2btohzZOsNBttNu1wrrjm+HXwZl4LrEwc+dbv4d9XqGMfn5aaD4OJ3x1rKR?=
 =?us-ascii?Q?0fn0kjRiTSgpptUnHqO/deNl42cGufu0iUJouutHHHEg95uYuucX6ibev92P?=
 =?us-ascii?Q?cSsHSGDvTs0SXYXjL4BY3fJ+i0CUnbHonrYJqkWbEYZxJ/GcC5aZz0fACR+v?=
 =?us-ascii?Q?HU9pzfwzrA16Cpsr3cIf7q341TZHZDYak/UqgwZNzWRZr900q/P+cAkfscRf?=
 =?us-ascii?Q?xYSBNQjziYmEVA9P96qzBKsruqr7SNR+Ud08fZ6KFMPsrVeSx0DwC3SIptJp?=
 =?us-ascii?Q?s+VLavWmU2CbNqKcFRH1KiYPoHHJX4F8pYFTew4xcKVDxpqDmYIeEuYzw9cK?=
 =?us-ascii?Q?3IExM8xNSEq+FD8j+fjLu0f5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad8f27e-85b2-4f14-9e39-08d95860c1e5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:24.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5JrEuYJo9m41qvujgkPgIs/n048eXKEWHCZkKYOQiK+zIok/Qy7ruNNIWROpYK7XNwMNb9pBp86PhoP6viNlN7IDVcG9ExZnc/PxLvKjac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-ORIG-GUID: 06gi2j6scbEJGBGSgqQ2UucVSUPf0DSl
X-Proofpoint-GUID: 06gi2j6scbEJGBGSgqQ2UucVSUPf0DSl
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

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-build.c   | 9 +++++++++
 hw/i386/acpi-microvm.c | 9 +++++++++
 include/hw/acpi/erst.h | 5 +++++
 3 files changed, 23 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b..b55a548 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
@@ -2443,6 +2444,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    Object *erst_dev;
     char *oem_id;
     char *oem_table_id;
 
@@ -2504,6 +2506,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    erst_dev = find_erst_dev();
+    if (erst_dev) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_erst(tables_blob, tables->linker, erst_dev,
+                   x86ms->oem_id, x86ms->oem_table_id);
+    }
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 1a0f77b..6578254 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -159,6 +160,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     X86MachineState *x86ms = X86_MACHINE(mms);
     GArray *table_offsets;
     GArray *tables_blob = tables->table_data;
+    Object *erst_dev;
     unsigned dsdt, xsdt;
     AcpiFadtData pmfadt = {
         /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
@@ -208,6 +210,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    erst_dev = find_erst_dev();
+    if (erst_dev) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_erst(tables_blob, tables->linker, erst_dev,
+                   x86ms->oem_id, x86ms->oem_table_id);
+    }
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
index 9d63717..b747fe7 100644
--- a/include/hw/acpi/erst.h
+++ b/include/hw/acpi/erst.h
@@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
 
 #define TYPE_ACPI_ERST "acpi-erst"
 
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
 #endif
-- 
1.8.3.1


