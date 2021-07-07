Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C33BE6B9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:55:57 +0200 (CEST)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Dg-0005TD-MG
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CB-00035t-1Q
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:23 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:36634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15C7-00024G-8r
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SbVIxek4fceoZqTHgUodDxn8ZwV4Jiu/T017ERTPG4=;
 b=WAJYSKd/RMVmVojm2BcLV9bpWeilVsQ2PUQTLnUvKVc900dvDnCwWPu+UNPyQFriORw5c5
 cLJTIIB4U/JlnvckDbOpPN6s84GhooxoQjZ2ftjJ4P6XnDjVlbGAQE0MYvux5UXkgQ/lqa
 rX3BWAmoT1a9TOlX+RukBmY+m0ZDWq8=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-o7u9G-dwMDmFadWdDFCZQA-1;
 Wed, 07 Jul 2021 12:54:16 +0200
X-MC-Unique: o7u9G-dwMDmFadWdDFCZQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP4MKHWNP52VpVHtj/pH52xTwvVrlYbAr9mrQ3xKvy0wVg7xe2twOReIQvcCYswiZQ+8jy13ekbspjIqwlrrgFRB/39zBOFT/B6ziCsPXCMVSyKWbMbfMo95JkM9ZSyVKKQSjfYFG/BNET4xNqmRftJJ8tB8vA8ouHREqSsJPaHRwetrEaoXI4wrcgL/nWclYTPc05BCO0EbzfbNGGf2h1jzXm+F7PxQ4Qe/Nbl6oXR5MHwURUwBXxLwO1MvEw2GMOD99FIPUr2AvR8zky1TD0NOgXH2EWPFihLlckugrBs0lourXKcjNegOtYbQz2DecvmZIhhabCsD3HGsT2SWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tucG1b6V/YiUPDKt1ZPg5VGdBoa6whakSarywy6j6lo=;
 b=OjhIDpKLITu4f8D6jktp0bax/yUrlJsktN2Sl7P+lmiLjXedQv//us47rLjvtMxA69aejIU+8U1uYkcemxnsB65fGVyIa+ChKTVo8vjpAlER3sxhSKDyCgX29RxdqIGQ6gP+AedJnE6fvjMoGFMil1egt5MfSOpwGAKIuwVAbch3WbQUdw2LxmWt84zstbhbwtaflqfwJL/Fd7fHU8zmV8n3BWD9eUJWGbYGQONCAD9k+TbsgwcX/RZQrsuJ+VaEZeLUsnGJh4yGECz50NQkLOn2sQn5a/sA7JkQcaoWwh1+uPkFfYiq5GqfBFL6U5HBRpzygYxLcn0rlFP9/pWUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:54:15 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:15 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 07/14] target/s390x: start moving TCG-only code to tcg/
Date: Wed,  7 Jul 2021 18:53:17 +0800
Message-ID: <20210707105324.23400-8-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0075.apcprd04.prod.outlook.com (2603:1096:202:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 10:54:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1808b007-8b45-43f0-095f-08d941358fe8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2238F703E9AC6443CAE8C6E5A01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APJ8xry0c/Adf9gT+3Ae0gO5fGebsPk32EIJg4RJym2OHx84s4/59rVfylebBEhxSVgq0WZY/ZvyRd1GkCuAXl1fQhPVqLZFMJjhJLLwMv0481ZU16DtSysnwfWZE8G9sHF8UpelCZ+piElWrYCgawD+y89UhhFl2+PslxrwSe8n/azZW7BtNkeTdDbGK4Agk59kl9087XOwei/rBjGcEHLF8VG9HUx256GzL2404rhuuGo6aTbw9NIa9SPQ8qABfQTe7KPpS/WXm2GM09cHmNMY2f9VjdSJUj837reVkmdkmd3EpwVShpsSewfxH8btX5riROOkFqaVGa2bgkMj3yqctWnG74qfDNUTqQTSUryIsxxs6VARZbyV5UN52/CX0cjFmMqIMy6m3QI7LxiVoXW+ftu2HM8EeEPjQGSWaB8s8Rv4U0Dewyn+4tquzZn6kLMGMI7rWtIoxKu3st5JHDSWWBYi+nUP6SclH64OBm/bKxUL3vUrv72E+GGvScwKO27YJOIjLVzxd+N/uPli03ZIDVGrYYNZs0D7HLn7Xhacr/sSdHmXWc7jvx6ETDyralHziFG8TYdkidLUD5qr+yaOiai8YATE7Yw19tOVh1uyL8hpUpNpb++cPILwWQQgLP9bf5+XGYHOCO2Qb6DTKiXTB8XCnOqSwspO3oBcukfTbGW1VV/ce516ONctqZGSwBthGho76bvhb5BvhCUXgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j05OktT+T7jqo/x60pQnTdqRVC+M7GeETS0EM7B8S9ctzndMJhvRLMJB2+3C?=
 =?us-ascii?Q?osnZ0EC1fciX9C50QaGu4DSnkkaSpTXEGOL1gBmfVmjTdgwRgwE1YYYhRLV/?=
 =?us-ascii?Q?6OTxN6q7oZbKo8GTA6zriWywJppUx3LHneOphGW5vW9QPxIfbF0wEeNoIiDc?=
 =?us-ascii?Q?rb9gHfTb93FfNv/1y7xHQrJdwMkFyu3m0Yv+tHnNnG7SpHNp5gKWBwi9lGG6?=
 =?us-ascii?Q?NMsGQ3GWC3AUoySj/nKvAv9hza+a0R0Jij8cMbE+BfIge4Inb+B/WhWzQDUM?=
 =?us-ascii?Q?piRY8HsM+qk3pBlMtyHGdLEmWj7R+7n/VhPPgJDN1SclzNdl8rt3Bqiw6FCF?=
 =?us-ascii?Q?YVz126YtbvXC5VaAJnT7+8CNR1OKCO5GYOX0kGkBq9fhN44XrEn9tK03hgmC?=
 =?us-ascii?Q?kIxCw21tzbHaBsNaJZphaLXDPweL/YE5HbrzKi3aqNfzX0CyVKkS7pAMdGCE?=
 =?us-ascii?Q?jV7OsNL6CZN5Lh6E2i2qPodrzvQy1p/o6G5s8ojdlqlqDeNuEyBSWMhjrFZ0?=
 =?us-ascii?Q?IAsu2sRxAHRPPNCb8Kf9iSwGT911gPDL1TVn1jB7V0hS2VVbPKAeLjM/sQ1M?=
 =?us-ascii?Q?C3uvRHyd7ySiHGG/KxGTaMmt6k/3ojeHcuiCd/BheOajGyXkIfERcDk8AIKr?=
 =?us-ascii?Q?a6UWHFbPxskM7u/9ZeqWECP3uydADxiJ6g6/s2CqgtNn6WOsXWK9tPXttPBU?=
 =?us-ascii?Q?nJIo+ZHTBy/xa3QnHKEVH+zoX/HFMMwa7i4Z4dhESGMc/BFtOzTGA8kOdfGB?=
 =?us-ascii?Q?XVOo47QZ31JStiJyFDVinYwwCrYs4uQA/JETwy9ZZEwEiPFfYWo7RXexpmxr?=
 =?us-ascii?Q?25C5QH02PEN+EnYAgEYSQGY6ygCenI4oLg05IWohWYRvesV6xZyxqSYyzSum?=
 =?us-ascii?Q?4Dx6NXdm6/an4Pn2HdkHXWPLw+fvBIxhRRDGn/AaO3CjUxjtv1vgyV7S70j3?=
 =?us-ascii?Q?9wUTIHZrYC5QmYza0nqpAtF8Krk90C5QpYO1wCju6tux/eWP5fd8pteub19O?=
 =?us-ascii?Q?6qLVi8FcEIkp5UgNyqvdI+1RVZZouZVri5CN1g8Zc9jzJ4MpdJkyvoe5u3/R?=
 =?us-ascii?Q?2vPWJ47FgFwh2yFvvG4DPB4CyBc1zplqTLt5q9i8yrLL/zKQuYmm8fpIkqgs?=
 =?us-ascii?Q?7qt3sFhZnVSfXzZtzSZqpMNmWSNFh/Lr6+5YHAM8utSnZwmkKg9SmtG4nWxE?=
 =?us-ascii?Q?MojkL9k1ZHs8gP5LUFZArGf0SSGxcB/EXdmT/pzcCBg6LQgFtiZ/mjDIvMQ6?=
 =?us-ascii?Q?c4x8PRpU+60bni4tLEo0c2f48oy0ExUTXp8UwaoewA/jVAdtQNMrEGnN7+X4?=
 =?us-ascii?Q?h9HNbLPNAVbfjDthAsdbLwe2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1808b007-8b45-43f0-095f-08d941358fe8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:15.4145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JIZ/pfxn3UpIcbiRV+mSJMKQiA4KAdRh+0rUSGWhP+Us+VXQJ3JlGaq62W54Cxs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
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

move everything related to translate, as well as HELPER code in tcg/

mmu_helper.c stays put for now, as it contains both TCG and KVM code.

After the reshuffling, update MAINTAINERS accordingly.
Make use of the new directory:

target/s390x/tcg/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS                                |  1 +
 hw/s390x/tod-tcg.c                         |  2 +-
 include/hw/s390x/tod.h                     |  2 +-
 target/s390x/interrupt.c                   |  2 +-
 target/s390x/machine.c                     |  2 +-
 target/s390x/meson.build                   | 17 ++---------------
 target/s390x/{ =3D> tcg}/cc_helper.c         |  0
 target/s390x/{ =3D> tcg}/crypto_helper.c     |  0
 target/s390x/{ =3D> tcg}/excp_helper.c       |  0
 target/s390x/{ =3D> tcg}/fpu_helper.c        |  0
 target/s390x/{ =3D> tcg}/insn-data.def       |  0
 target/s390x/{ =3D> tcg}/insn-format.def     |  0
 target/s390x/{ =3D> tcg}/int_helper.c        |  0
 target/s390x/{ =3D> tcg}/mem_helper.c        |  0
 target/s390x/tcg/meson.build               | 14 ++++++++++++++
 target/s390x/{ =3D> tcg}/misc_helper.c       |  0
 target/s390x/{ =3D> tcg}/s390-tod.h          |  0
 target/s390x/{ =3D> tcg}/tcg_s390x.h         |  0
 target/s390x/{ =3D> tcg}/translate.c         |  0
 target/s390x/{ =3D> tcg}/translate_vx.c.inc  |  0
 target/s390x/{ =3D> tcg}/vec.h               |  0
 target/s390x/{ =3D> tcg}/vec_fpu_helper.c    |  0
 target/s390x/{ =3D> tcg}/vec_helper.c        |  0
 target/s390x/{ =3D> tcg}/vec_int_helper.c    |  0
 target/s390x/{ =3D> tcg}/vec_string_helper.c |  0
 25 files changed, 21 insertions(+), 19 deletions(-)
 rename target/s390x/{ =3D> tcg}/cc_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/crypto_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/excp_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/fpu_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/insn-data.def (100%)
 rename target/s390x/{ =3D> tcg}/insn-format.def (100%)
 rename target/s390x/{ =3D> tcg}/int_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/mem_helper.c (100%)
 create mode 100644 target/s390x/tcg/meson.build
 rename target/s390x/{ =3D> tcg}/misc_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/s390-tod.h (100%)
 rename target/s390x/{ =3D> tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ =3D> tcg}/translate.c (100%)
 rename target/s390x/{ =3D> tcg}/translate_vx.c.inc (100%)
 rename target/s390x/{ =3D> tcg}/vec.h (100%)
 rename target/s390x/{ =3D> tcg}/vec_fpu_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/vec_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/vec_string_helper.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e12e..8ec845f4e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -297,6 +297,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
 F: target/s390x/
+F: target/s390x/tcg
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
index aa44deb809..9bb94ff72b 100644
--- a/hw/s390x/tod-tcg.c
+++ b/hw/s390x/tod-tcg.c
@@ -16,7 +16,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "cpu.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
=20
 static void qemu_s390_tod_get(const S390TODState *td, S390TOD *tod,
                               Error **errp)
diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
index ff3195a4bf..0935e85089 100644
--- a/include/hw/s390x/tod.h
+++ b/include/hw/s390x/tod.h
@@ -12,7 +12,7 @@
 #define HW_S390_TOD_H
=20
 #include "hw/qdev-core.h"
-#include "target/s390x/s390-tod.h"
+#include "tcg/s390-tod.h"
 #include "qom/object.h"
=20
 typedef struct S390TOD {
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 3fde18ba46..734f0c62de 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -15,7 +15,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "hw/s390x/ioinst.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/s390_flic.h"
 #endif
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 4f11f6ac6e..81a8a7ff99 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -19,7 +19,7 @@
 #include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "migration/vmstate.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
=20
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index a5e1ded93f..60d7f1b908 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,21 +8,6 @@ s390x_ss.add(files(
   'interrupt.c',
 ))
=20
-s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cc_helper.c',
-  'crypto_helper.c',
-  'excp_helper.c',
-  'fpu_helper.c',
-  'int_helper.c',
-  'mem_helper.c',
-  'misc_helper.c',
-  'translate.c',
-  'vec_fpu_helper.c',
-  'vec_helper.c',
-  'vec_int_helper.c',
-  'vec_string_helper.c',
-))
-
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
=20
 gen_features =3D executable('gen-features', 'gen-features.c', native: true=
,
@@ -60,6 +45,8 @@ endif
=20
 s390x_user_ss =3D ss.source_set()
=20
+subdir('tcg')
+
 target_arch +=3D {'s390x': s390x_ss}
 target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
 target_user_arch +=3D {'s390x': s390x_user_ss}
diff --git a/target/s390x/cc_helper.c b/target/s390x/tcg/cc_helper.c
similarity index 100%
rename from target/s390x/cc_helper.c
rename to target/s390x/tcg/cc_helper.c
diff --git a/target/s390x/crypto_helper.c b/target/s390x/tcg/crypto_helper.=
c
similarity index 100%
rename from target/s390x/crypto_helper.c
rename to target/s390x/tcg/crypto_helper.c
diff --git a/target/s390x/excp_helper.c b/target/s390x/tcg/excp_helper.c
similarity index 100%
rename from target/s390x/excp_helper.c
rename to target/s390x/tcg/excp_helper.c
diff --git a/target/s390x/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
similarity index 100%
rename from target/s390x/fpu_helper.c
rename to target/s390x/tcg/fpu_helper.c
diff --git a/target/s390x/insn-data.def b/target/s390x/tcg/insn-data.def
similarity index 100%
rename from target/s390x/insn-data.def
rename to target/s390x/tcg/insn-data.def
diff --git a/target/s390x/insn-format.def b/target/s390x/tcg/insn-format.de=
f
similarity index 100%
rename from target/s390x/insn-format.def
rename to target/s390x/tcg/insn-format.def
diff --git a/target/s390x/int_helper.c b/target/s390x/tcg/int_helper.c
similarity index 100%
rename from target/s390x/int_helper.c
rename to target/s390x/tcg/int_helper.c
diff --git a/target/s390x/mem_helper.c b/target/s390x/tcg/mem_helper.c
similarity index 100%
rename from target/s390x/mem_helper.c
rename to target/s390x/tcg/mem_helper.c
diff --git a/target/s390x/tcg/meson.build b/target/s390x/tcg/meson.build
new file mode 100644
index 0000000000..ee4e8fec77
--- /dev/null
+++ b/target/s390x/tcg/meson.build
@@ -0,0 +1,14 @@
+s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cc_helper.c',
+  'crypto_helper.c',
+  'excp_helper.c',
+  'fpu_helper.c',
+  'int_helper.c',
+  'mem_helper.c',
+  'misc_helper.c',
+  'translate.c',
+  'vec_fpu_helper.c',
+  'vec_helper.c',
+  'vec_int_helper.c',
+  'vec_string_helper.c',
+))
diff --git a/target/s390x/misc_helper.c b/target/s390x/tcg/misc_helper.c
similarity index 100%
rename from target/s390x/misc_helper.c
rename to target/s390x/tcg/misc_helper.c
diff --git a/target/s390x/s390-tod.h b/target/s390x/tcg/s390-tod.h
similarity index 100%
rename from target/s390x/s390-tod.h
rename to target/s390x/tcg/s390-tod.h
diff --git a/target/s390x/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
similarity index 100%
rename from target/s390x/tcg_s390x.h
rename to target/s390x/tcg/tcg_s390x.h
diff --git a/target/s390x/translate.c b/target/s390x/tcg/translate.c
similarity index 100%
rename from target/s390x/translate.c
rename to target/s390x/tcg/translate.c
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/tcg/translate_v=
x.c.inc
similarity index 100%
rename from target/s390x/translate_vx.c.inc
rename to target/s390x/tcg/translate_vx.c.inc
diff --git a/target/s390x/vec.h b/target/s390x/tcg/vec.h
similarity index 100%
rename from target/s390x/vec.h
rename to target/s390x/tcg/vec.h
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helpe=
r.c
similarity index 100%
rename from target/s390x/vec_fpu_helper.c
rename to target/s390x/tcg/vec_fpu_helper.c
diff --git a/target/s390x/vec_helper.c b/target/s390x/tcg/vec_helper.c
similarity index 100%
rename from target/s390x/vec_helper.c
rename to target/s390x/tcg/vec_helper.c
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/tcg/vec_int_helpe=
r.c
similarity index 100%
rename from target/s390x/vec_int_helper.c
rename to target/s390x/tcg/vec_int_helper.c
diff --git a/target/s390x/vec_string_helper.c b/target/s390x/tcg/vec_string=
_helper.c
similarity index 100%
rename from target/s390x/vec_string_helper.c
rename to target/s390x/tcg/vec_string_helper.c
--=20
2.32.0


