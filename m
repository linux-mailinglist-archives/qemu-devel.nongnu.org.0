Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F312D3595
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:53:57 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkvk-0005qS-B4
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kmkiT-00014n-G6
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:40:13 -0500
Received: from mail-bn8nam11on2054.outbound.protection.outlook.com
 ([40.107.236.54]:30017 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kmkiQ-0003K5-AX
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:40:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la6AdqGNed7zKoP+T9D1ApT8F5afY6vdeCkRB/zyRp92IuySls6JpzA7OpLbM+Uad0sWYb0UvEmKa9+5iNddRNn2+WHVRCSkG60v4PIQv3hMRAT2bi8sjvXkCtTss0WNG5Hzxr3VrvTcGEk8I7+thXGNuU8IzwF3tWkpiEmZeHOeItZxjBx0GLlJFiCj7jj4B92eG4dHutXVXVZUBYVSXDwFufRxrNGa8NPrfNKdbe2J3uC5eTHrwr741n53i5JYbbS/jwVYcxSQrtLu1DIC8ZfFVZDlK7nIXhCjpuxuOflpHFfsZLQIeW+BsgVXo4xlA6c/3JclHNsVjD/o6utMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkeegyLA6etptyvOx89EElCPHu5nAKJhIiRqYHLtvxo=;
 b=N8zXkwjpolCDcCicwtdpAkJf7ye2pYqLnStOg/oW8ITBsBdRSkZ3MS1GXyliwWbU0q3e4Qx/BAzVBT/p7aCExPXyNOTxbE+XFLOUrEP5swdks2t/wriRrV040r3tarHtFk8cNdtOkn4xARv9qh+TBhTT5GUWPZ5RuQWkCmDKvCYEN/FEHuqVwroTtKxBgsEryaijM3mOdupkFzb7gbBlgtl4pl8qzzl4Xt5UwSvivdjM4PAMC/du7pVAqkrel1fOPfZva3x9Wl7YmW/l+dvpIYXBFmwY25juZKvUTQKlbnV3g4vktOAvYkcRy+6dK6UbXJ7rJgdO9kitc+QRHh66Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkeegyLA6etptyvOx89EElCPHu5nAKJhIiRqYHLtvxo=;
 b=uxL+rFN13DB5T2Ur0ROzYxbekHCiXIeEpyyefKaBe8JAWlUPyPj9FFM9Gqb5RHaqlnNbv4I8Yzp6ZCIHePj39et3TYtAjhY6/stA3ZkkSn0GDH0t1RptZChjMSO7VrpYG2+LgTx+ZlZEMDWVWOaqV3U1FJ7SvTbnD2GtgX0O9HY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 21:25:05 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e%7]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 21:25:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 5.2.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 08 Dec 2020 15:24:51 -0600
Message-ID: <160746269143.1065377.3200449235940144242@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN6PR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:404:5f::22) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN6PR02CA0036.namprd02.prod.outlook.com (2603:10b6:404:5f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18 via Frontend Transport; Tue, 8 Dec 2020 21:25:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a0ea081-f0f6-4cd1-9d54-08d89bbfbaee
X-MS-TrafficTypeDiagnostic: CH2PR12MB4181:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4181BAF1ACAF288992DB26AD95CD0@CH2PR12MB4181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0Kt50OMVlEJ/xwW3Z2yz8XrTPpveNOCYmlru+JyopuLKWbAjHr25atF2BCNgtpun0zGFlqoSBWlxbFMYAo9+DGCAJuMmcP0NqOblMRZSQgGpqN44jFybrfHzJrJ6KOP9hPxY//MeLmYwCrGnyK+98htZk5CgyKhujMzLka+grn0RIOmC5s8ece2fNJe1ynGUg67zUfLclBNgeC/Wa7jrGVeGGpA+vLSoCAe/NXWnHXIckJURedEte8lY4DWaxE2+YLw6wWiCRBCKSe3jqnTf2RGx0cDbX9ROkGbynKYO+QVIbDgOmOVmshfpnhBh1msDT6MmHitt0BsHYVWI8KSfGkecfV//x47ZzC4sWD6QCzFZ8XsYMh4G/un2Ga/gT18TbHsRfwD+QKabG37Inz65m2G1ghR59IgfQ/iafB8VyV2ktfmhdcJy3kULhK5rU3gDcMAamCc7PLi9iqidkGz4wwGckjXlI8vPTjJ1XtjAo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(376002)(366004)(346002)(186003)(16526019)(508600001)(66476007)(8676002)(26005)(52116002)(6916009)(2906002)(33716001)(6486002)(66556008)(6666004)(966005)(66946007)(44832011)(9686003)(34490700003)(5660300002)(86362001)(6496006)(83380400001)(4326008)(956004)(8936002)(473944003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWtMOWNSei9PdHhKZWRRVHphblpMVVVyWFlMMWVnclNLcXF4MU5TRmFkVTJw?=
 =?utf-8?B?VTNZc05yZlNBaGw0Y1NyUXVmWEdBMmF5K2E3ci9nRzZGQzNJeUNDQi9pVnJK?=
 =?utf-8?B?T0FHT1YyS21XQjc5MTQ3ck9jRS8wNnJRNmdLbkpEZFBVUW9GOHE0MFJ3RTJm?=
 =?utf-8?B?bXpjN3I4bGtWNXRTK1pqU2pOVnV4bmVXTTdmRnZWWUlyN0M1dzlnR1BFZTYx?=
 =?utf-8?B?OWhSK2FmaTZsS2pZc2NmQXpwUTFFMG9SVmNUNXREYkd4VkRhaVVjNmZ6OFY0?=
 =?utf-8?B?V1RzeGJsbGlSR1JrZHdVall1Vi9CL3dyNWJaaUJqWjh5M0kyb04wWmlRN0xr?=
 =?utf-8?B?QjM4VHpsbVR0N3V1TXVqTVFXZER4ZVQrYS93MXRoV3lPMEJPL1RRaUdCUkdE?=
 =?utf-8?B?UVR4aExpak13MlZ0ZkVNVkxEUE9Ca2lCZFlUdG9jb1RZSlp2Z1I3ZExhS3dF?=
 =?utf-8?B?QVpOdWVwc0RzSFNHRnY5OHZ0NUs2OGpNRmNhV0RZOGJRckxQd1p4MTZXcFN4?=
 =?utf-8?B?OHRXN1FyUEJsTFQ4NEZ1TkwwOWZpM3F4T2NvWGxuWkNMeGs5RzRxMHRjOEVt?=
 =?utf-8?B?Y25aWW5hbDJ4MURsMUV4VXVLdGZIWFZIcUxabElhdFVZWGZVVlpjdGpWVkVF?=
 =?utf-8?B?UUxzUFcyVUkrMUszSW0yNmdZS2lFN0NqclA5RkF5SEhaaGZjTGdFRGJ5UmR0?=
 =?utf-8?B?OGM4T056ZVJ1amZFY0Z5NmVIOGRWSHNaRW5OMU5QSzIrYW5lMHZpMTMvdnBR?=
 =?utf-8?B?YTJDVTNKYUpRUjNSVXJpSGl0ci96Qkp0ejA0SkFXYUtqZDg0ckNnQ1NQL0xG?=
 =?utf-8?B?VUJUWE9Vazlpb2VJdWpPeU82NG9uQ2lMV2V1cWNZMkwwZzBMNnRLSXJJeUFT?=
 =?utf-8?B?NVdpZy80czFKa0ZCVFE5M3Y3T0Vsdmo3WlpLTTJhNThra05hOHAxUC93OGc3?=
 =?utf-8?B?VHBISlUyYnZBd0VXZG5INmd6MjM1cWNCeWJ6Y2J6VHYxYUJMYzFXRXlzMlJZ?=
 =?utf-8?B?bzFJeldCUlFmVTRLR1lUSHJ3NDVrbGFhWk5kUzBnQ0xtSVVvWDZCdXNGaFhK?=
 =?utf-8?B?VkMrZEE5OXJOdElwbXBHUUFoTTVjRzRlMndxS2VJRVl1VVpUM002RzNBaHdy?=
 =?utf-8?B?Uk5iT1EvL05YVm5kZHB3OC9FeEhSZHhUb1A3Wk1FbjA3K0lLZUtLOWJPV0sx?=
 =?utf-8?B?Vm01b1BnZVNnN05YSTNCVHo4MUJiM0ZYUlNyTDRrWWJ2Z1d6a3laRzdlT2pE?=
 =?utf-8?B?OUVHNmhnK3pYUGR3eThVTXN2VjNnSHBOUDNhajhkZGNJbHZyUWhDZ3VjMGZK?=
 =?utf-8?Q?PQP+0/0qoQbj1oGa/3Abl4aTRA0SugLZLd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 21:25:04.8252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0ea081-f0f6-4cd1-9d54-08d89bbfbaee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BXIYWFt5/LoW9FXka3A6536PcNWxC+MW0go6xQ2Goj2BpvxL9S7fQkAMoBWuyFp2C71mvhw2fYUX0oYdesvnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4181
Received-SPF: softfail client-ip=40.107.236.54;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 5.2.0 release. This release contains 3200+ commits from 216
authors.

A note from the maintainer:

  This is the final release of v5.2.0; there are no changes since rc4.
 =20
  Note that QEMU has switched build systems so you will need
  to install ninja to compile it. See the "Build Information"
  section of the Changelog for more information about this change.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/5.2

Highlights include:

 * block: support for using qemu-storage-daemon as a vhost-user-blk
   device backend, and new 'block-export-add' QMP command which replaces
   now-deprecated 'nbd-server-add' with support for qemu-storage-daemon
 * block: qcow2 support for subcluster-based allocation (via
   extended_l2=3Don qemu-img option), improvements to NBD client network
   stalls, and qemu-nbd support for exposing multiple dirty bitmaps at
   once
 * migration: higher-bandwidth encrypted migration via TLS+multifd, new
   'block-bitmap-mapping' option for finer-grained control over which
   bitmaps to migrate, and support for migration over a
   'vsock' device (for nested environments and certain hardware
   classes)
 * qemu-ga: support for guest-get-devices, guest-get-disks, and
   guest-ssh-{get,add-remove}-authorized-keys commands.
 * virtiofs: virtiofsd support for new options to control how xattr
   names are seen by the guest, specify sandboxing alternative to
   pivot_root, and allowing different host mounts to be seen as separate
   submounts in the guest to avoid inode clashes

 * ARM: new board support for mp2-an386 (Cortex-M4 based), mp2-an500
   (Cortex-M7 based), raspi3ap (Raspberry Pi 3 model A+), raspi0
   (Raspberry Pi Zero), raspi1ap (Raspberry Pi A+), and
   npcm750-evb/quanta-gsj (Nuvoton iBMC)
 * ARM: ARMv8.2 FEAT_FP16 (half-precision flaoting point) support for
   AArch32 (already supported for AArch64)
 * ARM: virt: support for kvm-steal-time accounting
 * HPPA: support for booting NetBSD and older Linux distros like
   debian-0.5 and debian-0.6.1
 * PowerPC: pseries: improved support for user-specified NUMA distance
   topologies
 * RISC-V: live migration support
 * RISC-V: experimental hypervisor support updated to v0.6.1 and other
   improvements
 * RISC-V: support for NUMA sockets on virt/Spike machine types
 * s390: KVM support for diagnose 0x318 instruction, TCG support for
   additional z14 instructions
 * s390: vfio-pci devices now report real hardware features for
   functions instead of just emulated values
 * Xtensa: DFPU co-processor with single/double-precision FP opcodes is
   now supported
 * x86: improved support for asynchronous page faults via new
   kvm-async-pf-int -cpu option

 * and lots more...

Thank you to everyone involved!

