Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473FA3E07A0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:31:08 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLfX-0004Qt-9m
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mBLMR-0002HS-VV
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:11:25 -0400
Received: from mail-bn8nam12on20613.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::613]:53280
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mBLMP-0006N1-27
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:11:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/3CtdQfyt9K9yYckC1d4ck8rDVPJ8RLl1C+v/GgL0lVzk4H4ap02QoqRfiYInoATGUH99BTsvb3sxwRH7grNL7CDOZXVIzeDYQ4d1VwNYUVKuQLbVg+hsBg2J2R5j6cbo/4g9ltGdXhxhwIsIwr9ZYUf/uHR6DfFFtxLuNYHFc+/TlxgCj5rbSiJuYM45H5asgDSXiG3dHQOKxAXB5vsjN8HtEnuXXoeASMlR9mhcAaH5Lv1Fsh7TLtGpQTD3DajArkaund8gv+2YuTb3mCXVyCMTcT/gAHVmbqgTXjwop2LGwV9uBfRloZ5YFZMxnnSBKBomaDwUpeauRvqTzGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGCuaApUrac4UkedUIGBafnXbunvSqdxT3UzQ5V3x1s=;
 b=V0BR9/1fRKawT6NRQsnCltCWRX/8zFdAKPUQu0iM+DGv1J+cNlsN+r1kKXzZdQ67KLFnsbc3sQ3QCnmiimN1Uu96ONLGPgHKjXvtVZsKQWf+/rKySw9fsVNjAvm+cyrhUlYX7tkkzVsvxTLFf4bqrkV8EEdCpydn4PB+8wwHNOJ22CpUSuTtaMnnPje/ECigHd9MkZSaJuD/w6rG8LPTXMjurOrtnCr4m8K7mIiskg2mdnBd1B6HLlvObdyakijMDLPOZHc0lSUZdi3ieLy9HKIb4ywJvbefHq9LkLuy0p4ud7ACnyzMKhCWvi7G3QDzCzLEefuIWVW/xi8VBkKWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGCuaApUrac4UkedUIGBafnXbunvSqdxT3UzQ5V3x1s=;
 b=iOrthXSTrK+5LaOedgJreydI+LKbeqVdba/o3ebvTtyB+7kKa3LhlPPZl84drBPQZ9k57w05Q4StREhTLi+HUlik28gLVG16vXZ8F2St3x9fdnpCqrrEIK1NfXZYCKrkPtWAumI55htmzlSlLd1tEOWxseKMock18srAUmmgam8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4891.namprd12.prod.outlook.com (2603:10b6:610:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 18:06:15 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4394.017; Wed, 4 Aug 2021
 18:06:15 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Wed, 04 Aug 2021 13:05:11 -0500
Message-ID: <162810031138.1167212.50563546711940033@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SN6PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:805:ca::27) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SN6PR16CA0050.namprd16.prod.outlook.com (2603:10b6:805:ca::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 18:06:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a1082d-1b31-4036-375f-08d957728cee
X-MS-TrafficTypeDiagnostic: CH2PR12MB4891:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4891686027B9792030FA39CA95F19@CH2PR12MB4891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiQ8ptqgK7W4OBL2Vq9h1HMM70HMJM7t4TI5kNhRahlGD23xowlJhewR5WcTo0pUYEZSzxaod6X0zrHDG7drWX9hMAONgN76K6tIqhO8XiQBCPRatz7+bzH0+64Iwe/uw4Ws7cUUBed0vBGeyt5GgFngz5gZbYTT1Az6Q+URf4v68ra7D33mc1eREphBha5W7PCay8ileBo2nrJesJRffIXcxELx5E056dJL27y4cUEhYWQ/1BNdZyO37DYehOhjMVJ05zZto7GA04xHlGWtQUY6y5fmnFb3JY7Lk16hAYDJJGXC5IqoeCZEHfG6Z72xTU4jsPzK5YuTVOlo9fATjvYDdnNTCJzEWW+gxmkHRh6QH53Ms6cdl7WPpUpLeZMR1bpr4AY/G+VEK5ZxSuXIWD0DHnZaIqECgmGXQFtO936r62oOZdf1yun/aoFrUcGbagW4se1FU4yTFZ96s3FwRD9wuGjqOms4SVIqMgRafy7ZFOgtA/SmBMoD0CRXP1NNHXahhMNQnmS5HCkrGIC8C9wuCvrKSt+98s9dLOGA96tqjMFGKCdXi4b+nDcHhZSFURWlFQqbxkQ1Ug6lJmAJSg5fPEuPirpLRYRv3kKpTcoPHbWwsbBsl4r1cZ55CQJr764awG3vGlmAVbcyQ1lpzcA9zJNpg95rsYGSRdIoBKsdZTtcwOwhdytEuBuaJRr8uXxL/rNwc5qbfs6TkYSV23cE1qFyKT5qmV+t/JXNQpA+qw/GrO0nLLIxP7KUnMRFqNpS1EpXYLJqEG45K/F01B3UIes2yMFC5SM9dpbmqLQ7Ja7YnvRKLfsO/aO52OOu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(86362001)(966005)(4326008)(6486002)(26005)(6916009)(52116002)(5660300002)(38100700002)(6496006)(8936002)(478600001)(38350700002)(36756003)(6666004)(8676002)(316002)(44832011)(2616005)(66556008)(66476007)(2906002)(956004)(83380400001)(186003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JkdVM5NzZ5VERZWkYwRnZHVUVPSEJhaHpvOVVUNUM3WGpHdlBPUFFPdEJs?=
 =?utf-8?B?WlB3aGU5d0VjNjZpRitQZ1hJdFh2S0kra0JVMEVuWXEyV2piZDlrZUdOQ1cv?=
 =?utf-8?B?L01JY2NrcHd1bTN2eVJGYXB1YTFVT0lRYTJTL2hHTTNrY1VNelVhQkcwY0hT?=
 =?utf-8?B?UzVYTHFSd2dBWHlZdHNhSENOVUMvZkZ4NllqdFFEc2Q2Mm82SktPbit1S1pq?=
 =?utf-8?B?SWhRMmhOcDlHNWFobDZFWGpVcVBqRlkyYjdRei9MNkdXb29idUpxQUJhS2Iv?=
 =?utf-8?B?eVJMZkFPd1ZSZ3lnbjdxZU1LalJCZ1RuUnZId09pR1p3aXlXclZ4SXA5OGxJ?=
 =?utf-8?B?L3FpTXNYYUVweHdCckhUTDVTaUtoSmNqSnE0SExqdEwrZ0pnK2VKVzh1MWNC?=
 =?utf-8?B?bU9VTDhKK3dCZkxnTzRmbW1OMzkzRlZvMWpzakR1NkRCREFwbjlLREdPSkpr?=
 =?utf-8?B?VDZRZzk4VlR2VmwyZHhqM3ZnaHpidEpyR2tEV2tubGJoOFpFamNEeTlOd21O?=
 =?utf-8?B?bGNzQlYrYmV5MG1SZ3VGbkxxcUVwMHFiTVNBWnlHQzdLVUlCb2tVeTRNTHVT?=
 =?utf-8?B?bE9iZ0JBVFNOYVdRS1ZCYzBZMlBhcHdYQ1A3WXdTTjdHRlI0RWp2UnArb3Vs?=
 =?utf-8?B?bmdrSG9OMXF0b1ZLU1F2bzlVRGp3QXRvRVg2eFFTcS9lZitSOEVwQjNmeDl2?=
 =?utf-8?B?ckg0eXlkUjkzakZMWGdmKzUyODF0VlAzcG4vNVdMcDZmazVyKy9uTXFoODhC?=
 =?utf-8?B?RERmYmhJYlg0K01vdlFxekNhWDlKaDVwZGgxVUp2bnlxVGNiRTJBZDZXWW9Q?=
 =?utf-8?B?eHhBdFp1U3ZMSHV0M25RMGJlT2JBS1RHNWNLRzJUWTA5TXB1Ti9JUzFsUGk2?=
 =?utf-8?B?VVloOXVIbk5sUmliNk0vMGdmN1JwRkZxdlU1cEx4MythTEVzQ1RKR25ma1Zz?=
 =?utf-8?B?QVZIakJPQmZmeVdTOUM5MXIxOWVkMmpFNFVLVEtMMDlLVm5zNVBteExCMWlz?=
 =?utf-8?B?UGZ3aVBJT20yR015MWJ5K3FFa1d0WWs2K2NhbDJVb2dLTFJSVVR5dHJGRWQ0?=
 =?utf-8?B?VmE5UU4vQWs0UVBUeWdFNjVJK0hrUG15SSttMFcyeWlTUkViMFMrWEU1dUJ1?=
 =?utf-8?B?c3dOT2FYY05NMGt2dDJ6dEROTGlqYnhGUnZBZTdBSzE4aHN5U2t4NmQzbnY1?=
 =?utf-8?B?MlNud1ZESVJiTVBEWFluYk1DRnJ4RXduWHlOMnlJUEk0b0hNN1ZWUy83YjFn?=
 =?utf-8?B?UXRKY2dDUlpDc051U0d5SGdVY0RxV3JoN0hmRi9CQnVhVlIzdVl2ZURlUUJN?=
 =?utf-8?B?S211SUFhbFFkc3pMQVkvU09RK0FNdE5lSS83Q2FnWTRGZE11SHdPOEpoaHRN?=
 =?utf-8?B?U0dxdEJMQ2VYaUNrQk9OL2lTYlRBQU40SmVjTk1ycGxxa0dJaGkxKzVyVFI2?=
 =?utf-8?B?Umk1aHA2ZTNiSjExSDdIMFhZUWhnR05QTlhPV3JyeXdXVDBYYWN5ODJaVHor?=
 =?utf-8?B?NitLT1U5RDJkaG1zcElyd3YzZEt1Q3hIbm5SZHBocFJZRW1EemI3THpidEU2?=
 =?utf-8?B?RUhPSWx0UHN6Y1YzZUFLVGFLWkptVnlVUmpzcWdPZUNLR0VVN09mQUtVbGhN?=
 =?utf-8?B?MDVLbjRKNUIwWW1mOUZqb0s4U3hScmdMN1ZNQUgraTFOTUxuVTNWQ1ZNeUZR?=
 =?utf-8?B?OFVFVTF2Q1pyRzh5WEVVY2dybElPQVJ5bUNkWWFSaFRUK2UvVnhxeldYMzdE?=
 =?utf-8?Q?Ha4AxqVt2gECCxGgwiQS91Sf5MuG1lxmqojLG+x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a1082d-1b31-4036-375f-08d957728cee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 18:06:15.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q75CUgChQjYht5E4V/4aLyxwPuT/4PIvUME5ymtlnL3d8YHkXJPl4vo+zsG21nisJ3qRpNig5ZuSCFh8b0pWsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4891
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::613;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
third release candidate for the QEMU 6.1 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.1.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-6.1.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 6.1 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.1

Please add entries to the ChangeLog for the 6.1 release below:

  http://wiki.qemu.org/ChangeLog/6.1

Thank you to everyone involved!

Changes since rc1:

bccabb3a5d: Update version for v6.1.0-rc2 release (Peter Maydell)
62a4db5522: Drop _DSM 5 from expected DSDTs on ARM (Michael S. Tsirkin)
40c3472a29: Revert "acpi/gpex: Inform os to keep firmware resource map" (Mi=
chael S. Tsirkin)
5cd4a8d4e5: arm/acpi: allow DSDT changes (Michael S. Tsirkin)
d7346e614f: acpi: x86: pcihp: add support hotplug on multifunction bridges =
(Igor Mammedov)
e2a6290aab: hw/pcie-root-port: Fix hotplug for PCI devices requiring IO (Ma=
rcel Apfelbaum)
4ac0b72bae: hw/sd/sdcard: Fix assertion accessing out-of-range addresses wi=
th CMD30 (Philippe Mathieu-Daud=C3=A9)
2a0396285d: hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PR=
OT (Philippe Mathieu-Daud=C3=A9)
87ab880252: block: Fix in_flight leak in request padding error path (Kevin =
Wolf)
50e36dd616: tests/tcg: Test that compare-and-trap raises SIGFPE (Jonathan A=
lbrecht)
ccb5f2708f: linux-user/s390x: signal with SIGFPE on compare-and-trap (Jonat=
han Albrecht)
54ba2161d8: target/s390x: Fix SIGILL and SIGFPE psw.addr reporting (Ilya Le=
oshkevich)
43f547b73d: Update libslirp to v4.6.1 (Marc-Andr=C3=A9 Lureau)
e300858ed4: qga-win/msi: fix missing libstdc++-6 DLL in MSI installer (Mich=
ael Roth)
5f2a8b1fc1: qemu-ga/msi: fix w32 libgcc name (Gerd Hoffmann)
24328b7a83: qga-win: Free GMatchInfo properly (Kostiantyn Kostiuk)
ce72f11274: qga-win: Fix handle leak in ga_get_win_product_name() (Basil Sa=
lman)
02ac3f4b95: qga-win: Fix build_guest_fsinfo() close of nonexistent (Basil S=
alman)
3d98f9b68d: qga-win: Increase VSS freeze timeout to 60 secs instead of 10 (=
Basil Salman)
4a64939db7: docs: Move user-facing barrier docs into system manual (Peter M=
aydell)
399a04775e: ui/input-barrier: Move TODOs from barrier.txt to a comment (Pet=
er Maydell)
6cb02f1522: docs: Move the protocol part of barrier.txt into interop (Peter=
 Maydell)
bd77bc8b89: docs: Move bootindex.txt into system section and rstify (Peter =
Maydell)
dae257394a: hw/arm/boot: Report error if there is no fw_cfg device in the m=
achine (Peter Maydell)
4d6646c7de: docs/tools/virtiofsd.rst: Delete stray backtick (Peter Maydell)
1662ea9f4b: docs/about/removed-features: Fix markup error (Peter Maydell)
6df743dc31: docs: Format literals correctly (Peter Maydell)
8a48a7c2e0: docs/system/arm/cpu-features.rst: Format literals correctly (Pe=
ter Maydell)
9c372ecfec: docs/system/s390x/protvirt.rst: Format literals correctly (Pete=
r Maydell)
1e235edab8: docs/devel: Format literals correctly (Peter Maydell)
4df3a7bf8f: docs/devel/migration.rst: Format literals correctly (Peter Mayd=
ell)
f0d7b970ac: docs/devel/ebpf_rss.rst: Format literals correctly (Peter Mayde=
ll)
d463f3c79a: docs/devel/build-system.rst: Correct typo in example code (Pete=
r Maydell)
35a4ca4031: docs/devel/build-system.rst: Format literals correctly (Peter M=
aydell)
4e0b15c252: docs: Move licence/copyright from HTML output to rST comments (=
Peter Maydell)
199a436305: docs: Remove stale TODO comments about license and version (Pet=
er Maydell)
7c6ef61a5c: MAINTAINERS: Don't list Andrzej Zaborowski for various componen=
ts (Peter Maydell)
b1b3e3e3bf: docs: Add documentation of Arm 'imx25-pdk' board (Peter Maydell=
)
fa6c93944a: docs: Add documentation of Arm 'kzm' board (Peter Maydell)
c9543db4cc: docs: Add documentation of Arm 'mainstone' board (Peter Maydell=
)
cfe6d6841f: hw/net: e1000e: Don't zero out the VLAN tag in the legacy RX de=
scriptor (Christina Wang)
d897056960: hw/net: e1000e: Correct the initial value of VET register (Chri=
stina Wang)
a1d7e475be: hw/net: e1000: Correct the initial value of VET register (Chris=
tina Wang)
11744862f2: hw/net/can: sja1000 fix buff2frame_bas and buff2frame_pel when =
dlc is out of std CAN 8 bytes (Pavel Pisa)
9010b0c7a9: hw/net/vmxnet3: Do not abort QEMU if guest specified bad queue =
numbers (Thomas Huth)
236f6709ae: target/nios2: Mark raise_exception() as noreturn (Philippe Math=
ieu-Daud=C3=A9)
7039e1f604: accel/tcg: Remove double bswap for helper_atomic_sto_*_mmu (Ric=
hard Henderson)
e17bdaab2b: coverity-model: write models fully for non-array allocation fun=
ctions (Paolo Bonzini)
0da41187df: coverity-model: constrain g_malloc/g_malloc0/g_realloc as never=
 returning NULL (Paolo Bonzini)
05ad6857a5: coverity-model: clean up the models for array allocation functi=
ons (Paolo Bonzini)
96915d638c: coverity-model: remove model for more allocation functions (Pao=
lo Bonzini)
243a545bff: coverity-model: make g_free a synonym of free (Paolo Bonzini)
d4b3d152ee: coverity-model: update address_space_read/write models (Paolo B=
onzini)
e4383ca240: vl: stop recording -smp in QemuOpts (Paolo Bonzini)
a3c2f12830: vl: introduce machine_merge_property (Paolo Bonzini)
cc8eecd7f1: MAINTAINERS: Added myself as a reviewer for the NVMe Block Driv=
er (Philippe Mathieu-Daud=C3=A9)
54caccb365: block/io_uring: resubmit when result is -EAGAIN (Fabian Ebner)
0ef2801423: MAINTAINERS: add Stefano Garzarella as io_uring reviewer (Stefa=
no Garzarella)
30a20f2c5a: docs: Fold usb2.txt passthrough information into usb.rst (Peter=
 Maydell)
557ae9763a: docs: Fold usb2.txt physical port addressing info into usb.rst =
(Peter Maydell)
78da86dce1: docs: Fold usb2.txt USB controller information into usb.rst (Pe=
ter Maydell)
2a49e4e927: docs: Incorporate information in usb-storage.txt into rST manua=
l (Peter Maydell)
5e796671e6: usbredir: fix free call (Gerd Hoffmann)
8a2d766f05: ci: add libusb for windows builds (Gerd Hoffmann)
663fdc815e: usb-host: wire up timer for windows (Gerd Hoffmann)
4fe29344be: libvhost-user: fix -Werror=3Dformat=3D warnings with __u64 fiel=
ds (Marc-Andr=C3=A9 Lureau)
3f55f97b14: meson: fix meson 0.58 warning with libvhost-user subproject (Ma=
rc-Andr=C3=A9 Lureau)
f594bfb79f: target/i386: fix typo in ctl_has_irq (Paolo Bonzini)
eceb4f0112: target/i386: Added consistency checks for event injection (Lara=
 Lazier)
5b945f23d6: configure: Add -Werror to avx2, avx512 tests (Richard Henderson=
)
14833e24de: Makefile: ignore long options (Alexey Neyman)
e4adb09f79: i386: assert 'cs->kvm_state' is not null (Vitaly Kuznetsov)
b8ee198d21: configure script fix for Haiku (Richard Zak)
61c32485b7: tests: Fix migration-test build failure for sparc (Peter Xu)
c5dd0f0342: gitlab-ci.d/custom-runners: Improve rules for the staging branc=
h (Thomas Huth)
e37264ebe3: gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x CFI job=
s as manual (Thomas Huth)
db1e119238: gitlab-ci.d/buildtest: Disable iotests 197 and 215 (Thomas Huth=
)
c217fd8e36: gitlab-ci: Fix 'when:' condition in OpenSBI jobs (Philippe Math=
ieu-Daud=C3=A9)
59e8b62b22: gitlab-ci: Fix 'when:' condition in EDK2 jobs (Philippe Mathieu=
-Daud=C3=A9)
d3a4e41da2: gitlab-ci: Fix 'when:' condition in acceptance_test_job_templat=
e (Philippe Mathieu-Daud=C3=A9)
9ada9fd259: docs: Document GitLab custom CI/CD variables (Philippe Mathieu-=
Daud=C3=A9)
380e49297c: kvm: ppc: Print meaningful message on KVM_CREATE_VM failure (Fa=
biano Rosas)
14c7e06e72: ppc/vof: Fix Coverity issues (Alexey Kardashevskiy)
2d1154bd95: target/ppc: Ease L=3D0 requirement on cmp/cmpi/cmpl/cmpli for p=
pc32 (Matheus Ferst)
793abe24aa: i2c/smbus_eeprom: Add feature bit to SPD data (BALATON Zoltan)
6ebc0048dd: ppc/pegasos2: Fix spurious warning with -bios (BALATON Zoltan)
3e61a13af3: vl: Don't continue after -smp help. (Markus Armbruster)

