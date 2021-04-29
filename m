Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BDC36F189
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 23:04:15 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcDpV-0005IG-NI
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 17:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lcDoF-0004RL-M4
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 17:02:55 -0400
Received: from mail-mw2nam08on2053.outbound.protection.outlook.com
 ([40.107.101.53]:7936 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lcDoC-00048g-Tq
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 17:02:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyBXw0IcLajwODt1xulG6YS0V60Mk2Ib/Sv5WmKg5uKSc99hcQ8V6JSiAz/5gQpwOGIkj+I0fDhf67nu37UHuCo133asVTepkRaZZQVbliBhHIC7IgSKPHpG8c5rOR361nz2fRrc6iey5wiGtBOHBkNwUT1nnp2hYxtj9Ngl0ZibVUR7NzUefUQuWkEK27iGLcn8oWQfT9DOkF2HjFerswSFP5hjzOhbsMobtzfKvLTMZlz8c/XnE4Zl6cbXNew4GzjZmp5JEQEEl6b4AjuI1DLk9nKnkhSUVFTNWZ2yaUqsnHrMIJSkBULSA96H40cRRiJLJ7rSxhQFklPGOEnPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCLGY6qHlsb3z60RqpDpN9sQiStA+4vL7iKFVccysA4=;
 b=oIeoKnqxYgDKqXVyerw4vg9PQdxsvq9r6Vex81hsXlVkV735RTyCsx1+25uEqgiqGB1brbY0ntV0AZs80EIsbzrQGQwIXUflMqEbKKTqJuRy0oq7nqtZ4mKVJZsjetMORaa4g9tGIE745DnHLVARKvdjWDsxx5X1Dhlj4ckxEmB/lVVlOlUEbVgCDrqvgDTiPUdopzZ9Lxe47kXYVHrstNAUmqHT2gQizjYEKGlgRch1GX+kj8ssw8lk9xLTRaGfsgFAcilPwBy1U8Trtdgwm8PBT7b8MQ95LV+n5yUbSwdptea+0o25rRQJTANc+R7iElmq2sLukkzJcitnNMYz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCLGY6qHlsb3z60RqpDpN9sQiStA+4vL7iKFVccysA4=;
 b=yH2Aw8IwOLoVF2CqX+SostLXlHFzFsUFRSEd+UvdT4y0lGAmRbHy+qH0AspQ0fYpOdZNUpTF8+hocirll7VtFSwWRnOazGD0bYqiu0JQ0O0YVIwUvXiZJyXQJRqtAJ7jnVvSAC6txEop22PyD/IjZZnzjsr/bpcG5uCjbGZr0YM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Thu, 29 Apr
 2021 20:47:43 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 20:47:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Apr 2021 15:47:26 -0500
Message-ID: <161972924653.752422.4599410470297181983@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SN2PR01CA0040.prod.exchangelabs.com (2603:10b6:804:2::50)
 To CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SN2PR01CA0040.prod.exchangelabs.com (2603:10b6:804:2::50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 20:47:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4d4d99-2944-44e5-6870-08d90b500919
X-MS-TrafficTypeDiagnostic: CH2PR12MB4070:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40709D4DB0671534433FF1BD955F9@CH2PR12MB4070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iB09eu99L/U4gjYpdXFRPmL10dGYodSH9ilMF/TZi8BOdF6ff+a6sqhZhOzH20F8mKoRz2J21/2q/rwMpuP9vTHyk6HVdppit/rOAmecSgTJkYb+CU2/wUkHkgkk5J2vStBpqFlD7zIbOCLQRVM2Bye8qdqAL1MkLFSfYT/F8hIAmAYZeLSPbBZa8eyQHpgjMyN5dvbKnJ3XpplBVgmz60AOQwDyvg8VLDR1dhjUsyyI2Mk3iLNfQhmEhtZVFAfRUsBiEuhc1L300oRLpd5mpg6YHPgmlS/R6/sts1wu4T+61gki3jVUL0A+sZCjZWfe/iRhB3RkpBu1p/yuRggT6844ET4+AT3cA6iV3++K7E7IXciecuKfyy3ax0eyiwHfMbtg6zVvzH6YeXUlun5n/OeTn7hGjTOt9dYdalLxBXRVOCfL1YsUean4akIWrVFwdb9PJuqXNJyVswh9xwTY8xuQTvLhsz38lO8Yve6L2AEr4w7zyA+I9qkMhODot2tECVbzGx+iBuDDERREyFlPImG1Npf9ahoiH4CYW6shWq+8f+OwG01YR23L5S+50fraPlxCpBZzJ1o7oTHxKfDlYAgpLpRbi51OkVKonO1K6tpd7eVv+kVaqvvaGyL5qtAB4iDAFpkK3dkl9aPIi5fRz5lRSdVqDKMFo948U0zJBAMHJCvL1CwV0XWqMvkBgySN8/dgzKQRD3wgbHbdtK2DJEKUYshr2+bsj7NceKUunVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(36756003)(6666004)(52116002)(86362001)(478600001)(4326008)(26005)(956004)(38100700002)(8936002)(8676002)(6496006)(6486002)(66476007)(186003)(16526019)(2616005)(38350700002)(6916009)(5660300002)(966005)(44832011)(83380400001)(316002)(66556008)(66946007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVhvN0ZwNzlMQWNObjBnc2k0MThCTXhXY21OWGpUWUQrSVlWQXJ3bmcreWtY?=
 =?utf-8?B?UEdzZnVIUlN4SUM1TW00QWRWSm1NWERxY1A1b2lyWW04dE9WRkRhVEZ1b1NP?=
 =?utf-8?B?QXdNR3UrbU9uYnhZUnRObGtzaVZVMUttTUV0cUtHenc1cGZHNUd6Y244dDlY?=
 =?utf-8?B?QkN6Nit5NkY0VmxUYnBvQWhjNUlWMDlxbGxUUFpxQXBucm5HUzlKVVcrNW1U?=
 =?utf-8?B?TzJ5aGlITk50LzAvd1VZc2tWT3RCN2lHSEdndGdKbFhvbWttb3B3UzBDcFQ4?=
 =?utf-8?B?a2wzTGY1WnF0bFU4bWl5dE90cFd2bGRSU002a28xR0pmSE10S0FyN3VWcGxo?=
 =?utf-8?B?aEsyT2puaE9TVFhSSTU0RWZBS2dwSUtobGtMcTJOQlpDRXI4Umthd2x4eXJI?=
 =?utf-8?B?RXVGcXpiRzVaNTNCRGpFN2V5c0xKa0FlWkg0dDF0S0ExOWtXR2tpR1lKa2Nt?=
 =?utf-8?B?dnMyWTM5NmROa09oamxnYjFoaDh6M3hPNi9adDJlTjlET05PU3JmMWh2Tm1K?=
 =?utf-8?B?eEorbCswNHh2Z1RHallyNko1VHlTOXkvMXlJM1VhbHlFT3dMTzBOdFBmMjNO?=
 =?utf-8?B?VWVseFpCeEZKUGlySmdBQi9oR080TXlJa05DZ1ZyTkd6ZmgrQmNTNG9GcnlU?=
 =?utf-8?B?eFFvWDQzOVM1RjVEWjl3YUdKVmF2M05QR2VRVFRKTUFGbkFoTzFXWW5raGk2?=
 =?utf-8?B?cFVYSFZ5UzNrQTN4UFJvVzN6T0pwcUlpcFhlVzludS9mcnQ3clVRRDJieTZk?=
 =?utf-8?B?SWxwOHlkTStDWFhPdWRuOFAzeUtSOHFkRDUxaDNaWnpTSSthVW5ZVm56K3Ni?=
 =?utf-8?B?ZVQreDJ2WitaaC81R29ZMU5UMnRWRlBDQ3BlU2hmbE52ZFBIamFIMGttRmNM?=
 =?utf-8?B?bkE2VWpBbjF2d0t2WTJXMU1xNk5JV1ZtQit2YzNLM1FUN3kzOGUxNFkzVFU5?=
 =?utf-8?B?OER1WTU2L0RaQWx5bXQ0aGhJejZiSDlSaWxBN2lDZDViamwySUxlUmhYMWdV?=
 =?utf-8?B?aEZyZ1B5TTJOdlJJWFBYSVNzdDZoV05ZT3I2c0JJTExyQWtDazQwVVlsb2d3?=
 =?utf-8?B?WEt6R1VVN3FoSHdRbTF6a2pCN0dGTm5tR29Rb1NNcW5JVFNIMFc3M21vQkFy?=
 =?utf-8?B?UGxpc2pmbHNZbFFyRHd3Y3FnMndLbFdjeVBDNDRtNk1rWUoxK0NIMFpadHkr?=
 =?utf-8?B?Z1g0ZWdaM3REbTEzRXZQRnRmeW8ySnBQM3RscGFNd2UvaGIzdmhwa3NLR1c5?=
 =?utf-8?B?NmpNdUR4dExZNlJoeGpoSUVFOXdQSHZMdTRnNkcrYkdVQlhNSll2ZHBnbU8y?=
 =?utf-8?B?cXlIV05OdUVFQm0xbndIUW5xbExNQmJRcHRGMzBENlJvd3BLTXdhMjlWNVNM?=
 =?utf-8?B?RTZEY3NJMlBwOUw3N0VOWHZaVEU5cDIxMUR6YVl5L0dnV2JvaCtRQlZKcGpQ?=
 =?utf-8?B?S0UwVU1mU2xOQ0cvQno1VU4yamYvZ1RLNUhUTXJqUzg5YmFIbExVc3dsUnNP?=
 =?utf-8?B?UEVzVkZ2WTFDdXQvZ3dqdXpmYWpTS3BGcHBzRXJ6U2tUQ3hudzhKWis4OVJZ?=
 =?utf-8?B?YVFaMzQwYmszc2huZjZEVE15SXVCOFkvWXlhaHJQR1ZyR0xQTy8xU2tYQ01U?=
 =?utf-8?B?aGNZb01CN09INkRibDgxWlpoR01JeGgvRndwVUttTDdqaHZhbno4V1hIOGh1?=
 =?utf-8?B?VktpaS84eTV5eTE1UElBWjdkYVF3Y0dPWU10V0dTNVpDWTk4bmdhMldZM3Y4?=
 =?utf-8?Q?DkHn3Msf2giIYQVNdGeMXewVt4YPkoLQFPD2Vuu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4d4d99-2944-44e5-6870-08d90b500919
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 20:47:43.0253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +78S77fyVNeqyLo+ubOIU+C4/lBVylRf6hQIVi89UpTwZ2PZUiODuDXyf6DbBltSgS9ZEmxUjBCSIlJNBSZQFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070
Received-SPF: softfail client-ip=40.107.101.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 6.0.0 release. This release contains 3300+ commits from 268
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/6.0

Highlights include:

 * 68k: new 'virt' machine type based on virtio devices
 * ARM: support for ARMv8.1-M 'Helium' architecture and Cortex-M55 CPU
 * ARM: support for ARMv8.4 TTST, SEL2, and DIT extensions
 * ARM: ARMv8.5 MemTag extension now available for both system and usermode
   emulation
 * ARM: support for new mps3-an524, mps3-an547 board models
 * ARM: additional device emulation support for xlnx-zynqmp, xlnx-versal,
   sbsa-ref, npcm7xx, and sabrelite board models
 * Hexagon: new emulation support for Qualcomm hexagon DSP units
 * MIPS: new Loongson-3 'virt' machine type
 * PowerPC: external BMC support for powernv machine type
 * PowerPC: pseries machines now report memory unplug failures to managemen=
t
   tools, as well as retrying unsuccessful CPU unplug requests
 * RISC-V: Microchip PolarFire board now supports QSPI NOR flash
 * Tricore: support for new TriBoard board model emulating Infineon TC27x S=
oC
 * x86: AMD SEV-ES support for running guests with secured CPU register sta=
te
 * x86: TCG emulation support for protection keys (PKS)
=20
 * ACPI: support for assigning NICs to known names in guest OS independentl=
y of
   PCI slot placement
 * NVMe: new emulation support for v1.4 spec with many new features,
   experimental support for Zoned Namespaces, multipath I/O, and End-to-End
   Data Protection.
 * virtiofs: performance improvements with new USE_KILLPRIV_V2 guest featur=
e
 * VNC: virtio-vga support for scaling resolution based on client window si=
ze
 * QMP: backup jobs now support multiple asynchronous requests in parallel

 * and lots more...

Thank you to everyone involved!

