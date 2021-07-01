Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FEF3B97BA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 22:42:36 +0200 (CEST)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz3W7-0001ct-5q
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 16:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lz3Ul-0000rF-7E
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 16:41:11 -0400
Received: from mail-dm6nam12on20611.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::611]:15584
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lz3Ud-0000l6-S7
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 16:41:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdlpEUZYfdavlYr0Ni2zCTsrKHiGtbIelhTEjyVZlR7XzDgKn8e3Ro8QGMkV1cJx2/CQxC6g+Yu5p75vcUmsy2DEbuBLqC1QT9saQADcYg3Y0K+PikIcEw2pvhlZS7Mjx9vAqXYhAFzDIiHeT7USY/JKc8LyFruZw5AYM7RVXvJRttTc2cEnldKP3TT8vkTduqX2YBoRi8rb5DPSRxQwkG33y9xWhhHuFN7yn6bfeMiFFh3c42HaGrOvTn3QMh/bZoPVqVamiEct0yIc43CnAvOcWFHfhgHYm0CgvLiPzzCkZWAyxKbAAaFa3Ea3wth1RXjaB8ogwCtYr6q/Vyz1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpw0n84MwHzClFsZdhU+WHZhlAc2PbbfpgYqmZUlKuk=;
 b=EVGCwrBR2SBX2CeCn9FDk9HJ7ijJJ/1N/XDVVERv950ZWOgo65iUhSJESA+N7+KrZowdvuCXrDKSBCk0/T/LTj/ZL8/syT1C/qwzaEhVhLNEdMWbPYZFQJFGtvZh276wuW/wNj9ERZ6kYIF5EHT6OggNmRmXewPv/ecmrbwOHpVa0XZqGSFDZF1g5ViSaL5pETVV553q8ZHywC8ZEdkwVZcngYmp8M/z4aiU6RjgCOQ9sFW9lzkiaum4FTC2IflTYoVEs0EmkbZWsODDH+OoTyG7cyEz6Jeuh/DaqvrL1rKtTDchjSM+4KobNZDmBFOv2vZlg4YJXak9t8+he20ELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpw0n84MwHzClFsZdhU+WHZhlAc2PbbfpgYqmZUlKuk=;
 b=xxXDoyAGEOPdaPb+g79Z0f/yuXGAh5PVPCBYucxMoWdpczDBuTU2Ksy5aVDfz5K4oN1FuVlvPfeRMRNkK20IqG68tX+d/QgfThvfmXy8jFe7TnQLg+3DFrkiI4C1uzUjsM/i0z6unhcaU3RAqwGRLRUv75ViwCrYjO1hiyGT/ZU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 20:35:59 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 20:35:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210701104313.5b64a9b4@redhat.com>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm> <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
From: Michael Roth <michael.roth@amd.com>
Cc: ehabkost@redhat.com, like.xu@linux.intel.com, armbru@redhat.com,
 wei.huang2@amd.com, richard.henderson@linaro.org,
 Dr. David Alan Gilbert <dgilbert@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org,
 babu.moger@amd.com, pbonzini@redhat.com, philmd@redhat.com
To: Igor Mammedov <imammedo@redhat.com>
Date: Thu, 01 Jul 2021 15:35:49 -0500
Message-ID: <162517174973.564224.1039189315728194554@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SA0PR11CA0190.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::15) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SA0PR11CA0190.namprd11.prod.outlook.com (2603:10b6:806:1bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Thu, 1 Jul 2021 20:35:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e198c0e1-1ac2-4168-7364-08d93ccfd545
X-MS-TrafficTypeDiagnostic: CH2PR12MB4216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4216A7B7BD9D531F8FBAFD6895009@CH2PR12MB4216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sfJXFlHcz552D4lpfGiN2FoxAJE6RDxBelE049t7XQchM/HSv08BnJwGUMdP1GqG3/DArRogNXUOfHr73HDiVPucF3ccZPQwMg8euS0Udw0zBFkJYF2laPrP+EhunPT5jiOq9KCJByMbn52jyBQyz91BZe7pHGHYRilVTr2FlZannKRe7aJyxWEdPijVkCcUrGidIUe6DpsixohY8MwkPTuvsRWBdpXeZK2vEVVhgCSCbypVlw/iy8LJesMZ9XqDK087U1dd1sQBnhEcLrN2nyMU2Ve4k0JPB+Lwl1RD35UzmdK79gglkIKBTn0ScaydNzWtYZAj7uvw2oH/IMBW6l8xxunbhSNMeMZBA2Sz17FNoo1ytzT6AjDLqUfJaTQben+s6bpKvFRpPxF+98KTdXtGlz/Xc7vWjBcjIN5alwfN/lnamNiBy1fi1oER/miOpT5xEgATElEwYsNzlyGXw0L5pZ+Ap3PGFEq3yEy/9/IUtqT79piHFprJdgpM0OWTEYZWTONaN0s1g8RfQEDfDQGatSQ4pWMTRCuhDEffEy6Mnb1fXzT5nwTCcWVamoKmjwDEZBjkzJjNjYCOFaunmkzLBCQcKgrOUlHZ3GIPPWaCvkXa1T3meCxNHmxLuIOV0MAynZziLcSkwEmvOFoJZuOFxIMMsIjBi86JY1Wp1eH6+LCs/bfaiF9NYAdak3fRs1UkUOPUAZZOBTSq/FBWwUKpYBz1B61iNbgrS4vHlKe2fa8USEqNfesbbm4qIwc6Y5kV0T4GOwLi8OAwORI/qWrPk27r3u7RMkP2xzcYEmq6V5MmJWmthmzfhVJT2b8rCYOO0HFjjj30/G78iWHHCoaLGnUAjN5yzkh6mABaqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(39840400004)(376002)(36756003)(8676002)(956004)(38100700002)(44832011)(16526019)(83380400001)(6666004)(186003)(38350700002)(966005)(2616005)(26005)(6486002)(52116002)(2906002)(54906003)(6916009)(66476007)(6496006)(66556008)(8936002)(66946007)(478600001)(7416002)(86362001)(5660300002)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVo5d3JRM0J3dTBxMzF4a2xlRUdHVy9PUlRRdjNiNkk5Y21OMjBRRDNOMnpv?=
 =?utf-8?B?cWtVREY5ZE9EaENTVEVJSlFUVEZTWFNLYktIby8waEluUXA3RXd4bTdoaWlS?=
 =?utf-8?B?NTlGVUFrK3IyaDIwSjE4UVBaWUxBTXR2L3BJd29lU0h1Zm5Hd2FKZFpVRnIz?=
 =?utf-8?B?NWhiUHFmOEdRbHFZRmh1TzMwSkdweGJQY2JEWlFLZE8yR0JrcHl1M2ZyTU9i?=
 =?utf-8?B?bzlIUFFGdUpFU3FCVmlkQytMQk41c3JhMzRvaS9MN29PdWVTWnlrdXcrTzhl?=
 =?utf-8?B?NEhhVFJvdTVmcFlhdEFNaXRPZ2tnaC95Wm1VYXd2b2w0dXI3K3FFSndkcW1v?=
 =?utf-8?B?ZGhlZVRTcmtCdnU5bEpnQy9lZnZPVEdPNkd3dG5ZaDZDY0xZTE40b0p0a0JQ?=
 =?utf-8?B?S1JoV0YzcHRaYzVsclh4aHhyTk1Xa2lVSFpiY1dJUG5TY0hpdE9UeHBITTdy?=
 =?utf-8?B?Tk1GT0owR2Izd0hmWnhVcDVndkUwV0ZKMVNRRnpwZjBsckVWc284Tk5FYTds?=
 =?utf-8?B?OWhMcGJwYWp6TG9CYWhBcit6bk1tK0ZhMURjVllFb3N0c1dEaUZaUnh1MXNR?=
 =?utf-8?B?WkNrRzlWY3c5YWF5bDRBb0I5U3RBT1dUOVUrVXpzRFlvdUpDSXZLcm9CcTZi?=
 =?utf-8?B?ZnM4ZVJIYmkyeGZKZE03MU8yTXJSd2srODRDWTlhWWhoSTBTL1pHQ2h1NmNt?=
 =?utf-8?B?YWw0R3J1SkNxUWZHR09uWHJWR0pxVXl4MDB6Z2xyUFVLNjA2REJiU3VIUXlI?=
 =?utf-8?B?OEMyb1R0QXVoUzgwdWF5a051MVNscXJrUk44NWk5TWRLcy9HRnlUTGtUVno1?=
 =?utf-8?B?VDhLN0hva3RkVmdUY1RNRlpydmgwdGhvaWRuekozaC9oWFpOOHhENW9aYjVJ?=
 =?utf-8?B?TklCZlpqVU9ieXgxenZSNGV3c2dBbVRxWmpBOHZxbitQcWJkMjRaRmkvRW1I?=
 =?utf-8?B?QThGUXU1YkVPbWdDdEtKL1pJTG5nRXZNOFZSWDJEMkJ6NWpCczhqdDBKQkFu?=
 =?utf-8?B?SW5WakxTdHUyeTN4a3JlWXE2WGFGbmxoUEFBRGpNdzV1bmJaOWV4YnpBVXdQ?=
 =?utf-8?B?SFlnYmpiVmFIT0w4RzR2UFp4eG9CTm5NcmFhSm96TzRJSHRyN1RaVmVOWHpQ?=
 =?utf-8?B?T3BlNExBVkVIdzFHcmZ0TE0rODJINzJqOEZnZk5yRldXMmtkYkJjbnVnQ3R2?=
 =?utf-8?B?THdJWFB6UEFiUTUwSVVjNGxLaSs5RU10WnV1aDVWV3hDdFgvS2FPWmltUmc0?=
 =?utf-8?B?UXA5ZXQyRUFZN21HMlRZY0w3M1drSlJDV0w5Mkp2TFN6MVNnTlcweWtaVjRh?=
 =?utf-8?B?NVkzeGdIbkhlaGRsVlR3N2tGUExwcGFua2lTWW1GaVppZDdJMVNQKytrNmVT?=
 =?utf-8?B?Q29DTVp3VHQvQ0UveFF4QnBUK210cFFkSUVTZlZjWXBwZDlLRDdSUm5aOEY4?=
 =?utf-8?B?bEFkRkxJWTNIVjUzR3JaZ09QczZ6eDNqb25SRWh4bVZvb1pxZjQxN0F1Sncv?=
 =?utf-8?B?RGlPdldiSkZZRUF5Tmg1SmhYYmppaDFQYXp0NFJIR09zR3NjcDVhZXo5eEt5?=
 =?utf-8?B?M3gyS1hmUXRZNHdWYWFDQmY1akJSd01reWJMdHhDNmQ1WXJERlFka1lHaFln?=
 =?utf-8?B?dFhacGVDVUJGYmVJM05udkhUSjk3UFYvTG5ocXljSTJ0Y3BMZW42My9vOXFB?=
 =?utf-8?B?Y3dpaTdTZTZSMjJIcUtwaER6NlY4OXNzb3E4VHZlRWkwdVU3VzhuQ1R6b3dr?=
 =?utf-8?Q?PbzxqkUIl4ICJC5rgK+Fbf3lE+5ZGZmW/u8Ke/P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e198c0e1-1ac2-4168-7364-08d93ccfd545
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 20:35:58.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVh/9ysJPojmcRQ8ctinv1RoPpRZhHUJVlNbRVYL6fn7EJ/gcO9NC2k3LlBWOpGlEXiYfuKRHsKHr97zj/Xg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
Received-SPF: softfail client-ip=2a01:111:f400:fe59::611;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

Quoting Igor Mammedov (2021-07-01 03:43:13)
> On Wed, 30 Jun 2021 14:18:09 -0500
> Michael Roth <michael.roth@amd.com> wrote:
>=20
> > Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> > > * zhenwei pi (pizhenwei@bytedance.com) wrote: =20
> > > > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> > > > should not be changed to 0x1f in multi-dies case.
> > > >=20
> > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> > > > for multi-dies PCMachine)
> > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com> =20
> > >=20
> > > (Copying in Babu)
> > >=20
> > > Hmm I think you're right.  I've cc'd in Babu and Wei.
> > >=20
> > > Eduardo: What do we need to do about compatibility, do we need to wir=
e
> > > this to machine type or CPU version? =20
> >=20
> > FWIW, there are some other CPUID entries like leaves 2 and 4 that are
> > also Intel-specific. With SEV-SNP CPUID enforcement, advertising them t=
o
> > guests will result in failures when host SNP firmware checks the
> > hypervisor-provided CPUID values against the host-supported ones.
> >=20
> > To address this we've been planning to add an 'amd-cpuid-only' property
> > to suppress them:
> >=20
> >   https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3=
eff03e21b
> >=20
> > My thinking is this property should be off by default, and only defined
> > either via explicit command-line option, or via new CPU types. We're al=
so
> > planning to add new CPU versions for EPYC* CPU types that set this
> > 'amd-cpuid-only' property by default:
> >=20
> >   https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
> It look like having new cpu versions is enough to change behavior,
> maybe keep 'amd-cpuid-only' as internal field and not expose it to users
> as a property.

Hmm, I defined it as a property mainly to make use of
X86CPUVersionDefinition.props to create new versions of the CPU types
with those properties set.

There's a patch there that adds X86CPUVersionDefinition.cache_info so
that new cache definitions can be provided for new CPU versions. So
would you suggest a similar approach here, e.g. adding an
X86CPUVersionDefinition.amd_cpuid_only field that could be used directly
rather than going through X86CPUVersionDefinition.props?

There's also another new "amd-xsave" prop in that series that does somethin=
g
similar to "amd-cpuid-only", so a little worried about tacking to much extr=
a
into X86CPUVersionDefinition. But maybe that one could just be rolled into
"amd-cpuid-only" since it is basically fixing up xsave-related cpuid
entries for AMD...

>=20
> > So in general I think maybe this change should be similarly controlled =
by
> > this proposed 'amd-cpuid-only' property. Maybe for this particular case=
 it's
> > okay to do it unconditionally, but it sounds bad to switch up the valid=
 CPUID
> > range after a guest has already booted (which might happen with old->ne=
w
> > migration for instance), since it might continue treating values in the=
 range
> > as valid afterward (but again, not sure that's the case here or not).
> >=20
> > There's some other changes with the new CPU types that we're still
> > considering/testing internally, but should be able to post them in some=
 form
> > next week.
> >=20
> > -Mike
> >=20
> > >=20
> > > Dave
> > >  =20
> > > > ---
> > > >  target/i386/cpu.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > > index a9fe1662d3..3934c559e4 100644
> > > > --- a/target/i386/cpu.c
> > > > +++ b/target/i386/cpu.c
> > > > @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Er=
ror **errp)
> > > >              }
> > > >          }
> > > > =20
> > > > -        /* CPU topology with multi-dies support requires CPUID[0x1=
F] */
> > > > -        if (env->nr_dies > 1) {
> > > > +        /*
> > > > +         * Intel CPU topology with multi-dies support requires CPU=
ID[0x1F].
> > > > +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS s=
hould detect
> > > > +         * extended toplogy by leaf 0xB. Only adjust it for Intel =
CPU.
> > > > +         */
> > > > +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
> > > >              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F)=
;
> > > >          }
> > > > =20
> > > > --=20
> > > > 2.25.1
> > > >=20
> > > >  =20
> > > --=20
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >=20
> > > =20
> >=20
>=20
>

