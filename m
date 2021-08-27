Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DCF3F9E60
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:58:36 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg7f-0004ee-4N
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3D-0005BK-P9
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3B-0006qA-VF
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:59 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGR5BE002221; 
 Fri, 27 Aug 2021 17:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MfOVfCVOLafY4PtHYcYBB8oe7ZN33hF0Ruqu/mr2QXk=;
 b=ag4hGKEaoj2QUwr/HWmOQ1eHLAqhi3E0MJctHmiWcgFxd/13RkDePutxJC8OAAXj/Chb
 zNULNMudQJuqk7b3cv1xjsDF5KkZjKN52jmCGtr85Kd80O7MGY2C2sSs/aCQ3rD5sIcG
 HftzEoHSEeUsJnDxtkrmNC2/hJm0xIzNJaBRgBn1mbIvQbHmT1ctiygxBYvTAo+Qz0ty
 Vz6OQq+EscOo19d1LDgCzm520loGNshMaeRzDdmHCqMYqwcgIw0JCHC1HOX9KL5O8tau
 1atH7U7l4z83sqjRP7RPpo5YrliiQCL5DK0lV4Emo/UhjHr7EQozjX0FMvErWhgn4h0e nQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MfOVfCVOLafY4PtHYcYBB8oe7ZN33hF0Ruqu/mr2QXk=;
 b=Z83SCErEW8vzHHOdkDD+nrBJ2VWAO6fvuSUb6DWP/HGzjWn2mA0PV+CK3YNjJ2rX1Pah
 Td4uUWHeRYKFWvbtHxGsIMWvYE2xA++xnUKHjg08AUz+T6dHTfYDD1g0axEiqJs73h9v
 vocF3tLQBhZ+/xfX8SA7liK8HrQpH5nmhVO3CLJtlTlNlFXy8ZFmUxGIBnTs94zRpkFN
 HqqdVUBaLBQen7b/2ey4oH5WodYIxOT8rA+aUzhysBZ0qfKS9KUvgjJlixvONgK15eQW
 ZSuH80rB5dJKLKkNOEn4LQ+YqUW7nZJ5NCUr7jgXiJHDRsoULJ2yPluWn2L0vzRzJ07X bw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3apvjr19fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHplWr005510;
 Fri, 27 Aug 2021 17:53:53 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by aserp3020.oracle.com with ESMTP id 3ajsabkbwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOt6h62+4WuP27UTSWumiCXdlYMxG4aXshdBk3R9kHbWcPtElMrMwRYVGghtQHVzU3Y9c4+cFGACWKUSSU18wZCcF/AyFpBV1iXGnIE6jUlpTczcIK72+AMfEBtK40VVoaT2ghWGDN8o57STuJugPWgA8oCVwaQ9+F/MGfmjHcNNDp+5smvYp4btaWPfl41M5xhiPesJELv4buVAGHSg+LFpJ4PW0yk+cJps6uMKYaD9ZV6zexMfl364xHVazWz0K6//sdzoZpURVdpBcermeXp7oP36RupTYKTdML6VQ3DktpLb7Q+x9ICu0xQg6REPgGjvA+PXLuCh/QEH0qky+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfOVfCVOLafY4PtHYcYBB8oe7ZN33hF0Ruqu/mr2QXk=;
 b=PZoParB37JM/UZpv9I7dG3UtfuADE9HyyGORrjiu1Unv5uZFHazLKyLxjgvPBfkX+blj8wYAELN74Slce4o6N+l8z3JDvpYUPEte1S+1aPnrBVoJSEygEwdPqHTRhSMKilPlHBboxoKGXqc4AlZHBmnS1zmW0d2Kx+JusmblM208mgGytOPMh8v5n06k6gl5tlOIQzzLjxsnoOongm99RGsk+AwLHGmnEwnYojJB7aNc6aJnC0Gx384G5TQoDA3Vc7I48y86b1lgVvw5fXAZ2Bvx/6IFrSpICffjiKZ0ZDqpwi7Foeyt8DaybvlWG2vjsEw8RnKHrbQ9wers4YTI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfOVfCVOLafY4PtHYcYBB8oe7ZN33hF0Ruqu/mr2QXk=;
 b=lA/uEXEb1fWPEqpHZm950GYlwvnZSep+6w2ULPIsxBZCpD2N4HH23HhdOp+CaNXxh1s4gDdTRNSRNY4ZKJDzv+SXem4kONZbhDeqe5vCR1rcAD+PVf4afal4SW7zV/GZJRpJ9dLOZ9QyV9/G8BEtWbdPTNn7rfsCC8W3//oyE4Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:53:51 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:51 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 04/11] vfio-user: find and init PCI device
Date: Fri, 27 Aug 2021 13:53:23 -0400
Message-Id: <a7c0072a7232da2f3aa76d9cd4cdf415fd1127d1.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4c96921-563c-46c7-8224-08d96983a0e5
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB48654D866BCCEABA1BB3BB2B90C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BbouMk5Yhi1a+W7t3JI75R1cXQqmUHBAvKfPOP5inzy+kl3EQGDgCo6ss0ZohF2rtheE8i7DQFMyPOFoGvd7mbRrqWX1NWHutn+usq84YBVExmXebPHcxiNpRCZQZ3HLJDQbF+9TUT8ADpbUNgIkGkPWai8uGiSP70F6qJCL9mm00+l30mvJ2+7AhkfTewdQa34Dp56byC+9581lIz8zvCoIvgVqa/vv/6GsrsRkM3TRi9mOpK2B2ZBowJGv03wd3TxjB3f2n0LcMhQmlI/D1O0uTaqHvGrE59m3iG7vYFEtMBn9DKWR3661SDPgGeOFTu0mWEdSDXru9KHXIXLiBR/PgG87onxxsj4EMJllpGZH0oQvLZ8mQtmzoP7RNmNDlEc6J3HBG3JbaXfLWcl4Td9QPRgtAO49cMntJq+TTYUEt2MfaTEU400301f9DmHj9K10Ii9zdPDbSv/BjK3pYHwX9NDxhxZ5Blmd2iEU4hXMUWZELZIlRnqojESfsrxa+V5cBZ04zG7OaN+vWHNwFehxKTG+BIW1jShDgmE9yh9QXyVyn2rL8NEocm6Sb768/8FJpx4UxJAdk7KLzWxKELfdUWglbx+iuabeJ0VUpEIVt5+HhuPcBaG1in1/CDjxd0FrqzJY6O4x+FRKk10Xbjdpc94xoYRpBcAx5SgqwY1eKc6gpTZBlWzc7zrjIIyrFGYYXQp8mJR8YfguMZ3a1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bkHbiH+ThENGmM2CTSGiJOzI7mkmHwp8mWvcMyHZZl99YAZHbF/tt4NWOLsX?=
 =?us-ascii?Q?fZOqCB9yQzrDMXEXBquVKoTfUEVr/jHCwS4ImR00wkTVEt5Ff3yFN/TyIDk5?=
 =?us-ascii?Q?QHJGIMAJC2COuJX3YuYI8djcJkGzaJv3aoebFg7xnNBYWW3rq8kpMBBKg/13?=
 =?us-ascii?Q?mdMzFKZlXiVs2Du516Q81XBo0N2YviERxZ8WaGiqkAyiiwdI9Rzoku9f2+Jn?=
 =?us-ascii?Q?vaTzVvJ/thaJ2zyiAkh5ZE52l7qLENCF3DCrpp+6suBRzrduNIxQpR5sdIJ7?=
 =?us-ascii?Q?ZIHI3tfdbTuYRXbYTRvwS8YM5/rctxtw2AlYHcCqYBBAFXoEwRUX9CMQ0ii2?=
 =?us-ascii?Q?9gXWTD7lXo70MI5dHwPvr6zf9AS1HDeenOr8Qxr5YgIERI4F0F6t+HXSyIEe?=
 =?us-ascii?Q?Whs3SiuotOX6aMUTzJQJ6y8nagXYIhk0SkMKrG+8wo8rRIUP3Dl7yUFerJFj?=
 =?us-ascii?Q?nAcNNYrv5JuPsZ1PaIaUy3r5UHH4fuNtbUIviZQChtB/Pi1uQcWInHbyvQbU?=
 =?us-ascii?Q?9RIwwNTOJpYVc4fnJ4j4WE/aA9zo9X3S8yBhgoDjzipfSFTaT01u9dffk3+T?=
 =?us-ascii?Q?zvzuDKmoN8Dylf/G/NmYOuZcJo8J/o/FVJJborAE+oq4VHhfr47nYUWWjytB?=
 =?us-ascii?Q?McQVGh6Uv+umoMEUEY1ybkMWH/WPwrtfDiZWQD42O3vZLBJC1Ba4y3l8LwVK?=
 =?us-ascii?Q?0frB7YWn/E94zW/iPDsPBKySeGAarbSS3fKW4l4Mxy34rsbUu+8ygYxexP/E?=
 =?us-ascii?Q?q70Vs/8gvgsRg51GgJPbsRrvBjs60TIfYaFMB2uH2Zseak6WGZynV6tXJjfm?=
 =?us-ascii?Q?y/VUsSrt/cdHjlsr7XOO0/mTC8b68BzWs02l+uU5y7YCM8R78eVPtZBNdPSN?=
 =?us-ascii?Q?kY9eM4Qt8GLS2ACTwa11JXMlycCJyNWt2f+R8TseeW8YDMPR50vNXqab84xh?=
 =?us-ascii?Q?NoAYQlSNstpEopKdK1eS4OdoI3gE2ccSev4xocq80fcjwYCA5ZKPVCgUpa/V?=
 =?us-ascii?Q?nw9r4pgYCyKKrE4crXuMSJuLtuw/d55wFzgm0pTyXDKNvCLOdsFS/dJmJt3d?=
 =?us-ascii?Q?eIpHK6OjtqOK5DaqkYj8kErrCScgbnij8m3jLaQjdHSXN96EiAM7CkXdc6ZA?=
 =?us-ascii?Q?m/GbmcrJ2X2oM3xlG3BHUAseiS3WRlj7MU56Zf/FP/1uxwiPFdoI+fAYn5dW?=
 =?us-ascii?Q?fCcwKqXMHrvA/kG9eCw3T1zlYvKvtnJr+GbwnV6Z1JApVtWU+f0hCQn/QpiW?=
 =?us-ascii?Q?44BTzR1nfa2UKtXLFrCF7aUBF8JRkq7ZbPZI2gyqpOVHXnZQ7uZV11IJJVzk?=
 =?us-ascii?Q?ZdGF1lVuV8JxAOMLMCeAWSy+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c96921-563c-46c7-8224-08d96983a0e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:51.2952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdLFapZuBVEI4XY1utk1IUDaFih8HccH5HZo8e/VFCRfeC/CV3rajcCkxf3OqURqEEXsHNMmy2QIPLP5DlAtKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270105
X-Proofpoint-GUID: dEEBpvdE-VzI1-1nIIRNMdR3hJFAt-Lt
X-Proofpoint-ORIG-GUID: dEEBpvdE-VzI1-1nIIRNMdR3hJFAt-Lt
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 99d3dd1..5ae0991 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -38,6 +38,8 @@
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "vfio-user"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -61,6 +63,8 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -88,6 +92,8 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    DeviceState *dev = NULL;
+    int ret;
 
     o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
                                 o, VFU_DEV_TYPE_PCI);
@@ -96,6 +102,28 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->devid);
+    if (dev == NULL) {
+        error_setg(&error_abort, "vfu: Device %s not found", o->devid);
+        return;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(&error_abort, "vfu: %s not a PCI devices", o->devid);
+        return;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    ret = vfu_pci_init(o->vfu_ctx, VFU_PCI_TYPE_CONVENTIONAL,
+                       PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->devid, strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
-- 
1.8.3.1


