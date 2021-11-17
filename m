Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5161454CEE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:17:47 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPVC-00067T-QN
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mnPTg-0004LN-A3
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:16:12 -0500
Received: from mail-dm6nam11on2047.outbound.protection.outlook.com
 ([40.107.223.47]:53281 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mnPTc-0005rb-5m
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:16:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blFe9OuPYmuUAVOkNAhQQTQhmIZPK6D4OkiN9X2rOaP3r3AYTME+8jGJtzdnpXzdm/JWDS7zuB1yFFWjuIYsfC4uf6B32dK2utVvc1XgIAdfz0c++oiL+naxcl0H9m3ClX9NFusHkrF7p9vm6uN/dicU4zvMs2Lixb8BWi/e7rLHc1kMJpcmwIKHMAljxnjdL8HjtuUxj2GRiW1BJcDHRfayZIpU58R2PkLiqps221cNkZO/4d+OtE39yNX6dtpigHKH9KMLgtya9ykNZLb/rMHJkQJ80xV7Pd9BtG3l+8mt1Nsl6R7ZhqRvHAhpI0KSnD8pkFfZKD12TelAUtN3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFIsfhjiyozyXlZJ9fdJuBF89aK9d2cARutVL74G5xQ=;
 b=oSnYhInsB7TDmUJHrRzO50ZQrVJMOlHg575bQF1qUU73rAvdcv44sIekZGDM2dPsuP4oRFdGj/kh6SznqNMzLGhf8nRuHV3LwE5njPFzaydfm4+g6/qPGYUludp+2+iUU56gOaTG5NWE53fXN9YEHqrAMpmQAZwP66FSeuWcXJTT0un9w7jCUEpHrfmfpcm1BSvMSG+1yvMMF/XtijsQfmz9HQy2pTfL+fpov/G5gw6dmUoaxSiWWir3xnzwpLA8Y2QZYW9a+tNPguxj2A0RWB7FOF6Iryoo4r96X4zZmP2EpojAS4oCYSm6YEKLtk5dVX6LxPtcjBcf1hTyqvG7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFIsfhjiyozyXlZJ9fdJuBF89aK9d2cARutVL74G5xQ=;
 b=iJ5kbhZMET3vwysDcsNhyfacJXhm4MgYFto16Aiy94Do/FyxDcPfctQvp5QnKOtAE3ux6PDEoBxCftopaWU2DWrFc64bqHGAQwfC30RDw0OZHK2PANnAUDVdyWDQqoSYGZyUnkmETn3OLN5lwe9N8aIZ3QJfmTMwiiaX+n229qc=
Received: from DM6PR14CA0070.namprd14.prod.outlook.com (2603:10b6:5:18f::47)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Wed, 17 Nov
 2021 17:55:28 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::6c) by DM6PR14CA0070.outlook.office365.com
 (2603:10b6:5:18f::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 17:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Wed, 17 Nov 2021 17:55:27 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 11:55:26 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.2.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Wed, 17 Nov 2021 11:54:51 -0600
Message-ID: <163717169138.293410.2201239539111762928@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf0e850-1de7-429f-814b-08d9a9f3705d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4218DE97E66919743290AFB3959A9@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfYJcBxqYgJlGyM59kscLPfCh/CJuSCEa8D/WgVldgefTEj5w+MC5/Bey1S+xBadjVuPdlgR6V3NQXVrrEBh19vTlUafdGlZacOTqWTvCX6gQvZHpgh/2aqaIgndFlD3VdvoAjVo1OLAbrPQBjAvd6E36S0SbYh0inVMNLjqajZ7gND7Jk7WAWxmp7O8XHuKTYwhXOLcPmu46nUWfaz+WgLnnFjegA/h4lqldTXUGPyhsbGl/3KBW7y4fa+zOXSPrd3qaqrpAv1iTNpPqAl0TpgrXWl7mVDGBxMVBfSvaO2y0QvvrFTO/d0J+PRjoMeB8XVdgfKpZ20I5jMNVdj2ypjJHjZQptmTdDwROhE16ZFNQpvq5KbMRUtGTUsalOr0/ku6Yf1k/MeozB1Xb73kjSB3yDGn0j0/opOuyLd8IlSPa5zV86IlA1g3TVLXQpQeL5oI/z7jviWbA8b2ky8iuYdqdBLoLTFumpqZcKYtjUTAzSQu1auBODp0rYq5MK27dTH0o7OYtzI/3u6OYpLAiI+nIZKSqCz2nl6vfvzcZVL1rpcv4+AIew9NZth6pP9dMoDk032kdjiFyTjtV8okxdz1nH8X/zSmTyXTh/ycOM2vA+pz4W/3RWPO9Q9W7YTM7l6OUMNbUr/lhCd0ITZdEZx7wuXL/09+8JO4sveENjiAKY2wbNuR/6cAhPU26SvpDRKk6RVm2HgDFN4zjnnxVm+o3KIOQwBH3UIpC01W1UGAJf9jg1DqnJEi3B+wrWIFcElENl0OZG/WWPfgXqSL7En05u3gehtUYTH/Ny1FRfqok1LaI3s4TWNEkli9+11utJw5qvt9f8KHn46BHhjT/aTOJEVfOW3OWWV/LGwULcA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(66574015)(36860700001)(2906002)(5660300002)(83380400001)(47076005)(6666004)(26005)(508600001)(8676002)(356005)(16526019)(70586007)(70206006)(186003)(336012)(6916009)(426003)(82310400003)(36756003)(81166007)(4326008)(966005)(44832011)(8936002)(316002)(2616005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 17:55:27.6079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf0e850-1de7-429f-814b-08d9a9f3705d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
Received-SPF: softfail client-ip=40.107.223.47;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
second release candidate for the QEMU 6.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.2.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-6.2.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 6.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.2

Please add entries to the ChangeLog for the 6.2 release below:

  http://wiki.qemu.org/ChangeLog/6.2

Thank you to everyone involved!

Changes since rc0:

67f9968ce3: Update version for v6.2.0-rc1 release (Richard Henderson)
9968de0a4a: gitlab: skip cirrus jobs on master and stable branches (Daniel =
P. Berrang=C3=A9)
60bec83e8a: gitlab-ci: Split custom-runners.yml in one file per runner (Phi=
lippe Mathieu-Daud=C3=A9)
d7c2e2b3f4: Jobs based on custom runners: add CentOS Stream 8 (Cleber Rosa)
a399f9143e: meson: remove useless libdl test (Paolo Bonzini)
ebd654aabc: tests/vm: don't build using TCG by default (Alex Benn=C3=A9e)
81c9b06ea0: tests/vm: sort the special variable list (Alex Benn=C3=A9e)
d47e3751b5: tests/docker: force NOUSER=3D1 for base images (Alex Benn=C3=A9=
e)
3d212b41e9: nbd/server: Add --selinux-label option (Richard W.M. Jones)
76df2b8d69: nbd/server: Silence clang sanitizer warning (Eric Blake)
5dbd0ce115: file-posix: Fix alignment after reopen changing O_DIRECT (Kevin=
 Wolf)
c9d4e42a8f: softmmu/qdev-monitor: fix use-after-free in qdev_set_id() (Stef=
an Hajnoczi)
4d8b0f0a95: docs: Deprecate incorrectly typed device_add arguments (Kevin W=
olf)
16e29cc050: iotests/030: Unthrottle parallel jobs in reverse (Hanna Reitz)
b0a9f6fed3: block: Let replace_child_noperm free children (Hanna Reitz)
82b54cf516: block: Let replace_child_tran keep indirect pointer (Hanna Reit=
z)
079bff693b: transactions: Invoke clean() after everything else (Hanna Reitz)
562bda8bb4: block: Restructure remove_file_or_backing_child() (Hanna Reitz)
be64bbb014: block: Pass BdrvChild ** to replace_child_noperm (Hanna Reitz)
2651806141: block: Drop detached child from ignore list (Hanna Reitz)
04c9c3a52c: block: Unite remove_empty_child and child_free (Hanna Reitz)
a225369bce: block: Manipulate children list in .attach/.detach (Hanna Reitz)
8d3dd037d9: stream: Traverse graph after modification (Hanna Reitz)
7b6d1bc962: tests/unit/test-smp-parse: Explicit MachineClass name (Philippe=
 Mathieu-Daud=C3=A9)
c3440eff4c: tests/unit/test-smp-parse: QOM'ify smp_machine_class_init() (Ph=
ilippe Mathieu-Daud=C3=A9)
2523a79565: tests/unit/test-smp-parse: Restore MachineClass fields after mo=
difying (Philippe Mathieu-Daud=C3=A9)
1adf528ec3: hw/rtc/pl031: Send RTC_CHANGE QMP event (Eric Auger)
e5cba10ee1: hw/intc/arm_gicv3: Support multiple redistributor regions (Pete=
r Maydell)
046164155a: hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when nb_redist=
_regions > 1 (Peter Maydell)
01b5ab8cc0: hw/intc/arm_gicv3: Move checking of redist-region-count to arm_=
gicv3_common_realize (Peter Maydell)
18416c62e3: pcie: expire pending delete (Gerd Hoffmann)
0d33415a4e: pcie: fast unplug when slot power is off (Gerd Hoffmann)
44242d4d3d: pcie: factor out pcie_cap_slot_unplug() (Gerd Hoffmann)
81124b3c7a: pcie: add power indicator blink check (Gerd Hoffmann)
d5daff7d31: pcie: implement slot power control for pcie root ports (Gerd Ho=
ffmann)
23786d1344: pci: implement power state (Gerd Hoffmann)
c829540401: vdpa: Check for existence of opts.vhostdev (Eugenio P=C3=A9rez)
0351152b6f: vdpa: Replace qemu_open_old by qemu_open at (Eugenio P=C3=A9rez)
d152cdd6f6: virtio: use virtio accessor to access packed event (Jason Wang)
f463e761a4: virtio: use virtio accessor to access packed descriptor flags (=
Jason Wang)
7e6055c99f: tests: bios-tables-test update expected blobs (Igor Mammedov)
211afe5c69: hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OS=
C (Julia Suvorova)
be12e3a016: bios-tables-test: Allow changes in DSDT ACPI tables (Julia Suvo=
rova)
c318bef762: hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machi=
ne type (Julia Suvorova)
2aa1842d6d: pcie: rename 'native-hotplug' to 'x-native-hotplug' (Igor Mamme=
dov)
d58f01733b: tcg/s390x: Fix tcg_out_vec_op argument type (Miroslav Rezanina)
8d30f0473e: tcg: Document ctpop opcodes (Richard Henderson)
f1f727ac8a: tcg: Remove TCI experimental status (Philippe Mathieu-Daud=C3=
=A9)
225bec0c0e: tcg/optimize: Add an extra cast to fold_extract2 (Richard Hende=
rson)
d139786e1b: ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_e=
a_tlb() (Daniel Henrique Barboza)
be81ba6042: hw/mem/pc-dimm: Restrict NUMA-specific code to NUMA machines (P=
hilippe Mathieu-Daud=C3=A9)
14c81b2191: vhost: Fix last vq queue index of devices with no cvq (Eugenio =
P=C3=A9rez)
245cf2c24e: vhost: Rename last_index to vq_index_end (Eugenio P=C3=A9rez)
b66cecb238: softmmu/qdev-monitor: fix use-after-free in qdev_set_id() (Stef=
an Hajnoczi)
cd523a4181: net/vhost-vdpa: fix memory leak in vhost_vdpa_get_max_queue_pai=
rs() (Stefano Garzarella)
2c3132279b: sgx: Reset the vEPC regions during VM reboot (Yang Zhong)
1fde73bcd7: spapr_numa.c: fix FORM1 distance-less nodes (Daniel Henrique Ba=
rboza)
bd989ed44f: numa: avoid crash with SGX and "info numa" (Paolo Bonzini)
dd47a8f654: accel/tcg: Register a force_rcu notifier (Greg Kurz)
ef149763a8: rcu: Introduce force_rcu notifier (Greg Kurz)
3620328f78: target/ppc: Fix register update on lf[sd]u[x]/stf[sd]u[x] (Math=
eus Ferst)
1bf4d3294b: monitor: Fix find_device_state() for IDs containing slashes (Ma=
rkus Armbruster)
8c0bae5a19: qapi: Belatedly mark unstable QMP parts with feature 'unstable'=
 (Markus Armbruster)
53e9e547d2: docs/devel/qapi-code-gen: Belatedly document feature documentat=
ion (Markus Armbruster)
13b86cbd2c: docs/devel/qapi-code-gen: Drop a duplicate paragraph (Markus Ar=
mbruster)
a0b9c5f75c: target/i386: sgx: mark device not user creatable (Paolo Bonzini)
1084159b31: qapi: deprecate drive-backup (Vladimir Sementsov-Ogievskiy)
24d6cc1fa1: docs/interop/bitmaps: use blockdev-backup (Vladimir Sementsov-O=
gievskiy)
9a599217a4: docs/block-replication: use blockdev-backup (Vladimir Sementsov=
-Ogievskiy)

