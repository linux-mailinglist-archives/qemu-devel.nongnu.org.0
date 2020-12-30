Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E12E7CAD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 22:30:34 +0100 (CET)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuj39-0001BS-NZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 16:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kuj1f-0000jr-S8
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 16:28:59 -0500
Received: from mail-bn7nam10on2124.outbound.protection.outlook.com
 ([40.107.92.124]:31169 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kuj1d-0001Xn-MY
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 16:28:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCaW0JiDKksPW6arhD7FkqLQtvWQzQT7lZABQIhxq9VIynPUnFxQqpW9H9iu51gUGm6mWSZc1zeURoVAH73LuorkAnROVr4acy6RBKEqF8+AwI9ECZ0jci4pLbpjpB4r95bZI+jwYnRGYe4tDlHWQcLag6kwEN58Z8Tbe+RdCiLEYvoHQUiBt/AccZpoKC8gxrgRQFjQn5WtDG7dnvVyE8kVgt/BzJ2SYu82g1NIYOdZ95bBbsRCzGw2mGJpJPHTgiPdiCadgVxosnHLG44Mes/ryQJ3yhsDBv8Do8NJgMiGQhBW/M9yvoyFrbIqDaCKaOL2rm+9WHVgVcE8ncqiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHBVYr6gJIbNEycFXIhv8P30UB4sh4lNQ0p3FhepMyc=;
 b=jc5fyTa+HWp18qd7GuG6TzjyvfEgyYwW3yLKiZlQJL8fX3l+wiIoLtPPP9SwHWS5VYbRI9a1rjAaOgKl98TPwcp0QNT/py3+gEVPoME40MPjIWWxNFAtRFAdf6ldxhwI+yAH1vJ5afPHf9uESZwGluH6ZwuglyK8qBoY5GnRDARsIDTZ9dLS1ljqSMQTiamIafEEIfuNXNDar44vgmj6xvKt6qIs5NdRPNQWbNmhMJq5amXscgWCc10gHQbFkDaN4uKO0YCzAMb+QWQwG8dZY3GUF7KsjK+IKJdVcMCiYEIkkJGSZP+VWtjgMgOoNJaqT9QW52kdeul54r+sZdlbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHBVYr6gJIbNEycFXIhv8P30UB4sh4lNQ0p3FhepMyc=;
 b=LrEaYstLK+iah9CY6ng9OKp+QHS7b6GZf6nHJxPf6r70WuExBjS8bCzahwPaz06nKW72yZARCYTCJkR5hAX/abXRNv4xZvW43lo+zWZs8fVSIsbPTDqXqi/uT4PT/0iqgUTvfpR1SDZ5TQSJU7631Xd3ghRMoAGrQLcs90MPFls=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA1PR01MB6768.prod.exchangelabs.com (2603:10b6:806:1a9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27; Wed, 30 Dec 2020 21:13:48 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9%5]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 21:13:48 +0000
Date: Wed, 30 Dec 2020 16:12:08 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: Plugin Register Accesses
Message-ID: <X+ztKGCrhUb5Rc3C@strawberry.localdomain>
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org>
 <X8+R05CCriFWT6G+@strawberry.localdomain>
 <871rg0gogo.fsf@linaro.org>
 <X8/XiLMe/a+L2v6p@strawberry.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X8/XiLMe/a+L2v6p@strawberry.localdomain>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:2d::42) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:2d::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Wed, 30 Dec 2020 21:13:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8d0873-d7dc-431a-02f2-08d8ad07cc83
X-MS-TrafficTypeDiagnostic: SA1PR01MB6768:
X-Microsoft-Antispam-PRVS: <SA1PR01MB67685F9A7A49E85102B560408AD70@SA1PR01MB6768.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5HcC6KosZTE1I4o+mni1obQ10qAD15tk5mikaqMvgcg0nZKyWqkf5qPNydzjlgvV/DND52tbe21Ae7zaUVqZsHzf/uZqx+QRK7bGuVmJvHuV85cql7aFYPtt3tJm08BNiYMCHUIgChhzFBdnXwkQ3Yhiu5j2XsU+w+H7ndvkT7rEk4/L5jFLjk260IBOSoqcAdn9bweQVAmesP1+DnsFFRKUkZ3/TxTIoJBJI/AOgDsKetjqP2Urt23QQnsv+735D6YV8Z+8/+Me2y8RzRcdHF1pdNw6CkRhNq06YtgSPBpRRoBWz7DWN87qIvLXkt3XfSfwfRfh/hO8CHgHu8KY3xQqSWtu43pBr0dfT8IrOTD9ObaOvXZ6+sYi+34qjQ+Iw5z1GfYiEDAo+dcBf+rR4hypaXh1Wyu8+Om3ULserLWWr0T0LYeMuUFbsEJAK/9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(956004)(66946007)(5660300002)(83380400001)(66574015)(26005)(66476007)(16526019)(6666004)(186003)(55016002)(9686003)(86362001)(8676002)(66556008)(6506007)(2906002)(6916009)(316002)(478600001)(3480700007)(52116002)(7696005)(7116003)(4326008)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?PDdFCequY2Cl/M5d3lR0zkUx/5WGmMQhurExmrYtQVJE59c3r2LArCsrq3?=
 =?iso-8859-1?Q?8ESkYJxWrQsh+GntfNOf8AGvLAEq4xawfEqEILwq1s2JlDFtPsG3HG/lMY?=
 =?iso-8859-1?Q?am5rqUJBLNTpbX9AzCaGSkoXiy4TJdkqPyFJPHBzUnu0FU//DQ3BHTPGew?=
 =?iso-8859-1?Q?gicHZ2r9iK4UhcwRjtiLFgR5Dq9z1UOFexLSBPAMc+Q383RRSjty2MOHn7?=
 =?iso-8859-1?Q?bFhLZ6SvN7Udh3EHKVlsDh6GaoHfWHP5XFLHg4T6QBRfO+/EEEolP/MqAl?=
 =?iso-8859-1?Q?bN9lfAKbw7mWJpFWMm5R1Nerj6cHsq+cY3IfrIJe9YfAjqikUTvlzgeS8P?=
 =?iso-8859-1?Q?fn1UK/XBUu1RyBGHN4GsSHuRUwlS/l9auZIfR4UY/xexFsM0WNCrptjZIf?=
 =?iso-8859-1?Q?q4NTHMpPBW/WGG+aaF9JSc5LZldZI/Iu75wOsoK+k8CaZu3Wyd/vkevjQT?=
 =?iso-8859-1?Q?zzZhyyD6M3zM1Vyt8FLc7sTjaXNER8SSNNgeEU6NBK056UgRhivrZNdd6H?=
 =?iso-8859-1?Q?VtA0Jbl5vo2gfQtGd67W+GXueHLuxdfLz5iMeknMG3NEV27cX/U0iS2JV2?=
 =?iso-8859-1?Q?rtGVC9FvN3ppuUnCvvV2rMlxA8WdnYxZs454VAZbJpe9DzEEjB2IcZCML2?=
 =?iso-8859-1?Q?NGA3ojxXwmulo5f4IN0S2gRVM3Lf2DwelLPheSzoroMwfub0JLfcN066qs?=
 =?iso-8859-1?Q?eJf1a9qqYYL3UsWKKHV7P37VxsRPATcowR/0e/8G43qLPVwvKM+3Y1qY7p?=
 =?iso-8859-1?Q?rJ01p9sjohm1NNyt08FrojouewFanfurKTIDB5hmFMjpY9w3EeSzkweh4z?=
 =?iso-8859-1?Q?kXMEsLgNMymwH67yyjdfePEmQ9LksEBK4SGXvyFIP6rZk7Ia40nsabyQE+?=
 =?iso-8859-1?Q?+UapGdu4mf3/GlbSva/lYcour4P5j06FM8Wg8tVhWMpfMAiwP0YqQw6O4S?=
 =?iso-8859-1?Q?0kP6VlHZnrE9mnv0YxgoWjBelSfjFMWjUW0rihEf2zZWQEVBhmlkUDZoNH?=
 =?iso-8859-1?Q?88q/mg7YsRKyAnzV+7OmWbQFrvsF53BMwPdzls?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 21:13:47.8910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d0873-d7dc-431a-02f2-08d8ad07cc83
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yf+06Uop5orPWMLR5JUSLAvH4O1ESYbmJ5MAbIvZTS0v7OUAF9/iL/DRiiEB/AYcnE6d0SE4NseQKXIwX5zy9gQ1/QOVD0uVz4XuvpLbEbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6768
Received-SPF: pass client-ip=40.107.92.124;
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Aaron Lindsay <aaron@os.amperecomputing.com>
From: Aaron Lindsay via <qemu-devel@nongnu.org>

On Dec 08 14:44, Aaron Lindsay wrote:
> On Dec 08 17:56, Alex Bennée wrote:
> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > On Dec 08 12:17, Alex Bennée wrote:
> > >> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > >>   Memory is a little trickier because you can't know at any point if a
> > >>   given virtual address is actually mapped to real memory. The safest way
> > >>   would be to extend the existing memory tracking code to save the values
> > >>   saved/loaded from a given address. However if you had register access
> > >>   you could probably achieve the same thing after the fact by examining
> > >>   the opcode and pulling the values from the registers.
> > >
> > > What if memory reads were requested by `qemu_plugin_hwaddr` instead of
> > > by virtual address? `qemu_plugin_get_hwaddr()` is already exposed, and I
> > > would expect being able to successfully get a `qemu_plugin_hwaddr` in a
> > > callback would mean it is currently mapped. Am I overlooking
> > > something?
> > 
> > We can't re-run the transaction - there may have been a change to the
> > memory layout that instruction caused (see tlb_plugin_lookup and the
> > interaction with io_writex).
> 
> To make sure I understand, your concern is that such a memory access
> would be made against the state from *after* the instruction's execution
> rather than before (and that my `qemu_plugin_hwaddr` would be a
> reference to before)?
> 
> > However I think we can expand the options for memory instrumentation
> > to cache the read or written value.
> 
> Would this include any non-software accesses as well (i.e. page table
> reads made by hardware on architectures which support doing so)? I
> suspect you're going to tell me that this is hard to do without exposing
> QEMU/TCG internals, but I'll ask anyway!
> 
> > > I think I might actually prefer a plugin memory access interface be in
> > > the physical address space - it seems like it might allow you to get
> > > more mileage out of one interface without having to support accesses by
> > > virtual and physical address separately.
> > >
> > > Or, even if that won't work for whatever reason, it seems reasonable for
> > > a plugin call accessing memory by virtual address to fail in the case
> > > where it's not mapped. As long as that failure case is well-documented
> > > and easy to distinguish from others within a plugin, why not?
> > 
> > Hmmm I'm not sure - I don't want to expose internal implementation
> > details to the plugins because we don't want plugins to rely on them.
> 
> Ohhh, was your "you can't know [...] mapped to real memory" discussing
> whether it was currently mapped on the *host*?
> 
> I assumed you were discussing whether it was mapped from the guest's
> point of view, and therefore expected that whether a guest VA was mapped
> was a function of the guest code being executed, and not of the TCG
> implementation. I confess I'm not that familiar with how QEMU handles
> memory internally.

I'm trying to understand the issue here a little more... does calling
`cpu_memory_rw_debug()` not work because it's not safe to call in a
plugin instruction-execution callback? Is there any way to make that
sort of arbitrary access to memory safely?

-Aaron

