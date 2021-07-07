Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD643BE73A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:38:11 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15sY-0004k2-EU
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m15pt-0003CA-9t
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:35:26 -0400
Received: from mail-dm6nam12on2121.outbound.protection.outlook.com
 ([40.107.243.121]:17856 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m15pq-0006Uz-It
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:35:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsK4Y6+F7I/lrWHM1VCJ3X6yKUvFJBlqEybhsqcO/RpGzCsG7s1pPW6ecLAZ+/pmRQwS7A5v0km+kWm6dX7eaL4OQeEflBbkqKIcgZn2j7UBFH0wM20SupR/vyoO++mkP/J21WCsSgIsg2/zRXmcKbP6SVdtgIzdYIzNc9QoosS+hSsmSKICIaQ9k12dube8YZH303suy5/pT0IFlrnf3yURgmQZGND7xHgEeddHMQGTFGZDSbH5pMvWzBB5ilfrtLLLGc6HB4yifgBJparCy3ddrfj/uh6jYvINQ7StI3zt9ORZXaQJ8REJMlc1ifdesGRWZTM6iY/LAjIwWXiSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2I3x8tJt6OFyXOLDtTATibqNhe87eiP1fJPMcNXBa9M=;
 b=bWiRl4iYfq9NxVzot3nBa1NMoOEQ+7b7GjUES2IHVK91lzCnWZMXc77QW+IKReGENYI/FJ0CAfFX1AqEqlzo3qcpXfVgc8QbZCJyxMl6e4045HnQOmbZ7DqSSxAn2xrq6gTDbycQ9NPo7ag9n1YlzypxbNOTOZ4v2q6KQj9tqJwDR8Z3GnMT11lSZvMxC2SsmiMWRn13v9ROBmQa/f6phSI3NrJ3iXf21qBT6B2QPlxu/Z0AHFadspvtONOrqFA5cqSREtvAplQN4J5Nz0Z6L9qinR71EKjYIiGkg14w+p3VB9IrzhQxkh3THzj/m1JNseCIRlNemPUpea2RAMPj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2I3x8tJt6OFyXOLDtTATibqNhe87eiP1fJPMcNXBa9M=;
 b=BeJpIo1hQY+GCg3P88qnseNqoeD05f9zsGEeZsHTpUvLemQm2uGtDQeMV9jy0B3y06C3G+3DD+RbDlI8QDIGPVxvpVOyPypLRODQ/MS9j3cMI+7XyCg0rp55D1dcoBXnIEhEJWzlJMRk11SiDRr/KgzQ1GUROgyxY2nA80Dz3e4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5277.prod.exchangelabs.com (2603:10b6:805:cb::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.33; Wed, 7 Jul 2021 11:35:20 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8%6]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 11:35:20 +0000
Date: Wed, 7 Jul 2021 07:35:14 -0400
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 cota@braap.org, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: Plugin virtual-to-physical translation incorrect for some IO
 accesses
Message-ID: <YOWRcuUSfKaMKdza@okra.localdomain>
References: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
 <c3c2440e-bd91-1671-f9dd-e297f90d01ab@redhat.com>
 <YOTRmAqH2dn+C87T@strawberry.localdomain>
 <7bfcc4c0-bba6-d3cf-1d39-aebca1655078@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bfcc4c0-bba6-d3cf-1d39-aebca1655078@redhat.com>
X-ClientProxiedBy: MN2PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:208:23d::6) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from okra.localdomain (2600:3c03::f03c:91ff:febb:cdda) by
 MN2PR06CA0001.namprd06.prod.outlook.com (2603:10b6:208:23d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 11:35:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c0a6d4d-6d39-4bd5-faaa-08d9413b4cdc
X-MS-TrafficTypeDiagnostic: SN6PR01MB5277:
X-Microsoft-Antispam-PRVS: <SN6PR01MB527765C8F351372014742DAC8A1A9@SN6PR01MB5277.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gt/QJfE229JHD+W6RRNNoedyCA2R3GaFhw0UAth/mw9zeRiwhU/sFBPuCqT120ylV1pRWJE5PQjhEuqfkoYzONATaumpitYrffRLDbm1qd2hpuYJqGVCpgjHL4IB/zHu4aLUFI4rztFgyd8L9sxSvVeVVydPdDwOISd4WJYj36RarrhFoEc5X3ZwhYnygCKXKpPFpdLljimfhhzDAeKjU8o8fLfT0vhLnk4aNpUDjPLVP1/D6YwVcIw7fCQa8/omtWFVfJVxZ0zZZEUlf3mh3O6glsIKfxXHeJytEg0FCFn2kDDxMz1pFgzPE03SupHQF7Vc0QV0igireGgdPMt/08/L/HjmaB9X3noYnjvFn6ItX/QNkbXl+0pjakD5SZ1uyZRSI9DtAu2u2jexleLuIDVU/r7fHt5ZPBH5p0CO4xuS67V8rn5q+koxoD4XdvapUCKT7DJGxR0ztGF10HdZR/f8Vh6ZqhJUwWZq3q58A1Hd3Of2PQ51BrODRTVUpzKWKksQwxR70AKNlbM9qWqSHlw0zlnycFqztAR17YuV+vPjaOgVPeJ5stmI5aXVuN9H/gKsjQn8tR4JYN9rYhXxMKD911Yewvs8sBh6oHkJ3j4qQkRny3RTsvymcqs+FXMY9mWaYqFhgAp/4wMvmxcxNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(396003)(136003)(346002)(376002)(66946007)(8936002)(66556008)(478600001)(53546011)(86362001)(9686003)(66476007)(52116002)(186003)(2906002)(5660300002)(8676002)(6916009)(55016002)(7696005)(83380400001)(6506007)(38100700002)(4326008)(54906003)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zXqZpeMy70EK+fEmq6m+oEpKSvbD1ynh3IvgT0Uy6vLUemJ0M4J9ZzePHD?=
 =?iso-8859-1?Q?+b8U7QyTX/PkryRvnOzhAo97vOxIpOZEsnhs+JQ0EbIUPr4kjFzZMiJ6GK?=
 =?iso-8859-1?Q?+CHMBTVZVDBTQGniBF6a+Cp8oluoH7i8oin/WtptRd6gUaUaUNCWXSlin/?=
 =?iso-8859-1?Q?EWB+ZTfmEzRzgMa631offB8FvvapiXHdmHgsO7Guftn3RVBQf9hZYFWekq?=
 =?iso-8859-1?Q?vZQ6aZoV1AwUPNDDYuFnea61BAok1y7yeAXWZlmn1i7an3cFLfk9JAe3pD?=
 =?iso-8859-1?Q?D7NEh0etFvu01hEZxHdwRQHhfhToZAPW309rhOnytwsCFnTk2wLHTx4cQQ?=
 =?iso-8859-1?Q?KDvOGUIBf4w1hxh7p0ciJGFdE1IMcimAna10g4TU0XJgu+g/qeFzmtxAyG?=
 =?iso-8859-1?Q?v/HhSTQLNifC5ktJiTFqNn2lgpEtbJ/RNBeVRIA6PFth4JtS0Eqq0QVgDf?=
 =?iso-8859-1?Q?HP7oIxYBZI0FbfiRn0c9YIN5XsMs54GhsNxtIcaxy0OQAkHqAEpZVZAWHq?=
 =?iso-8859-1?Q?2NNEOesvNTMke8dgVeIb6wyUcPek0rU8UQ7WGYsKsVsPb7ijFCT0p64uG4?=
 =?iso-8859-1?Q?NHkxU7qw8RVkZ8j6fJEEVWv7z4DphgLlMQdxE9Sc3oqj4C/Y+zQJWI7Ztn?=
 =?iso-8859-1?Q?vK2opW/FvPyTVBhQ9Nnxy+Sa+j58jI8zNjzh90U1CA7zpBIVokZKRev6RM?=
 =?iso-8859-1?Q?gSeDHmW2hcVO6VVyFKpVHG03d3G5bW5T3PGY3mu+Fu7S7pB0xBHqIUSQaB?=
 =?iso-8859-1?Q?A3hQA1IdBmCSHqGBbA06E1eMq/jcxQx9hUMW7Cla82z4pglFhhdgIY909N?=
 =?iso-8859-1?Q?UrYxe02m/kPbyivj1u2QisuZe7klwAxj1cgcHYWwQvCHWXhifpQV/o6nY+?=
 =?iso-8859-1?Q?eH7/+IfZ47XePjtc1IsUQNlSs36HhQRJWZyf3lvBER7kP+WTKtAzt93CIY?=
 =?iso-8859-1?Q?rvllhDnQRBszppArQH9o+2DgqaqhRHcnjvhCf21lIhyJ/+T4oWTYd94Lbu?=
 =?iso-8859-1?Q?27x7A+z0m3TqUK9UZRYH4AKSYfI3Pr6FH4D0cGNdpFeVxpu5kjvCvDP/s9?=
 =?iso-8859-1?Q?Z3KesaUYLzLDF7qdD3Te8POqLSD4FhrJPcVPuyoWkdw6hYaC+2bTnS58mX?=
 =?iso-8859-1?Q?WLBNj2GO+fnY8526NUUMLA7XgHUbCD25qOe5NevKHHk7yiMe/qz5jOhUaA?=
 =?iso-8859-1?Q?jZXBlcNcxlojWfQH0V/s9QQG8q5zqveL6r2iIeTeh7KOM7p6DjKIBLstOk?=
 =?iso-8859-1?Q?ovK3To0vOtiWE7OIaTbCheoNeJrDZ20ERq32w4R3ml4fe7XnggbQOrvD7A?=
 =?iso-8859-1?Q?17XKjNeO7Q8eXC3rbjCJ2L+BRYyOQrv1TalmDrijDpClQBvpntH0qMoWsK?=
 =?iso-8859-1?Q?ESjAbvwnhQAKwgBkSB0VgDFD2GBxHx2d3IO1K1esGrPuz8NFCFOkM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0a6d4d-6d39-4bd5-faaa-08d9413b4cdc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 11:35:20.0131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQ8TZ1BhqjAku6wIxaXr8jPcyAar7BKjoL1AR+k+oaNHIbIOkZ1luGst2q9Z+ISZF7aaJXtE0rHBaupA/Cyp3eXpOsyKdotryK+Uyp14/+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5277
Received-SPF: pass client-ip=40.107.243.121;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Jul 07 09:53, Philippe Mathieu-Daudé wrote:
> On 7/6/21 11:56 PM, Aaron Lindsay wrote:
> > On Jul 06 23:10, Philippe Mathieu-Daudé wrote:
> >> +Peter/Paolo
> >>
> >> On 7/6/21 10:47 PM, Aaron Lindsay wrote:
> >>> Hello,
> >>>
> >>> I previously supplied a patch which modified the plugin interface such
> >>> that it will return physical addresses for IO regions [0]. However, I
> >>> have now found a case where the interface does not appear to correctly
> >>> return the full physical addresses.
> >>>
> >>> In particular, when in qemu_plugin_hwaddr_phys_addr() for a particular
> >>> store to IO memory (haddr->is_io==true), I find that haddr->v.io.offset
> >>> is 0x0 and mrs->mr->addr is 0x3000, meaning 0x3000 is the returned
> >>> "physical address".
> 
> v.io.offset is filled with iotlb_to_section() which use
> AddressSpaceDispatch:
> 
> MemoryRegionSection *iotlb_to_section(CPUState *cpu,
>                                       hwaddr index, MemTxAttrs attrs)
> {
>     int asidx = cpu_asidx_from_attrs(cpu, attrs);
>     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
>     AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
>     MemoryRegionSection *sections = d->map.sections;
> 
>     return &sections[index & ~TARGET_PAGE_MASK];
> }
> 
> IIUC AddressSpaceDispatch is already adapted from the flatview to the
> CPU (AS view). So v.io.offset is relative to each CPUAddressSpace.
> 
> Assuming an ARM Cortex-M core having it's secure world mapped at
> 0x8000000000 and non-secure mapped at 0x0000000000, the QEMU cpu
> will have 2 CPUAddressSpaces, each CPUAddressSpace root MemoryRegion
> is zero-based.
> 
> IOW the iotlb_to_section() API return you the relative offset (to the
> CPUAddressSpace), not absolute (based on your expected 0x8000000000).
> 
> > However, I also find that
> >>> mrs->offset_within_address_space is 0x8000007000 (and also that
> >>> 0x8000007000 matches up with what an actual translation would be from
> >>> inspecting the page tables).
> >>>
> >>> Would it be 'safe' to *always* begin using
> >>> mrs->offset_within_address_space as the returned physical address here
> >>> instead of `haddr->v.io.offset + mrs->mr->addr`, or is there a reason we
> >>> should not do that?
> > 
> > I realized this was perhaps not clear, so for clarification, I am
> > imagining the formula for calculating the address would be:
> > `mrs->offset_within_address_space + mrs->mr->addr`. Perhaps this was a
> > confusing example since the offset into the region is 0x0...
> 
> Yes, however remember this won't be the absolute address from the CPU
> view, but the absolute address from address space (think of physical
> bus) view. For example for a PCI BAR, this won't be the physical address
> mapped on the CPU view, but the physical address on the PCI bus.

I believe I want the CPU view here (i.e. I want the physical address
that would have been returned from a page table walk by the CPU for this
access). Given that, I think what I'm hearing is that
mrs->offset_within_address_space is *not* what I want (even though it
appears to be in this case, since they happen to align). But also that
v.io.offset is not sufficient without first adding an offset for the
address space into which the access is being made.

Do I have that right? If so, can you point me in the right direction for
getting back to the address space correctly?

Alex, I seem to recall you mentioned maybe wanting the plugins to know
more about address spaces when I posted the original patch. At the time,
I think I understood the concern to be mostly that the plugins may want
to know which address space an access was to, not that it may be
interfering with our ability to return correct addresses (at least as
the CPU understands them). My initial thoughts are that we could adjust
the address here for the address space without necessarily reporting it.
Do you have thoughts about this?

-Aaron

