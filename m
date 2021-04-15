Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F81135FFBC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 03:55:00 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWrDf-0000dd-41
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 21:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lWrCd-00008M-KS
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 21:53:55 -0400
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com
 ([40.107.94.79]:48000 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lWrCa-0004c7-6l
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 21:53:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy1mq/wzcNZUzOd1Y4usqVHvPMv2U/z5xCpOhANELW6HKD5okWbJHEZEY80kO+1LOmPWnJp8rNR3gliu78aWgPUTYGDjHFzvqp+gZLB3d5FZJSaWsOiqv3fqKHDgmnXimcuymQfVq862ZnpjUZ2nbHAeFi+XeP7WWFCXVcLViASkoee8mdzIGlLdzr946KlzQnZXmEcNwnN6neH5g67S3X4XTtOkcKBsn3uXGLmbcfFOGdYQqNaZOVJp6et7k3+FXKt9ruyC75bnEZkdrqjvLVjpwFH9RyaQMFVpqCksOFq1u8CNTfbHaNNT50gdfpfe1vEBDw6sWXZ40lBXubGIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHaquKUaqCPqj8JAHP+fHL8lClNyKtPGfbgk325RR9M=;
 b=HdVEVhb8KnBNgTRc3oHDxhqM2IkUCclmpxf9/26UWe2nunB9M2iDGsDJtivylGJwb5mLUntglufpUcnRq9bm28IXHgvB3NWpmDnYxoml28uyPkf+w++V2+SIzJRQ8sYprB0D0oXeBW/Kk44/7ZChvtG0Y7/MQTBT6EQiDZOG8d42AzddJMl6XbYsxLA2QQEF5qdEqgfbjB5CcGcdSYYAxmXD6luh1rU9pbg1wFJ8yKQCdpvQweMX8P3NN/Md2yB6Kz0O8xAtPpcTiCYr1Eas/l5ULPgDuQcIMDtvZqC1l1LDiXiSuPXatQObBHfGvFgQxExI94lvds7/j+7fjcAw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHaquKUaqCPqj8JAHP+fHL8lClNyKtPGfbgk325RR9M=;
 b=1vHA5wDxWYYEA9fIyh3rOBHPgyzJ71PfbqqLZi9CSOR6QNMkIBmKEfvEsGE+QkysaCr+SnwF5MG8Jo8JqvYGIavXrQAlA42/CGNy8b6TkUMICMdiRBB37LprLOwSKjOM/HX6ReK0LT+GRo86WGj4isOiVnfIBLpLksSqreE0jCQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3957.namprd12.prod.outlook.com (2603:10b6:610:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:38:45 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%6]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 01:38:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Apr 2021 20:38:38 -0500
Message-ID: <161845071833.219439.16475879689674755773@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN6PR1701CA0012.namprd17.prod.outlook.com
 (2603:10b6:405:15::22) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN6PR1701CA0012.namprd17.prod.outlook.com (2603:10b6:405:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 01:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29c2f3f-88a6-4fdc-5667-08d8ffaf354c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3957:
X-Microsoft-Antispam-PRVS: <CH2PR12MB395730097DD8B9EED10B0CBC954D9@CH2PR12MB3957.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uRm5kzO3DC3VQcyM2FnuTsDHU1adHBNq1JwRGhwAC3id8moZ+d45U8cd5UP6zP+E6dFtXA80uk5dG8NASo7EPbbMIvP50sE02QyHQHemwajK3wPUFxIiIhUJdZn6AFyff4va8iN23ftPKW0/FiyvpKC+rNC0CJjKSLD7ShLbCyQvgtK6lyF2wA6SQDuViZDAcoKXAH5sPtGMWspq53J3V81RGqdvKABz4UKDdlq6gKvsTLQE3ZhZZyWmQyvOX3yJCM7M9RbaIcC4Bq0iXHfdY3msRYVsjN9cR/COkJtYqvk2GbxMfM10r2R2J9wWnH8GNZeRQ8pHldfxG1VyuBtWA0N2fEy5CYalSk5TIMLhBGxGg3r+J2jjk0zen4v+MoK8a4qgw2JKAQC7SL0OjmgHW/gstK3Flp8ikKH+r6RIqEOzvnV8QzC3Xl6htcMdHnnpvUFzUL/GccMGLnucZzCU59QXcGKToQ5ZV0oebtFYGebWkaMwU5VfcrIz0uXMy5s5g4l+z9+rSFAb8khxKI9OrndCf7wmRVew4BzKZkzs7aydJlODGW4QWb91srpgsi2fyA16+1WGv2Fk1S0IqVCpGegSEpZt+wdaZxfr2F8lcT3YX9JkxJHdb4KoUC8zv7jq0PffIErER82P94DKxD4Ki2cDVrPk6Jjc+KHG5Xs2XlTuedp/BYEJ4KlskFkEmKYgiIs9l59qOh9iSeqZqqbkoEzTLkVVBJcJDvtkYmPaH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(8936002)(2906002)(86362001)(5660300002)(6496006)(83380400001)(38100700002)(8676002)(186003)(66946007)(956004)(6666004)(66476007)(66574015)(4326008)(2616005)(6486002)(966005)(16526019)(316002)(52116002)(36756003)(6916009)(44832011)(66556008)(478600001)(26005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk9hQTNaNll6dkt0TDVrdzR5ZU81MzVLYjFGSjRzUkZUcEtFbVZJT0ZZOFVs?=
 =?utf-8?B?NDBBcGNVY1UvQ3MxYVRBSGxMTXdBclEvNGlYVEhPNUc5OVo0WXZBbkZKTnhH?=
 =?utf-8?B?YUhzNGdqbHROSXRuQjJGQ2lXYWJ0RndCU3E2b3V3eFRaY0RJeS9QeUpUdm5L?=
 =?utf-8?B?emtIaTYrNkFkdGNqbFpiT1ZzNiswU0w4VXgyT2RqQ3ExL2ZacElOQkxUMzZx?=
 =?utf-8?B?NDRTZHVYa0gydVRmWEhUcVJaV1ZXeFBvOGVMR2lCaStDcnZ6WkdSb2JCWTB4?=
 =?utf-8?B?N2RXaGhVQlZqc01HN0o1Tys1OFEvNzIxeDlUWDljMEVyRjdiblNLdktGcm8y?=
 =?utf-8?B?bWJ0U1IzTWZlSjV1N21VNTQwMnd1bEs4NnV6OVRWSVRxeXFTZWVBc2grd0NW?=
 =?utf-8?B?dGl4VEczcHFOa3lxSXhJVmp1TXZqWVpma3lkOS9ZSmlUaDhQbGNiYkV1ZlZa?=
 =?utf-8?B?d0pqY3R2bGJUWjVCMDR5bGxlZG1kQUJ6akpXUzJtNGFXaFFWYUhXS1BXL1BF?=
 =?utf-8?B?VmJOblR3ZUptN2xTd2pPNXNQc044dTZFZDE3dUNwc1dPclZLWTl6akgyaWxu?=
 =?utf-8?B?aGVWRkJSV2JEeGQwaCtxbTB1cDRpWDUvdHBzMkZ1N2htUWpSQzBKcHFpb0JG?=
 =?utf-8?B?SmVXeFIwRnFxeDFFbmE4V2VzZUZvYjI3OS9abkdQc25YaVRJc1lZRkVMVzVL?=
 =?utf-8?B?UlBwTDJ6N3pZNytBTEZ5UDFleUJvZjk4VVFLM1NDa2I5ejBvMmk4cDNVdUwr?=
 =?utf-8?B?WW5oZ2x6RjcyNjdTZ2ZWaVFyb1liNVArNUVFSVIxbDJFTm9NZUIyT0h4RXh6?=
 =?utf-8?B?SFMwb0JHSGRDS0RtSzF6ZTZBMnREcDVtZSsyRzE4aFhkeG43cFdKRmUrQVpR?=
 =?utf-8?B?NzNDWDA3bGJYZC8xeWd3OXE2VGR1VHNOS2xpRHdZYkFPQ1ZOVysyOCtKRGtW?=
 =?utf-8?B?dGdSY2sxMk1oR3NJREtVWklQcXZrUDA0V2F1R3JISUZBaDBUR0ZGcUc3dEg3?=
 =?utf-8?B?UldYNkJQdEZWZk9DMkJHeEMrSXFJK2VMVVRvK1NtTmZwZnk0a1NKQnAxWlBa?=
 =?utf-8?B?M2VPMTJyK3pGMXlpbVUxQUwvSDBTbjRMZzZpSy8yZTVLb1NGU1ZoMWZFN2cy?=
 =?utf-8?B?aEk3bjZtb2NSTGwzaG8vb1ZJdVBHR1ZOaWJwR3czNUVqTE1OeXE1SDEyNmly?=
 =?utf-8?B?SjE2eGt5anFRSWJQaEJVamg4a0V0N1RURld6ZTFaZkZWRlpsQmdrS254VUQx?=
 =?utf-8?B?YjNJVno3QzZnbVpJRDJGYS82ZVl3UW1uT1NMRWk4L1hFYWU0dUFNUXJvMEFN?=
 =?utf-8?B?VHlrNlhsZE5DK3BmOEZhRjkyc1JneHdmbDRWVWtmVkVIMUVzN01XVkZFeEUz?=
 =?utf-8?B?K3lDVnNWSWlGR3F1d0tlYVNaYjVlMnl5V2hSRGNLTEljT1N5NXRLejUzakhR?=
 =?utf-8?B?cU0xZ3MyTlRzRzVRYTRYRnc1ZHNweTNZakhCd2FBZjR2UlgyVjBtbFdZdWJK?=
 =?utf-8?B?cG0xa2V4amRUYnlydnNwNWJmVVQ2UEZhUUlvSTVIeitvQ0NvRWp6T3VPeWhC?=
 =?utf-8?B?RWRvRlZ4ekhPZUVtNFBjanVnUVVaQ0RkcWxuMEEyT1V0bC96Q2M1QzNjdFpK?=
 =?utf-8?B?cDlJZTg5NWV4SVZiVFFCbFZ6ZmJ2S2JEQnhpNVZHeUlCek1jNGE5ekduTk9T?=
 =?utf-8?B?VU90LzdnTHA3QUk4MW42UE1YQzNPS1hLV1l4MmhiNUdXM1pyWmh3Q0U1UXYr?=
 =?utf-8?Q?kN3mzy2Es3T0HGOPF+V89SCIyGQEIfNkk+kKDch?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29c2f3f-88a6-4fdc-5667-08d8ffaf354c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:38:45.2804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nxl+gvn5/ECSqMhLq4JITWyqXlvjsM7jRYitY8I7YBxtYwltidTS7ddAvOKyiLfDmwbbPDNSi4535ulxd5TQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3957
Received-SPF: softfail client-ip=40.107.94.79;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
fourth release candidate for the QEMU 6.0 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.0.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-6.0.0-rc3.tar.xz.sig

A note from the maintainer:

  Hopefully rc3 will be the last rc for the 6.0 release, and we will
  make the release on Tuesday 20th. If any last-minute critical issues
  appear, we'll do an rc4 on the 20th and the release the week after.

You can help improve the quality of the QEMU 6.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.0

Please add entries to the ChangeLog for the 6.0 release below:

  http://wiki.qemu.org/ChangeLog/6.0

Thank you to everyone involved!

Changes since rc2:

8fe9f1f891: Update version for v6.0.0-rc3 release (Peter Maydell)
438c61e086: qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code (=
Thomas Huth)
ace66791cd: vhost-user-fs: fix features handling (Anton Kuchin)
0267101af6: block/nbd: fix possible use after free of s->connect_thread (Vl=
adimir Sementsov-Ogievskiy)
f4349ba966: target/mips: Fix TCG temporary leak in gen_cache_operation() (P=
hilippe Mathieu-Daud=C3=A9)
62271205bc: hw/isa/piix4: Migrate Reset Control Register (Philippe Mathieu-=
Daud=C3=A9)
50fab4cc67: hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM (Phi=
lippe Mathieu-Daud=C3=A9)
2d18b4ca02: sphinx: qapidoc: Wrap "If" section body in a paragraph node (Jo=
hn Snow)
ce94fa7aa6: tests/qtest: add tests for am53c974 device (Mark Cave-Ayland)
607206948c: esp: ensure that do_cmd is set to zero before submitting an ESP=
 select command (Mark Cave-Ayland)
324c880989: esp: don't reset async_len directly in esp_select() if cancelli=
ng request (Mark Cave-Ayland)
0ebb5fd805: esp: don't overflow cmdfifo if TC is larger than the cmdfifo si=
ze (Mark Cave-Ayland)
fbc6510e33: esp: don't overflow cmdfifo in get_cmd() (Mark Cave-Ayland)
fa7505c154: esp: don't underflow cmdfifo in do_cmd() (Mark Cave-Ayland)
9954575173: esp: ensure cmdfifo is not empty and current_dev is non-NULL (M=
ark Cave-Ayland)
7b320a8e67: esp: introduce esp_fifo_pop_buf() and use it instead of fifo8_p=
op_buf() (Mark Cave-Ayland)
c5fef9112b: esp: consolidate esp_cmdfifo_pop() into esp_fifo_pop() (Mark Ca=
ve-Ayland)
e5455b8c1c: esp: consolidate esp_cmdfifo_push() into esp_fifo_push() (Mark =
Cave-Ayland)
e392255766: esp: rework write_response() to avoid using the FIFO for DMA tr=
ansactions (Mark Cave-Ayland)
0db895361b: esp: always check current_req is not NULL before use in DMA cal=
lbacks (Mark Cave-Ayland)
ff4a1daba6: esp: fix setting of ESPState mig_version_id when launching QEMU=
 with -S option (Mark Cave-Ayland)
91c0a79891: hw/arm/mps2-tz: Assert if more than one RAM is attached to an M=
PC (Peter Maydell)
db2fc83aa4: hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block (Peter May=
dell)
52c01ada86: exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1 (Richard Hende=
rson)
ff38bca7d6: target/arm: Check PAGE_WRITE_ORG for MTE writeability (Richard =
Henderson)
eb42297a59: accel/tcg: Preserve PAGE_ANON when changing page permissions (R=
ichard Henderson)
017a913af4: hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range of S=
treamIDs (Zenghui Yu)
0c38f60783: hw/arm/virt-acpi-build: Fix GSIV values of the {GERR, Sync} int=
errupts (Zenghui Yu)
98f84f5a4e: hw/block/nvme: drain namespaces on sq deletion (Klaus Jensen)
5cefe28708: hw/block/nvme: store aiocb in compare (Klaus Jensen)
d357230b20: hw/block/nvme: map prp fix if prp2 contains non-zero offset (Pa=
dmakar Kalghatgi)
a3d9f3a962: docs: add nvme emulation documentation (Klaus Jensen)
2b18fc794f: spapr.c: always pulse guest IRQ in spapr_core_unplug_request() =
(Daniel Henrique Barboza)
d522cb52e6: spapr: rollback 'unplug timeout' for CPU hotunplugs (Daniel Hen=
rique Barboza)
0b47ec4b95: cpu/core: Fix "help" of CPU core device types (Greg Kurz)
cdeaed2778: i386: Add missing cpu feature bits in EPYC-Rome model (Babu Mog=
er)
c2c731a4d3: test-blockjob: Test job_wait_unpaused() (Max Reitz)
53ddb9c892: job: Allow complete for jobs on standby (Max Reitz)
00769414cd: mirror: Do not enter a paused job on completion (Max Reitz)
c41f5b96ee: mirror: Move open_backing_file to exit_common (Max Reitz)
da64789d3a: hw/block/fdc: Fix 'fallback' property on sysbus floppy disk con=
trollers (Philippe Mathieu-Daud=C3=A9)
f940b0ac6f: iotests: Test mirror-top filter permissions (Max Reitz)
030262a6e4: iotests: add test for removing persistent bitmap from backing f=
ile (Vladimir Sementsov-Ogievskiy)
66f18320f7: iotests/qsd-jobs: Filter events in the first test (Max Reitz)
b084b420d9: block/rbd: fix memory leak in qemu_rbd_co_create_opts() (Stefan=
o Garzarella)
c1c1f6cf51: block/rbd: fix memory leak in qemu_rbd_connect() (Stefano Garza=
rella)
d895d25ae2: s390x: css: report errors from ccw_dstream_read/write (Pierre M=
orel)
21df394d9e: tap-win32: correctly recycle buffers (Jason Wang)
f9bb0c1f98: Revert "qapi: net: Add query-netdev command" (Jason Wang)
22317309df: Revert "tests: Add tests for query-netdev command" (Jason Wang)
56e6f594bf: Revert "net: Move NetClientState.info_str to dynamic allocation=
s" (Jason Wang)
603f2f7c6c: Revert "hmp: Use QAPI NetdevInfo in hmp_info_network" (Jason Wa=
ng)
d89b4f839f: Revert "net: Do not fill legacy info_str for backends" (Jason W=
ang)
e999fa47b2: tests/migration: fix parameter of auto-converge migration (Hyma=
n Huang(=E9=BB=84=E5=8B=87))
82ea3e3b99: migration: Rename 'bs' to 'block' in background snapshot code (=
Andrey Gruzdev)
eeccb99c9d: migration: Pre-fault memory before starting background snasphot=
 (Andrey Gruzdev)
360f0abdc5: linux-user: Use signed lengths in uaccess.c (Richard Henderson)
7645f21f40: hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl (Klau=
s Jensen)
ec20329748: hw/block/nvme: fix assert crash in nvme_subsys_ns (Klaus Jensen=
)
8eb5c8069a: hw/block/nvme: fix ns attachment out-of-bounds read (Klaus Jens=
en)
102ce606fb: hw/block/nvme: add missing copyright headers (Klaus Jensen)
e548935634: hw/block/nvme: fix handling of private namespaces (Klaus Jensen=
)
9b8671ed43: hw/block/nvme: update dmsrl limit on namespace detachment (Klau=
s Jensen)
f447f92c88: hw/block/nvme: fix warning about legacy namespace configuration=
 (Klaus Jensen)
dae8be368e: hw/block/nvme: fix the nsid 'invalid' value (Klaus Jensen)
349bf41d59: hw/block/nvme: fix missing string representation for ns attachm=
ent (Klaus Jensen)
5ad7d0174e: hw/block/nvme: fix pi constraint check (Klaus Jensen)
1a8e44a89f: migration: Inhibit virtio-balloon for the duration of backgroun=
d snapshot (Andrey Gruzdev)
ecb23efea0: migration: Fix missing qemu_fflush() on buffer file in bg_migra=
tion_thread (Andrey Gruzdev)
99c3ac6dbe: virtiofsd: Fix security.capability comparison (Dr. David Alan G=
ilbert)
a2e5bbf0c4: gitlab-ci.yml: Test the dtrace backend in one of the jobs (Thom=
as Huth)
5186685ed6: gitlab-ci.yml: Fix the filtering for the git submodules (Thomas=
 Huth)
d211556fe3: docs/system/gdb.rst: Document how to debug multicore machines (=
Peter Maydell)
acb0a27eb8: docs/system/gdb.rst: Add some more heading structure (Peter May=
dell)
1cb8d12f79: tests/tcg: relax the next step precision of the gdb sha1 test (=
Alex Benn=C3=A9e)
631f112f42: tests/tcg/i386: force -fno-pie for test-i386 (Alex Benn=C3=A9e)
4011a686cc: tests/tcg/i386: expand .data sections for system tests (Alex Be=
nn=C3=A9e)
08341b4fa6: tests/tcg/configure.sh: make sure we pick up x86_64 cross compi=
lers (Alex Benn=C3=A9e)
de6d7e6b02: tests/tcg: add concept of container_hosts (Alex Benn=C3=A9e)
34019198a1: tests/docker: don't set DOCKER_REGISTRY on non-x86_64 (Alex Ben=
n=C3=A9e)
d175ac3847: tests/tcg: update the defaults for x86 compilers (Alex Benn=C3=
=A9e)

