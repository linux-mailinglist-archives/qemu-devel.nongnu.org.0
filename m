Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649962CA601
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:46:07 +0100 (CET)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6us-0001mJ-F4
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kk6se-0008L2-Fl
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:43:48 -0500
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com
 ([40.107.236.63]:39521 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kk6sZ-0007g0-Jp
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:43:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN46/mB+oCjIA0oJuThnWcvWo8nHSyworiHQlkw3Qhp0jO8X843u6I/BNtaN+o4Cf/5zGxg+lZjwU7iCCGEjx6ccNUzLcg+aiGc/UGXsOCPzzhfKlBbcmDsa8s4cNp3vL5R4ulEP4jl1oKSoSFiZNQZiho9rS76oca1qeHXKBkcXGYpQRqg2gYu1Nxyru6WSXnA+YfqkDtAZv8cK8n4jNelMvHhZPX5P/BDTlcPaYcrV8xgoV64yQM5ZpYLoZsQD/XMKXclm9Ek3Rasz598t+/ZmOBLgiRnAkxov/+sxhKItMXzoY0PTb/2sqWr2oD8bKx7tvRQYqz9Z71zgg70AGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+23ZaN4KjkhRYvmoFFkx5hnLixngfe3O4CnHQl4YDo8=;
 b=Sh+pF0ADLxtCztS9rq5zVLFM8q+zbr2mQQ2hfaroylKIdwfWVahjGZwY345EFVrKoCBKNa93eI4mZnxdGbBT3aknrjUXa16TqDChyW6u6igXX3XVj1DdjGny5R48QTAfxiI7O6/JPpitbxX0cHPNE8jN9TixjeVNJFAU6MQY4xGqGRBbMdfDu/T/C+qp66473t6/V7H3l6LX6rlnTyR4sAjEXlf9J2H9nfStXZalv7uLzAQdveM1xIayvFRWvR3Wt+SPx4oOrB5Undqb7+OpC3AC8wNnZeb//h9DYWS5ifPXU6MyzM0tfQ3q121IAMs5bpzmuPgPrDYk0A+6OWsIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+23ZaN4KjkhRYvmoFFkx5hnLixngfe3O4CnHQl4YDo8=;
 b=ezm7jYa3NYpoDW5rbMTgdDrHfg7sRhoMZlVI1krVskPregJkxORblUw1Yvb5ZmGIw959hNc4HLI9HsFBicnov53TEkHEGJr8/lBaKQ3FLzc8mCaMc9rhq8+tv7KKuMJbOrb9MNob0y55pZg1j2iuouhx3/YSN2CHlP8WSb5boJ8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 14:43:39 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec%3]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 14:43:39 +0000
Date: Tue, 1 Dec 2020 14:43:36 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/11] exec: add ram_debug_ops support
Message-ID: <20201201144336.GB27617@ashkalra_ubuntu_server>
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <eeb1393a933c5443941ae795478a7bc33f843cf1.1605316268.git.ashish.kalra@amd.com>
 <CAFEAcA8AW-jQXHeDuNHq1AHe=u8z_JtgP5gvLnz3vHvXR0uBzQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8AW-jQXHeDuNHq1AHe=u8z_JtgP5gvLnz3vHvXR0uBzQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 DM5PR04CA0046.namprd04.prod.outlook.com (2603:10b6:3:12b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 1 Dec 2020 14:43:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9524174c-1ef6-430c-e6dd-08d896077d94
X-MS-TrafficTypeDiagnostic: SA0PR12MB4512:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4512B8BA58375D5C1137D4708EF40@SA0PR12MB4512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90KeKsP8q99P/Z3AyHHvLOVUqNKMpM3WnNbGbxa/Ur7P5Dsc8Q2r0BBdhqHpJHPYVgkfhJD+3p38JQK56ozvM4wxXuMNDMlp9o1fj1Oqvo5Dw4ad4in/DM4z7PxcgJrcM4N55nPSq/aNDu9aEkCuqjZx/ZEMzRvsSWl6TkfetOiFuhrDCmW9Jn+aSdaSOtr1087/TZv3MCP7gPwb8/jJTfbeODOklBC5sOYgBHIGa6TCKFPGOon6KEGT5LicuOvqjgvUsd//46563nGwFMaDos5SZ/c60lNwuhxoQEXCTyl/S4ziHlHVsDJdWWpWHWCsGniRRosZXbaQ7RujohNolQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(26005)(4326008)(33656002)(2906002)(186003)(16526019)(7416002)(86362001)(9686003)(55016002)(6916009)(8936002)(52116002)(956004)(44832011)(8676002)(83380400001)(1076003)(66556008)(66476007)(66946007)(33716001)(6496006)(316002)(478600001)(5660300002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p/Ta0CepQ/BF9V9cLwGYfg0/EQbkF8xssrSyoAY+586qWF2qkXyzz9xZaBfi?=
 =?us-ascii?Q?Gpzp2W/JW17R3AukXUAAAmaBWj0HM49HpNOMY3T4Jp67tXdYHidGy5x3BAqW?=
 =?us-ascii?Q?4NNu8UtAsmB8cBbr5rgDkyfQ1DukpgQQTxyxq9RDbm+G6Xxw2mfKc+e0Gc36?=
 =?us-ascii?Q?TG0vHZeGhMWa57PG6OgXnGJV3ZrXA8yusnSjwDWch5N/yIxCgk6RZbWixDxg?=
 =?us-ascii?Q?rxqZhaTaT4n7yezKYYtf8npFC7L5Zw+3wdRHyg8U01XQlelPFdQeP+fVgCvB?=
 =?us-ascii?Q?VQrvVQw30iQ4i3wUOPExVrFWOnXU8fTZBFYAGgC+LGpzS29frqvxUmoOzKDw?=
 =?us-ascii?Q?nxT6fPUCknl/hKMP3AgTNubDZodIpglaYkJ5YF4HayQ3E4cAzhWtrjoLrnaS?=
 =?us-ascii?Q?mP58A7lEbrM6he+nWJZUNBBdBzehsgC5EM2RPgB9nSnHZLLsT6QqKRtwB/iu?=
 =?us-ascii?Q?MGINI8/HOylJvnjrvyhFsFmSM2+xODK2+Uq6tDF9JxVuH7b4MC33VR9tkv2I?=
 =?us-ascii?Q?B5NQlZ/dYrW9rkCEiO2Hmpjxc765tWEaYegFZzDDWpg57VtEmF+ako1FCcru?=
 =?us-ascii?Q?HkgCy755Lt7Rr1QQezK8L/nvGnNHwtcdlmnnFJ/gf8sF5KqmrArMzdl4AEJW?=
 =?us-ascii?Q?s7lOvU+YyUotrsOOmGfRJCDa01oQ3/nFw1MEGcW/49mA7pWasH7Pg90QfGBC?=
 =?us-ascii?Q?N5orjZWaPI5Ghx8vLu82W+Y7AXvbN6iFiOFFAEqdSG4qDNdN228Sov2BbWpn?=
 =?us-ascii?Q?c1/XQjuFdNImN3BzfZCYDmJnp6pMrv0LQscJn9WreNW2875A5dGJxgyroj+4?=
 =?us-ascii?Q?d16HPKoNZY0Mcw8XUqF0dkAWhbzB/GFeohCBJsCs50kLIGouttaO2pV8KhYY?=
 =?us-ascii?Q?GgxFjTNtm3x2ZGcN9XxunGVZKe9+BQ/Eptz6+cUobyeSsj+QXsEYSveFrk8a?=
 =?us-ascii?Q?6U5qsN8m3FXSapFZ2Mp+9mUtDSVVgNIolbswwUuD0ZKzWL6JfFKBVuXQFkI1?=
 =?us-ascii?Q?L+Wq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9524174c-1ef6-430c-e6dd-08d896077d94
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 14:43:39.0382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USMHx8ROsZPro5NYwwmJuhIHCbimMXeCP9lX9jOe473vXSD+QhCR0AuogrWWWiJLewwWoE04uS7uslBjOrBh7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
Received-SPF: softfail client-ip=40.107.236.63;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, ssg.sos.patches@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 12:08:28PM +0000, Peter Maydell wrote:
> On Mon, 16 Nov 2020 at 19:19, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
> >
> > From: Brijesh Singh <brijesh.singh@amd.com>
> >
> > From: Brijesh Singh <brijesh.singh@amd.com>
> >
> > Currently, guest memory access for debugging purposes is performed using
> > memcpy(). Extend the 'struct MemoryRegion' to include new callbacks that
> > can be used to override the use of memcpy() with something else.
> >
> > The new callbacks can be used to display the guest memory of an SEV guest
> > by registering callbacks to the SEV memory encryption/decryption APIs.
> >
> > Typical usage:
> >
> > mem_read(uint8_t *dst, uint8_t *src, uint32_t len, MemTxAttrs *attrs);
> > mem_write(uint8_t *dst, uint8_t *src, uint32_t len, MemTxAttrs *attrs);
> 
> We already have a function prototype for "I need to call a function
> to do this read or write":
>     MemTxResult (*read_with_attrs)(void *opaque,
>                                    hwaddr addr,
>                                    uint64_t *data,
>                                    unsigned size,
>                                    MemTxAttrs attrs);
>     MemTxResult (*write_with_attrs)(void *opaque,
>                                     hwaddr addr,
>                                     uint64_t data,
>                                     unsigned size,
>                                     MemTxAttrs attrs);
> 
> Do the prototypes for accessing guest RAM that needs decryption
> really need to be different from that?
> 

This again falls back to the same thought process, to keep the debug
specific code separate from the generic code. If the above
MemoryRegionOps are used, then again we are using generic code to invoke
debug specific stuff.

Thanks,
Ashish

