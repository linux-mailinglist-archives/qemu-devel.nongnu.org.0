Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7648563000F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 23:28:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow9pG-0006R9-Ft; Fri, 18 Nov 2022 17:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfehlig@suse.com>)
 id 1ow9pA-0006Qi-Fk; Fri, 18 Nov 2022 17:27:04 -0500
Received: from mail-ve1eur01on061e.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::61e]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfehlig@suse.com>)
 id 1ow9p6-0002T2-QD; Fri, 18 Nov 2022 17:27:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrMFtBEMyQAbN1IR8RPRjCVQGyuQglkhcaOfrJunhuwL0Nb4RHjZb31VaB/mCndGIR9RzCPgv+jPxktVUT9pt2bVKCSQa94rMEnL1BLH4+cX75GPGE8p99BfVcgjlaudyNxhpSGtxpYNQodxC3QOao4NOEigeucMmoQpQd0GDV/3myP9V90jGQoL0INOYZ+kVZ2hwUqV6RvZyLC5XFtU95gE37yBNDlqhJ2AMd0lfYWNqX2QJq0rbiYzuksyjO14l5Ayo18oulxs/L2gIW7mQdySmbrGt4AmD3rVtGzuTBBD5gUJzoI4PePw0qaQgMWbPuB/MkQLFcTcAvVAi6PSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4Xf0oSJBTsPU0aZ7DTLe2pvYNcu0P1+Fj6anKqht3o=;
 b=QVgaYzwBNwHtcDxvTZGGfdh9ujqHluea9OBw4qQtTi+2WWAOTbwdirLHrJJpDfD+QSAqwttjeWDbvZ2rTKD5FnwuDxTuN85v1RtYcsB3j67iZ2gGRB6OWG28PTdDaUChGg/h2g8hO+8n3y9UCIkyfu2YQpRg3PrUYZhnudyhcEY3JWIbVC2aDf0ZTGoE8pSEs580ePNDLHJwndLu42y/Xt/YKTU/YyLkBpdHBQ+qlDvsxg5HUqo1QyKoHL7B2/1MRRM/xqA+fIT7Dc/00U8xg7zd7BT0qrDkQrCZ5+aSIzarDCwYeTCanq0FkBqr+7SOH7YomVAo09BAC8/k1XVnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4Xf0oSJBTsPU0aZ7DTLe2pvYNcu0P1+Fj6anKqht3o=;
 b=4DUCnE3cBfLLJEwhSVZxj/QSN54QHbLNi6LWC1agpgkpVSqYxOuAxccBMLJncfDkp+KVnX/nqDeiFf7pNRcn2pd1jgGCyydRZTapvUsBwxI4/aEVgzzoP8I6fUsnReO+WDH92zyuZSIlvY7rN61jqIEjH3FR10RatKjofHd5TKUK327CGl8bAfLZNik0JXGWoFi2pbGzLmlgaYKo0qH3peF/J+fHPQF8Gon6IPuFHt0mEo4l59Fdo8sWM/HB96ZWCGjhBBNMzABxiG8VVP28dBZk056d/lyUF4u6dX1g8PCSjEmCAH0z9zTczHDufgDxtdqFdbhu36Xff9eXqCoblA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com (2603:10a6:208:c5::16)
 by DU0PR04MB9347.eurprd04.prod.outlook.com (2603:10a6:10:357::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 22:26:52 +0000
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::3342:8b15:bc9b:3d47]) by AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::3342:8b15:bc9b:3d47%7]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 22:26:52 +0000
Message-ID: <980e2701-5271-8977-c574-f5b64e80e02b@suse.com>
Date: Fri, 18 Nov 2022 15:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
References: <20221108162324.23010-1-cfontana@suse.de>
From: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <20221108162324.23010-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To AM0PR04MB4899.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4899:EE_|DU0PR04MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a74329-c9ae-485a-054c-08dac9b3fdf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GQQ9njnTn+tirVgxyX0RAWr/gwCEqIq3LU4QAsnL9HEr0iFKVWFr1IY102fAQvFjhBXQCxOIn6Gr3qzRk/LfaVa6Cvv7LBPIu8OTqBB/vf57AW/DXB1U7F0vF0RJj191AgE8N9nGDNTk3xM8E36MOOZtoleB3ox+KuwC2K2glXTD8NQQ+LpTgH+JFouNws6Aah0y8x+5IKYYXWpwCErCX3jaO/b3w2QsgZeIoSARSzceEZ1giKU5FtVJs9AMUWy9pIUUZoFRDdhFsUUSxJlTz87ADmMxZiNmgvZotLbUher0ymhFrXqTNma3Y5vzbBXKt7Hv9qWps3VrJ7DPRWCqIYIW/hXllng8TxBofFyNs3FSsry7IiPOXzr6KDy3s0eQP9NqEQQCe+tH+NT18g3g2uumQp8/ubOhkZq+SxiTRgqQWN9+tXdwkDl+SFFFfFiGYX7hM52pjmP4pMwU2TRpEkvSvPtTWRzkVEmsNvLPvs2S+QLKZAd+jLdaF7zVAzMIgO9YnIgKz5MzKyilH7+9uVy5rnplJ4sphXbuF6eBF/LohJJLrrsZ+2FXl8UjXRg/XAe2qdhu5LIPAkXyBAPqGRWT26+PdDWVj1J8eWMzE+iwyAIPQzYMbuEsU1iqSwGlWcwMLYg7avB2EvIqkhygDH4F/rCy9iC8lWv5GRIJnqg2KxY+rWcm3HtrEq8oK1Kofloi1zEd0jyNGyE4lXOH6ZxRvxSqBe0PbGQMcvLCNke9CaoQ7zhwB/WBviW3Wig
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4899.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(478600001)(53546011)(31686004)(6506007)(110136005)(6666004)(966005)(6486002)(316002)(31696002)(26005)(6512007)(86362001)(66476007)(38100700002)(4326008)(8676002)(66946007)(8936002)(36756003)(41300700001)(5660300002)(2616005)(66556008)(186003)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aS9jOVhWZDdQSzVhRWFBcU5WTlQzYUVBU1lyeTArTFR4TzhVTGJCUlNWbDVU?=
 =?utf-8?B?azBSb3lhQ3hobklBQlJuYnFMeCtoVTlObU0wUUIvM2prT2tNbDRJbFVCQit5?=
 =?utf-8?B?M09Dc2taRm14U1VoWGhUK0pwREJpN3NzVFlXeGlDZ0x3dUxDcE1oNGlZd2F6?=
 =?utf-8?B?eCsvQ0hiRkVheGFHMjB3Tmd5SWVuYWVGbTQrTDFKREwzR0VadkhYbmNzci9j?=
 =?utf-8?B?NXJDQ0FWTEVaYUZxemw4NTBtb2hZWml2Y3ZFd0VPZ1ZWVTkwMUVlOElaS3Zs?=
 =?utf-8?B?aXdPa0ppS25mb05mN2t2Z2x2Wnl0dUYzZ0lUNkdseUErdmV5SC91dFd1OGwx?=
 =?utf-8?B?alBTY0h0R1JmMzRRdjRuMnRjM1gvajFMN0VwTThPdGxjYnVxY25vNlJxNFdh?=
 =?utf-8?B?TzNGS0pzWkZtdDRwRDk4d1l5WVFZaVFpU1dENklYQ1R5QVByNUxlL3VySTlQ?=
 =?utf-8?B?WjdWMnhkcVdNeXQ1OEpXbTZ5RzZ2TzRTMnZ0SEh6dGFSZDg2ZnRScHNUc3pn?=
 =?utf-8?B?cDRGai9IWmRjdVpJUTdlSUwyb015cmJHMHBCTnlwemxobXRqMUptT0s2b2hr?=
 =?utf-8?B?bjFCMFR0YXdhOHdBMTZqdURBbHNic3g0elNpTGVUN1lHVEFwa2ErbXFQc2N5?=
 =?utf-8?B?ZExjZ201NHlwL0l5R2pLZHRzQ3ZkcnBZNE1uNElSMm8xdmRvTHZpdVlxTVZR?=
 =?utf-8?B?cVlDQktRanY0RHB3VG03SmJFZTdxeTU2b1BlczZjaHE3bTE3aUxKMDlyYXpj?=
 =?utf-8?B?QmlBejBGT3diRVlBUHl6bDZxSk50V3U4Z24rL3h5ZmRDTUNVMTYwRnk4MU1a?=
 =?utf-8?B?L01CMFJEUmgzZjRyUUFFNW44aU1uS0paZTZuNkhyL2kwTDJ0K2gvWnRtVlpT?=
 =?utf-8?B?d3dPR2xmSU5JaWFUMXFnaTVkV3FYRWJIaU1vM1RxTzBFcnZPbEpHYTgwSWVm?=
 =?utf-8?B?Y1JDMzNQMFh5Q3R2S2RGWFVpditpNlY2aEZaRWg1a1kvaHBPdzR1cjVUT01k?=
 =?utf-8?B?TUROekdXeDVaWXcxQnFOMXZocURoR0RoSVNVU2x3YkRCOW5YZEw5WjdkcG45?=
 =?utf-8?B?d1g0YWVtSFdJNHN0SVlWWk5uVXlodVhkL1VoYTlzcGRkRzA2cHN4ZXY5Z1lC?=
 =?utf-8?B?b3ZOWUxTMk5kdWVWSk9uZXV6MEVEcVB2YnQyQkpQQTlWRVlDc25EeWNvR2h5?=
 =?utf-8?B?Rko5Nk1nbEw1dTZOOWZpK3ZtOXQ4TmYvWDl5bzRLVEx1WnhQanpzU2xiM0xE?=
 =?utf-8?B?ZTFxK2tQKytmVlQ3YnVubmJ4NHBqRUxRM1cvVjZaQ29RYnR5Wmk1Sy9FUVlO?=
 =?utf-8?B?MGlEUWJtaHYxYjdmNVE5MkJzZmF4cDBDMUdGbGg5WjRhNjd0VXJ6alIrSkNq?=
 =?utf-8?B?NStxWGdQNE52TVdIcG1RcEVWSEFHbE1aNTlsd0N5aTFCRGhzK09tblAzcFJk?=
 =?utf-8?B?bDZVK1QvdUxEODEwY3FNMG84Q3NyYXJOMk1objdHbGdhMGlBeUhjLzNpV1VP?=
 =?utf-8?B?eGRKaW1MN0xyNnk4RTVMTzEyVzZiY3k5VEJXcWljNmRwZEVOeTUyNkN1MHlZ?=
 =?utf-8?B?REZPUlY5Znh1eFA3aVhUOFNFQ2lxVDZwOE15aUc3aXJieHJ4QncwVks4c0RF?=
 =?utf-8?B?NDBJZjFSYVFYOGh3K3FFeXYyNzdENzN2T1NjV0hZdDFNbU9mdkNoWCs4d280?=
 =?utf-8?B?SVdJbTVmQ2pMYXJPSlppU0FVZUZNazJkRlcyL0Z4cnVQMEw5RjBUc0VDTUFr?=
 =?utf-8?B?cmlWRS9wSFdueEM4aVE1QjdnSEVLYmpGTHArVU1nUFlkSmpVLzU4YkhwWlBR?=
 =?utf-8?B?N0dFSFQwTHVyM1FLNXZqdDllZ2JjeHNCY1JYU2RlOU55VVhuRUdIRXhrWW5F?=
 =?utf-8?B?c1dlMEhGeDN6alJUMVUzenNKT3ZGMGx0TjNmNDhValE3MStsd1A2QUhseVBK?=
 =?utf-8?B?ZHJpckk0Yks3Z00zQ1FQUWNDczlxcWJkeEpjcHBBNlQxM0l3T1hvSDRjWmFq?=
 =?utf-8?B?UTZ1WElkVTNkN0FuMkt4U05iLzFLTlVxZlN2NzVHcU5SRGhwQko3M2FPdTY0?=
 =?utf-8?B?cStteGowS1NmaDNGdXltRVlCejE4MXoxdFo1RTN4QkpyUmtNN0s1QTZKMCtE?=
 =?utf-8?Q?tn1q1NKK27B3hWWY6CKuNX4mx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a74329-c9ae-485a-054c-08dac9b3fdf5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4899.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 22:26:52.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HpoDDWSrFP3+XBq3ftCMDRWZZJB83lCp9Ia7gu0B6I/58Itidd8VVRDUFUkHJIjjjDx6I0r90RQjYta/pB3rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9347
Received-SPF: pass client-ip=2a01:111:f400:fe1f::61e;
 envelope-from=jfehlig@suse.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I should make myself useful around here on occasion when items are within my 
skill set. But I already struggle to find time for that in the libvirt community 
:-).

On 11/8/22 09:23, Claudio Fontana wrote:
> The GTK Clipboard implementation may cause guest hangs.
> 
> Therefore implement a new configure switch --enable-gtk-clipboard,
> disabled by default, as a meson option.
> 
> Regenerate the meson build options to include it.
> 
> The initialization of the clipboard is gtk.c, as well as the
> compilation of gtk-clipboard.c are now conditional on this new option
> to be set.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1150
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   meson.build                   | 9 +++++++++
>   meson_options.txt             | 7 +++++++
>   scripts/meson-buildoptions.sh | 3 +++
>   ui/gtk.c                      | 2 ++
>   ui/meson.build                | 5 ++++-
>   5 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 1d448272ab..8bb96e5e8c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1243,6 +1243,8 @@ if nettle.found() and gmp.found()
>   endif
>   
>   
> +have_gtk_clipboard = false

Can this be initialized with get_option(), instead of the two calls below?

> +
>   gtk = not_found
>   gtkx11 = not_found
>   vte = not_found
> @@ -1258,12 +1260,18 @@ if not get_option('gtk').auto() or have_system
>                           kwargs: static_kwargs)
>       gtk = declare_dependency(dependencies: [gtk, gtkx11])
>   
> +    have_gtk_clipboard = get_option('gtk_clipboard').enabled()
> +
>       if not get_option('vte').auto() or have_system
>         vte = dependency('vte-2.91',
>                          method: 'pkg-config',
>                          required: get_option('vte'),
>                          kwargs: static_kwargs)
>       endif
> +  else
> +    if get_option('gtk_clipboard').enabled()
> +      error('GTK clipboard requested, but GTK not found')
> +    endif
>     endif
>   endif
>   
> @@ -1842,6 +1850,7 @@ if glusterfs.found()
>   endif
>   config_host_data.set('CONFIG_GTK', gtk.found())
>   config_host_data.set('CONFIG_VTE', vte.found())
> +config_host_data.set('CONFIG_GTK_CLIPBOARD', have_gtk_clipboard)
>   config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
>   config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>   config_host_data.set('CONFIG_EBPF', libbpf.found())
> diff --git a/meson_options.txt b/meson_options.txt
> index 66128178bf..4b749ca549 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -219,6 +219,13 @@ option('vnc_sasl', type : 'feature', value : 'auto',
>          description: 'SASL authentication for VNC server')
>   option('vte', type : 'feature', value : 'auto',
>          description: 'vte support for the gtk UI')
> +
> +# GTK Clipboard implementation is disabled by default, since it may cause hangs
> +# of the guest VCPUs. See gitlab issue 1150:
> +# https://gitlab.com/qemu-project/qemu/-/issues/1150
> +
> +option('gtk_clipboard', type: 'feature', value : 'disabled',
> +       description: 'clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)')

'boolean' seems a more appropriate type, but I see 'feature' is common practice 
with these various options. Is gtk_clipboard marked experimental elsewhere? Is 
there a need for the warning text?

>   option('xkbcommon', type : 'feature', value : 'auto',
>          description: 'xkbcommon support')
>   option('zstd', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 2cb0de5601..a542853bfd 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -93,6 +93,7 @@ meson_options_help() {
>     printf "%s\n" '  glusterfs       Glusterfs block device driver'
>     printf "%s\n" '  gnutls          GNUTLS cryptography support'
>     printf "%s\n" '  gtk             GTK+ user interface'
> +  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'

Same here. None of the other options have such warning. Cant this be treated 
like the others, just another option to be enabled or disabled? Whether or not 
the option works is another matter.

Jim

>     printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
>     printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
>     printf "%s\n" '  hax             HAX acceleration support'
> @@ -274,6 +275,8 @@ _meson_option_parse() {
>       --disable-gprof) printf "%s" -Dgprof=false ;;
>       --enable-gtk) printf "%s" -Dgtk=enabled ;;
>       --disable-gtk) printf "%s" -Dgtk=disabled ;;
> +    --enable-gtk-clipboard) printf "%s" -Dgtk_clipboard=enabled ;;
> +    --disable-gtk-clipboard) printf "%s" -Dgtk_clipboard=disabled ;;
>       --enable-guest-agent) printf "%s" -Dguest_agent=enabled ;;
>       --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
>       --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 7ec21f7798..4817623c8f 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2403,7 +2403,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>           opts->u.gtk.show_tabs) {
>           gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
>       }
> +#ifdef CONFIG_GTK_CLIPBOARD
>       gd_clipboard_init(s);
> +#endif /* CONFIG_GTK_CLIPBOARD */
>   }
>   
>   static void early_gtk_display_init(DisplayOptions *opts)
> diff --git a/ui/meson.build b/ui/meson.build
> index ec13949776..c1b137bf33 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -97,7 +97,10 @@ if gtk.found()
>     softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
>   
>     gtk_ss = ss.source_set()
> -  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
> +  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
> +  if have_gtk_clipboard
> +    gtk_ss.add(files('gtk-clipboard.c'))
> +  endif
>     gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
>     gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
>     gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))


