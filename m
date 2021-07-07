Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B93BE6C3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:58:56 +0200 (CEST)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15GZ-0004mr-Ui
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Ci-0004v2-HR
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:56 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:43375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Cg-00027A-2D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYPXl4epdup63veqEUEMDsX7AMvFPrMezdCzQZUay5Q=;
 b=CEGEvAS7fywHw+nk0aRUSC/TKsL8vb7DUZzHrO4DJ08OapoANDk2YeAtAhXJ4Vgb70RfC1
 3aOhTwQY/rXVpsI+q12MxYC5JCKIVZapI7GG2NmlEqOuL6R6AjSPQOTnlw6pE9eksVWB1x
 xNXk52QlWdC3M1t5DedzU3YiS0alkGg=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-SuZ3LwdQO--aLktmWZImzw-1; Wed, 07 Jul 2021 12:54:51 +0200
X-MC-Unique: SuZ3LwdQO--aLktmWZImzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ztt0Gionk9O6S3uSYCj0TiIyoiSESFWyImCtcgu+6TMYJ/ZRn6auv8utce6+QKb6qszLIxiq2Z3eT68/UdIcEpkVKoqVl7yCedcsnaTk/TtkI711e6WhSW5q1gGBMUbqN7E5ODmTS9AQxxHhY2AjBvkyqfhPTtWRm8M/KHkTTd1GgyCXW0Trr3PZxn7zuFu/aZLHtmUrfEfpnEAOlQMKft0OpH7tfvvW8BO6mPKqv0xAKZybShBUoKkCQe9LESOn4cEpWPIp9/fEJc4Eh/NXaaHDMqdyl8cwwV8/MTu9+YTJI+z9620u6vRvBN8wWkcBnbrWBS+pe1u9V4lrDIPhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th442xmWdd21vL/ot4KXZwdZad/NidN3x/UpL79AbRA=;
 b=LkThR2PaolPe+Huq6QPCGHddseOUKfxlIPIrvAZdCliWYUl3jzpViUgDWnZe4XaXXJGAH9WyL3CHxlHJsQgudYQySL+EyvRucoRTz+HQtgIG1QZ/V/rxVLbBFEilBeNP28pw7zJQ5gsuYGqtUwz8TPzo3POcNqc/bXBQqGuzHqeKO0CXYr8SYJuAnyn1NLFR1Vkb5jqlc84g7ISKa/AYSGwmwTjayTUDzyyTLUEVs9PRl8KpZne2L4qPQsvMG2LMcZ11TA0LrTlCuhC/D0qT0tS9kCEjJGvjlpCFcZ1a/ob4Watue1Ni8yds5VmoKTxBZIOExQ4QecriEu9bGZ7q4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 10:54:50 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:50 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 13/14] target/s390x: move kvm files into kvm/
Date: Wed,  7 Jul 2021 18:53:23 +0800
Message-ID: <20210707105324.23400-14-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0083.apcprd04.prod.outlook.com (2603:1096:202:15::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 10:54:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d61842-bca0-4496-95b3-08d94135a4c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7007:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70077895EF134F36AF8B09F7A01A9@VI1PR04MB7007.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6m/RZafg0Gm+uzzUpTJIawy9pvCwk8Ykw33uZsYFGTtPX7JyRP/Hcek+OG/UPDA+Uyp1qsqhVyAsLle7TDtKICiLPZQ9UAcY7Oe+1P4uh+oizyNkP9b4wDbH0+bJwQcQgl2n4X8c04WRze/YqjW74p1T38Xlrya9SS8faXCpE9XHMK4wvLyjbr9StFeMM1z6sta2HKuSU6V1hvb0kM6XhZMFBHdMQnDxzOQ24S5po/9LcWCxqzdD+EDnlWz0qxAGMlBjM7WDcKkbHBRQOxcPgJ6JPPbh3zb3l3exS9RIRjJaLptbeJY9Plua2gIRqU6QRIr74fOKH12IvMZSFQmPRDjW6KKrXiOKeyxiAdrRLZViALqL83fIDXR5zAmSCthQSFIdnHzJyWB5qvxkQVctmV8nzOOJ147x0aQStGbEobgtOjKCpb89m8wuk0tI0Az5kKoDPzjoOHwwrGMN6nc6bs9GV/TM+nmpwW3SgO/hezVErOH2DxeTMbifQaWB6ptAFF6Slo52P9rBbDPIGB367bmTVL1U4Wa9jdVDK5vhXUtVMY6AzULNJH2X7QC0lW83uCbGMK6vcgo9YID09zbe8qieY8Kwg4qNxVMbuzRMBEKNVzKe4+V9dRjDs7Ftb7rTETYvBdMO53mxqcSop8t4MbzV9lIOLg/K1rq4YoHfjkzdDBbMsPgIUiYo3aEUUDN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(5660300002)(478600001)(2906002)(1076003)(36756003)(4326008)(316002)(86362001)(26005)(66946007)(6486002)(83380400001)(6666004)(38100700002)(2616005)(186003)(66556008)(956004)(8676002)(54906003)(8936002)(66476007)(6496006)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pNGy8wjya1206ZiRCITIIg8dc4qm/MkdX+q+am2a5YCeUQwCJt0oF/ypGg8S?=
 =?us-ascii?Q?kfDT3364gjoKvjp7XdWO+b9jLb2LTEI/++v4VBr51zM5q/80kBJ6XOAOx+kn?=
 =?us-ascii?Q?AyXgCV6URvjZ8zQIqVOeS0E7LHp+GUahjK5g9x4Afctim9aW66/MaAD3qjzC?=
 =?us-ascii?Q?2DaUdws8oXNZmrAz5Up9L1Bow4Fvsg25d0aZCP6EwvGGu40M76++0iWTgKBC?=
 =?us-ascii?Q?9acg9MhB/EIUFli9EK+9BzMx+xZmpYvteD36AfTS4XOhETVtxX2GsKHoQifK?=
 =?us-ascii?Q?qPlTCI5jWNmPKU/cizg0+S/06tWGgLVQnKQZCTde86FpUeuTRMIB5XPQWR1P?=
 =?us-ascii?Q?aOj08NTtHZwr6wTOY8ADm5rccPG2ErbxOuxpW+omtExoGraNjItuTGN8mqc/?=
 =?us-ascii?Q?x08h6QKgeRTmQnTao+WBwazvU0G5XziawhDTqNvuZ4DysBvufqxIVqc3yIBa?=
 =?us-ascii?Q?/dRw8661be80dlAcOOdXB3EC3gjFcU98/JwfI2YP9Uw9e0Zc/uB52hTlFYFp?=
 =?us-ascii?Q?gYzaAwPVWZBdVpfPItr0wbqN3427XY3FIiCyQWapFazAnm6cEOMIsXlfudxS?=
 =?us-ascii?Q?0x+37TmISD0tqasDNyDME93cws8bcqOG7SxL+6BYbTFxnbPXlw7WKDKWO/L0?=
 =?us-ascii?Q?nrNvw66MbU7fH6/eygEXr2kCc427JJI8y3CkXNOloUiMMHAR9dapjYE5NYgA?=
 =?us-ascii?Q?hV1Vmc4a4sAOr4v3foVzuQm4qjJPlXlapCb0Wytfq0oogvbd93sDP5xoSF3X?=
 =?us-ascii?Q?rW7rvd5GOR5bis1DPfUZ0HMNV3bAVZIqdpWX0MvzZv5GJjHWjngUVXa+WCDg?=
 =?us-ascii?Q?QW8B0fdp8lo8OujpNp0garqbpWdezfuzzJ2Jffgu6ZVdQNmCDIo0SjX6Q8HN?=
 =?us-ascii?Q?zdKUwZmJkGQ/ECVa70bRuAvi1VgdXHnzS9+OPvvPxzx+2eEkwPH176263B7G?=
 =?us-ascii?Q?Y0v4UTyQP+imdv1ii7pkp99V3KDbDinGJq6Bd+0Jlo1IyMpR+8ZZC8yp8G3V?=
 =?us-ascii?Q?3bwHIMZ6E9SPV5kzpdZ9GJ3hLkwmslWaUogFQ6LQDIFiVnCSrdJa4QiuzNc5?=
 =?us-ascii?Q?HiwlQpOjKWBNGd2Zgrac2uZX/pojjjB/Y9ciGcx1mMbGr4pc4vHf/ni2x28M?=
 =?us-ascii?Q?hQSsY1WE2ycmZQKCO6RQhJGoaGPRS80/q6Qra5jB/iPtXcGYlvzh7THgsZIz?=
 =?us-ascii?Q?XjohIQVu1UEWI3hHEBPGpOLUbvJZU3pqu3XMJ5aZmTMtVZnbv40Uu+K75Nv3?=
 =?us-ascii?Q?dnDyboz9qzBcpRz9qi4AyKdKn3RqOHhRi3Ro2yx4LlbI6SCj1ppbhXzx0kCs?=
 =?us-ascii?Q?CQK2FdvzzOaf/Tgx2Wa2X0EX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d61842-bca0-4496-95b3-08d94135a4c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:50.5893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUrvzIp6aiFWTlDmyKRHlDjnxX3oBiXGFjE1q/4CH/KUKkA7trIfdFBNqueub6Xm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move kvm files into kvm/
After the reshuffling, update MAINTAINERS accordingly.
Make use of the new directory:

target/s390x/kvm/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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
 target/s390x/{ =3D> kvm}/kvm.c       |  0
 target/s390x/{ =3D> kvm}/kvm_s390x.h |  0
 target/s390x/kvm/meson.build       | 17 +++++++++++++++++
 target/s390x/kvm/trace-events      |  7 +++++++
 target/s390x/kvm/trace.h           |  1 +
 target/s390x/machine.c             |  2 +-
 target/s390x/meson.build           | 16 +---------------
 target/s390x/mmu_helper.c          |  2 +-
 target/s390x/trace-events          |  6 ------
 20 files changed, 39 insertions(+), 34 deletions(-)
 rename target/s390x/{ =3D> kvm}/kvm.c (100%)
 rename target/s390x/{ =3D> kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events
 create mode 100644 target/s390x/kvm/trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e04800576..11d9ce72aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -394,8 +394,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
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
index 7e12de01be..b458cd33b8 100644
--- a/meson.build
+++ b/meson.build
@@ -2102,6 +2102,7 @@ if have_system or have_user
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
index 5c456f6014..7b7b05f1d3 100644
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
index 94789c7280..ba8f6a55ac 100644
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
similarity index 100%
rename from target/s390x/kvm.c
rename to target/s390x/kvm/kvm.c
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


