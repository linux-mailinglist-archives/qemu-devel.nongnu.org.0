Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075F33B7476
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:38:28 +0200 (CEST)
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEsc-00069D-S9
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbI-0001MZ-Sn
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:32 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:52455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbF-0003wX-KN
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7gCbWC/G4rkq5PFijvx4b5NEjxnBildx9EFN3LqVxg=;
 b=dA0Qhlcj1BqCIXQwlZAFY0ckybhOVDezZ/ATeOO8OxqAGERZ3rOAKFH4BVFU8s03a8Afjg
 LerHy2O/gj7tL4KryYZkwc9BO4W2xziajeNAi0SGjTzLR4St7Y+p3Uv6D38XYHOfSwPGoE
 x10lZ3ntBfgQO/3tju8foQqeCXY1nKI=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-CGADlNtMNKSIqYI_H5urPQ-1; Tue, 29 Jun 2021 16:20:27 +0200
X-MC-Unique: CGADlNtMNKSIqYI_H5urPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5l38/gkMlsFLyVppiIz56qrk/1NQ+h867dbVctHTvEYnEwBcf34xE67RwE9Ia8ducpIb/tpW2AxFxNEcLAUfW4cbPcIs8SadLL1U7N5i9Phz3ictRVZCkNWZsdNHh20Tez1ADYwO1ykxO+rl5mYoSb3sOQOJMyL2cJDqS1ogf5oQ7JQNDZ00siZL4eluljnK3ZeaWJX+rHdTcNfFOm0kIEyJKyB2P0d/fbzLRWwp1u0I9HsCHHIZEyPZFp2PyhJ+PvioOIlKEoKnmCjRj5n2tuXGuCu6MOqlJ/FE+2XEVB2YkivfBar6aPK7tAUu6b8xwzJ1hIGK9qiPzJpdmAqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygyZk9s/bsDHEAyF0F87a2qt2naSeG7hozDxrMDA+Ew=;
 b=BC4wQ3Y6o74CpL7xdrimME5aaUnTkx/NW9MDjSYrDLYG/SAwbID9rodFFNzJWKBwXJYNdUGqjCAbPI0/UjsOXg6fSCyvWdeYcRunch8LVehDeIjLuz9B7YJ6inpLgqrNX/S8gofSwNWYqk+J+HigyoiSCC8NDaI8P5UGtX/wz8ZO8e0kEHqNLi2XrOBXXqZBkNJAM1Y6P4K/T0/1ym47aBDrnz0YM3K8039YJU9lRIoDbAF+5/v4pLbHn582o5aojK+c2GhME7HG2Pz8KBfiOkVRilAJ0FQh2sHwBA9MOBjN/j8Zfeki+wRjJqPsthS+C5sXxybzmAOPRWnlOITJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0402MB3327.eurprd04.prod.outlook.com
 (2603:10a6:803:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Tue, 29 Jun
 2021 14:20:25 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:25 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
Date: Tue, 29 Jun 2021 22:19:26 +0800
Message-ID: <20210629141931.4489-9-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HK0PR03CA0115.apcprd03.prod.outlook.com (2603:1096:203:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 14:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ff200c9-f19d-4bc7-907b-08d93b0909e8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB33278E4F378D1BB6CD73E577A0029@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnPd09IW9EGztJMcrD8hPXYylv+IIle/L725fCaOxVqF3Bcz+O1ngrjeUhklN0VPESK3OyK+ShsU1mlPoYXBMH8AqhxENZJtYLAWoOOODz2zMNwXAQy6WWZddkP6+vLMvsItuqtZrLxN7/MHJE+nLHkhT0y1kG7FZXsdN9+eIi6wb3nKPfVMxTTTUFvNZLSrUV+f3JncgbRGCAOGZsSKJNwzM14FQCZyUdBlP9Kz28/x+BbtVHjERwU4MKpyMQCHc2J3WDc6b8lKIXpLCNtf3UrM5Ynmzt8pZFMYSBW+ujlBXcHRcRYWgXuZtRqmgxEndYGOcn+k2OXm6hcPb5on4BpRHbDFv6fhAos7KhHRO86+Y1wFg0BtN73SObqOCVijR7GCAz2U91TYrmRNpQbtF4dF4BdsxLx+6TELtw9yFWg0JR+8/ED33pwKrCSHwCRbI+JcX/sCqNChxgJYpUAU/eSD322m576OHHeR4Z6z0Y7Q/ogvNsc9FJ7QEvSERQVaeOHgBHcPorgqIfCD9qZI9DxTCUs2Jz3AGNGTI2O+ND57FSAVDIduCefNVCGuI8Zo/OE1r55tZfSy7xg19mu1w643+qd55h4WQFaiLmEDn49FnthEadhANFe7ASJXbjVH18h5a+t7Ac41vcFECnoL4TB/MbVFZ20EPNyogZpCQuY70ya/POySjLRVaCrvpzjDW+evd4/iPwAurw9S2I+H21eEG5C5fSscS3yQdMIXkF/ibkxqhAT13IOFvheRbFgEhDYr9voawwzoVjSJtHQiQGhAWggBA+jmJqBKI/ZXgT2Ni7whyq78VkdRDbBBHIyCBCwftIKS1WAgqts30CzVZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(136003)(376002)(346002)(83380400001)(8676002)(6496006)(16526019)(8936002)(186003)(86362001)(2906002)(478600001)(36756003)(4326008)(956004)(2616005)(66476007)(26005)(316002)(38100700002)(5660300002)(66946007)(66556008)(1076003)(6486002)(54906003)(36456004)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AfpG7gByD5BleTl3kkHu3pRi7yXsrxzARbBql2KPdc0MExoG9jLiC/rUHvm8?=
 =?us-ascii?Q?Qo6vAdkVnjFyuJjLwkP2hKX8T0AxhKNy8Dj2khyxtokzEAg9QIjh9978DRqd?=
 =?us-ascii?Q?9ujt5cgVftB6ckkQnbb+fGdmvRt8/0mfFQyd9XxCAR/KxFgMiM7I2B26fXOy?=
 =?us-ascii?Q?/fRLyitEhD886tY+eNEeki5auyglBRDjcSTYDno804g3jYVpuMm6+xlCjYZU?=
 =?us-ascii?Q?IlA7LlsU5TliWad7S/Vcdwfss4KRgSI+QbDARmrUUhp+wxIO3b35pg2O4nn6?=
 =?us-ascii?Q?OH8lfQJRKhRVLZYQRLecARRZHuvoUexg8DXYugN4Do2p+QCI80pqp05j9PG4?=
 =?us-ascii?Q?qFzwzuR3RoX3ej1FSwj+VTuuM4q2KQyLwxho2ICUx/tmnsp1wLJ6uF+IZBQi?=
 =?us-ascii?Q?bYFOnUxov6i2AnAD3aKLGmSwpng+S9M60IRsX/dnZvJyd0BPwYLeKSWAiPj9?=
 =?us-ascii?Q?Xo91YXrPhWxwUetYYqNSGfbT49cOcpHWfRTjLv4IsuNU9f1TtDKBfRHANJN7?=
 =?us-ascii?Q?pxPOM23MI/5AYcb3u1U68r/b4NDopY71O8LJUfoVub0MQoVXQpa9HQjlzf3+?=
 =?us-ascii?Q?h960SyVZT3o97k1o4HwCBGsGT7HJyisEf6Gyij/PHwf7LK72T3UTMH0QSOTD?=
 =?us-ascii?Q?HTtdBfU8Td0IsGh1D2bVcL/bBzod6Wd0ka31PR0siItDo4vcu2rZC8Nu5O4s?=
 =?us-ascii?Q?1gbQvVra23Y2xUDyih2DsMffa6uuFWFAmSJlRdkGU/uaAjJ0rNOa0biEQJ0X?=
 =?us-ascii?Q?MgBjbuxZAkv5hJJeLD6dETvxVDyRqYQSyTUD8xvWiHHvFe5wkmyFxcIpEN5O?=
 =?us-ascii?Q?tVonEAZhEHLwrSDV4oYCz/IsDpTClC3l1/fg3krhNuQ5oZ0ZUlvXC5ZI0fP6?=
 =?us-ascii?Q?Y20LSKk8poWOfRZj9GMTy6PkTkz9r1nL9A6Ldv7lfNH4elK0tRThvRutDv8h?=
 =?us-ascii?Q?U2PleHmpFFav0S8NYUnMuCR2WvAG9hUwbd3PIdNkjByzWoRfJC0v8PUSmceM?=
 =?us-ascii?Q?hG/jIDb5FWq83mBJ9RyCZ3xzsIuzcQDVhU17v4uTCgCcDsgtePBa/R0MYHda?=
 =?us-ascii?Q?yqa1AcPOEnZE3b961aCvMXrxLrHOCuIft5YlTsrhRp/Yj0d8IlSrwr0XvCgb?=
 =?us-ascii?Q?1I2Ppw+CmuOP5SYVVaWhl1we0QpT+64TEAQoz9Qannbtg/1a7jWNdyt8zrmD?=
 =?us-ascii?Q?wUkdGT4zm+CWzWZ9IIHBWdLrCNFML5T7l09yJBAwFuErcH4nPurZAF3bXKqM?=
 =?us-ascii?Q?jX8/DJ3AKW5/HoUA8sjX3/7IszZOIvz4iYrR+Fu7CsDkYqfUBJJrVmppCjnK?=
 =?us-ascii?Q?pXoYV9M1Z+2x7Hp6PsAwwk9X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff200c9-f19d-4bc7-907b-08d93b0909e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:25.8175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K83B6VdreW+cYXjwGjji2Arw5vtMxzbVotfxL+9JGQcUpW6swF1aqisYg6o1Etzs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Splitting this functionality also allows us to make helper.c sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu-dump.c  | 176 +++++++++++++++++++++++++++++++++++++++
 target/s390x/helper.c    | 151 ---------------------------------
 target/s390x/meson.build |   1 +
 3 files changed, 177 insertions(+), 151 deletions(-)
 create mode 100644 target/s390x/cpu-dump.c

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
new file mode 100644
index 0000000000..6f559c1913
--- /dev/null
+++ b/target/s390x/cpu-dump.c
@@ -0,0 +1,176 @@
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


