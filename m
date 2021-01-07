Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40F2EE75C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:03:37 +0100 (CET)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcRU-0008UM-5c
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kxcQC-0007YC-M2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:02:16 -0500
Received: from mail-dm6nam11on2129.outbound.protection.outlook.com
 ([40.107.223.129]:21248 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kxcQA-0000V7-HM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:02:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYcqSUnd0uWmQOWr7DJKTkL588DmcI2jGwh3t6+wl07D8FIyCqb1nAxjDm+RnwFAlNN+RfXJa0gpcXqBtGGSrtwMBtWIffv65QB+4bno7+DZAgGKo95B4f+8HS4Z9kCBf0VY/A5g7LU1qq466tW0XNdsBfz5IRqVqz2d3sTHfULJogQyb7Cx6AW5E9u+c2r3JCLA8IDbj/MAorfXDxYItd6jPfU8guzDgJcSBAW1elbPKsm/BvNIdAQgnekUhy7YpodQZw0Zngo6kQuLJKa+SaXze2vTNue1+hN0Z45VeK6b2fz/e8EFl/Nfo2+P2HpgbIiUGuxuVXwxs9SBfXjPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wB+iqVkVfuPHhskloIrhIy6EagNgVwluHg2q/Uoct4=;
 b=CH3/Xispuet4+O9GYRbSmfotIZtv7Zh90/yLIpmX1LnT7dLI3EjPqJlXpH4WD1zetEsPuHn+djxSfGZCcht6hfy/5SssHfLy6VBMVQAULL5golQEuxAkBwbF+tvm0Mu4yb1pZdf/zimO/m0y12ipKpjuogp5KRpI9E5tNXl3wiglkIvSSjoeyta3e+73KRF9vf+DjV1DTdTg0fAKnZKuTHBhCuMLfRdPSrlaWZ4HNPKmKWY0bMBdjK+FBPS2rvu3PM9Hxz5QFlEX2VCcC3yAZHG63Kx8P+k5OARVjomoZd+asfLc53QdZfr7uWKTwvEIALIW9t7BmxvD/T3szbC5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wB+iqVkVfuPHhskloIrhIy6EagNgVwluHg2q/Uoct4=;
 b=NZwKIOAtbQRehPd98FSyuKfoJsutGqbPeqPcIlb+dr9//simsBce4FiD1UlaLuJqAuVKns7/+0QIgSsEvtKf65ngwQa4wAZXaDK480WbzID9jKaa/N7c+VIjEeNWci52TN5WjiGjSR3QZE2tbq6YE0543SJxCxBu5GwWJ50DbbA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3664.prod.exchangelabs.com (2603:10b6:805:18::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Thu, 7 Jan 2021 20:47:09 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 20:47:09 +0000
Date: Thu, 7 Jan 2021 15:45:15 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: Plugin Register Accesses
Message-ID: <X/dy2/e771Ndl4uF@strawberry.localdomain>
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org>
 <X8+R05CCriFWT6G+@strawberry.localdomain>
 <871rg0gogo.fsf@linaro.org>
 <X8/XiLMe/a+L2v6p@strawberry.localdomain>
 <X+ztKGCrhUb5Rc3C@strawberry.localdomain>
 <87ble01xj8.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ble01xj8.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:208:23c::19) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:208:23c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 20:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85fff42e-c1fb-48ba-2a61-08d8b34d66cc
X-MS-TrafficTypeDiagnostic: SN6PR01MB3664:
X-Microsoft-Antispam-PRVS: <SN6PR01MB36647BD68836F98BC36DCE118AAF0@SN6PR01MB3664.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITwIMA+5mfElsoEhK9qpluVEg4yistyQp6BAMKHYQ0Dk+hPcpxozq6N/jdJIqArLMxdVRyBHIwDNooxNOBTvlLWE8QH+OFWqaN4jL2SHh4LejA43ghZ3FGLMENmZh8HByekF2InqjGuMzDIA9sEAdu+K06nrkbJam56JeeeVL8wcY/qPzku24Dd9JouGAcHboGoD1TQJ/1sHyLvg81DW7Sfe3noxRDWvonMSDcMfHhyEQq/TIpJZLWbeSsHfO6xhX5sFIP2QaaZEuWk1gBw03gQs9W6aHI9548qFunwHck9jeRWDAvnafGrPXNUPkmEyRkD7jy5bnhVJWOxFRR/ySgwUnFjcvS0orTrqIylZ9mRVbf0pSiNB1aol2/Ay31rBhaY6DNKAVqJDfyzctToCzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(66476007)(316002)(66946007)(6916009)(66556008)(6666004)(186003)(66574015)(26005)(83380400001)(52116002)(55016002)(9686003)(3480700007)(86362001)(2906002)(6506007)(16526019)(4326008)(8936002)(8676002)(7696005)(956004)(7116003)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?P2EoX3PpyLn+4L8SUiKUojSDpLCBIbbt7FPipg0vUETn80q84vNtHzIErA?=
 =?iso-8859-1?Q?yTt8Wf+UsaXDswSpUvbPBF9F8UQKLwxPjI4UjRRmnTGamT6dxz9Jiieio6?=
 =?iso-8859-1?Q?GFUQUNZwfuSnDygXTF/tJ5VbRPPDkB9SaUgu/JeAsBLlreJRs6MVfwDu8a?=
 =?iso-8859-1?Q?g+wT27k2Wwd2Gic6kOXAbGz8BVyCLIm0jhdIOpT/inCCxwKHArKSSvD8BQ?=
 =?iso-8859-1?Q?3uepuMiBT4FCsm6YBWrdxSE91IN2E+yZ9Es50g1DTXJBpKTzlcQzBrPM+A?=
 =?iso-8859-1?Q?0BeA9G0e2nS/hF1tpDnIGfkML/pN5Wg7FI6aqTaTe7XRB5wNlsz/MTYrfv?=
 =?iso-8859-1?Q?k88d8YKhsShv9sVb1MJ8cfJ/fZt4+iMMXi7byi/XnOLGwidKYEgAzflueB?=
 =?iso-8859-1?Q?Hizcygt+RfYpAgQJWs+PnFBy9PoMDQU1Nk+v45d4OFKfKFFqrbxkCdUYGb?=
 =?iso-8859-1?Q?4ItrpVY7by/DlsmuW3lcRQ7Emkr5ICgbe20TW4xMExwndZ+1nlq+WRvmjd?=
 =?iso-8859-1?Q?McxghTmQsU00INjyFlVS5kUI/yKnZCY3Ie4ftW+diGy33mLpUshdLqBPtn?=
 =?iso-8859-1?Q?qB02X8nyBMYCvsR+JEzepwkB4X7HPEWJhXLrIfG+cQe2ASNV/SbHEkYcK0?=
 =?iso-8859-1?Q?J0UBteR4/zpnhntXKFnIhTuN7FVxlq0aiYfnq8tLALxlSoMlouj3gj4sqN?=
 =?iso-8859-1?Q?Z2IjHsH9BGih/ny+L/UDm8Dzo0yazRf6Wl+CClxlNJNIdS4MS8u0PMjc7h?=
 =?iso-8859-1?Q?DsgikT4o7QHQpMRhWw69B3v4zvtxiIOahyvH1yOTFBodDsE2XuZFwx21zT?=
 =?iso-8859-1?Q?eSvdsXP4eS6bcNrBlymOCAiIoWbxDR9tNo9XX7QXB5IWLlE33MkFIHBet7?=
 =?iso-8859-1?Q?vdQyBjLcujojm6mSAUU8lcmfra5I5KAQcGAL7hxltvakTh2iz9Mk5eyREm?=
 =?iso-8859-1?Q?upFtEyGAWd2vm4M3gZrMfkGM42Sp1Ht9riU016cQWsQvBdF7M3LOlXZZQ3?=
 =?iso-8859-1?Q?3424I3oyCjrgY/sjiIFBCkt94PbuIGUn7mxJK1?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 20:47:09.0055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fff42e-c1fb-48ba-2a61-08d8b34d66cc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBgRlF0VVSauYWeiEh5+PgVgY8oszI5/hymMYYrneOdWqiAgX2z4vw5m02E/hr3wYv0I18BbnMFMzD7j2II5n4ebogajui4c613ViIh8I0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3664
Received-SPF: pass client-ip=40.107.223.129;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Aaron Lindsay <aaron@os.amperecomputing.com>
From: Aaron Lindsay via <qemu-devel@nongnu.org>

On Jan 07 16:49, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > On Dec 08 14:44, Aaron Lindsay wrote:
> >> On Dec 08 17:56, Alex Bennée wrote:
> >> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >> > > On Dec 08 12:17, Alex Bennée wrote:
> >> > >> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >> > >>   Memory is a little trickier because you can't know at any point if a
> >> > >>   given virtual address is actually mapped to real memory. The safest way
> >> > >>   would be to extend the existing memory tracking code to save the values
> >> > >>   saved/loaded from a given address. However if you had register access
> >> > >>   you could probably achieve the same thing after the fact by examining
> >> > >>   the opcode and pulling the values from the registers.
> >> > >
> >> > > What if memory reads were requested by `qemu_plugin_hwaddr` instead of
> >> > > by virtual address? `qemu_plugin_get_hwaddr()` is already exposed, and I
> >> > > would expect being able to successfully get a `qemu_plugin_hwaddr` in a
> >> > > callback would mean it is currently mapped. Am I overlooking
> >> > > something?
> >> > 
> >> > We can't re-run the transaction - there may have been a change to the
> >> > memory layout that instruction caused (see tlb_plugin_lookup and the
> >> > interaction with io_writex).
> >> 
> >> To make sure I understand, your concern is that such a memory access
> >> would be made against the state from *after* the instruction's execution
> >> rather than before (and that my `qemu_plugin_hwaddr` would be a
> >> reference to before)?
> >> 
> >> > However I think we can expand the options for memory instrumentation
> >> > to cache the read or written value.
> >> 
> >> Would this include any non-software accesses as well (i.e. page table
> >> reads made by hardware on architectures which support doing so)? I
> >> suspect you're going to tell me that this is hard to do without exposing
> >> QEMU/TCG internals, but I'll ask anyway!
> >> 
> >> > > I think I might actually prefer a plugin memory access interface be in
> >> > > the physical address space - it seems like it might allow you to get
> >> > > more mileage out of one interface without having to support accesses by
> >> > > virtual and physical address separately.
> >> > >
> >> > > Or, even if that won't work for whatever reason, it seems reasonable for
> >> > > a plugin call accessing memory by virtual address to fail in the case
> >> > > where it's not mapped. As long as that failure case is well-documented
> >> > > and easy to distinguish from others within a plugin, why not?
> >> > 
> >> > Hmmm I'm not sure - I don't want to expose internal implementation
> >> > details to the plugins because we don't want plugins to rely on them.
> >> 
> >> Ohhh, was your "you can't know [...] mapped to real memory" discussing
> >> whether it was currently mapped on the *host*?
> >> 
> >> I assumed you were discussing whether it was mapped from the guest's
> >> point of view, and therefore expected that whether a guest VA was mapped
> >> was a function of the guest code being executed, and not of the TCG
> >> implementation. I confess I'm not that familiar with how QEMU handles
> >> memory internally.
> >
> > I'm trying to understand the issue here a little more... does calling
> > `cpu_memory_rw_debug()` not work because it's not safe to call in a
> > plugin instruction-execution callback? Is there any way to make that
> > sort of arbitrary access to memory safely?
> 
> It would be safe on a halted system. However you might not get the same
> data back as the load/store instruction just executed if the execution
> of the instruction caused a change in the page table mappings. For
> example on ARM M-profile writing to the mmio MPU control registers will
> flush the current address mappings. For example:
> 
>   1. access page X
>   2. update architecture page tables for page X -> Y
>   3. write to MPU control register, trigger tlb_flush
>   4. access page X from plugin -> get Y results
> 
> IOW accessing cpu_memory_rw_debug from a instrumented load/store helper
> for the address just accessed would be fine for that particular address
> because nothing will replace the TLB entry while in the helper. However
> as a generalised access to memory things may have changed.

To make sure I understand - are you saying that calling
`cpu_memory_rw_debug()` will always reflect a consistent view of memory,
just that it's the view of memory from *after* the current instruction
has executed (and with contents potentially modified by other cpus in
the meantime)?

> I think we can store enough data for a helper like:
> 
>   qemu_plugin_hwaddr_get_value(const struct qemu_plugin_hwaddr *haddr)
> 
> but we would certainly want to cache the values io_readx and io_writex
> use as they will otherwise be lost into the depths of the emulation.

I think this would be helpful, but it wouldn't get you to arbitrary
access of memory, correct? (Since you wouldn't be able to create an
qemu_plugin_hwaddr for an arbitrary, non-instrumented, address you
wanted to inspect).

-Aaron

