Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67967355703
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:53:15 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTn4s-0002OZ-2V
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Filip.Vidojevic@Syrmia.com>)
 id 1lTlvW-0005Vq-Kl
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:39:30 -0400
Received: from mail-eopbgr30134.outbound.protection.outlook.com
 ([40.107.3.134]:48959 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Filip.Vidojevic@Syrmia.com>)
 id 1lTlvS-0007Yq-M7
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:39:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irLmAKNlCzrswJB3qosPH2ueT0tiFAJPq7UWyex08hxzv1GPU9vGBhFc/cPhtdJbSlmhpQzv24rCvX71aakd8ZE+BQuJWY2S2/R48G8hSXghQfGTRG8eaIPlJWqDKR1xRi9T6CcSln6ahwCwL3lIVzVvHA2auBPoQ/maCjhG9jMXQXJC+mPxRJ95l7AtyP/dstH7z89Vc3/rhbWruedOynhPS4WJ5L2bsP3ad1H81Q3YMOpOPuxT+gXGVe/SP7yi+c9PnUoRke1Ceoy0wRpxbr/yAOAXQ5FfgynGC+71b3T3p8uQgkfuNQpzkCjmClHIVenk4MyfIxxJE5+l0Z6ufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZtvvshIImz1RViHu0mIuqUpic5qhHAzr9LCnghBh8A=;
 b=ToN/LxQd9ii7B1vz0sxQ9LfniQFm4klUStEPst7dIZ8InIVj5NK2N2Wh/fIezhu9xoJSmZsrM46UTAZp4TXIM2NI8vORveCaYD2lTDPnhRnqTgWrmslVyh5t6AcflrGWO6zf5KaFZkfPm/drHFfZ4eKOr2HySJMFSeFUPJtY0B7IrYg088qCkJNIZCdh2ZsCHiwWSLE6gPj6zr2d34GFzcE8EYdw9Ktbn0x7u7MAyMphKgww48THvUvlJ8kJq0tdVqLGAy4WL1RN2hhyKc151jNn9iH2xgrym33eCKKg9l4++wsBlNaU3nbusvuuJO4Y6zf0LgzaV0S0i8HqDIhCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZtvvshIImz1RViHu0mIuqUpic5qhHAzr9LCnghBh8A=;
 b=AxQnVjoFcuEPiMFeXidZSslMP+VtT6Nl6AxBAQSG8eURMOedJJKX2CqmVMivvx6iJgv9aS0T3p3zlP1pHJo9hRHHoJVUkRn2j0yAVvQoNlWtmJwIcs6HAmBxefn5uxzVmKQF0be0KBPi5yCtVEo6EInLB98zGhZ3Bl+SoOOTftU=
Authentication-Results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=Syrmia.com;
Received: from AM5PR03MB3027.eurprd03.prod.outlook.com (2603:10a6:206:1a::13)
 by AS8PR03MB7334.eurprd03.prod.outlook.com (2603:10a6:20b:2e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 13:24:19 +0000
Received: from AM5PR03MB3027.eurprd03.prod.outlook.com
 ([fe80::2044:79cc:3354:79d6]) by AM5PR03MB3027.eurprd03.prod.outlook.com
 ([fe80::2044:79cc:3354:79d6%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 13:24:19 +0000
From: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
To: f4bug@amsat.org,
	qemu-devel@nongnu.org
Subject: [PATCH] Revert "target/mips: Deprecate nanoMIPS ISA"
Date: Tue,  6 Apr 2021 15:23:44 +0200
Message-Id: <20210406132344.21476-1-Filip.Vidojevic@Syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.112.22.24]
X-ClientProxiedBy: VI1P194CA0056.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::45) To AM5PR03MB3027.eurprd03.prod.outlook.com
 (2603:10a6:206:1a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.112.22.24) by
 VI1P194CA0056.EURP194.PROD.OUTLOOK.COM (2603:10a6:803:3c::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 13:24:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 144cec3d-0e8c-4c0a-aa1d-08d8f8ff48de
X-MS-TrafficTypeDiagnostic: AS8PR03MB7334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR03MB7334ADF97E6362EBA4B55A739B769@AS8PR03MB7334.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxtMXKCKem62Luep+AoKBvh1qcX5FOaF9YIqUnd9Lmr8fpm/JK2Lj058XtwyrGHmSBYKXvIbGQ/2e7cQ33GziI6NUJNM6jJrL5I8LETYr5MORmCn2kIz7YSTd4S9fUuvQwpdy0yrnsFg3ylomN46vp9i69tt9U7FWeknHueGtNbZ3ZMv05rn514FE6WDmZpzbwNHUABmUBB3C6GD3OG7JMexOOsxNmaNOwIltA30IqQ5zcUs9wfuI70ab5iOuYCa6gk44A2T+U3ACh4pmPK99qyM0oaAdecuuJIgW7BoXPOZPTIXH5G1tlcNbWHYQACaOsZEqo46/wjqOMQyaB7xtmyUgxEWitnazoXRsPtfQ79Mf0MwumrteOcDvHPlkTrUAhkJJBbKiJKtw4F/ZEupdTDZVeE4F0LqpMCP7o8AiktGcnSMASWRf3d7NXejB9fSl14E+mSnmw2Zh7z5XdfvDUPA2cuaLQRUfDyZ3Vs02+M6nYZSr5+Bc4vuZ5oEgmJxLPHGnWHqqYUSBEF9vRUwBgzQkwye/KfoyxxpQz+NaH0iPXRHYHEk1PjJ0ITxCWGZZRXWmnWMCdBoLdJS9NZW9G30R5mi4haFby/GSuae6TMqSX/ONxI1OthdjQ2rFsXTy44Vn0dITEP5/JSSGJ2RX9MKXzQaRq2RfQLR0FPmytR8d5yaX+czVVtFDFJdoaACtuhPTbaXnEwmZX7mhsRg1SOZ97F/I78Er4xhwJEt7da5/RgKOcAiEF2Qx99ECHL2VtseJ0vv/N+95DXSFuxT3oFSCLbHo1B1/yoFQEdR8os=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM5PR03MB3027.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(376002)(136003)(346002)(396003)(8676002)(6486002)(4326008)(478600001)(956004)(52116002)(5660300002)(2906002)(30864003)(38350700001)(6666004)(36756003)(6512007)(83380400001)(1076003)(107886003)(2616005)(66946007)(69590400012)(966005)(86362001)(66476007)(316002)(186003)(26005)(6506007)(38100700001)(8936002)(16526019)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fxpy0POZPwkJfVix7pcbKkk1POVgXMdzyGf2IJ1Ybm39qCXk0N5nUIR9LxgS?=
 =?us-ascii?Q?OqeQWPT0juSESJ5ZCM9EMEUX2y7gsk6ugvted3l2Z+Vu5f7s7tv9hnic+9J8?=
 =?us-ascii?Q?gXQ/7qYn4v29dRzNJvodOe8rG32EwwMyU5ta/487t1y9N/K+GGMo/B5+JyEz?=
 =?us-ascii?Q?25/gZvVJ/u+/Ez+uBrsQctEqpOF8au/vresl0VaKCAM8hAbqWxFXRistL5eo?=
 =?us-ascii?Q?D6wqWprOVoBeiZUgmsbc7a6tdU6kMS+i1LotKXHOXw5H6e6kNu2OIZWFZAF0?=
 =?us-ascii?Q?lgDTbI0aX6e+N+mXQTfBohgRUPeSW3TWTeRJzOEB99qKDP63gEU01eKBHhi7?=
 =?us-ascii?Q?A8NSPG9uT4Gd2x09x2YD7Le1W+ubtcmIa1nOU1lZl5FWcEJ9VSLfcqRCPc+v?=
 =?us-ascii?Q?bY3DLKYh2woMvaj5PjHOgYrO2i8zOVtkss6nQhXM86pPG8EyrKHnf03rXfQF?=
 =?us-ascii?Q?3UMJnPv4S5yvf/H3jKCByRNPUqI2acjtpLYnhS9FbtK6UKVTPk7z88Byd4/F?=
 =?us-ascii?Q?90vZaypiVdFB2uSC8G9qQ1A+BENRAKF1YtcGQiHj53yFRXKLv/lZ3QCTVj0K?=
 =?us-ascii?Q?aNNi4lRtki5BOsSfx7byps2ITZ01i82Hcg2E9x4LCyB4SIXOFbecqjxah9ge?=
 =?us-ascii?Q?jJJI52kbVq4j9dGS6ffN8vOiM/+rVZLRz46bJLxsJJ211HQLD9VLbMCGlUOW?=
 =?us-ascii?Q?PDTkdUnh3clOAsaOy6q6V/mE0fmwhqYRWs86zJP6jkZoF4EDj7vNs1+VMNmL?=
 =?us-ascii?Q?c0/KDKgkv4leCHf2GCw0ab7wG9NrjpFWw/AEVo6Cfvr767GM1c+9DTnpCURk?=
 =?us-ascii?Q?FJNJtME3UcPvzK+qCaYk3VuhG/utEBW8WVJELJrgwpSetrW87OiauGh9XJ+z?=
 =?us-ascii?Q?GN5H+5N/PWafnw/YOb8Xt9mvSiqT2hcLfTKoWqz8IM0Bl1BrcVRtx6XfK1IT?=
 =?us-ascii?Q?A3RCTU8SqotSOoCHat5Z26S08DXmNreKcgAA985DQyqKh9VGE5se1BEUQA84?=
 =?us-ascii?Q?Uxe6xEM9SJE1bYAARfizdYlFQV8paa/MC+kFENl+VMBR/HgfRcfC7aj0qLtF?=
 =?us-ascii?Q?cUlRUTnqEPu+fTKCkpECuyeGMSDb+ik2xCoH2DhEvwUgwICU6Ehs0ApUg0mY?=
 =?us-ascii?Q?D9AAfn6YMfhqtiJtNAzkeHH0tLuwE7Eks7xHlQ2NsPfI0nV5gZw4X3TGj6T+?=
 =?us-ascii?Q?O5RrjWLKzkR6+l2yAepBrABhVr4H+qSnwHrAe8h0C0ETIYm59uzb0gpoOgs4?=
 =?us-ascii?Q?jTaTaHKket7tSjc6x1Iz7TeBc8h9Fjw5xEzx+0DHsIFY6fAV5fD8UMLG+qXa?=
 =?us-ascii?Q?GbXa53u+QLAEHnWLRklJoaer?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144cec3d-0e8c-4c0a-aa1d-08d8f8ff48de
X-MS-Exchange-CrossTenant-AuthSource: AM5PR03MB3027.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 13:24:19.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5wp/dPmyMvzz89c1HVdbE5eJ98QedmIrrAHPfz/fGQlYt+4kwmjk5MAR3D7jv7byoC/AfkA3UO+2ibia5sq/QH2JWJvW9OMrADIxWjOmWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7334
Received-SPF: pass client-ip=40.107.3.134;
 envelope-from=Filip.Vidojevic@Syrmia.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Apr 2021 10:51:44 -0400
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org, chenhuacai@kernel.org,
 aurelien@aurel32.net, Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NanoMIPS ISA is supported again, since mediaTek is taking over
nanoMIPS toolchain development (confirmed at
https://www.spinics.net/linux/fedora/libvir/msg217107.html).

New release of the toolchain can be found at
(https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01).

Reverting deprecation of nanoMIPS ISA requires following changes:
	MAINTAINERS: remove nanoMIPS ISA from orphaned ISAs
	deprecated.rst: remove nanoMIPS ISA from deprecated ISAs

Signed-off-by: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
---
 MAINTAINERS                |   4 -
 docs/system/deprecated.rst | 251 ++++++++++++++++++++++++++++++++++---
 2 files changed, 235 insertions(+), 20 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69003cdc3c..498dbf0ae4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -254,10 +254,6 @@ F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 K: ^Subject:.*(?i)mips
 
-MIPS TCG CPUs (nanoMIPS ISA)
-S: Orphan
-F: disas/nanomips.*
-
 Moxie TCG CPUs
 M: Anthony Green <green@moxielogic.com>
 S: Maintained
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae86252..88b35a43da 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -228,12 +228,20 @@ to build binaries for it.
 ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
 Models instead.
 
-MIPS ``I7200`` CPU Model (since 5.2)
-''''''''''''''''''''''''''''''''''''
+System emulator devices
+-----------------------
+
+``ide-drive`` (since 4.2)
+'''''''''''''''''''''''''
+
+The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
+'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
 
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
+``scsi-disk`` (since 4.2)
+'''''''''''''''''''''''''
+
+The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
+'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
 
 System emulator machines
 ------------------------
@@ -305,13 +313,6 @@ The ``ppc64abi32`` architecture has a number of issues which regularly
 trip up our CI testing and is suspected to be quite broken. For that
 reason the maintainers strongly suspect no one actually uses it.
 
-MIPS ``I7200`` CPU (since 5.2)
-''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 Related binaries
 ----------------
 
@@ -376,11 +377,229 @@ versions, aliases will point to newer CPU model versions
 depending on the machine type, so management software must
 resolve CPU model aliases before starting a virtual machine.
 
+
+Recently removed features
+=========================
+
+What follows is a record of recently removed, formerly deprecated
+features that serves as a record for users who have encountered
+trouble after a recent upgrade.
+
+System emulator command line arguments
+--------------------------------------
+
+``-net ...,name=``\ *name* (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''
+
+The ``name`` parameter of the ``-net`` option was a synonym
+for the ``id`` parameter, which should now be used instead.
+
+``-no-kvm`` (removed in 5.2)
+''''''''''''''''''''''''''''
+
+The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
+
+
+QEMU Machine Protocol (QMP) commands
+------------------------------------
+
+``block-dirty-bitmap-add`` "autoload" parameter (since 4.2.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The "autoload" parameter has been ignored since 2.12.0. All bitmaps
+are automatically loaded from qcow2 images.
+
+``cpu-add`` (removed in 5.2)
+''''''''''''''''''''''''''''
+
+Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
+documentation of ``query-hotpluggable-cpus`` for additional details.
+
+Human Monitor Protocol (HMP) commands
+-------------------------------------
+
+The ``hub_id`` parameter of ``hostfwd_add`` / ``hostfwd_remove`` (removed in 5.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``[hub_id name]`` parameter tuple of the 'hostfwd_add' and
+'hostfwd_remove' HMP commands has been replaced by ``netdev_id``.
+
+``cpu-add`` (removed in 5.2)
+''''''''''''''''''''''''''''
+
+Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
+documentation of ``query-hotpluggable-cpus`` for additional details.
+
 Guest Emulator ISAs
 -------------------
 
-nanoMIPS ISA
-''''''''''''
+RISC-V ISA privilege specification version 1.09.1 (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The RISC-V ISA privilege specification version 1.09.1 has been removed.
+QEMU supports both the newer version 1.10.0 and the ratified version 1.11.0, these
+should be used instead of the 1.09.1 version.
+
+System emulator CPUS
+--------------------
+
+KVM guest support on 32-bit Arm hosts (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Linux kernel has dropped support for allowing 32-bit Arm systems
+to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
+its support for this configuration and will remove it in a future version.
+Running 32-bit guests on a 64-bit Arm host remains supported.
+
+RISC-V ISA Specific CPUs (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''
+
+The RISC-V cpus with the ISA version in the CPU name have been removed. The
+four CPUs are: ``rv32gcsu-v1.9.1``, ``rv32gcsu-v1.10.0``, ``rv64gcsu-v1.9.1`` and
+``rv64gcsu-v1.10.0``. Instead the version can be specified via the CPU ``priv_spec``
+option when using the ``rv32`` or ``rv64`` CPUs.
+
+RISC-V no MMU CPUs (removed in 5.1)
+'''''''''''''''''''''''''''''''''''
+
+The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
+``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
+via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
+
+System emulator machines
+------------------------
+
+``spike_v1.9.1`` and ``spike_v1.10`` (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The version specific Spike machines have been removed in favour of the
+generic ``spike`` machine. If you need to specify an older version of the RISC-V
+spec you can use the ``-cpu rv64gcsu,priv_spec=v1.10.0`` command line argument.
+
+mips ``r4k`` platform (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''
+
+This machine type was very old and unmaintained. Users should use the ``malta``
+machine type instead.
+
+Related binaries
+----------------
+
+``qemu-nbd --partition`` (removed in 5.0)
+'''''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-nbd --partition $digit`` code (also spelled ``-P``)
+could only handle MBR partitions, and never correctly handled logical
+partitions beyond partition 5.  Exporting a partition can still be
+done by utilizing the ``--image-opts`` option with a raw blockdev
+using the ``offset`` and ``size`` parameters layered on top of
+any other existing blockdev. For example, if partition 1 is 100MiB
+long starting at 1MiB, the old command::
+
+  qemu-nbd -t -P 1 -f qcow2 file.qcow2
+
+can be rewritten as::
+
+  qemu-nbd -t --image-opts driver=raw,offset=1M,size=100M,file.driver=qcow2,file.file.driver=file,file.file.filename=file.qcow2
+
+``qemu-img convert -n -o`` (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''
+
+All options specified in ``-o`` are image creation options, so
+they are now rejected when used with ``-n`` to skip image creation.
+
+
+``qemu-img create -b bad file $size`` (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+When creating an image with a backing file that could not be opened,
+``qemu-img create`` used to issue a warning about the failure but
+proceed with the image creation if an explicit size was provided.
+However, as the ``-u`` option exists for this purpose, it is safer to
+enforce that any failure to open the backing image (including if the
+backing file is missing or an incorrect format was specified) is an
+error when ``-u`` is not used.
+
+Command line options
+--------------------
+
+``-smp`` (invalid topologies) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies is removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+*sockets* * *cores* * *threads* = *maxcpus*.
+
+``-numa`` node (without memory specified) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Splitting RAM by default between NUMA nodes had the same issues as ``mem``
+parameter with the difference that the role of the user plays QEMU using
+implicit generic or board specific splitting rule.
+Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
+it's supported by used machine type) to define mapping explictly instead.
+Users of existing VMs, wishing to preserve the same RAM distribution, should
+configure it explicitly using ``-numa node,memdev`` options. Current RAM
+distribution can be retrieved using HMP command ``info numa`` and if separate
+memory devices (pc|nv-dimm) are present use ``info memory-device`` and subtract
+device memory from output of ``info numa``.
+
+``-numa node,mem=``\ *size* (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''
+
+The parameter ``mem`` of ``-numa node`` was used to assign a part of
+guest RAM to a NUMA node. But when using it, it's impossible to manage a specified
+RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
+so the guest ends up with the fake NUMA configuration with suboptiomal performance.
+However since 2014 there is an alternative way to assign RAM to a NUMA node
+using parameter ``memdev``, which does the same as ``mem`` and adds
+means to actually manage node RAM on the host side. Use parameter ``memdev``
+with *memory-backend-ram* backend as replacement for parameter ``mem``
+to achieve the same fake NUMA effect or a properly configured
+*memory-backend-file* backend to actually benefit from NUMA configuration.
+New machine versions (since 5.1) will not accept the option but it will still
+work with old machine types. User can check the QAPI schema to see if the legacy
+option is supported by looking at MachineInfo::numa-mem-supported property.
+
+``-mem-path`` fallback to RAM (removed in 5.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+If guest RAM allocation from file pointed by ``mem-path`` failed,
+QEMU was falling back to allocating from RAM, which might have resulted
+in unpredictable behavior since the backing file specified by the user
+as ignored. Currently, users are responsible for making sure the backing storage
+specified with ``-mem-path`` can actually provide the guest RAM configured with
+``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
+
+``-smp`` (invalid topologies) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies is removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+*sockets* * *cores* * *threads* = *maxcpus*.
+
+``-machine enforce-config-section=on|off`` (removed 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``enforce-config-section`` property was replaced by the
+``-global migration.send-configuration={on|off}`` option.
+
+Block devices
+-------------
+
+VXHS backend (removed in 5.1)
+'''''''''''''''''''''''''''''
 
-The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
-As it is hard to generate binaries for it, declare it deprecated.
+The VXHS code does not compile since v2.12.0. It was removed in 5.1.
-- 
2.25.1


