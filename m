Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67743B0154
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:26:57 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdcO-0001Mk-L1
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUo-0004ot-Uf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:19:07 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:38526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUl-0006uj-O7
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVjbndGDpf5Ky4CAhptJk2ImvkQ4OgASMeXJIBWu55o=;
 b=M0YxQiIgH3TQtwqEEjYdyiU2WLnxSDpWFVJSa3kqS9BE/8LWwuBW1c0c8bBLO843gpenop
 5lnAx3tea20yqvKaPTxIV5BCpylfoZ0KYuE/Q8xOHTDDWnwaMorvPcec3WIO4b92UOrwsa
 PLfJzbREjJDTc5bMxkmQVAXZ0L/gWHs=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-jquuYU95M-yvFIpRQmwmtg-1; Tue, 22 Jun 2021 12:19:01 +0200
X-MC-Unique: jquuYU95M-yvFIpRQmwmtg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrcOPyuJY7wvFh3wPAZgCwk5G6o975OlFX5S7kpzDPfhHuOvAqvidbKf5guIAN0DduWbw8XZ8j6Rp8gB7nttZsbVsMiFztuk15Edm2b7FJqRp1Mjjt0nhutwkmYsdXOfPUpSADxcCK6gVY2dKk8SilEta/qhfWNEoEfxd+S74mphwZdOwtnT7q8VVQRcxdJPf6GjOSg2m7paWVTdEgN2j2G96qZtmZX54g9VdX6x3YwbGCEXgmQtxqSMI+putQzMCNpFOJ57jgo7TlfFKGqOsnXVma2MuP7A/JczlHyCCU6InVOvS3gv0RtxPeIisUy9AfFbtjtU3tbL3IqKFEOppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwfjZ0Wec/9vHlEzviNX02ceMyaixVBO5oQcGTtjV78=;
 b=V99PAR7IVvsp2jSdWGucZwXd9qRO7LEgtONQTXNh+n4baiFn9rRg7idefzMuGW7T+kF/lRJpWK9fCsyJi2TohSheaHIayncViir6ObibrZ71z4SStFMlN+gZATxcHxiNTQj0EwO6nhhEnhGgZgJ8i0sthpMKSmg1ScQY27JPLsz/3PrMcTNvPH/F8yZjHl5iMCSmAN1wE94E96fmE4Th4uxzy2XdaEDap4055Fc5VEmJEBU7LkSTrvN9EX4sZ2sFpJfIFTanWND7CSfgOsvZg1ai21d9lvDijgWM3ESoAs5p2SszxOpnIWgGLhakCKnV3vjsR6eqnZMr3dsEissomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:19:00 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:19:00 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [RFC v5 11/13] target/s390x: remove kvm-stub.c
Date: Tue, 22 Jun 2021 18:17:24 +0800
Message-ID: <20210622101726.20860-12-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR02CA0176.apcprd02.prod.outlook.com
 (2603:1096:201:21::12) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR02CA0176.apcprd02.prod.outlook.com (2603:1096:201:21::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Tue, 22 Jun 2021 10:18:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4c120cb-ee58-4289-b993-08d9356726d4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57277F0E958564992AC7C90AA0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhBOGZrURiKZmzUL5pZ1JjD/bYdwW6FSisGXGLdVqKdG+GkmTxJCz9ykND5Bq408lYW+rlG3u56PZG7R7oq6EUaKlC/oJUNM6ffwU1eRz3Jczxa2CxZMrUBrZsUB7djCM1un1hxUzvK2VIlsz91GWf9WdRsmYpKKqEkUMxXRk3M/t5fEATZmNJsaBCbQPBU6qMHt8EZ7OpDAO1RhKagQfjgo475VzpbfU1PBFYtM0Jf/S94+qkqohgMPKtXTVhvpzfnqjhDpQdMOyvqbzu+QmDD6GuY5m5AAMaoMGuv9AQnz0t5EKnICS/xPifdr4O7x37RLpXY2dOAxlOV9r4yTgRfuuutmwuzjAHCQAnXNEjcaJ3U/mEpfbGh3s3Fv9zz/QLkiVzqGMrW2fpmy+t7sRS0mkCFAeyw/8c1zD9FkkKC0g1v345L8beASsvfG0wkAA3C4+4gLyRPIrn6Zv/pAfB7O0dyDd6ayYBum2Q6OZddEBw02zNR28iwzrwckc5QUjCmJMwNs3hTwW+Qn+6bqyt3n4z0xONvNNtEBiA5K7loryrwLvwLaamaiLJ1bwI3oFeUgO5LGTAeznhC006J0LnuOXRa0jT9ZyIAev89+rmMqB1Gll2FcTr3UIQdvVICCPeWFgsur2Ewy04EH2nzhFJYzedGOhKsKgZ/pFDMBk3gJsEyMpscsy34gAEFNUR+x9jYmiGHtJ1YF0nd0Ex3ejQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(316002)(478600001)(66476007)(6496006)(8676002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nCe3B9cbIuOo+w1sq80iF/U3QpewrEKRzFAyQ52sRfsJhH5s4JnhYcA12D3V?=
 =?us-ascii?Q?sXoSLDB7zr0x6FKCaLh+otBL3SB18ChW7jvsSxK6x3JaOoa09juAlM+YQ+CB?=
 =?us-ascii?Q?9uxNwrrS3P6iuHtxdk2MAdkgUEJ4X61N9AvlvfHdXHJ0+JJMVYSgYvW1zI3h?=
 =?us-ascii?Q?L3ZzP9sksm5dkZf70dBt6siLcQUtsT9CgmZiBXnmm2WeCcTLI28v9ofKvy6Z?=
 =?us-ascii?Q?qWHQSwCnaVK9IgZT8YoERXspunE1WnYbz6sXuXgWdPQR0r0zlW6stXUe+J5g?=
 =?us-ascii?Q?oEsXQA5xOzrJnQZ+i41+RLC1mkqE5JNU80/NQ/CHKESghc/7a3c07RcUgCC3?=
 =?us-ascii?Q?4pvXgMwhq6MDbDKEbiLu9q3k/TXts4sJpeDbRf4N51fZ5wPh1IevTJI8FGHP?=
 =?us-ascii?Q?oXgpag+cvvxTWq3g+nmG81MOSJ/dI3LfHMt5sSH0p2htHKuBpxztrjwY5Glq?=
 =?us-ascii?Q?l9YNWzkjupfIuyQMyPfVd5H9YvyLhUfwYtbBtswLihrvw9yN4tV+PjZ8ZSf7?=
 =?us-ascii?Q?b8WA6woF2yR0V6O8HH2XYup+lpOohItVoTlSoyj6GBctps87tEhKaWZApwQp?=
 =?us-ascii?Q?PytUyXs6pAbvdkMY89RfQ0HCcurHyqq2ujAkd9k8muFj4IsuSq1WXo1wwCc6?=
 =?us-ascii?Q?BuWhX/yMYVI5Ui047ReiiUjko1T0/i/cQ6vPd8+UePrIWS3DOWVajBG+RZZm?=
 =?us-ascii?Q?6vGmr443M8PsbFsIX1MJ0ruyra4fNzi17Fzu0t4yx1C5WPcblzkIVK9j3tE5?=
 =?us-ascii?Q?Qqirkmun18VruDqGEkB1Z8BZPGOshmLz0QJHaiOY+qiKo7zGeSQMIPG44YZE?=
 =?us-ascii?Q?pRe9PQmx3Mm6WpXJo0SdB2WTKrZl1kgFARtrQrqMOMtnhzcvksUysx7cpgJu?=
 =?us-ascii?Q?6S5Z+8Qbx2gu+jHBPUe6yxMZrIeKVh0oPIv9ozYR/F6T802Ay1fiVG5mlAS8?=
 =?us-ascii?Q?8V1pqm4UAhXpkioYN03fJeL4SqtEIU18vP5tWyEnhvIrzU0dhKhyDZ6RZtSD?=
 =?us-ascii?Q?6NHI9YSVs6G8WU9uyHGbpcEf4y7AeID+gC1jP/YCnyVp16/1ky4aKUn39EXI?=
 =?us-ascii?Q?b4FPI0bPY+1ujtPhbY0LpXKuVCH+iIQDbo8Zl7tqPLkfaBXG/b2DZpTeKzUj?=
 =?us-ascii?Q?jNQT389W6WQfFBioHU0zk3KflE2sdhNvQVDdNqmzs2XF0/MRTiXzwWqL2pIs?=
 =?us-ascii?Q?EwCs4ScMPb8dzwv8VI6itsWuWL4sU5GtjqM/xcVIavX4b66ZkE1uvAF+aVa4?=
 =?us-ascii?Q?Vy+sgoARxX33slFrZw+T9nJLh42n7c6SKsiqtRupUT8Rwy5ro5Ydx6MsOLmj?=
 =?us-ascii?Q?fXrySzfVzbRhbcVRhcOy2EXH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c120cb-ee58-4289-b993-08d9356726d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:19:00.2232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +C/anQ8iGFRVuQHHJ1spcMyhhasX2YIDHtyvZsWT+RlIXh9ob9j4SOyV1EiqjNlo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
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

all function calls are protected by kvm_enabled(),
so we do not need the stubs.

For kvm_s390_get_gs(), the last user has likely been removed with
0280b3eb7c ("s390x/kvm: use cpu model for gscb on compat machines").

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 MAINTAINERS              |   1 -
 target/s390x/kvm-stub.c  | 126 ---------------------------------------
 target/s390x/meson.build |   2 +-
 3 files changed, 1 insertion(+), 128 deletions(-)
 delete mode 100644 target/s390x/kvm-stub.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d05dcc22e0..bf9bc0513a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -393,7 +393,6 @@ M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
 F: target/s390x/kvm.c
 F: target/s390x/kvm_s390x.h
-F: target/s390x/kvm-stub.c
 F: target/s390x/ioinst.[ch]
 F: target/s390x/machine.c
 F: target/s390x/sigp.c
diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
deleted file mode 100644
index 9970b5a8c7..0000000000
--- a/target/s390x/kvm-stub.c
+++ /dev/null
@@ -1,126 +0,0 @@
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
-int kvm_s390_get_gs(void)
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


