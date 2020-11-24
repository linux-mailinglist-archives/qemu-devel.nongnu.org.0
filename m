Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6202C34F4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 00:48:43 +0100 (CET)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khi37-0000s0-Kh
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 18:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1khi1P-0000LY-FC
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 18:46:55 -0500
Received: from mail-mw2nam12on2051.outbound.protection.outlook.com
 ([40.107.244.51]:43136 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1khi1J-0006Oc-Cu
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 18:46:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImeXNrlDvUf16FBq2fKvwpOUtQo/UyqWRfn9wcMDsDIaanxtoVN3l5aS4czeVfv/9Nt/sK6XVgJSDZ7x054qwyePDw4VEHUQ0sdBOTSHx1ThC5BJ29MJkSCS9BzYDfKasdrYHETjPfuCLYGnltMno9fMntU7bjqUu47LX6dkRcevq4SZBnMwX0sSsZb5DVAZAg2bG/BIb6rgT+jEZclx+ewNRQ3ZrgGVwMUYUsC+hdzDOGXJfF5gM5qDKpUzcvA7Lmbz2RciE1YtjDmugf+js5ICu2VabFzji6v/WYlb/qLalGERxGytvKYR/R7TYntR6C36OHSymRkhkjU360Kncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBMA/diYx+dFfIdAuxgdNZdVxaUP8UeaYoMq1c/XA1I=;
 b=U7Uw/uCelckj+ghKqFJxRR4Qe1Zi6tmE2oK7MK+xMdIEl09QIukQprVyteGkDXDNyjidEVa7JnSOXXjS9Y8HEZOuN8S5gh277clxOMBwr1ag9CJvbEbz6M6iExcZGXUI3XiD98Ev5CQVc5Pbum1e79/bhwrZb26Rfxhnr7q7/ePdJwZVnc+upGhT27QSjpZHWWJb4piv37HRfK5830kYQTlFdMQKqAanpasS8ibuRAgBDJBl2ISEzwnm224FZz4LfTy+wzcuP/exGiTBuqfjuYoNh24hGmfB0fQ5s7XmucaC03kAzm7uGRGbL3NxEyTli9vqUn4RMxvejpMvxKek7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBMA/diYx+dFfIdAuxgdNZdVxaUP8UeaYoMq1c/XA1I=;
 b=yxD4jAcJBtFhtm/TqHEaskP3l5pXa7y6Qqe3I5khU8cVcuxzBJXHuQwQrUCujZtbKkiwMEsWHqA/lJNhMlPlTw+MauCt34FG2zRzmB6QFmG4SDe4DS7/z9EAXxWRJkiRCCTZdOJeEr64Ii6pczanZrepZHeLcCVTgKFuRGRCklk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 23:31:43 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e%5]) with mapi id 15.20.3611.020; Tue, 24 Nov 2020
 23:31:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 5.2.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2020 17:31:33 -0600
Message-ID: <160626069372.441854.1095223886326535793@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.53.104]
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::49) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.53.104) by
 BYAPR03CA0036.namprd03.prod.outlook.com (2603:10b6:a02:a8::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 23:31:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5310f3e-5576-427f-4d0e-08d890d119e1
X-MS-TrafficTypeDiagnostic: CH2PR12MB4136:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41366B2A93769B6F911E3EA295FB0@CH2PR12MB4136.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rIjClhC10gcDLZqUFwyvtMgrz9XO9CJtc+0hhzi4x3O+8eKq9vCNf1KBA/8dcj/RCi+W/voP6JQBmR0jtS5rukXQGqDn44Dk+HFSFJLF1Fk1vwdg/yw50Kbm+35byYOAL+tNRI/B+TkRec2t1Y5i+4nXU45stOPC3XRr88alJ8C6E3NuFodsb966yLXHnGMy/codCec7+o4zS9caOfC+A+U4/P7MNgLxAC6wKWSoJSjROJWWdnZtMjPPs28V2BhERyh1VGyTGsmer35x+qzNFCKclfHmCCElgIebHZfDewPnWt0cvYH4AX7xFNg78YOQ/YbHCKjgU1lY/n9VxmViTvg6QuFAnF9Ivw3mwUrQCvuNoDfXhUJR6OfLjNnN41UaBJERgjgfzkkAEOOIwvxktg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(376002)(346002)(396003)(366004)(39860400002)(83380400001)(966005)(6916009)(86362001)(4326008)(9686003)(2906002)(186003)(33716001)(316002)(26005)(6496006)(478600001)(8936002)(52116002)(16526019)(956004)(5660300002)(8676002)(66574015)(66946007)(6486002)(66556008)(66476007)(44832011)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZndSc0NjVXZzSHV5a3hVaGVFMk1oemNFVTRkbDVsKy9OcS94R1VLZVVacjl2?=
 =?utf-8?B?aStpNStTYVJjQkdTTUhtUnRtZVR4cHowYk4vTGYvWk50U2NXWHBtZkRHOGhi?=
 =?utf-8?B?QzRVM1Q3SStZQXpiUDM1NytnbXBBaU5OSTkvNTd3VHVtK1F4UkxvYkhtNkdl?=
 =?utf-8?B?Ti9pZURCOEh0SS8vQXF2aEhGN3Z0OXYrU1FtNlgxOVhvdU5qSW5NejM2bkQ1?=
 =?utf-8?B?UDVWcFdJa1FZV2ViL2UwbU9SWlkycUowWUtkQTBiNzgvVmcrTFV3YzJsV1RT?=
 =?utf-8?B?aG1NeS9jMzJNYmlZZ1VtWWJrMWpMeWNNaFBHWHBDM1diL1cySE9DUUttWTVa?=
 =?utf-8?B?UEU4eU5nQjhSV0pRa2xNVXRQRFk2M29sTUo2NzJYc3ZvYVRsTnBwVmg1Tkt4?=
 =?utf-8?B?VEkzMENGekcxNEZUQXJYRHNSSWV2NUZkMWpWR2p0VjBYMzgzMWxkVjZPeHI5?=
 =?utf-8?B?Y292Z3BOeUNjNGxGVnV5ZXp3aEJQbzF5Q0JsVEhPa0RqUzVDT2g5STNPVGth?=
 =?utf-8?B?THgwekJJQjJYcFFKRm9EMzNZN2wxUytUYVY0cE5RQ0JxMHoyWUdOQ1I4bmVv?=
 =?utf-8?B?cExYb0NhaWtWd0M5OVMrYXppbE5RK3A3TlhhMmdXalUxRk1Obk95bTE5R2hW?=
 =?utf-8?B?TDJLdG1maklCTVI4S3NpL2kvZzFPcXhZa3J2UXNPa1NpTnFEWExNZnRkS09M?=
 =?utf-8?B?MGF4bEJoTjA5TnQvcERramQ2KzdiSjltOFVTaHE2N3RXRFFGbVJaRHZZZi9X?=
 =?utf-8?B?UGE2VXU0WDljenF2RVdOVkx5Y2pxeEtTTEhYazlyZmh2Qko5MzhwSXhyMTZC?=
 =?utf-8?B?SVYray9WTncwU1M5YWJaVWJTcDVkZ25BTGhtRlR0RWhDVHBMMSs1MVNLcHJX?=
 =?utf-8?B?VGlPYkV1dTJkQ2RoVUZoemRwcS9nS1A1aGt0bDR0NjNURmU1MjlLOGRLUVJm?=
 =?utf-8?B?NlN0WFdHMlkyZ1RtNVp4ZjVvVUxCZXFDNHl4RnhZT0VrTTFuVGNwbEsyWURK?=
 =?utf-8?B?VkRMUFl3a05LWFZPL280blNQUzJPRXRCK1pvZ0J1d3RBY2tpRWZ4OUlybWxO?=
 =?utf-8?B?TGYvRzF2SnBHUGQ1L1FGVmJSZ1d2ZDZwUzRmMjc0QkluNVVBemFIU1QxcUNC?=
 =?utf-8?B?dGdwRG05MVdqcmJoeno2OFdCYytvcTNON2lmSnE1N1NFVjY0VjQ3QUN4R0hQ?=
 =?utf-8?B?aEx1R1RhMm1LbWFQdzYvbnRZN3l3TVNEa2JhNUpKMk13V1l0clU1cFplTkNH?=
 =?utf-8?B?SlhyRnJTN29sL25qbVBYajdoZWt3MDlIM2tVWmZPeUlrdDltaGJCK21qNDNL?=
 =?utf-8?Q?MxnKwMR6cwEbSl2uPW5cQxc9xVS4joiBn1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5310f3e-5576-427f-4d0e-08d890d119e1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 23:31:43.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOC47B+8bXw5NaaS5eDrBZC+bWbjTu1pD/mBb6Tlj0PgKO5iYYf15D3/Re2w9Xohd8RB7JxTMrSwjKZDPzbmpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
Received-SPF: softfail client-ip=40.107.244.51;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fourth release candidate for the QEMU 5.2 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-5.2.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-5.2.0-rc3.tar.xz.sig

A note from the maintainer:

  This is the final planned rc for the 5.2 release cycle. Unless
  we find any last minute show-stopper bugs, we will release 5.2.0
  on Tuesday 1st December. If we need an rc4 then we'll likely put that
  out on the 1st, with the final release a few days or a week after that.
 =20
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

Changes since rc2:

dd3d2340c4: Update version for v5.2.0-rc3 release (Peter Maydell)
28afbc1f11: Revert "hw/core/qdev-properties: Use qemu_strtoul() in set_pci_=
host_devaddr()" (Michael S. Tsirkin)
558f5c42ef: tests/9pfs: Mark "local" tests as "slow" (Greg Kurz)
c8bf9a9169: qcow2: Fix corruption on write_zeroes with MAY_UNMAP (Maxim Lev=
itsky)
9925990d01: net: Use correct default-path macro for downscript (Keqian Zhu)
f012bec890: tap: fix a memory leak (yuanjungong)
d2abc563e4: net: purge queued rx packets on queue deletion (Yuri Benditovic=
h)
ad6f932fe8: net: do not exit on "netdev_add help" monitor command (Paolo Bo=
nzini)
c2cb511634: hw/net/e1000e: advance desc_offset in case of null descriptor (=
Prasad J Pandit)
afae37d98a: ppc/translate: Implement lxvwsx opcode (LemonBoy)
bb0990d174: vfio: Change default dirty pages tracking behavior during migra=
tion (Kirti Wankhede)
cf254988a5: vfio: Make migration support experimental (Alex Williamson)
c6ff78563a: docs/system/pr-manager.rst: Fix minor docs nits (Peter Maydell)
773ee3f1ea: docs: Split qemu-pr-helper documentation into tools manual (Pet=
er Maydell)
0daf34fd3a: docs: Move pr-manager.rst into the system manual (Peter Maydell=
)
e8eee8d3d9: docs: Move microvm.rst into the system manual (Peter Maydell)
7f0cff6e34: docs: Split out 'pc' machine model docs into their own file (Pe=
ter Maydell)
c5d7cfdaac: docs/system/virtio-pmem.rst: Fix minor style issues (Peter Mayd=
ell)
71266bb4e9: docs: Move virtio-pmem.rst into the system manual (Peter Maydel=
l)
392d8e95c7: docs: Move cpu-hotplug.rst into the system manual (Peter Maydel=
l)
4faf359acc: docs: Move virtio-net-failover.rst into the system manual (Pete=
r Maydell)
acebed948c: linux-user/arm: Deliver SIGTRAP for UDF patterns used as breakp=
oints (Peter Maydell)
6951595183: target/arm: Make SYS_HEAPINFO work with RAM that doesn't start =
at 0 (Peter Maydell)
75bf6e17f9: docs/system/arm: Document the Sharp Zaurus SL-6000 (Philippe Ma=
thieu-Daud=C3=A9)
12bff81b4d: docs/system/arm: Document OpenPOWER Witherspoon BMC model Front=
 LEDs (Philippe Mathieu-Daud=C3=A9)
d9f2ac3de9: docs/system/arm: Document the various raspi boards (Philippe Ma=
thieu-Daud=C3=A9)
155e1c82ed: docs/system: Deprecate raspi2/raspi3 machine aliases (Philippe =
Mathieu-Daud=C3=A9)
66278f8aeb: MAINTAINERS: Cover system/arm/sx1.rst with OMAP machines (Phili=
ppe Mathieu-Daud=C3=A9)
9eeeb80ad4: MAINTAINERS: Cover system/arm/sbsa.rst with SBSA-REF machine (P=
hilippe Mathieu-Daud=C3=A9)
c67d732c39: MAINTAINERS: Fix system/arm/orangepi.rst path (Philippe Mathieu=
-Daud=C3=A9)
7170311674: MAINTAINERS: Cover system/arm/nuvoton.rst with Nuvoton NPCM7xx =
(Philippe Mathieu-Daud=C3=A9)
de8ee7d47c: MAINTAINERS: Cover system/arm/aspeed.rst with ASPEED BMC machin=
es (Philippe Mathieu-Daud=C3=A9)
6e84a91477: MAINTAINERS: Cover system/arm/cpu-features.rst with ARM TCG CPU=
s (Philippe Mathieu-Daud=C3=A9)
57bdec5c46: hw/intc: fix heap-buffer-overflow in rxicu_realize() (Chen Qun)
98554b3b56: hw/arm: Fix bad print format specifiers (AlexChen)
98e8779770: target/arm: fix stage 2 page-walks in 32-bit emulation (R=C3=A9=
mi Denis-Courmont)
534f80e1df: .cirrus.yml: bump timeout period for MacOS builds (Alex Benn=C3=
=A9e)
1352d5688d: gitlab-ci: Move trace backend tests across to gitlab (Philippe =
Mathieu-Daud=C3=A9)
8e9419b790: tests/docker: Install liblttng-ust-dev package in Ubuntu 20.04 =
image (Philippe Mathieu-Daud=C3=A9)
ac74e282d4: gitlab: move remaining x86 check-tcg targets to gitlab (Alex Be=
nn=C3=A9e)
69272bec1a: tests/avocado: clean-up socket directory after run (Alex Benn=
=C3=A9e)
8c175c63ee: tests: add prefixes to the bare mkdtemp calls (Alex Benn=C3=A9e=
)
e4b937d3c4: scripts/ci: clean up default args logic a little (Alex Benn=C3=
=A9e)
7a3d37a3f2: pc-bios/s390: Update the s390-ccw bios binaries (Thomas Huth)
3d6519968b: pc-bios: s390x: Clear out leftover S390EP string (Eric Farman)
d8e5bbdd0d: pc-bios: s390x: Ensure Read IPL memory is clean (Eric Farman)
48e5c7f34c: hw/display/tcx: add missing 64-bit access for framebuffer blitt=
er (Mark Cave-Ayland)
5983021eb6: qboot: update to latest upstream (Paolo Bonzini)
6ca2aa5cfb: usb: fix kconfig for usb-xhci-sysbus (Paolo Bonzini)
88a8b27e55: qtest: do not return freed argument vector from qtest_rsp (Paol=
o Bonzini)
7aed584ca6: tests/qtest: fix memleak in npcm7xx_watchdog_timer-test (Chen Q=
un)
f369797617: tests/qtest: variable defined by g_autofree need to be initiali=
zed (Chen Qun)
923e931188: docs: Get rid of the weird _005f links in the man page (Thomas =
Huth)
4b265c79a8: trace: use STAP_SDT_V2 to work around symbol visibility (Stefan=
 Hajnoczi)
a4e2fff1b1: s390x/pci: fix endianness issues (Cornelia Huck)
e67ad058e4: s390x/pci: Unregister listeners before destroying IOMMU address=
 space (Matthew Rosato)
e2c6cd5674: s390/kvm: fix diag318 propagation and reset functionality (Coll=
in Walling)
c2aa8a3d7e: authz-simple: Check that 'identity' property is set (Kevin Wolf=
)
3428455df9: authz-pam: Check that 'service' property is set (Kevin Wolf)
8e26ae7bb5: authz-list-file: Improve an error message (Markus Armbruster)
2b37e9f843: authz-list-file: Fix file read error handling (Markus Armbruste=
r)
6d24795ee7: Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU con=
texts" (Greg Kurz)
29cf16db23: buildsys: Help git-diff adding .gitattributes config file (Phil=
ippe Mathieu-Daud=C3=A9)
c6a89b45bd: hvf: Fix segment selector format (Jessica Clarke)
65baabca22: hvf: Gate RDTSCP on CPU_BASED2_RDTSCP, not just CPU_BASED_TSC_O=
FFSET (Jessica Clarke)
ca31e3072f: meson: Fixes curses detection on msys2 (Yonggang Luo)
dccdb0f82a: meson: Fix build with --disable-guest-agent-msi (Stefan Weil)
ac9574bc87: docs: Fix some typos (found by codespell) (Stefan Weil)
933c8fe781: meson: Fix argument for makensis (build regression) (Stefan Wei=
l)
fc107d8684: util/vfio-helpers: Assert offset is aligned to page size (Phili=
ppe Mathieu-Daud=C3=A9)
f6b8104d0b: util/vfio-helpers: Convert vfio_dump_mapping to trace events (P=
hilippe Mathieu-Daud=C3=A9)
4c946b2236: util/vfio-helpers: Improve DMA trace events (Philippe Mathieu-D=
aud=C3=A9)
2817fbcee0: util/vfio-helpers: Trace where BARs are mapped (Philippe Mathie=
u-Daud=C3=A9)
df058222e7: util/vfio-helpers: Trace PCI BAR region info (Philippe Mathieu-=
Daud=C3=A9)
3d87c2d943: util/vfio-helpers: Trace PCI I/O config accesses (Philippe Math=
ieu-Daud=C3=A9)
a4bc212add: util/vfio-helpers: Improve reporting unsupported IOMMU type (Ph=
ilippe Mathieu-Daud=C3=A9)
a0546a7b6f: block/nvme: Fix nvme_submit_command() on big-endian host (Phili=
ppe Mathieu-Daud=C3=A9)
4b19e9b815: block/nvme: Fix use of write-only doorbells page on Aarch64 arc=
h (Philippe Mathieu-Daud=C3=A9)
9e13d59884: block/nvme: Align iov's va and size on host page size (Eric Aug=
er)
f8fd3ebac3: block/nvme: Change size and alignment of prp_list_pages (Eric A=
uger)
2387aaced7: block/nvme: Change size and alignment of queue (Eric Auger)
0aecd06049: block/nvme: Change size and alignment of IDENTIFY response buff=
er (Eric Auger)
a652a3ec69: block/nvme: Correct minimum device page size (Philippe Mathieu-=
Daud=C3=A9)
c8228ac355: block/nvme: Set request_alignment at initialization (Philippe M=
athieu-Daud=C3=A9)
08d5406798: block/nvme: Simplify nvme_cmd_sync() (Philippe Mathieu-Daud=C3=
=A9)
52b75ea8ec: block/nvme: Simplify ADMIN queue access (Philippe Mathieu-Daud=
=C3=A9)
3c363c073e: block/nvme: Correctly initialize Admin Queue Attributes (Philip=
pe Mathieu-Daud=C3=A9)
76a24781cc: block/nvme: Use definitions instead of magic values in add_io_q=
ueue() (Philippe Mathieu-Daud=C3=A9)
54248d4d73: block/nvme: Introduce Completion Queue definitions (Philippe Ma=
thieu-Daud=C3=A9)
dfa9c6c656: block/nvme: Make nvme_init_queue() return boolean indicating er=
ror (Philippe Mathieu-Daud=C3=A9)
7a5f00dde3: block/nvme: Make nvme_identify() return boolean indicating erro=
r (Philippe Mathieu-Daud=C3=A9)
1b539bd6db: block/nvme: Use unsigned integer for queue counter/size (Philip=
pe Mathieu-Daud=C3=A9)
3214b0f094: block/nvme: Move definitions before structure declarations (Phi=
lippe Mathieu-Daud=C3=A9)
6e1e9ff2d3: block/nvme: Trace queue pair creation/deletion (Philippe Mathie=
u-Daud=C3=A9)
51e98b6d21: block/nvme: Improve nvme_free_req_queue_wait() trace informatio=
n (Philippe Mathieu-Daud=C3=A9)
1c914cd120: block/nvme: Trace nvme_poll_queue() per queue (Philippe Mathieu=
-Daud=C3=A9)
15b2260bef: block/nvme: Trace controller capabilities (Philippe Mathieu-Dau=
d=C3=A9)
58ad6ae0cb: block/nvme: Report warning with warn_report() (Philippe Mathieu=
-Daud=C3=A9)
8526e39e99: block/nvme: Use hex format to display offset in trace events (P=
hilippe Mathieu-Daud=C3=A9)
dc0b4d94d4: MAINTAINERS: Cover "block/nvme.h" file (Philippe Mathieu-Daud=
=C3=A9)
e6ffd75782: softmmu/memory: fix memory_region_ioeventfd_equal() (Elena Afan=
asova)
f9b4908895: accel/kvm: add PIO ioeventfds only in case kvm_eventfds_allowed=
 is true (Elena Afanasova)

