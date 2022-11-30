Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616A63E301
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0V5x-0007nr-RL; Wed, 30 Nov 2022 16:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1p0V5v-0007nh-Nx
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:58:19 -0500
Received: from mail-co1nam11on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::605]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1p0V5s-00088H-G7
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:58:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZRBrIdCbcCIcVLf1vBZf5e8xjSYvoY7dKAQGShiK9kEUFyP1FxXlLWRb0imJDHUjxWsL5IKSrvkBSvwrl5gr6oWt/NA2cUlbVukfFKxkpzcwUub9OdKVAEmFVP/zMF6Ru09X3Y1p+CgXstpPOKjUTCpK0hFdZaNN2CjJcata8C3PYxMC1m0+6/evpLFdmyC0aRsQ0WLk7qdd5O2bS4YpJP0TGT3WxjzStlEiV0LM4VpNIdFR57GT+iLMzZEzYBDSvU4uK2nRt60Ti+1+0SDXi5C72yJnDHMjtvT39ZqXFmlzeBVXoGHH1u7jpy37GyYpNSrdfiAFDAXKTokzXc74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZsIwIx312uVkBOntI/Au29XyU8Mevof4l4Doer0DEI=;
 b=dvrwkI9/kUDYX3uh03+KKrio1+1Nt/zZqVv1x+5fvTDl1XarGW4kDN4HhHcLiuOVD6n2M37B6YW7+6XwYRPzxlpZHKI6CLghxLwncLD9f+zcDXOHXjs4kndLKJ7blUqcUGzpks1K2yI7OLF2A5c+PIUBmLNobKHKrIp9AS0yrQwmlQzZ5qDh0H0WMWw9H7Ubtuisvs0UlMBqiGXM69ItHnK645hgbzZbHphpink4CTVfVHBrfWY9lnO8wdxw4DYc3kJy3SzfqTKgdv7EKyU8lrxubUtqyODLKd3OVB2fqj24F7Id6dOhMot4xNj3DUAMiLFcmXEyP5CKUi0CcbPDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZsIwIx312uVkBOntI/Au29XyU8Mevof4l4Doer0DEI=;
 b=XdnQUUjACUo8YiXWI9MQbxFQ/1KpZn/0LLwYptsQrn8EAiWVq5X3TCoLgFUP0wlu6fh/GFAKCstD7+doDiPiP1cV8GZD1Di+fgUbPsh3JYF/pKsfIULoyFWvZLAsxZk6M1H/H6iMwUQkHm/9wH189vl3upkDYvLKq5z1s/A5Pj4=
Received: from MW4P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::22)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 21:58:08 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::25) by MW4P220CA0017.outlook.office365.com
 (2603:10b6:303:115::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 21:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Wed, 30 Nov 2022 21:58:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 15:58:06 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.2.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <stefanha@gmail.com>
Date: Wed, 30 Nov 2022 15:57:49 -0600
Message-ID: <166984546967.2732.2402932198415114885@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f52481-ff36-415e-c203-08dad31df70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: chdedJo2FhiYV5t+pXhlpxi2RCCBXJjgQFN37ZtlxIGltqEcFNHCKalMGGSvzosdEbUarw6Wp+VbWlQuuyNpMPPc64zCIIyM31y8SrYhCHHwehkRM84295h9IBoLFQQ+WcVMxvl9B5PUsc5j0+w/l2TyBMcifLmtdE0a1aMaAh1Aso7m6QbgY9abaMiaI+AMPpFrP7IX6BJ4pHUD80oy8CjeBNlLRF78YEv424XgR8TphfpnDDX4426SyLUzvOFkR3PsadjQ+fVHnIj/O6cTRQsdsPEWVJWMBM+DwyirnD1JJOvpZoLmUDsSStP1reKtTyzMZ9WURFE6hBTjI82DsdjHRDQa2pmB1pz6brZLGvJhejZSVbNgI+USd+c352WD/AGWSvMfFSvrU8zF2rbyU1VHLv6NOSpFIPTWLEYb2ktX8cdIBLvc8lgcf5T5sxbpaoCi0M6oZ7GgS93kOhBONqvlKh6c3wCVoRjCsqns0PaHXz/uJ9m+3eijS9trI1UxsSCrW68ankYkrp6wMsF5zzBdf53lXq0ml9rXsCP0Mt4S7YuLG1jwmw0dKheMPMm/TuakAIoHzRfWRuE0wL/dG8habgZFYvvBC5Bu38LePycaFXhNv2os62VOlJwPoRDM0oBYX0g1M8mFrc/0aI/W7pn4ayHYixfnypKfUrnJQUqRmqk0ePMZJcmibODeIOo7KMsRIB/JAiwbdJJY/8oyVR9SAIANcySXmeOiA/mCKVEek58UIPgvxBiVs4V+mOGvP9dwOs7yZiGl0yRhn+WjWCHkOnWYnvIdHx7LlM6aQaJW8UNv0qBe07xzM9xZgtzL
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(5660300002)(36756003)(86362001)(70206006)(8936002)(336012)(26005)(186003)(16526019)(2616005)(316002)(40460700003)(4326008)(6916009)(6666004)(40480700001)(70586007)(426003)(36860700001)(82740400003)(2906002)(44832011)(47076005)(66574015)(8676002)(82310400005)(83380400001)(356005)(478600001)(966005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 21:58:07.7170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f52481-ff36-415e-c203-08dad31df70d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
Received-SPF: softfail client-ip=2a01:111:f400:7eab::605;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fourth release candidate for the QEMU 7.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.2.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-7.2.0-rc3.tar.xz.sig

A note from the maintainer:

  Another release candidate will be published next week to include
  vhost-user fixes that are currently being finalized.

You can help improve the quality of the QEMU 7.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/7#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.2

Please add entries to the ChangeLog for the 7.2 release below:

  http://wiki.qemu.org/ChangeLog/7.2

Thank you to everyone involved!

Changes since rc2:

c4ffd91aba: Update VERSION for v7.2.0-rc3 (Stefan Hajnoczi)
475e56b630: target/arm: Set TCGCPUOps.restore_state_to_opc for v7m (Evgeny =
Ermakov)
7103895123: block-backend: avoid bdrv_unregister_buf() NULL pointer deref (=
Stefan Hajnoczi)
86fdb0582c: hw/display/qxl: Assert memory slot fits in preallocated MemoryR=
egion (Philippe Mathieu-Daud=C3=A9)
6dbbf05514: hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022=
-4144) (Philippe Mathieu-Daud=C3=A9)
8efec0ef8b: hw/display/qxl: Pass requested buffer size to qxl_phys2virt() (=
Philippe Mathieu-Daud=C3=A9)
b1901de83a: hw/display/qxl: Document qxl_phys2virt() (Philippe Mathieu-Daud=
=C3=A9)
61c34fc194: hw/display/qxl: Have qxl_log_command Return early if no log_cmd=
 handler (Philippe Mathieu-Daud=C3=A9)
fb72e779eb: replay: Fix declaration of replay_read_next_clock (Richard Hend=
erson)
a704cb59fd: update seabios binaries to 1.16.1 (Gerd Hoffmann)
ab1b2ba9c9: update seabios source from 1.16.0 to 1.16.1 (Gerd Hoffmann)
ac14949821: Add G_GNUC_PRINTF to function qemu_set_info_str and fix related=
 issues (Stefan Weil via)
ec09f22d01: MAINTAINERS: Add subprojects/libvhost-user to section "vhost" (=
Stefan Weil via)
52a57d8d1f: libvhost-user: Add format attribute to local function vu_panic =
(Stefan Weil via)
7d4774e681: libvhost-user: Fix two more format strings (Stefan Weil via)
8541bf452d: libvhost-user: Fix format strings (Stefan Weil via)
266aaedc37: libvhost-user: Fix wrong type of argument to formatting functio=
n (reported by LGTM) (Stefan Weil via)
c23a956366: virtiofsd: Add `sigreturn` to the seccomp whitelist (Marc Hartm=
ayer)
7d3cf19548: hw/audio/intel-hda: Drop unnecessary prototype (Peter Maydell)
3e95ef49e6: hw/audio/intel-hda: don't reset codecs twice (Peter Maydell)
1dfb7a175f: hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset() (=
Peter Maydell)
64f1359bd0: ui/gtk: prevent ui lock up when dpy_gl_update called again befo=
re current draw event occurs (Dongwon Kim)
d68640f515: hw/usb/hcd-xhci.c: spelling: tranfer (Michael Tokarev)
29e0bfffab: gtk: disable GTK Clipboard with a new meson option (Claudio Fon=
tana)
fb977a8174: Revert "usbredir: avoid queuing hello packet on snapshot restor=
e" (Joelle van Dyne)
4189af72dd: tests/avocado: use new rootfs for orangepi test (Alex Benn=C3=
=A9e)
9f083d6181: tests/qtest: Decrease the amount of output from the qom-test (T=
homas Huth)
72cf57b074: tests/avocado: Update the URLs of the advent calendar images (T=
homas Huth)

