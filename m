Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3453BA2E3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:46:04 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLMh-0000wQ-5Y
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lzLKc-0006xG-RR
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:43:54 -0400
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com
 ([40.107.236.48]:20698 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lzLKa-0003KW-80
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:43:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OANxOT2dum3LsoyWWKnXwlbjAkrTLqMerPEtP4QcDZ3osm3FIvmcJ9SA/joT0kmAGHYw0vtRZD6jK+GaC34B7tZDp9PoM/KHmb3tODMXRT5DfoyGEfNPVAdKMAVWaxNh04GsA9/O0/mbH1jZ2bhs0My9biPqBleWr3BHvk6Ldu5pgHdVU6P6i6X2dhjHqQoe+m7C49+GAAZLyGeXaITSACIVs6gnvN8lRq67fULLkdZRbyc1ioa1FFxbb95cKblRLp2gwEsOHMRc84sOM6mKOPHaE7fgY6fCE4w4zy+L88Ev5ZQTPXIj4p1EWyz2Oc+nD5ZVRU+FU5dh33bmr1na9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ns8HwnVdPrAyRR9Yk4sfMCNy4EIUuLlHbV+kTyxILc=;
 b=XLK4Eua6/7ufTrtJhVYV2JEzdhH4NNA4pkSKJTrn3BOnyLaapn7shKq9Hr/2or+n7YFv7RbhfT8nMj6E4nWP9vc3gNcFKuBcTS8CbqJX0t4htKaoGB1YwM8mmqYPkS5K4YAotUo21Al1J3PkAiVDF2lEU+7KVpzmOmjZB9qJBjpcOaGMzkTt6NE14HpBKzOp999PsYpH2PWPu2xJYCcuTuVzXqOW5z07ChLqVIHdJxOBK7AK0OUYRt/gXSrzMY7mFwo+NGvsjf0cx7+fx2iRU3Cq/U1e1JVo2y9TL9JRvmJaAFUGtQP2POSGtboSApvX+cZ/t1DQ4bHg/bl13WBgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ns8HwnVdPrAyRR9Yk4sfMCNy4EIUuLlHbV+kTyxILc=;
 b=QjJmlceJs1dSpcs6t8kPzqNeJ6lsXQwaCCVHBgZJeh2PouRQkPd/Y10llThEjI9ik4V/ntx79zOGRtnDqvd7VT7xTzQK2jWZsFxK7MMcEuWtnT3wuEUfVmzp6CnwyJQZLcdyzmzmwVJBj2BEItKZAmJXT2BBApFxrfVFns83k1A=
Authentication-Results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4972.namprd12.prod.outlook.com (2603:10b6:610:69::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 15:43:47 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 15:43:47 +0000
Date: Fri, 2 Jul 2021 10:43:22 -0500
From: Michael Roth <michael.roth@amd.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Igor Mammedov <imammedo@redhat.com>, ehabkost@redhat.com,
 like.xu@linux.intel.com, qemu-devel@nongnu.org, wei.huang2@amd.com,
 richard.henderson@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, armbru@redhat.com,
 babu.moger@amd.com, pbonzini@redhat.com, philmd@redhat.com
Subject: Re: [External] Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <20210702154322.x2rwhcx7vwg226bx@amd.com>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
 <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
 <2952f218-f391-36d5-6331-006d9312cc66@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2952f218-f391-36d5-6331-006d9312cc66@bytedance.com>
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SN7PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:806:120::6) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SN7PR04CA0031.namprd04.prod.outlook.com (2603:10b6:806:120::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 15:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 368e0e30-408b-4021-bbd5-08d93d702e70
X-MS-TrafficTypeDiagnostic: CH2PR12MB4972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4972EA9D3ECDE533208F84E4951F9@CH2PR12MB4972.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNVKPhVgQrmyYCBimiqw6E/ZMYvWHJqnKfujU3gvOYwSR5ndZ1+79gjWhsHLG7+FxdC6Aqcz+ZAlUBrlbYDanJSs33GqQJzclzXbDTWiwe3BsbGoeJnZRufROddC6tlUEFNJHnj+qFj75Pz3sSufclDMiLrJtCyVVAF5l5e7PjrT83aigfdL4HKAVUyDuzFHWTuJHrZkd/hr34sYWXHSvVpPY0MmHHLZd1HNbxKHniT9pI5UiBDhrf/+z3QknC42/vCkKxEjCpWuq1hD9w0jNtCYgw0Awq7PtwIHHvr1zCI3Z+Q+3R/2jGgKSsMH0Muab+PNINScUfLgTPmmrsjVhf4/dVuLYDIzFFqW4OOY3mGUBauY5GLsP9+DuV1ziN60kf9xdbd1wIg5hwX8LndHumhcm161sOhPByHuw7PGRyIpGLbsItuhE7awAbs2KV+aOJ1YqalHuB62sPrbq74br72t1o+bwgKKs1+X6nOSQy/XoIxqN+mOTWAlj9USfTAbVYOMpT6JFFVb7iR6LkwVssjzKFDn1PzyiaaJpBu7owDEcs7TooSLawuFeGKYMmXLY//zGwIyxPBNdp5k2CV2AstQhFWQl4fScmqA+3bvbEMBohhi/KgpKblxeC76Geq13a8xyRXf6BpjdRoJA2EugopGV3iwXjV65CuZV8m6qs2G98UP1qSBCDCYJyjtorklR3JTATGgeIOrln/sanqqKUJQDfr60VXu6Qqm87QWpacZLEqnR3yeCCCclUmBKKmWC00tRxWt5zht7TmeB70MwWhaBIeacXv7kIDAiY1aTDHMxF5le3IipDNXhFfA1OdkCKvbSF2QbawvxYod4NJlYEQO6H5xFbuOskVCHvGuaEFyj0fmmDa+IN/REbkjyzQV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(8676002)(186003)(83380400001)(966005)(52116002)(6666004)(6496006)(26005)(38100700002)(53546011)(5660300002)(38350700002)(16526019)(6916009)(478600001)(36756003)(86362001)(44832011)(66946007)(8936002)(6486002)(2616005)(54906003)(7416002)(1076003)(2906002)(4326008)(956004)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31oWJbdMPPdo+vEF6cuxyjo7FYn5srA3yjPG9S5V6Nu1jCtqif67BK9zF6Er?=
 =?us-ascii?Q?2lcB2mWn1FJuNp3pcWQa5FuPuC47BK5uJ7dqTny4Ekj8/jhd5H5gZqIa62sK?=
 =?us-ascii?Q?h1lKbQlf36qsfmxrEvR3aE6KD+9+12RkN6Rak3w+iHqQ0yaPqeXw6uSMyAH6?=
 =?us-ascii?Q?zdVg+sTh/u/wzHSn44dag6/5itnMhl1GLFf/roTHTSggcM+EMEhs6IZyIyQc?=
 =?us-ascii?Q?7tanxuF6HfBSAKuAKnK49+Z0fNnqT/9/EqvUgvvlvF8y5X4Hpurwm1ak5TAy?=
 =?us-ascii?Q?ZQoUuu/CGJSsqre21HAqShi4rpz25IiS68Jdmw5a5xEGL1l49AyWbpd+4ajE?=
 =?us-ascii?Q?iltL6CVxt2XqduacKUPj42DWAfuoMCcGdRS/oTYre0rL4bMp14cUvRU/p/lk?=
 =?us-ascii?Q?/SstvbjgQeAnxcR//Yml8FcrYmmD+XQ+8JtUYTmE9hvEJVTdQJPEY7W7bzA8?=
 =?us-ascii?Q?YYYEGx6xNTlLQLabAoQWUdMsoIjMAmD2XSuHz/8ofqrNqrnRvgZWtTMshOBi?=
 =?us-ascii?Q?gvelKASH+BYRsFGbX4INun9Q2SIv9rY/6iOrIKN7AFlNk3jdtHMqtJLP0mtD?=
 =?us-ascii?Q?Dm4dKzjA7XOT4BmDb2AX1YgW6SZ7CXjArCSU/vjvwlQmkhGmwvBIB1vZ6K8O?=
 =?us-ascii?Q?Zl+E1CdOumwrPbnxWZ8NrGgNF+ROvZq0s5oeEinod0AwM9rd5NWCNoWoj5kX?=
 =?us-ascii?Q?u5SWCyuKWxGdeBEgc0CegkH9C2x+Qqm8oGL/4bn2UgHc+eCWcTxyWerCO7Gp?=
 =?us-ascii?Q?GSowmRIuri6G5Y9LowFFCl1W6Nc4GKbBQ/3n6JyjlHuS0bv4+KEZRVkTZGVB?=
 =?us-ascii?Q?3r3iBq6E+4YjfJfI6kviNR26S2SrIq2bBQYvwdwvJSVaVmA6UbDEb0VbEc73?=
 =?us-ascii?Q?9oWWAkt9WAwsJ3Ymw9pwwQBUO+4zz5oVus+dy0CMZVSFHhusUXYwHAwuesr2?=
 =?us-ascii?Q?R+iSNgwivN4VJpUh/1gGES6jbbSLN4zInrof0DCkyhUJWVCqjwJPUTR8asWC?=
 =?us-ascii?Q?GClR+rivzGLw38na8YzpQ+vp/wjBzY8X1OFEDqCIV9WE3EwNCC28XdHg/R3l?=
 =?us-ascii?Q?4655Y3jdWYa5CIqIPKZFof+OYzv/9LGbkhX9CZJ8WoiCWCDkD+3qcB1HwwSW?=
 =?us-ascii?Q?I74kgbMyzaMfGaze8yxP84i4MNvam+GAOo/Qtz3vBuYpoHTRZIEmFvJsricJ?=
 =?us-ascii?Q?L6a0meWiAletZavzcP7OQ+ws/van5ErMYXnmsm5p4+k2gODTYQkSocKh/XAS?=
 =?us-ascii?Q?SDia8SycAKJWUWtzXxHQeorFCa3D+DaOTzCnfG/W1oq1if90SBW0vHK/0Ugd?=
 =?us-ascii?Q?UsEpEiGAO+BV/jc1wmP/Nch7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368e0e30-408b-4021-bbd5-08d93d702e70
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:43:47.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTLJLOxLAs6MypF0OiruCVTVmPH5mTKZAGJps+/pNj1YbOJ0toTgslxbUYOQt/XygE1VLVS7WaWtLeylltsVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4972
Received-SPF: softfail client-ip=40.107.236.48;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 01:14:56PM +0800, zhenwei pi wrote:
> On 7/2/21 4:35 AM, Michael Roth wrote:
> > Quoting Igor Mammedov (2021-07-01 03:43:13)
> > > On Wed, 30 Jun 2021 14:18:09 -0500
> > > Michael Roth <michael.roth@amd.com> wrote:
> > > 
> > > > Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> > > > > * zhenwei pi (pizhenwei@bytedance.com) wrote:
> > > > > > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> > > > > > should not be changed to 0x1f in multi-dies case.
> > > > > > 
> > > > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> > > > > > for multi-dies PCMachine)
> > > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > > 
> > > > > (Copying in Babu)
> > > > > 
> > > > > Hmm I think you're right.  I've cc'd in Babu and Wei.
> > > > > 
> > > > > Eduardo: What do we need to do about compatibility, do we need to wire
> > > > > this to machine type or CPU version?
> > > > 
> > > > FWIW, there are some other CPUID entries like leaves 2 and 4 that are
> > > > also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
> > > > guests will result in failures when host SNP firmware checks the
> > > > hypervisor-provided CPUID values against the host-supported ones.
> > > > 
> > > > To address this we've been planning to add an 'amd-cpuid-only' property
> > > > to suppress them:
> > > > 
> > > >    https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
> > > > 
> > > > My thinking is this property should be off by default, and only defined
> > > > either via explicit command-line option, or via new CPU types. We're also
> > > > planning to add new CPU versions for EPYC* CPU types that set this
> > > > 'amd-cpuid-only' property by default:
> > > > 
> > > >    https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
> > > It look like having new cpu versions is enough to change behavior,
> > > maybe keep 'amd-cpuid-only' as internal field and not expose it to users
> > > as a property.
> > 
> > Hmm, I defined it as a property mainly to make use of
> > X86CPUVersionDefinition.props to create new versions of the CPU types
> > with those properties set.
> > 
> > There's a patch there that adds X86CPUVersionDefinition.cache_info so
> > that new cache definitions can be provided for new CPU versions. So
> > would you suggest a similar approach here, e.g. adding an
> > X86CPUVersionDefinition.amd_cpuid_only field that could be used directly
> > rather than going through X86CPUVersionDefinition.props?
> > 
> > There's also another new "amd-xsave" prop in that series that does something
> > similar to "amd-cpuid-only", so a little worried about tacking to much extra
> > into X86CPUVersionDefinition. But maybe that one could just be rolled into
> > "amd-cpuid-only" since it is basically fixing up xsave-related cpuid
> > entries for AMD...
> > 
> Hi, this patch wants to fix the issue:
> AMD CPU (Rome/Milan) should get the cpuid level 0x10, not 0x1F in the guest.
> If QEMU reports a 0x1F to guest, guest(Linux) would use leaf 0x1F instead of
> leaf 0xB to get extended topology:
> 
> https://github.com/torvalds/linux/blob/master/arch/x86/kernel/cpu/topology.c#L49
> 
> static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
> {
> 	if (c->cpuid_level >= 0x1f) {
> 		if (check_extended_topology_leaf(0x1f) == 0)
> 			return 0x1f;
> 	}
> 
> 	if (c->cpuid_level >= 0xb) {
> 		if (check_extended_topology_leaf(0xb) == 0)
> 			return 0xb;
> 	}
> 
> 	return -1;
> }
> 
> Because of the wrong cpuid level, the guest gets unexpected topology from
> leaf 0x1F.
> 
> I tested https://github.com/mdroth/qemu/commits/new-cpu-types-upstream, and
> it seems that these patches could not fix this issue.

Yes, I think your patch would still be needed. The question is whether it's
okay to change it for existing CPU types, e.g. EPYC-Milan, or only for new ones
when they set a certain flag/property, like the proposed "amd-cpuid-only" (which
the proposed EPYC-Milan-v2 would set).

> 
> > > 
> > > > So in general I think maybe this change should be similarly controlled by
> > > > this proposed 'amd-cpuid-only' property. Maybe for this particular case it's
> > > > okay to do it unconditionally, but it sounds bad to switch up the valid CPUID
> > > > range after a guest has already booted (which might happen with old->new
> > > > migration for instance), since it might continue treating values in the range
> > > > as valid afterward (but again, not sure that's the case here or not).
> > > > 
> > > > There's some other changes with the new CPU types that we're still
> > > > considering/testing internally, but should be able to post them in some form
> > > > next week.
> > > > 
> > > > -Mike
> > > > 
> > > > > 
> > > > > Dave
> > > > > > ---
> > > > > >   target/i386/cpu.c | 8 ++++++--
> > > > > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > > > > index a9fe1662d3..3934c559e4 100644
> > > > > > --- a/target/i386/cpu.c
> > > > > > +++ b/target/i386/cpu.c
> > > > > > @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
> > > > > >               }
> > > > > >           }
> > > > > > -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
> > > > > > -        if (env->nr_dies > 1) {
> > > > > > +        /*
> > > > > > +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> > > > > > +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
> > > > > > +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
> > > > > > +         */
> > > > > > +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
> > > > > >               x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> > > > > >           }
> > > > > > -- 
> > > > > > 2.25.1
> > > > > > 
> > > > > -- 
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > > 
> > > > 
> > > 
> > > 
> 
> -- 
> zhenwei pi
> 

