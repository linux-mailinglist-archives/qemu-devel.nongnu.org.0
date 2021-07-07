Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC333BE6C9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:00:56 +0200 (CEST)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15IV-0000sE-AN
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CM-0003i7-O7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:34 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:29946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CJ-00025C-NA
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DIz6TbWWRPaxLW4oHLDqkOxuZAfxVokFyFEsACQoVY=;
 b=F4jd7xfCFuaGfa82crFx++Fkj8FDkaDqXlYpJdvbzviOfKHMEOQq1xc/ozkSSuUfoJznjo
 RocMBnmoj53HcTTTXcW+DV7mESbXZ+pjZp7vhCZznGfuhKHTXKOKc+0bsXDIdTdfImv2Rm
 udUwnCgEuvX1onavof9RFRYLwBTJrK8=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-fKQji3jaN-CN5rwRMl07Jg-1; Wed, 07 Jul 2021 12:54:29 +0200
X-MC-Unique: fKQji3jaN-CN5rwRMl07Jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTRz2iu/yLi+oz6GsAZCkXL3GR4Do98Ryrhi7wTpXBH+/1RYcioG2Aqqm9BZGmfBlKRV6/XrO//JCNW9VZ3/k/FmYUAyZbCpz1GH2FSW5RxrJT0gg+ElpKudHEnZ1U9hQKJqBrgenNNRjrJ85BdTE9Qr0GEi6+/pYlEkZA+qTqGUtN+dsrasn2GFHgd+nxU0JRrJCBqSQ7HeAz/vecRw+niCKRZdNEocsEzrc0eCCWo5KXR1JWcRMsjd949ogZMhIyuMwcbuodbu1cyu1F0R9l5+UyTVMQeR8In/G9Ypoj5nrrloJMrKGqOfHECcceSP/bdYF+O2E0e36EzvNYdR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJSMiCIozs8E0ZQLtq8tNf2yF9+4OwHSSbkIQ5Nj3FM=;
 b=iqClBRqXvS2baSVigiElc3gO7xsbaYLZqBsXdUyvoiUO/OywQiTOL50PvzdA7D4vtnIw2psCJ03ggQcEhHzN+FE598dTZ77R/F3apiUEMRbtju/+OgHrF304PuHR8kaMjmDjtEFYBUUZksI+yeOiHwRBlPk4iz1dS1UA4eltha9Vkc3/zhM2BRsw/yX2HV/YIwz0in497AUCVa6uTlz4pbouQ3I5UsUIHpgVK0rwiQ7ZaOa4wansonrJd+5/Hpup/SfLah0xxuvMFutgqfA9bqwptiP/u7nLehI/Ntr23z4meLs3LNMfw0vWpek1eOVb9RZ4ObHvgfS0YYfiZAJvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 10:54:27 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:27 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 09/14] target/s390x: split cpu-dump from helper.c
Date: Wed,  7 Jul 2021 18:53:19 +0800
Message-ID: <20210707105324.23400-10-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0089.apcprd04.prod.outlook.com
 (2603:1096:202:15::33) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0089.apcprd04.prod.outlook.com (2603:1096:202:15::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 7 Jul 2021 10:54:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df65fadb-a91b-4c8b-37e7-08d9413596df
X-MS-TrafficTypeDiagnostic: VI1PR04MB7007:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7007E154B1421B3FC6780735A01A9@VI1PR04MB7007.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2tpJNJ8ss8bU3keGOU82yYVloRMTkggCsquFpL+CgKN9SKQNY+vdKyxA24TYArjZlCORs8ENlfaZz/uMCoogvPkIIT4MAowPv5dO7n9ntFWxZeJIfb+QxU1Y4F9mWQ31+XQyR2pSPK2GXsuqWWS8yWyzGzG9siVQE82OqPYTF1trLeXvVqhcjCNjSmYAtSgvxQz3EstUH/vYE2K74xXip01I/px3qchCT+8WcJIVGBowtQS3pX0zvBShoN5NoQKtyF5lLFcgm2hp3CISJTgu3bQd4se2FiuxMwXtmkv2QpsOT8ZLOnO2rOrzxjgOt0jZ/GkTm+JVAJ3pB9WXZGL3XRy2l7c9Ggu5RA6Im16cnBX2ZYl2+CBAKJlA19y6S9zzs5O+qpMb10m2P9rfKYL9dgOBX9kPFLQFwi7WBCvO8J77ZhWoLQDCLcxyWePOGwQ+Z1yuSgc2iZ8cdDr6UjoaTz420/FZu/2edlPzg2FUrPT4XM9lcDaUNgAyZRl7GJW5x67O5na1FxsEjKL+SE3WQXKokYL+wWIoCCB6etKQjkw7U8D7gMrwW8Z7k1hv+pfi9japhCDoPyWH4MBrZFcGz0c7QsPiXxaW5fiXDhr6+AQI7JR5pKIygSqZz3y7PPCBwu+g7dMK46U/649CXWmAcpFvLfurB2UdAjUk0HmNzlnvURuiBOtFoUr+ttq5hsu5iYQl1SxOBf9Q9ZuniouUm3jGrZyC4Jrs9a4zI75PZA4ZbwjcRgaxz2lMC9X6K//xBbRVoHYvKUDCLHocy4zRefTEXdxLogF1jlUPgomk2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(30864003)(5660300002)(478600001)(2906002)(1076003)(36756003)(4326008)(316002)(86362001)(26005)(66946007)(6486002)(83380400001)(6666004)(38100700002)(2616005)(186003)(66556008)(956004)(8676002)(54906003)(8936002)(66476007)(6496006)(36456004)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?czKCAI/7pn4mviDYZAA4ljkau39lM2baYkgbOwCHrKhGlcm6iFeku6qrqs0U?=
 =?us-ascii?Q?6x+SbAIFVB+NvcntecSurpCzQVySUrtu1XXOTuFPoKWQTe+jxThB6hn+kGQM?=
 =?us-ascii?Q?fs6cEePt+gxlnsCoFtqoClLSry7TE9swp498+oLrVdNs8Bb1aoqf0E53d0eC?=
 =?us-ascii?Q?HfQzckd7G63bM2mVqHu9IuiiQkvdyL4iDGwXjBAHFKbAewCG//1ULODhAaLD?=
 =?us-ascii?Q?4VlzaPOzhUpgS9kmtn3nV5ySVV0FTFmyUxGugzf5xNlOUArBTe3YAxa4vOph?=
 =?us-ascii?Q?7zQeQ6vE9iGq1cnT50xv4F4WK/62nT6JU/cIaFdVojz9v+fcye//4XtkZrAl?=
 =?us-ascii?Q?AKFlwby0zTqs9yotjLXsUBZn811yzTd6j87YwVoqDnkDtlIgXKSBPaQeQkLv?=
 =?us-ascii?Q?ETCYRNWYzKIMeawVmUoJZ94WuniLi4uINR78e1NnxMpKmUoVSXCSDtWtAhJN?=
 =?us-ascii?Q?26dxg5Z81ybJYcZ2ej7rb66mXXgoDCJ94/16knteZ+shr5HUSqXnXI4QOoif?=
 =?us-ascii?Q?3GFTa551Yitkjo8HwCXtAhiexmjLQz2y3YPks1JuIF9WzX5rPnEVxOVitKNs?=
 =?us-ascii?Q?fnmhSagSSN+5evi0NfNNidjATMcYipZc/880S1PlRpWsSeCSjtWe99OLVx2b?=
 =?us-ascii?Q?zaleMl7BYTA6QlhK8HytjWNsAtiZi4ldNN+bOmfTQjc2nSEDLbKY+VM3JMhR?=
 =?us-ascii?Q?6mDl7QEPwkdsk55fX+4C0TrRWhumscZrrI41zspWZiA9mCEU8kVSA6g4HQ0t?=
 =?us-ascii?Q?8Fy8f/fA9/sOqDfktwh6bE1lHoBX7Xn37qLKpm3H+x+68vK2Al03YtHLLvbi?=
 =?us-ascii?Q?4eF4Z/Hdqbz+/LcgZmxVNyDphbL7XlnvfeqP6E1UVxq78X3UFS6K4kZ68UId?=
 =?us-ascii?Q?Tcd0xi4mXKKYuFyksXmxat3VTewa92xEFr07ulVn4vCEbut0LLQSG+Rpv97E?=
 =?us-ascii?Q?TXF9U8LhLzgtBOEjjfFHY+0e6jigVzvwd0PfWqxkk7hF76WPwm2W1Ge4ZIkw?=
 =?us-ascii?Q?iDGBguRomI9R9FQLzR/JOS5AdPfGc+mmE5/ISJpI9kp0YDx1pxqVwkSU6VeT?=
 =?us-ascii?Q?akAUTq/iWj4oZ1ixOVFqgU9/xSgTd591FXYYljejNubwsLaSOj5mjdS7ivPZ?=
 =?us-ascii?Q?qaf9W6znAUqV5ZyddyIAXGI+ZuBMUIa1DclXF9k+5HiCwI6pXDQXeifikkSc?=
 =?us-ascii?Q?cMsx4SJCCd6nEhzRTVZwjU6FqfxDYZlWFQ/Z6oRAcMo02n0yoe+UjfWGqEng?=
 =?us-ascii?Q?iM89AgEuO4hGpiAh8nBaQhmQoDod3uteSZ2RL8HBv+rywfm+QnKiVBRGIMLV?=
 =?us-ascii?Q?ne+VZznmLvbCsK68PqkYHney?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df65fadb-a91b-4c8b-37e7-08d9413596df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:27.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhIlbyfzWZM53XGr1N6epJPyyuSvjcfFvO/YV639+gv5QiJvMuN8qhXjq/d359jg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Splitting this functionality also allows us to make helper.c sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu-dump.c  | 134 ++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c       |  43 +++++++++++
 target/s390x/helper.c    | 151 ---------------------------------------
 target/s390x/meson.build |   1 +
 4 files changed, 178 insertions(+), 151 deletions(-)
 create mode 100644 target/s390x/cpu-dump.c

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
new file mode 100644
index 0000000000..0f5c062994
--- /dev/null
+++ b/target/s390x/cpu-dump.c
@@ -0,0 +1,134 @@
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
+#include "sysemu/tcg.h"
+
+void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    S390CPU *cpu =3D S390_CPU(cs);
+    CPUS390XState *env =3D &cpu->env;
+    int i;
+
+    qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64,
+                 s390_cpu_get_psw_mask(env), env->psw.addr);
+    if (!tcg_enabled()) {
+        qemu_fprintf(f, "\n");
+    } else if (env->cc_op > 3) {
+        qemu_fprintf(f, " cc %15s\n", cc_name(env->cc_op));
+    } else {
+        qemu_fprintf(f, " cc %02x\n", env->cc_op);
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
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 2b2b70e1c6..5c456f6014 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -34,10 +34,53 @@
 #include "hw/qdev-properties.h"
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
+#include "sysemu/tcg.h"
=20
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
=20
+void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
+{
+#ifndef CONFIG_USER_ONLY
+    uint64_t old_mask =3D env->psw.mask;
+#endif
+
+    env->psw.addr =3D addr;
+    env->psw.mask =3D mask;
+
+    /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait =
*/
+    if (!tcg_enabled()) {
+        return;
+    }
+    env->cc_op =3D (mask >> 44) & 3;
+
+#ifndef CONFIG_USER_ONLY
+    if ((old_mask ^ mask) & PSW_MASK_PER) {
+        s390_cpu_recompute_watchpoints(env_cpu(env));
+    }
+
+    if (mask & PSW_MASK_WAIT) {
+        s390_handle_wait(env_archcpu(env));
+    }
+#endif
+}
+
+uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
+{
+    uint64_t r =3D env->psw.mask;
+
+    if (tcg_enabled()) {
+        uint64_t cc =3D calc_cc(env, env->cc_op, env->cc_src,
+                              env->cc_dst, env->cc_vr);
+
+        assert(cc <=3D 3);
+        r &=3D ~PSW_MASK_CC;
+        r |=3D cc << 44;
+    }
+
+    return r;
+}
+
 static void s390_cpu_set_pc(CPUState *cs, vaddr value)
 {
     S390CPU *cpu =3D S390_CPU(cs);
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 8015c4e3d1..c72e990f4d 100644
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
@@ -289,153 +288,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr,=
 hwaddr len)
 /* For user-only, tcg is always enabled. */
 #define tcg_enabled() true
 #endif /* CONFIG_USER_ONLY */
-
-void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
-{
-#ifndef CONFIG_USER_ONLY
-    uint64_t old_mask =3D env->psw.mask;
-#endif
-
-    env->psw.addr =3D addr;
-    env->psw.mask =3D mask;
-
-    /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait =
*/
-    if (!tcg_enabled()) {
-        return;
-    }
-    env->cc_op =3D (mask >> 44) & 3;
-
-#ifndef CONFIG_USER_ONLY
-    if ((old_mask ^ mask) & PSW_MASK_PER) {
-        s390_cpu_recompute_watchpoints(env_cpu(env));
-    }
-
-    if (mask & PSW_MASK_WAIT) {
-        s390_handle_wait(env_archcpu(env));
-    }
-#endif
-}
-
-uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
-{
-    uint64_t r =3D env->psw.mask;
-
-    if (tcg_enabled()) {
-        uint64_t cc =3D calc_cc(env, env->cc_op, env->cc_src,
-                              env->cc_dst, env->cc_vr);
-
-        assert(cc <=3D 3);
-        r &=3D ~PSW_MASK_CC;
-        r |=3D cc << 44;
-    }
-
-    return r;
-}
-
-void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    S390CPU *cpu =3D S390_CPU(cs);
-    CPUS390XState *env =3D &cpu->env;
-    int i;
-
-    qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64,
-                 s390_cpu_get_psw_mask(env), env->psw.addr);
-    if (!tcg_enabled()) {
-        qemu_fprintf(f, "\n");
-    } else if (env->cc_op > 3) {
-        qemu_fprintf(f, " cc %15s\n", cc_name(env->cc_op));
-    } else {
-        qemu_fprintf(f, " cc %02x\n", env->cc_op);
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
2.32.0


