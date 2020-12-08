Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE72D3407
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:41:37 +0100 (CET)
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjnk-0006dM-Cb
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmivE-0006OE-Mr
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:45:17 -0500
Received: from mail-bn7nam10on2099.outbound.protection.outlook.com
 ([40.107.92.99]:40832 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmivC-0008Ev-OP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:45:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUKC5ICH57qsDOGyOkLkqjXvZCpArP4cjQNknA4oh5urg+YCRojwbfE9rP5+QiWPVzE7OklF1O99LwLwMzrxfoZJzDUHpf9My23jWi5FWrJIXrmjmkG7qNeTEHRQz0WYsyi/nRpTJezzJE3Ii0UuRTE1k6kjA/yPA05c31QK00pyPqMDZNo7D/PvI3k3dMOP5qk+uedsRnKLVA8+4WbY6q+VAWDU1ZE3ulzo/ajksp3XI4mox0GQ9lODIomI3rf3juB3cEU1isGfhmImjb6C5k+sdbKY6tkoaliHrXAf5d8LhDdfACCeugLyEwupl6PNzwBtFzGnMEFZF9n7Z2Xg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3nEtOQTeOsY2+Wlg8hl4UWqaf+gJ4Iw0fXzD4oAPAg=;
 b=JDe+CZSlc8FnxjFwmdkdLMdKeo815UXLBrvG2O87Yq7raDf1sUNgtmt6YOz29D8jPbSM/PUtNrBZowGS35T6pEIzccN8d5O1JfRwkKAf1C9d2nNRR1XgNhnAFplOtiaCTR1hddmysTNGXYrK3TAP+9HR62ujb5NYvitWQef37A2Tva8yeEC9wExyMn6C371DvHRAxpdncy8oLMWWRSTiR5HyGU+Iz98BoHbKo81ZEiLBIlNgQTvgNCgipKD4pIp1IUnDe3R5claYE4Ap6rWzGU/kLhBUtVWyByEehoqjHRewR4G838xPyefmCIPVqj64YmFeog3hiDSmiATO8lVYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3nEtOQTeOsY2+Wlg8hl4UWqaf+gJ4Iw0fXzD4oAPAg=;
 b=JSUOMb9f0WghT/OZ8XN8h9wJlTpH6rnVMLWVzXOY2ZBCkwykp13IPXPIxphoML46nQOhWEZkt57yR/w1kuVtAU2Lhre1Xs2w/6gGUNjJ58wi356qoTg+zxvvX/jwlnhKx4zqb3UvNRrwgnDdJ04vgzHUykDO051w0EIIRihj904=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4399.prod.exchangelabs.com (2603:10b6:805:f0::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Tue, 8 Dec 2020 19:45:11 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 19:45:11 +0000
Date: Tue, 8 Dec 2020 14:44:08 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Register Accesses
Message-ID: <X8/XiLMe/a+L2v6p@strawberry.localdomain>
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org>
 <X8+R05CCriFWT6G+@strawberry.localdomain>
 <871rg0gogo.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871rg0gogo.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:fc::19) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR02CA0006.namprd02.prod.outlook.com (2603:10b6:208:fc::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 19:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1f90a4e-00ea-4c22-7743-08d89bb1c697
X-MS-TrafficTypeDiagnostic: SN6PR01MB4399:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4399AB037E1B6FBAE350AE558ACD0@SN6PR01MB4399.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AGTmVl/5eP+szHVq5Aa/bBT3Qi5tzGqtbrnXl4jK3x4Y2/uYHmAnEWOt1w68WsI6S8A51tpaoeto01no1465MjaqXhQZZ438m4qucAzAlXFjY3PnSV13FqcAFJ5beE/BRkrGjm2jKM5norwvEDqDe+USSi5ZNss28I596n6S3TgEdEwEzx3dIq7mqUDZN5kzUdJwdr1TZvmNcf/4fZNfa/3Khs2RFsQDXjuCud0nVNLzSRiMV/kznyDDhQMf00nlziQyNVvt+kvPsr+O4MvlUX2b6UDfu2ObAC730MJGqauqHrRcXyBlqNQGQwDCw+HssLa0I8BKrwSFZsODlKT3wQpkhT+31EC0N7r0i+sXp9bQylfq+fAAuLXiF0j+yt6I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(3480700007)(4326008)(7696005)(66946007)(66574015)(52116002)(8936002)(66556008)(2906002)(9686003)(956004)(6916009)(16526019)(7116003)(55016002)(6506007)(83380400001)(86362001)(508600001)(34490700003)(26005)(66476007)(5660300002)(186003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?M+mT2uZd6CKpWo6lYvS7WsWcypohsFCZUPL1mozbUXTZpe2ODXtQCDteJT?=
 =?iso-8859-1?Q?2JtMW0tF1PDOiXMHRKXIm3mrtz4GCMLFfXiofJ3g4mpVwjpJB11MIRP8s0?=
 =?iso-8859-1?Q?tavv6madI5tZCqPu9Q8xkB5ez91kfFIN2T1vqZ/Q3hId0LQ5Q3YwObhMFH?=
 =?iso-8859-1?Q?acri0f/jtXuS/NKJwwNyNoiclBX1LJEHG8frjaC+Xk5uyfq8j0jiVq4ePp?=
 =?iso-8859-1?Q?wr88Fj497uNYzr1nqON1IT8GmrE6F4nfnS4cLgJpVrD1CQknDJsuylNunY?=
 =?iso-8859-1?Q?q5w/+wxVSIMm9INsAALTUsqYLDk0aHGLd3GwFr8U+ehWs1fPikjS8M41KX?=
 =?iso-8859-1?Q?RQyHIPa1z1UdDEUhWMNeHL8MFiC0g4+Cu2d2dyJtk7UYu5yNFNgdHpJ9aL?=
 =?iso-8859-1?Q?H4zVnpAwt4O9Kvbk6SnK79UyA4HmwKv7jT5TTsrS1jkhRNMXmkBcEZ8pD/?=
 =?iso-8859-1?Q?/omuCgdzIYw/m9Wqs0cEo3pNMKbD0L1xsd07tpUBkSdu3X5P9J16hMN/k+?=
 =?iso-8859-1?Q?dS7U1uQwZ0VBVTQN3NZt97S6Pm1/QSwaUSFiqsKwN7vQ0w5SZxzjkuuHEN?=
 =?iso-8859-1?Q?CiSKNSqH4jdow/KEowBX1fKTEPMYzAluSHkQFSZN0D2GM2CDQaDw7jK2hz?=
 =?iso-8859-1?Q?ItCuHVpHcPXWgtWvdoxBWigUoCqFpTk4lAm0eI7aYoSC7kq+8iijB+VZcL?=
 =?iso-8859-1?Q?sqe0eFh4GlwG6AFlHWFgF/uxNyKL8iPhudFweWsVyEEPF9d2svzqAOlFxM?=
 =?iso-8859-1?Q?NzOextT0DG7tOv+FK9l60pGdlz4TpoDSDn9PZFlmN7f5behbU1pJqpa1B0?=
 =?iso-8859-1?Q?pE+KGAuixWzLQwx/Wgl/qZ54zxkfqk+1OhB2m6AS3kCwCP8wTOIyTaTFbO?=
 =?iso-8859-1?Q?0Pi46UK1UH6ruBuA7NDChNoLK+TDUznaAI/r2vk+WtDLxPKgEdaNj2D7Vb?=
 =?iso-8859-1?Q?chGlKN8bUjBallAaXrvqgADYWDb3oND/U8qzjW4yUZXCn+0ZhoN/oC5t64?=
 =?iso-8859-1?Q?EoyBGGaSVSt9Gv8OpKF83cTl1bVXiZFmDn1evL?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 19:45:11.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f90a4e-00ea-4c22-7743-08d89bb1c697
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDl3OSRBXAZ+Quujb2R/Nfj2wy20Z0n4QHI6AznExwEsK4sttq+47TJ1sBA00Xo/+bpKHdq/zj7+JFR4FBkqecyfnWEuLkE5JF+Tq25xaD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4399
Received-SPF: pass client-ip=40.107.92.99;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Dec 08 17:56, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Dec 08 12:17, Alex Bennée wrote:
> >> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >>   Memory is a little trickier because you can't know at any point if a
> >>   given virtual address is actually mapped to real memory. The safest way
> >>   would be to extend the existing memory tracking code to save the values
> >>   saved/loaded from a given address. However if you had register access
> >>   you could probably achieve the same thing after the fact by examining
> >>   the opcode and pulling the values from the registers.
> >
> > What if memory reads were requested by `qemu_plugin_hwaddr` instead of
> > by virtual address? `qemu_plugin_get_hwaddr()` is already exposed, and I
> > would expect being able to successfully get a `qemu_plugin_hwaddr` in a
> > callback would mean it is currently mapped. Am I overlooking
> > something?
> 
> We can't re-run the transaction - there may have been a change to the
> memory layout that instruction caused (see tlb_plugin_lookup and the
> interaction with io_writex).

To make sure I understand, your concern is that such a memory access
would be made against the state from *after* the instruction's execution
rather than before (and that my `qemu_plugin_hwaddr` would be a
reference to before)?

> However I think we can expand the options for memory instrumentation
> to cache the read or written value.

Would this include any non-software accesses as well (i.e. page table
reads made by hardware on architectures which support doing so)? I
suspect you're going to tell me that this is hard to do without exposing
QEMU/TCG internals, but I'll ask anyway!

> > I think I might actually prefer a plugin memory access interface be in
> > the physical address space - it seems like it might allow you to get
> > more mileage out of one interface without having to support accesses by
> > virtual and physical address separately.
> >
> > Or, even if that won't work for whatever reason, it seems reasonable for
> > a plugin call accessing memory by virtual address to fail in the case
> > where it's not mapped. As long as that failure case is well-documented
> > and easy to distinguish from others within a plugin, why not?
> 
> Hmmm I'm not sure - I don't want to expose internal implementation
> details to the plugins because we don't want plugins to rely on them.

Ohhh, was your "you can't know [...] mapped to real memory" discussing
whether it was currently mapped on the *host*?

I assumed you were discussing whether it was mapped from the guest's
point of view, and therefore expected that whether a guest VA was mapped
was a function of the guest code being executed, and not of the TCG
implementation. I confess I'm not that familiar with how QEMU handles
memory internally.

-Aaron

