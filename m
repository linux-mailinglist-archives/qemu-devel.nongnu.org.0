Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6C3F05BA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 16:07:33 +0200 (CEST)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGME6-0006jy-3c
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 10:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mGMDG-0005zI-LB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:06:38 -0400
Received: from mail-bn8nam12on2042.outbound.protection.outlook.com
 ([40.107.237.42]:37088 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mGMDE-0002Q5-AS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:06:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgF04e1k9SD7CK72IewtCrburJykmhAxNuWXdyJ278gVYI3PJIexnXhIF1SMbubYHDT4uj68gr/hIUMdCoRkjSM0ExH/NcknIeTgnv2w5UN/gRgPAw0igJQBk4y61xfdK/5jrd6Ju6R9bBknGKCSCquGUG9OtQfbVYEADR4rjuIPZU5jkpgtmSoQZwT7O1fqgm6fsz0CZJ7cbgsXBVeLC0trsbMlN8/RqUbFW0saWurP6+psQh1NJHH6+2XG40tzE1bri+xEX2S7wgQWSATLrb8O6ayqq9zK6LnEDWiZpCfwAOWwZGEOmRdXK+J+05u35ysGVztwF8eJ3ArMviElow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4bV01i20Cx/4+0Kc28B+bw9MZEG/5fGmgRG+OLIB5c=;
 b=L0DWx0GlcC6qlMfFGgVDWKiM9x5ozbsmbBxdX0GTheBoyAX+F4YCZSB1StChVn9nymqhlY20z9k690AkChKx72oiq/UCQgmMdlndJFKYGKesBKBHhZf6M0AnnZ2Nh3+R3EOQkySJT/WduxcOl/4VKnu7yjHHgBWwNqUpcb/aVbSNJhYtDPpGzDWSD+ZM149oa2JgIGitE573c+BHgH8oKOWSfxeJur+tSsegMq9CqOjySNJEQOKBy4BBVkkpcGLojTAt4+J01KalqZ2n56VurYciZpuychh6gtki1VWWFXMcRfGhTXV2c0YFl6dFwlDDKeOjz+HALzWsvMCN/LxU8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4bV01i20Cx/4+0Kc28B+bw9MZEG/5fGmgRG+OLIB5c=;
 b=q0AhgM7PtnVCuxdvKhdso9gJ3ZzSqAt4s6RSAciOiejA10oy4DTxDhSOHo+GDLNY6FNBA+boJHQJfkQbCCg0A8MP2Zj2NdisdBhF0kw6bYni8cG6YQtIcbFr3YeHDRhrjHfu4c/NxxiDFv27FAj/VCulXNwdPGypex8FdV9FNQI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 14:06:33 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 14:06:33 +0000
Date: Wed, 18 Aug 2021 14:06:25 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Steve Rutherford <srutherford@google.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Thomas Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 "Habkost, Eduardo" <ehabkost@redhat.com>,
 "S. Tsirkin, Michael" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 David Gilbert <dgilbert@redhat.com>, kvm <kvm@vger.kernel.org>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <20210818140625.GA32492@ashkalra_ubuntu_server>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <CABayD+d4dHBMbshx_gMUxaHkJZENYYRMrzatDtS-a1awGQKv2A@mail.gmail.com>
 <CABgObfZbyTxSO9ScE0RMK2vgyOam_REo+SgLA+-1XyP=8Vx+uQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfZbyTxSO9ScE0RMK2vgyOam_REo+SgLA+-1XyP=8Vx+uQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SA9PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:806:27::19) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SA9PR13CA0134.namprd13.prod.outlook.com (2603:10b6:806:27::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Wed, 18 Aug 2021 14:06:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9b4154b-0b1b-42f1-ad41-08d9625161f0
X-MS-TrafficTypeDiagnostic: SA0PR12MB4431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4431C3E53456E8A15CA8F6288EFF9@SA0PR12MB4431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tod7fSLA0R+STXTN0TTi3zMWC6g4Mz5Zy9VsR76GDpnB8wgMhhDV5HxVJH3kTRzPLH1Hm9pGb00xK/+gHkYpcEOCoMlRUH36gQo1Zvigqaks6p++5Wc2hEFtf6UD2+Eb3MDKcOKt+2DdjKFyMg1EKNRsUCKNo9r0sxWpUyX5d36kp608paUqEJH6uvM582fX8AzBjusrzXgWNMZcHkY+esvmRLOfEix8Z1jeZjX/knYBphFnWSFLiq3/cHulP4hkRo4rFtyxrrBKCoUgOzegENv/lcrTnFE6JAgvpRgsRQq/poW+fwz4XdcYsNa4OE0I89Yq3jIyoywWrWqgzISg7DYj0DvWe8+OalliLSa4y/2mkNIkeosL+dMFZtyWmHmrjuadyLdbDJjbxL/Vb9AKSg3ke2dfQBsz6Tk88u7gA06bj8Rz9TFS3zATfl0hg+Cz8byhbZ7Q4a9wI+mqN3Vlh2pokOzTs9mc0GfNVQuCc0Z/B5+OQRsRkUKOut+6oSj+HRssavu1rvsIdPXVp9IyguneavTWMgENUUPTaoULBH6uk41MxY8a+mFDbXL0mR4lLBzEqlXl3PGoyPBPy1I+5PK/Skr1CmFMne7WG18sT93bgwK9FD7VePXU3SUOoDuqxicLkaMIcVFZSvwpdFAJGkiWQ+tDbvjZeHJGudmqXzfZYIIKnIMAJuVs5/xIlRnRQJyetnBCEC1oFoOxXvizKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(66946007)(5660300002)(44832011)(53546011)(7416002)(6916009)(186003)(26005)(2906002)(66556008)(66476007)(52116002)(6496006)(478600001)(1076003)(33716001)(956004)(86362001)(33656002)(8936002)(6666004)(4326008)(8676002)(54906003)(38100700002)(38350700002)(55016002)(316002)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fN8+87DXOnT0E6iR2lhUc1Km4jm96m2NvmEmud8SULhUjcuR0QFEajiELhr7?=
 =?us-ascii?Q?BMz0ZpvT4hbNRGu8BuabM8Wdl+n3NF4HulxaYuxeu4LmbUqq0iUfLhdYEOL2?=
 =?us-ascii?Q?wNate/yUckb3oweJ1KP/PLu4FBPhIFiIg1jFN+BlaIlyw0JbZnVh3gtocFbk?=
 =?us-ascii?Q?ynb5E+Bq6Nev9SOyrNXEwnb/FS27U3KCpuABgbNXObTPPWvP8XGZhHLg8lFx?=
 =?us-ascii?Q?CMfp4hdl/FEHEgGjLonkfZsnoKNyH4amiHT7u9HDsXMgG4/53iOGdaWEPv/T?=
 =?us-ascii?Q?dAdEG2/iE7nisOzEmPT2ll1s759eGqs+2PU/Fr8y2IbAN2237mlJj+ulqrat?=
 =?us-ascii?Q?GcMZF7OfgipFvcRR24zCPKpTipE2fhMOhqpzOrVVXAONVbhm1eeS8Avy0EHF?=
 =?us-ascii?Q?nwKkBGK0n94S8xl9p4oDmJff0OBDBIzKlMU/k05xKhuaKc/ThuxMjiX61pZq?=
 =?us-ascii?Q?jaL5cHw7lmfpa2Z59HvVUYhYtaNcpu0hvIeKBXJhF0gccxZAjpa3GzDF3ScV?=
 =?us-ascii?Q?LwYz8yXbKnxGQLzCryKFqQQQ+daMEPnDqgPAF+N3qTYe3n2m4e3rhLtyl+Wc?=
 =?us-ascii?Q?90g/dGmIG7IeEF3f5DaEXlh7IcqFodGShifqreEWCgnl6cPuVA15LxWv1e2K?=
 =?us-ascii?Q?M8WEJJ/bkS7UXFjtEGgqE7eXuM10KwYWiAgMDBVGk8eq6UmuUOUFzzV9eDBU?=
 =?us-ascii?Q?mNeYuM+DjP/kNzZGqyG5qtl6QOKn+0BczTmi3LHRzyMBLOo9sffEaafTE/Uv?=
 =?us-ascii?Q?tVFfVTKfw92TIyO30HJ+OVIPNBCJq3CkQWj5yemYepynrNMpQrIitptwj5EZ?=
 =?us-ascii?Q?pPWAPZ/2mE7ZbH4pBLUlWa4b/UYarVuyJy5w7y04tzxKKFTUQGfW0FWSZR6i?=
 =?us-ascii?Q?zxnhjDPNWCRkASQ97iOOFW00wzUyWOt0A4r04IqAOxxFGe634/x9/NeFssyN?=
 =?us-ascii?Q?m47Jc8omAu56adjQwE9sypOORDRjPdhhbT5GksZwOxS29gvDiPMADJeGfnm0?=
 =?us-ascii?Q?x4kfoci3HkKIyVN92AeAYyDaoEOGBfhCBJzh4GJHu78uSNR94HRUIXWsY8BR?=
 =?us-ascii?Q?vOauvcvAAUVNxBgssrD2Wh8+UplELN3Vs2O3cIKSjOwnTiP0tS4npaCMLEVJ?=
 =?us-ascii?Q?hEWyutxxuZZ4bpaRfcD+A3A0ByhsJOdWAU10v0p1H9GLcJ5s78puDs0Y27T3?=
 =?us-ascii?Q?orfy1MK3lYOEB8wDy4sAjso6Dpy+6gQM/AnqBlCQcmILPYvKxuE/rwa1HrWt?=
 =?us-ascii?Q?wAla0tQET+dPtHYLEZ3WfKKNOXJbvRHnvO4v4BT8LVTc1jCjxfaPpXYso64N?=
 =?us-ascii?Q?0L9Wt01TI33z1bpiZ39LgM7K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b4154b-0b1b-42f1-ad41-08d9625161f0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 14:06:32.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nO1dPOPAr6qUShF947i9Ulxzx33UULqFK4hN7Mj5rXuPzEVSm5hrWH/drlajrvZnUD0GKv0jmUnMgSjTNXjmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431
Received-SPF: softfail client-ip=40.107.237.42;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Wed, Aug 18, 2021 at 12:37:32AM +0200, Paolo Bonzini wrote:
> On Tue, Aug 17, 2021 at 11:54 PM Steve Rutherford
> <srutherford@google.com> wrote:
> > > 1) the easy one: the bottom 4G of guest memory are mapped in the mirror
> > > VM 1:1.  The ram_addr_t-based addresses are shifted by either 4G or a
> > > huge value such as 2^42 (MAXPHYADDR - physical address reduction - 1).
> > > This even lets the migration helper reuse the OVMF runtime services
> > > memory map (but be careful about thread safety...).
> >
> > If I understand what you are proposing, this would only work for
> > SEV/SEV-ES, since the RMP prevents these remapping games. This makes
> > me less enthusiastic about this (but I suspect that's why you call
> > this less future proof).
> 
> I called it less future proof because it allows the migration helper
> to rely more on OVMF details, but those may not apply in the future.
> 
> However you're right about SNP; the same page cannot be mapped twice
> at different GPAs by a single ASID (which includes the VM and the
> migration helper). :( That does throw a wrench in the idea of mapping
> pages by ram_addr_t(*), and this applies to both schemes.
> 
> Migrating RAM in PCI BARs is a mess anyway for SNP, because PCI BARs
> can be moved and every time they do the migration helper needs to wait
> for validation to happen. :(
> 
> Paolo
> 
> (*) ram_addr_t is not a GPA; it is constant throughout the life of the
> guest and independent of e.g. PCI BARs. Internally, when QEMU
> retrieves the dirty page bitmap from KVM it stores the bits indexed by
> ram_addr_t (shifted right by PAGE_SHIFT).

With reference to SNP here, the mirror VM model seems to have a nice
fit with SNP:

SNP will support the separate address spaces for main VM and mirror VMs
implicitly, with the MH/MA running in VMPL0. 

Additionally, vTOM can be used to separate mirror VM and main VM memory,
with private mirror VM memory below vTOM and all the shared stuff with
main VM setup above vTOM. 

The design here should probably base itself on this model to probably
allow an easy future port to SNP and also make it more futurer-proof.

Thanks,
Ashish

> > > 2) the more future-proof one.  Here, the migration helper tells QEMU
> > > which area to copy from the guest to the mirror VM, as a (main GPA,
> > > length, mirror GPA) tuple.  This could happen for example the first time
> > > the guest writes 1 to MSR_KVM_MIGRATION_CONTROL.  When migration starts,
> > > QEMU uses this information to issue KVM_SET_USER_MEMORY_REGION
> > > accordingly.  The page tables are built for this (usually very high)
> > > mirror GPA and the migration helper operates in a completely separate
> > > address space.  However, the backing memory would still be shared
> > > between the main and mirror VMs.  I am saying this is more future proof
> > > because we have more flexibility in setting up the physical address
> > > space of the mirror VM.
> >
> > My intuition for this leans more on the host, but matches some of the
> > bits you've mentioned in (2)/(3). My intuition would be to put the
> > migration helper incredibly high in gPA space, so that it does not
> > collide with the rest of the guest (and can then stay in the same
> > place for a fairly long period of time without needing to poke a hole
> > in the guest). Then you can leave the ram_addr_t-based addresses
> > mapped normally (without the offsetting). All this together allows the
> > migration helper to be orthogonal to the normal guest and normal
> > firmware.
> >
> > In this case, since the migration helper has a somewhat stable base
> > address, you can have a prebaked entry point and page tables
> > (determined at build time). The shared communication pages can come
> > from neighboring high-memory. The migration helper can support a
> > straightforward halt loop (or PIO loop, or whatever) where it reads
> > from a predefined page to find what work needs to be done (perhaps
> > with that page depending on which CPU it is, so you can support
> > multithreading of the migration helper). Additionally, having it high
> > in memory makes it quite easy to assess who owns which addresses: high
> > mem is under the purview of the migration helper and does not need to
> > be dirty tracked. Only "low" memory can and needs to be encrypted for
> > transport to the target side.
> >
> > --Steve
> > >
> > > Paolo
> > >
> >
> 

