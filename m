Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6E3B0146
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:23:02 +0200 (CEST)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdYb-0002ry-S4
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUK-0003pb-NI
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:36 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:44234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUG-0006b7-Cv
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdmGg5Z6/9J48gXwVPMDbsDOGE/y6l8HC4JS/JhKIx0=;
 b=G4lw/8e4xWdD8sPY4VrFrKNpWK7TA+eLVwMqo2nYk1en3Gi+Lp1YsV/W/CjX+MdS0+JWa0
 lV6EvktUfC9wgMyQSMEbd0zWDjYDkralbIN9E0Xo+lPTpDTrNBusH+ofFrjLVjqOZNmtSO
 K2HNY9PFSDRG/77O/zbgP+d4OPFiJvc=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-FIGJZMV9MWqW6KbCIuAzgg-1; Tue, 22 Jun 2021 12:18:30 +0200
X-MC-Unique: FIGJZMV9MWqW6KbCIuAzgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmxhSLiDGvNDRFbpOqWHG4g+/eDOBMbiI1mxV3joqPfE5pgja9p0Fu2jIPy8zID+E6LSnZo8p3cPKwjzOqZVwysiNBp0U5X+ZaJXZK6zB1EQB6t+401KhBbj5pf+UOKpMjqvPlr3E51cfu4zCABIEBYJINJOIBhABVkzVYQjgRRp7OK4HXJR1YhPYkxTwR9J4NLaxcCfjkRt7Ho6aF0j2zVtgif5bIb86nlK2JChQm+TXz0nwL/SpoGEBj2RjpGTdX6v1slaA1luCcOZyOH3zkrSJg1WB9FKuiz697QCUSHWSOE+gZEhbkbTjTZgFZ0u29EnjrkaW6TBn+FrF/zWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKT+VFzCUHkHK6c6RZgMYTmHExJ9l4D4hn8CkMy8rP8=;
 b=ZCTUzDjAHolUzd5PnnySm0o243CzpsNVgXe8oWSq9Vt0WF+8cFK/oG0++MupUiKbMV94fRMwzo0T7Ir1V9Rp+LXiyjUNI5hW/68NOe/HWQ8SQcT+zDrbw34sIaToAt3RPkkBYq/TSZtIqxEuZM5HhnldheAVhBnhPdz71RL5OKGt+IZpD888qz3mRgGStwiHAUetvIi18Tuzz57xYwjqESPYaGGTbKUAggaQFbFNWIlc1dF7KqKiZdozFc7gaYTCjbdn8cRH0qPasdpCmQDYyCG7jilk55aIlnOOCYW3L/1XUQ3YUmaxmW8dTA2cXjkO4TVRmJnMWV6ioClS7851Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:18:27 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:18:27 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 06/13] target/s390x: start moving TCG-only code to tcg/
Date: Tue, 22 Jun 2021 18:17:19 +0800
Message-ID: <20210622101726.20860-7-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK0PR01CA0070.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Tue, 22 Jun 2021 10:18:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d21f81a-064f-4484-f037-08d935671378
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57277715855DBCB00F800266A0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QuIwZywpPtcQIZJY4LBgFXMhZeoiVfj2kn9MMn9cBCqWCOqrVmCVOKx9NhuLHR/YLKBPK9e9Rrc0LKdko1IoSxfPcFWb4uHWKb6Ne1r2e8stKBr6SY+tpUjb+ScmaDiyGAVgnnUygtGpZKRjovRRo/HAK0g2nJMniJC0QXv1j2cbJCi8dLHSj9tOVXS0uDLWLBZ9OO+GExDQPIc4Aj+/wkwjfEaDBLAnCCOZqXudWDdV3am0L4BRn+e8yE58VjGZvO1PuFAcn3Ky0y01+a5n9mGdYdnJbIEV7EzJgzRz90Ly8o4o1OTVfISaxIIsWgdlICGoMKIXGOd3JJ8vpyfba91aoEtXsKpZzuBTLbWDx81WzFwcBaHV7HR/7iBvPxhM6B4fn2aORha9q03o4ztPKnHkcbAFzGxg1qXFovNdHgiLU+C3tNHc3mmyjD1mEFAY/zdrM9Ws6uR1qmH4NGjTKNQrgFs67eg977LUHXFTV2Y4rGQmj2t9i+eJbapaV3j5d1QY3w+LAhmMiDUpbccczA1qBO9hXKucAIcfIH52cpGItq4bVvyU/Ts+lm2+V/Rja3IXHFAocC80qZq3o+/B6H+Lt2vlqKcZo6zd3mkSPVAlXoAVVrmy29SaUBfdLJ2uHByGZ/+58rSrpyjKRleDbks2ZmqwdOM90Ax7YGfDSB6ZebY3hDSgFPpM+7FgEDs6V2hU+5xYoYSg//y7vqeDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(30864003)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(54906003)(316002)(478600001)(66476007)(6496006)(8676002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mnuUre2PDTTYBBkEUAMi5SV53nqNEtqmO7HHv/8jWfim7ATmqpMzyIR32Pj4?=
 =?us-ascii?Q?aeL8y3hM7Z860mixpz2ijBbqG41N/s59l24LLVxoCJopNmJPie0K8BUAEzeA?=
 =?us-ascii?Q?PbpKYZE6NdrZ9zSfgXBtafdscSV9Ysd1SsHmeuP9R1BgEflMXG3vHxYGJmsd?=
 =?us-ascii?Q?ECNCBHY6qCVK1K2+p23BLF/nSWrFG5dsjKkMCSPnmTw5mfjyix8g9ypb2NOw?=
 =?us-ascii?Q?QI1vZ2MqQgHImMFP6q/vvoPjHA0LvE6UIOzQ0iuRwMJ0/zXvm8p1L3ZX9JX2?=
 =?us-ascii?Q?MnBiEky/3i7owfTPQyOlQmUgwsxYX4W2Sn5bSCMpklwrHa8g8O/b3pnBt00+?=
 =?us-ascii?Q?ob+jtALVrr4aSCaezya158V6MKn7g50yIsm+SZAm2t5FFpygZkJ75aASoUO9?=
 =?us-ascii?Q?3Mc9e0lQNfBNw5AF+PeTvgHxVDB9qeBeK5tzwBnO8uQ4LkP8xusRzPbdur38?=
 =?us-ascii?Q?jqzMZ1y4yE885DMYOW0rPEVpIXEeLKBjFR2MIYvPQ5zSdvrZVgK7r8iiyfC3?=
 =?us-ascii?Q?PFzyAjYjbV07HvkUNMQ9gP91M3aA3RjsvPiJpfPgow0ekHXuEOK//S0dHKlp?=
 =?us-ascii?Q?t9GIv+cyT7baZvqqc+1shC3jaAOdNFQZiRuDhbna0vHxouqFg/UIidgiUmaY?=
 =?us-ascii?Q?VZ8RugkXKEwUbylqj2gJ/Mt5nLVZe4hvqkghtBecmWk7k+X6YXMdYSYFZp2t?=
 =?us-ascii?Q?rcR+a771+Vy//PkF3c4DzEQGummhVuxhswcJZnpY2QVpuYglSyxAqY3AcjHR?=
 =?us-ascii?Q?LlAaS8VGeQZ/SbU1aditvdizmjgJ87PQ6b0aMkS6EeUDuneb8cVSdx+TAv2V?=
 =?us-ascii?Q?lTz94AwJyiswjDMx/8faE9z1adadT4Q1MQEAF6lRa4kgvuz8vj90cutnzrZ+?=
 =?us-ascii?Q?2Yqc7DKzRRlcc7C12v21HJNnM4g5FuRvWTpdNN7pTXCZQjFRlBPPxCARDxn+?=
 =?us-ascii?Q?MmJW3g3R4lvl+SgYdm10Wty6oDtN9ib8xMSyJflr9X1O3sjFfrM92WR/q/QH?=
 =?us-ascii?Q?6aY/bgPW3qyYEDQS8MPbI58s4XfB+NwyjEpmLkwora437sbcJItw/4+aWo2T?=
 =?us-ascii?Q?3HJDPgD8Wf74EI/cvqnKckRX1BXa/RyW2U64kDSXOi+AK3Zt2noXZALrD8o9?=
 =?us-ascii?Q?p+GS0qHhnlFhdSU6vJEAI5IyodlwXScE0AwAniy5tl+ltXvQ3HiX+zpMkHmy?=
 =?us-ascii?Q?yKX8RqLVcEVDyVOzc8hz8yWZXWb8jzwCPYs8VeE20viFYRdqtLQ6LLsI15lx?=
 =?us-ascii?Q?hMBLekBElsPcz5xWq81wglhly03R63TAcj/l+ZVMmMDwq+JaL0kmOnVjOCUO?=
 =?us-ascii?Q?k/fq3wC4UEnHdh2G8WRNNdfr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d21f81a-064f-4484-f037-08d935671378
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:18:27.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LusAi5R6v2r6mdg6jlhnopFXqPUKshZY9HMUaN/FrsnJy5b2Q2hl/RBX/+AaZt3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The internal.h file is renamed to s390x-internal.h, because of the
risk of collision with other files with the same name.

After the reshuffling, update MAINTAINERS accordingly.
Make use of the new directory:

target/s390x/tcg/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS                                   |  2 +-
 hw/s390x/tod-tcg.c                            |  2 +-
 include/hw/s390x/tod.h                        |  2 +-
 target/s390x/arch_dump.c                      |  2 +-
 target/s390x/cpu.c                            |  2 +-
 target/s390x/cpu_models.c                     |  2 +-
 target/s390x/diag.c                           |  2 +-
 target/s390x/gdbstub.c                        |  2 +-
 target/s390x/helper.c                         |  2 +-
 target/s390x/interrupt.c                      |  4 ++--
 target/s390x/ioinst.c                         |  2 +-
 target/s390x/kvm.c                            |  2 +-
 target/s390x/machine.c                        |  4 ++--
 target/s390x/meson.build                      | 17 ++---------------
 target/s390x/mmu_helper.c                     |  2 +-
 target/s390x/{internal.h =3D> s390x-internal.h} |  6 ++++++
 target/s390x/sigp.c                           |  2 +-
 target/s390x/{ =3D> tcg}/cc_helper.c            |  2 +-
 target/s390x/{ =3D> tcg}/crypto_helper.c        |  2 +-
 target/s390x/{ =3D> tcg}/excp_helper.c          |  2 +-
 target/s390x/{ =3D> tcg}/fpu_helper.c           |  2 +-
 target/s390x/{ =3D> tcg}/insn-data.def          |  0
 target/s390x/{ =3D> tcg}/insn-format.def        |  0
 target/s390x/{ =3D> tcg}/int_helper.c           |  2 +-
 target/s390x/{ =3D> tcg}/mem_helper.c           |  2 +-
 target/s390x/tcg/meson.build                  | 14 ++++++++++++++
 target/s390x/{ =3D> tcg}/misc_helper.c          |  2 +-
 target/s390x/{ =3D> tcg}/s390-tod.h             |  0
 target/s390x/{ =3D> tcg}/tcg_s390x.h            |  0
 target/s390x/{ =3D> tcg}/translate.c            |  2 +-
 target/s390x/{ =3D> tcg}/translate_vx.c.inc     |  0
 target/s390x/{ =3D> tcg}/vec.h                  |  0
 target/s390x/{ =3D> tcg}/vec_fpu_helper.c       |  2 +-
 target/s390x/{ =3D> tcg}/vec_helper.c           |  2 +-
 target/s390x/{ =3D> tcg}/vec_int_helper.c       |  0
 target/s390x/{ =3D> tcg}/vec_string_helper.c    |  2 +-
 36 files changed, 50 insertions(+), 43 deletions(-)
 rename target/s390x/{internal.h =3D> s390x-internal.h} (98%)
 rename target/s390x/{ =3D> tcg}/cc_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/crypto_helper.c (98%)
 rename target/s390x/{ =3D> tcg}/excp_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/fpu_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/insn-data.def (100%)
 rename target/s390x/{ =3D> tcg}/insn-format.def (100%)
 rename target/s390x/{ =3D> tcg}/int_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/mem_helper.c (99%)
 create mode 100644 target/s390x/tcg/meson.build
 rename target/s390x/{ =3D> tcg}/misc_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/s390-tod.h (100%)
 rename target/s390x/{ =3D> tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ =3D> tcg}/translate.c (99%)
 rename target/s390x/{ =3D> tcg}/translate_vx.c.inc (100%)
 rename target/s390x/{ =3D> tcg}/vec.h (100%)
 rename target/s390x/{ =3D> tcg}/vec_fpu_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/vec_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/vec_string_helper.c (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f536..d05dcc22e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -294,7 +294,7 @@ S390 TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
-F: target/s390x/
+F: target/s390x/tcg
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
index e91b9590f5..4b3e65050a 100644
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
index 050dcf2d42..4ff8cba7e5 100644
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
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index d6fce5ff1e..1dbe2973f4 100644
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
index 7678994feb..2254873cef 100644
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
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 9b4d08f2be..734f0c62de 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -10,12 +10,12 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "kvm_s390x.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "hw/s390x/ioinst.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/s390_flic.h"
 #endif
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
index 4fb3bbfef5..2a22cc69f6 100644
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
index 5b4e82f1ab..81a8a7ff99 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -16,10 +16,10 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
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
similarity index 98%
rename from target/s390x/internal.h
rename to target/s390x/s390x-internal.h
index 11515bb617..171ecd59fb 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/s390x-internal.h
@@ -244,6 +244,12 @@ void load_psw(CPUS390XState *env, uint64_t mask, uint6=
4_t addr);
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
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c604f17710..320dddbae2 100644
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
diff --git a/target/s390x/cc_helper.c b/target/s390x/tcg/cc_helper.c
similarity index 99%
rename from target/s390x/cc_helper.c
rename to target/s390x/tcg/cc_helper.c
index e7039d0d18..f0663f7a3e 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/crypto_helper.c b/target/s390x/tcg/crypto_helper.=
c
similarity index 98%
rename from target/s390x/crypto_helper.c
rename to target/s390x/tcg/crypto_helper.c
index ff3fbc3950..138d9e7ad9 100644
--- a/target/s390x/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -12,7 +12,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/excp_helper.c b/target/s390x/tcg/excp_helper.c
similarity index 99%
rename from target/s390x/excp_helper.c
rename to target/s390x/tcg/excp_helper.c
index 20625c2c8f..b675536aec 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
similarity index 99%
rename from target/s390x/fpu_helper.c
rename to target/s390x/tcg/fpu_helper.c
index f155bc048c..bc89ef7cc8 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
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
similarity index 99%
rename from target/s390x/int_helper.c
rename to target/s390x/tcg/int_helper.c
index 658507dd6d..954542388a 100644
--- a/target/s390x/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
diff --git a/target/s390x/mem_helper.c b/target/s390x/tcg/mem_helper.c
similarity index 99%
rename from target/s390x/mem_helper.c
rename to target/s390x/tcg/mem_helper.c
index f6a7d29273..9bae13ecf0 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
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
similarity index 99%
rename from target/s390x/misc_helper.c
rename to target/s390x/tcg/misc_helper.c
index 7ea90d414a..33e6999e15 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -22,7 +22,7 @@
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/s390-tod.h b/target/s390x/tcg/s390-tod.h
similarity index 100%
rename from target/s390x/s390-tod.h
rename to target/s390x/tcg/s390-tod.h
diff --git a/target/s390x/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
similarity index 100%
rename from target/s390x/tcg_s390x.h
rename to target/s390x/tcg/tcg_s390x.h
diff --git a/target/s390x/translate.c b/target/s390x/tcg/translate.c
similarity index 99%
rename from target/s390x/translate.c
rename to target/s390x/tcg/translate.c
index e243624d2a..75ec915cf8 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -30,7 +30,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
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
similarity index 99%
rename from target/s390x/vec_fpu_helper.c
rename to target/s390x/tcg/vec_fpu_helper.c
index c1564e819b..850fac721e 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg_s390x.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_helper.c b/target/s390x/tcg/vec_helper.c
similarity index 99%
rename from target/s390x/vec_helper.c
rename to target/s390x/tcg/vec_helper.c
index 986e7cc825..ddd0a8be5b 100644
--- a/target/s390x/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -11,7 +11,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/tcg/vec_int_helpe=
r.c
similarity index 100%
rename from target/s390x/vec_int_helper.c
rename to target/s390x/tcg/vec_int_helper.c
diff --git a/target/s390x/vec_string_helper.c b/target/s390x/tcg/vec_string=
_helper.c
similarity index 99%
rename from target/s390x/vec_string_helper.c
rename to target/s390x/tcg/vec_string_helper.c
index c516c0ceeb..ac315eb095 100644
--- a/target/s390x/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
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


