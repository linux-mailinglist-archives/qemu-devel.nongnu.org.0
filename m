Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C03BE6C5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:59:51 +0200 (CEST)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15HS-0007TX-9R
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15C5-000358-Kg
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:19 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:55602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15C1-00023r-SV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=no947DBn8p4yPD4+fqFnbmn6LSWqScWohAZ7TJAQ5kE=;
 b=k94JoPsepCeOIf+a5IR83ZzaAa8I5R5Y+moWJuJ8kSHahs9gnA26Qg7BR1bz0q/A3gySrV
 YuOqX4NupSFOaWFGrnFWXew4WabhTNLm8QMLxW5148ydWHuaA6SfdY3noX3pC/erHB4XJ3
 PXyQTBakGoa6ZS/nJWm1w9irAbB35ZI=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-ETJMECMCNuiOoa-b2zh6FA-1; Wed, 07 Jul 2021 12:54:11 +0200
X-MC-Unique: ETJMECMCNuiOoa-b2zh6FA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgiPI5Id8WtPysOM7v8o4I6+e9FaWqTRbSoc0DCubl6YiWyF8QiXTDptMco07raSLZJM92ep5C1kotLO/5DUBq7deiaEjvqcagwehOdjiZdRijUfuXbeFzyAlxFr4h3fSpKArN11SAIhwHK4T6f2IC+r3MrCUgsYgevE89CGbYkP/m2PgCxJizbDPH+t7Yucd+6PWp4SHrIIBuKM2iLDszjFKkU8oJa1A5KkuyFimyrMFTqd8j9Hp1AxfAhekb8Gh4D6W2MTaXL2tA5a2ELa2u2dHhHmGdoOKTKo5Kw0x+Tc0IF4RtiV/0D5g0YDhoTWqN4siuk85CblmKszZpi2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlfF81wvABkEcguYFE/v/8HzQcqNX0RONdyXV8fEgP8=;
 b=Y3/1wxJzQjZ1qXsyyRZs6T42dbBN4v5GST4TURmAqPo3NFiWjbk6y+i0/hGJDeDI96zzZ0s6RvSmns+SOhuUCOr7oopSrwkZU8xsIMGWYyZGIQhvnQvMReImBTDPhIfuWvUWlNyvK4f1OBDC15zZSpUgZCfTWgSwgJxlGW2hYkdbWRmLcY195z5oQBtYueXmQCHPIHD9KaZR3jninZ5hyA4A8Jl4wQtT1iJC+cThzQfVrdZGADfv2A5ozhCCvqI0ZCj9QqDTXByZDFE7grlH2c9V+NUhcq79v/oNVgJHPrrPPhjp65hqQYfp8fVtQ0uSdRfx1Erfj1rn0vWN+LyJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:54:09 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:09 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 06/14] target/s390x: rename internal.h to s390x-internal.h
Date: Wed,  7 Jul 2021 18:53:16 +0800
Message-ID: <20210707105324.23400-7-acho@suse.com>
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
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 10:54:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 395ac9cb-9c4e-48ce-bf39-08d941358c5b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB223801B8707D1D01C78A1BD8A01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdXwr22FXZ2OScuyl0fjY6VfzzETs9CqyuYOusiBu+OubheE9BIZj90wTNCSx0UvstsdyvapngY08TBJWUflSuSLeo/Rutbt6whhUmrc1Yd9rXIroXec16uzfuwbHIowYkIwuu1k58UoOSfRPhBOJlqF/yziY8c6CdBr+a8ajmGmxJmayFDPLssOBq+KuQDEUzEsv14pt0mW5cUQTkM5sSchUj19KAxEEcHtaP9/GDmOVj0ENxYGNsi4VWHz8sZL8HfyqQqey/LsukQ6xvPqhvgNURBW9Mrls6l3/XDiHEQVpn4z1jEBEXwnuP5TiNCke0B0G/n+VW8CHzKUKdwnuibVWlvSK6DRndX3Fluquoen1t7NL+viFVVwNBnrlR/WMVIQ1VshHy9bdMOFkGmviecTZPUYc1ZyMQTGKh1G8/KQW2XlrFA7uRfl8FWXpC7KCkfIMjSWySzDvqd1wVl/LMIAGUoTnSWKyifyJz/6u5nydRBg7jQoI+7lmV64yNZYNa7AyaDRMsKlVy9d8VXLZG9hhNVbpM8wFwl4Lfat7tY+8ysh3rWP4xaE/9zldGSqay8gNH52t4NerltYR1NnpstCBpjNxKQs87EGKvPpwDMBQmLZPoeBwyGfxSBoy7f6V1xXilQ3IuIF1NlOqCeMWYbafK4EfVIXPgST3SNZcI/xLVIwYy9c2JCdhig9C74gy5tDcdkndPFXJtYFvq4kyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4VJ+SRJ/HCGp3JQWaMe1O6HE4hnGTW7LMMBIFut51Ri0bGgyD1CAIkLBisUW?=
 =?us-ascii?Q?s2rjQv/kfg0Za8PkByzkq1HxbvnmtcWRdK93kEbziICXSqGpq8ZdhcDxlZ61?=
 =?us-ascii?Q?FBYBPdwtZ4A4MAEyFBpBAJbg2aMFCd/FBnYUZQBqpzZd6Y8/DFG3N9AzzIM6?=
 =?us-ascii?Q?46+gVOI3KWt86YD5HtUwgfOV8jtN1w/Pxc3AgwWEL2ctDBHg/7G4nI6fUrCN?=
 =?us-ascii?Q?p8gaa+hCfzWRZ5otST0BE9ISXNXUW3hp7BKfh/AeBsYn1KZX3D6vM6QfcGX0?=
 =?us-ascii?Q?Ilg4hrNdb6xgQ8fcJnRd9hIn/GgRYZa8kPePd4XG8ST5XpTvIcPqIAgD/NnD?=
 =?us-ascii?Q?NEotvULwQxsa22bFtEtJQ0VPg+pG24HK+g3WDGrkDnLCDm7JwIarrndzRQcX?=
 =?us-ascii?Q?9XaM/Nk9SwfssRCiolQdjeWQ6hGv+4BUyEWyu+BwaEL1cuTn82orPKN0yxD5?=
 =?us-ascii?Q?qtp2pfpNGSl+yOhu64EMUxHocFBuTuhJ58p6YyO23v0nK7wTG3cD9rlDDWmI?=
 =?us-ascii?Q?NB/fs76hxeTkLFcXTGbgJCAFv4pIehD99yMy5A2yzs9v+Xx64IdHnu/V8UAq?=
 =?us-ascii?Q?VzJ/TCnIHzGS4MwBN7nlDbtMZb4r+bxynUVRnT0N2x0NNK44bUAdNdhxqTYr?=
 =?us-ascii?Q?j5uINcBk8Ov3NQW8LHzWc1CSqShR2/s5Z/p2NP5VRVa3bQ7HfJvkmCgfNOv6?=
 =?us-ascii?Q?om4LzGd202g3sN14y70Gu4S5SN+qto/KJCFHxwZNzY6DZ6+FaAD0XolBOcvL?=
 =?us-ascii?Q?UkU+CWFBjSToMjXalPoDoCvlsXx963iQFs0Cjw7TfmnRYRyd+by5xm6vJgT1?=
 =?us-ascii?Q?2tgmGMtxaGdcfRkAfZo1RKtqiLF72nlNjyMs9ZuKIc0TEBAN7PIqroOY79NI?=
 =?us-ascii?Q?qUAL4lU/r6/SFyY632ju4zlhsw8y2rXr6cDl619OlAGhMDamOd9IhPxwtT8B?=
 =?us-ascii?Q?VA5F+2ADj/4bViV28h5ugorzilsBT+6NxrKFygIRr/hjsH6NA6OyVWM1PaHO?=
 =?us-ascii?Q?T+TJYY364AETade+KNmo7RMsWeddpBDO2BVg6AYdM6UeFit+jwpNKFkQXVSF?=
 =?us-ascii?Q?YLesVtezmJO41rJy20jjJADApRUXqnvWI7AIbD/WINbWDxfGPNAY99Kg4he/?=
 =?us-ascii?Q?ZPEzGZuDpC1oSFfiJXtegxlyUltpAYNne2JIRwnhLCyDpobD9SW1SCM57Ibk?=
 =?us-ascii?Q?4gw/xzPnNqZdFzVfUFAET44gI7qdpw0pc3JwjW30y9o2K5IocXOVIik7C4GH?=
 =?us-ascii?Q?Nz7Pi2uzGc+3oolA0EivAy4FBDRqx2eMtnW/EpTSy7n427ea36EFDVjx+X2Y?=
 =?us-ascii?Q?MoBrulZQI3EQfq2b2jA8M5tV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395ac9cb-9c4e-48ce-bf39-08d941358c5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:09.5639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rk2+zZP06yJ07CcCiCBH5+9XZaUL2HuMNBG/Fs2DJEIBWQeVpZs6/kshOCc/0oYZ
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

The internal.h file is renamed to s390x-internal.h, because of the
risk of collision with other files with the same name.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/arch_dump.c                      | 2 +-
 target/s390x/cc_helper.c                      | 2 +-
 target/s390x/cpu.c                            | 2 +-
 target/s390x/cpu_models.c                     | 2 +-
 target/s390x/crypto_helper.c                  | 2 +-
 target/s390x/diag.c                           | 2 +-
 target/s390x/excp_helper.c                    | 2 +-
 target/s390x/fpu_helper.c                     | 2 +-
 target/s390x/gdbstub.c                        | 2 +-
 target/s390x/helper.c                         | 2 +-
 target/s390x/int_helper.c                     | 2 +-
 target/s390x/interrupt.c                      | 2 +-
 target/s390x/ioinst.c                         | 2 +-
 target/s390x/kvm.c                            | 2 +-
 target/s390x/machine.c                        | 2 +-
 target/s390x/mem_helper.c                     | 2 +-
 target/s390x/misc_helper.c                    | 2 +-
 target/s390x/mmu_helper.c                     | 2 +-
 target/s390x/{internal.h =3D> s390x-internal.h} | 0
 target/s390x/sigp.c                           | 2 +-
 target/s390x/translate.c                      | 2 +-
 target/s390x/vec_fpu_helper.c                 | 2 +-
 target/s390x/vec_helper.c                     | 2 +-
 target/s390x/vec_string_helper.c              | 2 +-
 24 files changed, 23 insertions(+), 23 deletions(-)
 rename target/s390x/{internal.h =3D> s390x-internal.h} (100%)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index cc1330876b..08daf93ae1 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -13,7 +13,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "elf.h"
 #include "sysemu/dump.h"
=20
diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index e7a74d66dd..c2c96c3a3c 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 890f382a36..1795042e97 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 94090a6e22..94789c7280 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -12,7 +12,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/crypto_helper.c b/target/s390x/crypto_helper.c
index ff3fbc3950..138d9e7ad9 100644
--- a/target/s390x/crypto_helper.c
+++ b/target/s390x/crypto_helper.c
@@ -12,7 +12,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index d620cd4bd4..c17a2498a7 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -14,7 +14,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "hw/watchdog/wdt_diag288.h"
 #include "sysemu/cpus.h"
 #include "hw/s390x/ipl.h"
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 9c361428c8..a61917d04f 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index 13af158748..04517fbf9c 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/fpu_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 5b4e38a13b..a5d69d0e0b 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/bitops.h"
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 1445b74451..8015c4e3d1 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
 #include "qemu/qemu-print.h"
diff --git a/target/s390x/int_helper.c b/target/s390x/int_helper.c
index 658507dd6d..954542388a 100644
--- a/target/s390x/int_helper.c
+++ b/target/s390x/int_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 9b4d08f2be..3fde18ba46 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "kvm_s390x.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index 1ee11522e1..4eb0a7a9f8 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
=20
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "hw/s390x/ioinst.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-bus.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 2388924587..5b1fdb55c4 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -26,7 +26,7 @@
=20
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm_int.h"
 #include "qemu/cutils.h"
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 5b4e82f1ab..4f11f6ac6e 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -16,7 +16,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "migration/vmstate.h"
 #include "tcg_s390x.h"
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index f6a7d29273..9bae13ecf0 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 7ea90d414a..33e6999e15 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -22,7 +22,7 @@
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index d492b23a17..52fdd86c63 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -19,7 +19,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/internal.h b/target/s390x/s390x-internal.h
similarity index 100%
rename from target/s390x/internal.h
rename to target/s390x/s390x-internal.h
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c2d5cdf061..d57427ced8 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -10,7 +10,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 03dab9f350..c07ad2d34b 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -30,7 +30,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 8e2b274547..1a77993471 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg_s390x.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_helper.c b/target/s390x/vec_helper.c
index 599bab06bd..ededf13cf0 100644
--- a/target/s390x/vec_helper.c
+++ b/target/s390x/vec_helper.c
@@ -11,7 +11,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_string_helper.c b/target/s390x/vec_string_hel=
per.c
index c516c0ceeb..ac315eb095 100644
--- a/target/s390x/vec_string_helper.c
+++ b/target/s390x/vec_string_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
--=20
2.32.0


