Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2502B73EA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 02:55:53 +0100 (CET)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfChL-0003M4-OY
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 20:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kfCgT-0002wB-Sz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 20:54:58 -0500
Received: from mail-mw2nam10on2040.outbound.protection.outlook.com
 ([40.107.94.40]:42881 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kfCgQ-00058N-FW
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 20:54:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJUTT+6OVm0bqGUIfaffTa8IxwGRYnmFPWLdflsj8uPUdXMisKCZmVMtoW4nkDJW4623WIySX9y6HUENqBcxOJKmF8vriA3lxovjawPKiXvUNF3rNxPNhBlfZv3zpqAxXb4uIO3zQ1I/ZXGkJCr/14g/VsmxJIpuKCRtTzrdSPSsDPes0X9+GD1CkfhbhCh3isoGowWtjiGA11XX2t66YHdomKt8rMiz+gPajC+da0MPVmFMs35wBscgfesksNh2xpWenHMPu0MTZ5nvg3rtW7iejx6dzE1QV68gFMSxAdf1h+DayY4tRllFrY7Y7psGNOIzB2WE1YoLSiRBdejbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oLP35XftF6jbxwh31rzwldVudWJySdPd1Kgcfn6N50=;
 b=TFHXeiKC65BLx54N/Z4VwW9tkGAwThbkO7pWhp9T9jWZhlhgCPU1Lb9MnGWAmQpK1e7GSu6QgV4T4BxUtCKtLe5mjb3F5yYK7U+jVXYsmToj8+/qHIin30sjlCC77oTJmg7ixqXGYmMTcaFKSThZjjbgj/xJ+GBkn5JTZzY5dk2n1aQySPN1FLUrn84t2A0dtaPrN9mwoFxGPkAhFDSYUIbWDcguOlrwSiX4cSm85PeH+8S/fT8Dg8pSyAfvQy/wJZzg/pwJqhv/TSCFJa98ot/RJrFpcsIFyP+NqTu4CUNb7tNZYb2AVMxBhGGl6M3pTniJXyj21URw1MwBZdW5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oLP35XftF6jbxwh31rzwldVudWJySdPd1Kgcfn6N50=;
 b=hTLNBnGj3i2WFcNi1PFz09VaxGXJrH6A2WBDLWq+KSQJa2IneDLA8g4g8zsHwc6HFnWU+uRnuKqrIMWoTGI95SSzH0aCARSGCstUIAGezg7GCxEYPirNe1A5tfKDcsGRXkNSre1X0SygtK90BLg2PnbJtSA1RtYTni31tssfsIs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 01:39:47 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::6c15:785b:4e48:e2d4]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::6c15:785b:4e48:e2d4%8]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 01:39:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 5.2.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Nov 2020 19:39:38 -0600
Message-ID: <160566357871.119997.2119842704919437090@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.53.104]
X-ClientProxiedBy: SJ0PR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:334::14) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.53.104) by
 SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Wed, 18 Nov 2020 01:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f872fd2-1d76-4312-7ecf-08d88b62d4ff
X-MS-TrafficTypeDiagnostic: CH2PR12MB4054:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40542E969E7CFB59AE7E02E895E10@CH2PR12MB4054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6IRf0lmYpgk0y9e8R2NR/vPZyfZKYiPoY0sHuwzMdk5pgs/YAr8+eVlxJV+w6HvDzBlsQFlF7jNnoPpWvvm35ye8Nn1Jxz1KXcshAIqZaUwEyHre2/rwJA7gNmYN7Dzq8FRjlhodf6FtsmJwkpNGiqPS+Odxhdp/jww8uB0CFZle4/e1xQtCWrdrZ8p4O6R8aal34i3jCLk4B8UCfryXqQQ254FTqUX8GFujcVqlnb2LiznMoQki2yq9r0b32FjxBazwzynLFL+J/sG69Xm4pCmb+qJEn7l3u35B6xbdO8Dv46OYqthShdoCAuHw4kmig9npgvE4uompkhWYhxX4CU+ENV1SVsbdqSbOUEo2YVMg0DFb3fXUTyTJb0XiwQUkozaP5vv1vGY3BQWQ/pN6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(316002)(26005)(478600001)(6486002)(186003)(16526019)(4326008)(8936002)(966005)(2906002)(956004)(33716001)(9686003)(83380400001)(8676002)(30864003)(66946007)(66476007)(66556008)(44832011)(6666004)(6916009)(5660300002)(52116002)(6496006)(86362001)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 82JYTui2Vy1xAqeNc/Qvsw1tk9v+vgyiSROqdTxn/2lSb66lNc+fpPK2yVvEqL5d/vBJeFNmrwHFO8uZPmPCtOM9qYFgWVyOIEPTTqftY1gRGCAH2ELFuKdWrtLcveu3FIKe//IKr4nMkZiaTxv/6CoA6FmRTzvT+eWDQHe3YsmSKtT0+iX97SKzuiw97evWgHATboIWop3w3GCNzVEmIUtGpTfzZrLWw4eMhgoKPqsvkdr52mYTMe8uu+YociIfFVnrt1RbZvuCUiFAg8uf6oiwAFYs45FQhm6cmxzyFqQnL7KQhloBsC/vYKRGT+ELFubjIV+tdnXZTtwqOGio1SMB8J66QuqqpzEhfRfMsLGhl5NZa7Tv2qPHNsrWNa6kOuBmniiVMWjR8ypl0dcI8a6wj3fejwOFNRDmaewHO7o+qDrpap5ds3qjpUogEPuT9FN6nlurL8RDpVKr9eEV0iQa2fk4v7s74VRQGewZ33NkS91v5qmKnuFfbycTqkYqcY6vootDDbI+Fw5FICs0xRkNwYkE7FJArimiaiT4lXl+aEfrg/HQ81+Wxvnz9wYmmMT7ESFo02UfwUvVrP+ai6CI+7kkF2FLrvQcB7bCYTfWhFB51gwKG4c8S6jCQyAiduW2cYYrTVfxrHUfwQCNMA9pBm5LwBsvPFI4BAedmMxEvuR2H5gwVJYyS0djatkws61+HYazaz8g9hyGvp4oUgfTAnvSuZVgR/CJ8LpzaYzstH8Nm0rjVioKkLAaJSwHnW+HxhwoJM8WpjfTdM3vYJWD0G2ZBgtAi6LNWpMMkNF1QTfUb6JxxEEnz0NJ8ziIxF+9Ri5YgZiTiCWG5JGssnkJCkeMKKEOeXwD1RdDtyxlhU8FoYPt3J/WEfxktTUf+DMmUgcI3hhxVECFsjGc3Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f872fd2-1d76-4312-7ecf-08d88b62d4ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 01:39:47.2223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNwGVmsXs1e5LAHV2MZjahBycJAVChD8zR6q2EQbTUol3N3aw3SCUSGjwbEtOCnuFUjJvPKsOCL/Z5DyYJZumw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054
Received-SPF: none client-ip=40.107.94.40; envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 20:54:52
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
third release candidate for the QEMU 5.2 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-5.2.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-5.2.0-rc2.tar.xz.sig

A note from the maintainer:

  Note that QEMU has switched build systems so you will need
  to install ninja to compile it. See the "Build Information"
  section of the Changelog for more information about this change.

You can help improve the quality of the QEMU 5.2 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/5.2

Please add entries to the ChangeLog for the 5.2 release below:

  http://wiki.qemu.org/ChangeLog/5.2

Thank you to everyone involved!

Changes since rc1:

66a300a107: Update version for v5.2.0-rc2 release (Peter Maydell)
922d42bb0d: json: Fix a memleak in parse_pair() (Alex Chen)
5351f4075d: linux-user,netlink: add IFLA_BRPORT_MRP_RING_OPEN, IFLA_BRPORT_=
MRP_IN_OPEN (Laurent Vivier)
f536612dc1: linux-user,netlink: fix message translation with ip command (La=
urent Vivier)
ab135622cf: tmp105: Correct handling of temperature limit checks (Peter May=
dell)
e1919889ef: hw/misc/tmp105: reset the T_low and T_High registers (Peter May=
dell)
13ceae6663: configure: Make "does libgio work" test pull in some actual fun=
ctions (Peter Maydell)
6d7ccc576d: util/cutils: Fix Coverity array overrun in freq_to_str() (Phili=
ppe Mathieu-Daud=C3=A9)
ea2d7fcf35: register: Remove unnecessary NULL check (Alistair Francis)
7b0263cb14: target/openrisc: Remove dead code attempting to check "is timer=
 disabled" (Peter Maydell)
019294db68: hw/input/ps2.c: Remove remnants of printf debug (Peter Maydell)
63192565f9: exynos: Fix bad printf format specifiers (Alex Chen)
3362c56835: hw/arm/virt: ARM_VIRT must select ARM_GIC (Andrew Jones)
c61c644f59: iotests/081: Test rewrite-corrupted without WRITE (Max Reitz)
55f2c014d7: iotests/081: Filter image format after testdir (Max Reitz)
9ca5b0e842: quorum: Require WRITE perm with rewrite-corrupted (Max Reitz)
bd89f93603: io_uring: do not use pointer after free (Paolo Bonzini)
ece4fa9152: file-posix: allow -EBUSY errors during write zeros on raw block=
 devices (Maxim Levitsky)
5aaabf9161: iotests: Replace deprecated ConfigParser.readfp() (Kevin Wolf)
6deb20f668: char-stdio: Fix QMP default for 'signal' (Kevin Wolf)
575094b786: hw/sd: Fix 2 GiB card CSD register values (Bin Meng)
46b42f715d: max111x: put it into the 'misc' category (Gan Qixin)
84aab60c12: nand: put it into the 'storage' category (Gan Qixin)
be3701eae3: ads7846: put it into the 'input' category (Gan Qixin)
1352711561: ssd0323: put it into the 'display' category (Gan Qixin)
91010f0407: vhost-user-blk/scsi: Fix broken error handling for socket call =
(AlexChen)
5fd6921ccc: contrib/libvhost-user: Fix bad printf format specifiers (AlexCh=
en)
ca905bec44: gitlab-ci: Use $CI_REGISTRY instead of hard-coding registry.git=
lab.com (Rebecca Cran)
f25c7ca0ce: target/microblaze: Fix possible array out of bounds in mmu_writ=
e() (AlexChen)
844d35b9c2: tests/vm: update NetBSD to 9.1 (Brad Smith)
9fc33bf4e1: tests/vm: Add Haiku test based on their vagrant images (Alexand=
er von Gluck IV)
ded5d78c1e: configure: Add a proper check for sys/ioccom.h and use it in tp=
m_ioctl.h (Thomas Huth)
7000a12e08: configure: Do not build pc-bios/optionrom on Haiku (Thomas Huth=
)
cde9925362: configure: Fix the _BSD_SOURCE define for the Haiku build (Thom=
as Huth)
949eaaad53: qemu/bswap: Remove unused qemu_bswap_len() (Philippe Mathieu-Da=
ud=C3=A9)
2f3c1fd396: iotests: Replace deprecated ConfigParser.readfp() (Kevin Wolf)
c0b21f2e22: nbd: Silence Coverity false positive (Eric Blake)
1370d61ae3: memory: Skip dirty tracking for un-migratable memory regions (Z=
enghui Yu)
42ccce1981: target/i386: avoid theoretical leak on MCE injection (Paolo Bon=
zini)
3b12a7fd39: scsi-disk: convert more errno values back to SCSI statuses (Pao=
lo Bonzini)
b430b51395: util/vfio-helpers.c: Use ram_block_discard_disable() in qemu_vf=
io_open_pci() (David Hildenbrand)
2654ace151: kvm/i386: Set proper nested state format for SVM (Tom Lendacky)
a8aa94b5f8: qga: update schema for guest-get-disks 'dependents' field (Mich=
ael Roth)
7025111a19: .gitlab-ci.d/check-patch: tweak output for CI logs (Alex Benn=
=C3=A9e)
b48580ad92: tests/acceptance: Disable Spartan-3A DSP 1800A test (Philippe M=
athieu-Daud=C3=A9)
811c74fb65: hw/i386/acpi-build: Fix maybe-uninitialized error when ACPI hot=
plug off (Philippe Mathieu-Daud=C3=A9)
4bdccdec70: accel/stubs: drop unused cpu.h include (Alex Benn=C3=A9e)
d67ef04cb8: stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub (Al=
ex Benn=C3=A9e)
97d351b476: include/hw/xen.h: drop superfluous struct (Alex Benn=C3=A9e)
0c3e41d408: meson.build: fix building of Xen support for aarch64 (Alex Benn=
=C3=A9e)
9cd7dde073: plugins: Fix two resource leaks in setup_socket() (Alex Chen)
dbb864ba4f: plugins: Fix resource leak in connect_socket() (Alex Chen)
c590fe3aa2: xhci: move sanity checks (Gerd Hoffmann)
22abfc96af: xhci: fix guest triggerable assert (Gerd Hoffmann)
af06a0265e: usb-storage: fill csw on cancel (Gerd Hoffmann)
e315bfd1ba: usb-storage: use bool for removable property (Gerd Hoffmann)
51d4e4228d: usb-storage: add commandlog property (Gerd Hoffmann)
d0ccb3922d: usb-storage: switch trace events (Gerd Hoffmann)
61f3c91a67: nomaintainer: Fix Lesser GPL version number (Chetan Pant)
8cbff3c1e8: test: Fix LGPL information in the file headers (Gan Qixin)
6a2cd9570e: tests/acceptance: Fix LGPL information in the file headers (Gan=
 Qixin)
3a645d364c: tests/migration: Fix LGPL information in the file headers (Gan =
Qixin)
5650b5497e: sparc tcg cpus: Fix Lesser GPL version number (Chetan Pant)
7cd2a9fad7: e1000e: Fix Lesser GPL version number (Chetan Pant)
8af82b8e81: x86 hvf cpus: Fix Lesser GPL version number (Chetan Pant)
f1e5e2ee16: nvdimm: Fix Lesser GPL version number (Chetan Pant)
c36678b439: w32: Fix Lesser GPL version number (Chetan Pant)
eac2fce957: tpm: Fix Lesser GPL version number (Chetan Pant)
d6ea423635: overall/alpha tcg cpus|hppa: Fix Lesser GPL version number (Che=
tan Pant)
b4424aab3c: overall usermode...: Fix Lesser GPL version number (Chetan Pant=
)
ef19b50d93: migration: Fix Lesser GPL version number (Chetan Pant)
3564a91909: parallel nor flash: Fix Lesser GPL version number (Chetan Pant)
50f57e09fd: arm tcg cpus: Fix Lesser GPL version number (Chetan Pant)
d9ff33ada7: x86 tcg cpus: Fix Lesser GPL version number (Chetan Pant)
1c79145f12: linux user: Fix Lesser GPL version number (Chetan Pant)
bee4197135: usb: Fix Lesser GPL version number (Chetan Pant)
eb85394fe7: tricore tcg cpus: Fix Lesser GPL version number (Chetan Pant)
f08dddb366: xtensa tcg cpus: Fix Lesser GPL version number (Chetan Pant)
c30f26223d: prep: Fix Lesser GPL version number (Chetan Pant)
ee45203646: microblaze tcg cpus: Fix Lesser GPL version number (Chetan Pant=
)
bf1b52d199: cris tcg cpus: Fix Lesser GPL version number (Chetan Pant)
6bd039cdbe: powerpc tcg: Fix Lesser GPL version number (Chetan Pant)
f70c59668c: non-virt: Fix Lesser GPL version number (Chetan Pant)
07e6f009a0: semihosting: Fix Lesser GPL version number (Chetan Pant)
deef3d2568: intc/ibex_plic: Ensure we don't loose interrupts (Alistair Fran=
cis)
3a129aea81: intc/ibex_plic: Fix some typos in the comments (Alistair Franci=
s)
e7cff9c68d: hmp: Pass monitor to mon_get_cpu_env() (Kevin Wolf)
43cf067ff8: hmp: Pass monitor to MonitorDef.get_value() (Kevin Wolf)
2fc5d01bb4: hmp: Pass monitor to mon_get_cpu() (Kevin Wolf)
172bc8520d: xhci: fix nec-usb-xhci properties (Gerd Hoffmann)
e016a844dd: hw/display/cirrus_vga: Fix hexadecimal format string specifier =
(Philippe Mathieu-Daud=C3=A9)
0d5528612b: hw/display/cirrus_vga: Remove debugging code commented out (Phi=
lippe Mathieu-Daud=C3=A9)
f0617abfd6: hw/usb/Kconfig: Fix USB_XHCI_NEC (depends on USB_XHCI_PCI) (Phi=
lippe Mathieu-Daud=C3=A9)
1cd8b94870: console: avoid passing con=3DNULL to graphic_hw_update_done() (=
lichun)
a6e037390d: audio/jack: fix use after free segfault (Geoffrey McRae)
336f744e14: MAINTAINERS: Replace my twiddle.net address (Richard Henderson)
e408aeef86: Fix use after free in vfio_migration_probe (Kirti Wankhede)
7632b56c8f: virtiofsd: check whether strdup lo.source return NULL in main f=
unc (Haotian Li)
db2e026a39: virtiofsd: check whether lo_map_reserve returns NULL in, main f=
unc (Haotian Li)
7fa87944f8: tools/virtiofsd/buffer.c: check whether buf is NULL in fuse_buf=
vec_advance func (Haotian Li)
f26688a911: virtiofsd: Announce submounts even without statx() (Max Reitz)
6ba11211bd: migration: handle CANCELLING state in migration_completion() (L=
ongpeng(Mike))
9e8424088c: multifd/tls: fix memoryleak of the QIOChannelSocket object when=
 cancelling migration (Chuan Zheng)
a18ed79b19: migration/dirtyrate: simplify includes in dirtyrate.c (Chuan Zh=
eng)
a24292830b: migration: fix uninitialized variable warning in migrate_send_r=
p_req_pages() (Chen Qun)
a1af605bd5: migration/multifd: fix hangup with TLS-Multifd due to blocking =
handshake (Chuan Zheng)
727a06326c: hw/i386/acpi-build: Fix maybe-uninitialized error when ACPI hot=
plug off (Philippe Mathieu-Daud=C3=A9)
d88618f717: configure: mark vhost-user Linux-only (Stefan Hajnoczi)
eb6a388624: vhost-user-blk-server: depend on CONFIG_VHOST_USER (Stefan Hajn=
oczi)
e5e856c1eb: meson: move vhost_user_blk_server to meson.build (Stefan Hajnoc=
zi)
3009edff81: vhost-user: fix VHOST_USER_ADD/REM_MEM_REG truncation (Stefan H=
ajnoczi)
136fc6aa2c: ACPI: Avoid infinite recursion when dump-vmstate (Peng Liang)
af3bbbe984: migration/ram: Fix hexadecimal format string specifier (Philipp=
e Mathieu-Daud=C3=A9)
6bfa035ec3: macio: set user_creatable to false in macio_class_init() (Mark =
Cave-Ayland)
35e28cb0f2: scripts/tracetool: silence SystemTap dtrace(1) long long warnin=
gs (Stefan Hajnoczi)
92eecfff32: trace: remove argument from trace_init_file (Paolo Bonzini)
71182187dd: hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers (Pe=
ter Maydell)
676ea985c0: hw/net/can/ctucan_core: Handle big-endian hosts (Peter Maydell)
e0784d8375: hw/net/can/ctucan: Avoid unused value in ctucan_send_ready_buff=
ers() (Peter Maydell)
5e73953a27: hw/net/can/ctucan: Don't allow guest to write off end of tx_buf=
fer (Peter Maydell)
c7811022eb: linux-user: Prevent crash in epoll_ctl (LemonBoy)
ce437484fc: linux-user: Correct definition of stack_t (LemonBoy)
b1b0393c3c: pvpanic: Advertise the PVPANIC_CRASHLOADED event support (Paolo=
 Bonzini)
d949fe64b0: net/l2tpv3: Remove redundant check in net_init_l2tpv3() (AlexCh=
en)
7564bf7701: net: remove an assert call in eth_get_gso_type (Prasad J Pandit=
)
2f2fcff323: net/colo-compare.c: Increase default queued packet scan frequen=
cy (Zhang Chen)
17475df2c1: net/colo-compare.c: Add secondary old packet detection (Zhang C=
hen)
ec081984f4: net/colo-compare.c: Change the timer clock type (Zhang Chen)
0c4266ef26: net/colo-compare.c: Fix compare_timeout format issue (Zhang Che=
n)
45b9e8c33a: colo-compare: check mark in mutual exclusion (Li Zhijian)
862ee1e07e: colo-compare: fix missing compare_seq initialization (Li Zhijia=
n)
5647051f43: Fix the qemu crash when guest shutdown in COLO mode (Rao, Lei)
b70cb3b485: Reduce the time of checkpoint for COLO (Rao, Lei)
33609e95b2: Optimize seq_sorter function for colo-compare (Rao, Lei)
b492a4b8ca: net/filter-rewriter: destroy g_hash_table in colo_rewriter_clea=
nup (Pan Nengyuan)
e87936ea29: virtio-net: Set mac address to hardware if the peer is vdpa (Ci=
ndy Lu)
a3a929083b: physmem: improve ram size error messages (Pankaj Gupta)
784106ec98: Makefile: No echoing for 'make help V=3D1' (Greg Kurz)
dc24926baf: replay: remove some dead code (Pavel Dovgalyuk)
1023e0033d: fix make clean/distclean (Paolo Bonzini)
b54b82df25: meson: Clarify the confusing vhost-user vs. vhost-kernel output=
 (Thomas Huth)

