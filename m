Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A978F2CA639
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:52:13 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk70m-0004km-FZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kk6yO-0003b6-Uw
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:49:44 -0500
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com
 ([40.107.236.48]:26496 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kk6yM-0001Ip-Ji
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:49:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K36ImcI10HiXVeXZCUPDbOUnqEHJpPOX3hrbKJUnIczrM7pBFjvC6YSQdTB36gNhu9vTBnnNTBuOzcrgz2Nt61lcefq8TwUUuyuafq3xEGhGL7FHk8ZEUFLAVvybUu4dbMjl1/P5TZVW2J8KNA0DB4tcuArJFerGmeWWG+vv/WAYeXCjFs8GVkEHWBEa8QQzBwwkXFCJYOc5rUwr4/QHtHaSUoThL/Vu9/PO+k26BHsUPi09SIDpcRX1cDYztV75yqKeRxPY6AvH7xGmlMV7CpDc8+EwMiHiOFIqqSJH+Dz/APZDgqkD1tJRABwOKQ3SGyRpCQvahxpj1ht6eKtJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkJfsxo9LkNbwCxAmSVHXShJyvVUuRICd08CZKYqVwc=;
 b=WGoSdrnVCc0rWtKYJVa0taxHFc+U5podBeEAfe1InqgjGOpEr9/FLWfWlp9JhX8TP9WwxRxxYZ+rn5wA7U3VQJ26nW2aBQNf0TNeRL+SvT98dJ89ABg/TOyTxdve+RwDYoMTf19n2Mp26xtn9MqZMSChYHzIhTwHLs9ziwXpnfViY0W2YsCPiJguMUoNTCvqDVc3Of5cHUPS1AMf2j5PYWV2WFG8ulyU4B98dGhHCLP2ZvroEKmAeUFrV+lfarwoLjguIUXsC5bCbqlw3/ZSWd/VYVP/Wl7B7+EhV26SifMpLrQOMgHXWn2/HHrwfuMEBNGRutENOBLm7i4YIraFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkJfsxo9LkNbwCxAmSVHXShJyvVUuRICd08CZKYqVwc=;
 b=2ki3q2bM2wS0xYt/Pz1LSTn821ukBktsHjMJw+IOjUNbGQ4ZCVr8YFPSD64Xmz1FwZVOffWJv5VY3FwVx03kMEuJMEKPu+bp0PeL9258NIoo7LwEmDKvyd3bbfpfHG+7CjabrZ8POY8xIPwtZKb7w5VuVpEgHVeME2hV/yclFw0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 14:49:38 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec%3]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 14:49:38 +0000
Date: Tue, 1 Dec 2020 14:49:35 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/11] exec: Add new MemoryDebugOps.
Message-ID: <20201201144934.GC27617@ashkalra_ubuntu_server>
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <4393d426ae8f070c6be45ff0252bae2dca8bbd42.1605316268.git.ashish.kalra@amd.com>
 <CAFEAcA8=3ngeErUEaR-=qGQymKv5JSd-ZXz+hg7L46J_nWDUnQ@mail.gmail.com>
 <20201201142756.GA27617@ashkalra_ubuntu_server>
 <CAFEAcA8tJ7NZ1xVeZUhxYYTpjiZ7GJzDtcUPBWVO5C8cgLURVw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8tJ7NZ1xVeZUhxYYTpjiZ7GJzDtcUPBWVO5C8cgLURVw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM5PR22CA0018.namprd22.prod.outlook.com
 (2603:10b6:3:101::28) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 DM5PR22CA0018.namprd22.prod.outlook.com (2603:10b6:3:101::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 14:49:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c61b82f2-6bf7-43aa-9eca-08d896085372
X-MS-TrafficTypeDiagnostic: SA0PR12MB4431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4431E71FBB290DF168082B6A8EF40@SA0PR12MB4431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5cEy8O87ACoU8SQU3mQ0IEmKftvAZcFOo7qTjkMEuB5vrqaqFqbH8rMeXpmVb+7DkgS+gVzf9onh7Kud7FUGeG9fMqt4rvlBIXT7jAh+y51zi0ggNoO9eo2y/UZeO8hqpnpQb0EcK2RtyXBwgLCLjpPLGWcFVjRMkel0UDQ/9/rmkZp2NcUcX0EPw53TzCP93ODADGW0NoRW8CK3fMUVoe/KvduxOTA3tP8l+xQfl7rCBRKq8/U3MrH3A2VrNqlml/NggzuoM2K84z3hz7n8ixt6gYn3H1rckKOZr8fL8bdOHvhLiFoEMB2fLdNvMUlCct1AeqqzY2k6N+8Q9aO8Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(54906003)(66946007)(44832011)(55016002)(8676002)(2906002)(33656002)(83380400001)(52116002)(6496006)(66556008)(5660300002)(33716001)(86362001)(9686003)(316002)(66476007)(6916009)(8936002)(7416002)(1076003)(186003)(956004)(16526019)(478600001)(4326008)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6VTTo8EWsRWuy4woZnOLKzeSXyzYMYZpplifATtsRKAqVxQ/kzzo9wLeSa5R?=
 =?us-ascii?Q?ZmO7IzPi3jhAF1LGQLb/WK3Ox1IBEOdOMeKuPZ8+d1uhMKiQfi3KsfQliwOW?=
 =?us-ascii?Q?8wAqcPYyD8E1dSmnMzC7lAqSZyEn1J7rKrVZzoojj76Qslq/PgdOnFcnXwdM?=
 =?us-ascii?Q?mYHEfzLU1Lssy43G2oVtSs/RVa82gKNw+g6Mco5VznFhyVWFfrCojtten0lv?=
 =?us-ascii?Q?rzEFl7Adz2aRrajtaS+WoQAFUd4Z1tFX0c8VsVGkFAgyP/Qj3a4lMokpSPt2?=
 =?us-ascii?Q?mMugCJZLUZmia5/nRt8fy9MB9rxb3VzmBJ5Tel5blw0s4c7+Uyc6CRnenchx?=
 =?us-ascii?Q?3FygfkQCdbZ7Q0xk+Jv6MdlFfkmNExX3fdkSeQ9X/yX5wyD9yGRh6copUYqs?=
 =?us-ascii?Q?2VEDfXImbpYHGJIFd0BjdBTg/Lbn1eUMPTYWuhVjr0B1uS5jQymaCCqfjmbX?=
 =?us-ascii?Q?Vii2PrVy+Iq2m8cSiv8X1RWqrZuaxuDdtVV40swFaKnb+bo8DxR0Lbo+alSX?=
 =?us-ascii?Q?NuxMjvE11bz6/4N3K2gDhA5FZg6o7YLeHjP4tA+g5vmaortleBY/VA7F3kPA?=
 =?us-ascii?Q?WAQwwrQ6XP25PdWPlHUt3XO/tfDb0DMiYJ+ALKplBX7y1pRenoJdhtP60Egx?=
 =?us-ascii?Q?xlTjbtmiz5BJLVr2AzudePSKGlP1fIv8yKBUVZOr3cdvScXOX7kZoF13UrNH?=
 =?us-ascii?Q?8Y5bT20AS/vlwAqNMTDHwfPfnj+eat4OX5k1ZHbwYz2npUmLQRS7LFMKKV3x?=
 =?us-ascii?Q?HP1rq0fHwIOKtDrZPyqrUc3Jg8Vlgfxrtd49p/EsI6h+EkkhyKpW6sXY0B0G?=
 =?us-ascii?Q?YlgwwFX6rkzzQbjBM+lLZ+eLyu4mXDpKRa7Q2xjlnRl1RkuZg7VJlvBpA6k/?=
 =?us-ascii?Q?nqvWXt0hOu6EVL26E1S7faObC5wjcMvc0H8cCt0babkgHX7ASLyVoZPaoIlS?=
 =?us-ascii?Q?S9ZDnhDotvv4IzZPWaATrxsCF7FwLiNGGyajsRkgVAGHuKKwn/yT2nabgGDg?=
 =?us-ascii?Q?v/hI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61b82f2-6bf7-43aa-9eca-08d896085372
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 14:49:37.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFvITNiM7YcVqm/ELn3ZQ3gN5NE9l0rOueuPm1bLIMIO5DtCT6th4yFBxaP1Senl8aRoxnZqlSbxbI7kB0Uk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431
Received-SPF: softfail client-ip=40.107.236.48;
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

On Tue, Dec 01, 2020 at 02:38:30PM +0000, Peter Maydell wrote:
> On Tue, 1 Dec 2020 at 14:28, Ashish Kalra <ashish.kalra@amd.com> wrote:
> > On Tue, Dec 01, 2020 at 11:48:23AM +0000, Peter Maydell wrote:
> > > This seems like a weird place to insert these hooks. Not
> > > all debug related accesses are going to go via
> > > cpu_memory_rw_debug(). For instance when the gdb stub is in
> > > "PhyMemMode" and all addresses from the debugger are treated as
> > > physical rather than virtual, gdbstub.c will call
> > > cpu_physical_memory_write()/_read().
> > >
> > > I would have expected the "oh, this is a debug access, do
> > > something special" to be at a lower level, so that any
> > > address_space_* access to the guest memory with the debug
> > > attribute gets the magic treatment, whether that was done
> > > as a direct "read this physaddr" or via cpu_memory_rw_debug()
> > > doing the virt-to-phys conversion first.
> > >
> >
> > Actually, the earlier patch-set used to do this at a lower level,
> > i.e., at the address_space level, but then Paolo's feedback on that
> > was that we don't want to add debug specific hooks into generic code
> > such as address_space_* interfaces, hence, these hooks are introduced at
> > a higher level so that we can do this "debug" abstraction at
> > cpu_memory_rw_debug() and adding new interfaces for physical memory
> > read/write debugging such as cpu_physical_memory_rw_debug().
> 
> This seems to be mixing two separate designs, then. Either
> you want to try to provide separate "debug" functions like this,
> or you want to have a MemTxAttrs "debug" attribute, but you don't
> need both. Personally I prefer the MemTxAttrs approach (and disagree
> with Paolo :-)), because otherwise you're going to end up duplicating
> a lot of functions, and the handling of "this memory is encrypted
> and needs special handling" ends up being dealt with in various
> layers of the code rather than being only in one place where the
> lowest layer says "oh, debug access to encrypted memory, this is
> how to do that".
> 

I agree that we end up duplicating a lot of functions, but doesn't that
keep this whole debugging stuff separate and clean and also isolated
from generic code ? 

Thanks,
Ashish

> > This seems logical too as cpu_memory_rw_debug() is invoked via the
> > debugger, i.e., either gdbstub or qemu monitor, so this interface seems
> > to be the right place to add these hooks.
> 
> Except that as noted, although all uses of cpu_memory_rw_debug()
> are debug related, not all debug related accesses are to
> cpu_memory_rw_debug()... The interesting characteristics of
> cpu_memory_rw_debug() are (1) it takes a virtual address rather
> than physical (2) it writes to ROMs (3) it refuses to write to
> devices.
> 

