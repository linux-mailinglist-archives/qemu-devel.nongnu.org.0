Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8338DF79
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:59:20 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0oJ-0008AS-Gh
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0j0-0006WD-LR
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:51 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:56130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0iu-0003MT-QD
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SswzpMQT/9AuMIKB+1GdJaSqIZYOQQYZAHrxpDOf9M4=;
 b=hqgvKrX/QqZr6LpfAaEKMK5SGAMcc5ZjM0qD+rTIRGMXwLk+zxrHyf/kE4zrFznzpfXzoN
 gypEr/TbRp8mX0jGzwAuOCCTLNVMmBwONeup19lps+kWQ84jKXTsIGNG4OriPQhgC4Kgv/
 xiOLZym8gkXm4wBviiB2qGIQ2Eo7FtM=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-NlWqTJMYOz6TiQtnQMUjjg-1; Mon, 24 May 2021 04:53:42 +0200
X-MC-Unique: NlWqTJMYOz6TiQtnQMUjjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzlyZCX1Y8vC0fq7uFtbm5UyVYF6cDtLq8KtK9MHyFieMTlXh1RvaPLL2NpnevJUZVqnOnHWLbQAEaZUzv2Pq9KpJwjAdCTtvP5ACA3ckXbtmhgWoweW1cihn6JiBj6QYRfIuohS/fzbxnZ/rM9Z1WDov+D9WPrX5WgiRoEg351BQqZSWXQRULe5hlkdfUuo+HFgww6LQY8jODGs/dynQ00mcVXGvcSDPmi9BJS1syiAqOc+T3COa8bk41x+2xWR8ELebn1GFJp2NBJfUAZujdAF9nh5wJ+aTw1Ppd2KvY/p3fEgWGdiniCGDy5nThr3QOSdpMGpyzGTFkLAinrn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfSM2Gi8fcqMrhRLBH0rPBIeRqyrQp3nuB/vvdvWSAc=;
 b=UYS/fR37f+/c5tm5ciMqd/i0XJVt+DpCMnpKzMD0s7Lk8VJkvf49S6B3f4d9E1z2zVKAK/KfQeMIjIpmS5Pqst1EAk108aUl8w6BzahFygO/MkJO72MYZ5J1ElUlDV/ViKTiUACWEEF8Q7rsJzstpAz5V0zOZ6iFF64CqDkoPfhmWIIQHkY536Tj1W4Oajl32tbXU6NADdhpp43eIpM3Dsm9oWrGZrfRTjdYwWB6g5PCNddhD98V9vzJfHGuDYCjcrWcFB3QyoBIbP8yGkaXkPx+y7UfP6qtu0f62gq5uzSHF1eEHbnepOJD8cIXLBUlo6s3KalWsaVHEahRDloBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:40 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:40 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 07/14] target/s390x: move sysemu-only code out to cpu-sysemu.c
Date: Mon, 24 May 2021 10:52:49 +0800
Message-ID: <20210524025256.22252-7-acho@suse.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7980321-32ac-44e2-2936-08d91e5f22ba
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126449E75E96F7200D2B3FBA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKgaxy12eRFqkIrJEVvyf8YFvSrcl97PHymcXNAhnQQJ9rdbJohz5g+Fc2V9Px3zlEjdU5DN37NHoaBuDyhW58sKTL0FA/cOBHzvSz6UigvrqjmLMCpnbc8d8fLWneW6fdI8Z9iBjOU1LAxrM7Nf5raTJkVGLXs6J1YQPGBbKXiSuqzXK6BYVC8mBX+vUgqKtf19Dw1RzviSdHq5lCgpcFJUUh7X6DKqYm492FpklKzu5Cy5mVCoy8sitp9eCOBJVzdksop8oQVH+6D6F+oldM8iG0DCd4HQxO1J6LJ9LS7+z734NgkKVbs1B6BC8LEygLNDxbW6t2F3+EiU4TegJjoNfRrj2QW8qJocrhEc098AEvFsf37ytTknIdfS9e8Ug9F+54rMLPwLQI+ThipnhKMr1OjRW3JMxKVaB/v2Fk7zXXoMggtsd8jG7qpYCPiWqJhxp9LD1e9Z0wWAmAFm3hfmJgzQYzd1/FSPimdi7xnwIwl1F4LdnTZJn2TrDZ9r+8iOwIh+KqEQhbU2A6Ml9fuIIoZ49S5pIwjXuH8mP6XFSy9ZTqRSbTUOMmiPHhfirIcYz7h7hxRNwVXBYck7ztgWjmzj1g7CaLMQEpb+A+x5pdW2vs3q1DJjyS2qaVHOt8uegm2I1O8/QlcCUhek9ARUQpQ+qvv3tpyDsCqZWTbDh/8g8kzqE9ku+ACXhtXt+coSn3f48OlXkcXbqsxQ3n689VtBrOPyoGJWSIWpRL8TIgWzRtPV4IVRBeMhKuExJqFPUeeSmUPmRocKIl40KRe8gChl/oWEYRp/LGI4y/i2+mzSUHhkByO6vX0fcIPw5fQoJ1mqaO7AkBbxSB13qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(30864003)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qbsjUAr64EqgTXwbWyrvULgtY9ByqhgGWsdYtQYqgKAJzPgk/ENQbbiDhaCE?=
 =?us-ascii?Q?nC9nx428hLVQQ8S0fq2HX5Rj0aUS9f6iUtMvg2L7xbATVAkVCIJ3/CtBqijY?=
 =?us-ascii?Q?IEOT8wuRGoYs6CopArdYJyZp2jwt//xopGDxqnR2qN6+cUloFfD8X+K9G1EU?=
 =?us-ascii?Q?LV7wYiN6V77EUOvwxZItqRb242VE3DYnHOFCEHe01/qdS4CMJqurUpuIMZSn?=
 =?us-ascii?Q?vHPkITS2ZQ33NqMoCecKZHIJ6AFvs5kNMA+pgXJLt7YD0TXelwbHAIWEVAE0?=
 =?us-ascii?Q?cPlVFwl4o+WmpfugjwtC0XUfhoe02G7qV6qhsleGRsQsolLSeXcWPtGfKy0v?=
 =?us-ascii?Q?Nl4E2MWI9bafh9INXTTkRkci3HN+0F8kdfRDS4FoGbsWRfvyVsAYgP9/RYJr?=
 =?us-ascii?Q?PomEdiIjOMYq4Ibua/l9VSOXVBxtf0JooxpxSxPxcvK13hHMnc4V8MKelh0b?=
 =?us-ascii?Q?bHMmWGSA8eafNG6CViTN0/JK51HDnhLtZLqqkVYQ6Z0kFdsqWg7WX1/kJkP3?=
 =?us-ascii?Q?5SUDQ9bmQCYB9GO5HyPQe2bKNIb1lRUdRFk3vPSMwRM93EiKzwR/qmZuJS8n?=
 =?us-ascii?Q?QIjtAH6ax03GrgP2hS8ID65SwiuUgsrl99Y55J5XWfepeiNLRzWzVEizps1z?=
 =?us-ascii?Q?s54bfHCJfzpMqr3u0giNcLXpRNelmHKCpYwWcg0ASbAcl99eFLTB4PfdBUj8?=
 =?us-ascii?Q?eoNEND2ENq3+M/gvVagF8HK246MB85VBwowRGW3BZJeigodfdXYVx6AUXYly?=
 =?us-ascii?Q?jvu7gChPCQiesU0+C3ldITDeoP9Ftbg5jyB96DFrNegu4i60Zy3IVGpNMKKJ?=
 =?us-ascii?Q?ScQVt5hdfHhKfhPLbsqQGWYt4yFZpe3b7n0mdwmCicqvP7XeGt8n/uKQihPn?=
 =?us-ascii?Q?FEiAv7i3Mdp15hnf05EVrI7TShPhuxfhQtLLgKNKUrT4dZTAuHf08W4SKvud?=
 =?us-ascii?Q?P0dagn4ujKtPuErVjToCKoJgP6y9uSX7KSl1u7LhfLG0vI5Qyiomc6zfkQmB?=
 =?us-ascii?Q?z6Xe3u0mmbgltrH5T5BtspPYupZRCBjFA7LjKKahoP1zuHOa0dyMCIT9Ti3D?=
 =?us-ascii?Q?eF13qiq9iMZkdt3wdIPIZ6sMtESU4dZfpaGDojKlC0cmei0xUaqUSpuDFYCK?=
 =?us-ascii?Q?endLdjlJv5QWYLejBc0b2MrVu4WLzO7gXVczqex12fonKsbtxSL1oZBV8vCS?=
 =?us-ascii?Q?tZJU7sz3dpaOPrKx8y3Et69y4/24vXDbOj7OhwbcJyUgExfLkJLeT90yjTAB?=
 =?us-ascii?Q?srL0NvAfm4leMg3ix8z6YqeWkV+kf3LkPGYh60jWVdZiN3fm5DAIX+cfL2Hq?=
 =?us-ascii?Q?FHxCWBQ0jsenYGeK5oB+gOby?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7980321-32ac-44e2-2936-08d91e5f22ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:40.6615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7awY5r+5u9NytK7quU763wnM9QPgP2h8Wb/urOiZ6YConD3tdoSTQAd+fE5fE+p0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 target/s390x/cpu-sysemu.c | 304 ++++++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c        | 282 ++---------------------------------
 target/s390x/meson.build  |   1 +
 target/s390x/trace-events |   2 +-
 4 files changed, 318 insertions(+), 271 deletions(-)
 create mode 100644 target/s390x/cpu-sysemu.c

diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
new file mode 100644
index 0000000000..6081b7ef32
--- /dev/null
+++ b/target/s390x/cpu-sysemu.c
@@ -0,0 +1,304 @@
+/*
+ * QEMU S/390 CPU - System Emulation-only code
+ *
+ * Copyright (c) 2009 Ulrich Hecht
+ * Copyright (c) 2011 Alexander Graf
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ * Copyright (c) 2012 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "kvm_s390x.h"
+#include "sysemu/kvm.h"
+#include "sysemu/reset.h"
+#include "qemu/timer.h"
+#include "trace.h"
+#include "qapi/qapi-visit-run-state.h"
+#include "sysemu/hw_accel.h"
+
+#include "hw/s390x/pv.h"
+#include "hw/boards.h"
+#include "sysemu/arch_init.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
+
+/* S390CPUClass::load_normal() */
+static void s390_cpu_load_normal(CPUState *s)
+{
+    S390CPU *cpu =3D S390_CPU(s);
+    uint64_t spsw;
+
+    if (!s390_is_pv()) {
+        spsw =3D ldq_phys(s->as, 0);
+        cpu->env.psw.mask =3D spsw & PSW_MASK_SHORT_CTRL;
+        /*
+         * Invert short psw indication, so SIE will report a specification
+         * exception if it was not set.
+         */
+        cpu->env.psw.mask ^=3D PSW_MASK_SHORTPSW;
+        cpu->env.psw.addr =3D spsw & PSW_MASK_SHORT_ADDR;
+    } else {
+        /*
+         * Firmware requires us to set the load state before we set
+         * the cpu to operating on protected guests.
+         */
+        s390_cpu_set_state(S390_CPU_STATE_LOAD, cpu);
+    }
+    s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
+}
+
+void s390_cpu_machine_reset_cb(void *opaque)
+{
+    S390CPU *cpu =3D opaque;
+
+    run_on_cpu(CPU(cpu), s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
+}
+
+static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
+{
+    GuestPanicInformation *panic_info;
+    S390CPU *cpu =3D S390_CPU(cs);
+
+    cpu_synchronize_state(cs);
+    panic_info =3D g_malloc0(sizeof(GuestPanicInformation));
+
+    panic_info->type =3D GUEST_PANIC_INFORMATION_TYPE_S390;
+    panic_info->u.s390.core =3D cpu->env.core_id;
+    panic_info->u.s390.psw_mask =3D cpu->env.psw.mask;
+    panic_info->u.s390.psw_addr =3D cpu->env.psw.addr;
+    panic_info->u.s390.reason =3D cpu->env.crash_reason;
+
+    return panic_info;
+}
+
+static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    CPUState *cs =3D CPU(obj);
+    GuestPanicInformation *panic_info;
+
+    if (!cs->crash_occurred) {
+        error_setg(errp, "No crash occurred");
+        return;
+    }
+
+    panic_info =3D s390_cpu_get_crash_info(cs);
+
+    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
+                                     errp);
+    qapi_free_GuestPanicInformation(panic_info);
+}
+
+void s390_cpu_init_sysemu(Object *obj)
+{
+    CPUState *cs =3D CPU(obj);
+    S390CPU *cpu =3D S390_CPU(obj);
+
+    cs->start_powered_off =3D true;
+    object_property_add(obj, "crash-information", "GuestPanicInformation",
+                        s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
+    cpu->env.tod_timer =3D
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
+    cpu->env.cpu_timer =3D
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
+    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
+}
+
+bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
+{
+    S390CPU *cpu =3D S390_CPU(dev);
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+    unsigned int max_cpus =3D ms->smp.max_cpus;
+
+    if (cpu->env.core_id >=3D max_cpus) {
+        error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
+                   ", maximum core-id: %d", cpu->env.core_id,
+                   max_cpus - 1);
+        return false;
+    }
+
+    if (cpu_exists(cpu->env.core_id)) {
+        error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
+                   ", it already exists", cpu->env.core_id);
+        return false;
+    }
+
+    /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. =
*/
+    CPU(cpu)->cpu_index =3D cpu->env.core_id;
+    return true;
+}
+
+void s390_cpu_finalize(Object *obj)
+{
+    S390CPU *cpu =3D S390_CPU(obj);
+
+    timer_free(cpu->env.tod_timer);
+    timer_free(cpu->env.cpu_timer);
+
+    qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
+    g_free(cpu->irqstate);
+}
+
+void s390_cpu_class_init_sysemu(CPUClass *cc)
+{
+    S390CPUClass *scc =3D S390_CPU_CLASS(cc);
+
+    scc->load_normal =3D s390_cpu_load_normal;
+    cc->get_phys_page_debug =3D s390_cpu_get_phys_page_debug;
+    cc->vmsd =3D &vmstate_s390_cpu;
+    cc->get_crash_info =3D s390_cpu_get_crash_info;
+    cc->write_elf64_note =3D s390_cpu_write_elf64_note;
+}
+
+static bool disabled_wait(CPUState *cpu)
+{
+    return cpu->halted && !(S390_CPU(cpu)->env.psw.mask &
+                            (PSW_MASK_IO | PSW_MASK_EXT | PSW_MASK_MCHECK)=
);
+}
+
+static unsigned s390_count_running_cpus(void)
+{
+    CPUState *cpu;
+    int nr_running =3D 0;
+
+    CPU_FOREACH(cpu) {
+        uint8_t state =3D S390_CPU(cpu)->env.cpu_state;
+        if (state =3D=3D S390_CPU_STATE_OPERATING ||
+            state =3D=3D S390_CPU_STATE_LOAD) {
+            if (!disabled_wait(cpu)) {
+                nr_running++;
+            }
+        }
+    }
+
+    return nr_running;
+}
+
+unsigned int s390_cpu_halt(S390CPU *cpu)
+{
+    CPUState *cs =3D CPU(cpu);
+    trace_cpu_halt(cs->cpu_index);
+
+    if (!cs->halted) {
+        cs->halted =3D 1;
+        cs->exception_index =3D EXCP_HLT;
+    }
+
+    return s390_count_running_cpus();
+}
+
+void s390_cpu_unhalt(S390CPU *cpu)
+{
+    CPUState *cs =3D CPU(cpu);
+    trace_cpu_unhalt(cs->cpu_index);
+
+    if (cs->halted) {
+        cs->halted =3D 0;
+        cs->exception_index =3D -1;
+    }
+}
+
+unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+ {
+    trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
+
+    switch (cpu_state) {
+    case S390_CPU_STATE_STOPPED:
+    case S390_CPU_STATE_CHECK_STOP:
+        /* halt the cpu for common infrastructure */
+        s390_cpu_halt(cpu);
+        break;
+    case S390_CPU_STATE_OPERATING:
+    case S390_CPU_STATE_LOAD:
+        /*
+         * Starting a CPU with a PSW WAIT bit set:
+         * KVM: handles this internally and triggers another WAIT exit.
+         * TCG: will actually try to continue to run. Don't unhalt, will
+         *      be done when the CPU actually has work (an interrupt).
+         */
+        if (!tcg_enabled() || !(cpu->env.psw.mask & PSW_MASK_WAIT)) {
+            s390_cpu_unhalt(cpu);
+        }
+        break;
+    default:
+        error_report("Requested CPU state is not a valid S390 CPU state: %=
u",
+                     cpu_state);
+        exit(1);
+    }
+    if (kvm_enabled() && cpu->env.cpu_state !=3D cpu_state) {
+        kvm_s390_set_cpu_state(cpu, cpu_state);
+    }
+    cpu->env.cpu_state =3D cpu_state;
+
+    return s390_count_running_cpus();
+}
+
+int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_set_mem_limit(new_limit, hw_limit);
+    }
+    return 0;
+}
+
+void s390_set_max_pagesize(uint64_t pagesize, Error **errp)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_max_pagesize(pagesize, errp);
+    }
+}
+
+void s390_cmma_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_cmma_reset();
+    }
+}
+
+int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
+                                int vq, bool assign)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_assign_subch_ioeventfd(notifier, sch_id, vq, assig=
n);
+    } else {
+        return 0;
+    }
+}
+
+void s390_crypto_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_crypto_reset();
+    }
+}
+
+void s390_enable_css_support(S390CPU *cpu)
+{
+    if (kvm_enabled()) {
+        kvm_s390_enable_css_support(cpu);
+    }
+}
+
+void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_diag318(cs, arg.host_ulong);
+    }
+}
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 533b251b7e..59efe48bcd 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -27,21 +27,11 @@
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
-#include "qemu/timer.h"
-#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "trace.h"
-#include "qapi/visitor.h"
 #include "qapi/qapi-types-machine.h"
-#include "qapi/qapi-visit-run-state.h"
 #include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
-#ifndef CONFIG_USER_ONLY
-#include "hw/s390x/pv.h"
-#include "hw/boards.h"
-#include "sysemu/arch_init.h"
-#include "sysemu/tcg.h"
-#endif
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
=20
@@ -72,33 +62,6 @@ static bool s390_cpu_has_work(CPUState *cs)
     return s390_cpu_has_int(cpu);
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-/* S390CPUClass::load_normal() */
-static void s390_cpu_load_normal(CPUState *s)
-{
-    S390CPU *cpu =3D S390_CPU(s);
-    uint64_t spsw;
-
-    if (!s390_is_pv()) {
-        spsw =3D ldq_phys(s->as, 0);
-        cpu->env.psw.mask =3D spsw & PSW_MASK_SHORT_CTRL;
-        /*
-         * Invert short psw indication, so SIE will report a specification
-         * exception if it was not set.
-         */
-        cpu->env.psw.mask ^=3D PSW_MASK_SHORTPSW;
-        cpu->env.psw.addr =3D spsw & PSW_MASK_SHORT_ADDR;
-    } else {
-        /*
-         * Firmware requires us to set the load state before we set
-         * the cpu to operating on protected guests.
-         */
-        s390_cpu_set_state(S390_CPU_STATE_LOAD, cpu);
-    }
-    s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
-}
-#endif
-
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 {
@@ -169,15 +132,6 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type=
 type)
     }
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-static void s390_cpu_machine_reset_cb(void *opaque)
-{
-    S390CPU *cpu =3D opaque;
-
-    run_on_cpu(CPU(cpu), s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
-}
-#endif
-
 static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach =3D bfd_mach_s390_64;
@@ -191,9 +145,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error =
**errp)
 {
     CPUState *cs =3D CPU(dev);
     S390CPUClass *scc =3D S390_CPU_GET_CLASS(dev);
-#if !defined(CONFIG_USER_ONLY)
-    S390CPU *cpu =3D S390_CPU(dev);
-#endif
     Error *err =3D NULL;
=20
     /* the model has to be realized before qemu_init_vcpu() due to kvm */
@@ -203,23 +154,9 @@ static void s390_cpu_realizefn(DeviceState *dev, Error=
 **errp)
     }
=20
 #if !defined(CONFIG_USER_ONLY)
-    MachineState *ms =3D MACHINE(qdev_get_machine());
-    unsigned int max_cpus =3D ms->smp.max_cpus;
-    if (cpu->env.core_id >=3D max_cpus) {
-        error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
-                   ", maximum core-id: %d", cpu->env.core_id,
-                   max_cpus - 1);
-        goto out;
-    }
-
-    if (cpu_exists(cpu->env.core_id)) {
-        error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
-                   ", it already exists", cpu->env.core_id);
+    if (!s390_cpu_realize_sysemu(dev, &err)) {
         goto out;
     }
-
-    /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. =
*/
-    cs->cpu_index =3D cpu->env.core_id;
 #endif
=20
     cpu_exec_realizefn(cs, &err);
@@ -228,7 +165,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error =
**errp)
     }
=20
 #if !defined(CONFIG_USER_ONLY)
-    qemu_register_reset(s390_cpu_machine_reset_cb, cpu);
+    qemu_register_reset(s390_cpu_machine_reset_cb, S390_CPU(dev));
 #endif
     s390_cpu_gdb_init(cs);
     qemu_init_vcpu(cs);
@@ -250,44 +187,6 @@ out:
     error_propagate(errp, err);
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
-{
-    GuestPanicInformation *panic_info;
-    S390CPU *cpu =3D S390_CPU(cs);
-
-    cpu_synchronize_state(cs);
-    panic_info =3D g_malloc0(sizeof(GuestPanicInformation));
-
-    panic_info->type =3D GUEST_PANIC_INFORMATION_TYPE_S390;
-    panic_info->u.s390.core =3D cpu->env.core_id;
-    panic_info->u.s390.psw_mask =3D cpu->env.psw.mask;
-    panic_info->u.s390.psw_addr =3D cpu->env.psw.addr;
-    panic_info->u.s390.reason =3D cpu->env.crash_reason;
-
-    return panic_info;
-}
-
-static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
-                                        const char *name, void *opaque,
-                                        Error **errp)
-{
-    CPUState *cs =3D CPU(obj);
-    GuestPanicInformation *panic_info;
-
-    if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occurred");
-        return;
-    }
-
-    panic_info =3D s390_cpu_get_crash_info(cs);
-
-    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
-                                     errp);
-    qapi_free_GuestPanicInformation(panic_info);
-}
-#endif
-
 static void s390_cpu_initfn(Object *obj)
 {
     CPUState *cs =3D CPU(obj);
@@ -295,169 +194,12 @@ static void s390_cpu_initfn(Object *obj)
=20
     cpu_set_cpustate_pointers(cpu);
     cs->exception_index =3D EXCP_HLT;
-#if !defined(CONFIG_USER_ONLY)
-    cs->start_powered_off =3D true;
-    object_property_add(obj, "crash-information", "GuestPanicInformation",
-                        s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
-    cpu->env.tod_timer =3D
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
-    cpu->env.cpu_timer =3D
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
-    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
-#endif
-}
=20
-static void s390_cpu_finalize(Object *obj)
-{
 #if !defined(CONFIG_USER_ONLY)
-    S390CPU *cpu =3D S390_CPU(obj);
-
-    timer_free(cpu->env.tod_timer);
-    timer_free(cpu->env.cpu_timer);
-
-    qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
-    g_free(cpu->irqstate);
+    s390_cpu_init_sysemu(obj);
 #endif
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-static bool disabled_wait(CPUState *cpu)
-{
-    return cpu->halted && !(S390_CPU(cpu)->env.psw.mask &
-                            (PSW_MASK_IO | PSW_MASK_EXT | PSW_MASK_MCHECK)=
);
-}
-
-static unsigned s390_count_running_cpus(void)
-{
-    CPUState *cpu;
-    int nr_running =3D 0;
-
-    CPU_FOREACH(cpu) {
-        uint8_t state =3D S390_CPU(cpu)->env.cpu_state;
-        if (state =3D=3D S390_CPU_STATE_OPERATING ||
-            state =3D=3D S390_CPU_STATE_LOAD) {
-            if (!disabled_wait(cpu)) {
-                nr_running++;
-            }
-        }
-    }
-
-    return nr_running;
-}
-
-unsigned int s390_cpu_halt(S390CPU *cpu)
-{
-    CPUState *cs =3D CPU(cpu);
-    trace_cpu_halt(cs->cpu_index);
-
-    if (!cs->halted) {
-        cs->halted =3D 1;
-        cs->exception_index =3D EXCP_HLT;
-    }
-
-    return s390_count_running_cpus();
-}
-
-void s390_cpu_unhalt(S390CPU *cpu)
-{
-    CPUState *cs =3D CPU(cpu);
-    trace_cpu_unhalt(cs->cpu_index);
-
-    if (cs->halted) {
-        cs->halted =3D 0;
-        cs->exception_index =3D -1;
-    }
-}
-
-unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
- {
-    trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
-
-    switch (cpu_state) {
-    case S390_CPU_STATE_STOPPED:
-    case S390_CPU_STATE_CHECK_STOP:
-        /* halt the cpu for common infrastructure */
-        s390_cpu_halt(cpu);
-        break;
-    case S390_CPU_STATE_OPERATING:
-    case S390_CPU_STATE_LOAD:
-        /*
-         * Starting a CPU with a PSW WAIT bit set:
-         * KVM: handles this internally and triggers another WAIT exit.
-         * TCG: will actually try to continue to run. Don't unhalt, will
-         *      be done when the CPU actually has work (an interrupt).
-         */
-        if (!tcg_enabled() || !(cpu->env.psw.mask & PSW_MASK_WAIT)) {
-            s390_cpu_unhalt(cpu);
-        }
-        break;
-    default:
-        error_report("Requested CPU state is not a valid S390 CPU state: %=
u",
-                     cpu_state);
-        exit(1);
-    }
-    if (kvm_enabled() && cpu->env.cpu_state !=3D cpu_state) {
-        kvm_s390_set_cpu_state(cpu, cpu_state);
-    }
-    cpu->env.cpu_state =3D cpu_state;
-
-    return s390_count_running_cpus();
-}
-
-int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
-{
-    if (kvm_enabled()) {
-        return kvm_s390_set_mem_limit(new_limit, hw_limit);
-    }
-    return 0;
-}
-
-void s390_set_max_pagesize(uint64_t pagesize, Error **errp)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_max_pagesize(pagesize, errp);
-    }
-}
-
-void s390_cmma_reset(void)
-{
-    if (kvm_enabled()) {
-        kvm_s390_cmma_reset();
-    }
-}
-
-int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
-                                int vq, bool assign)
-{
-    if (kvm_enabled()) {
-        return kvm_s390_assign_subch_ioeventfd(notifier, sch_id, vq, assig=
n);
-    } else {
-        return 0;
-    }
-}
-
-void s390_crypto_reset(void)
-{
-    if (kvm_enabled()) {
-        kvm_s390_crypto_reset();
-    }
-}
-
-void s390_enable_css_support(S390CPU *cpu)
-{
-    if (kvm_enabled()) {
-        kvm_s390_enable_css_support(cpu);
-    }
-}
-
-void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_diag318(cs, arg.host_ulong);
-    }
-}
-#endif
-
 static gchar *s390_gdb_arch_name(CPUState *cs)
 {
     return g_strdup("s390:64-bit");
@@ -504,9 +246,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
data)
     dc->user_creatable =3D true;
=20
     device_class_set_parent_reset(dc, s390_cpu_reset_full, &scc->parent_re=
set);
-#if !defined(CONFIG_USER_ONLY)
-    scc->load_normal =3D s390_cpu_load_normal;
-#endif
+
     scc->reset =3D s390_cpu_reset;
     cc->class_by_name =3D s390_cpu_class_by_name,
     cc->has_work =3D s390_cpu_has_work;
@@ -514,17 +254,15 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
     cc->set_pc =3D s390_cpu_set_pc;
     cc->gdb_read_register =3D s390_cpu_gdb_read_register;
     cc->gdb_write_register =3D s390_cpu_gdb_write_register;
-#ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug =3D s390_cpu_get_phys_page_debug;
-    cc->vmsd =3D &vmstate_s390_cpu;
-    cc->get_crash_info =3D s390_cpu_get_crash_info;
-    cc->write_elf64_note =3D s390_cpu_write_elf64_note;
-#endif
     cc->disas_set_info =3D s390_cpu_disas_set_info;
     cc->gdb_num_core_regs =3D S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file =3D "s390x-core64.xml";
     cc->gdb_arch_name =3D s390_gdb_arch_name;
=20
+#ifndef CONFIG_USER_ONLY
+    s390_cpu_class_init_sysemu(cc);
+#endif /* CONFIG_USER_ONLY */
+
     s390_cpu_model_class_register_props(oc);
=20
 #ifdef CONFIG_TCG
@@ -538,7 +276,11 @@ static const TypeInfo s390_cpu_type_info =3D {
     .instance_size =3D sizeof(S390CPU),
     .instance_align =3D __alignof__(S390CPU),
     .instance_init =3D s390_cpu_initfn,
+
+#ifndef CONFIG_USER_ONLY
     .instance_finalize =3D s390_cpu_finalize,
+#endif /* !CONFIG_USER_ONLY */
+
     .abstract =3D true,
     .class_size =3D sizeof(S390CPUClass),
     .class_init =3D s390_cpu_class_init,
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 60d7f1b908..a73bae3dc5 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -28,6 +28,7 @@ s390x_softmmu_ss.add(files(
   'machine.c',
   'mmu_helper.c',
   'sigp.c',
+  'cpu-sysemu.c',
 ))
=20
 # Newer kernels on s390 check for an S390_PGSTE program header and
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index fda1ee8220..e6c5fc1d03 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -16,7 +16,7 @@ kvm_clear_cmma(int rc) "CMMA: clearing with result code %=
d"
 kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "W=
arning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
 kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamat=
ch) "fd: %d sch: @0x%x assign: %d vq: %d"
=20
-# cpu.c
+# cpu-sysemu.c
 cpu_set_state(int cpu_index, uint8_t state) "setting cpu %d state to %" PR=
Iu8
 cpu_halt(int cpu_index) "halting cpu %d"
 cpu_unhalt(int cpu_index) "unhalting cpu %d"
--=20
2.31.1


