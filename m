Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CE3B7438
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:25:36 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEgB-0007vF-9V
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEb0-0000Wt-9Z
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:14 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:49344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEay-0003ka-98
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZ8IVP+/zApoEh+BqT+JPVGDDLxpay6YbMz/EFtjrqw=;
 b=YUWz9tIaSwhD1RUWi/QkNqE99Rrzr6ervp30SJ0sdUBSvsjPE42LiS1i+l7uB3WocpLo3H
 gYzXcQ1Dk8abuSEzGOL4dosBTQHcjDqmxQgnwUyYkog0BL3nHvPg86PTkthjrvC9xuJFAE
 CBYzG3FG7XhkdqWWFt5aG2+Jbb51LQs=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-u7BKxNZXOWSPC0ZMoXoLIQ-1; Tue, 29 Jun 2021 16:20:09 +0200
X-MC-Unique: u7BKxNZXOWSPC0ZMoXoLIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnmoC3GDnC6SNfizo7IT2Xy2RC5U3+vcBufZFIisZb++OiEMVhMpSfFqG+dXT4rmS1vrJXWVdT6O0C9NP/CSSXiJHWm/di3xX2j7m9oIxfHXMykd+kO4SaeXC42ScCctGc4OnBSwF4XpeJxLRCtzPOqbvw6cQpxP3YNy6oADznjwy2rZArO02UxukkarXBmjijiJzSCtVfAIbAzvGPGHVMYdTF8SGpPUvzVJSExR2J0uAgpPzmUZSv5iBLca4zYpoG61Wge3kqy3BzNDAi/1TRTbDV9+G+FSjU7YMX8MeS9oVwFNlpcsJBZlHbN9enBlhIn1BZy7B6MIiZ7Udu9dZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytOf7LW+TZaAePb2wsSPx9rQQg7/l+IzunlUfKZET34=;
 b=fA2z2ca2mDrGsx1K/fy2jXYC+cjr48an9b+kUJ0a6xuZ3PgqEh58k4xFD4iTdcsmziUNBACHcR3FSBgvYDemeqQpMkFDr5+RzFzzqvqA92207MrmlqSAZBagXKrxoYlLF9VM0W5njrNyahIpnw5kn6VZC9Wt5xdGK24N7iHedUEiWWQjvgQ0YZ2JryYSJmzPeT5xCuSA2Dxcgg+7Mzf6JslxUTBKR1UMq9NHlZvjmuJbC/M4EwD6oa8ic5WoBZbAVaYIjnglJouyiwmT9HCUEkwx0TwxJKwjVQkPimqrlscWNxp97i3IAjl9JHYngKKkbkivAwE1bxz0ZkZmyBFrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6445.eurprd04.prod.outlook.com
 (2603:10a6:803:11c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 14:20:08 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:08 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 05/13] target/s390x: remove tcg-stub.c
Date: Tue, 29 Jun 2021 22:19:23 +0800
Message-ID: <20210629141931.4489-6-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:203:c8::11) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0006.apcprd03.prod.outlook.com (2603:1096:203:c8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 14:20:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9bd9a0e-d46e-46cb-ba7c-08d93b08ff48
X-MS-TrafficTypeDiagnostic: VE1PR04MB6445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6445789AADECAB890D0F80EDA0029@VE1PR04MB6445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbGpT67fCCjUXXFAb9Ml1iMpePqPe3CM36dVzWfgQnd4d/z4mXOsSRQOfOQnaINUjWPaz4ktiQFLV9+qdcoE6jXXwzCHvn5RSC/+r+5o9UV4MxozyW2yKcqQ4iAVmHinLNL3EpAq/KBImjpfeHhEfzR6Ko3VjW1ttT479VshP7jsbqyCEjDzKLbB5eOnKcZ9bM/ZpizcdGb+z0Qo9lJ9ht6fz8FoNtzqrNCcuKhNgRtpDmAzPOrk0I9aqCErKH/GjHU5tsermy5Z5oALBe0a8oClfFVcOwNOYaX498RjdW3OP7TE/5NyiQKKkUTj4MciLX1YdtsoNUQKPTqQTf+z5aTKcA5Kjciai4JtEOsCwfRbYKXWvb3uNUOOqxXGLvHcEGOPsroz8VSD2ZEuAxnbtTij757fPXQOLyxd5WTgwzKEHdq6yNf/8Myp3Uetymmj4dzL4ct4R/lGgWRozELsz9/UUecCHZDYsB6vXwchnrk2DWVuCb0ypevtzp9lX3caQjTC2zzRcdkQ0uF3K0ybpvtNG6aXSDOmu3HybCZEKwmvSsJ1glvHGsErM8qVjAEMMAJcCGZSkL0E2mSUJZqiy7TJN2MMBgHfBYupWRcsW0AV2c8IhOM1rNFnGs7oDgp5oZIjCoGZgEcZhJWqyacumw8vE+1Gw659zjyH/bkSksmcFqzI//IFgVtIE94U9+C68HRvgfy8zAqDKNgnDTFKHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39850400004)(38100700002)(6496006)(86362001)(186003)(4326008)(2616005)(6666004)(956004)(16526019)(8936002)(54906003)(8676002)(66946007)(26005)(36756003)(6486002)(1076003)(66556008)(66476007)(5660300002)(83380400001)(2906002)(316002)(478600001)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XyWeQVNZzbQAc/45jc2WAKuyJaUZ6zXmnCA9rGXD4LeGucnsYxNflFbcRjGe?=
 =?us-ascii?Q?9VMWVsGDVIhKrzqyuc77RlIHIFIm7K6uB2zMqTryo0joMYewVd+jRHcL0Kuh?=
 =?us-ascii?Q?kbpJUQA3Zcptx4L5uzNVCruV7IjzFhUd9w9VpdwWyvU7KEN8XnUzPJAzkjd6?=
 =?us-ascii?Q?ws5LHRfiDP4kCav2rS2TL21FtBeBdKf0BkfRy2rY1wP/g58wl/pRn0jJlZBZ?=
 =?us-ascii?Q?xm3jboeRe09nA9s1PWVezUR9vJpJGxVNAadkBPT9P305rBgYqgLOGCjHoycL?=
 =?us-ascii?Q?5JH8u9krM8zjpaNmKhNDxwhzTlPdGiqu/kxS9WKUQMBbawnqGkZxi44yVnky?=
 =?us-ascii?Q?jWDq2HhDCRSxA2+KOHOlvkSu8ELBwUmzaax/2F7mwCsl9DQQTHW2xzsmSVmb?=
 =?us-ascii?Q?N2OL/Fkcw/PkFvneD+gaOVscAEsA9vkEb4tphRE5fqmYx5au9PHBa74pYOZf?=
 =?us-ascii?Q?WWhE3wG+2+7NsZeOOzN+O6FXKW7LMghO4hnUtXrZk/cYZgb7NwriQJ/h8/Kg?=
 =?us-ascii?Q?wYYSdctWurdNaHJVNa398P5G9Lo1XvN7ajzMJlMLibTLBd4lA4Uq+k20PHFV?=
 =?us-ascii?Q?hXJjVSg3ubCQ1JLKFVvrSYL774vSP8f5Qp2wv83fC64pfj3UwMWsa4qiqRYT?=
 =?us-ascii?Q?+q+Xw8nv4z5/zsFB3OjJAhHM1bjqdg6H6B+i4wOtnAThV3MHNxaVHrlRphYK?=
 =?us-ascii?Q?rQSEBGZ2sR6F1h6XamiSDWAOD0pGulVY3NXaIDRIreOgEdqX6E/H5zojMFc2?=
 =?us-ascii?Q?Cx+3j+yVdCrLn2bAvcPMGKVpXqH8cma6yJrf87HrgOcovE557mcws4snv32l?=
 =?us-ascii?Q?YauL3fqSD9ZnMs1SmCrbUbRTEEsrwuE2Qr2paGUobKpHcR54Jq4l4v4nDamO?=
 =?us-ascii?Q?g87gyvqoE0oMgMCZvdxWDZvMyc7Nof/QVNGJfqK9J7MDrp/3tz+poQR60cnz?=
 =?us-ascii?Q?OU2qJLQfVJRboLFvCX6WaDepgda2BN3091WnLJgJsCTANZ9De+mdzxnqbsTN?=
 =?us-ascii?Q?xox5vLvRVHraK1C5ceVNh3UuH/k+Jx+YfMrJ5aWNbLb818+84dJOo/0SIa0s?=
 =?us-ascii?Q?3eDkjEsvRGc9OCjbKWBVRSwa9kYysb7iG3vDXu5D7g5BpaJmDiNT5FWpWqgV?=
 =?us-ascii?Q?9dBggWVDFfx7liOIWgcWLxfdYna4SmPsEd11Y199RAT/buQBRvn+aYWMQmYX?=
 =?us-ascii?Q?ImbI8OH9G2gMdFfDwqGuEcws1fUzUhsmG/6V68qjMxcDMLi4adXdSHi74INw?=
 =?us-ascii?Q?G89NfGtyUU4ClPA8+tFOi8HGw1sQAM6ywR63iSXo/j67i0LUNl3X7RpOiZ/V?=
 =?us-ascii?Q?iOBiTyQ+NH3YBjX7J8qusO1x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bd9a0e-d46e-46cb-ba7c-08d93b08ff48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:07.9498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5bWl/IankhugczBkA51nw8Njlwg8I99PvwvP9jtHDtZ/NgOlQ+Ynkxt1hIvNyPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
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

now that we protect all calls to the tcg-specific functions
with if (tcg_enabled()), we do not need the TCG stub anymore.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/meson.build |  2 +-
 target/s390x/tcg-stub.c  | 30 ------------------------------
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 target/s390x/tcg-stub.c

diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 1219f64112..a5e1ded93f 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -21,7 +21,7 @@ s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vec_helper.c',
   'vec_int_helper.c',
   'vec_string_helper.c',
-), if_false: files('tcg-stub.c'))
+))
=20
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
=20
diff --git a/target/s390x/tcg-stub.c b/target/s390x/tcg-stub.c
deleted file mode 100644
index d22c898802..0000000000
--- a/target/s390x/tcg-stub.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * QEMU TCG support -- s390x specific function stubs.
- *
- * Copyright (C) 2018 Red Hat Inc
- *
- * Authors:
- *   David Hildenbrand <david@redhat.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "tcg_s390x.h"
-
-void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
-{
-}
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
-                                              uint32_t code, uintptr_t ra)
-{
-    g_assert_not_reached();
-}
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dx=
c,
-                                           uintptr_t ra)
-{
-    g_assert_not_reached();
-}
--=20
2.32.0


