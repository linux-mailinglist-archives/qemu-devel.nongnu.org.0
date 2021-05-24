Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045A38DF7E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:01:45 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0qe-00045s-6z
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jI-0007G0-Gi
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:08 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:46401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jF-0003Z5-GQ
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3sCT5W1tBvZkvq+lHg1ihKqRhVk0RebQbBrsneV9L4=;
 b=jmPpW2v0cEDqfYLSIKYr35HDhkfCA4XiLsfhjzzoeLH4E2xamtYejmsnn98oV/oTx+bXM+
 iletMqKcfho7OX5JtzjgE1rmURd8vKCUOH6A/nN5Xn/oz8Ui5uvM0A8yTlNqempoQeCjmE
 mHA3BBj+CbSYa5Luke6ooZBmac+3l4I=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-Z2xfQf4pMGWfBfIB9WZ4Kw-1; Mon, 24 May 2021 04:54:02 +0200
X-MC-Unique: Z2xfQf4pMGWfBfIB9WZ4Kw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2iXoxVwJLcB2hJkB7SCSzNaxr3WColN3dZqgfmhpqCXHCA3lJVJmWCOqrKim+YNd0DyAJWOwrDCjgXjckJd0jw4719xtarVU9KzT4xh69VlRWewGsA9dADcz6Oli6AptGBmsIhoajL+jz6ilyh+ntU198uDJFlvF7aw4eUV3FjPLDseWYQh82X48G2NV2mLk0p8z2/JHGZq6FdXDbvqk0i179iYWP8/kDuZVEzOj/KfzKI/znURYtuRM+NTKVp4jZZkkSEFifMB8nIkxd1sS/YQjWmUTspO85SYxku/GXNX37Tyaf75bPT2XxG2+NOIXuYMcMmtZOAmro7KsWpzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n0ZTOG+dRJKW2hny/Jzx4s5h2ksWeT128zuVixM5OM=;
 b=H5gZ4PtFaHnTukxtgj/QKs/qCs7gte1/gnkCC+HD3qOoocHtq97ZA4EBx8veGcZu0D/vXFtPrTS9zhHy9WqLdcT9rattyJWF1aVTPq8ADRDKvwvsLkenvJ2aoWmHKSqFWQVaH3JVWPoOJuF8LQLBe34YCLILDpzt3hs+mbW9ipSzri2aYZalpVbwNTy5ymjokSBDRBaKoeRhXCsOrHtn5CbrK4jhwo8OibSuxLwRiQ+eIzz2lCPMFYmxSGRSLDt2wtSykn9aTfs3QCHIWP23hha7mNVsUh9BtY92Pj8hHaky5mlRQANSbSApGCUsvZsOv+LsGpsY3d1+mhHaleuc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:54:01 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:54:01 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 12/14] target/s390x: move kvm files into kvm/
Date: Mon, 24 May 2021 10:52:54 +0800
Message-ID: <20210524025256.22252-12-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 828365d6-18c6-40ea-085c-08d91e5f2f01
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126782E5B8556752983FC7EA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4hjzSkiPS0ciwEaAQi7Hpt4vbyQQWr2M+N6NI4PEIXT44PvoxrBRgg8gNE9/ctlJOjMNcQnyr5tRVTI3xxy0+8RCg71Ui+7KIlo9oa0zxYMea3up5MjSzoEcOp5WmQaKxhkf6aJn2pePC07KNm6zf9onUqUd6SJy17/3jAZPIWNq3uCYti6M46Sw3PL94XB91KVk21FQZgqMZbGl/WQHsP7FO8PpWRGwrtPye475IHZvq/wGKtySAftkMgbgpOuTOJeXz4U84pISRIgyh1LXiLEzPyLD+w6oicJiEPNM0eJTzhmyeA2H08iz2iCy+kqmbIIJnhWbfhYb6lRQem3MMjQxH4sqHpR1sZ+UKhw2GtqW6v3eCr3xr3LM9n68lR6tOA2fFXuR2WHxhOUleHGlEpJnDrzKDVtkNRhHTXNBwkUeKtz+gFAk8oSjbUNWuwuqlswDtXEtcv5MLoGk+4oHYqfC/70n2f7x0m3fcU7gx/0GDQLiiBIEPgKcsSnmPCKjgC45CN+Dg5qHVDBl+h3Ai8s1goHV+ilx7Fy9g2lrUCE47uzECRckY28MRxijBMD2qxOyKoBRmXFdwQXcZtYtTA8aFXuN6WGJSG5HcudScDbyPwkZlHhZD6pivx4DyUs/DVe0G21AMjQLckHIwXjNF+TSV1/phSm9Wk416xOCgAnp45a2T0SLxz0UqeF61Y0W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A1FhjScysj5iYPQ57cy4QKJOIRvliu22Cf1QkUxnW72Hk17QiMqzEEyuXkpg?=
 =?us-ascii?Q?ZL/JsUH1w+qD3OkZHPCgRQYGfzkn3NSh+BXZbYg+5KF+VOmbIFNecj+zNQDW?=
 =?us-ascii?Q?jKqVoUP2uYBV2FNfr7c/wrjsjvY+bOWdhRoVx2BXDDgyRn6l5nwgu09yH5tv?=
 =?us-ascii?Q?lBXAmxVPQWBWec9EeWtzuHB66wIim10xKwoeZycVVuE/LY/Dyy2xC1U2l8eJ?=
 =?us-ascii?Q?KJ6MtiqceeSRVF5hWkRUi3tcXjfjKFMrhYlfvyDA+qvLFQNJN7GGJXwMXsS/?=
 =?us-ascii?Q?1aS7OQDssw4RCczw5afNrf9T308leA3G6pKrNtDFWI15AMugdH8NsuE/hf/B?=
 =?us-ascii?Q?B86ul07DDcI0hR6algeJNdJIAHbXZgpzlGsVk+/G17zGkqK3o/VgkQdghfa9?=
 =?us-ascii?Q?T8rlPGIfz+8xz34TRDe0PfFQcrNTSdfdZmaBhr+L1eAXZkZ54caFdWF+Wxr8?=
 =?us-ascii?Q?+M29/e/a+nESSVpVpejfwX4lHp8qH4aVZjykyXL0PiMZbJHfZ+gv7tjIz4/h?=
 =?us-ascii?Q?/aACLuLJeAUzvWPNLbZkiZVJZsPEA7mPhi9K9a4VFTgfxzv2lgmmw/2NIDQz?=
 =?us-ascii?Q?XPl5bkxNW51+WdTmIYThEqp+I00UEpGnJHrdz1VBQJD+YRg2gg5kjUgg7tVZ?=
 =?us-ascii?Q?OOFmk2B9vpI8fQnDsrIpkE4oYZM27Zwkc5NSt4TjDWtLBOZmgNBczcChgPxW?=
 =?us-ascii?Q?ZbNrGAIbysTjszPby2iCUThrraI7UgeUyGDzJOY+/weaQSOQ4FFAqVHpSC2l?=
 =?us-ascii?Q?tJs3WBzZU7D0h5iAwIWshQSyx1fk6vcD0dYdmky27WHJjttfdBIImZw3dViN?=
 =?us-ascii?Q?rILs3G0gQrBAsymPCmLhBFcjk/Z7ouxfkhTZS9s/2IaQfv7L4CUusrdt9vuX?=
 =?us-ascii?Q?qpqmhHhDCL5gaJ9bmkwku7mGCGrDqH/ASpP4SRKWqhz25a68skercid43CyG?=
 =?us-ascii?Q?0hd2MgTmOHkL7TgLoxs8h9qrz0W42zm4Id/VAb+YZ1TkIMw5NTXv7qT/ASuo?=
 =?us-ascii?Q?oBeHv/SdyjGy3Y0EveDlKs/00P7/5RjQ6yH++HaGUb2F71X5cPdWXoroXXzg?=
 =?us-ascii?Q?JmH0u7Wk5m+TwxHNoI52oSEk4RtoqPJrukq6x5lS4Yz50faLUOwxRuzdAGhY?=
 =?us-ascii?Q?Quy0catwN7FojOz0/iiZh/8HXQYIEFChFhlGXIRn49pBOvLQWj10NHWt03vK?=
 =?us-ascii?Q?xqNM9xjkDb5U3xPheFtEtsJSeNkDWF4PQVQYuhugBc8QYL2KRqxr3xB7BCfW?=
 =?us-ascii?Q?v9JSTHxH0WsEu1kCWTKcZ73BOZjnrVmgYZf2h6Fnv7qWJZYrOAVP5kLOl/JI?=
 =?us-ascii?Q?QyjugZSBxlXAroPCK/uBdAwk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828365d6-18c6-40ea-085c-08d91e5f2f01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:54:01.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+IDln6+0Fh/Xip96mUn8Gqs3YFodfBRuQKNzEul+PbhORt62Q7cYzlBFi9oobkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=62.140.7.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/intc/s390_flic_kvm.c            |  2 +-
 hw/s390x/s390-stattrib-kvm.c       |  2 +-
 hw/s390x/tod-kvm.c                 |  2 +-
 hw/vfio/ap.c                       |  2 +-
 meson.build                        |  1 +
 target/s390x/cpu-sysemu.c          |  2 +-
 target/s390x/cpu.c                 |  2 +-
 target/s390x/cpu_models.c          |  2 +-
 target/s390x/diag.c                |  2 +-
 target/s390x/interrupt.c           |  2 +-
 target/s390x/{ =3D> kvm}/kvm.c       |  2 +-
 target/s390x/{ =3D> kvm}/kvm_s390x.h |  0
 target/s390x/kvm/meson.build       | 17 +++++++++++++++++
 target/s390x/kvm/trace-events      |  7 +++++++
 target/s390x/kvm/trace.h           |  1 +
 target/s390x/machine.c             |  2 +-
 target/s390x/meson.build           | 16 +---------------
 target/s390x/mmu_helper.c          |  2 +-
 target/s390x/trace-events          |  6 ------
 19 files changed, 39 insertions(+), 33 deletions(-)
 rename target/s390x/{ =3D> kvm}/kvm.c (99%)
 rename target/s390x/{ =3D> kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events
 create mode 100644 target/s390x/kvm/trace.h

diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index 929cfa3a68..efe5054182 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -11,7 +11,7 @@
  */
=20
 #include "qemu/osdep.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include <sys/ioctl.h>
 #include "qemu/error-report.h"
 #include "qemu/module.h"
diff --git a/hw/s390x/s390-stattrib-kvm.c b/hw/s390x/s390-stattrib-kvm.c
index f0b11a74e4..24cd01382e 100644
--- a/hw/s390x/s390-stattrib-kvm.c
+++ b/hw/s390x/s390-stattrib-kvm.c
@@ -16,7 +16,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "exec/ram_addr.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
=20
 Object *kvm_s390_stattrib_create(void)
 {
diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index 0b94477486..ec855811ae 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -13,7 +13,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "hw/s390x/tod.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
=20
 static void kvm_s390_get_tod_raw(S390TOD *tod, Error **errp)
 {
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 4b32aca1a0..e0dd561e85 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -21,7 +21,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/ap-bridge.h"
diff --git a/meson.build b/meson.build
index 1559e8d873..37be2e60c3 100644
--- a/meson.build
+++ b/meson.build
@@ -1863,6 +1863,7 @@ if have_system or have_user
     'target/ppc',
     'target/riscv',
     'target/s390x',
+    'target/s390x/kvm',
     'target/sparc',
   ]
 endif
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 6081b7ef32..f3c1b4845a 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -24,7 +24,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "qemu/timer.h"
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 59efe48bcd..6e82ba73cc 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -24,7 +24,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "qemu/module.h"
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4ff8cba7e5..0ed1c23774 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 8405f69df0..76b01dcd68 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -21,7 +21,7 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/pv.h"
 #include "sysemu/kvm.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
=20
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 {
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 734f0c62de..5195f060ec 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -9,7 +9,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm/kvm.c
similarity index 99%
rename from target/s390x/kvm.c
rename to target/s390x/kvm/kvm.c
index 2a22cc69f6..4e47563faf 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -27,7 +27,7 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm_int.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
similarity index 100%
rename from target/s390x/kvm_s390x.h
rename to target/s390x/kvm/kvm_s390x.h
diff --git a/target/s390x/kvm/meson.build b/target/s390x/kvm/meson.build
new file mode 100644
index 0000000000..d1356356b1
--- /dev/null
+++ b/target/s390x/kvm/meson.build
@@ -0,0 +1,17 @@
+
+s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c'
+))
+
+# Newer kernels on s390 check for an S390_PGSTE program header and
+# enable the pgste page table extensions in that case. This makes
+# the vm.allocate_pgste sysctl unnecessary. We enable this program
+# header if
+#  - we build on s390x
+#  - we build the system emulation for s390x (qemu-system-s390x)
+#  - KVM is enabled
+#  - the linker supports --s390-pgste
+if host_machine.cpu_family() =3D=3D 's390x' and cc.has_link_argument('-Wl,=
--s390-pgste')
+  s390x_softmmu_ss.add(when: 'CONFIG_KVM',
+                       if_true: declare_dependency(link_args: ['-Wl,--s390=
-pgste']))
+endif
diff --git a/target/s390x/kvm/trace-events b/target/s390x/kvm/trace-events
new file mode 100644
index 0000000000..5289f5f675
--- /dev/null
+++ b/target/s390x/kvm/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# kvm.c
+kvm_enable_cmma(int rc) "CMMA: enabling with result code %d"
+kvm_clear_cmma(int rc) "CMMA: clearing with result code %d"
+kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "W=
arning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
+kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamat=
ch) "fd: %d sch: @0x%x assign: %d vq: %d"
diff --git a/target/s390x/kvm/trace.h b/target/s390x/kvm/trace.h
new file mode 100644
index 0000000000..ae195b1306
--- /dev/null
+++ b/target/s390x/kvm/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_s390x_kvm.h"
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 81a8a7ff99..37a076858c 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "migration/vmstate.h"
 #include "tcg/tcg_s390x.h"
 #include "sysemu/kvm.h"
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 6c8e03b8fb..ec73bed524 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,8 +8,6 @@ s390x_ss.add(files(
   'cpu-dump.c',
 ))
=20
-s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-
 gen_features =3D executable('gen-features', 'gen-features.c', native: true=
,
                           build_by_default: false)
=20
@@ -32,22 +30,10 @@ s390x_softmmu_ss.add(files(
   'cpu-sysemu.c',
 ))
=20
-# Newer kernels on s390 check for an S390_PGSTE program header and
-# enable the pgste page table extensions in that case. This makes
-# the vm.allocate_pgste sysctl unnecessary. We enable this program
-# header if
-#  - we build on s390x
-#  - we build the system emulation for s390x (qemu-system-s390x)
-#  - KVM is enabled
-#  - the linker supports --s390-pgste
-if host_machine.cpu_family() =3D=3D 's390x' and cc.has_link_argument('-Wl,=
--s390-pgste')
-  s390x_softmmu_ss.add(when: 'CONFIG_KVM',
-                       if_true: declare_dependency(link_args: ['-Wl,--s390=
-pgste']))
-endif
-
 s390x_user_ss =3D ss.source_set()
=20
 subdir('tcg')
+subdir('kvm')
=20
 target_arch +=3D {'s390x': s390x_ss}
 target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 52fdd86c63..d779a9fc51 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -20,7 +20,7 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index e6c5fc1d03..c3414f58af 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -10,12 +10,6 @@ ioinst_sch_id(const char *insn, int cssid, int ssid, int=
 schid) "IOINST: %s (%x.
 ioinst_chp_id(const char *insn, int cssid, int chpid) "IOINST: %s (%x.%02x=
)"
 ioinst_chsc_cmd(uint16_t cmd, uint16_t len) "IOINST: chsc command 0x%04x, =
len 0x%04x"
=20
-# kvm.c
-kvm_enable_cmma(int rc) "CMMA: enabling with result code %d"
-kvm_clear_cmma(int rc) "CMMA: clearing with result code %d"
-kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "W=
arning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
-kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamat=
ch) "fd: %d sch: @0x%x assign: %d vq: %d"
-
 # cpu-sysemu.c
 cpu_set_state(int cpu_index, uint8_t state) "setting cpu %d state to %" PR=
Iu8
 cpu_halt(int cpu_index) "halting cpu %d"
--=20
2.31.1


