Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153AD3BE95C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:06:38 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18CD-0007mH-5p
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m18BL-00077K-C9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:05:43 -0400
Received: from mail-bn7nam10on2101.outbound.protection.outlook.com
 ([40.107.92.101]:36064 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m18BH-0008Pc-W3
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:05:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE8pNydnUMB+mG99QRS2lqbSfrI8QhqgBENY+TCuzrnelBJapcfhdj/H6ul79ZZblMYfR3nkhg2G5jOfQrMuvAleXw2mU+wk3ykeHcRQtKrOT5ELK6Jngu9R1CkQGH4ZZf+PTE+IBRxKtuGIfN9HOYEBtXdsNit10BdL5EVmqV9a6dBZ+Zn1x3d/xSsUFF5cU0j64XZ6b1mcYeK6MDXaZKVchkN+N3R3pEZnhCUaWrX18+a/8lL5fl7tfVXW+2Jf/eoD65UEVWMXy0ajfpuwCg6qmPLVx6QWfvIlmwKUYYQhrH8wv8czh0349twRj+Km4WsQhT34clxPi1q3UinP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTDuU+ckFNGy/3jcqLtwZwV3K1cVysE4UQzNrP8FpLM=;
 b=TdUeVDNdUJIvXgJU7P/c7Zj7hZ/+J6WwnIUu1mewD9vVZ0tNvcfT1HWGy4f6a/EoCkSisWwkpvo6DSXfkyrebuH5GAUsHcpmNCOxQ9BXvm5/0cqEXPeyscuKtapMCH82C2U7BOZpT4McTDmIOr5m2+GanODZkhP7DITrFUUKfzriER8zHDfOY+NbTHPHEb//6MrqTF6w9t6cXpL1ndb8d/RG8t55bAMikisHNFAwbvj5yCGXXgu/aNPuqd6NC3inTMmQU8ZgJLcg7vHs4hxPqyMrZ5+GfNqyLJ6UOPCwyZL0q9gZ1ISApTKxvMTEjtSA89++brsyzQBdF3oUAJJvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTDuU+ckFNGy/3jcqLtwZwV3K1cVysE4UQzNrP8FpLM=;
 b=DL2YtFmGziusyeKKuB/s4FAi7Zr7a6TIGRfjuO3/RxVjnKXGoAVflAC6HxfXsFclibTW3RKUta2UhgOwd0fZ4Os2FNr/einvukFtUkgzRMbzjxvWvBiE9dQSEmto7Twsky9c7eOc0tS/eKq9oEZCC+psRXN9Hrsn40Ci/zfL0zA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6140.prod.exchangelabs.com (2603:10b6:806:e4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Wed, 7 Jul 2021 14:05:34 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8%6]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 14:05:34 +0000
Date: Wed, 7 Jul 2021 10:05:27 -0400
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 cota@braap.org, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: Plugin virtual-to-physical translation incorrect for some IO
 accesses
Message-ID: <YOW0p4UcAITOmb1V@strawberry.localdomain>
References: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
 <c3c2440e-bd91-1671-f9dd-e297f90d01ab@redhat.com>
 <YOTRmAqH2dn+C87T@strawberry.localdomain>
 <7bfcc4c0-bba6-d3cf-1d39-aebca1655078@redhat.com>
 <YOWRcuUSfKaMKdza@okra.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOWRcuUSfKaMKdza@okra.localdomain>
X-ClientProxiedBy: CY4PR2201CA0001.namprd22.prod.outlook.com
 (2603:10b6:910:5f::11) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 CY4PR2201CA0001.namprd22.prod.outlook.com (2603:10b6:910:5f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 14:05:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac90ea7-b707-4984-2aeb-08d9415049b0
X-MS-TrafficTypeDiagnostic: SA0PR01MB6140:
X-Microsoft-Antispam-PRVS: <SA0PR01MB61403F11E532D162F2B4E7F78A1A9@SA0PR01MB6140.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iM9FX+MKEXUADNAwUpaHkRpU0Tk8VNDVNExg1snfdMGiEeCckMXLuwX+YF834/b3HFEj3PJIfjQZmO67cJLKzwk1lVBju8MEqVsRidBPFelGDOfkqAE+Ncoghrb7vuvBB4QokQtzOJgu6ZIa+8OucmiWE8PhLKJUv98RsXwmY3myb07uDIVjtrYRZpKG/1fJE6f/XAm7oNQOOlzJS09/pIdrxJzKob/Cz3U5iDpV+XaIs1F/QhcvQs2sDCXumFEbKUqOgpHj2O0c3XgwLES7NcNuzqIvkXUHMWpSPTUD1YmKXioDEqab9TDq7f+aKk4oA1E/sV1cDvn3sGSC9Xa3CO0kHl+iV0bcql38h8lC1wNW/lPhsrUzoSLD0O12aVUiMJOIfXLQnIZakWBXpmp30zhamzNvHZ3uH/6p/ozdXziIc/b40UHZkyrNd8pfvjN8DldviVNGQnBVPoE4AP1Hw+wjjqihloBzKGdLf/w8ThRwO/prDdhyXfAwPsKYZD3rgsyr9jg5e+ny6lMAtjT5o8YUAf72O8LZBEb7/LZgzAx5h6x3EsX+YTyrmwr3u6rGTbtMcpjnZZ9TfX3tn/tYMAaTLtDNAUzNUQzk1QvGMWDuKfxuN2d5coGJRewxyQgc8XkzFmbhE/9cgVs1gUqe7s5KZGdANNR71vS6eADbGHjKauO4SafnOqVYzWl8xF7Hdtt+gvI/zKfo2UaMnuTIHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(956004)(5660300002)(66946007)(478600001)(55016002)(9686003)(6506007)(66476007)(86362001)(38350700002)(38100700002)(66556008)(2906002)(186003)(4326008)(316002)(7696005)(6666004)(8936002)(83380400001)(52116002)(54906003)(8676002)(26005)(53546011)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OuUnsLX25pL6VhYSBr34IE4rZwjqgptkKtsPREz2ccwFhNusiDbkzhlRqh?=
 =?iso-8859-1?Q?ek3hJg6nZ+b2c8VXxyN5cfTowJKBrGuxGkGkNZF/0FlZpPGVQkbHpG3xrF?=
 =?iso-8859-1?Q?+88MbdvNu489lGFfH1nlonmzXDeTAdO5ryKynyTe2NJr4HuQI1MMB8hIh5?=
 =?iso-8859-1?Q?axeutykTXOYqMdo8PgZ6KXewlIHfYcBcjUlP0M64wwx2pq8m9IMtkMpAkv?=
 =?iso-8859-1?Q?djLYacgtkGxLwNSZW4vVg7FzBimwCkrfyyKwTZkAwxSetZkyh7UKMB6TWC?=
 =?iso-8859-1?Q?fR56TN4vGWMFOKDk1eI3yAwDS1aGSdJDhdTWIIMcCdwKClCSAnyUVMnk0F?=
 =?iso-8859-1?Q?afd0VdeohS8N/BemXCg61uu9rdDygJmaqMMqAik1w4N8tqZixyN3I8JyUS?=
 =?iso-8859-1?Q?7bmhVLTMLU49LZrV3FdiwJA8XdRA3x4SeYOA1kJI3ePiYbyQH73YDTpnZD?=
 =?iso-8859-1?Q?5V/BmLnQl2ov/wZU6FCQverM/G3xg2RTNNyUzeKy1ZNJ9Ata3cAO18Zr6k?=
 =?iso-8859-1?Q?AlKlmUTjdW9zbaSd/LSkhGtKAXcd/GIOqyPiYbWMlHtvTams15NkYDFi7z?=
 =?iso-8859-1?Q?0Fu+bfkLz13lLPLdHe0uQZ85pRNiqW7hBT8jTzaCn5ReVdKIxOmgA2cmoH?=
 =?iso-8859-1?Q?mmLEFqnDmthR41sz+R4SbbG9gJBhVQzi3jLkVDfVcDnOe3Xsx+13OmbxaI?=
 =?iso-8859-1?Q?UG84439hUwrxgc9wwUoPWyRrdS45QCzvRDJ1IjgQu+vFgBHVB07Bt0xtXD?=
 =?iso-8859-1?Q?QIzXTX6c84XbKiuHv2gJ2MIlH7+UOOL+4lQMQyUWfG62fLWtv5vhpgKxJk?=
 =?iso-8859-1?Q?q5OS7qBQd3wax8AR560ZDYDUNYlpVzAekeFHtx9mJs7RhgeZqDp1UGX4Rz?=
 =?iso-8859-1?Q?nPr8t5UxiAs/uV38PF14RqwjlBE33CesRGqZDKdG2FIU8iDDvztXUTbPO8?=
 =?iso-8859-1?Q?H3m9XX0E7/hJ7vIfp+c49ybKHErzH3OFnD0jp4h92fvIEqWucEM6USGSJL?=
 =?iso-8859-1?Q?SBldOVnc0Atc1OdedLhS2MN7/ZPMQC+v0w/Wbb8WFnrXD5Zdu2lAVYRM9E?=
 =?iso-8859-1?Q?Kmw3qbTXoc5aP9ldN3XfNXHvqOJHw853/EQwYzAxDZwrj5VjGpdcMnG+xm?=
 =?iso-8859-1?Q?lfXetBsiqGxhgVXy2Zpctl3fDBiSwcGzKsFtYR5P8VHbwG/YLnZG86J6xN?=
 =?iso-8859-1?Q?pxcCAep/g3fhDGw0HGV5nAbQcN0HwU7LGCqiZO0DI3znajSSCvsmz/iKJW?=
 =?iso-8859-1?Q?I8XWNAGwg17z29MKoFBtQBaAX3iLK1eXJZnMvOhRGLQ+84h5mQkiDBw8jB?=
 =?iso-8859-1?Q?SK94smhO0oTQbPOXAGSZtOjzT19oJ6T41qbIpZcavk6frnG0AO69qbps9a?=
 =?iso-8859-1?Q?ZDQvchOSYs?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac90ea7-b707-4984-2aeb-08d9415049b0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:05:34.1175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3/r2zIIsqElZIUnI2PHRphkAb1egXEcSKQJvotA0aNLd8AB4HG7rQ5KthbpKejLdFKzOnGigTeYvl+XW8T2GwJVFOHhaCl6Qc1IgZ9FgKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6140
Received-SPF: pass client-ip=40.107.92.101;
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Jul 07 07:35, Aaron Lindsay wrote:
> On Jul 07 09:53, Philippe Mathieu-Daudé wrote:
> > On 7/6/21 11:56 PM, Aaron Lindsay wrote:
> > > On Jul 06 23:10, Philippe Mathieu-Daudé wrote:
> > >> +Peter/Paolo
> > >>
> > >> On 7/6/21 10:47 PM, Aaron Lindsay wrote:
> > >>> Hello,
> > >>>
> > >>> I previously supplied a patch which modified the plugin interface such
> > >>> that it will return physical addresses for IO regions [0]. However, I
> > >>> have now found a case where the interface does not appear to correctly
> > >>> return the full physical addresses.
> > >>>
> > >>> In particular, when in qemu_plugin_hwaddr_phys_addr() for a particular
> > >>> store to IO memory (haddr->is_io==true), I find that haddr->v.io.offset
> > >>> is 0x0 and mrs->mr->addr is 0x3000, meaning 0x3000 is the returned
> > >>> "physical address".
> > 
> > v.io.offset is filled with iotlb_to_section() which use
> > AddressSpaceDispatch:
> > 
> > MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> >                                       hwaddr index, MemTxAttrs attrs)
> > {
> >     int asidx = cpu_asidx_from_attrs(cpu, attrs);
> >     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
> >     AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
> >     MemoryRegionSection *sections = d->map.sections;
> > 
> >     return &sections[index & ~TARGET_PAGE_MASK];
> > }
> > 
> > IIUC AddressSpaceDispatch is already adapted from the flatview to the
> > CPU (AS view). So v.io.offset is relative to each CPUAddressSpace.

What does CPUAddressSpace represent here? In my initial reading, I
assumed there might be one CPUAddressSpace for secure and one for
non-secure in the ARM world. But from my observation so far, v.io.offset
seems to be an offset relative to the beginning of a given memory region
(i.e. one device's portion of the memory map), rather than to the
address space as a whole (in terms of S/NS).

> > Assuming an ARM Cortex-M core having it's secure world mapped at
> > 0x8000000000 and non-secure mapped at 0x0000000000, the QEMU cpu
> > will have 2 CPUAddressSpaces, each CPUAddressSpace root MemoryRegion
> > is zero-based.
> > 
> > IOW the iotlb_to_section() API return you the relative offset (to the
> > CPUAddressSpace), not absolute (based on your expected 0x8000000000).
> > 
> > > However, I also find that
> > >>> mrs->offset_within_address_space is 0x8000007000 (and also that
> > >>> 0x8000007000 matches up with what an actual translation would be from
> > >>> inspecting the page tables).
> > >>>
> > >>> Would it be 'safe' to *always* begin using
> > >>> mrs->offset_within_address_space as the returned physical address here
> > >>> instead of `haddr->v.io.offset + mrs->mr->addr`, or is there a reason we
> > >>> should not do that?
> > > 
> > > I realized this was perhaps not clear, so for clarification, I am
> > > imagining the formula for calculating the address would be:
> > > `mrs->offset_within_address_space + mrs->mr->addr`. Perhaps this was a
> > > confusing example since the offset into the region is 0x0...

Whoops, I replaced the wrong term in my clarification. What I really,
really meant was:

`mrs->offset_within_address_space + haddr->v.io.offset`

> > Yes, however remember this won't be the absolute address from the CPU
> > view, but the absolute address from address space (think of physical
> > bus) view. For example for a PCI BAR, this won't be the physical address
> > mapped on the CPU view, but the physical address on the PCI bus.
> 
> I believe I want the CPU view here (i.e. I want the physical address
> that would have been returned from a page table walk by the CPU for this
> access). Given that, I think what I'm hearing is that
> mrs->offset_within_address_space is *not* what I want (even though it
> appears to be in this case, since they happen to align). But also that
> v.io.offset is not sufficient without first adding an offset for the
> address space into which the access is being made.
> 
> Do I have that right? If so, can you point me in the right direction for
> getting back to the address space correctly?
> 
> Alex, I seem to recall you mentioned maybe wanting the plugins to know
> more about address spaces when I posted the original patch. At the time,
> I think I understood the concern to be mostly that the plugins may want
> to know which address space an access was to, not that it may be
> interfering with our ability to return correct addresses (at least as
> the CPU understands them). My initial thoughts are that we could adjust
> the address here for the address space without necessarily reporting it.
> Do you have thoughts about this?
> 
> -Aaron

