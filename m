Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360596D7E96
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:05:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk3kD-0001nW-6d; Wed, 05 Apr 2023 10:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pk3k6-0001nK-HQ; Wed, 05 Apr 2023 10:04:06 -0400
Received: from mail-dm6nam10on20622.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::622]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pk3k4-0001ht-CC; Wed, 05 Apr 2023 10:04:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXEWkx4RMoQjYSyctHfZEnuAPqT8RqYWJkiZG0raXuzu6Gb9eppJhWu5GLLDaXkPH6rI7CSYf2mX1xcDgKK4Ni2RvdV5H+7JzwgYhmRSjEKZUrIyAChaWnuH2OAVdsfrfacB241O+HhZaA31izFj0XZx5+etFQvdQUxCVEeeWs55uciwD9Ts+j2Ua+us4kLBEkmHwGSJGL/8/7ebS27UXwPoK1UseiKd/bN2E/49lXY9AdyoN16SFDEZ4BtRRq97UP3JZ/fvTnG2UKFM4+Kh7OKq0Lgtgetrz8Y83rT2UfFrwMvB7JcSm1r7486DHyCindHebmqefrCzRDPRG2nxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ha4I9PRvpRPCLrhizZ6w9EV4vGkwZTl0LPUan0octOQ=;
 b=RM0cmK2sWl0kP9hq/F77WtxMFx4N81k7AD0CVhr9JUcN/wJl8IQWHZzibzja4l0DspaHqGxzsLMqHg7028oqy/d3om0xCNx/M15/BPQU3iIsGfB3u/DEBPMvTYZeBmryFzuZeBlTfJsmykuUEFKldsB9p2SjUM5yVk9UdtDznbKx9u6QeaLnMSlrFzohoZiNi0rUlEbPlnJbIVSA0u+XvrcX4+AB5932a+QauCitN4bs64SfO+dbPDOGC5IRuCT6NvzpIs2SDRzCkaFO0ysLRmiP6OYVy8yhQRoGvG1HjhWYis+BxBWthgVdSkJSAsgR1Ca+Mv/gExZ96tOnq9GgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=tls.msk.ru smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha4I9PRvpRPCLrhizZ6w9EV4vGkwZTl0LPUan0octOQ=;
 b=5nKK0z83wZ7BPI56eI2KYBfI6t5yGwD1VFmLAaNkSfLyRoQuhppOmt1yaYxXSUbPL4YQQYzzSaSdG9Sqw3rIUBbXcUaAdYTG4b4/PscKg+tzIl4ZSimSYHFSkzoabwCMqdasd498cmJOhSiV8uPesOJqBHNbJVRBL755lLRctDA=
Received: from BN9PR03CA0580.namprd03.prod.outlook.com (2603:10b6:408:10d::15)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 14:03:59 +0000
Received: from BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::59) by BN9PR03CA0580.outlook.office365.com
 (2603:10b6:408:10d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30 via Frontend
 Transport; Wed, 5 Apr 2023 14:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT112.mail.protection.outlook.com (10.13.176.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.16 via Frontend Transport; Wed, 5 Apr 2023 14:03:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 09:03:56 -0500
Date: Wed, 5 Apr 2023 08:58:18 -0500
To: Michael Tokarev <mjt@tls.msk.ru>
CC: QEMU Developers <qemu-devel@nongnu.org>, qemu-stable
 <qemu-stable@nongnu.org>
Subject: Re: QEMU stable 7.2.1
Message-ID: <20230405135818.52ggpbvumybryvr7@amd.com>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT112:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ffec7c-30d7-42e6-56f6-08db35de99e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0woXdCnTllNK6urBtZalgYpeZv96EvHl8r0cqaFgpeIRACU5SMeBBP1lQxc1imx0vNHvEyWev0YMGwpzr24UzVTBnvnIKlV0+TLfgVueSka7dOSv2ox4lUjxdTLO7FKSEZyAKuyGKvdYyZBgBKSpGqSITfDsoQVxuLLk18ThozF3QY69tr8M8n2mqed13sCGh6dgdob35a3inFdVT7nSPJqrr4hvsCGutmQn/QtfX6VBkdvUckJyLDdcV5iBmIPV9MIynjO8MYLDsD641lyMrn+OqEcPwYKpyAsXPGBX4yZBX6KAy8dqcyL/LhcdwaK5h3/PdfBkEHltuFQPDRxA49p3vuMvTHpZcJrr6RLyJM74HO9qCT5UDgvwPQirW+j8ersqyZZgzg+z2LNdn44bitsCmidJu+5BXp6bkjYbwRIu/E9dgyOxb0Sdjx/U3sM0dWVugrs1vCIdKTTCYslsNkgbudD3COzfkG3qG0WMGknkk909BAKQk19i6fSYvo4fWQAa6Zskd+G9C7pmN44rKITyc3GzHV5GPbG/7qfj56N4wfRZg9aJUzJjZHk7RBrVx+spDoBtGoIor/mXEo9z478NPb9rETAJ0NVBD5ijRHlfW03wewrcTASq5EnSetIc44E7Q0CpJXFN3DlsKtJqS5UadfDNsb1QcYrvvbAmwka7nBPAKa5RVvX9EhfQjGFGR0jxiP8cTjXbMFBbXx3YyTnC2PcAVgEdsvItOFtM+iM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(6666004)(336012)(966005)(66574015)(36756003)(2616005)(83380400001)(40480700001)(426003)(82740400003)(36860700001)(86362001)(82310400005)(26005)(81166007)(40460700003)(356005)(47076005)(16526019)(1076003)(186003)(44832011)(70586007)(8676002)(6916009)(2906002)(7116003)(70206006)(316002)(41300700001)(54906003)(8936002)(4326008)(5660300002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 14:03:58.3216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ffec7c-30d7-42e6-56f6-08db35de99e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
Received-SPF: softfail client-ip=2a01:111:f400:7e88::622;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Michael Roth <michael.roth@amd.com>
From:  Michael Roth via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 05, 2023 at 02:54:47PM +0300, Michael Tokarev wrote:
> So let it be, with a delay of about a week.
> 
> Since no one from the qemu team replied to my final-release steps, I'm
> making it available on my site instead:
> 
>   http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz
>   http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz.sig - signed with my GPG key
>   http://www.corpit.ru/mjt/qemu/qemu-7.2.1.diff - whole difference from 7.2.0.
> 
> The tag (v7.2.1) is in the main qemu repository.

Hi Michael,

Thanks for handling this release!

Somehow I missed your final steps email, but for future releases I would
recommend going ahead and tagging your release (also signed with your GPG
key) in your local tree once you've got everything ready, and then sending
me an email to directly so I can push that to gitlab and then handle
creating the tarball and publish it with my GPG key. That's basically what
we do for the normal QEMU releases as well.

Then once you get your accounts set up by gitlab/qemu.org admins you can
handle the tag-pushing/tarball-uploading on your end. Would be good to
have someone else involved with that process so we have some redundancy
just in case.

For 7.2.1:

I could also upload your tarball, but we'd also want a signed .bz2 tarball
to accomodate any environments that still try to consume the .bz2 versions
(even though we don't actively advertise them on the website). We'd also
need to update the GPG key published on the website at
https://www.qemu.org/download/

So for this one it might make sense to keep the tarball published where you
have it, and I'll just mirror your 7.2.1 tag to QEMU gitlab under a new
stable-7.2 branch like we've done in the past. Then for subsequent
releases I'll publish as mentioned above until you have upload/push access.

If that sounds reasonable to you (and everyone else) I'll go ahead and
push the stable-7.2/7.2.1 branches to by gitlab EOD tomorrow my time.

Thanks!

-Mike

> 
> The shortlog:
> 
> Akihiko Odaki (4):
>       vhost-user-gpio: Configure vhost_dev when connecting
>       vhost-user-i2c: Back up vqs before cleaning up vhost_dev
>       vhost-user-rng: Back up vqs before cleaning up vhost_dev
>       hw/timer/hpet: Fix expiration time overflow
> 
> Alex Bennée (2):
>       target/arm: fix handling of HLT semihosting in system mode
>       tests/tcg: fix unused variable in linux-test
> 
> Anton Johansson (1):
>       block: Handle curl 7.55.0, 7.85.0 version changes
> 
> Carlos López (2):
>       vhost: avoid a potential use of an uninitialized variable in vhost_svq_poll()
>       libvhost-user: check for NULL when allocating a virtqueue element
> 
> Chenyi Qiang (2):
>       virtio-mem: Fix the bitmap index of the section offset
>       virtio-mem: Fix the iterator variable in a vmem->rdl_list loop
> 
> David Hildenbrand (2):
>       migration/ram: Fix error handling in ram_write_tracking_start()
>       migration/ram: Fix populate_read_range()
> 
> Dr. David Alan Gilbert (2):
>       virtio-rng-pci: fix migration compat for vectors
>       virtio-rng-pci: fix transitional migration compat for vectors
> 
> Eugenio Pérez (1):
>       vdpa: stop all svq on device deletion
> 
> Evgeny Iakovlev (1):
>       target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled
> 
> Guenter Roeck (1):
>       target/sh4: Mask restore of env->flags from tb->flags
> 
> Jason Wang (3):
>       vhost: fix vq dirty bitmap syncing when vIOMMU is enabled
>       intel-iommu: fail MAP notifier without caching mode
>       intel-iommu: fail DEVIOTLB_UNMAP without dt mode
> 
> Julia Suvorova (1):
>       hw/smbios: fix field corruption in type 4 table
> 
> Kevin Wolf (1):
>       qcow2: Fix theoretical corruption in store_bitmap() error path
> 
> Klaus Jensen (2):
>       hw/nvme: fix missing endian conversions for doorbell buffers
>       hw/nvme: fix missing cq eventidx update
> 
> Laszlo Ersek (1):
>       acpi: cpuhp: fix guest-visible maximum access size to the legacy reg block
> 
> Marc-André Lureau (1):
>       build-sys: fix crlf-ending C code
> 
> Michael S. Tsirkin (6):
>       Revert "x86: do not re-randomize RNG seed on snapshot load"
>       Revert "x86: re-initialize RNG seed when selecting kernel"
>       Revert "x86: reinitialize RNG seed on system reboot"
>       Revert "x86: use typedef for SetupData struct"
>       Revert "x86: return modified setup_data only if read as memory, not as file"
>       Revert "hw/i386: pass RNG seed via setup_data entry"
> 
> Michael Tokarev (1):
>       Update version for 7.2.1 release
> 
> Paolo Bonzini (4):
>       meson: accept relative symlinks in "meson introspect --installed" data
>       configure: fix GLIB_VERSION for cross-compilation
>       target/i386: fix ADOX followed by ADCX
>       block/iscsi: fix double-free on BUSY or similar statuses
> 
> Richard Henderson (8):
>       target/riscv: Set pc_succ_insn for !rvc illegal insn
>       target/arm: Fix sve_probe_page
>       target/arm: Fix in_debug path in S1_ptw_translate
>       target/arm: Fix physical address resolution for Stage2
>       tests/tcg/i386: Introduce and use reg_t consistently
>       target/i386: Fix BEXTR instruction
>       target/i386: Fix C flag for BLSI, BLSMSK, BLSR
>       target/i386: Fix BZHI instruction
> 
> Stefan Hajnoczi (1):
>       block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
> 
> Yajun Wu (1):
>       chardev/char-socket: set s->listener = NULL in char_socket_finalize
> 
> I want to make another release of 7.2 series.
> 
> Thank you all for all the help with this series!
> 
> /mjt
> 

