Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070173B745F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:32:08 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEmT-00057U-Dr
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEb6-0000jt-EX
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:20 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:21980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEb3-0003o5-Ci
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqI+zNKMQFLe2BIr5BybrJJnmrCvv5f06Zjp/CScFUY=;
 b=W0ggxPFGhXnKjLbaOkFpJn1PCEbKXi+dE6Iixk8kwBal/AzlSP8691px1nt5DHCFyDaXcT
 WVMbSYuunjYSt89qVfZ+vzWuwtt0RU4Nw9r6xPRjqFMCrvBZy4jb/WoV0rrungQ5gAJB14
 a7JkTJEOC6v1tfpgFI4wNqwP3ti5EcQ=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-wvTT9DfbO5afQMhYrmJUEA-1; Tue, 29 Jun 2021 16:20:15 +0200
X-MC-Unique: wvTT9DfbO5afQMhYrmJUEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/mY/+/U2v2+/adZrj4l1eijNZvqpjqtinI+j8OwvGf+0m6jTPpFeZV2BKxCq3aMenxW9p7Lv3fPWYC4Td2d3StJvM3r6MhFqtw3uvLWcnBDMAJEzB5M4Ak+jMvSyIaDZuh7tS3zU/USoKbULAjHk78gZ02xtKMqOive30+fEQCkNgQkkRDvEdvY9jVGsPTCPZV4vi4aNAU/jQ+aFb/bqspmJT6zhObbHMZ+iQw/YEKbL/HtG2m3c3sNJEzslzukrXD62zHxTwd42ANYVQSKa6Hu2kQzld7DfGekJqMHVV1ZHyUNdCStYOE7mMDCeMSu3aoZQp8V+XA9CD8kIyFKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr8a1bWkBqZHY8HLvos8AstBesZYYUOBSz5czgJRH30=;
 b=aFef+R/bigj0i1lCXYa7A6t7CYx3azojIH6NRHe0CXTy10QY2fGXIUj1hKCSgOgtIzZjCeQFT8MT3yUPEcOf1RdZEPaJmu1Eodi+5vWQ+cD+8DHHEIabn47as8jTPq/C5hoFD5zOY5kk8ZWhzwt4bM1KGcGGMEC5D4MQpsU0d3ESyIga7NuQp8kUvm7Jqcz/wagfPjksYFDJbrmwnO8JJs8ny3ufSq8gnQZDi7VObfTbyWQs1bo1M2TvKK+Q9amc+vT00+3AnGbvF/aHO1fRzyX9kc6i+Pnh5t9MSOna6o5X90qNZ53reByQOyC+O5SO3WBzaPEKVOocA925/z/OLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6445.eurprd04.prod.outlook.com
 (2603:10a6:803:11c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 14:20:13 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:13 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 06/13] target/s390x: start moving TCG-only code to tcg/
Date: Tue, 29 Jun 2021 22:19:24 +0800
Message-ID: <20210629141931.4489-7-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:203:c8::22) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0017.apcprd03.prod.outlook.com (2603:1096:203:c8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.14 via Frontend Transport; Tue, 29 Jun 2021 14:20:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca05be0-b55e-467f-f687-08d93b0902a6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6445090FA3B4CE86EDD09159A0029@VE1PR04MB6445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7OzffjovdKmOwxPPm+BDFvK3WckGM/zIwSBi8p7smSdJNklNBv/zuMwuIi5dQEUyNYNgPRPZqonsKoExhVtYqiiOzSZ0FymQH0Fza5TqlItBDXobHRzAgrpTJw7Hh8K3y2+lKq8letMb2S2acfH/Nx9K9yUZ5NlSjKpLPKMon6ofQaHC6fPCsuVe8mi2A4XHZLNCYlMzUNSIynuSO7NRetILWeVnaLb+DaFDdm03LyWC6/2rIej9Kb46fvm4a23/WYGIWgaOT6g8KYVLuO5ppiiR8mMeTuH8CAsJTQVRDJup8CvRl0xRumHyqfDMyUlkf7UYJqJ+q+TLLct1ow5exUD4C8SOZM0VUfIz6IvB60PIgjH0dbe7oG+givj2ij8hFxwKyAIs+llOyEQgGsUZXU7O3GGHQ6CmiJqIdXEi69M9ObUCRjmfF50Gbo2XCjqIE5eY+ax7IwrBxEP/OcG83oEX1Y0HPCEMcjOHyywudmWx+Em7gAyT4N5L6PvSqbgW4kodyCR8gGU4djiFKO9hCeaTy499bG2eVeqjnT6JNcV5T7h9bb13YbVjEoaSwJk/uJq4qbniHi0vSqnCzuEQ2ROukePS+p42mp3kD9tNMZTuPUq0wQXpzGtsdnPQdIYOPBZ/ksNXv9atjb/qz/OKg8YYakBKPTfj2hXGNjf5sR9MYxt+Q+0BueWtRYIb6BWaxnwBy0f3J9xOZEF2tyiAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39850400004)(38100700002)(6496006)(86362001)(186003)(4326008)(2616005)(6666004)(956004)(16526019)(30864003)(8936002)(54906003)(8676002)(66946007)(26005)(36756003)(6486002)(1076003)(66556008)(66476007)(5660300002)(83380400001)(2906002)(316002)(478600001)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fIdg1+2P5oBO0/elB1cKwrhDzkiXFSsXCmxwtnU9bFa5/KHTJZQlmMGIXRm2?=
 =?us-ascii?Q?Z61j0O4C4IFNnWRM/lNkuXA9z+nw9Nk9aIZNzUHQG1sQCYH2LFU8GYRkjqyw?=
 =?us-ascii?Q?6LKNNWP2sVkWkH/X/M7rC4rF+16eyulqKraUuPKz1Q+4tgZsiya0WStWxx3v?=
 =?us-ascii?Q?ThzsjV0W4sIUGSKZ8mIoUBIzhgzbJY+nSWam7JLpaRBRDVRDJ+YJjNJAzfss?=
 =?us-ascii?Q?fGMrrhabncnteZPFRC3jOdSTDaOzLh4eio62+SUpDwks0yuS94GD9cTyBuvQ?=
 =?us-ascii?Q?X+u2gEpYjlNvfrUbu5cQz+i4L2vy+wfZkJsl3oS5eNmNUk+z9E42Dy6KiuYY?=
 =?us-ascii?Q?T+M7VrdwWkalKVlULIDiKWQCYi6oBEiJAzJtvTbnbEz4Ytpgy1hBLLLi2acJ?=
 =?us-ascii?Q?bL/tbZAFOX/OrgJwUFpctgDey/eLwu81JLlL/CsFzkbU/jZ0HJh2ZCCFB1tk?=
 =?us-ascii?Q?7cnrjz8ZVwJwP+MTVChTZAP/hskkBRagWuIRnOZvF6mCMP8BiuS9x/MP/HXZ?=
 =?us-ascii?Q?22oWhZk5vd+9ZpCWkSbRtUzzwemJ471o4HWUdPeueZ7AbbGjtUo6v+b4XExd?=
 =?us-ascii?Q?JVQZDuLRaLIofRQ8pvAAVVS9M2pCL87pI2Q9nwW4WvfiQXcP7P+o2/dyAl7I?=
 =?us-ascii?Q?hXI/eeUPPohd6rR8IeJZTAJ442VKtPW1fyDY5nTOLhA6taiETvO8sc6Ez76y?=
 =?us-ascii?Q?rF/GQTyl/3HPqDSFjMAwV8JKiM7oFjI2COQRoI0p2QymKCMxmVXvXMM6B6eA?=
 =?us-ascii?Q?FFo7PGbQceH3va4RXxKbtOPqKhbiNfarHYSCz/x6V4+Ds2enyceP6Ffzt3sP?=
 =?us-ascii?Q?dWnGaSbcAp/5ulMmpJZ9P4J3nyxc01q/JG6hjN9d99BXSF/tla3FeM3m44Ui?=
 =?us-ascii?Q?ayAvbaHrX2XlQm3L+tjmU1bqGv/CQeCMuY/HY/KhzhWDMXn1sQFKDQ6DBzOA?=
 =?us-ascii?Q?PUxd/WVw8Pg6LD51W69Q4lLsE75FLD0PL2PyQCvnGSYELM1HRIHlDQRW3vPT?=
 =?us-ascii?Q?Sy0Q3vcwcRLShazsGukPq7GUqV0pjwg5AHqe9MWOVYw6O5+3swx5pVYdUGyz?=
 =?us-ascii?Q?lZreD/FXxnrA3CYC8EvzkivjpWxAhtS4p0bTuX1EBXV7Ifj1/RBekDf2c5ek?=
 =?us-ascii?Q?yf551lkI1aPWwAlQgEwec2zc8bK+u0dUswPUcOBti3xxZc9u9DTPHUPTjv9v?=
 =?us-ascii?Q?ps0a0Prtfip7XAHI1JyftN7cq3i7cKdsB3+xtG767baKy9RlFY4LClpyCPT+?=
 =?us-ascii?Q?TEocwwW8ZMK3W6eafDnqtXdZgAbfhQPUvmPNefZtUQ6LGYieIXeuMaDJXKC3?=
 =?us-ascii?Q?ozK/1+/KmUbzNjpyTUZB83Uh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca05be0-b55e-467f-f687-08d93b0902a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:13.6995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXk3UAuXN7cLBqooeO6OTacnAEj9RIvI1wSGxlRGUvei1H3QCvLzjOkBUXLRe/KC
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
 MAINTAINERS                                   |  1 +
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
 36 files changed, 50 insertions(+), 42 deletions(-)
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
index cfbf7ef79b..082ed2b643 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -296,6 +296,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
 F: target/s390x/
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
index 9256275376..17edd4d13b 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/s390x-internal.h
@@ -240,6 +240,12 @@ uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, u=
int64_t src, uint64_t dst,
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
diff --git a/target/s390x/cc_helper.c b/target/s390x/tcg/cc_helper.c
similarity index 99%
rename from target/s390x/cc_helper.c
rename to target/s390x/tcg/cc_helper.c
index e7a74d66dd..c2c96c3a3c 100644
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
index 9c361428c8..a61917d04f 100644
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
index 13af158748..04517fbf9c 100644
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
index 8e2b274547..1a77993471 100644
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
index 599bab06bd..ededf13cf0 100644
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


