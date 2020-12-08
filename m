Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318332D2D8A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:51:26 +0100 (CET)
Received: from localhost ([::1]:44106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeKq-0003FQ-Hu
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmeHP-00023N-7h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:47:52 -0500
Received: from mail-mw2nam12on2107.outbound.protection.outlook.com
 ([40.107.244.107]:10689 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmeHN-0006AY-Im
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:47:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPZJToRXjWcHoPTWnnAAp6+AE1IW8XiKW223OvZROov2+pvxTtIqhuHH/LYt2tGQiM+3qAASCdz9/L2zKS417FLcxTrUMcH80jkgSt6Bc0m4ekeNT2PHhASP0ALpJUtT6yn/JkuevmvKqYVdoxM/C8T//SWAMXPDVxyQq5J+i1QJGJraIlAYVONSHA9UZ7dG4saTXmLUchRIhRaHkj5D02ga+jl0b+5kfO/9RE6o/tU1F+qdkuiztZA1kvGi5EgmoR965XgakolpN6BiIucKhPATomC6uPF5290vv0C/rvoTt/Bdfs088CZlccpXxfc3SAIBgjVGINxqEzCZjsjlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PvU8yfSlF9Ib90ZQKPrLG1cqVDlSzFkQY4rju3coSw=;
 b=bpp8wEHOG9e4kLc+YZiSbYDyL3+1yyzo1C/9S0RL0mFGUeDUY3HSt6ZKC8RDVwq0mKlz5ht0WhmIdHrfeFnbO6nWqVM0Q5OU9z4wS7kg0NonXf+ZM54OcX3S2X+x/P93601ZxYSvWGVjrlTip0trJ1OMSujHPadarZotjm9n0nxkpq/u8BL07nVYTlmhOLyjKvZqWRPthzGYLaONdDpXj884N5PDlJQemuH18BusF89QB9bIdA+3qqPd2GXHn2T2Wph2MvXyTFHy1hJBZzmCFtdp5vTLf6lILwJQOoBjqxy9MX4+7MdSbwnRnNj7461JSXBBDD5Sn/jeQlQsL4PXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PvU8yfSlF9Ib90ZQKPrLG1cqVDlSzFkQY4rju3coSw=;
 b=AyMtEwCWeW9/ZRQM9eeVQjolF054RLC/Mk0DbhLWXaSs37lZrssSxZL6uHKCsZYfiyItxV8KjmAU8uVMyhoXcBkQ6hqaWc7RYWSqfFL4CdKIty2TZDN9nzdneHd7+4iWNFY+WGd08id9TCdE6muD3Jlps2v6EN/CI2Btp41aVKw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5005.prod.exchangelabs.com (2603:10b6:805:c1::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18; Tue, 8 Dec 2020 14:47:46 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 14:47:46 +0000
Date: Tue, 8 Dec 2020 09:46:43 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Register Accesses
Message-ID: <X8+R05CCriFWT6G+@strawberry.localdomain>
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6uoh2fp.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::15) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0100.namprd13.prod.outlook.com (2603:10b6:208:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.16 via Frontend
 Transport; Tue, 8 Dec 2020 14:47:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66c9b407-18c9-48c1-34d9-08d89b8839e1
X-MS-TrafficTypeDiagnostic: SN6PR01MB5005:
X-Microsoft-Antispam-PRVS: <SN6PR01MB5005F5DD21E4F55A786A32678ACD0@SN6PR01MB5005.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UKY6G4E+VOTfQThqNKOr0Jr6WbhMtYEoAG6L4oR5gTLp83rBdF+NCzYLK9clITh278udGFUhKn9yTLOVwtxRm0cn0BaycaS0sMWRYnXabkFc7DkgIZCj5sKw+j4A1HLB8BE1cmANFsZ+xCYC8A9JIrXSdGpQPpcSgihDhZ2eJw1CF6ZZRR+PoWID2R8gnHyod2iPhm8yoCIjJaeevDFJwUhJtJOrNTmnkWwBzppxWx2sJHZ9c1kzzCu2gGlfGwb/0R7EA8JTlOINP5ZTTcl/BIb9awEbJDs19NXIgyPafaDop7ZX3bcI2BkY2CsyQsddjF0lLDBJ8ZEzFnURTDNqbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(26005)(4326008)(316002)(3480700007)(7696005)(52116002)(6916009)(478600001)(9686003)(8676002)(55016002)(83380400001)(66556008)(66946007)(66574015)(5660300002)(2906002)(8936002)(956004)(186003)(16526019)(86362001)(66476007)(7116003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?p5wfTLWP44iTCrZMknu0R0pP4KDO85wyQDu4x0w22kArmstuy76tOeFIi8?=
 =?iso-8859-1?Q?AHk9FACGbhIe6nlA1inDTVxAnxnJmqXCj340PQcU50q/R23Q0zpcZwO8QY?=
 =?iso-8859-1?Q?E65tOmLPKvvWYiI0U+BmmDFRkOOQmAJoR0yB0i67Quw0Ak7HNQZ5UH+fyH?=
 =?iso-8859-1?Q?a3q4sq0HmiegzQ+uQgg8B12KcTkqmd1nVyW7tRaE1UJT63F8PQIwfyd8j9?=
 =?iso-8859-1?Q?BGYNoO46sQ4uKbEWNrZdZ8en4W5tesw3lUR5qGreeSlJyXxNsbZRCafa6q?=
 =?iso-8859-1?Q?X4wB9knywiZeIqnoBCsvjTyiMu7rfX3sZ3qZL3gaM1knfJ5oM7yO88u90m?=
 =?iso-8859-1?Q?cJGHm60rvEvF8PvsL3xlHvmEsRHXr/DLgqB7X1r2Ovg9y9Ie4/zeKJVN1Z?=
 =?iso-8859-1?Q?VVzUGS9kvDu06A3TfvQeFce9w5aUCKFGV7aLo0NVw9CL71wbWBegG2T/Rt?=
 =?iso-8859-1?Q?zWaO/d/ocJpnJ76IKPItb/7z8wSwCwK2OQ63zZFqvFvdbrgBMccv3luEX+?=
 =?iso-8859-1?Q?cQq+Lo6NZrVSNUzpPq2dJIUUOayJE/0Q8hWiYPAgWon+3q3XFA5YWNdhKT?=
 =?iso-8859-1?Q?iJTwNpWg1Q6jQeZ1ulbz0eU0JbrJObnjZgPcp40dWaJu/ezi1syg3K3KAk?=
 =?iso-8859-1?Q?lVirXqFL3utfZMuduWGCGdBZGohYNOlrZrq1x1JrBqC5SUBZ7lwASPAm8r?=
 =?iso-8859-1?Q?RM3IwPbM3SBIrMAMVAw3YSScC7rZgm6+htro59FgjxIApXCKPlVMcXsxcw?=
 =?iso-8859-1?Q?2ssuNd8v3dPWs6UkL3GFffNCkZXBKAGsZuBVdzSpwRqaVdq4tMkJ+zjYAh?=
 =?iso-8859-1?Q?MeuXCr61CfaC6S1xHxA47H7PXlPyVGz6faKdBQt2ELIC5b7owd6UOatTzg?=
 =?iso-8859-1?Q?yD5Qisc9JSovVclaGl1YGKwP3jSX3+CoL7TOFDo5ipzMc1dJAIoCQMWe65?=
 =?iso-8859-1?Q?7EvSFeVcULw9jdDOcndfLZ2p2NGMx8lpcKZuj0plAYhwWtRqQDgoePsGTP?=
 =?iso-8859-1?Q?4OV3rLbN8F778F0UdQ9c/Rf56gU6TzMX+RoLCq?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 14:47:46.0513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c9b407-18c9-48c1-34d9-08d89b8839e1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQm5ukqx3dtLLbReEmGCmE99g1vfWTYSeVFUfpfa8T1fmHUac/rD1N2bKJshwayQyhnYEl/LOJ7qAgmb+rQU3aAplQC7uWnvUAJ/ourAzw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5005
Received-SPF: pass client-ip=40.107.244.107;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Aaron Lindsay <aaron@os.amperecomputing.com>
From: Aaron Lindsay via <qemu-devel@nongnu.org>

On Dec 08 12:17, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > I'm trying to migrate to using the new plugin interface. I see the
> > following in include/qemu/qemu-plugin.h:
> >
> >> enum qemu_plugin_cb_flags {
> >>     QEMU_PLUGIN_CB_NO_REGS, /* callback does not access the CPU's regs */
> >>     QEMU_PLUGIN_CB_R_REGS,  /* callback reads the CPU's regs */
> >>     QEMU_PLUGIN_CB_RW_REGS, /* callback reads and writes the CPU's regs */
> >> };
> >
> > But I don't see a way to access registers in callbacks. Am I missing
> > something?
> 
> No - while those symbols do inform the TCG to not try and optimise
> the register file we don't yet have an API for the plugins for reading
> (or writing) the CPU registers.
> 
> There has been discussion about this before, I'll quote what I said
> off-list to someone else who asked:
> 
>   > Has there been any clarification or softening of the position that 
>   > exposing register and memory contents to the QEMU plugin would provide a 
>   > way to circumvent the GPL of QEMU?
> 
>   I don't think implementing read only access would be a problem and
>   should probably be a first step anyway.

That seems reasonable to me. For the time being, at least, I am most
interested in read-only access.

>   For registers I think there needs to be some re-factoring of QEMU's
>   internals to do it cleanly. Currently we have each front-end providing
>   hooks to the gdbstub as well as building up their own regid and xml to
>   be consumed by it. We probably want a architectural neutral central
>   repository that the front ends can register their registers (sic) and
>   helpers with. This would then provide hooks for gdbstub to cleanly
>   generate XML as well as an interface point for the plugin infrastructure
>   (and probably whatever the HMP uses as well).

In a previous incarnation, I was proxying calls to the plugin API
directly through to gdb_read_register() in gdbstub.c and therefore using
gdb as the point of commonality. I'm not saying it's ideal but... it
works? One downside is that you have to know 'out-of-band' which integer
value corresponds to the register you want to query for your
architecture, though it hasn't been a significant issue for me.

>   Memory is a little trickier because you can't know at any point if a
>   given virtual address is actually mapped to real memory. The safest way
>   would be to extend the existing memory tracking code to save the values
>   saved/loaded from a given address. However if you had register access
>   you could probably achieve the same thing after the fact by examining
>   the opcode and pulling the values from the registers.

What if memory reads were requested by `qemu_plugin_hwaddr` instead of
by virtual address? `qemu_plugin_get_hwaddr()` is already exposed, and I
would expect being able to successfully get a `qemu_plugin_hwaddr` in a
callback would mean it is currently mapped. Am I overlooking something?

I think I might actually prefer a plugin memory access interface be in
the physical address space - it seems like it might allow you to get
more mileage out of one interface without having to support accesses by
virtual and physical address separately.

Or, even if that won't work for whatever reason, it seems reasonable for
a plugin call accessing memory by virtual address to fail in the case
where it's not mapped. As long as that failure case is well-documented
and easy to distinguish from others within a plugin, why not?

-Aaron

