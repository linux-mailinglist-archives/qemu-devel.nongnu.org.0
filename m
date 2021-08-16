Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30403ED91D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:45:27 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdri-0001zs-9p
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mFdqk-0001K6-2u
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:44:26 -0400
Received: from mail-bn8nam12on2084.outbound.protection.outlook.com
 ([40.107.237.84]:19137 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mFdqh-0002wW-P4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:44:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAYDmmKpk2iTxb40fbbg70cDyFon3B8Yc2dv4CaemWa1jgBCAkbeXvnADvIsbAkIDr7splDsWdFWwfMRz/XDN/4RBNOoa6+QgK98dhlaoA0UZ92/2HnxMCDgpuyW0buH9mMi+Cc6aVgt+WIxI0avK7sXEXVjLL7Qzq/EI45mpmNspP21gFYYAubCTpkpMilSO7JE2e1xsetV2Yswkf4kPBybIdojeCT/9QXL7v6M+JuJBo0CPY6FMtfcYgTnagm8CIMPtxWkGTYZbsZWXNkp614bS2TPX//2HABrmWJDWg2FrkXzzIFm+NpD0RSH6lvJQV4goZpxghIvx0EFHuuJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TG/T89eNzRlcoomquXOtlwK63ZmOYdTyNEOKN7Ils4=;
 b=j3rIYqMZRjjP5hswvj1IwSU2YL+gAKzkTonnbpzBIg6UXG+aMJJUmx5JNs0sy+v9eGymXrgVMOe+3VPiTohbXAuXElfww4Yh6uJahjPzIwqgl1jWfJC0F0wSpIs0201SALwDs4zy1FxMVOyBFzLup0xyBCWJKOjlCQyFM3Zt9v2rJfOwlCgRP3js6u5Kdy2PfXCiUB4MfrX/PNM6XKRtLbBSTsh0VXnwFbGtjG6CERbA8tLdrj/s7YPNzGEe+MePSIJT5CmvyRhb2VmoujqLjN/KPXRK90GQK3unuJ46kguRxhANUKobxtwGXjbhBuSTZKZHYgyCfp8PXZWz6H5bDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TG/T89eNzRlcoomquXOtlwK63ZmOYdTyNEOKN7Ils4=;
 b=j/b94+rC91v2ic//lrax/ZhP2zDG4lkplm2enWpPFHaIJtl/XIs+wgX2Z2KtiJEyOX81qpFwrtdprUkwg6ru5GF16Hu74xnTs3bG7ynAvirqljIBDi+IE63PdoM36jB1SPBzA41AQWSVhzjLbTb3qWt9TUlTRX7zvFDwKtNY7QM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 14:44:20 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 14:44:20 +0000
Date: Mon, 16 Aug 2021 14:44:13 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, thomas.lendacky@amd.com, brijesh.singh@amd.com,
 ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 jejb@linux.ibm.com, tobin@ibm.com, dovmurik@linux.vnet.ibm.com,
 frankeh@us.ibm.com, dgilbert@redhat.com, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <20210816144413.GA29881@ashkalra_ubuntu_server>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN6PR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:805:66::20) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN6PR08CA0007.namprd08.prod.outlook.com (2603:10b6:805:66::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 14:44:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9c9d3c1-c908-4ffb-08af-08d960c4547b
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4557A2BE2799C43F82A4D9758EFD9@SA0PR12MB4557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxwBX0bLaUDCM1tMSP9D+BctseRH8qKldlFLNFJTVU5aJpZidDQCm9mPqmzW0i5m3uM7VG6iupHGIThYbFAUbMtyZp03O0nP6Aang9otagXKtr7yxhetJEcX858iq1+n6LBepWyQNQvlM9yK6wjQAe3UyVhBp9Pjjxv7Li9luvuMQ8Jm2B7zw77i19rvr1frYYZWHFueWjLuY970dQ8JHvhCk7m9whPJZdGLUzHg8h4N8YPbg/7rDCUmZPTCW1QAWtjtZtIWRvcEnF/0ybi78UStOiM8zOQZRBrq8dwXqNTEQrx91+wuplG6Lv8zb6wi3G4ZRnYeF+Yn627AIeuD5HBeeq16lhGbKXgitvOA7cvj/SzEud4uA5+jB6ZGEYEFuD00DlyPjAEYvwQRfCHBOmB8cxohug6DScDQ0DXKGXuIMQqUP8o5VGYj9XJBFzFtP9nL+M/cBx1bhfOz5svGCcZVO/HEsTYjKrqOCgijnLC26mpLyfQCFbwailAuSR+rLZAoR9nB02MqmHtALdV6uXpmT6R50TeA+/K43qtkMLVtsJHAl9Co1GHacy8GfB1IxuIkWwVWzCLaZwSRM15bs0EcUn5ryhBm1YNuClIUn3a4rhHMzamc8ZY3nED+NetUtDE6qkZj67/M5TyOM/SWc0JeKRhWf9Ev6UUfxZu95JIUcV9du9OcLaRtEdeoJ1QjRxS1GJABAWxvnw7bcNNtcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(8676002)(33656002)(52116002)(186003)(9686003)(6496006)(44832011)(83380400001)(6916009)(53546011)(4326008)(38350700002)(956004)(316002)(8936002)(26005)(33716001)(38100700002)(86362001)(2906002)(1076003)(6666004)(478600001)(55016002)(66556008)(7416002)(66476007)(66946007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mzWm89nMgATIojItvxT7F6nevISzDJBsWknfGrU6qvwS00zZlgWAdWEoIyxo?=
 =?us-ascii?Q?YfZGXAZMv6KWsaWSdRDkpmsO/W6dC43K9U6/JAoYh64/dc10QG+Y7FBmeL/B?=
 =?us-ascii?Q?R/ysRxOCyWVHGzAPRXG6vvcxgPsH4qiaJLDXj8+Wfaz6DoWk2AZ2fI5K5p2q?=
 =?us-ascii?Q?GUfoyIekC/Shks/AgPflxD02K1rCmLcb0YZa3K86jH17zux4+mkWpZ8dpPts?=
 =?us-ascii?Q?hlLqVJSuuOH64QTlYh81xT/WBjE6pMTK4Pc0rVb6DP4J1q6BzdcjwODp+wEG?=
 =?us-ascii?Q?x+bN/n8dFlfI+Z5kVmeKEjkUnG6e288hoap67mTXZxVk2pBgr5rmFCH2Apzt?=
 =?us-ascii?Q?3XHpXHe9fR5w767uY7mSmqyd73MZxY2YlrZWZnMXyV1du41LVIFiLNVFnKDE?=
 =?us-ascii?Q?ehOyum+l24dLCDSiDn+lVFCKEng8QdcOXaFmpxjopR74LP/fZ6De6FB8/YcQ?=
 =?us-ascii?Q?OI6LuIhj0lXgt6HB0UwMprwnQDVgaigvRm58qDEXymaUrOYGEF1pbguofbtK?=
 =?us-ascii?Q?DiRBtRuWxd0Cy7UwTT3FHw3s9TDm2WOOtAXEkh56rtY8NSfhph3qhGvosEHC?=
 =?us-ascii?Q?81MjjLXbpAzkKWGPpjPSNNN7HwarfcWw4IDuTmmUbq23aw0TBBmyZA8/zBec?=
 =?us-ascii?Q?15dE4XwGQ7L2+iJqEgHwB18IuZsO0CGZpDEn8moL7ty90NVh8gI4RBGq0oqw?=
 =?us-ascii?Q?F/OH8JiALp7R/4QjiIENEw/5gLsQSJ5vZRWYM6ixCGNxHMo7MdAGGlbqH/qX?=
 =?us-ascii?Q?Sn7WOjdJXxae/6HKS8ouAdX6I8XDtQZomQW/1ylWHUvSVQPN3fO2o3pNZx04?=
 =?us-ascii?Q?bDPVz18JjX5gVP8W0sapNaRhb4sdTw3PE8JTRN866Zem0NiVrsPHofvenXdW?=
 =?us-ascii?Q?RfPQB1sLfyZ85TFy2Q/I8UUN1cPvTW6JpmPykP/pYqdiF7th5FxwZpm4pEYe?=
 =?us-ascii?Q?gLqhQP6RsJBQsnkJiTEnAPH3tXAoaRYvhs72ANQgGOZaZtSlIVawMlOOW0w2?=
 =?us-ascii?Q?kxTTZHti8otH+DC5ljHOyFjFfHsI1Y2HsVCgfdwfzinGWm9kx40o0lGf4Ay4?=
 =?us-ascii?Q?MPaodlma5/zkL/10llEpaRL2HkzanCUEgrf7U/L4nhOR6Ko7w7xDQUDb/ych?=
 =?us-ascii?Q?Tly3RE5fXoWdaVBmhHRNo774muiWuO8PbyRcR7Uphv7xsa4+Ce/BF/r9SOQF?=
 =?us-ascii?Q?1whwUm825fc3yzFo5+wgWKvTX/183AVNDnEFu10/ghFnPvmEGO/HSpUo2GOR?=
 =?us-ascii?Q?NCEeNmWGHXZ90ObEtoljIE6qwFfMYp8xCEs57amaUPrtIi22cd1xxxUbTeDc?=
 =?us-ascii?Q?09FGxY3cT9BtiR9QoqS/0uVn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c9d3c1-c908-4ffb-08af-08d960c4547b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 14:44:19.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2KNGwAektXMexavjBXbLiwclQ52thqwVJlymiLO3A5OdVaoqWUpyoa5aANutIzvhmRmVeuWxnZbBp5iEZwQxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
Received-SPF: softfail client-ip=40.107.237.84;
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

Hello Paolo,

On Mon, Aug 16, 2021 at 04:15:46PM +0200, Paolo Bonzini wrote:
> On 16/08/21 15:25, Ashish Kalra wrote:
> > From: Ashish Kalra<ashish.kalra@amd.com>
> > 
> > This is an RFC series for Mirror VM support that are
> > essentially secondary VMs sharing the encryption context
> > (ASID) with a primary VM. The patch-set creates a new
> > VM and shares the primary VM's encryption context
> > with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> > The mirror VM uses a separate pair of VM + vCPU file
> > descriptors and also uses a simplified KVM run loop,
> > for example, it does not support any interrupt vmexit's. etc.
> > Currently the mirror VM shares the address space of the
> > primary VM.
> > 
> > The mirror VM can be used for running an in-guest migration
> > helper (MH). It also might have future uses for other in-guest
> > operations.
> 
> Hi,
> 
> first of all, thanks for posting this work and starting the discussion.
> 
> However, I am not sure if the in-guest migration helper vCPUs should use the
> existing KVM support code.  For example, they probably can just always work
> with host CPUID (copied directly from KVM_GET_SUPPORTED_CPUID), and they do
> not need to interface with QEMU's MMIO logic.  They would just sit on a
> "HLT" instruction and communicate with the main migration loop using some
> kind of standardized ring buffer protocol; the migration loop then executes
> KVM_RUN in order to start the processing of pages, and expects a
> KVM_EXIT_HLT when the VM has nothing to do or requires processing on the
> host.
> 

]

I am not sure if we really don't need QEMU's MMIO logic, I think that once the
mirror VM starts booting and running the UEFI code, it might be only during
the PEI or DXE phase where it will start actually running the MH code,
so mirror VM probably still need to handles KVM_EXIT_IO when SEC phase does I/O,
I can see PIC accesses and Debug Agent initialization stuff in SEC startup code.

Addtionally this still requires CPUState{..} structure and the backing
"X86CPU" structure, for example, as part of kvm_arch_post_run() to get
the MemTxAttrs needed by kvm_handle_io().

Thanks,
Ashish

> The migration helper can then also use its own address space, for example
> operating directly on ram_addr_t values with the helper running at very high
> virtual addresses.  Migration code can use a RAMBlockNotifier to invoke
> KVM_SET_USER_MEMORY_REGION on the mirror VM (and never enable dirty memory
> logging on the mirror VM, too, which has better performance).
> 
> With this implementation, the number of mirror vCPUs does not even have to
> be indicated on the command line.  The VM and its vCPUs can simply be
> created when migration starts.  In the SEV-ES case, the guest can even
> provide the VMSA that starts the migration helper.
> 
> The disadvantage is that, as you point out, in the future some of the
> infrastructure you introduce might be useful for VMPL0 operation on SEV-SNP.
> My proposal above might require some code duplication. However, it might
> even be that VMPL0 operation works best with a model more similar to my
> sketch of the migration helper; it's really too early to say.
> 
> Paolo
> 

