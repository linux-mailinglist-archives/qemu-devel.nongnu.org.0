Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198E3BE6BB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:56:42 +0200 (CEST)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15EP-0007G2-2W
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Cc-0004Wg-2A
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:50 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Ca-00026e-30
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhoQpaYXVRgy46T1jyCYw1LvUyZPnyisxCD+13LG8/8=;
 b=P1iP71GT11cepqPMsCV5nB4PiS2KYwAu/25a+oudCYSz8qXY06QEdSgxRQwsgu7302mW5u
 w2FKimeFAO7gGnyvQdbopOyzQFCurVoyE0wRoQ5pR6eCmbvIACDkCYII5guVe1U6G+2CiT
 EJIEA7JIsnqsjFh3IzKptHe7OX+bK9M=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-99iNDddNN5ul711Mh9SSMA-1; Wed, 07 Jul 2021 12:54:45 +0200
X-MC-Unique: 99iNDddNN5ul711Mh9SSMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSNaCZFvB/2Hl9pngoErL5uoK2rjunsZcxgPDTCoMJ4IlKBsLb/veLq5KjR/0WPUuXp/0dYSBFrp8b6fBdxlcFuQ/Rlc2LKJmHKZ69vMqXf87/kHN4Dtn3zTdtyIwkKIL8+2lmsR2r4QQez23cxSaeYXMA/VhtE66zyLyt6+1sHLeD1TWAZFTI8pECku3x1dtTJfHgCJzscOXo/vGjIJsfsuvVNirltBg41Inu98c1uWMmhQh4SXL/F/4xyp+8O2l55WebUC5aYUKXl9LC05iG7mcMjT5QccGTewfyHRmRDLeaXilaqouGztap+CsOeOxktCGwbBLaqhh2vyAfnrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFJ8Mltpb7EhCRrtyGBXPptEJoRE0zHOHAmifrMeV40=;
 b=llWTFjHWXbdCaMFwtreCeGaISdvl6+2KKmK7DGD1xnP7n6bpgj64A+EnFUdKLz3VjhEev1axFkL6J5oxqpWArX+4AIY1L4R9xo7qHrSF4+2EalaIy6PC0I3rygnhhyVJ0q2vROJNEizo9ZgpSp7HUQfhPIkZNy9bUuGzsdUuL0tRv8TY0Eb64zhRWPjRHotUflCLSdHrR9KLGfdQfynL3V9Ng0c6tX2Qn01Z2vh5HRdEG8Xrlic2N2shiKmAJkWxn2ZmEMqmeBMgUS59z9MwY91ZnDyijRR7iTh4/FkXfHtMraDnWEBzU4OMzyYw5PvT/e6SLZ2PsB0cS2NMbLVSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 10:54:44 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:44 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 12/14] target/s390x: remove kvm-stub.c
Date: Wed,  7 Jul 2021 18:53:22 +0800
Message-ID: <20210707105324.23400-13-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 7 Jul 2021 10:54:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02122ca0-1511-4450-0d6f-08d94135a14b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7007:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70077F5EB1B3BEC127114064A01A9@VI1PR04MB7007.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5nepkQ1XK043LjITBKAgVw2rpsJ7QS8QgCcDahYPLmletMt7wxtx/a6ZGn+lnxygdX3uCoAWYB/Km5A2JmvE6IsdB4Ubtd4SDMoLH6FfG3x2/ygpJimA+siLuC/sFBYz/PVWST19ERovzOMiUhecHVcsw4/Fnkn8l4zgDIT7Ey6bSUn/pWDVryFhPM/lAA2pSqIW3W9+d+gKmAcBe6n4ShUCoYk1b4l0qJukiKzbb1S3Wv9M3YMu1gM2BY48qnurEYMNVGzNxZY1galpanOKMCw/wdo6OZzWJfavfTKwv570LzelCSd5bn59XqdQWKkjjRSVr62hKY0Um9CdcFtgKbbU4HWgWzfs4r6wm3txPBCpDStyIoH/zoL7HaFv7dacw17TYYF6QXUkDKOouV9ULMrkGDA/MSlInN3OA5bv6gtFBO0kodu/P1v55tL2l0t0dA3cUbh5CmqnYDhCE4zUrrJLS2jAatKW3fCulSIrtlS5LrNfHVT15zP/ch/nQ00vqKxYr36uC45MkQWtABG0FBFgQaVu5g6lyxrwJ3BpYMgHo5ye4kXn9aubYCR6WLWKLcFgsx0LtivbRTuEGKcfEYinycF17slJASEQOPfKa9dqjU8AhW79zJ5++Fb7aqVph6+q0Ytb2kbGq0puw2yMbebvxqurj6lezVtK4gsQ7ue0PHIGldgP3hWsWQaDpFD5F6b6NDHdycsxbwfkc+zyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(5660300002)(478600001)(2906002)(1076003)(36756003)(4326008)(316002)(86362001)(26005)(66946007)(6486002)(83380400001)(6666004)(38100700002)(2616005)(186003)(66556008)(956004)(8676002)(54906003)(8936002)(66476007)(6496006)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J5E0pVAjkwaOhD9TX/d+v3SzYtVjRZEfE44200MwmpwLKlFcEycG8/jlPUqr?=
 =?us-ascii?Q?u4cryAc+kdGUZzlC7mjk5hwMZJjq2dUnjNGSyOk07Bd4OyGrkFOrgRoddevt?=
 =?us-ascii?Q?TLuuAQhRDRB/nvjyHLfw/X+Cd1fvtoUm3aSspaCH1WuAEeMCEjisJ45+du8l?=
 =?us-ascii?Q?NHRGxhuKI4PsDGrAcw8xzesGNzQqIMEGf8nNs0SLpgFml6zChsIexhiy7+G0?=
 =?us-ascii?Q?sRiIDy749dH3UZnpNmbUno56p9faVP/Wo7c8mE5YjGFix9mMVumyhZwFvU1E?=
 =?us-ascii?Q?n6BdXJAh9yQVBsx2xGjsxY/lq20flEar0bEcyupb7W9uLWzdsTfC3vidhfgk?=
 =?us-ascii?Q?K6lFBDJRjR1Xa0SAsVEQAJeVcyZ3tSH/0CRjetg6xAzKA76EKxHo9xZ9SI8x?=
 =?us-ascii?Q?HeujQxlW1zlYS/wVuW5paihabTfzPzXm2FagTYmhclnAjQ0VazgmsH7tWv2g?=
 =?us-ascii?Q?4iRXGXthk8Lv1YWwZ87nJz2qgsNztEFqGBQ2woQSWKLAyzVDG2sHHmFCuOHx?=
 =?us-ascii?Q?NH9ZCaXfpjqBdSCWTAKvnLkNwk5i1ZaM5UgrjUqNhzIFXL6FTsZpq7hfAZCo?=
 =?us-ascii?Q?mojjtnSYy5lfkDDodlV/97o8MM/dqhWev0XRZIj2hGdjTwfHjpToZ36EJ6mZ?=
 =?us-ascii?Q?DkuyEw7I94anbmJRMpS9hHjJe++CxrlEEC2pD9F/L/vRwtgDbRue3vE5Gdol?=
 =?us-ascii?Q?E4UiJ/QfS4v84o7z2VAtruV7fx2C92ysbujVlNUVMLUO8vOVmhCy8POAzEex?=
 =?us-ascii?Q?+gCSj9pfiswxZBjJGbW1OdgE2FhbZZwx2L+XyYXwRoztw98BCCTdu3gYY/w+?=
 =?us-ascii?Q?C5hgqpsTY0DCSCCg4tTSWTcpaYBEXOWX8u5mUUY+hpU/GIwDfNR+pr970Sl2?=
 =?us-ascii?Q?vN/GDQukE+3K2zBzLZgiFi4h4Rx5BC0x/Lf8pAQu8/qPmHv4n5i0VfIoUQc9?=
 =?us-ascii?Q?Bsax46rP6SPwJvMGcPkFRpqxDASkhVW653pPkPe2Er9tExHSVZmIb4cZN7On?=
 =?us-ascii?Q?3gYizM93/cVgerA4+E+AN86uscwo3v8JIQimIMUFSn7vNECxTJ1VZ1aNo64S?=
 =?us-ascii?Q?msE9llB4quj4/cBc9Dqq0GbOVBr8yJFkVJgJJlGsrxCKnYLiONgaKXPdHwzl?=
 =?us-ascii?Q?/CD0wG1LTtWGK+xgUX1xTvllFkevDwNWIBznCxKy/QCEVh/+IrTq47Askfpn?=
 =?us-ascii?Q?1V9VhQLELAq0MwUxZW0I6ZlJ5UfYd3xNYkq8a10bbNware5NljznC4sT1jWe?=
 =?us-ascii?Q?JoRCy/vG7xu8rsyr7CEvbrMmtjh80osijWQc5xCmNyyK3c6pZV3xiLDSD3Me?=
 =?us-ascii?Q?avm4CmD/jMmApoYmTcEck6gQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02122ca0-1511-4450-0d6f-08d94135a14b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:44.7506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBQnQuZHXQjmC4HnObda9Tu8LlyThgW11HrgTYCeXcVkZWyhgzv/3vz20qaemw6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
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

all function calls are protected by kvm_enabled(),
so we do not need the stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS              |   1 -
 target/s390x/kvm-stub.c  | 121 ---------------------------------------
 target/s390x/meson.build |   2 +-
 3 files changed, 1 insertion(+), 123 deletions(-)
 delete mode 100644 target/s390x/kvm-stub.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ec845f4e0..4e04800576 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -396,7 +396,6 @@ M: Christian Borntraeger <borntraeger@de.ibm.com>
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


