Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1A38DF78
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:58:55 +0200 (CEST)
Received: from localhost ([::1]:47400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0nu-0006bX-7t
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0j3-0006Zu-L9
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0iz-0003Os-M9
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIqbyE3cN9VSLbZjqwwam/7dDf8pi7hjzYb0LaBboTE=;
 b=l63OyezV9Oa5JZyfPQ3wxputGbw7ccbEtK/9tF5WH/gDDoLPz6xXyjIwAogryWGaaJdHHQ
 H+dt29qSE5eQEGoODCqjB0i9hJUTsAxrYYEK/KdZHC702Koi9AtfpznuDq9dQj/ds8FyQu
 4qV2kHR0b/9/Z7AdEjm0j8b7bux7OmI=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26--Vbr5nPsPN2THjr8gtpfsg-1; Mon, 24 May 2021 04:53:46 +0200
X-MC-Unique: -Vbr5nPsPN2THjr8gtpfsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np0FnI1EF/9Eoh7VvvyZ4ZBixNRlt2VMqQQ1tOzBnNLI0NWrJV5Kx667cUBm3AD/K27HANQl5FfDkokC+wyfb9O4bGn8hfZY/QOpanoX83tQBZD87VhBW8jGWosfDOli2DUS+QQ8VzfYM4K2fzI/WuKryWZT9xSetcgyXQncmSbhlZoDYg656xXnQuEkVn3AnsT2JJbMO3idDqnH51jaUFGR1Wje02xgtwSFUErIJbp20WaE48wjsKTAUX9FDLYJ9d9lwWFum/MxlyiTfJSk9X9R1VuFyRQggBaiTDOZWEBuryc3KeOZQaxR/Dmgx1LASsMUsjW0wM1A/l5qcxIcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVITeNNGvP6m0f1orkIHCSiSezam90I1Nnw3LOtpqiM=;
 b=SIoCuLh2yR12GCSHA0qV6wLUlpMp8l9IosN3m/IY5lzLpORTvu5QAGw8c6ZtiSQMPz1WZF9V3sYEUp6IDiQcqIXWvhBfRK3QwPeXo0cfzTLxNjMsNrzmAdEKAfA33gj8wVGmtCMFJ34DnrrfGvj4UI2SQl559boW/wVsTZP+ylG4RPndE+R8aFkmeBhOWtdM2Kb9nOBXMXZU77FsaAlBPAnCN0V6XA8sGAjguoRoQtO71UPhy2BZsQLhwQEOOqyGd6L795X1SpvWEzn1nBHZsrn2q90xr357PLtxlT8k6FVHqC3Z/JJDA7X0xe+qh3bEqTC5IBXOHjLp0PnxzFphcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:45 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:45 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 08/14] target/s390x: split cpu-dump from helper.c
Date: Mon, 24 May 2021 10:52:50 +0800
Message-ID: <20210524025256.22252-8-acho@suse.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52973af4-6310-4001-1035-08d91e5f254a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126C95B615F0F5AA22F65EDA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6g07NtlY2G1YoJ2IIktIxGM1BN3XwRsTPZ8hoyyhWdLngoi6uIEDtCUK2SWchjUdICZmjyqxdjZi+v/2oJkXc5WZXxQC9PpTAR+Uzik4vV4lrz1OnsdQ8bZtkQIgLeLVLJCisZPnEWc2nIpuH5nadg9urzAphGIT+/x0YGD8iLcOVfzBrPZBJqIlWcbk+Cc+Km1r5NP5TDYHiR7Ob4SryXwxL1Gxku+Rx1VWwuyfYdlLl2fPNEch+dN3wikLYsVv09Fpd0XeE2UXScM2OUOmKV4VZ+nFXtE6WVBvi0DRwPvO12NBS/77mCdutFmgS2PBUV9X4COxCYiF5Wi2fU954wOOz+lFoXqzm75Dw3MZEJlUH1dZF9bp/Q34YSrKvjIhjsqtrQKF+7D2/GQPwo8f1MaOj90c3NOssmiDDHVlmpVl3e63ydXvIfFrft3Blp7tPVYXT3yFXDUEZBrROvG6smfhcqqQXSZSieLUJIrV6izd6EDPF64MDm/W6BTGhN/YN/R8yzFiXDTqugnEWd1YMY0tqIvHjQc62G1aRLegBTT1J9B7xgtaRxLFkUrzXbyhB3i2ZqJhsEIcjEtWfCvr21W6GvGaDEgPLFz3gtLNj3QWIYPwd/cWZydyOL17HHU2LY1+je5dqo+velHZJ3rxdtG8P/igPzcH/+IcbnxSyz30UlRTK61ardVqqLfsaboUbiQk9zgCqBcHRLQfT6FDh1sv+Xie61mHvEifBIQqoH2yoy9IcXXHuX074sJ/lh/W6n8Z+87pvdafk0vGPIlRR+XNIxboT8grzl+ZnYHrvrbZ1M8sBuF0EdhaV2W0+CnNv/K6LCTeEBIKYzcmKxBlTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Kchx6CeaxLqCKqjnkAA9OzgrIWgV/hUNAEkRrsJ2zYgoCpe20h2oTMFhFpvS?=
 =?us-ascii?Q?72W0knTcLoYmzcSBCnazFcWizS0nGdUFEsXfXp0l9hs7EdFxUCRvvZ5s5NiH?=
 =?us-ascii?Q?9TiPNnV2YPsVmf0db/vG7YJrCSOtJsd2XXo7mMhzEfr/Rx9gl8ws128hpOaV?=
 =?us-ascii?Q?UzRzGNKxUdOMtcKoIrQQFyCI5+uppvbqK6Dxhov/nmHxVRcJForAF+Zv68Nx?=
 =?us-ascii?Q?eHF/KdHQK/fXgDQGY3UDgegukGpBfl7/6ntZbfm34+ltgamzuUW+TytWqbTV?=
 =?us-ascii?Q?qPLI9cmwT2Fq9Daj52xZsGt+rsJozrjvAxN2wa53in7bTHY77efl28xyGf8r?=
 =?us-ascii?Q?MYhbDf0EhCH8t6f6bnCH3Z0lLHS9FR97HdNOQaK9ylU8pgGP8izMSC0vZd89?=
 =?us-ascii?Q?O25DQ33G1+bjwmZamDQ4XWkiTbMZ483KU5D/HuYhGp4LuQ6zqB9Y61A7tT1T?=
 =?us-ascii?Q?wivFJ1ATpvpTcqbHbaVNm90NWDKI7ySG+zPd7DzHsB/m0Q9QoTluNe+QQrM4?=
 =?us-ascii?Q?0+GnD8/g4+tti5U0FTL4nwxMxeAuCvAW4XVQPv97/sUKzwKTFG7YwrGluq+R?=
 =?us-ascii?Q?ENI3M6ymO8glL8nmh8l68UBxZ1oM8N73tbNILGsu1t5KvYGCe7oWwyOXD48b?=
 =?us-ascii?Q?WJ5JnGv4RVBNZWajXneAR2kmrHJZvagipbQAmvoHXSbJTOK5szhdjN41b9y8?=
 =?us-ascii?Q?84CsJBEiQ7asCsELyCJkrGolcEiTtf3t6PjwaKBIw0DMp+fmFLXgtNcx5R7c?=
 =?us-ascii?Q?H8uLr1+JsCrZHExAErVPaQVTol7qG1PejTt6TuiDWWCwaTIAhHTcGVfLAnWd?=
 =?us-ascii?Q?RS8F1eaRF4tkufM14wkW0HgvaJUQgpJEuzE80UjeSKWgGtgYJS2DHuAjRwn+?=
 =?us-ascii?Q?jj1QOSlxY3FQKJzDNHjcRuK9ik1+kalDTDOnfF6tPeFtytZB4I1SnPWEYIfQ?=
 =?us-ascii?Q?NyPGSAO1FDf2UmaDJldQB+vJ19s+rLbky6pVO3MAJ6a9Z1txb/ZdG/W52ZPc?=
 =?us-ascii?Q?QxiHv6imab/GnGwqwVg7TH5UR5xYYCQcQ9FeThYz9aln82pbEHWwdfPY0yNx?=
 =?us-ascii?Q?JYqpL7GmAlxbhw8Op8xQ4CxpDkM6Z6paif2v34U/l3+VlAcI+WFs+kyIj5B2?=
 =?us-ascii?Q?5egJscDunXNG3txCLIhGCcGyGgTJwkqGs+UjmNWyUei+5OvWz3BHlmzXMIK2?=
 =?us-ascii?Q?0UG8PDUg9V1cqdxnLg6P1eNf7EHBN3AjvoN66NMZU+ShcXnPCvKROk5P4BDn?=
 =?us-ascii?Q?pRIWhiAK9/71IivoMu+V29gZb//LB7dq5csgU0xRnT4KMFqpmbM5UHfTSgrE?=
 =?us-ascii?Q?620l4C7O5BJwulAjvqub9MdY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52973af4-6310-4001-1035-08d91e5f254a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:44.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ2CeNQqKcrNPMsb+bgHFx0zzfYUH19Txr1Z6eS8n7DZ1cqbCcSqjUSxv/EziXUW
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/cpu-dump.c  | 131 +++++++++++++++++++++++++++++++++++++++
 target/s390x/helper.c    | 107 --------------------------------
 target/s390x/meson.build |   1 +
 3 files changed, 132 insertions(+), 107 deletions(-)
 create mode 100644 target/s390x/cpu-dump.c

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
new file mode 100644
index 0000000000..4170dec01a
--- /dev/null
+++ b/target/s390x/cpu-dump.c
@@ -0,0 +1,131 @@
+/*
+ * S/390 CPU dump to FILE
+ *
+ *  Copyright (c) 2009 Ulrich Hecht
+ *  Copyright (c) 2011 Alexander Graf
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licens=
es/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "qemu/qemu-print.h"
+
+void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    S390CPU *cpu =3D S390_CPU(cs);
+    CPUS390XState *env =3D &cpu->env;
+    int i;
+
+    if (env->cc_op > 3) {
+        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%15s\n",
+                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
+    } else {
+        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%02x\n",
+                     env->psw.mask, env->psw.addr, env->cc_op);
+    }
+
+    for (i =3D 0; i < 16; i++) {
+        qemu_fprintf(f, "R%02d=3D%016" PRIx64, i, env->regs[i]);
+        if ((i % 4) =3D=3D 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+
+    if (flags & CPU_DUMP_FPU) {
+        if (s390_has_feat(S390_FEAT_VECTOR)) {
+            for (i =3D 0; i < 32; i++) {
+                qemu_fprintf(f, "V%02d=3D%016" PRIx64 "%016" PRIx64 "%c",
+                             i, env->vregs[i][0], env->vregs[i][1],
+                             i % 2 ? '\n' : ' ');
+            }
+        } else {
+            for (i =3D 0; i < 16; i++) {
+                qemu_fprintf(f, "F%02d=3D%016" PRIx64 "%c",
+                             i, *get_freg(env, i),
+                             (i % 4) =3D=3D 3 ? '\n' : ' ');
+            }
+        }
+    }
+
+#ifndef CONFIG_USER_ONLY
+    for (i =3D 0; i < 16; i++) {
+        qemu_fprintf(f, "C%02d=3D%016" PRIx64, i, env->cregs[i]);
+        if ((i % 4) =3D=3D 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+#endif
+
+#ifdef DEBUG_INLINE_BRANCHES
+    for (i =3D 0; i < CC_OP_MAX; i++) {
+        qemu_fprintf(f, "  %15s =3D %10ld\t%10ld\n", cc_name(i),
+                     inline_branch_miss[i], inline_branch_hit[i]);
+    }
+#endif
+
+    qemu_fprintf(f, "\n");
+}
+
+const char *cc_name(enum cc_op cc_op)
+{
+    static const char * const cc_names[] =3D {
+        [CC_OP_CONST0]    =3D "CC_OP_CONST0",
+        [CC_OP_CONST1]    =3D "CC_OP_CONST1",
+        [CC_OP_CONST2]    =3D "CC_OP_CONST2",
+        [CC_OP_CONST3]    =3D "CC_OP_CONST3",
+        [CC_OP_DYNAMIC]   =3D "CC_OP_DYNAMIC",
+        [CC_OP_STATIC]    =3D "CC_OP_STATIC",
+        [CC_OP_NZ]        =3D "CC_OP_NZ",
+        [CC_OP_ADDU]      =3D "CC_OP_ADDU",
+        [CC_OP_SUBU]      =3D "CC_OP_SUBU",
+        [CC_OP_LTGT_32]   =3D "CC_OP_LTGT_32",
+        [CC_OP_LTGT_64]   =3D "CC_OP_LTGT_64",
+        [CC_OP_LTUGTU_32] =3D "CC_OP_LTUGTU_32",
+        [CC_OP_LTUGTU_64] =3D "CC_OP_LTUGTU_64",
+        [CC_OP_LTGT0_32]  =3D "CC_OP_LTGT0_32",
+        [CC_OP_LTGT0_64]  =3D "CC_OP_LTGT0_64",
+        [CC_OP_ADD_64]    =3D "CC_OP_ADD_64",
+        [CC_OP_SUB_64]    =3D "CC_OP_SUB_64",
+        [CC_OP_ABS_64]    =3D "CC_OP_ABS_64",
+        [CC_OP_NABS_64]   =3D "CC_OP_NABS_64",
+        [CC_OP_ADD_32]    =3D "CC_OP_ADD_32",
+        [CC_OP_SUB_32]    =3D "CC_OP_SUB_32",
+        [CC_OP_ABS_32]    =3D "CC_OP_ABS_32",
+        [CC_OP_NABS_32]   =3D "CC_OP_NABS_32",
+        [CC_OP_COMP_32]   =3D "CC_OP_COMP_32",
+        [CC_OP_COMP_64]   =3D "CC_OP_COMP_64",
+        [CC_OP_TM_32]     =3D "CC_OP_TM_32",
+        [CC_OP_TM_64]     =3D "CC_OP_TM_64",
+        [CC_OP_NZ_F32]    =3D "CC_OP_NZ_F32",
+        [CC_OP_NZ_F64]    =3D "CC_OP_NZ_F64",
+        [CC_OP_NZ_F128]   =3D "CC_OP_NZ_F128",
+        [CC_OP_ICM]       =3D "CC_OP_ICM",
+        [CC_OP_SLA_32]    =3D "CC_OP_SLA_32",
+        [CC_OP_SLA_64]    =3D "CC_OP_SLA_64",
+        [CC_OP_FLOGR]     =3D "CC_OP_FLOGR",
+        [CC_OP_LCBB]      =3D "CC_OP_LCBB",
+        [CC_OP_VC]        =3D "CC_OP_VC",
+        [CC_OP_MULS_32]   =3D "CC_OP_MULS_32",
+        [CC_OP_MULS_64]   =3D "CC_OP_MULS_64",
+    };
+
+    return cc_names[cc_op];
+}
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 2254873cef..41ccc83d11 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -23,7 +23,6 @@
 #include "s390x-internal.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
-#include "qemu/qemu-print.h"
 #include "hw/s390x/ioinst.h"
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
@@ -324,109 +323,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr,=
 hwaddr len)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-
-void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    S390CPU *cpu =3D S390_CPU(cs);
-    CPUS390XState *env =3D &cpu->env;
-    int i;
-
-    if (env->cc_op > 3) {
-        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%15s\n",
-                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
-    } else {
-        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%02x\n",
-                     env->psw.mask, env->psw.addr, env->cc_op);
-    }
-
-    for (i =3D 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=3D%016" PRIx64, i, env->regs[i]);
-        if ((i % 4) =3D=3D 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-
-    if (flags & CPU_DUMP_FPU) {
-        if (s390_has_feat(S390_FEAT_VECTOR)) {
-            for (i =3D 0; i < 32; i++) {
-                qemu_fprintf(f, "V%02d=3D%016" PRIx64 "%016" PRIx64 "%c",
-                             i, env->vregs[i][0], env->vregs[i][1],
-                             i % 2 ? '\n' : ' ');
-            }
-        } else {
-            for (i =3D 0; i < 16; i++) {
-                qemu_fprintf(f, "F%02d=3D%016" PRIx64 "%c",
-                             i, *get_freg(env, i),
-                             (i % 4) =3D=3D 3 ? '\n' : ' ');
-            }
-        }
-    }
-
-#ifndef CONFIG_USER_ONLY
-    for (i =3D 0; i < 16; i++) {
-        qemu_fprintf(f, "C%02d=3D%016" PRIx64, i, env->cregs[i]);
-        if ((i % 4) =3D=3D 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-#endif
-
-#ifdef DEBUG_INLINE_BRANCHES
-    for (i =3D 0; i < CC_OP_MAX; i++) {
-        qemu_fprintf(f, "  %15s =3D %10ld\t%10ld\n", cc_name(i),
-                     inline_branch_miss[i], inline_branch_hit[i]);
-    }
-#endif
-
-    qemu_fprintf(f, "\n");
-}
-
-const char *cc_name(enum cc_op cc_op)
-{
-    static const char * const cc_names[] =3D {
-        [CC_OP_CONST0]    =3D "CC_OP_CONST0",
-        [CC_OP_CONST1]    =3D "CC_OP_CONST1",
-        [CC_OP_CONST2]    =3D "CC_OP_CONST2",
-        [CC_OP_CONST3]    =3D "CC_OP_CONST3",
-        [CC_OP_DYNAMIC]   =3D "CC_OP_DYNAMIC",
-        [CC_OP_STATIC]    =3D "CC_OP_STATIC",
-        [CC_OP_NZ]        =3D "CC_OP_NZ",
-        [CC_OP_ADDU]      =3D "CC_OP_ADDU",
-        [CC_OP_SUBU]      =3D "CC_OP_SUBU",
-        [CC_OP_LTGT_32]   =3D "CC_OP_LTGT_32",
-        [CC_OP_LTGT_64]   =3D "CC_OP_LTGT_64",
-        [CC_OP_LTUGTU_32] =3D "CC_OP_LTUGTU_32",
-        [CC_OP_LTUGTU_64] =3D "CC_OP_LTUGTU_64",
-        [CC_OP_LTGT0_32]  =3D "CC_OP_LTGT0_32",
-        [CC_OP_LTGT0_64]  =3D "CC_OP_LTGT0_64",
-        [CC_OP_ADD_64]    =3D "CC_OP_ADD_64",
-        [CC_OP_SUB_64]    =3D "CC_OP_SUB_64",
-        [CC_OP_ABS_64]    =3D "CC_OP_ABS_64",
-        [CC_OP_NABS_64]   =3D "CC_OP_NABS_64",
-        [CC_OP_ADD_32]    =3D "CC_OP_ADD_32",
-        [CC_OP_SUB_32]    =3D "CC_OP_SUB_32",
-        [CC_OP_ABS_32]    =3D "CC_OP_ABS_32",
-        [CC_OP_NABS_32]   =3D "CC_OP_NABS_32",
-        [CC_OP_COMP_32]   =3D "CC_OP_COMP_32",
-        [CC_OP_COMP_64]   =3D "CC_OP_COMP_64",
-        [CC_OP_TM_32]     =3D "CC_OP_TM_32",
-        [CC_OP_TM_64]     =3D "CC_OP_TM_64",
-        [CC_OP_NZ_F32]    =3D "CC_OP_NZ_F32",
-        [CC_OP_NZ_F64]    =3D "CC_OP_NZ_F64",
-        [CC_OP_NZ_F128]   =3D "CC_OP_NZ_F128",
-        [CC_OP_ICM]       =3D "CC_OP_ICM",
-        [CC_OP_SLA_32]    =3D "CC_OP_SLA_32",
-        [CC_OP_SLA_64]    =3D "CC_OP_SLA_64",
-        [CC_OP_FLOGR]     =3D "CC_OP_FLOGR",
-        [CC_OP_LCBB]      =3D "CC_OP_LCBB",
-        [CC_OP_VC]        =3D "CC_OP_VC",
-        [CC_OP_MULS_32]   =3D "CC_OP_MULS_32",
-        [CC_OP_MULS_64]   =3D "CC_OP_MULS_64",
-    };
-
-    return cc_names[cc_op];
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index a73bae3dc5..6e1aa3b0cd 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -6,6 +6,7 @@ s390x_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'interrupt.c',
+  'cpu-dump.c',
 ))
=20
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
--=20
2.31.1


