Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DCD3B0165
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:31:16 +0200 (CEST)
Received: from localhost ([::1]:53716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdgZ-0000Ao-Lf
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUw-00059W-D3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:19:14 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:28346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUr-0006zT-Sq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6mY78nm3AJRm4K3WywrY0/SMmeOAmDWM+WBzKzhr2E=;
 b=BXRhQ5J2UpjmUTgbauXg+8iWvdkoOMZ49DZl1GaIBROUOHCgvwP5/P5Y3/CSoxFyEaN540
 FFSj1rBF3yODxQfd31UaxjfflOVjJuNlOh+Ap30ebH2g3xQG0rj/ZiHsCxjsUYNq4TpHAp
 tLnKzvA5IEvd6hFsoS2eEObYPu7uHcA=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-WvamszJEMtuDCmbGNTMMTQ-2; Tue, 22 Jun 2021 12:19:07 +0200
X-MC-Unique: WvamszJEMtuDCmbGNTMMTQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8ltgXQqxx+FwciI/Xn9IyykNYacDkSzUItZVhDgOQQieOVw3lq6MrYyk1BH42ter22ogMMORHpxrUkpJejtMZJ8xixoVNGsKclIrt3XIZfeDqa7ar8oxlTSkVLwDYUNrAG1wdkzFas4kQN13y2b9fcUpc1BnNACtFwp7rWIakqGcS04gBgFCuImR5y3vZESeTf5/DaX5xkscldFXcpeedRIrVDc/vlXP9cO3mwFQmKVvsEdDvskHKCrvfFPtXMjmcBfkLK2R4EWNV1OpoJw/OXqqbYSlW44OMZDd846Ecs6NWX/7R4RLZu97hg1ZiUtA1b7kWbXnv56UFDzy0hz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1YKt4+yGWWYOFXPaPnaifRyikTcigwpJI0arjglWw4=;
 b=EQG4HBVFZsXBAZjdyE+BQYPeyVwSkzU3FivuDvTYvWY8xfL3WL3gGnS62ZmoW22q74pXIxSa3Gnax1cEAxmhYrPWyOrX/mobi44VZGoMTWxmy51EvRo+badiv30mffyMxfO1y/h5+OHjkC8j/VX/EcrfbmucUcBP9+8GQqD0y6QqI3NzgxUjSvnEag/Ba+ogXaWne08wPq2m0imAA/jFjJCim9jmTDtpNkC/wel4SzKUALCvjAOdtASkMGczG0B6xfs8cWkgGUTb63gdlF+iVZ3aLQr/xky2pnpGvDGDa6QB0OfGckZcAlI52wn5Nq1xeqL+h0NodLw1Ql8EJI1PkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:19:06 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:19:06 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [RFC v5 12/13] target/s390x: move kvm files into kvm/
Date: Tue, 22 Jun 2021 18:17:25 +0800
Message-ID: <20210622101726.20860-13-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 10:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7396c1-fafb-4621-d60f-08d935672a7d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57274265E79B2C565FECB27BA0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsC/EBz57I1VjYu7CAnPmztaetNBG07WHi68TbnER3HF6BzqvTu9ObP2wpNLhdIh65KPbn5UBMEaxjSKo5fhq+s7PixZ4Njd5XZJdQijJW5gJqmNY91vV6LUIcLzK0BAFqbzki3cc+QXQIWURPSN1eLa3sne+iQWxURX4cKQosMuZtCLswUrrPOF8+XE2XHEyFlURpHJYzniEFsHU5Fa5f9kbZOJbpinXOFWeHC6zFO02dqJO3K1cmuGwOY78S8ZYeEADad5B0cNdNDSaKaZT9TOEuYmYcKKgErlfgT5NEfSNB97VXygtWYjYbkgL93dJnqSLDFPNJc3vICndIl+CINIib6N/Mp/jPxq82JMvTgslE7ad/5NmyRQ/mIB9Me5MQz32qBOA2K77AG2Z3UYwu0PUjrsG4NDrPGKacIebZIFNfV58B4LgBrCDBylpeH52wwyLUHfwkOMi77p6d7YknU47MY5B58XQfdS02FWAurBsiFz7517mDPnyxJyDW1ylOWXHdlMAiqffK8B7cLH0Jt1K/U7wqgZINpfdZ3Ba9VY2oXvlmz8N5ki6Votw+O8jxlfi6ks9BVkue7Llod3UXjAustcIp/wjKQrK63Z9lG4FrO60xe+yRq4XpZHNIhPuGH93OTtM1USn9s7r6NJ+nChwvwJVU+0g2yk/Ww2KWjP22eCyxiH7JUUtZ1u+Eim
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(30864003)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(316002)(478600001)(66476007)(6496006)(8676002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hz4dd1RJOO7S7CGtY08usAaeQtEKGCZsZi7KeCIWPJ28Ai1ho338nU5Gpxwk?=
 =?us-ascii?Q?ZqX8WDpsNGcaUBcybdjtycTMrND7GaRjkzHv7qvK00RvaWmB1vK69rqeZW72?=
 =?us-ascii?Q?Y8r7cXF3eZYNwtM8aTDJ/jzU+tQQfy7Tyn8DuiWErxFZXrX+amoYRIcac2Mf?=
 =?us-ascii?Q?sIwnxlcHgUvnRext+R955SjuEyNs9tsAIO9bj8stgbr6EM8WQY/rxmx9mgaD?=
 =?us-ascii?Q?W7okgo6H/INgqIhg8QUzxsMQfl894WllNaxuNKUx3P8lBvN+kIPznWUGNEod?=
 =?us-ascii?Q?BtcfquJEnaiPKLPzMllP5Nim7CZX8rkbOEh/oBcLjV3B6dVwXb/2UKMXhoaV?=
 =?us-ascii?Q?A8QRyZFur/Qy/BXQCdbppLAoq1o7qBpgZMHTGc1hT7/oC0/psvJE0Akzswlp?=
 =?us-ascii?Q?aOH3RfbUztdHTDbtZwCoTUdMwwYhTeu/9PwN14P/wJvpxilfji7DjtMW+LyK?=
 =?us-ascii?Q?NT7/CPcePuxGD+CQDKDGIet4lzs0IKcL9lzFDHkHJtr/ZGi+zDU4yzsuL1X1?=
 =?us-ascii?Q?1eLgY0RXEg1GCmCI8++XyzK1ykzt6KvR/7J0J/dUHQvBEM/i3Ib7jI0PLx8l?=
 =?us-ascii?Q?mQEHsXYIBQm2EcMcMij9b28mhup3Mn7kG6d/JSTf+2Q9K5ytZz+4f6JK12xw?=
 =?us-ascii?Q?ctij6chS2EzUBxs9Ku+a8IR6gSd+4e/IXLLAT6LcOEur0/W+oKWODEuf8ICz?=
 =?us-ascii?Q?hLN5HPtOO7fISz5FxRwTFdmZD9OczCTahRWOCnGDCBHAMb+nlMvAZDp38mzy?=
 =?us-ascii?Q?G+WpM78MAgNqSmVuLuzAay5aQOmecbmvBmzV4Wglrq4uLxDumwicxFVneqEp?=
 =?us-ascii?Q?E7pOFl/+Lb3aGy+kMC6XR7nvZyXfUL5Qoa8OyIziSee/DqfDRwWG/CcFKWmO?=
 =?us-ascii?Q?KvIIn2BpWq87S5eeN1sO/O6OF6fAgOGOONoaeWIeAFz4SCvVaMkgjugkuKuk?=
 =?us-ascii?Q?Az7QUkMyOxIJ+GTuyMKnx1OyCNltP/irV6VKVlZgevfI/mjaeAmlNc9nddO/?=
 =?us-ascii?Q?wX82Eg2OhMzyIyRjfoe8NDKn9A89NTSxTPjAn2RrnKR9bCB1q51UpuHfb5ai?=
 =?us-ascii?Q?hsLdxiczra6dYwbY65Q3U1coBURQuFWARW/dSnz6zphLUAvkMby/O2/6p0GF?=
 =?us-ascii?Q?xlsVCKOsZHzDqsoWAenb9hQmfm8eqG9Ud7/D04TOIu8wxrKD2h2v3uRHw+u9?=
 =?us-ascii?Q?KcaSu3TYVC4UVY1I0aCa2+Q4S+cwPJnmvMYUZWQoEYWlmLpDaEykAVqRJDQO?=
 =?us-ascii?Q?MLQbK5F8aHqQn6c75scRt66F/mPc6feWhX2yuR5rxrwJKE/QwK0vGXOYs74Y?=
 =?us-ascii?Q?f+AMMdKlw+bZbVqKpYpdZtEX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7396c1-fafb-4621-d60f-08d935672a7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:19:06.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cL3LqznghwEb0JPCp4cFFvDeRmN3SLMK1I2LeH0ITHTe03hS/XXOltcltKyD9TJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

move kvm files into kvm/
After the reshuffling, update MAINTAINERS accordingly.
Make use of the new directory:

target/s390x/kvm/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 MAINTAINERS                        |  3 +--
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
 20 files changed, 40 insertions(+), 35 deletions(-)
 rename target/s390x/{ =3D> kvm}/kvm.c (99%)
 rename target/s390x/{ =3D> kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events
 create mode 100644 target/s390x/kvm/trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index bf9bc0513a..014d4365f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -391,8 +391,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Cornelia Huck <cohuck@redhat.com>
 M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
-F: target/s390x/kvm.c
-F: target/s390x/kvm_s390x.h
+F: target/s390x/kvm/
 F: target/s390x/ioinst.[ch]
 F: target/s390x/machine.c
 F: target/s390x/sigp.c
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
index d8a92666fb..4c05153fe9 100644
--- a/meson.build
+++ b/meson.build
@@ -1886,6 +1886,7 @@ if have_system or have_user
     'target/ppc',
     'target/riscv',
     'target/s390x',
+    'target/s390x/kvm',
     'target/sparc',
   ]
 endif
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 16e5301084..df2c6bf694 100644
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
index 2b2b70e1c6..9574bc9305 100644
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
index e83a8cf85e..729cb012b4 100644
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
2.32.0


