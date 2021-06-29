Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5B3B745D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:31:28 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyElp-0003Y8-2S
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbn-00029N-DX
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:21:03 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:37088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbj-0004Ej-Ls
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RieaPirioilf6rlUZp/smieKJ/lLqEsOWTqDfC51EM=;
 b=C4vt5dguO8nfN1bDjaUQoG2D2hr9ONjB+XHJyJVuP4TsqTtQpnVkuyVV7bV/9fuZPBOP9e
 rLCm2NZIBOEgaR6SHTyhYaucyYaJeD542gmTFrGt2I8qwrYE9+p/Wag0V+l3pzpqjejCKr
 lF2CLjhIC74zttlT2vV4FPJe1725a7E=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-Kux0I9MDOyqo9X9v9wdiHQ-1; Tue, 29 Jun 2021 16:20:57 +0200
X-MC-Unique: Kux0I9MDOyqo9X9v9wdiHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjCr5tMZkPTFvI5xr103GwweylV6phTEblj3mMBiPuM9Rgr1q1wgKACns/LkTyNtWwQGtENLBc1qPU5cUWSDZ26/Ay6gmZMkSSpO5mOhzfjQospBoHarPIq2wMDOEtPGp4ZaO6MqlKT70oOz4e1B31L9wbbiGL1gzLruhdKudY/FqSxTVzvATfs0XbnH2jQiJAU3Ch/eL3G2e+IGQXI0Bzdt3vE+y8JWnx5rQgf4KcAL2/dMD/DuHWgWTENzllQamHeSEhUPbSEYGq2WG8w3cXN2twQU1R5tSVztmhk++Gnzw3yQqpxZ8tGG5504kK7mcf+2GIKdyk1jsU+zRkRvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXk316ilrzyL+KrcU4fbkxjU5sXIvqTzzrF69tquBTw=;
 b=ZL88xzOUoz3QNPeoH5IMQkrxamBo3MNzE5wzjdBana6EwqM9yXbVuzCmaPM85fTD2mUEhOPF40NWkYrKMxcZgYhle1YpcrmSu/8V64Toua52Xqnx+WZ6rdWQ9KN3fRRdnARJKORZeuZsHwp2He1kynUxfAfz/xjBO+CJbFin35Ht2euLmGC9flUJdUn/QuD77nfkSCLiTuLzPUz9Ey28XZ39rwz0tjWS5/SBqt0FeTLv7QXIpx4EMhq3t/myof6g55EZ3SunrdylgTYS76/fwUizUxlq9++m5nyk7qeBMkHB4epC03U5sZ2himNtcbsdg7oRe6UbtDZ+QBbY7lGgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0402MB3327.eurprd04.prod.outlook.com
 (2603:10a6:803:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Tue, 29 Jun
 2021 14:20:55 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:55 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC v6 12/13] target/s390x: move kvm files into kvm/
Date: Tue, 29 Jun 2021 22:19:30 +0800
Message-ID: <20210629141931.4489-13-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: TYAPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:404:29::15) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 TYAPR01CA0195.jpnprd01.prod.outlook.com (2603:1096:404:29::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 14:20:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b048918-3f0e-4edd-1f11-08d93b091b4b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB33272276C8D14F97C86E5BE4A0029@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2b8QXuTo0HUttM6+72FksK3QRkEkkdLXEEB/N70s3mFWLEG7DoAeKMjHqVxU5QOOD+D+6oyBImjRnAfatMws5R0u2DF72QQXF4MNOfknPTAiAqQRm9wG0Zg4HmHh3AqeJGMG7A7N943CYiFuiSgT/EPCiWeotOSnACSJsU09/ffoJ0vxrk8gZlCEYRhIg6nS4EqwD9COsPhKM5CLXnYxwV2L/Pj2euVODKiysXX9YCRcC19OhiAmacSJhs9FZMI5BUK22G7r9BwswAGUghZenvtCmcKL9frzonz5i4Mw+uE5mMfNV1ta+Vetf8y593IuDK2ipjUpg2TphEPsS0gVkD6qeZ1B9lqfM0sMbphQuLF2PfPkPe5W3hpiH+QK6atgKxOP8APPM6iEq1bPdvgpnysg78SiWW2/Pc1vADOW93QJI9zaWMAcmz/n91/nzXRiOeFb1UeEuaGVYrs+8IL+p7vF/1zXX+8ZLPsJG9qUSHg6ACk0u5ns9tRNxvSIyKX0fzXnwG53CL8GaZnw8e0vw33XU+u4pC4Ll1VBAkB6WoHZ9JxUllPZqB2GQsXX9U18QxwbuQGga4Mnz2dISVPlC4073zKz+CdQi3Q+ghlixTbzkHOxx7gQs1hfk+iw04UWITkbkibLiONdLTF3n/lo1rAE8imEA8Lp98Jw6yB0fx79C6BkCeNHavz703UNBoY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(136003)(376002)(346002)(83380400001)(8676002)(6496006)(6666004)(16526019)(8936002)(186003)(86362001)(2906002)(478600001)(36756003)(4326008)(956004)(2616005)(66476007)(26005)(316002)(38100700002)(5660300002)(30864003)(66946007)(66556008)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RRSGqWoRDekfOpWfuv95dWbNNobvMm6nbCbFKXiniQZqH2Ey1qCbG+6KUMVV?=
 =?us-ascii?Q?AeDgFOHu9nRr1Pg7d49anczlXLwX2Mqbg90nQjF9kTlLlYCy7xgvwmVINzGb?=
 =?us-ascii?Q?WEvourBy45aQSdqm+T2+j0MIcVYZWRBc5yMyRwq+xO82rSmHewLK5s/UCXl9?=
 =?us-ascii?Q?6EQeCXdjqiXta00eEyYoPO17nEsBqkpZzTsL5e8I2z2OfEoftIeKt5a/7iCS?=
 =?us-ascii?Q?k3CTreLPUWbeZfKjnkhdrjsKsddHTjV/lGrNpiQoX0rO9LGXAB/0ZT7zgIw+?=
 =?us-ascii?Q?ViyqawxXUxJC0+y665h7vSabr+QRQ/g5VLA+uGwPumIEzNzD1d2O7zE5wXrY?=
 =?us-ascii?Q?u86XNfEhBf3prCdK4LhNx7OYtKfTTh8DsMvHPyegV1LZjc3xgkxakF2XF2Lq?=
 =?us-ascii?Q?l6qCLLlwyUIWECbir7G/YMHEmuRomaLmScZl82IPAjHaTpOnicrAtvPV93Qo?=
 =?us-ascii?Q?sR8xsaW6XTL0TWnm79RyR2HzLYSf3LdOXcQ8HGc0M/cmrWu94w5DxSZzKnhD?=
 =?us-ascii?Q?xy4LBkUn3Pd+o8zK9rEQo3TEcEdGfl2IVSLWImhag5cPnW6msw9+P8Jl4oN2?=
 =?us-ascii?Q?wo/HqZQ2NWO/LLVDVmCRb1lVd+gMzw3ScCV5qcM9FrbMvOntLL4fCQd13nGN?=
 =?us-ascii?Q?4ywUHvnNDo4Vgu4l15njCARZn4wxOy1Uthz4bQg4NsQjG9mOBoFeRCni1eSq?=
 =?us-ascii?Q?5M6mpIRf2ErfyU09gbz9YupxsqOmBu39TzdJkEy78bwruiMzyIgBWq8AfLjt?=
 =?us-ascii?Q?iR1xYgH4eYfInuc7MvAJfciDTNm76XFJBrpKSXs67ei9suHZBS3OgzosdKoN?=
 =?us-ascii?Q?jBodbSdZl2Xi5ra+nW5yYeEHT7kTMwFb+xeJSlSf/SFdPFvBFOwalzylViki?=
 =?us-ascii?Q?SyBiZ6amfu0LaKZ5l1JgfWx9vYIATxdu5ajdp7WeiwstHK+u1Lr1iQWzmDSs?=
 =?us-ascii?Q?VCG/XGBbj+t7eYaQ02nIryvvz+wuDzSEjDLXYhDKXLKbNEeV0pHYPYnaS/3P?=
 =?us-ascii?Q?4eSm+vw3DtHBWWHCgR48B5XVbYWcIEGRUtQ1gAR4tjMZjhcVmZrpKszctxSR?=
 =?us-ascii?Q?J+TSq9i2XMt6iT1gx1YEPLOHTVlYL8c6fiCPdiutV018+LvhevZk6sA0LOOR?=
 =?us-ascii?Q?IKDtZnTFi6sxVShlEVZeDnOXxu/CGjoOPBUG2U6b/w21pudXr3Bk7NEn3YO5?=
 =?us-ascii?Q?gSOqYRE7UT+eAEvyLpasawjK6LIB18Xw6PLzbLxOWGWvK63h7JVOrlPkczQX?=
 =?us-ascii?Q?T8p93S3oPBh37xaMwZG1gEw2o9haRpV2U0722Kg+Ukk6Hh/NzA3r1G8iFMUp?=
 =?us-ascii?Q?lZMNuJ5VTrtMwSzR8d6cO3Xv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b048918-3f0e-4edd-1f11-08d93b091b4b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:54.9997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzWPcihBnHTxITfhipbs5A3z8evbcMwOd6m/b9/eOFFrICQSB+qz8+ezyppjJChX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
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
index 4e172540c0..5a482d65da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -393,8 +393,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
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
index a91b39465c..293d509c7e 100644
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
similarity index 99%
rename from target/s390x/kvm.c
rename to target/s390x/kvm/kvm.c
index 5b1fdb55c4..07dae06de8 100644
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


