Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C44068EF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:15:49 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOcdR-0000GY-2g
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOcbu-0007vM-M0
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:14:14 -0400
Received: from mail-dm3nam07on2063.outbound.protection.outlook.com
 ([40.107.95.63]:46080 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOcbs-0005Hn-5V
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:14:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVHgQBb1BtzFctINZqpaXQ+zuOfHDdBYoo9EE97r+xbO8u/cHvxUWhvuuwKyBPwOksu2l9J5xNbKdkg/+fhjXtWHMOpoJ2K4XOryFexUBtRuSczeGQ5BxU0hbzUad+mE1uY8M7epJkwvI39HSmIpGQ42IbzjZRkblVfdzlTYxoZ+jRRlvsuQREtIJEpbXoRHhlc+ZoicOJP5FK0N/szqlSMo8eXpPvAlctiryiIyQQkLBHTS77R3nwmwrZ47YKZHWGCK7jUEG9uYmDys6arAp8DB/Zqnex9geQqclKboIowiR5hzrblDAGJzJbE/Sp5dWSXQ/+qcByLlxvdxSyR4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NVHjikHC3XTUFbfhGM/Aic8bIp0t9Eh0EoVuIvfEt4c=;
 b=lYfCRol7FcErTu1gRm5l+aFqm6DuP4zt06lNloWBBA8Xyq36YGglhPNakZs+2EDsgLOknhuZ+HKNyYlUI7SO9hOX6eEHNGT1NiM+hluW3bb7dskJMrmJafj/ZE9EM9+egAZr5gFFwquf20Xf0mqDJOZnPbhUJGUm3sjdmYurCq3Ql7pc4qAylj/aTirYOLRPtK/EQQo2Qjh154H0YRgRImmidJz5g15sNSYbV96h6BKgI3gZerNmhVicaXP3qc05P/x3J35bF0bfyZeSW9avQm0xIgFsuTGKrLJKeSyY0ifyst87sV+Bl694AP1QzOvhgcTUgoyiGbyab9cpIM3KEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVHjikHC3XTUFbfhGM/Aic8bIp0t9Eh0EoVuIvfEt4c=;
 b=Y5pKjj2RlUMsf+RcmDSTe/itD9WQH/4UT0YxVpIjb3NAAuEgcjxPPeuQlYvSB+EiA0UqjcA2nHBSM8QVD7TiJWMzq0QpChcFcBPBsijnZ6zXx4KALdOREf/XO+kRdzu01Na0bgioHho7ub64nlOX2n7NRgRnv9VRRl8pziVcvGM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Fri, 10 Sep
 2021 09:14:08 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4478.026; Fri, 10 Sep 2021
 09:14:08 +0000
Date: Fri, 10 Sep 2021 09:14:06 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "dovmurik@linux.vnet.ibm.com" <dovmurik@linux.vnet.ibm.com>,
 "tobin@ibm.com" <tobin@ibm.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: Re: [PATCH v4 14/14] kvm: Add support for userspace MSR filtering
 and handling of MSR_KVM_MIGRATION_CONTROL.
Message-ID: <20210910091406.GB2686@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <67935c3fd5f29a2ba9d67a91255276d3b9ccc99b.1628076205.git.ashish.kalra@amd.com>
 <c09f985d7a0741a7ab278b2f4bd4c346@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c09f985d7a0741a7ab278b2f4bd4c346@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN2PR01CA0029.prod.exchangelabs.com (2603:10b6:804:2::39)
 To SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
MIME-Version: 1.0
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN2PR01CA0029.prod.exchangelabs.com (2603:10b6:804:2::39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:14:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c47695c8-0df5-4001-3b12-08d9743b587e
X-MS-TrafficTypeDiagnostic: SA0PR12MB4384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43846FA3D7595656818AC2598ED69@SA0PR12MB4384.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjdS6nTEU1QLlUFsAPVKpxGpKLk1eN3FjYUeGPUZ9JlZ/aq4i049jQn6/VFQ3fk28swEbEWsg3Bb1Qn78PbBFJeOgUia0rANJskcupo69atKhz7S7c5GJOh6RiHoyDC1PHnPz+aTIi5NkjsPphKb2Oi5arbpKczGiHpuszumB06piAOaAX/afBoB8oOHJMFIFVHFtA0miwAc2vzHxMpYABkSvJcs+LJg77MZojeCnf0EalrcEqZnG2jOEEqobT87zNXw72CGu7zAaNiKlIyZyoE6GwukHyQn31hIjTaiTwO+XAVypaYwzSdE6m2eAHd1wYa4+cBIlUUTJSqkYeNXBgntPCPnOtAf/PsQIv1hOCpNzh8s4XdxjsJm/ooP0MvM6DfD1ORRaZi2q1JUNpOmRBEReiRRDEXKRs/gb5FIYquZyhTAjQV8kZ7WUfPWRcYS3BNewTNcLSNSlVpMpghdz/OqXc6Efs0oAylkWe//Fyog7T7zfrjKMDHJgaZ31iCrL4yCm31bus3b6or8qUHYMWAXRDlNBs5F/R3TFrt+WFTdPP6LHfJLFK05vKTWz7I6om6kMa6mVe9bA9soGAIGdcEquEVgn99exXvN1I+0cxfgcymaQYSeNliYJC4UDDTfMhl25y4ONWLimYkTby+pgpBk8RVU0ke4b+5GVtsj4e1ddyic/tOZISp6BLA+NHnKhvy7MKpira2mY8J5JAiZnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(33656002)(6916009)(44832011)(1076003)(66946007)(38350700002)(478600001)(38100700002)(53546011)(86362001)(55016002)(54906003)(956004)(66476007)(66556008)(316002)(9686003)(8936002)(6496006)(186003)(52116002)(5660300002)(8676002)(83380400001)(4326008)(33716001)(2906002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?27+EPUAEYomps82zPelQDobOLfSZnwFEz8iXIk7APxRyP7pLzwzFd/IYsXyg?=
 =?us-ascii?Q?M07oPqMPDvQQTMP+rKSJ8D+AfaGemXLBiBXselQHaRDBEDRn2lHtx260y1Xs?=
 =?us-ascii?Q?euYAY1LHuBL8xRQz3lqw3+TzScUplQZpfEkfqihqr4KTwrhVNJJ9G0+f2n5C?=
 =?us-ascii?Q?AZPvAd9EMnGj33DeSaPhak+7at3u0Vs00PYpAUr8hUDJyj7PK3IIHAgIyh+2?=
 =?us-ascii?Q?zUx26pPb+e2xYgp8Pmrh52Xkk4/H7ckyMxXY4z2UhevEkj8ymCYoYwzMUN+u?=
 =?us-ascii?Q?R76jz09axLOPl+7mmPvhWdzQCw2xaaexDy7brvOD0aMmIPwdectdihm8pED7?=
 =?us-ascii?Q?1I0izRubf8g2wPxRyatTCWhh0QqmTlWsqBzZUF4WeJyFAx/5lHd4qE8cqUyH?=
 =?us-ascii?Q?e/QaQC6Dozir00p4DBfWV18jhQc3Z3buAjcAFuzWWhbuYlrzdQlGGKj7t/sI?=
 =?us-ascii?Q?lu0szhiKiKSWlsZmO7CFhiQJNiXNa/dQr3Wi/Z2uBvRiahjglsVmDtgF0JKx?=
 =?us-ascii?Q?S5Nz2pkYYT0S1NdrAlFiaqPgauKzSYP8QJQAK5GWRjRrR64Fem84IHBwi72n?=
 =?us-ascii?Q?wAW1cGeFoISrJ2UZCHJLQdeQsHeZC/j4jXQTx8Obn+gWUmsKMAbEr1sT2l0z?=
 =?us-ascii?Q?CgjCZfUxLKK2ttR+aHSgd+przNyXAZufMroBky+rz6Z9+fw1D56rOsiilGP3?=
 =?us-ascii?Q?XZsX+XTUQhmR4s2baiSZl2XWoJEbkmrA0bVcMSL5Yu8etADiJiCaB9SQRa1c?=
 =?us-ascii?Q?VWT3tQeIpEGQ5gTiL/d/qkxGdviOQPJMRRBWmdZo/5olZbNDw9IL4WbFWYFg?=
 =?us-ascii?Q?JRonzuL056VJ7QAFcq+O+3bsEx/g5af2zmtpKB5XGdWefWpYAJaTFy+qoCHh?=
 =?us-ascii?Q?URM40wS/3OwJV+fTYtlFoBvDfM705wNqcLtW4ftmhRZSZ+V1D/97HaD/bzGo?=
 =?us-ascii?Q?iuwG9Sz5JkwxyaM/akKNZKw3aLl48frZ3FBevK3fG1Al3h+WXqoI4XTwB4aX?=
 =?us-ascii?Q?BqkuqGsvXtfzTISrU3axtFYG2vYLdIYaPahoiiOob9OOG+QJ6CbkVHkSSuc9?=
 =?us-ascii?Q?sAglMiqG77bCQeAlDGwIDy4KKX3KmzGyU+CAfpjrMXCeyMt9gIzaVEMxOTUg?=
 =?us-ascii?Q?T4q6hwdUiSnKKWt9VMDOqLgqWFGjd+nF0EGgaLvEe9xmyIkUNovU5XvrRqsp?=
 =?us-ascii?Q?JCPfo7Wgcub2KJCGAeyzQDUZ25bZ6PDXU31bbhuZm9CH8JvGjySRTjsfobRR?=
 =?us-ascii?Q?ouLS7kaqdnZhtosaDI/8dChIHFqGU/Rum46co2Keo9nxf3SenChvVT9b7+kI?=
 =?us-ascii?Q?fSGtdFfI3c+G5UBPLEWHGhVU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47695c8-0df5-4001-3b12-08d9743b587e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:14:08.7355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlTcbTC2HCxSKsxJ60nUfpdV6JnoagZ47lk6yo93ryU2FVAqOi2Vj8J8GKazzJ67Wc2xhlgt7kL7kGBQWEvnQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
Received-SPF: softfail client-ip=40.107.95.63;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

On Fri, Sep 10, 2021 at 07:56:36AM +0000, Wang, Wei W wrote:
> On Wednesday, August 4, 2021 8:00 PM, Ashish Kalra wrote:
> > +/*
> > + * Currently this exit is only used by SEV guests for
> > + * MSR_KVM_MIGRATION_CONTROL to indicate if the guest
> > + * is ready for migration.
> > + */
> > +static int kvm_handle_x86_msr(X86CPU *cpu, struct kvm_run *run) {
> > +    static uint64_t msr_kvm_migration_control;
> > +
> > +    if (run->msr.index != MSR_KVM_MIGRATION_CONTROL) {
> > +        run->msr.error = -EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    switch (run->exit_reason) {
> > +    case KVM_EXIT_X86_RDMSR:
> > +        run->msr.error = 0;
> > +        run->msr.data = msr_kvm_migration_control;
> > +        break;
> > +    case KVM_EXIT_X86_WRMSR:
> > +        msr_kvm_migration_control = run->msr.data;
> > +        if (run->msr.data == KVM_MIGRATION_READY) {
> > +            sev_del_migrate_blocker();
> 
> It seems this is enabled/disabled by the guest, which means that the guest can always refuse to be migrated?
> 

Yes.

Are there any specific concerns/issues with that ?

Thanks,
Ashish

