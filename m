Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDEB45CCA6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:00:23 +0100 (CET)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxVG-0005D0-7h
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:00:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mpxIQ-0004wu-Lo
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:47:06 -0500
Received: from mail-bn1nam07on2069.outbound.protection.outlook.com
 ([40.107.212.69]:36421 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mpxIM-0008Ub-VX
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:47:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjYvSGjHlBxJYdSv1xLmU5GTILSP9OrhWSd9ZniAInynoj8aMTDVQMxAFu3az57DW6PYni8Wxtd4Rh4SkYwOTo3hqU3amS50yu1gB0NHGDf7DsgPf3nV/XZIgTDj3HkSpX9aYCBAF2kIGRQcUg4X9DkeBEeifGO8wOnmabRAbyGsVvvB6LgCcTQ6P+RmW//2iKCTPy7suJWfcfLFb04QXBmvShlSMdt3OHW9C226SqQ9fMZiHlJu0KJmTwrwc43ftKQtgGRPRxyTPOzpf1tazm4sf0p5yWb7nfiCnFYfKruRAN4Re6c9CKgZ9mAr6w9A6+zIA3PyoECpL0Uk0PCqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V8OWuHFgnNlr6rphSO+6eNAQ25a+Qe9Jd0xlWGR9y8=;
 b=k2cqT6w2qpDSuwVPU/1apXJbU70WqPLceMY2K9kmcVb3YaQvNwLa2vktqKN2zTlus4XsdJ6uHs3HkJMeJJWXXmXTZxCPyYWva6K3PX5Y3WIFDCPW6gyxRrqfqU+46Xpiqo0wMdtqdx36u+pQJMlZL01LyQgeOLAX2esGxm0g44zVzyUfZMhzmEaT1B0P1RwEzvp/jMIldy0FOldK7XGPebqcOY0PhVQJ5MW+lv6JSbkLfzh0MaFbg/iUdhpJf7Qh22qj2hDPXIpRMZR5W2HU7o/iOtzlGlFHD/oRmoFS8SWVAgyp5eteVindYpCoBDiaPZ+4P68V6HkbT4Nz3fY3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V8OWuHFgnNlr6rphSO+6eNAQ25a+Qe9Jd0xlWGR9y8=;
 b=Ctu0Iefr7hdc4HYzZCQW2AZvbRX2b/SK7eoFmMUvm1iIgiGDV3DM33LmRqNEIYbBF1kV/8Bb/GGUDf9OUx2L56iVfqokBY04tO+NPdiW2Q1t09Oz8bdiScLBJp1SoAQgF+tKwVD8mzWvaWlTdUKnxxgkU+D3H+okMM/IEeqIcM0=
Received: from DM5PR21CA0036.namprd21.prod.outlook.com (2603:10b6:3:ed::22) by
 BN6PR12MB1732.namprd12.prod.outlook.com (2603:10b6:404:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 18:27:08 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::71) by DM5PR21CA0036.outlook.office365.com
 (2603:10b6:3:ed::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.7 via Frontend
 Transport; Wed, 24 Nov 2021 18:27:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Wed, 24 Nov 2021 18:27:08 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 24 Nov
 2021 12:27:07 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.2.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Wed, 24 Nov 2021 12:26:51 -0600
Message-ID: <163777841100.97511.6461566282040035969@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 973f8844-d8be-4660-0f87-08d9af780623
X-MS-TrafficTypeDiagnostic: BN6PR12MB1732:
X-Microsoft-Antispam-PRVS: <BN6PR12MB17328572A03C0DC95D78BCEB95619@BN6PR12MB1732.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KAPwmtdvwmhp3hLez7kKngLRXn6karTc4UE3aGhsh3BlJey381Ug+cE4hkuaXeo8oWwnyLTo/SvR6ROLV1tJiPPVPCgStbLdd47+pXoigVW4sL5mKmoiFIvMWBB0L1/VArER7EJ7pu8C0zaWFxEGMjzAueSJV22BA5yMiDq0GM8yTQYHjexOlcpALia5X7gi/tVOHFrC0pgzFLNktk1RizIMKH9h4Nss7Y6prOG6Wkfm7dbK7nJ213VLDC6TMEa8eAvT6ulAKt0+0+7C0mgtOaAbuJW9cS1GbLVzqJDCiIMhg8sW8w2rrePAdKYcAKL/i0JtdHCDu5RegX6eMs0mcgZy1/R3UkXtXqi2t12u9DDUPZu1V2ElQ9hQdecYGgP0gYdBBovxe4AoEGU+lcRqr5MLu5iIDnfFgcVzZyeeq1Qhmsxwbfcd+gjV7jWAbcILhtrLTxoUtrU+YnJveQzXFHwA6o2Rkhdp3PWA5GlqjsbDMnQv6V/CPA8j04ZCbhxP6G2WkfGsOJQLiK6RlFSOpYSmE3whUvKo2VWPSPgWrNwJMxHLhQSS1k0XHpSL0L8ghFsWclX3APj07kj+FM75MDv/JgEarR9XblduAzlAbH7WVZoyU+RJiuTkk1ED4SUPo1jcy8ijGQ3aSeKJqZI2nnCpPHU2C8VxSl+JtF7wiqdAg2RrREOcY34fBi7zPodvCag3WfjGAUkbOeDowEp78fpKcvZKMpDAKeopWjlhvwyFkf7mzYRAOAaAou958/yCfVG9Q0e5PuoUtM5YyEN+rXoQjLBvsM1MdYuwYF1ABUlRnx4DptixjXr1NyLCeu4YADPt2NLEeMN5WKS08wrz6skT/ihCQDvBC5r/O9XA8nI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6916009)(26005)(36860700001)(16526019)(186003)(47076005)(36756003)(70206006)(6666004)(70586007)(4326008)(2906002)(86362001)(83380400001)(8936002)(426003)(966005)(508600001)(8676002)(316002)(81166007)(336012)(356005)(44832011)(5660300002)(2616005)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 18:27:08.2673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 973f8844-d8be-4660-0f87-08d9af780623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1732
Received-SPF: softfail client-ip=40.107.212.69;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
third release candidate for the QEMU 6.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.2.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-6.2.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 6.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.2

Please add entries to the ChangeLog for the 6.2 release below:

  http://wiki.qemu.org/ChangeLog/6.2

Thank you to everyone involved!

Changes since rc1:

14d02cfbe4: Update version for v6.2.0-rc2 release (Richard Henderson)
4dd218fd07: iotests/149: Skip on unsupported ciphers (Hanna Reitz)
cb5a24d7f6: iotests: Use aes-128-cbc (Hanna Reitz)
22c36b75c8: block/vvfat.c fix leak when failure occurs (Daniella Lee)
0763788868: linux-user/signal.c: Create a common rewind_if_in_safe_syscall =
(Warner Losh)
c6cda6a44a: linux-user: Add host_signal_set_pc to set pc in mcontext (Warne=
r Losh)
a57cb3e23d: python/aqmp: fix send_fd_scm for python 3.6.x (John Snow)
206439cd89: scripts/device-crash-test: Use a QMP timeout (John Snow)
1611e6cf4e: python/machine: handle "fast" QEMU terminations (John Snow)
b1ca991993: python/machine: move more variable initializations to _pre_laun=
ch (John Snow)
72b17fe715: python/machine: add instance disambiguator to default nickname =
(John Snow)
6eeb3de7e1: python/machine: remove _remove_monitor_sockfile property (John =
Snow)
87bf1fe5cb: python/machine: add @sock_dir property (John Snow)
33a0c404fb: hw/intc/arm_gicv3_its: Revert version increments in vmstate_its=
 (Eric Auger)
c5ba621954: docs: Render binary names as monospaced text (Philippe Mathieu-=
Daud=C3=A9)
eff708a876: docs: Use double quotes instead of single quotes for COLO (Rao,=
 Lei)
8f75cae2dd: docs: Drop deprecated 'props' from object-add (Rao, Lei)
b980c1aec6: Fix some typos in documentation (found by codespell) (Stefan We=
il)
93e86b1664: docs: List more commit-message tags in "submitting-a-patch" (Ka=
shyap Chamarthy)
cd6b1674d6: docs: Fix botched rST conversion of 'submitting-a-patch.rst' (K=
ashyap Chamarthy)
4825eaae4f: Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2" (Peter Mayde=
ll)
e35574226a: nbd/server: Simplify zero and trim (Eric Blake)
1644cccea5: nbd/server: Don't complain on certain client disconnects (Eric =
Blake)
b9e5628ca5: microvm: check g_file_set_contents() return value (Gerd Hoffman=
n)
1b38ccc9a1: microvm: add missing g_free() call (Gerd Hoffmann)
d612405ed2: hw/i386/microvm: Reduce annoying debug message in dt_setup_micr=
ovm() (Philippe Mathieu-Daud=C3=A9)
4067691a2f: migration: fix dump-vmstate with modules (Laurent Vivier)
2e572baf65: ui/vnc-clipboard: fix adding notifier twice (Vladimir Sementsov=
-Ogievskiy)
c3abdb2faf: ui/gtk: graphic_hw_gl_flushed after closing dmabuf->fence_fd (D=
ongwon Kim)
f14aab420c: ui: fix incorrect pointer position on highdpi with gtk (Alexand=
er Orzechowski)
4323118cad: ui: fix incorrect scaling on highdpi with gtk/opengl (Alexander=
 Orzechowski)
802ae45e94: linux-user: fix Coverity CID 1464101 (Laurent Vivier)
526e744302: hw/misc/sifive_u_otp: Do not reset OTP content on hardware rese=
t (Philippe Mathieu-Daud=C3=A9)
6b717a8d44: hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP device instead =
of IF_NONE (Thomas Huth)
aee14c77f4: linux-user: Rewrite do_getdents, do_getdents64 (Richard Henders=
on)
1962cb0029: linux-user: Fix member types of target_dirent64 (Richard Hender=
son)
540a736f54: linux-user: Always use flexible arrays for dirent d_name (Richa=
rd Henderson)
fd08ddb9cb: linux-user: Split out do_getdents, do_getdents64 (Richard Hende=
rson)
319e89cdc3: escc: update the R_SPEC register SPEC_ALLSENT bit when writing =
to W_TXCTRL1 (Mark Cave-Ayland)
c29cd47e82: escc: always set STATUS_TXEMPTY in R_STATUS on device reset (Ma=
rk Cave-Ayland)
fdc6e16818: chardev/wctable: don't free the instance in wctablet_chr_finali=
ze (Daniil Tatianin)
fbab8cc24d: meson.build: Support ncurses on MacOS and OpenBSD (Stefan Weil)
5135fe7110: docs: Spell QEMU all caps (Philippe Mathieu-Daud=C3=A9)
283191640c: qtest/am53c974-test: add test for reset before transfer (Mark C=
ave-Ayland)
3f26c97577: esp: ensure that async_len is reset to 0 during esp_hard_reset(=
) (Mark Cave-Ayland)
0cc4965049: nvmm: Fix support for stable version (nia)
e2c57529c9: hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-39=
47) (Klaus Jensen)
916b0f0b52: hw/nvme: change nvme-ns 'shared' default (Klaus Jensen)
9fc6e86e8b: hw/nvme: reattach subsystem namespaces on hotplug (Hannes Reine=
cke)
0656fbc7dd: net/colo-compare.c: Fix incorrect return when input wrong size =
(Zhang Chen)
fb5eca4a57: net/colo-compare.c: Fix ACK track reverse issue (Zhang Chen)
d05dcd94ae: net: vmxnet3: validate configuration values during activate (CV=
E-2021-20203) (Prasad J Pandit)
58603ba268: target/i386/sev: Replace qemu_map_ram_ptr with address_space_ma=
p (Dov Murik)
ddcc0d898e: target/i386/sev: Perform padding calculations at compile-time (=
Dov Murik)
a0190bf150: target/i386/sev: Fail when invalid hashes table area detected (=
Dov Murik)
5a0294a21c: target/i386/sev: Rephrase error message when no hashes table in=
 guest firmware (Dov Murik)
9dbe0c93f0: target/i386/sev: Add kernel hashes only if sev-guest.kernel-has=
hes=3Don (Dov Murik)
55cdf56641: qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=3Don|o=
ff option (Dov Murik)
f3bc3a73c9: vfio: Fix memory leak of hostwin (Peng Liang)
a443d55c3f: tests/tcg/ppc64le: Fix compile flags for byte_reverse (Richard =
Henderson)
14554b3dcc: pmu: fix pmu vmstate subsection list (Laurent Vivier)
d06f3bf922: gitlab-ci/cirrus: Increase timeout to 80 minutes (Thomas Huth)
418ce0201f: Revert "device-crash-test: Ignore errors about a bus not being =
available" (Thomas Huth)
c94c239496: meson.build: Merge riscv32 and riscv64 cpu family (Richard Hend=
erson)
edcc4e4090: target/riscv: machine: Sort the .subsections (Bin Meng)
9f73de8df0: docs: rSTify the "SubmitAPatch" wiki (Kashyap Chamarthy)
0ff0dcf6b5: docs: rSTify the "SubmitAPullRequest" wiki (Kashyap Chamarthy)
0c8c45140c: docs: rSTify the "TrivialPatches" wiki (Kashyap Chamarthy)
fe644e8ebb: target/s390x/cpu.h: Remove unused SIGP_MODE defines (Thomas Hut=
h)
c398a241ec: scripts/device-crash-test: hide tracebacks for QMP connect erro=
rs (John Snow)
76f86e78b2: scripts/device-crash-test: don't emit AQMP connection errors to=
 stdout (John Snow)
47b43acd57: scripts/device-crash-test: simplify Exception handling (John Sn=
ow)
25de7f5012: python/aqmp: fix ConnectError string method (John Snow)
f26bd6ff21: python/aqmp: Fix disconnect during capabilities negotiation (Jo=
hn Snow)
6a23f8190f: meson: fix botched compile check conversions (Paolo Bonzini)

