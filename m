Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE43CEC3C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:16:10 +0200 (CEST)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZgP-0007n8-G4
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRk-0006Og-NE
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRe-0005hj-4F
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:00 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJudOH002502; Mon, 19 Jul 2021 20:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=eURXpfhGODLjNdZvfIWbtuwDtS5SdddqepiXcpaXyLc=;
 b=V6luWgqNeglukkKyfG9N7PtGu6ydSQyzy4+cs6Q/4HQ6GNxnqlaaFj0uxR56zpgHF+Xy
 VKkFZbyhtAYrOWHcHtd65hgpLfy0014MYJVi+aimG/ClZ5EUzUHOEvw8PqFUFR6s0I7A
 6YvpLinfUgkDGDiuuoLmZbJpDq2A6iZQaZ4c0sRnYlBrPlqlyuRa8X1p4kzQ5zU28LE/
 Wm58Jpk4viSGg+5pQ+OUMlkXTxqSA8j6sv1PZHPSYEvzN97qgzxCS6e9wV5vLBgDA74v
 476Nx/SyXw1VJvPbZt7dSnYfK1LYGi5ApK2m9TkI6c0Yb+pbQ83oMHL8A8MxJ7fKn13J xg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=eURXpfhGODLjNdZvfIWbtuwDtS5SdddqepiXcpaXyLc=;
 b=rsjoiqY924pynpBY1ddEwZgNnE021pZScxmHDrOlW4ucf7z5qPUJeEsu2D8shKHabttZ
 4bS9UR5C6B9ZiOaXd0PmogzOd/zRf3nqc4LjW+7HlFVGdUDdbuVoocim9F/lRyf7KRqs
 9jD7FljWqEhcHlLol44UcOU9CdXvrzKlA5pUGBxirTzYa6/2Z+bc4MWcQjUO3VCmf4i+
 D6rwLV0GNsRx97jp9FEicfmxGMJMDxvbS4BvCZIdQiKiC+4dndZKPdhFXEB1ToPP4oDP
 4091UZHtR6W/0TNRvXjflBqivFp38h8/U4XlpM0VjFNkydEBSRoUYBYUdReAg0qSYJGT zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5ja0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0ZpX127869;
 Mon, 19 Jul 2021 20:00:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 39v8ytbgn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8gyk8t28a5qGVnUqPyogqFTwe51Np02ebXDeAtSzSrCSFariCJ2hUmP+dbeZxEHEO1fF60KxYJw5POcW7DThSm1/kENv6rMWfUs0Bhb/xJVxRKU3uS/olvwMCxJhywGIOWTQw6QizULHsM5vQ9iUFiCEKsHK4a9ywnDvPaOapOLHxWFS8UHaSaEcibwGqC8b50CyKqb6dGU9RQPdLGZ1JmwliiCwhYJRkGEOXFuMD2wTVhlXC3TGXwRB3R4kqwTcaezasy1Z4e+raAhA5g+x3AHcjBJusxnFdMQc/+W1DHlyt5VHW/XaGn6PxABC18P/aCSSIS80bX7Ctyf6H3pSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eURXpfhGODLjNdZvfIWbtuwDtS5SdddqepiXcpaXyLc=;
 b=V6zq3KVXGFKiVO3WuK6e00WvA6ryXP/YwVSeasWwvlgSyWTPIsImQbs3blkGuALr5ZD117TiKkFoyIJMuoqwLM7DuAUkG/3LzucnDV9UcPCWvZh9O2ztRvVnQN+2D44kMHlRJ8vuP0trZrsVrIbP2O0qFqLpnZAWV1xUZlcMzPdPqzEH3sD01fct7CkclMfufBuNw0cuoNBbOdGbXL6/3DGwweNexqlj0zcCWU7m3TW1HkrZMHDpQgV1uO0Xf3fppx7hgy8IET4lRpZk+2DzAns9aIbN4d64SyXb0ZtpqBwtT2NU0PPggH3+6JaimxCKT2j2tQT3l0x5tU8BlPh6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eURXpfhGODLjNdZvfIWbtuwDtS5SdddqepiXcpaXyLc=;
 b=h5sNnFbU6YSdomWzh07xhnIkIc9I3wqUgolOv3olju3d5DgQTiE/gndVs659XRwa5rBVAfFGmP2gadKpm+UBp8Pod3UbrmVSPjESeA/FSby0yXVqcp1X8+FKloHjuEEx4QvFx6tB+NnPJ4fItti5CqZOfxR7syYNUQFrCCTl3lY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3792.namprd10.prod.outlook.com (2603:10b6:208:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:00:21 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:21 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 03/11] vfio-user: instantiate vfio-user context
Date: Mon, 19 Jul 2021 16:00:05 -0400
Message-Id: <6d28f979cc237c7c02527de9cd92ca95763d984f.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ca13f11-499d-43c3-2a53-08d94aefd6ed
X-MS-TrafficTypeDiagnostic: MN2PR10MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB37925911FE39727FDAF9545590E19@MN2PR10MB3792.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Soac/hb3cF3PhcnPJ4fgmp0ZpeXxuuoNpm+9fSOKoLxzwo0YSM/tMbdjmWvXtrX7C/6ywxxBwfuKtH7A/17QwO95QD3IIbA8ozF+4RB3mzs9VQ128vF/+cdQMLmQfrRHcuyLu5NTDq57xpYABN/mjkwDu+ZAi+5mRMsDJz8BxCXNt5ARv8NSq7Nck4dOIrKw0gtWXQetR3xX7pJ9uZX3cvyJ9G7M6n85GnI1w5drzQiSgdNHd/z9bMOg369GeESgN5sUYvvhEpjefEfI68NHXpI8hWQZ8jFXOpFqQWaOScKyszn4wJ8PvqXS/MnZDGzwrfiFV6/jGcFM1BPngR32V/Uz9q1cnHyg7OzuSFgs3tArQU/S8k+WUApJqbn4ZLoz28BvHIRK9khmJZZJ6zJKZr18KGXNiiGXtS7Li/HTfnZBeROFu/da+iDYq73Ydwmt1SHNky/jDjtDm0567FHMF+woFxynDCDKqthg6KBkdOCXR4wUcaK2e9ZGddmpnEvF9aCzRn0u626KNP5rIkW0g44lIsHoiyz4KFFjJ7GHWVxxXEMZ4qzub4rxr7T1opdRZ0yowaHBgJTP5rI0vBn9oAuQiJkuK0VLdQm5MnuY2xIO3fsaoW6QFkCasMAOT8JrtBVkxeKOnPfu0NOFhCrUDiKXqGUHUMM/wozVAMz0iwRYeF5s6m8Pqwp9KJO86iUt2rJqhbrEcOsDiSC0TnGonw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(107886003)(8676002)(478600001)(36756003)(6666004)(8936002)(66946007)(86362001)(4326008)(6486002)(186003)(316002)(2906002)(5660300002)(52116002)(6916009)(7696005)(38100700002)(38350700002)(26005)(66556008)(66476007)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8jxVQoPzBazVqc2jlp2wsB/QD/ktpQk6M7XBus5IyNyVHQjSICd02t+LQXfJ/YAwDkxNw16ZRR8+o6nME0anEE1W/PDEHamMbNmNasSsbjLU1671P1vyKOLeYsSAM/gbgZ7ww7OaqWEe3uz+mK1/krTNvOAm6v+h7VBY4SnB4autGyLeRvmF+vP8UNqytwRaI51nkYAMvvmyXiANaWQDEDMCYzVevHZnp3VtZFohuMDrbD8HkeopAjbCatgw42Xng6219cN6RQJBv+rH6KHXYaJEP1cT4/FH+7oSPgNwaSaf97Axo4OBUanQtGGJvK3CgpCieabu5ilGL7sA7M3ByzmBLAI8TzFv+HgRuaf+tzKoiBOLIWYoPj0uC5QR4bCOVT3r3jhUQWUs9KDyjzDsBBNvsMpGn8+Kq6gPUH5rRAKxqfK4XVDvD7GzYZSQfyejPq3e4S5NQVAriLvexNJN5QYiRSKXLVA6LG9KocplCgWVR92bk2UNsfJHVXwBvxUt5p3WuotIHD4F7fTdeddBB1Q34BdxhoXF9j2n5608VgtawCZpp907XwpzJm3rbh28HofW8wPH3by+bi2WxQyjrm4kLZcgRtpt3bf9pKNKa+dfSskcDuz9wuTjdQcQ3sEXyWtMQgoyc+3j/q0EBFzJpnInRJ09znjuBxY5eqjubzpFLYOZvNc+1LpkkGKxv7eV7m55NS/8AEiXFEUv0ASfuhdHb3RQG63O02DIyfH94j/4x3A/1hXrce2S3N8trdgm
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca13f11-499d-43c3-2a53-08d94aefd6ed
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:21.4971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2Josf3yzx5glo9wVnwwYb0OCGGPqeOhTv2rZ6LCNRnxMagSih3ouX2f1egBBaRmP3OPuKmBi+aaXcPtXEivdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3792
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: 8A16x5UA-mE3xXrMP26de0sRfx8ZVX6q
X-Proofpoint-ORIG-GUID: 8A16x5UA-mE3xXrMP26de0sRfx8ZVX6q
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library for a device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 5098169..adb3193 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,11 +27,18 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 
+#include <errno.h>
+
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "sysemu/runstate.h"
+#include "qemu/notify.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+
+#include "libvfio-user/include/libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "vfio-user"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -51,6 +58,10 @@ struct VfuObject {
 
     char *socket;
     char *devid;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -75,9 +86,23 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("devid", str);
 }
 
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(&error_abort, "vfu: Failed to create context - %s",
+                   strerror(errno));
+        return;
+    }
+}
+
 static void vfu_object_init(Object *obj)
 {
     VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
 
     /* Add test for remote machine and PCI device */
 
@@ -88,6 +113,9 @@ static void vfu_object_init(Object *obj)
     }
 
     k->nr_devs++;
+
+    o->machine_done.notify = vfu_object_machine_done;
+    qemu_add_machine_init_done_notifier(&o->machine_done);
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -97,6 +125,8 @@ static void vfu_object_finalize(Object *obj)
 
     k->nr_devs--;
 
+    vfu_destroy_ctx(o->vfu_ctx);
+
     g_free(o->socket);
     g_free(o->devid);
 
-- 
1.8.3.1


