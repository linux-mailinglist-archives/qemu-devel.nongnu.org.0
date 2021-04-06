Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6754355DB4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:14:41 +0200 (CEST)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTt20-0003Sb-N3
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lTt0z-00033b-EB
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:13:37 -0400
Received: from mail-dm6nam08on2052.outbound.protection.outlook.com
 ([40.107.102.52]:10849 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lTt0v-0005kp-AQ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:13:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhvD5hzKYdVsATSaFXSSo89kFmt/KR5g7R0yB2fvsBUK59DT8vq9xeRKrHUBepwlxl4cPdQIeWAH+HpocS+CYEx9K/UubHOkGdx0l09Y8gQ8ku5R0ajLf6Svql9VvyeZF9ycUSwQ3J4Bj+qir5putvwPLfcDbunwpIk7MT6GHrT8oIJis7XN8LXsB7E/YzfkDHzy+cmW+cbW8EHFHHxReJsCYfV/yE468D7pfwWrpTGQ1/etTi9Kn4vIqsCCI5EJFsvrhh4AmQCGPyY7XGcr7gPxE9ynRK6zkd+QaGK6I83894l4ctiBFwU8LsM8R5yxA/HcsclMNRWFLR9xukJUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emU3ZUCFuIwlb6y6HBBwL4uYVFs2t5pmat5yA2RnCJs=;
 b=Qqv+0iVY8+SgnAgjB/j9EDlfrHkadErQetWYdVKlqSij7imA9z4FeyxTBad5nAkH9sThfKD//C4AoFMF/E0plDkvKfZw49Oi+CzL8yQ4OcBbgLdcY+zWvNh17OAFwTJyw7PRU8cQEZA3WBZFUJ7p34EabQN9wNMs+WgROHJZX/5K+rZaSIz9bwpQPo+kH3qq8cPd5uXFQEcXvM9YpQjk/VOGswZ5nZH5EMa7Tc+5ZejoluAK+meO9qHrnxnstGq/O567EV0VDuIWXwFRqSJJ6mmmzPYoLZSSixS13Zlyol2Re5ArZBCVi8AFPFvwBaFXQgib685LAr/MhCcrz/iFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emU3ZUCFuIwlb6y6HBBwL4uYVFs2t5pmat5yA2RnCJs=;
 b=IJ+tOgomqz9qMsyq5PZbX4wIzXiWhnSw/fHrFoL0Ia6pIRUPmQTYUz0XRh8iW1/TAZ8y+DF25Tlmg9ifOBQmWvCTCHOPDO3A3n//+6oqsC9jlAMKpDWPXhM/DCQ4AeYpM3ZPMOiABnesE84sxsdV4FtVl8YZ0exnADKNjcJZjaU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4938.namprd12.prod.outlook.com (2603:10b6:610:34::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 20:58:25 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 20:58:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 06 Apr 2021 15:58:10 -0500
Message-ID: <161774269033.25753.5281098877583388574@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:408:f7::6) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Tue, 6 Apr 2021 20:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c73e5356-52e3-4bcd-05c3-08d8f93eb8a0
X-MS-TrafficTypeDiagnostic: CH2PR12MB4938:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49380559E3F29FD4B21365DE95769@CH2PR12MB4938.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ztW2E5/BPiAalRpaeNVkIkFhdv5YwAUtd512GH3mJown031+AGrADtifxsikLd1jTMWXSgrRg7NfIDbZ5pCUWoD7v9teslt60cO/If7IfHR7u9hgCVPsbrdkY2A5z5TAdBR1BXwlWzOPk4qaaXUz6t/ypil+griZPCS+C9RKIJQB3489affgDYoNqFTylQL6RZGMcsd0nSX7Fq1xS8edus2NDydECwxgArCPWiABa08hEQwYSSpHNBHRi6lxG/pPCzwbfHE4ZW1r7mD48YccqO/xAAW791nc/nvvNT24deeDOwlayYw1tKkw5iDxpi5rILwgR1ddw3FSQ3kQOU1eW3gvx6BpEAu0roW61001Kbl6aX54nJvWx8JvZ0K6lAJieMNUbLjl0TDDxkguCnW9SKH6dkeFX547H81eTLSscz1SePD7+1+ymA7pWmm/v7TaqY4gea8uVMvb476tU/mi+GJIJ2eWl8PYI2vhY94Kmf3WPsHYdhUeK6u6NTJrGSfRARGqtguEsosgIZLEKh87nA5QDkuiCYoTdEekxoEqjsT306D5ziSBPFuYziWCZ82baEo3/lw9tDym00g/KvpBqTYJHufwTljs+MXE/9ULGPfD+lOawCjGyRL4jVI9KLhPNxwjdrPzZATHHBNkW44XxMfTSQ7AYjbcA2XVlXPHIXV+Ra86O3GYdJL8+A+6Ln6imRgbuNFFlx2LIazMUdzcmTsxrxGm44JyLMbFD6euR5FfZVfwCaYNeIkUWMauFoT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(2906002)(26005)(86362001)(66574015)(83380400001)(6666004)(2616005)(956004)(38350700001)(6916009)(966005)(66946007)(66476007)(6496006)(478600001)(52116002)(44832011)(66556008)(36756003)(8676002)(186003)(5660300002)(8936002)(6486002)(38100700001)(4326008)(16526019)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UnRiQXVOc2Y0cFRVNmI3WDJQRnhQRk9KR2FBU1RjMDlCU1FzK0VqbVBiTWxq?=
 =?utf-8?B?NFBETWFuS1pjZVB2QWRKNVdQb0xBRDVnN0JIdGRzZk5tSUd3N1g5Zm14SW5V?=
 =?utf-8?B?bmJJa2s4V054NGFyMlNKZkFFMzFqYTFySk5sMUZIQlMxWXUxYjFrZjVMTUNI?=
 =?utf-8?B?YjZjaC9NQTVvTlNxUmJlZ1ZZODBnVVo1aHViRjBicU8ySzIrVy9RVGNGMU9G?=
 =?utf-8?B?STFMamlSSXhFeGNPeVU4dVJBWi9udlhYZlJSYnFXUkljd1MrTXdNZnlOdTJY?=
 =?utf-8?B?dGc0RmY0Wmd6ZHNzbXZwN1FRVXhwQm1EMjJyR3lKQnlVYnlaakhJZkZYMlFW?=
 =?utf-8?B?NFpZb2tSUVYzK1gxRWlORDlqUGFZMDFYbHlWRGhHRCt6cERwZHNFRmptU2ZU?=
 =?utf-8?B?MTg2ZTQyYkJCK1hwQnN3WnlzSVhkamVzc29Oek1CQXhvMVpWRzZXQTY2Z3I4?=
 =?utf-8?B?QXk1T0FyUEdCT1dFYWVaSnRyZzY3aFVWVGVFbjQ1MzZxTUd1dTB2enNYYk0y?=
 =?utf-8?B?OVJtWjRINmlOTmxQeExWcUgybFUzVVRXcGxaM2J3WDZOZ3IwV0RqQndMODd2?=
 =?utf-8?B?SE9OZXN1QzJQSk42OXpDV2MxdmVSUWFZdlBUdElvQWFDZXRXUjdTemhRMUF5?=
 =?utf-8?B?VVpFcnJDUm96dzFVQ2d5MWVTQXVyaW91UUZRNzBrY21Tay9vTGxNTVFKdFZN?=
 =?utf-8?B?U3o0cEVYbnY4U0pRaHgvUE8zaUtsTVJOVFp3dDRUN2QxMWQ0TkZFRG9lckZW?=
 =?utf-8?B?blJBWWtwUVVEMWg0TDZxTjFiaUl5cGdTcHlWT2hUbExwTE5MYWRtTHBQNk9n?=
 =?utf-8?B?RDhpVzNCOHlNbktoa3RURWxkUW1yVC93UTJFV25scFdNd3IrNmIxQzQvRURS?=
 =?utf-8?B?NENQWDdkL2dzM20rMGNsUmxveEpyZFFEcUhWL2tReW1KdlNaMklncWJrMUNr?=
 =?utf-8?B?MkdKUG5FNlpxRThTcjV6TzRnZFV0L2paa3B5MURNN2NBL2JtTXVEd3FuM1B0?=
 =?utf-8?B?cWZTRVFBZFQyNCt3ZWxvZ3U5d0FMelpCWnpGRU9WTG9lY2V2bW5zdE5CbWRW?=
 =?utf-8?B?aEVJOU92TDUvbjByb3NaVjhuQ2cxa2luUFY3T1grR2FCVk52SlpXYVk0SERt?=
 =?utf-8?B?NGNXM2tNbmZXaENLZWd2b1F1WURRZG9DM044SlZQd3NLSnM0SDZmR20wdi9K?=
 =?utf-8?B?WGhUNTl2czVZa1VNenlwbWRGS3BwcDFNdFM1NGNWSTQ5OHdQTHBnQzZHTUJF?=
 =?utf-8?B?UU9ncjZoMEVPWXJTdUpBL2tIcGg5Q3gxbXZUTlZPcng4V3krelBySmlmakVJ?=
 =?utf-8?B?NEwvZENPR3RiUDI4UzJoei94b1cxK1YrbjJ4N1RMZU15ZHNYQnd1VHBMUmxx?=
 =?utf-8?B?bkFHTHZyVzJLYXllOXBWLzNXSnJUVTh5dDN0OUZGdWh3WGM5ZUNLcHFoNVY2?=
 =?utf-8?B?N1MxcjUycmh5YnhJYnJOYzhXblpYbzQydVdjeWo4YlBpSXZVb21JRE5xSUsv?=
 =?utf-8?B?OHBGdlhqVFNCZFZqSkhpTEY2cU5mWTFPWXN3bGdBN0FxZUJFRk9sR3c0NnVR?=
 =?utf-8?B?eFMzNlVXSmVhdGh4eXRLSlhPR2Rqdjl3WTJSVHBzSlpsa2ozbTZkR3dwb1hX?=
 =?utf-8?B?MUFnUkVXanFQYlZWaTdNZWg2ZTkwNTNIb0NVQUJGZE5BbmpucmVDZmtYTHdP?=
 =?utf-8?B?elpySFVscUhQdlFxVEFEQXg2bFRvUVVKa1pKNUFqWm5Fc1JKaDQ5ZllZY3Rm?=
 =?utf-8?Q?awsuZ721McHWC4YZKKqhwo72HLJzrQYIbwl5kJE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73e5356-52e3-4bcd-05c3-08d8f93eb8a0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 20:58:25.5580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsEqQMLnX/9FAoIlO+Qr3rXsax1BYhjw7aeDkUgJp5ZdRbaQP/Ts2UMwwxbn+DwhTJcUkZCF8gqLv5gVlG8OGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938
Received-SPF: softfail client-ip=40.107.102.52;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
third release candidate for the QEMU 6.0 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.0.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-6.0.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 6.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.0

Please add entries to the ChangeLog for the 6.0 release below:

  http://wiki.qemu.org/ChangeLog/6.0

Thank you to everyone involved!

Changes since rc1:

d0d3dd401b: Update version for v6.0.0-rc2 release (Peter Maydell)
d83f46d189: virtio-pci: compat page aligned ATS (Jason Wang)
49bc76550c: Remove myself as i.mx31 maintainer (Chubb, Peter (Data61, Evele=
igh))
21c2dd77a6: Revert "target/arm: Make number of counters in PMCR follow the =
CPU" (Peter Maydell)
e7e0d52dc6: hw/ppc/e500plat: Only try to add valid dynamic sysbus devices t=
o platform bus (Peter Maydell)
37fce4dde1: hw/arm/virt: Only try to add valid dynamic sysbus devices to pl=
atform bus (Peter Maydell)
0fb124dbfa: machine: Provide a function to check the dynamic sysbus allowli=
st (Peter Maydell)
387c0e8b41: include/hw/boards.h: Document machine_class_allow_dynamic_sysbu=
s_dev() (Peter Maydell)
498114b37b: hw/block/nvme: expose 'bootindex' property (Joelle van Dyne)
ef951ee33f: target/alpha: fix icount handling for timer instructions (Pavel=
 Dovgalyuk)
4e655e3cd8: tcg/mips: Fix SoftTLB comparison on mips backend (Kele Huang)
b62b178c37: hw/block/nvme: remove description for zoned.append_size_limit (=
Niklas Cassel)
90a66f4847: x86: rename oem-id and oem-table-id properties (Paolo Bonzini)
30c676134e: target/xtensa: make xtensa_modules static on import (Max Filipp=
ov)
84317d57e8: target/xtensa: fix meson.build rule for xtensa cores (Max Filip=
pov)
8ddf543248: pci: sprinkle assert in PCI pin number (Isaku Yamahata)
44421c60c9: isa/v582c686: Reinitialize ACPI PM device on reset (Isaku Yamah=
ata)
0fae92a313: vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN isn't setup =
(Isaku Yamahata)
0fd7432533: acpi/piix4: reinitialize acpi PM device on reset (Isaku Yamahat=
a)
51e0e42cab: virtio-pci: remove explicit initialization of val (Yuri Bendito=
vich)
c3fd706165: virtio-pci: add check for vdev in virtio_pci_isr_read (Yuri Ben=
ditovich)
2b7d06c452: vhost-user-blk: add immediate cleanup on shutdown (Denis Plotni=
kov)
bc79c87bcd: vhost-user-blk: perform immediate cleanup if disconnect on init=
ialization (Denis Plotnikov)
0c99d722e7: vhost-user-blk: use different event handlers on initialization =
(Denis Plotnikov)
ca89d15f8e: device-crash-test: Ignore errors about a bus not being availabl=
e (Thomas Huth)
69c5d14dc8: docs: Fix typo in the default name of the qemu-system-x86_64 bi=
nary (Thomas Huth)
4fb98ae62d: docs: Remove obsolete paragraph about config-target.mak (Thomas=
 Huth)
7e3a61ce62: util/compatfd.c: Fixed style issues (Mahmoud Mandour)
bd74ecd1c3: qom: Fix default values in help (Markus Armbruster)
2d53d0c77f: MAINTAINERS: Mark SH-4 hardware emulation orphan (Philippe Math=
ieu-Daud=C3=A9)
b2744da975: MAINTAINERS: Mark RX hardware emulation orphan (Philippe Mathie=
u-Daud=C3=A9)
09c8d9e867: MAINTAINERS: add virtio-fs mailing list (Connor Kuehl)
e4145cd735: MAINTAINERS: Drop the line with Xiang Zheng (Thomas Huth)
d6eed46548: MAINTAINERS: replace Huawei's email to personal one (Dongjiu Ge=
ng)
bead6a96bb: MAINTAINERS: Drop the lines with Sarah Harris (Thomas Huth)
d3a0bb7706: tests: Add tests for yank with the chardev-change case (Lukas S=
traub)
feb774ca3f: chardev: Fix yank with the chardev-change case (Lukas Straub)
f36b0efd7f: chardev/char.c: Always pass id to chardev_new (Lukas Straub)
789fd6934e: chardev/char.c: Move object_property_try_add_child out of chard=
ev_new (Lukas Straub)
e0150291ec: yank: Always link full yank code (Lukas Straub)
1a92d6d500: yank: Remove dependency on qiochannel (Lukas Straub)
816f93b200: docs: simplify each section title (Marc-Andr=C3=A9 Lureau)
1d9fa7a859: dbus-vmstate: Increase the size of input stream buffer used dur=
ing load (Priyankar Jain)
64e16fbbf4: util: fix use-after-free in module_load_one (Marc-Andr=C3=A9 Lu=
reau)
c81cfb89bc: docs: Add a QEMU Code of Conduct and Conflict Resolution Policy=
 document (Paolo Bonzini)
2008b34a59: hexagon: do not specify Python scripts as inputs (Paolo Bonzini=
)
a5158a963e: hexagon: do not specify executables as inputs (Paolo Bonzini)
c7328271cf: configure: Do not use default_feature for EXESUF (Miroslav Reza=
nina)
b9e40bac9c: target/openrisc: fix icount handling for timer instructions (Pa=
vel Dovgalyuk)
46967b1a43: replay: notify CPU on event (Pavel Dovgalyuk)
fe852ac2b3: icount: get rid of static variable (Pavel Dovgalyuk)
cb4d9e38bd: Revert "qom: use qemu_printf to print help for user-creatable o=
bjects" (Thomas Huth)
7cebff0d03: replay: fix recursive checkpoints (Pavel Dovgalyuk)
a061a71e0d: qapi: qom: do not use target-specific conditionals (Paolo Bonzi=
ni)
10b8eb94c0: target/i386: Verify memory operand for lcall and ljmp (Richard =
Henderson)
76f67bac79: meson: Propagate gnutls dependency to migration (Jessica Clarke=
)
074c84b9b3: MAINTAINERS: add/replace backups for some s390 areas (Matthew R=
osato)
fac87d4d9d: MAINTAINERS: Fix tests/migration maintainers (Hyman Huang(=E9=
=BB=84=E5=8B=87))
b6489ac066: test-coroutine: Add rwlock downgrade test (David Edmondson)
25bc2daed0: test-coroutine: Add rwlock upgrade test (Paolo Bonzini)
050de36b13: coroutine-lock: Reimplement CoRwlock to fix downgrade bug (Paol=
o Bonzini)
2f6ef0393b: coroutine-lock: Store the coroutine in the CoWaitRecord only on=
ce (David Edmondson)
07ee2ab4fd: block/vdi: Don't assume that blocks are larger than VdiHeader (=
David Edmondson)
574b8304cf: block/vdi: When writing new bmap entry fails, don't leak the bu=
ffer (David Edmondson)
611ac0a60f: hw/net: fsl_etsec: Tx padding length should exclude CRC (Bin Me=
ng)
a40888bad6: spapr: Fix typo in the patb_entry comment (Alexey Kardashevskiy=
)
df2d7ca774: spapr: Assert DIMM unplug state in spapr_memory_unplug() (Greg =
Kurz)
9cbcfb5924: target/ppc/kvm: Cache timebase frequency (Greg Kurz)
093256789a: hw/ppc: e500: Add missing #address-cells and #size-cells in the=
 eTSEC node (Bin Meng)
13e340c886: linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its leng=
th is 0 (Fr=C3=A9d=C3=A9ric Fortier)

