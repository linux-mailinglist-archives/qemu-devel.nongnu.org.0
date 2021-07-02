Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CF3BA2E8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:48:20 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLOt-00053n-AV
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lzLKa-0006ls-8I
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:43:52 -0400
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com
 ([40.107.236.48]:20698 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lzLKW-0003KW-9j
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:43:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL8Vj3nPQBAYvNFTagvnKFgzKK3XsjrsBfewnSzfQFGbN5bkqqt7hje+uhfdcXuY3CZuA731X6+dG8s/TV9cx6Hu2/SHqxUttWG8+VJMwtr9bTltb941PTod/ljJ7sdr+5ExiPs1vb52HrEjD/Q0QOnBMF11V+tUWfMjpoIFzBIMKUtZvqJz5OyZ2OpOjPxePxLpEjVUOIO+YCi+JdyUTbH9pb9S7J/xwWvgF7Y/TG/0vSCPLt7B111qJwUqL65T2dM14zxlcD+39o9Y7MkQ5nU5UNbe6vYWUg89H4zvvXAzMUeI+bWmbve9PaOE2vix4PSvSwUVDlgGEIJ+rYrhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/MBFz1yEzLyCk1uoRjpujkL0s8MI4oRGMaDPguGRL8=;
 b=XWkIqtJTiDVVVQcm9dZb4LPnYu28shbmtZJMja8jQk1zy7tPw25xuSIKhOgcizEhHcp57zJtNyXqeC8d5ZuUWpdqKEAA/hUwdf7wyUWP8IL+rjhNTxsNIjIIrRgJa98x7howXbv8BPzxyBr+KIJTlDZgQ+zmy5dEjq/LKs07cMxmWhaLtMcMdkWjhnEnwlg6OgRWadq5FrpiOO9OGLX6aAJ7f6zRBy5EGT2D9S50hBotBHnfPdxrP7+R2WCMDe9cloPyWA732H94XgoKE24aKeR0V+5owCxphrEAdnIxDivOnjmy+0lMOC4xqo2y34Kx45OL/aGQEd4W5erDdd3Cww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/MBFz1yEzLyCk1uoRjpujkL0s8MI4oRGMaDPguGRL8=;
 b=X2t5CjZDXLQ3BZLkK6T9A4y+k5XSDw3g7KaLqcDZ6g4Y7ov8PN3Dl7NpKk6WjMYwbEYaNKF+q2WitC997x6SNgoDbqeEilTuL5OA04le1D1Li5SuwxXvkSKKojjRBFpXoV5M30kxTheXeVOJ2r6zvEA+32uYoKQJ5hpmQIDftgY=
Authentication-Results: dme.org; dkim=none (message not signed)
 header.d=none;dme.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4972.namprd12.prod.outlook.com (2603:10b6:610:69::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 15:43:45 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 15:43:45 +0000
Date: Fri, 2 Jul 2021 10:40:02 -0500
From: Michael Roth <michael.roth@amd.com>
To: David Edmondson <dme@dme.org>
Cc: Igor Mammedov <imammedo@redhat.com>, ehabkost@redhat.com,
 like.xu@linux.intel.com, qemu-devel@nongnu.org, wei.huang2@amd.com,
 richard.henderson@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, armbru@redhat.com,
 babu.moger@amd.com, pbonzini@redhat.com, philmd@redhat.com
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <20210702154002.zxxktf6qxajd2w3s@amd.com>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
 <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
 <m2sg0x1a78.fsf@dme.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2sg0x1a78.fsf@dme.org>
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SN7PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:806:120::32) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SN7PR04CA0057.namprd04.prod.outlook.com (2603:10b6:806:120::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Fri, 2 Jul 2021 15:43:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f495ca0-2442-4313-3fca-08d93d702d06
X-MS-TrafficTypeDiagnostic: CH2PR12MB4972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB49721450C88B8B345FFD4D83951F9@CH2PR12MB4972.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JsfR/bIlQ2OZ5W+/r7Eq9J4lbd9v8cp+5e/0VGHoJTC9HojTYJ/WtJlCzpD+xi5DDMWxTOSfeK9u0biY0YCumqQqU41KwW1Eten/iyVQvy1JOaVU6IUglTewhDmUcWG+5KWvldes4a/n9h4si3oOBzhxmaLcJLUVMbBO7cnaF6o0aLGOGAHm/FwVMexk/D4+ysEvz6YjVYkXp4x90eq/T9nvoXR7adEVr1ZGShQSqUe2hhN1+Ty0fdmGK2+VrQmi+QP6hcBHwI1naUjYRQpjSO3iH01E+zIYukutK/eZKfp0iD++gZSjBLUXhf/WpYR4BOG7AlIN/u1Xq8C+Lj3JwYRh49/l/jyqk1jPfJYPTL/gQ/E1dFjuIIx5Gf3hDwP/xUNywhF3+VoJ9zCp6QlMhYpVWCymCDsUKKb3ZQOdm6XhmAFo+TAXuyriB5vkvgb6tTOS18qqqVX8kLnYiBWaX8HKu2fsbyNA9tmTQwfqVMAvt6b3bNKzi1expmIyOGQP6wF7HC2W62omfiDtN8/xQt09M3Jh7YCN6EakPOp6TXRMhc9jAMrkUagezLbRIV5Xckz7yZuTST6w1aGttnZzmC3W6LBOVlN/udmpxdH1EiMmlzi5epKva8ECo2K/29tEBevd3dotp0FInkgSYDFvH5g6ImK0KI+m1e4QuHCAiVcOSap00dQLFt3NH/dgo8dyaRlMB/9gGryTFOv/8FqPr+MCVU5ql4hB8nOlG/B64Vnf2JJAfw4voQdvQL/DGUIXvfveZ7OqhP63lqEVGMNRro4iP/ySkvLwyRbowqSgTpOsIdeFZkYF+PaQYqjlgR2mZeURRS7Hcoz+udhYLVrsj8cHAWeG1NxFlUY6wiyNR70dH0sD5zAMyNGzJ3wypSns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(8676002)(186003)(83380400001)(966005)(52116002)(6666004)(6496006)(26005)(38100700002)(5660300002)(38350700002)(16526019)(6916009)(478600001)(36756003)(86362001)(44832011)(66946007)(8936002)(6486002)(2616005)(54906003)(7416002)(1076003)(2906002)(4326008)(956004)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JpUnYR0WSHWHnUmyaBBylNuOlhJLyr4FrhMOVPoiE1vhWBt1yc4e0lB34koA?=
 =?us-ascii?Q?X2HQux6+vle+oK7XzmTleDBnF5KxixTcejzxFAAOCslrwC0LY7C7AL45BBjw?=
 =?us-ascii?Q?GXJgg+ru/ea9MM6ir4cQM7nlptGo3r2knTSJyZXmVJkSpvYdSEToBlc7UY3u?=
 =?us-ascii?Q?6EU4TaKumTlbVVGyeIaRAz22gflFUk6XTZx65B7rVb08FTtim+zz9fHjieFW?=
 =?us-ascii?Q?6gH3UPSqgxE6d9QkG6U/VfodY2EPZmRGwMK7OaWN9kasxV6LnXZPLcnum4mL?=
 =?us-ascii?Q?tQQLcbG7B06n9crOD76WNhFrzKoUdmf09O0YUATG2sBWWnH+dD+vGKX5jdrb?=
 =?us-ascii?Q?cpyRy4Kk7YR7YjaJU6X3O03YqsPwfD1pG95hbbnpeTS7bTqNfhmfGIjbHwEI?=
 =?us-ascii?Q?tzF3ak32Po6O0zjkz26GCbJYbnU+PszYTpkG1pncCboTfUwVXzNuFIOhjNhm?=
 =?us-ascii?Q?9Olf+hyal3WQceN+PvXyKNOm3PwHd0rUJ8flQmxJ3/9BYiR0rI/XCBAn6RPY?=
 =?us-ascii?Q?FHDSiz9kQmUxG/KNMp6EDUQJ26JMb8Faqc3/mqX7n3ZWMjRqlcysa5GqVuwf?=
 =?us-ascii?Q?h9xwEYEBR3IVRJlMRTWOt81r8e9RxK7aUpmZGJMuBspvlFJlRSBztkoRLvS+?=
 =?us-ascii?Q?5ISv2WicWLbpJu5b9LQbPKCLy7ivUld7UbiIl7qCi5ICzqKsTsCpq6zbsryW?=
 =?us-ascii?Q?5lKr9iPv4i+oDoWamTGi1va/kkFChe+2iYmkO/8DPXLMNXaOTfdltDJWb9z8?=
 =?us-ascii?Q?o8V0XtmZx+jqrgKT2icDNmXSkYujX2t9y9K3rLGEpm/DBRjs22ByIT2gb9sL?=
 =?us-ascii?Q?CqQQVxWTci6fzCPDUJs7PwWmZtiOlq6jNmtWJyPB/236Eg0E48Y9IQ/4TkOn?=
 =?us-ascii?Q?QsLqWAuwkoHDHgL2pVXEHFKocA4H3XZE0ewFmmYxDgUwN8uKfldd62FTRabN?=
 =?us-ascii?Q?WdX3O7ZV6WriI2KwudxxxE1Vxo73TN3MSaX6xSAGrLnQsdg+L5UaYEayDdGC?=
 =?us-ascii?Q?KwW3k68vh0Ddej06U5t5x3h5m+FW9wCp1pAGVpkn0hveYrC5m0KFQgTjPbiS?=
 =?us-ascii?Q?el8zY5hxcKKHAlJwkgkUw9ya8VJa7ZbeIf36jIEexCyQOOv1WdSGDpEjRrBX?=
 =?us-ascii?Q?Jf/riogmcxIXtObJk/7Oglezn0aJQeB6EagvjmhspLDzll+k/Bon0A9d8H9E?=
 =?us-ascii?Q?sbWNeb1kdhk4rc0Qjg2UokG0+EznaWQ4m/UKQ03xc/0zDBw2AsvvT+YyLCrv?=
 =?us-ascii?Q?LrTk14tbC+dXctGphN4ji657kSijH82VB6OokD0rFETPHqMWpWxlkxKf417V?=
 =?us-ascii?Q?QRHYHVqfuF4rDE+YSuCq1k26?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f495ca0-2442-4313-3fca-08d93d702d06
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:43:45.5042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/Gussdy/ygo6ct2x8ss+/lVEg4ty5gktJ1XCwaC7o5dgYc6GgB6FIfxi8VsniUltpF40oLgCsK6dlKA1TOboA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4972
Received-SPF: softfail client-ip=40.107.236.48;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

On Fri, Jul 02, 2021 at 07:50:03AM +0100, David Edmondson wrote:
> On Thursday, 2021-07-01 at 15:35:49 -05, Michael Roth wrote:
> 
> > Quoting Igor Mammedov (2021-07-01 03:43:13)
> >> On Wed, 30 Jun 2021 14:18:09 -0500
> >> Michael Roth <michael.roth@amd.com> wrote:
> >> 
> >> > Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> >> > > * zhenwei pi (pizhenwei@bytedance.com) wrote:  
> >> > > > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> >> > > > should not be changed to 0x1f in multi-dies case.
> >> > > > 
> >> > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> >> > > > for multi-dies PCMachine)
> >> > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>  
> >> > > 
> >> > > (Copying in Babu)
> >> > > 
> >> > > Hmm I think you're right.  I've cc'd in Babu and Wei.
> >> > > 
> >> > > Eduardo: What do we need to do about compatibility, do we need to wire
> >> > > this to machine type or CPU version?  
> >> > 
> >> > FWIW, there are some other CPUID entries like leaves 2 and 4 that are
> >> > also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
> >> > guests will result in failures when host SNP firmware checks the
> >> > hypervisor-provided CPUID values against the host-supported ones.
> >> > 
> >> > To address this we've been planning to add an 'amd-cpuid-only' property
> >> > to suppress them:
> >> > 
> >> >   https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
> >> > 
> >> > My thinking is this property should be off by default, and only defined
> >> > either via explicit command-line option, or via new CPU types. We're also
> >> > planning to add new CPU versions for EPYC* CPU types that set this
> >> > 'amd-cpuid-only' property by default:
> >> > 
> >> >   https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
> >> It look like having new cpu versions is enough to change behavior,
> >> maybe keep 'amd-cpuid-only' as internal field and not expose it to users
> >> as a property.
> >
> > Hmm, I defined it as a property mainly to make use of
> > X86CPUVersionDefinition.props to create new versions of the CPU types
> > with those properties set.
> >
> > There's a patch there that adds X86CPUVersionDefinition.cache_info so
> > that new cache definitions can be provided for new CPU versions. So
> > would you suggest a similar approach here, e.g. adding an
> > X86CPUVersionDefinition.amd_cpuid_only field that could be used directly
> > rather than going through X86CPUVersionDefinition.props?
> >
> > There's also another new "amd-xsave" prop in that series that does something
> > similar to "amd-cpuid-only", so a little worried about tacking to much extra
> > into X86CPUVersionDefinition. But maybe that one could just be rolled into
> > "amd-cpuid-only" since it is basically fixing up xsave-related cpuid
> > entries for AMD...
> 
> The XSAVE changes are similar to
> https://lore.kernel.org/r/20210520145647.3483809-1-david.edmondson@oracle.com,
> in response to which Paolo suggested that I should have QEMU observe the
> CPUID 0xd leaves rather than encoding knowledge about the state offsets
> (at least, that's how I understood his comment).
> 
> I have patches that do this (which includes making X86XSaveArea a
> TCG-only thing) that I plan to send out in the next couple of days. They
> should make "amd-xsave" unnecessary.

Ok, that does sounds like the better approach. Thanks for the heads up.

> 
> >> 
> >> > So in general I think maybe this change should be similarly controlled by
> >> > this proposed 'amd-cpuid-only' property. Maybe for this particular case it's
> >> > okay to do it unconditionally, but it sounds bad to switch up the valid CPUID
> >> > range after a guest has already booted (which might happen with old->new
> >> > migration for instance), since it might continue treating values in the range
> >> > as valid afterward (but again, not sure that's the case here or not).
> >> > 
> >> > There's some other changes with the new CPU types that we're still
> >> > considering/testing internally, but should be able to post them in some form
> >> > next week.
> >> > 
> >> > -Mike
> >> > 
> >> > > 
> >> > > Dave
> >> > >   
> >> > > > ---
> >> > > >  target/i386/cpu.c | 8 ++++++--
> >> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> >> > > > 
> >> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> >> > > > index a9fe1662d3..3934c559e4 100644
> >> > > > --- a/target/i386/cpu.c
> >> > > > +++ b/target/i386/cpu.c
> >> > > > @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
> >> > > >              }
> >> > > >          }
> >> > > >  
> >> > > > -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
> >> > > > -        if (env->nr_dies > 1) {
> >> > > > +        /*
> >> > > > +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> >> > > > +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
> >> > > > +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
> >> > > > +         */
> >> > > > +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
> >> > > >              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> >> > > >          }
> >> > > >  
> >> > > > -- 
> >> > > > 2.25.1
> >> > > > 
> >> > > >   
> >> > > -- 
> >> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >> > > 
> >> > >  
> >> > 
> >> 
> >>
> 
> dme.
> -- 
> I had my eyes closed in the dark.
> 

