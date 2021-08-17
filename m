Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C53EF58A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:11:32 +0200 (CEST)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG7Ix-0004Tc-AB
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mG7I1-0003nG-Jg
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:10:33 -0400
Received: from mail-mw2nam10on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::616]:42465
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mG7Hz-0002IR-5s
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:10:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5L+Q94W5Cn73z0fSdPiADgo1eIYVDco1WQG9Fd+dPaOceoVlyu19Ij12GnkKW3vzMMeaaIAj3MViEsCsx+8tMqUpx4/eNn/W3c5bMsq4MYFdNNuviHza3nxeZ/nMwyH9wUfD34pov+SYczP3Ln9Cdy+4h6h37F/iZqKKZCMTTsm5gVrGzDl+muupJFLsWOknq+8BVV3HLAuUYKj5mg1ekjEGnnyA0QEdC+OO1ue3zkwY7T7YOqDBT5qrB7R8tCEqz6FMLNzWPzAFR8QJjDw7BsytkSo1pLQrDyzzRjUXeJm1vrWnqXlDz3m6l/TMjVd9/S6SFw17H2DtaGgFgL+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGl0GNzyWFu9nKsJd+Dc/hLwQXoC+aaJroDn9CfcIEY=;
 b=QsOmRnSPsScWHY4OvIYDGzZNQfw8SDSXa3fPagmL9njcOtZe2KXJd2GFOegqcLzRwaiIvj4XS5E0NKhwySxLpWrLvZchOUZ6mXUfQKSkOkxvLQKKaVyH8PBZ3SpEd0BP1BN0WwHcLpLfjN2OUWSV3/rUmdK/fzZ15X5jkMhMTOq56HNEhDZbu05LjKt4Zl0Gpm0kD1WPQYrTZTx9EO+jPbA9ggFY79nTcuAnP2TZLN7r4M9d0NB6hVZLj83tYQlqHvJ6XMPLn+1WEiFvwfVXJZE0miOQ9a0OnO0f72vIVo50kvnTjuIcfEdxgl5wRRZkZ0kuV0lepChUTIrAZvIU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGl0GNzyWFu9nKsJd+Dc/hLwQXoC+aaJroDn9CfcIEY=;
 b=WkzSZtHi2maDek2MWl/DzMq4/FjQ1fnQQXFs26kTINCgxJnWEExIgbRUaEetqgSKJnSCW8z8lLUMGVxLPk/oDFuzf3dy2zhoGK/10+hUwwWTEUTqf8FPa1vPKGqn59bqcLVUrAX+JvYg15Gmog3LZJPALqq1E1OAu9ysrSivgUo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3910.namprd12.prod.outlook.com (2603:10b6:610:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 17 Aug
 2021 22:05:25 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%8]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 22:05:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Tue, 17 Aug 2021 17:04:06 -0500
Message-ID: <162923784614.13986.16154593533726497854@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SN7PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:806:122::14) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN7PR04CA0099.namprd04.prod.outlook.com (2603:10b6:806:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 17 Aug 2021 22:05:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6628b2b-1ebf-4d04-1457-08d961cb1d68
X-MS-TrafficTypeDiagnostic: CH2PR12MB3910:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39104695F2EDBD7ADEF6634795FE9@CH2PR12MB3910.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1L7iwIfGWe4JW3iNwEBh1Os+J49GNXo5nC2sIcnkBCWfBbcHkbbdwKaWDKJfBkmIx/BIfJ0G5IJ/i8n9XEQjsPnLkuspvts6Ugr1v0ex7Ms4XFqY5t2cL0d6TuwaFjPAQcjASfk9LEqi+Ci4elVT4Xh88ZVUJhVVD+7uqcAoCKr9kY/LgQVntKraHWiuMhGAlGN3hZuqxsWAFrmjiVzn9o202CzfEzSvdMo5DxUAnBuzBUjto4v1zUziRCxDcuGanE8264k/FFWWo8o7KKws30+qzR7Fz+hKUXAI/saXcpaSrP0d0nVAJUrPG84gLNTO1Sr1uo2m4pl6h170DWKaHed3pHJ56LnxppNUxkkFgmwug0viAp7dHx2m0giF+VXIy+Oe2c4jSld44Y67fA6RVvUd9GM/JcDqcgh/stO3LuBzb25rgRz3Nxy1/Gcnzt8alb0ybmZpFkq5VDWVaWQzwuhBOmN3OMA5j9tcIC1x4RqaJKilQAqDKyIr3rGovUzFIxHfIgeXfSYjdEgzyJfJpa9GTU3MyD902l1T3djqtRyXPNodA1Zr1FTqWIwuKtrsLDMgkj5e6GhvcKgm1zO3SfgK6uaCL8g9E5QGJ3qMrVDNB245d8BJ2ORXKXfvycqkHdHU55EaTu66nP5DEfotglL4yGNm6Y7ykS7usV89hfey8Ogw4hINH9oBA+6/xDv+e0FaLAhQi6uTRGU1KkjdfdD4zGJxP69pzkMrZWxwsXkjFgH2QbEYxNlCnRfSpH2yAMADVg6dhLVgZhuMXeA5Y0/C5RGg/qrBlrX4hBWfkqM299cddUiOSdaUBXPv5F96
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(83380400001)(5660300002)(52116002)(956004)(44832011)(36756003)(2616005)(6496006)(6666004)(316002)(4326008)(38100700002)(186003)(66946007)(8936002)(966005)(26005)(66556008)(66476007)(6916009)(38350700002)(6486002)(478600001)(86362001)(2906002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzczSHkzZ290QlE2b3R1L0FiT3VMMFRvcjM1eDduSkxVZXlLMlFFNW9wVUVr?=
 =?utf-8?B?Yy9GSVM1djlGR0EyRi81Q0NkNGszTnVsMnc5ZHpFRDIxWE9YL2tnRUMrREh3?=
 =?utf-8?B?N1R0Y24rYkVaakFOVFlTWElmOHhZVHMrV21NdzBtcDk3TGhabTBzTm9YM0hV?=
 =?utf-8?B?c3pPbXRmNUd3MUpYaXhIM3M5cVpCNDNuQkcrZDJMYUJEQWJKMDFUVHJxSjYr?=
 =?utf-8?B?ZnU2bG9OMlhEZ0hROFNveDE5RjAxMmZoMmpUYklHdUFWdS9kVWlWVTV4V0pM?=
 =?utf-8?B?SHloTG5OZVQ0V0NCV05WTFUwU2hseWdpSE5tb25EQzEyR1R2Z1hBU08xWFVB?=
 =?utf-8?B?andsMEJlYXBEMlZ1Y1FDMUwraTN5NDQ5aVpSbWUrL0V4Zk9zMTZqK0xBVm9X?=
 =?utf-8?B?RW8xT1BaUXhGcXh2N2VDdnhiTVJLV09GRWtpMXRWZWFaajhqOGhFc2I2RERU?=
 =?utf-8?B?bS92MnFsTWVYTC9PLzkxSCs5RnRQbVh5bHZEZ3RrZWc2RDFtT3NETTllY0Yv?=
 =?utf-8?B?Nk55ZFBkY0R5L09JcFdEdnFFeTlLZ0FjM1dNaG9tMlhEZXB1emswVjlLNCt4?=
 =?utf-8?B?Nk9QZzB0cndEaWFYQ2dhb2tJajFBcTNPRXVSWlFBTVY0TURMRzlvb0MxeXox?=
 =?utf-8?B?cXFUbE1TaEhBb1BoMGZNUnlHbmhVSkltY2hJTWlvSVgybTBySDZEb1RHaUxR?=
 =?utf-8?B?bHZpS1RKRGd1Y2g1Ym9peVd3Zmhxcm5VcWp2bHUyNkhnRWRheVRRYVcwQ3hz?=
 =?utf-8?B?a3J6U2tLbzFQVXJSQ2FPM1hWVnd0WFhlL0pyUlZwdThRMVV4NHJXOUZCaE9a?=
 =?utf-8?B?NVR5a0hpa1o3ZUxwaFo1RlJjRDdtZFAvVFpkSm5CVlpCemsxSzZTd1JOOHpr?=
 =?utf-8?B?Y3BxaVNLcFN6NzZidytBRlFZdklLRDJadXFzUEVIT0syOFd6UnNrRDhKV04v?=
 =?utf-8?B?SXhjcEJOMDhtay9MNU5oUVdTZFFicUpOMTJic0IxamIvUEc0dlZVR1czbkx6?=
 =?utf-8?B?eEk4WFNCcy9yZTcyV3RvbjRjWWdVd2JzWUhxaVhwak9Rc2xtd0NjUUFsazJj?=
 =?utf-8?B?QTNRRHlES0FjM1NLZ09qQ0RyM1UwYUswS29HTVkvYmNCemhKZm9WM1pGaVlp?=
 =?utf-8?B?bERxYXpENFM4SEEzaWpORy9OU1NrU29jb2lIOGJuUCtaZ3dQQXhQeDA1NEtW?=
 =?utf-8?B?ZzUyZUIzcTBOa2h5TlZqMnlwNDhlUis3YjdjcHVXRWwySU1FRUk3SG9QdjFa?=
 =?utf-8?B?N3lXZWs2dTBjUnNwS0NNTVh0eUVwZUpxRllyejlXaU1Ma0wyVjM5a1E3T2Vv?=
 =?utf-8?B?b2JyRExIeUtoYko0cFgvaVhsMithbW0vdGJid3QzMUQ2VHVqQ3Z3K2c2ZFp1?=
 =?utf-8?B?Rk94Vzg2cTljaGZ4MGl1N3Zwa3FyTkovVUt6a3duckJySUhDQ1dpRXRYazdP?=
 =?utf-8?B?MHo0ODF2YzNyV3Z4SnhIRThjMXVXVldSeGo1Sk15ODZqY3pUVUJTbVcyMGp1?=
 =?utf-8?B?Tlo2ZVQ4TStwT0o5SVdMVTNqQi9acjMwRmZuQjBSMWMraEJuUWhzSUlMbXlj?=
 =?utf-8?B?N0FBY0NvQUt0OEFwakg1VGROeDZ4MkhzYTF5TmFIVlZGT0ZzMFdhOFErdHhy?=
 =?utf-8?B?WXR5djZ3NXBVTnd5UzdmSUQvVG5aTFRrU2VRam4xZ3p4QUdiVlEzTmdZb3dO?=
 =?utf-8?B?dnZkd3ZiQ1YxbDFySjJKQXVyWlkvVlRMU1dmVWd6VzRCVmZwR1RVaGJoL3RR?=
 =?utf-8?Q?1/XAL2rWD5OAX89ZngOF9fEMaZarAsVXeqjr26o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6628b2b-1ebf-4d04-1457-08d961cb1d68
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 22:05:25.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GdInIptILooGCqEboR8s/SkNaTg8D3H/RzJdd1Js0LZ6xhHXFChDLkNTqi5HfU2VN5QGdyiALtQgUkmiG4yuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3910
Received-SPF: softfail client-ip=2a01:111:f400:7e89::616;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
fifth release candidate for the QEMU 6.1 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.1.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-6.1.0-rc4.tar.xz.sig

A note from the maintainer:

  There are a comparatively large number of commits here for an rc4,
  but they are mostly changes only to documentation or the test suite;
  there are only a few, relatively minor, bug fixes. Hopefully
  the final 6.1.0 release will come out on Tuesday 24th.

You can help improve the quality of the QEMU 6.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.1

Please add entries to the ChangeLog for the 6.1 release below:

  http://wiki.qemu.org/ChangeLog/6.1

Thank you to everyone involved!

Changes since rc3:

ecf2706e27: Update version for v6.1.0-rc4 release (Peter Maydell)
1c4c685936: softmmu/physmem: fix wrong assertion in qemu_ram_alloc_internal=
() (David Hildenbrand)
0572edc55b: qapi/machine.json: Remove zero value reference from SMPConfigur=
ation documentation (Andrew Jones)
ea0aa1752c: hw/core: fix error checking in smp_parse (Daniel P. Berrang=C3=
=A9)
0b46318170: hw/core: Add missing return on error (Philippe Mathieu-Daud=C3=
=A9)
24d84c7e48: target/i386: Fixed size of constant for Windows (Lara Lazier)
a7686d5d85: Hexagon (disas/hexagon.c) fix memory leak for early exit cases =
(Taylor Simpson)
36b508993c: docs/about/removed-features: Document removed machines from old=
er QEMU versions (Thomas Huth)
5643fcdd42: docs/about/removed-features: Document removed devices from olde=
r QEMU versions (Thomas Huth)
5d82c10160: docs/about/removed-features: Document removed HMP commands from=
 QEMU v2.12 (Thomas Huth)
29e0447551: docs/about/removed-features: Document removed CLI options from =
QEMU v3.1 (Thomas Huth)
8cc461c185: docs/about/removed-features: Document removed CLI options from =
QEMU v3.0 (Thomas Huth)
3d9c7ec955: docs/about/removed-features: Document removed CLI options from =
QEMU v2.12 (Thomas Huth)
3973e7ae63: fuzz: avoid building twice, when running on gitlab (Alexander B=
ulekov)
b063c290f3: tests/qtest/vhost-user-blk-test: Check whether qemu-storage-dae=
mon is available (Thomas Huth)
cc1838c25d: storage-daemon: Add missing build dependency to the vhost-user-=
blk-test (Thomas Huth)
a1f0f36838: gitlab: skip many more targets in windows cross builds (Daniel =
P. Berrang=C3=A9)
a4de5e8a06: MAINTAINERS: update virtio-gpu entry. (Gerd Hoffmann)
1e2edb9866: MAINTAINERS: update virtio-input entry. (Gerd Hoffmann)
cd02c965c4: MAINTAINERS: update usb entries. (Gerd Hoffmann)
227b1638ba: MAINTAINERS: update spice entry. (Gerd Hoffmann)
6bc915f31a: MAINTAINERS: update audio entry. (Gerd Hoffmann)
8f6259055a: MAINTAINERS: update sockets entry. (Gerd Hoffmann)
f492bdf4ab: MAINTAINERS: update edk2 entry. (Gerd Hoffmann)
a62354915b: gitlab: exclude sparc-softmmu and riscv32-softmmu from cross bu=
ilds (Daniel P. Berrang=C3=A9)

