Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5536721A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 19:57:15 +0200 (CEST)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZH69-00055U-MU
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 13:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lZH48-0003vi-NM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:55:09 -0400
Received: from mail-ve1eur02hn2218.outbound.protection.outlook.com
 ([52.100.10.218]:35643 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lZH44-0006Nq-3U
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:55:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWsunwMiQsUMTRKRwRiq9CMMeC3/+61L55l0cCwpC9/gRECpHxnEJtZuzo5HvS6rCP0kc1MkbAEisD20rfGY5IIT0fG1WIWKA7s8ErotUs0YUDJM8cEBci+mU27Vz0/oVS76cILS5EYe0PJ9Z9RyeuE4O6DzW+gNYAb5nuCNRdjYTAsSWAR8y+dOEzfbik5jspTzV1DHKCIhO7E4hBMs+wXplywi/q1pPOyVd0xGnL601FTig9TXcxoybzA8DcZwIxKXmo6HXM/epQS9PwbOZHgNY94hsYHS1reZRjEEkSwgBqMyTnqXexoNX/Ls+uCrWZng3FRWq/ttBGzgWJi6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/Crmu0LMVyFt4oUq1QuPfYJnhKMKYXfjRjdJsWqKFE=;
 b=HUzhrbUEjn9qTDFiLkHdyNb259XKARiICfb4nmgOCWvOPxDlHMT3waDP1a1ggkF0XVVMMnD9b+9AaxFfZ4GB7kll2R3N2SIihkB5M6DH9BCiENlq2vqmuyuJysKe377VRRxfvLRbmMwvUm1bHARQteV4c3kR37qc6zcNBPWMeaUavWeA8VB63NKhEBhMzHCsNET2is5PuWu1ejeRMIOl+vzLg0lzIfoT6jSDprnlXgme7Yf7y5E/DXQL1JpvWTXQeUE2vR0oO+f1a+/4A+sRZSI/f+5U1VTgBdLdPVOWQ31nbYKpKa5NbpAsZsUs+QKVwvdK6QOZDA2vCeZsHgZEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/Crmu0LMVyFt4oUq1QuPfYJnhKMKYXfjRjdJsWqKFE=;
 b=pRhKN3EsF/KXECg98pjmC+SEwy/t5l4V2IGhkZc9DraO4AwouumKE0ITrshulq7eJdTuryf3hX9ZrZOXTV+YArFmTiP6rzj1T5g3fr2egCsMfxn2aRX8jP+aWOhoh0bXs+ikcjATSmtx6qEG8Fo+3So/gCavhtzqSdcLEkQbTLw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM4PR08MB2915.eurprd08.prod.outlook.com (2603:10a6:205:c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Wed, 21 Apr
 2021 17:39:48 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::7d3f:e291:9411:c50f]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::7d3f:e291:9411:c50f%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 17:39:48 +0000
Date: Wed, 21 Apr 2021 20:39:42 +0300
From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210421173941.GA927665@dhcp-172-16-24-191.sw.ru>
References: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
 <20210420170900.utg4qzqkefdc642c@habkost.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420170900.utg4qzqkefdc642c@habkost.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [185.231.240.5]
X-ClientProxiedBy: AM4PR0501CA0056.eurprd05.prod.outlook.com
 (2603:10a6:200:68::24) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-172-16-24-191.sw.ru (185.231.240.5) by
 AM4PR0501CA0056.eurprd05.prod.outlook.com (2603:10a6:200:68::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Wed, 21 Apr 2021 17:39:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d149c6-569b-4912-331e-08d904ec7599
X-MS-TrafficTypeDiagnostic: AM4PR08MB2915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB29151E9146E727137E1FC7CA87479@AM4PR08MB2915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(376002)(346002)(396003)(39840400004)(366004)(136003)(7696005)(54906003)(52116002)(186003)(38350700002)(9686003)(8676002)(44832011)(66476007)(316002)(478600001)(2906002)(6666004)(5660300002)(6506007)(1076003)(107886003)(26005)(66556008)(38100700002)(33656002)(956004)(16526019)(83380400001)(86362001)(4326008)(55016002)(8936002)(6916009)(36756003)(66946007)(30126003);
 DIR:OUT; SFP:1501; 
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DVZGejRPAWTdcRSj6BepyxWUoKxrJdPYqzxUb/ulZY2AfdD/EfkqdiexrJix?=
 =?us-ascii?Q?Z1UjrF6IsrVGpDmLyIwKGmCqWvVBdRazbZuV/hi0iqattVxqZ0sf/iqzussy?=
 =?us-ascii?Q?3jOVm1kPT2M1m2We+4qr1mE0kZQ/vYe7/B4/6ZdIqZQwj5JbGxHtUIxBvCXZ?=
 =?us-ascii?Q?gFoPMY9jEOloW8x3zzdd7MyaoRwbeL/rZdnECCu2aFBhSmVeMvi6cBSkKq9Y?=
 =?us-ascii?Q?18Rp150tjeuQr9uy99vsx28xTNKN3nkenvU4b5pUx7hNH6WAvO4Vvd65Ld6H?=
 =?us-ascii?Q?g2+d+xZJNUXxsdHleO6AG4KA9dEBbWC/iJgYzOfWnhasgxd1Pvp4C9sC28iS?=
 =?us-ascii?Q?coyPKEWOMWqsP7XtnQ/Sxyg6/2+Yn/domZrTKvd+03IELlNhRFFE8d9DvRVP?=
 =?us-ascii?Q?TDnkj1+vjbU76iD+FsWv4LsBXZyheRFEziKg/HihbuuG7iux8wuoCDs0ldRz?=
 =?us-ascii?Q?ruhOKrHv//MoavqGPan+Z2B/sYcimt98xIHwy5cQtAbaK/DBWASRCXnKVg8+?=
 =?us-ascii?Q?pDKKtbVEbvfWJ43eaaXWoflYZV/WTTkrt7QZteMj0CaCfBAiDiZgx8RXkIU5?=
 =?us-ascii?Q?HNSsu9ucvmYqIqGWwCV7du8B1wmoMkJQ6+GN8z9TgrnNRvH08MFaGQuZxlsi?=
 =?us-ascii?Q?bitsInyvymGxDvsOi1UV2qGJsU/Z58hqR1IK0yJnMpujubGjRDEa8wMLTnQX?=
 =?us-ascii?Q?j/ROiBb/ITTvW0DJsv+MIsyhDnejLgpReVuImSAik1RcyFboJ6ozHxMOJtqP?=
 =?us-ascii?Q?BsDaXh9p+wwD6ALC+CDhvosKMfFhp0qxFUxzDAbsS1urzgjH+r7aYjEgxamj?=
 =?us-ascii?Q?2Vzvkh/dAKoSPSWk9XBkQzYenGEYkdE7yoiM812e07VrLUCFBdhX3l467NyN?=
 =?us-ascii?Q?ZYAjrrpOduL4qTF1iyIQbp6wd63mKUEOLGA417xWHfaJK1P5VdRfrP/qD0J0?=
 =?us-ascii?Q?NR0CN7aFzSOBRvoB7hxuHGKF8ffJrAM44VV/h2dZlZY=3D?=
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3lIwBWXuUzUCxwBkmcrKNVtFEGGktEYse2KhSuH4vU7LV7B6iYdVG84ML31q?=
 =?us-ascii?Q?EZgd6n6KkXf6rQTuUu5Lyf8Px12dobtW6UXg+DcWjBDURoNG9OvFG1XWUsG5?=
 =?us-ascii?Q?pUyeRs02M/jT4sGsg0TmCEvKGQeg055Y+MrDFFHRdLGENZvfZJZJxCKouGw6?=
 =?us-ascii?Q?M7z0swNQEytn9jfQjiz7lCkoOpxmGQ6WTzj8Cfko7WqtKrqRnot6hSfcsTPB?=
 =?us-ascii?Q?B99MCLDjIUIsoD2huRIjpiLo7bdTIGNAM9vJPCNAfF89rMXSRyA38fBrNPUn?=
 =?us-ascii?Q?e99k/gwR0LWhwmiea6QhouEMf0H4+1sm7FdKCC7Zo4w8cVXJS2bSwge8H818?=
 =?us-ascii?Q?Xm0eaOMbK1CS5PFn9AOSiSHp1aZYXo+rAZIWabyAbLwoO1oJr7WUhx/3NcKe?=
 =?us-ascii?Q?Ffy9Z+nW0z+O0K/TsMbMjFnNW2wq5QWV343dPob+vTKIWF4n38v5cjslmRoq?=
 =?us-ascii?Q?vECZBQjkNHLm9i/k28xo2xlzLu3MBsNbhFFgWeEs2RjT8yJTtkF8aHoKNGjg?=
 =?us-ascii?Q?ZpY4hQ9da3SzONN1h6oTGjdeLSrQbwXHzarrpawL06zVKjDXwc5By/XH0tVy?=
 =?us-ascii?Q?Rvl7MMn5hPmr99f6G0gil9aDNUdGu4L/0iD+1wJaW00etSIbMabqJz4CizVE?=
 =?us-ascii?Q?jhhEQqhITa1tLzF7FiKPRJ7M0Hf+sdWhmZRzsQrMxXxzrv0q/QS4jbvMGk38?=
 =?us-ascii?Q?763J2SHqFHLC3jQusheamr4PMWgWr6Hh1mT4+lIJEPMWi+ASAGURfN5ICyiu?=
 =?us-ascii?Q?Pc6aq8FNhUCiTV2mmsoCXhCsYxS+fdYXi9X89YUTRXVFwbHPMvKVezHFmKp0?=
 =?us-ascii?Q?3MDpYsW9o/trZouKkVrRWaJfNeiHIQTbmXtlDvPekXom0E8+bc89iY0COsLs?=
 =?us-ascii?Q?ryN2pIjNtImqze4IN60Ypqu7/xrA/qLpoSmgde5d+5sBPMUxnfW1tjOeweQB?=
 =?us-ascii?Q?lnSpJjzE22cx2bHj/sPgufkIVpRiayx/IwTUBvxlMk3SKrS8kTJtDILFmtLp?=
 =?us-ascii?Q?jiVxYX9ciZ41C3oooLrCLv3buaOi4njLPj2PNq5HL1qHFpPU5wE3aCl0q82k?=
 =?us-ascii?Q?/9oduD7iyyPM6EeAiNe00i0pC2ujSez3pWI8YyBq4rbS+vZOVNdPppxO+O0b?=
 =?us-ascii?Q?qQaTJfv0v34XTKRDlo+hGOd2XRwFftJuduv9nZlMOlAjfARnhembHRiI5V3Y?=
 =?us-ascii?Q?jx7FVj+44XenVMbOUIZNpac9scLfH55eNJPK5489x+djcO+rLRd+gu0PTIXm?=
 =?us-ascii?Q?x7/8NLfRV32kl0Gqu0VA3usNX1zAq9T/cE5r4NU5lv3aFdwWBBSQ+7Qc3dYS?=
 =?us-ascii?Q?lCPag08zSTCDuokFvIST3Mpq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d149c6-569b-4912-331e-08d904ec7599
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 17:39:48.3185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxHzkaFC5isHbcXeNW40aMmg0XSphzY+dAMvS5POHX9Gt7SUDN5Kq8L5lEWplBtupkR3O9RsE5AR2/LYWTL0dHGsew5VSiphT9yY3hXuf5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2915
Received-SPF: pass client-ip=52.100.10.218;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

On Tue, Apr 20, 2021 at 01:09:00PM -0400, Eduardo Habkost wrote:
> On Tue, Apr 20, 2021 at 07:19:40PM +0300, Valeriy Vdovin wrote:
> [...]
> > +##
> > +# @query-cpu-model-cpuid:
> > +#
> > +# Returns description of a virtual CPU model, created by QEMU after cpu
> > +# initialization routines. The resulting information is a reflection of a parsed
> > +# '-cpu' command line option, filtered by available host cpu features.
> > +#
> > +# Returns:  @CpuModelCpuidDescription
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-cpu-model-cpuid" }
> > +# <- { "return": 'CpuModelCpuidDescription' }
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'command': 'query-cpu-model-cpuid',
> > +  'returns': 'CpuModelCpuidDescription',
> > +  'if': 'defined(TARGET_I386)' }
> 
> I was assuming the command was going to get a CPU model name as
> argument.
> 
> If you are only going to return info on the current CPUs, the
> interface could be simplified a lot.
> 
> What about a simple `query-cpuid` command that only takes:
> 
>  { 'qom-path': 'str', # qom-path is returned by query-cpus-fast
>    'eax': 'uint32',
>    '*ecx': 'uint32' }
> 
> as argument, and returns
> 
>  { 'present': 'bool',
>    'max_eax': 'uint32',    # max value of EAX for this range
>    '*max_ecx': 'uint32',   # max value of ECX if there are subleaves
>    'eax': 'uint32',
>    'ebx': 'uint32',
>    'ecx': 'uint32',
>    'edx': 'uint32' }
> 
> ?
Hi. The interface that you suggest looks good. But it has one critical
point that deems it unusable for our initial needs. The point of this
whole new API is to take away the strain of knowing about leaf ranges
from the caller of this API. In my current patch this goal works. So
the caller does not need to know in advance what ranges there are in
original CPUID as well as in it's tweaked QEMU's version.

But you suggested API is not so kind to the caller, so he would need
to add some logic around the call that knows about exact leaf ranges.
If you have a solution to that also, I'll be happy to discuss it.

The obvious thing that comes to mind is changing the exists/max_ecx pair
to something like next_eax, next_ecx. But this idea will probably require
the same amount of complexity that I currently have in this patch.

Thanks.
> 
> -- 
> Eduardo
> 

