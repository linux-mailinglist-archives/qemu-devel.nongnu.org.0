Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092AB415159
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:25:17 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8nr-0007gs-Rk
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mT8lJ-0005iQ-M4
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:22:37 -0400
Received: from mail-mw2nam10on2104.outbound.protection.outlook.com
 ([40.107.94.104]:33952 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mT8l7-0001U7-Pl
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:22:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noZN5E1QyQRjy0Cs69aaN0If2KISdRu2EO15Olhgnv5z2HYpyIKAaXiBDg8EUjccTwFDUsndfA7/kASMX8YPSlajGz7Fvaivr+QvVLtFP53q5fw2OZq3/Hxsuy8q8ieeblXpU87t1tNykRFa74ni9c2pF51WTBPkbWnwhOTbheeaUUI2niaS3NHNh37tzXOIZtl60M/IY/5l6O28B4g0EtmhmRlq7DIzY1vPyULvBh6CnnXeAHOzerBSow0E72RROGELZSF4BeqF7Hi2W/XuOd4ya7zq6T/yZQ5J4RpvgNni0ALRuyjrBKFtF5vDmh9BeF8kwtwEze8lCQ5CMoJd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LLa+hsitGJmNXQwVNxvBvvBpnV+v4OPSvInvT1Pbqk0=;
 b=GEgfjZPuKSdA78NRuj26SampXPGJRD9wIb1ye3+wXw2jTwDTZAaLTOF0uwIsLKP25rkK5tH/4M9poY+X2y9eXB3tJbXq3Ej0MW9sUrJklKK1Sbq28zT+dvB7AXYmFZsDr2KT6PDwMxZUHL81T4HZVqi7+bzSsZ2gDL5F6J81UNo/Ki1GPJombhrU4kC4mQ/IGJvG/yWcVdVJjFx9JViXbxWRPckJQAQsyazJtrXGqLndkSfn2THwM0BRnLTiZVES/VjMN5TceRovNU7VK7q26xUHDzL9qVF/cpuUg4Ka3OFHRvVZ1DRsdsSqBmjk9JleYZnDD/dKHMwgS2vWeger1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLa+hsitGJmNXQwVNxvBvvBpnV+v4OPSvInvT1Pbqk0=;
 b=qz/A+TQEePRpciAzU5SJIxpJbkEky4sUmJvtmtDHSWWYv3lq19u7KrJAE0dBs13EDVYXG28rHIf3MWK5LWismMH84a9Bpdde+Ke9Dotkn5X+tGLNHsNVZQ6BkQxAmyRslrDQL1ZL2oSXGuw/PUe70BmVtblpQCstwXoAETnTBTI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CH2PR01MB6038.prod.exchangelabs.com (2603:10b6:610:48::15) by
 CH2PR01MB5864.prod.exchangelabs.com (2603:10b6:610:41::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Wed, 22 Sep 2021 20:22:21 +0000
Received: from CH2PR01MB6038.prod.exchangelabs.com
 ([fe80::1cb7:3f23:aa3d:febc]) by CH2PR01MB6038.prod.exchangelabs.com
 ([fe80::1cb7:3f23:aa3d:febc%7]) with mapi id 15.20.4478.028; Wed, 22 Sep 2021
 20:22:21 +0000
Date: Wed, 22 Sep 2021 16:22:17 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, cota@braap.org
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YUuQeSFsmM6YiBCp@strawberry.localdomain>
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org>
 <YUpAXEYX0D27BnEA@strawberry.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUpAXEYX0D27BnEA@strawberry.localdomain>
X-ClientProxiedBy: CH2PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610::37)
 To CH2PR01MB6038.prod.exchangelabs.com
 (2603:10b6:610:48::15)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CH2PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Wed, 22 Sep 2021 20:22:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208949fc-e2a6-4f9e-c507-08d97e06ae35
X-MS-TrafficTypeDiagnostic: CH2PR01MB5864:
X-Microsoft-Antispam-PRVS: <CH2PR01MB58644910F4961941FEE3583C8AA29@CH2PR01MB5864.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yltm3lPUxXGMNRGiG8wF9G7VknIRivEEHVVkNZxs5yzk7IunkGWql7JZHrdpPGxJ0KDbj7jM4aV0VaWYIWp3Mn1ipgwh9TUNE8AV4IEhhv6hj/lEhB834wiKm0jORDyifV/n2b9pFbGERbRreM5wQlMQkiQeMaWtEyeW25qmCeoM5OTx2requ8TJHy2IwrgKATA93GoLgPfiiXnmEoayde5wSdVGMjpuxu9wLC1JiM5xaMN96T2ua7liwQAEwPeh7mBbfnxftd6Zal85SQsJaiVFdh8F11sVOYmaLGrKoRR3o51jfDItC2AQwp2VGPtflW/mJBBnCBTC5lrMf7w7YkCucjv4fypQs6XylfDkUCSEVnbJPokNeJpQ0649URqNIprPkO9mWRB1oG0cutUmKWDMqYZg7UQ16DIUcyRjydMRk5hPTyLRXtnYinbTxYYPevDLtBkUdCKQOKQ+9beQcntnyYSMVz83SnU4yFIE9FN0gVx1PgZ4fqEogOWaxSV0A42PYbBjcHzayIaMXyoSYndskJgYCGsMg8liPAO8q6kuZQRnsmwB9Q4dX567f+0wED8lqE7XT4etR75Pl777PIrc/vbbEUsk+dr0L49zGFQTj2Xlab5PmQ453gmliXIcbTsyH6GcoKAmvRLQxbW/Rd+A2QJXGT+vISAzOGSHso12glK+fr2W5sOnZYinNQyFke03Bf41AN3FlRIDretFRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR01MB6038.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66556008)(26005)(316002)(9686003)(6506007)(186003)(4326008)(8936002)(508600001)(7696005)(66574015)(55016002)(6666004)(52116002)(38100700002)(83380400001)(5660300002)(66476007)(38350700002)(8676002)(956004)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YocpCdL5OTdz5AsPoxF9Bk8QA3AZV84Jsmz0DSkHgkTlZf09eXbuJK0ItM?=
 =?iso-8859-1?Q?GIzeIfb2zVaZxrG728liUkmioYgg2dka07fGjBfB7bYumdge6jQCekUmk8?=
 =?iso-8859-1?Q?PIoVkJ0nY9Ygx5jERH3LhkxoxNR/bOgudF1dMdAiXTqlVK/NmIlWi2fuo2?=
 =?iso-8859-1?Q?WQWfHmf41XUgB+FtDNRgxtyRndMeFvBPB/5OV27OFRc0TmCffShRaXAMYq?=
 =?iso-8859-1?Q?nTAxGWeC5aL4Jj1vGdJ4WXnwepgYhDEYUwJg/dtg2Oz3xsBCn/m1umtoTC?=
 =?iso-8859-1?Q?Hbw1siUjiYgBWi6XrKI/yVrHAL9aonN072N72TcEb5hapXx802a03eg0GM?=
 =?iso-8859-1?Q?BgAfgW+tEvw7z0G93OysGmg+Nl8BN9PzONjXc236YZoFyMT/AcHqFv75hm?=
 =?iso-8859-1?Q?A9YK9pYxAicGj3uh4sSGWbOjAgyrDpRt8f7i71jgzVxlJ0og9ay91lccGp?=
 =?iso-8859-1?Q?o9FErhfIc4vUO8qKZsmAws03FEnJe1s6cJeuLTscKMbeT4A5J8hfyG6HpN?=
 =?iso-8859-1?Q?YZHw3T7t3G7JdAcE5cPsks8I/314wiIcCNUfZklXTM6QZn9BbMQimxBzXP?=
 =?iso-8859-1?Q?nPnKsY9uyIAE07y6izAMCZh1f+66R+kRIi3QW+GFfQaY25MXwiufbv7sUb?=
 =?iso-8859-1?Q?jTYyBYcoR8SFIYN5l5ryZ5uJGxrc06OeOD2mnEhnkMt2Lg7R9MxLF+C5Rg?=
 =?iso-8859-1?Q?PoKnmq+uZE6RCUWWOkrPu1sBldzwC9e1prGiePLJDi1uA2aaGVu4FddjSI?=
 =?iso-8859-1?Q?dqGmjTsqHlXKlv2+6VM6il7q+UkAQQWL52Bza/Ojw8oNfnK1PpICVAKUpn?=
 =?iso-8859-1?Q?OFmnWlvYgiaMUzjdhmaVFmVIbgrkP46qQ/1mqN7yMhOWICeW8OI9K5MVQg?=
 =?iso-8859-1?Q?k8BXUXcv4guWagySioaXVMtYtpCxiOoI4PxYRE1c5JcwIe87Pwfm7w0i3P?=
 =?iso-8859-1?Q?/MIq1tsHHbW1B763R2jPa5aphBJgMiDO4u3Kr1lkNTVfkPX407IuP9KCvp?=
 =?iso-8859-1?Q?sdynMixn0ADqOGYLGafpdP5svWli8GcOc8JBTfvbnR1c1lMjSEjwVzi6q9?=
 =?iso-8859-1?Q?4j4O6nspHw3IhulDzCYF2jFfR1iZnGU+qMPIjkaT80GABzPBdW+6CoZR/D?=
 =?iso-8859-1?Q?jDn82/vsNs9cAr/8ii+hNZJm0TVDPN9xikWQLcK+zlQJbniiqBk5gRjfuL?=
 =?iso-8859-1?Q?J9srItsl2yIQj1hZl3EPiBBaj8ckPs3zCEv1WHiZAJ90tyIaVML1YX8AIr?=
 =?iso-8859-1?Q?zkbasEueG5zJPcNNL3Yo8LA1MUTC/QQMrVUJ4IOOevFPWu+6G9GgFIfTbv?=
 =?iso-8859-1?Q?2oKuXn3tuRz75Rv4hN6TxrjJ9MvWREK8KQd21baQGle5TUT2W4fdfPkc7A?=
 =?iso-8859-1?Q?cPThLp6y9i?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208949fc-e2a6-4f9e-c507-08d97e06ae35
X-MS-Exchange-CrossTenant-AuthSource: CH2PR01MB6038.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 20:22:21.1906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dV/a5YfJqgMOdaypt/5h9VFaKe4mBwIG2dW782T3ngFIYnBIdv3wcGFeJ9vv0kOYb5jmk2nK0BH1TMkocav+dWDor2zBMDPKD7VsnOHnfouNByYXdsvGQyKFqIOoJiPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB5864
Received-SPF: pass client-ip=40.107.94.104;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

On Sep 21 16:28, Aaron Lindsay wrote:
> On Sep 17 12:05, Alex Bennée wrote:
> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > I recently noticed that the plugin interface does not appear to be
> > > emitting callbacks to functions registered via
> > > `qemu_plugin_register_vcpu_mem_cb` for AArch64 store exclusives. This
> > > would include instructions like `stxp  w16, x2, x3, [x4]` (encoding:
> > > 0xc8300c82). Seeing as how I'm only running with a single CPU, I don't
> > > see how this could be due to losing exclusivity after the preceding
> > > `ldxp`.
> > 
> > The exclusive handling is a bit special due to the need to emulate it's
> > behaviour using cmpxchg primitives.
> > 
> > >
> > > In looking at QEMU's source, I *think* this is because the
> > > `gen_store_exclusive` function in translate-a64.c is not making the same
> > > calls to `plugin_gen_mem_callbacks` & company that are being made by
> > > "normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
> > > least in my case; I do see some code paths under `gen_store_exclusive`
> > > call down into `tcg_gen_qemu_st_i64` eventually, but it appears not all
> > > of them do?).
> > 
> > The key TCG operation is the cmpxchg which does the effective store. For
> > -smp 1 we should use normal ld and st tcg ops. For > 1 it eventually
> > falls to tcg_gen_atomic_cmpxchg_XX which is a helper. That eventually
> > ends up at:
> > 
> >   atomic_trace_rmw_post
> > 
> > which should be where things are hooked.
> 
> When I open this up in gdb, I see that I'm getting the following call
> graph for the `stxp` instruction in question (for -smp 1):
> 
> gen_store_exclusive -> gen_helper_paired_cmpxchg64_le
> 
> In other words, I'm taking the `s->be_data == MO_LE` else/if clause.
> 
> I do not see where the helper behind that (defined in helper-a64.c as
> `uint64_t HELPER(paired_cmpxchg64_le)...`) is calling in to generate
> plugin callbacks in this case. Am I missing something?

Richard, Alex,

The more I look at this, the more it feels like the following
AArch64-specific helpers may have been overlooked when adding
tracing/plugin hooks:
	gen_helper_paired_cmpxchg64_le
	gen_helper_paired_cmpxchg64_be

But... I'm still not sure I fully understand how everything I'm digging
into interacts; I am happy to keep investigating and work towards a fix,
but think I need a nudge in the right direction.

Thanks for any nudges,

Aaron

