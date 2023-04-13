Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855946E1857
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 01:34:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn6R7-00007M-Ps; Thu, 13 Apr 2023 19:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pn6R5-000074-Em
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 19:33:03 -0400
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com
 ([40.107.94.46] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pn6R1-0007Ws-0e
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 19:33:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pwv8eTY9NXPOUYJMYTPPEtHg7FqDP0L6K8zoq8yq9a3LNC4UywRUJzI8rA6vhDisZ1+dyXX3+bkTmFc8g/kMnUqBh1qmMhPgTDhMLVqrJf7X81O0isQ/5rA3FTGpqyuV5/97RwYCNb6jYd48zmJixwR4XIQUeMCPbkDx6qc/guE4Mp3bCHSIIuwsyEpA9r9dtD84nQKHCz24c4UGIHWTmifNRk9aGYt+7E56z5U5M8aK89R25yEXJoccPp9vxmPjMp+fKbyQhD7rrYhyrY3Q+aVN/jwvB4eIv422TrsU4JQ72NRhWKik2z9NQcKPbAR1WTuXzlz7N6wpyZfBu4ZWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcutNrA/ZLsZE0GSbxa/UTQEskT15ixdB0NbhOKo31A=;
 b=QK17wHyBv6pA4Bi94UQHhVMq3QIkYvQG3T/LPYx9uSzk47GDhq8grQIV+ftqZ6ZrJM/ugkXVebdRDEi/j4O8sKwXBY9cCgmkZCXlVMZHrt1vLLSwV0Oo+EfyPUkiODaBeq7ARFy+TfkcXaVaoi7sr0lRhpaNTCQrG7t6il9DxW2mFEaxlvVR95T0QJiAysMgkP8c5qGCYgkSaB4p9aNCRr8IBaomv8HhW3NjfVOcX/Ujnm+RK+yav1u/bLsuHjNcAFPJWCB5IINvZHwoog78ruj9OhHaoHGpbxc48BVFnJpzf3aKTAFoXko/SXv0WOPWto/qBRkMsK+xHdqedqxtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcutNrA/ZLsZE0GSbxa/UTQEskT15ixdB0NbhOKo31A=;
 b=luHnpHpJb++ScYW9wpaT7LNhU4U9ogzrIes7kBRrOq/i9eq7KtRL7+A+9XexoGY/tuLf6dvLIAsLleQVm5YTt98FsHrSEcJrbWMpA/fpgaulq7Ao2Q888ImukyaZhNMVPMXQNvvBvPY/SsN3osdic/XSYhoW4NaB65v+a/7OTPs=
Received: from DM6PR11CA0065.namprd11.prod.outlook.com (2603:10b6:5:14c::42)
 by CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 23:27:50 +0000
Received: from DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::ea) by DM6PR11CA0065.outlook.office365.com
 (2603:10b6:5:14c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 23:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT069.mail.protection.outlook.com (10.13.173.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.36 via Frontend Transport; Thu, 13 Apr 2023 23:27:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 18:27:49 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 8.0.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 18:27:34 -0500
Message-ID: <168142845428.12506.16330418133795838547@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT069:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: b72669b5-ea87-4ed9-5f22-08db3c76b2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jDIeWyvsIUOuf7W6BXzwEVO8ht8+18FqS6gSKqdwFHZie3VNed03t+1frKKAclMHyFjDBERv4Nj3OCWYoxSSJoDInUOJ2wfzB7pKK4bK+6IPelKXYsln1lipdqBEuiU08lTv37Tt3MUkF0UJDhbb/73f2Y3gNyxJLQMXlsMoIzz7N0Apqk/rCrtznCE85FdOG8LLJ2kUYw5ArfB8ZHvNKYlUerCFc/I7r+4tyZuZy+KOQApC+amueNJQurLtIXLcC/tBq/l41OMVN0WR2lcc51WttRZ92uB1TYXyvXd4yypak1FbL/ZVXegw+qM7/hbfm7UYIPFaMHx4gHO9CjfsNzAiAUBqscugUuSQdSYd1ADeJsYSCHG6nrPfD4Um/wRU23IgzQyAyGt0YzqT+QXKQr4z7FS/sK6XI588cXFRb2jQqSrhalkdxBk5b8WQL84BFuvuenhpnlquy3n0oom5c/mfdYqZjAB7wElRU+BA2ngsuUSO4JeSWYgOcIBAeghzebujKUWRmVQgwN0qbw8Rq8V7hiI3QoEDcgC6KtH3YUsA7QKaGA+WA65HodShMjMH5UD+sj0wRG5DnMclRzXwb/Q90fX+++PdFSHpYsPZPbKIoi/vvDvEEpAnr6Z0ApRYiXagfKGI4iLeQ9DbQx14AC7fMHtzApIyx8mP9DVYzE+RsXU9mLGhuGhu4NB+guXa6nMaSmNHQYjZREfnHtRUeJbhmpOubZbH4h4SqM7L4THlAZPNQ3szTBlrC1xG//Nl5y9l6PuwT1oX5eFnajbrQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(66899021)(36860700001)(41300700001)(82740400003)(40460700003)(36756003)(5660300002)(2906002)(86362001)(40480700001)(8676002)(356005)(6916009)(4326008)(8936002)(44832011)(82310400005)(70206006)(81166007)(70586007)(316002)(966005)(2616005)(336012)(426003)(47076005)(83380400001)(26005)(478600001)(186003)(6666004)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 23:27:50.4052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72669b5-ea87-4ed9-5f22-08db3c76b2b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339
Received-SPF: softfail client-ip=40.107.94.46;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fifth release candidate for the QEMU 8.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu.org/qemu-8.0.0-rc4.tar.xz
  http://download.qemu.org/qemu-8.0.0-rc4.tar.xz.sig

A note from the maintainer:

  This rc has rather more changes in it than I would ideally like
  in an rc4, due to a number of late-breaking bugfixes. However, I
  hope that we'll be able to make the final release next week, on
  Wednesday 19th April.

You can help improve the quality of the QEMU 8.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/8#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/8.0

Please add entries to the ChangeLog for the 8.0 release below:

  http://wiki.qemu.org/ChangeLog/8.0

Thank you to everyone involved!

Changes since rc3:

7dbd6f8a27: Update version for v8.0.0-rc4 release (Peter Maydell)
69d4e746b3: hw/xen: Fix double-free in xen_console store_con_info() (David =
Woodhouse)
28ef5339c3: migration: fix ram_state_pending_exact() (Juan Quintela)
37502df32c: migration/ram.c: Fix migration with compress enabled (Lukas Str=
aub)
06064a6715: migration: Recover behavior of preempt channel creation for pre=
-7.2 (Peter Xu)
6621883f93: migration: Fix potential race on postcopy_qemufile_src (Peter X=
u)
86d063fa83: io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side (P=
eter Xu)
3fe64abcde: block/nfs: do not poll within a coroutine (Paolo Bonzini)
4b32319cda: hw/nvme: fix memory leak in nvme_dsm (Klaus Jensen)
cb16e5c76f: hw/nvme: fix memory leak in fdp ruhid parsing (Klaus Jensen)
81f730d4d0: block, block-backend: write some hot coroutine wrappers by hand=
 (Paolo Bonzini)
9ed98cae15: block-backend: ignore inserted state in blk_co_nb_sectors (Paol=
o Bonzini)
e5203a3b5d: block-backend: inline bdrv_co_get_geometry (Paolo Bonzini)
2c5451ca52: migration/block: replace uses of blk_nb_sectors that do not che=
ck result (Paolo Bonzini)
8c6f27e7d8: block: remove has_variable_length from BlockDriver (Paolo Bonzi=
ni)
439cc330c5: block: refresh bs->total_sectors on reopen (Paolo Bonzini)
6188088f72: block: remove has_variable_length from filters (Paolo Bonzini)
160a29e2f8: block: move has_variable_length to BlockLimits (Paolo Bonzini)
6c50845a91: hw/i2c/allwinner-i2c: Fix subclassing of TYPE_AW_I2C_SUN6I (Pet=
er Maydell)
2b1f8fcb84: iotests: Regression test for vhdx log corruption (Kevin Wolf)
8af037fe4c: block/vhdx: fix dynamic VHDX BAT corruption (Lukas Tschoke)
20861f34e0: tcg/ppc: Fix TCG_TARGET_CALL_{ARG,RET}_I128 for ppc32 (Richard =
Henderson)
25acc3f279: tcg/mips: Fix TCG_TARGET_CALL_RET_I128 for o32 abi (Richard Hen=
derson)
7d9e1ee424: tcg/i386: Adjust assert in tcg_out_addi_ptr (Richard Henderson)
8539dc0055: target/arm: Copy guarded bit in combine_cacheattrs (Richard Hen=
derson)
6a3b1e440b: target/arm: PTE bit GP only applies to stage1 (Richard Henderso=
n)
a253231fbe: target/ppc: Fix temp usage in gen_op_arith_modw (Richard Hender=
son)
cc40b8b844: util/error: Fix use-after-free errors reported by Coverity (Ste=
fan Berger)

