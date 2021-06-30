Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAF03B8921
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:24:59 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfpS-0002j7-VR
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lyfnw-0001LI-0b
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:23:24 -0400
Received: from mail-bn8nam12on2062b.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::62b]:27745
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lyfns-00068S-Ek
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:23:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6sFb3Z6KNF5INVrRHK7DBuOWNhw1JzEFuxcQHpUasyjd6N/0o0H907LdXxOKBxJ3bf6Y5Ebf4VmNiASVSUcBZPF46NRZHPuJkhGDybsVLBSSwM6nXO59BbfUR7JQjN+XCi6XMR27ap/l52On612o6xFypa72I3oyNrLG0GfwrDdZ0CfM+AIz4izIhfF9gcJtx1OQ4eRS2X/zbmYgyAYUatrlNfawJax4g/IKdNMo0Ljbe0Hn7jVzkK0Fy0xLvUDCRkzBPsKJ17WpFmgwhZ3LWZnrUuEfzL7Rguuh0U+4BOZsuzfmq7+qZuK64tgo3BBIXoVeSvyyYilfXQefuHLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDLVYlQU0NJebPp884gkiRX1FscU6eKML7djIJolyEc=;
 b=Mfs+IQWdJY2yUOvA463p4CHC0sn6dScTi2LvO6Pmu7wNbqxD9JHIXQedIiUo/Zf4SVQgP/2TW/GfA3YY+G4anJHx5VaA1SCavX069cc01jsTLAv0QwLnY9g1Jqmo6B/2ar1BIEqnIw+haliRPe0+faeRCup/MVaN1oE5twL+uPusaqzREoVViQw/Ht/DE8L6aRRSsEzPh5yfk/Ro+GSQAdXk+5C1zQr1e8sl45ckxDbUc0eVi8H9C52LbHg9LbSK1fz9iSgmydcRd3Ue8NxK3Q4t1hwz/bJongYJqL67cHZovcZKp4zjVCXVt+j8Owg2Hbg4b7o0CEjn+z4vUYf/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDLVYlQU0NJebPp884gkiRX1FscU6eKML7djIJolyEc=;
 b=vCrUUolH9UqPxTPy0792uRh0K9uv2DtCVf8RMwf559JDz8fsYHjVpdIhmEmdfLep9GaubzE7f2WD9AXERnCg0r15SUSYkM/DnH1ueg7o1ED2yi9oj7soAQfChwPrnPbw+1tuv8no20x/QqDEpOGzGa1lFW4QwOtB2OTrSVV8EuA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 by BY5PR12MB4997.namprd12.prod.outlook.com (2603:10b6:a03:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Wed, 30 Jun
 2021 19:18:16 +0000
Received: from BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::5919:5394:83fc:c867]) by BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::5919:5394:83fc:c867%7]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 19:18:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YNsoyqFvzXL0FXC8@work-vm>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
From: Michael Roth <michael.roth@amd.com>
Cc: ehabkost@redhat.com, like.xu@linux.intel.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
To: Dr. David Alan Gilbert <dgilbert@redhat.com>, babu.moger@amd.com,
 wei.huang2@amd.com, zhenwei pi <pizhenwei@bytedance.com>
Date: Wed, 30 Jun 2021 14:18:09 -0500
Message-ID: <162508068941.526217.2563710865841096339@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA9PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:806:27::20) To BY5PR12MB4131.namprd12.prod.outlook.com
 (2603:10b6:a03:212::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SA9PR13CA0135.namprd13.prod.outlook.com (2603:10b6:806:27::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.13 via Frontend Transport; Wed, 30 Jun 2021 19:18:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef92632e-16a2-4943-5a3a-08d93bfbcfc3
X-MS-TrafficTypeDiagnostic: BY5PR12MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB499782569EB93D2BBC7732B595019@BY5PR12MB4997.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bl8JyOJ7ZWwo/JsblA9U+ERJ7EwgIjpml/cPnbYHMMgoZgdJdR3JpjlScE3V5k9bmOshtsdiRMVRKXKDSXClCDBnET0JNWGh6NfI4SwjExw2+sjyAwgxG3MShLSUsi6cstmvJEM8TqoRCYYRcKxcoyeTQHSQZo2HfeA7wJvZv0TH51kJQTzL8dgT/EYgbuhq4Wp54jVSjetivom+UjdtTTVQEZubeqz6DnnbMvYTi39fhUJDydftwq4G2oV8gPUBxB3cBFVg5bQc2FH6iwfUW9U/8RjB7jiKRWP+OFhSnHfBTXT7DQ6oPpmo3lQFrNAa4xz2OjYDiFiEgrHaU5Rr2SpkVMeJgGv94t32xK0emHvijgK4FoC5ZNpCdzP2/nHmk5wDLAeDLGOrfo24LX0GMrf9WrInV4dDn2XTlvlbDmpDB4v4HV5LrzISomxcYoRlaeWkcM6CUjH4AxeMNmzQ2GuLEG7orJ5J8rAT1G2z9MBZi4ntSRXMorypDai14SoZl9ZWG+cT96Oill/WwZPYy6LJNHwuUeoxpR+3S0PiQawRu0+QgiPrTvxsoG8mQJSYhpLV9g6E6cdUyPNysi2g0i2JpQwwfx8f8XgzOHEQKIxd/PSCkVyvWubY+kXGGKiQECLgnedf5Jjh2C6/MowrP4HgXWOcZfFn/Fs/lL9sIwD+kSfYswGlmWPGjxk+/CqXtH4TsZFjxuIhppQmV2tlPVwvnuqysU2ei9WJe6AcaNZQwghEN62Ap7UsMUH+OyGzYw+BpaMZ1KNRAgWzhtg0+hKUuhXyiwmT6Lzypr4LTBwBZPTZIKYe4AgnNRaG+DplA/FQw1g3xcyeZikcYAgbCuxIXDOqkRQXjyy29mhtINc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4131.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(2906002)(6486002)(36756003)(66476007)(66946007)(4326008)(16526019)(83380400001)(186003)(8936002)(38350700002)(86362001)(66556008)(26005)(38100700002)(8676002)(478600001)(6496006)(52116002)(316002)(44832011)(110136005)(2616005)(956004)(966005)(6666004)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXkwNVphT3k0Y1A4dWVlVXVNditUZzJVSVFZU3VnSGpCVVlGM0RRb3FjM2ND?=
 =?utf-8?B?S0k2a1JlNFpYUlBxaC9jSW9jYW5QWnR2SVBReWtWK25zNkpXRUpPZXJBVytC?=
 =?utf-8?B?RlpaL3ROQ0E5aUROT3lQOEp4d2x1b1dOZFpJeTQ0bEJ4aUdSNndEaDJ3RUtj?=
 =?utf-8?B?dTl0dFFZMlFCLzlRMVZEclg5QndPbEFoVHRIcHRKbDRjZVgwbDJhdFZCNVhD?=
 =?utf-8?B?bUZYUU9qUHFRN2h3RGxJTkJ4ZFBRZlJRLzdIcTFwLzkwcHRNMkhrd0JmN2FS?=
 =?utf-8?B?Z1RFZmlOSFRNOU4wakRvdDIyQWx5bXA2RzFoY25UWVNBYnJrZ1dYdlU0aW9P?=
 =?utf-8?B?VHJFMitOUi9QZXVLVDVscVB6c2NrYUJFZVBHcGdZQ1FZSDFiT29kRG9mbjBa?=
 =?utf-8?B?bS9nVzd1dXhxNTVtaXBubHBxWFFTN2tVMzFNc2psM1N1eEFDN1ZKQ3dHL2RB?=
 =?utf-8?B?aldOT3JTNFRvSzVOV0gvZTR5VGk0NzRDamhDdEFuYzJDeEJneStKTWQvTURv?=
 =?utf-8?B?THFvTWZTK0lrVGduTXgrMTB5ajhXTyttNTA0Yy9lUXRjSWhuWit0TjhnMDdD?=
 =?utf-8?B?cnEwZSt3S0tLN1gwaGlSNVRnUkhjSmtETFJpNERmK3BOUTJ2OXQxNU5MOSsy?=
 =?utf-8?B?eEl5TFhwbTJZOVgyVEFTakNldHVFVk1JL3FySmRaTDRmaFQrYlRSL2RzUzk4?=
 =?utf-8?B?NzBoeVpiaDhLK0VBSW9EbGZNVDVKUEJGcGFWd2JJZEthZ1NPOURGMlpNUkNw?=
 =?utf-8?B?TGExUEtXWHBySnBLOXQrVVRpM1d3K3VlVWJuc0pYVXNUOEE3dUo2bjZpc1FS?=
 =?utf-8?B?MFVSY1hhNWRueXdIVXVXMzI4YkMraVB0ZEN3V3NxTUk4UEpLektqekVIalhl?=
 =?utf-8?B?cmF2eGhUeVhDWVRkTGhiSHFNWHZUN1J2L1hXNUo5SjJTVEtpaThlM1hlcSth?=
 =?utf-8?B?MjdVa0s1TVhhWmxScC92OXY1d1AwQVFva3pGZzNqaDNmenJvblZEQ1V5c0gy?=
 =?utf-8?B?UVpCRlB3amVVaDZUM1RuS2dHNWdSUkFiMzd0N2FzQmtuRFpIWHZZU2dQcXQ4?=
 =?utf-8?B?Vis5RW5MWVhHa2l0S1dJQ2N2OSttSmdueEpHUzZ5N3pFY1BZbEk3NklZRzBL?=
 =?utf-8?B?WC9YL2lWSnBYcHhxWExJTVBHQlJpa0RHaVd6V2o3QUx6QUtJZW54ejZFdGlR?=
 =?utf-8?B?VUhNeEg4bVhMNlVTNVQ5ZkFxSUZ3Mi81bm9CVzRDN0JGOVBsSVBCVHovRER3?=
 =?utf-8?B?a1ZwNFJHQUpxYkpzVmhZS1dqUEV0ZVNoNWs5ZHdCMFdkUzc1eVdueUFkZzhW?=
 =?utf-8?B?QzNWSExhVm9lTWk3QVRmamZQK1M0bEVUOWwzZVo3RkZvdGdzaEtOeG5uS1dx?=
 =?utf-8?B?TDZHN3AycFRqQUE4d0wzS2tkQTZKT3FIL09YZ3ZPb2lqYTgvRHF2YmMxc3BO?=
 =?utf-8?B?VVFwZGx5RWl2dnQ0VHlEUUF6elBsREF0QWxRVXlzZDRXa2pDSkNPRE5CaGl2?=
 =?utf-8?B?SEtMM2JEUi9HbGppaFFJOFlaMFViTzlBYkNQclVQQ2xJc1diZm9WeHdVOGd0?=
 =?utf-8?B?NndZT2l1UG5lemhOZ3hjUVdMK3ZqZkIyaUFyUnpSLzArMnlXaEZUWVFmd001?=
 =?utf-8?B?VitPaC9HSlQ5blBPTitYT2xvdnpoZy9EaTBRNncvNGUrRDQ3M0VNSWJmbW9N?=
 =?utf-8?B?Q0pUZXZ2Tkx6N1QvVVlYVlk3T1VUZnRGaHg1RjBSRHFWbUtnOGFpcjgvVXFq?=
 =?utf-8?Q?tC4yL7E+wqb8ibMx7hagURUf2NIlWA4a7wJNn0x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef92632e-16a2-4943-5a3a-08d93bfbcfc3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:18:16.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bvl+osAyUquVRPaVCGRLtz/l/tPQVgiYTdAd5mhamvxXB+8XyZk4ympm3mbuEwvQ+PRRsJeOTIrvQlHjbIWm8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4997
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::62b;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> * zhenwei pi (pizhenwei@bytedance.com) wrote:
> > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> > should not be changed to 0x1f in multi-dies case.
> >=20
> > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> > for multi-dies PCMachine)
> > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>=20
> (Copying in Babu)
>=20
> Hmm I think you're right.  I've cc'd in Babu and Wei.
>=20
> Eduardo: What do we need to do about compatibility, do we need to wire
> this to machine type or CPU version?

FWIW, there are some other CPUID entries like leaves 2 and 4 that are
also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
guests will result in failures when host SNP firmware checks the
hypervisor-provided CPUID values against the host-supported ones.

To address this we've been planning to add an 'amd-cpuid-only' property
to suppress them:

  https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff0=
3e21b

My thinking is this property should be off by default, and only defined
either via explicit command-line option, or via new CPU types. We're also
planning to add new CPU versions for EPYC* CPU types that set this
'amd-cpuid-only' property by default:

  https://github.com/mdroth/qemu/commits/new-cpu-types-upstream

So in general I think maybe this change should be similarly controlled by
this proposed 'amd-cpuid-only' property. Maybe for this particular case it'=
s
okay to do it unconditionally, but it sounds bad to switch up the valid CPU=
ID
range after a guest has already booted (which might happen with old->new
migration for instance), since it might continue treating values in the ran=
ge
as valid afterward (but again, not sure that's the case here or not).

There's some other changes with the new CPU types that we're still
considering/testing internally, but should be able to post them in some for=
m
next week.

-Mike

>=20
> Dave
>=20
> > ---
> >  target/i386/cpu.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index a9fe1662d3..3934c559e4 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error =
**errp)
> >              }
> >          }
> > =20
> > -        /* CPU topology with multi-dies support requires CPUID[0x1F] *=
/
> > -        if (env->nr_dies > 1) {
> > +        /*
> > +         * Intel CPU topology with multi-dies support requires CPUID[0=
x1F].
> > +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS shoul=
d detect
> > +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
> > +         */
> > +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
> >              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> >          }
> > =20
> > --=20
> > 2.25.1
> >=20
> >=20
> --=20
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20
>

