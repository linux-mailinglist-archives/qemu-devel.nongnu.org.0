Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8B3B7451
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:28:01 +0200 (CEST)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEiW-0005b9-FO
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbg-0001m0-8b
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:56 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:34005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEba-00049V-5a
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftAQGf93Lc8nJbxcyJURqA5kULjKeXfad4ZcFGJTWU0=;
 b=HKmuN30YQZLx8waWGbKNmewNgUIPRNmmesrn/VxKka0s1wHU2kyr8p+S7EVeJdP5IwataJ
 /pWBYlJq1SmcNrQe0zQFc0dxb9PI6A3UKi6Hf5zVIXy6eeHHCHMI4aqXdPsoNFjqUJtDMW
 TCCyOtIqrtmEUVEZGd1TMQs9xRRyg8c=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-xABqlnODOA2cmiOGRKGp-A-1; Tue, 29 Jun 2021 16:20:46 +0200
X-MC-Unique: xABqlnODOA2cmiOGRKGp-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XP3FnueoXWqBFviFBd78Ru3dTLD7Z9A7BAxm+9Gb3kShzy3yqDVmsEV5W1BWZ2rzmxfrCBxk4DwpxJyJYzqACmaOJfDDzEBxYqx+Mw4gUABEokrBxWSRVJt2NXZdJPYu3J7Ko3hCmBCKsHOHqw2hQ32Bp3qXz7qR6hyraGTxQeJ+ARNEbvUMWT2T4nRMLS0RZCgT/gS8hpcHkCbSxsgLSpWwRk0iviPvgb92pbRok+tgiaeEAgzByciUPu2yjEjMepkbS4tN2p3p4jDn8FWH5+4135X5/x0fMUIfehL1kw718OR7kaXGHkCorsDw6+4TqMJDCor79rAK8drPvknk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2+042NSRGxb69LXSIjNeO8HZqvRBk0T6QaQIaOGc3s=;
 b=lwGaBOdFIQrlcAXRGCUZsztxZJISnR1m3OPRMxHDf+IafFV9frn6FdHYcNplSg7Q1iUA/8IQAITOhRMXoSkbg3SgnMU1PpMTNS20xTkAC0ABpNDNjjS5e2FD4yYOvhuJvkp+nLuf7w8+aUkHNKadNg8g2pZNxWU0dc2+OvNpFw+EWNHdyJ/e0J6jP4iNkpVxeifKAiqxRjHbnjIdct2ZHjCs6mKEZiYF0OB6BjwtvQhlyO+jU0QpFXwT86aXIGVe89Ew7ZSkkou/xILxVx+3op1J0dY35FBVUVYZpPI3i2yHOtXMB8Z+MZ81P97QzWYY62wzDAvSPtVafPTo5khJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0402MB3327.eurprd04.prod.outlook.com
 (2603:10a6:803:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Tue, 29 Jun
 2021 14:20:45 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:44 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC v6 11/13] target/s390x: remove kvm-stub.c
Date: Tue, 29 Jun 2021 22:19:29 +0800
Message-ID: <20210629141931.4489-12-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HK2PR03CA0043.apcprd03.prod.outlook.com
 (2603:1096:202:17::13) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HK2PR03CA0043.apcprd03.prod.outlook.com (2603:1096:202:17::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 14:20:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a298fce-c04b-4381-10a8-08d93b0914b7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3327B9E908D1A958C92F35FDA0029@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaCY5AckLOD7HtXviG5CnzkfkZnd7/Rrg9gHi6AfTxCLZ+lOEvuIj8UMTHgSj6BdnI/0j+mSaIKlk7fnDwaywTGg2DXRa/kTwOUil5WvG2GeZXh6hVHaCeKNfkI7Fu4KATKOfeyRn72HOngV1lR8MQAX2GuiPJPJtSlAZyojF/pKyo52PnZD7rx6uMPk3FIVRE2aBEGqH/eojJQlspnSSWdJ75GnQ8WvtNB3KxazRJDb9t4tk8ekkvmfeevLnxtKIG1vw3ZY2OI8h2KckhfkxGQhyzYZD9rNKJQe5i8PgtnPoDgujY266W0xtHtMUTEXIl5vFf6Rt9Qma8FS7iuMV/rzM0nQlOUfvOqMM7YBf22E09xGwDxtulhHCSalfV8fBYwPmkpQF7/VbTW0n/crYofSd5Kt5PjeLwcTDqFazUPI0kUziThooLVK2k+j1LuFo8XzzGWCK0UgZGpi/D8nCdLZrrvHe4ZY+RydTkJHSuSO1K1tac6Orhg8cgom72UEMVaJ3gijDAIAQTIP3en+5XN8wB1kTDsUEgqzTdc5Z233hBL4Y39Q25rCtCF0yva4oiMFYOHUj0dUVcMJwuRU/qfUiA42+71y4AIkHg1IMMS+7mCrq6bxSeJGc3SZXmGXXfGO4lRGrcDx+X7uwu+5TUS764apoZUGCWgN8SrKJxYr7yPunJpwb9LXr0Fuqc5F0TzVAJnKMplllhMVFXkvcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(136003)(376002)(346002)(83380400001)(8676002)(6496006)(6666004)(16526019)(8936002)(186003)(86362001)(2906002)(478600001)(36756003)(4326008)(956004)(2616005)(66476007)(26005)(316002)(38100700002)(5660300002)(66946007)(66556008)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KiFhtIB/tcDQOz/sBJzRrGtQVBjNtyqZz7iDo9atQqTTVTMnIwtSD3bxVi9R?=
 =?us-ascii?Q?qpIHNKYxqhuko2s8CUUOz4OI8C2tgBD9yMMzicoLs3fUq8YUnEh0XqCtGx3Y?=
 =?us-ascii?Q?tpbR+/F/TOJ5J27XeiQ5ymk2zKytLn9vSImrfmOgVkMuaTM2VwVxTP43MbPN?=
 =?us-ascii?Q?w9gFQz2Ps7vIlyO/TLdu3h8U/0ofvkdkxmxfq/QSG7C28+N+6aARgHznubG2?=
 =?us-ascii?Q?usK57Dv51u0rpGcqQ9Ox+8q4+WOY8Hjbzlt3oC+8s9VEQf1UUClOBgOo3U3d?=
 =?us-ascii?Q?JNb60j4woBhq4PAhSndDRReE4JKgAKt5R1USADIeIhO2BBAYeTbvz3WazFue?=
 =?us-ascii?Q?+KY8URF+iaLX4QVbgid2I7uxJT93osoLb4e0hXvx8+4MEPZ3lBVv95q+baYB?=
 =?us-ascii?Q?LVBYNd+Afgxzj36RkPIgYLK0+fqGA3qb4qawwVi/rAmjCWLe9oKzUc3Q0/Gj?=
 =?us-ascii?Q?M05r4jkfjspKnWhE14wxOh5D1J4umJzTPxhvHp7GKTk3x+EnN2l1pgMSUexl?=
 =?us-ascii?Q?JU7TY0Mu07wSbAyGzW5Dx1wvynBD9XaKrotvaR4ErVuXTCQbv3vd9qWrdxHa?=
 =?us-ascii?Q?FHDoJoQ6xbxZFP7vt/LLqNu4j69tg4Uu9ZEM3+cMhLU5G/PRDnrWEIjbkn6C?=
 =?us-ascii?Q?Qxdbx1D49h3hWlcyKVp24vKCu3frIdgyy6pNE/b+AlzQ6Cs8PKJnaBT3w1wu?=
 =?us-ascii?Q?0+vIvwMZeGHHlhQaMdu1dmsLvWCcE3ekDshwwz6P8/pHya9/D3b8XiGm9WFi?=
 =?us-ascii?Q?zYrg2v79H7qRGNMo0KxC16WinItuTsosT6zuqNcORM+F5xtb1OSHsxR62OYb?=
 =?us-ascii?Q?fTopHEg1NxxfRJ4ZpIc/tW3wmiDCNVE8xIx0EDp8L2vht0+hd+nudhbf1tW+?=
 =?us-ascii?Q?wk+WerPg5cV8/KDKYyghF3frNnN1dmxLM1HkXzVw6Ms3OsvBcVlFUX9aOvEz?=
 =?us-ascii?Q?urWf/ml+UCMwLT6FtVtqfJr4IBX7xHuJlCbxZX8SlivfNfLvto73qJW5KBe4?=
 =?us-ascii?Q?hxjZ8BXlS6/PjquLZCQNKm3dUOV3CR/2m9UjcuFPDF4KPr5iFAqkiYY4jJVi?=
 =?us-ascii?Q?sdqlc325c64x0wwJWJch2cuniBw23o4dyTdg++aJY0IdM9KjzEuqTXMmxgdv?=
 =?us-ascii?Q?hZ/pcdR294nFGmLzLeVP+wSXgTfN84+Ui43IBtyiTK6PZveqePscJj/328I2?=
 =?us-ascii?Q?aqXNpE65ZTg6+sGToH+guPm5cRynswzkRFaSJM4vnnvw/7rJUDfdtWjjRfwD?=
 =?us-ascii?Q?hXwDEvODYspI6jq9boXvIuJm6QEpM353gldrM2M+HRLP+fiq0ci7vuw5Oxb1?=
 =?us-ascii?Q?tPii0MVzn4wLt2ID6XgKXHpl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a298fce-c04b-4381-10a8-08d93b0914b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:44.1260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1wHHPPt0ABsfhllIfrOVDLENz0qp3Tz8mR7EpRxmr3t64A4qwUSrxuoXnvR6L7P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
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

all function calls are protected by kvm_enabled(),
so we do not need the stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 MAINTAINERS              |   1 -
 target/s390x/kvm-stub.c  | 121 ---------------------------------------
 target/s390x/meson.build |   2 +-
 3 files changed, 1 insertion(+), 123 deletions(-)
 delete mode 100644 target/s390x/kvm-stub.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 082ed2b643..4e172540c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -395,7 +395,6 @@ M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
 F: target/s390x/kvm.c
 F: target/s390x/kvm_s390x.h
-F: target/s390x/kvm-stub.c
 F: target/s390x/ioinst.[ch]
 F: target/s390x/machine.c
 F: target/s390x/sigp.c
diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
deleted file mode 100644
index 8a308cfebb..0000000000
--- a/target/s390x/kvm-stub.c
+++ /dev/null
@@ -1,121 +0,0 @@
-/*
- * QEMU KVM support -- s390x specific function stubs.
- *
- * Copyright (c) 2009 Ulrich Hecht
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_s390x.h"
-
-void kvm_s390_access_exception(S390CPU *cpu, uint16_t code, uint64_t te_co=
de)
-{
-}
-
-int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
-                    int len, bool is_write)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_program_interrupt(S390CPU *cpu, uint16_t code)
-{
-}
-
-int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu)
-{
-}
-
-int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu)
-{
-    return 0;
-}
-
-int kvm_s390_get_hpage_1m(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_ri(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_set_clock(uint8_t tod_high, uint64_t tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_set_clock_ext(uint8_t tod_high, uint64_t tod_low)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_enable_css_support(S390CPU *cpu)
-{
-}
-
-int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
-                                    int vq, bool assign)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_cmma_reset(void)
-{
-}
-
-void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
-{
-}
-
-void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
-{
-}
-
-void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
-{
-}
-
-int kvm_s390_set_mem_limit(uint64_t new_limit, uint64_t *hw_limit)
-{
-    return 0;
-}
-
-void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp)
-{
-}
-
-void kvm_s390_crypto_reset(void)
-{
-}
-
-void kvm_s390_stop_interrupt(S390CPU *cpu)
-{
-}
-
-void kvm_s390_restart_interrupt(S390CPU *cpu)
-{
-}
-
-void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
-{
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index bbcaede384..6c8e03b8fb 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,7 +8,7 @@ s390x_ss.add(files(
   'cpu-dump.c',
 ))
=20
-s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
+s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
=20
 gen_features =3D executable('gen-features', 'gen-features.c', native: true=
,
                           build_by_default: false)
--=20
2.32.0


