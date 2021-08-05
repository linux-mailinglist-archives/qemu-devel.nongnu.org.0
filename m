Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8D3E1182
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:40:43 +0200 (CEST)
Received: from localhost ([::1]:33930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZrm-0002Ux-3F
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBZqT-0000qS-60
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:39:21 -0400
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com
 ([40.107.92.46]:25785 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBZqQ-0005yg-UQ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:39:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+3B6R+cAj665vTtzOclRIR9Z0z4U82fOVsRqq3CUUfVhmNqq6q7XIt12dIgFdeABuAaPG5N0Fcc3dcMh4tgoYOQzVA2vzl9fLEiEuL9905r4emxKT1kQXQh598Va50EtjH0syrM83fyWmMxNNptezeQzMGM/R0BD1zQHzM8RGhoKe2yJBXlrsbII7sdgKysEdhFHVrkROfj2e7wIvijfsHNBk8VGFw2cmCPyBoxSdmLaQ3JzmGCuAivlboMewC2Pl+tyWFKjiQTcZ20v5xF+HoPcOGypInZQoghRhHnbVw1ey88v2bsSj9WS+J4lSZ7iD/O9N7Ab/WpAGZxlGYtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM7PlpveLYB4EWD1OLVL/HclgLH1gfWW/asSAeByCtM=;
 b=jOIN32rOPIPtAv2hRPvCRl9ykyQeOMgUnfLQeOkDb0yWbwK2CPYIKjCY6fF27bCt6J/a9mKmE7OZkgp6ajRLNjWlzcQTOnB6ZWdyQ/gEY8Ob1rjjTzKkQnQaTp08+DBAAIydbzFUz8HJeMTcpZptoPAe3cj1kdhFOD8QAYTD1NMSF8kD1MZ2QiMQp7+TZnZy5vFc1Zp/ZZ4BrNgJRqd4Mkcjue5sZI+rst4Gc87DSL8ZF0jqjJPhZoa0+Bu0G/1v+gCgYIqRwsMhMtIlRvhlqsqXaEKGC1nSQ/qnoBq865hcUgMCwMUeJmkTlLIdDJA3X93YsICZFtkNioKgJQcAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM7PlpveLYB4EWD1OLVL/HclgLH1gfWW/asSAeByCtM=;
 b=0sleO7VW8jy1rw2TGU43Evt4ipgbd8pKI4qUaPeS9fyQlscVLi0KIduau5tahi7vKfSHjQ6WG04jPH7+MgBx6t+v7Dy8QsvUtmXT1poYw8/Tk7R3DDb2z3XY3tk4XnH9LeuKCOcYMnizbCDmqzXHRmnhykkNePlsw7QanWizPy4=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Thu, 5 Aug
 2021 09:39:14 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:39:14 +0000
Date: Thu, 5 Aug 2021 09:39:07 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, Thomas.Lendacky@amd.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, ehabkost@redhat.com,
 dovmurik@linux.vnet.ibm.com, tobin@ibm.com, jejb@linux.ibm.com
Subject: Re: [PATCH v4 02/14] doc: update AMD SEV to include Live migration
 flow
Message-ID: <20210805093907.GA23670@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <0e2b3d80e3d61b121ff4b508e5299e3c23f7b090.1628076205.git.ashish.kalra@amd.com>
 <e1eacdaf-3ccb-9e17-af78-5c33a05316e5@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1eacdaf-3ccb-9e17-af78-5c33a05316e5@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN4PR0501CA0103.namprd05.prod.outlook.com
 (2603:10b6:803:42::20) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN4PR0501CA0103.namprd05.prod.outlook.com (2603:10b6:803:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Thu, 5 Aug 2021 09:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 120436f1-1ef7-4f39-63d2-08d957f4e306
X-MS-TrafficTypeDiagnostic: SA0PR12MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4592768C689B0ACF753AB3708EF29@SA0PR12MB4592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXiwGNH6hnYEVYwoFNjaVsr5mM6M0izB8Gq8ePHkSqNWSwXUIi803gv3o/WCbcxjIqSBvYYjV/U1ANrG5t4r1yrMY9gaWCq7XMCB1eSUktYowT6ZW9NbfPtA/SV9CWzDA05eLx4twrGkUJs/tpjXCXINhxilICz/mBrf/g9rFAvSJe+uVbS/spPKYA/IlurE0WX1CwUUTA6yPf6l72vz2rU/tBWrJUITknUUFxt6oWHSLSLy624KtxsMqXgc0fa2GXS/QHt4TTdl8BQ+C+1XVMDBYi8rI/0xCOAW3ndJ5YVBl1mxgxTmnzbADVtugWNPEFuFkroExKPFYbCrqZrMUwX3KR1o617wyYYZxAxyBFWah3hexSrjCyhbqxtmAaHINgxcW5TjwgUjxA3EEC/rEhe+cHHgt0sBXdXT9E8zB/9GALXGQGISYkhS06hosFDanWTk1upmCdTgOzN034sb6defyrvtuycUZxQE0v/vKYp4vM7FOPiTeSp1GRNJSdooxhWzPW6/S7ypRlqUevXR1wWbTLS8jQHsrtOlPM+rE0oDCBXmZ7uosg6OoYMq2bx3dBVdfrIWciA3dENFWUT/B7AyYSaGm7Rex56nbbgi4FwMtkoKiA2ZnoMidoAK5h7Y21c5w9fsksyxBoXhEcUFwyno6I/hYMnFmkX5zKGX4VHNLG+iYPhmwscbIf5Tisf0IpVSKRAYIct1HBheHzV5fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(66556008)(66476007)(316002)(26005)(186003)(6916009)(83380400001)(6666004)(66946007)(15650500001)(1076003)(44832011)(33716001)(4326008)(55016002)(8676002)(9686003)(8936002)(5660300002)(956004)(33656002)(2906002)(38100700002)(52116002)(6496006)(53546011)(86362001)(38350700002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7tBDlu/MFitdu951E8ojfpGWr2myT4LJ10VvqiB/smPsMeU3YKKKRYbsYx2i?=
 =?us-ascii?Q?2fz8c3aV+NqIyoemniyKGPwaB2Lw1Vh91Wer02qDDWXpRoPi/k/8z97nvvim?=
 =?us-ascii?Q?i370BZ4Zqnuh472/UrMVhe6cHLb1VJo6C6fu+LBpQsKswCKsEF163jTfVmsk?=
 =?us-ascii?Q?VYGaUKOXRNbuGwCBRTEf70j4KebrY7uwr9zU5JuK37pc2bBeJPztsayKZ22b?=
 =?us-ascii?Q?dX6j7n+wbJjZumQM6sYF9KlC3pe+FvOoszM+jGuBNgPAf/5wZzJC4f9VWfIv?=
 =?us-ascii?Q?8b5H0b6Hy517LKLpDXtjgvo/ux+FT+md+zCGIKDdwuwYntPZ8ea1F3rClHQS?=
 =?us-ascii?Q?IOZfFnuyiJMVG65lxgrhLPfZ9lxk9TWL5TUCrMMFE7MZ5bvCVOfWvmzxPdwX?=
 =?us-ascii?Q?ZZHCtCP3N+0G1A4BpaEW1cw6c1d32w+sqvzI+JDSnv+W5r4eRmk7T2vx/nce?=
 =?us-ascii?Q?Zuag/CGvoAiSh2WmzHiYC1fv464F5Bohm02Bg2hEhUIS+J/cTK10JJZbU+7t?=
 =?us-ascii?Q?AxV2Kl2ujXiy+1fj5/i3ZX4+GqtzxFmFN5YbBEFZjTEpf/2i9e5SUDA2FsLu?=
 =?us-ascii?Q?e7BDR/Plm9UCkDR8gkanj6WL52IuyTBr2OfGjytmcZBwcMpPL7PKaDS8uPK2?=
 =?us-ascii?Q?sbQW1vZnSme4DHtVlkEHA2/LtESm6bh2lg0Cdw6oMSjfof8hEG9r8pwvMkRT?=
 =?us-ascii?Q?QfLSCbF2c2fYCHdRWwrOTZBCKrZWhkpzb9jyRT/lot70HsgbcUPQeMQTMcNV?=
 =?us-ascii?Q?YD3iPwBcTIFD7pQXf6vGZa7LjrkoCoWDu6fB1r+wOUDWgzQx6MwP8R1491tD?=
 =?us-ascii?Q?k6vbhhKTBWN9OiSx82oWDvB65DcrOX3P0+1EJlGXhFApqNWOexuZeud2uCO8?=
 =?us-ascii?Q?IxERZ17+8LEMpIY5RI3hcX9vSGOILNQmsGUhXwdPESwKo7ji1urYSjBP71cZ?=
 =?us-ascii?Q?XVxviqbzUL8LRsbC5Jlhn5UwL8jW07Jgu3WgaNUonyVGTfGqjE5WccXHR9ob?=
 =?us-ascii?Q?onfO6HnjylWBO+Fun1occOTfkgFL/PUkWrHRW9sTYL2kWifbtucc2Jy4UZiO?=
 =?us-ascii?Q?xCjlF0dNOA5SErCUPg7RE0mXUf79S2adxmgbd9EQ0SwGKkF6YkjsLpcfDb0F?=
 =?us-ascii?Q?3Mx6elxmVxi/zZczE7xYULGQ3WRRa4XqKADkTK14+e/ggoFJnOFYbhD/vRrA?=
 =?us-ascii?Q?7z6LtoGVckQ64VSIkDzsEZ1Q7ro9d/fybMjCN3E6UcQH1+F4dfHZH0ZDYTkk?=
 =?us-ascii?Q?py74v5vZ0V8qCnMvwkHImNNaIqDqZ/yZ99rMqxPW6B0XL7e0S2fsJLcJhVxf?=
 =?us-ascii?Q?RzeJYiTW+nNbYDKl5SkxcsDM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120436f1-1ef7-4f39-63d2-08d957f4e306
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 09:39:14.3098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKUz3BHxph/vYftpWFiG41csYTUxmbLkL4EgAkOLxry/bhh3CcpVD8Pg6OpgK8P1mwzeNoSKoC/sHRmJEXGADQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
Received-SPF: softfail client-ip=40.107.92.46;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Hello Dov,

On Thu, Aug 05, 2021 at 09:34:42AM +0300, Dov Murik wrote:
> 
> 
> On 04/08/2021 14:53, Ashish Kalra wrote:
> > From: Brijesh Singh <brijesh.singh@amd.com>
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> > ---
> >  docs/amd-memory-encryption.txt | 46 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> > index 12ca25180e..0d9184532a 100644
> > --- a/docs/amd-memory-encryption.txt
> > +++ b/docs/amd-memory-encryption.txt
> > @@ -126,7 +126,51 @@ TODO
> > 
> >  Live Migration
> >  ----------------
> > -TODO
> > +AMD SEV encrypts the memory of VMs and because a different key is used
> > +in each VM, the hypervisor will be unable to simply copy the
> > +ciphertext from one VM to another to migrate the VM. Instead the AMD SEV Key
> > +Management API provides sets of function which the hypervisor can use
> > +to package a guest page for migration, while maintaining the confidentiality
> > +provided by AMD SEV.
> > +
> > +SEV guest VMs have the concept of private and shared memory. The private
> > +memory is encrypted with the guest-specific key, while shared memory may
> > +be encrypted with the hypervisor key. The migration APIs provided by the
> > +SEV API spec should be used for migrating the private pages.
> > +
> > +The KVM_HC_MAP_GPA_RANGE hypercall is used by the SEV guest to notify a
> > +change in the page encryption status to the hypervisor. The hypercall
> > +is invoked when the encryption attribute is changed from encrypted -> decrypted
> > +and vice versa. By default all guest pages are considered encrypted.
> > +
> > +This hypercall exits to qemu via KVM_EXIT_HYPERCALL to manage the guest
> > +shared regions and integrate with the qemu's migration code. The shared
> > +region list can be used to check if the given guest page is private or shared.
> > +
> > +Before initiating the migration, we need to know the targets machine's public
> 
> s/targets/target/
> 
> > +Diffie-Hellman key (PDH) and certificate chain. It can be retrieved
> > +with the 'query-sev-capabilities' QMP command or using the sev-tool. The
> > +migrate-set-parameter can be used to pass the target machine's PDH and
> > +certificate chain.
> 
> It's better to clarify that you use query-sev-capabilities QMP command
> on the *target* VM (to get its PDF and cert) when it's ready, and then
> use migrate-set-parameter QMP command on the *source* so it can prepare
> the migration for that specific target.
> 
> 
Ok.

> > +
> > +During the migration flow, the SEND_START is called on the source hypervisor
> > +to create an outgoing encryption context. The SEV guest policy dictates whether
> > +the certificate passed through the migrate-sev-set-info command will be
> 
> Here you say migrate-sev-set-info but above you said
> migrate-set-parameter.  Which one is it?
> 
> 
Actually earlier it used to be migrate-sev-set-info, so this is a typo,
it should be migrate-set-parameter.

Thanks,
Ashish

> 
> > +validated. SEND_UPDATE_DATA is called to encrypt the guest private pages.
> > +After migration is completed, SEND_FINISH is called to destroy the encryption
> > +context and make the VM non-runnable to protect it against cloning.
> > +
> > +On the target machine, RECEIVE_START is called first to create an
> > +incoming encryption context. The RECEIVE_UPDATE_DATA is called to copy
> > +the received encrypted page into guest memory. After migration has
> > +completed, RECEIVE_FINISH is called to make the VM runnable.
> > +
> > +For more information about the migration see SEV API Appendix A
> > +Usage flow (Live migration section).
> > +
> > +NOTE:
> > +To protect against the memory clone SEV APIs are designed to make the VM
> > +unrunnable in case of the migration failure.
> > 
> >  References
> >  -----------------
> > 

