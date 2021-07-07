Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC93BE6C0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:58:19 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Fy-0002lM-P6
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CI-0003TY-Dz
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:30 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:21671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CD-00024k-PD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+AiDlL+61L5B1wn+xjCmG+/XTJbswjpGkOhHK6N/t4=;
 b=NKGJoonsaV0Tz9U1Vzsa7JxMgPGnSCX1SlKbFQA/ZHdoTPCgjuOUcNh1Txv2wrDYG2dYVv
 f1aDl9KZI24tyWvcdABxO1bv0PWylMISaTRK/STaonJQ2g9ta3OmHBisHI19kVVw6z4c7M
 jlmider1NAhJquP1WlZzVNdlNxCGGjU=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-JCYnGIcwNL-tUUxSkvDz2w-1; Wed, 07 Jul 2021 12:54:23 +0200
X-MC-Unique: JCYnGIcwNL-tUUxSkvDz2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5qXQgd3DkvvzhdC3ASKMiU2+ol3CD9uNw3LiKA3s1DHC+4UyUET1naQ2J0WvYhBSAcv++Ut8+rvhaUp5Hn20EPZqk6oxhVVHqmhMaXETM3RDF6s8XrSKQCTOhzDt6iGCpC4ZWtYLEgxzQWUGUApRz8T44vaf7fZ7HAYzV5DWIPQMEmqTM8ggZDFDl/JU7kT9uP02Nah9L6MN1iColpX80o2oNHxkSv0gjrH9Rzpv/ruWipM74nM5QFl3iTH4aIOVdaMYMasMKG/AhtmeAPSjPa6gspuQtBhyx+ShoFWCCSioZHrSI0uHSnIWcmHKwXs8zkusZZOt8NfCuMyyRRbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2I1n5ILhTXtXIbsXKlVlNKj5da82OQa2amKHf3EeVE=;
 b=RukARCoFXaCWKJyV4pVtBQIS+9r067Bfc6vQ02l8Wi5WMdayFPZWYKUua4TEsutQoueVskRso8HeG5OGvSzI1u7n3iDgFsO2AF991OUpnYDGdpccvYqIPef57ia0L5xv0uCb2wVn7KSC4JW6+iahfzYbQHSjcKjpIsEAGnm6+wPTyFsqWg8FygVqupe+PE+opYVzpDDLBDJhUfkm2GeKDDnWfWscAy09Nzo1EOiBZFQcCyeBdTVc5kfpV9Wlc/5Rn3oQtT7COCLXvvNAFh4qPzDxorBkfuuSpGqUS+kWqRbCWMjq5z8j6B3fLWF6VoMmjvE+FyyW/HLKMrr5SSJruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:54:21 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:21 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 08/14] target/s390x: move sysemu-only code out to
 cpu-sysemu.c
Date: Wed,  7 Jul 2021 18:53:18 +0800
Message-ID: <20210707105324.23400-9-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0069.apcprd04.prod.outlook.com
 (2603:1096:202:15::13) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0069.apcprd04.prod.outlook.com (2603:1096:202:15::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 10:54:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a703840e-6c1f-4781-837f-08d941359370
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22385C43AE7518329E85398DA01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Bncbc3TPDqLBaAxkt4LMs2rGKbRRY6Uhr/iHimJxuVxEx5tVCMqfr+56g4xmG/Aja7azr69p+iJIy4zhkRnZzTdZ/tCn4qDw2vqVKt/TjMJyyZCPaJCasD1Ox55VZ0kH1NG622Y5sN+R1n8gEoo42cbvftZm3Thj3QitZQnyA/LucfbkJsoVQ5ehlr107rPygW0UiAme+EzjEcgB9j53kPmj2EZtXUlmFUkRfIMsrpTW2fGSFPWAJC2tOL+7HCBXx9QW0hOV38GDy1rhCwzJSw1zmxCB+Mszaco6ivCA1JCsP6kKpqWw1bJEwK3TyQ8GQOEM7vhTFdmt2eOOnKxEQ++vLfD2voIym8rn1fatAMfaYvLXkP0spoSoz0JBKvPOA8EgKVJoPBSp7qgjmtAfpaoWBhugJfdZaIq5m/+8GWwJG82CqmUffbfHaZccHLWKWLpNyEG9dXDB/5ILmrESIWsOmlP0HbhtdCrLivoE7MSKWiM6W/aklkdctjQoFUnhui4H50zhcIDUcROa2GlLtkcPrFGHxFssYuOe6aDe2lBkfK4OxGkxWjnX0eo02CwkVbU/wM4d58URm6EZ/0QnAkNaSTpK6lSMdjxq8ZO+PNFt8jXe8Xccgi+wb7XuvglV/Eg67xnA4II7wDrlQP2wdoxYhvy86a+sM+SJHBvTkzuY5HnW8o4nOU59MkqUiUv2IQdphkMtM7FFsDtcs0Y59Bc/eZN8IGjghN8zoy9DO4dbDwZ2WV2hLvC6BKn5hS5nJZfwEINpSTuoctgSHK2LVWzP0czxkuxBOl0nFPB6R4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(30864003)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/zrUjyCtw1Kd6ePZ2e4L6AabPOP6ePV99zOFMGGgOxeLc438jzprY2uiKYUf?=
 =?us-ascii?Q?bYw7Pp3Hi2IipQPRiVpxlupGlPGG9yVkn3fvejC8zNYksj+gAmJ1VWmzbjSu?=
 =?us-ascii?Q?9iOZU6yxsql21RK90yHowrVLeuhFUOkRAalYQCl1RiO6NOSxbfQU3+3xn9KH?=
 =?us-ascii?Q?aw4bnRYtL05cFGgC0e9HZJodP4rhFP7r5sNNDkWNQpgurBHifrlyx6AkWM3T?=
 =?us-ascii?Q?G+KZ3BWKBZcgU/Dj3yfrb+qiAuwc+mPw4NqXlETndkFPTHi0tVsGlf9u3qQL?=
 =?us-ascii?Q?m6/WJoXYUsHf/XvaJfPp78Nak9JBZEotXzvLfCxE6EfClIUAKiiTMRbe9HKC?=
 =?us-ascii?Q?xKWgEzSI2m5dOBRa+OiN4q7e1sSW++2yuuI04QrjuVSXJHJFXSQU49mB8R8a?=
 =?us-ascii?Q?qzkMoipSl1JLmhCv9l57vZbbO6S8nznBIO2c9VE9GOVeAXgJ0ZXclQCTUy9l?=
 =?us-ascii?Q?AUsXDV0L/rFgPwV8om/U7U2b3gxyfYB1L5+0unpU6PPtUYfz3ru1Ug41Yxjq?=
 =?us-ascii?Q?uJM/o/wjV6NKq6tEa2vs77dydL+cgXtvbx2IMnSYiI7/caKW7HVwtgTRd+3y?=
 =?us-ascii?Q?KdBtcqUoHdph1LQT0q+QFB4UzpM95DbDKr4zzuPgnaH1Xdw6dPKBfC4KUDer?=
 =?us-ascii?Q?lJigZ1TPU1vYGGzUkaetmdT2DhRPP+ukBaLbvhNmasf1ZZaysu5U9Pcq9mRB?=
 =?us-ascii?Q?grQpLDb2pNXDfVvya88EI/1HZJP0ScnZBZ22OCakNfpmTaW1gShIlo8GJ5ih?=
 =?us-ascii?Q?pbDiwyy14PWoq+Ka7Kpjb2sCGHhjW+lsVTQBNR/1brBv5+adMEtgZfpFARLl?=
 =?us-ascii?Q?BrINfgGGaiqwDD2J9cdyU5YwIX75GHcdfZ8FSfC0OWAbOD1T3NPx0xfarRcq?=
 =?us-ascii?Q?dV2gL2jG6Od5WvSwQYlwFfm+33BbLimfYXLS8B/PO/pw9djWk/CjWm87MMwe?=
 =?us-ascii?Q?UgCOleY/pKpCMskhAoEzJACrof1oU6hHmTjCgVru+CJOEp1TfVGykRv6YBVP?=
 =?us-ascii?Q?bVj7lZTzjVuJ7j3erBWQ4BIcbM6HMT1wVO/wyCpkgsVpIsgqjktkf17viXSN?=
 =?us-ascii?Q?DsQ9nCX24o3Zd8RGga/Ysi7MQQmqZvtqCPzIbs3tyFS9SAGti1rPYftC2NtL?=
 =?us-ascii?Q?Fgn7mYvyLPwB8n16GJasHSJ9TQb8FkMZyY6wRqHgWZySOVvjc5D6xeD/LqWp?=
 =?us-ascii?Q?Phf20B0gPcH90oIC2D5TpvFWe+8bZiOV/HdbShTMA9/eP2VG/Zz3rTEtCoNU?=
 =?us-ascii?Q?8qfxpL/bXTkM0t9RDQmLeYVxal4Giu3tSJOhHcdjKdj7k+crqaB+ySX+H5C4?=
 =?us-ascii?Q?vjezv65JZrJyXQS43uavV0np?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a703840e-6c1f-4781-837f-08d941359370
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:21.5470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG85xOnhVtQEg4Y/0CHby0u5conNpNXrtElmEbdtHs0uk+vVkSnUIa9a6r4VnxIl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

move sysemu-only code out to cpu-sysemu.c

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu-sysemu.c     | 309 ++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c            | 285 +------------------------------
 target/s390x/meson.build      |   1 +
 target/s390x/s390x-internal.h |   6 +
 target/s390x/trace-events     |   2 +-
 5 files changed, 326 insertions(+), 277 deletions(-)
 create mode 100644 target/s390x/cpu-sysemu.c

diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
new file mode 100644
index 0000000000..16e5301084
--- /dev/null
+++ b/target/s390x/cpu-sysemu.c
@@ -0,0 +1,309 @@
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
+#include "hw/core/sysemu-cpu-ops.h"
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
+static const struct SysemuCPUOps s390_sysemu_ops =3D {
+    .get_phys_page_debug =3D s390_cpu_get_phys_page_debug,
+    .get_crash_info =3D s390_cpu_get_crash_info,
+    .write_elf64_note =3D s390_cpu_write_elf64_note,
+    .legacy_vmsd =3D &vmstate_s390_cpu,
+};
+
+void s390_cpu_class_init_sysemu(CPUClass *cc)
+{
+    S390CPUClass *scc =3D S390_CPU_CLASS(cc);
+
+    scc->load_normal =3D s390_cpu_load_normal;
+    cc->sysemu_ops =3D &s390_sysemu_ops;
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
index 1795042e97..2b2b70e1c6 100644
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
@@ -476,17 +218,6 @@ static void s390_cpu_reset_full(DeviceState *dev)
     return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
 }
=20
-#ifndef CONFIG_USER_ONLY
-#include "hw/core/sysemu-cpu-ops.h"
-
-static const struct SysemuCPUOps s390_sysemu_ops =3D {
-    .get_phys_page_debug =3D s390_cpu_get_phys_page_debug,
-    .get_crash_info =3D s390_cpu_get_crash_info,
-    .write_elf64_note =3D s390_cpu_write_elf64_note,
-    .legacy_vmsd =3D &vmstate_s390_cpu,
-};
-#endif
-
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
=20
@@ -515,9 +246,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
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
@@ -526,7 +255,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
data)
     cc->gdb_read_register =3D s390_cpu_gdb_read_register;
     cc->gdb_write_register =3D s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->sysemu_ops =3D &s390_sysemu_ops;
+    s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info =3D s390_cpu_disas_set_info;
     cc->gdb_num_core_regs =3D S390_NUM_CORE_REGS;
@@ -546,7 +275,11 @@ static const TypeInfo s390_cpu_type_info =3D {
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
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 9256275376..17edd4d13b 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -240,6 +240,12 @@ uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, u=
int64_t src, uint64_t dst,
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_halt(S390CPU *cpu);
 void s390_cpu_unhalt(S390CPU *cpu);
+void s390_cpu_init_sysemu(Object *obj);
+bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
+void s390_cpu_finalize(Object *obj);
+void s390_cpu_class_init_sysemu(CPUClass *cc);
+void s390_cpu_machine_reset_cb(void *opaque);
+
 #else
 static inline unsigned int s390_cpu_halt(S390CPU *cpu)
 {
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index e661a81e3a..e83a8cf85e 100644
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
2.32.0


