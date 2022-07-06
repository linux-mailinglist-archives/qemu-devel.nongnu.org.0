Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879EE56807B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:53:06 +0200 (CEST)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zqL-0006wU-4K
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8znG-0005Zj-PU
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:49:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8znB-0008IE-2K
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:49:51 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso6395321pjz.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aTTMNRB031bD6WF5LRaX+YyHLsjPi59m8iHcK2bvses=;
 b=tFCAE+jpDxaF5cs0Gx3KeHlXlVQMJsMWXZA4fZAqeagd9Vo31Iwy0jWDmJlDl+dfEd
 VnHBVYg8yH+KMhsqY4Az+e+yFq+aMMRek0klrhm/T6YsgVwkJmzMUDRDozFUhjxtEJ/e
 vtdaSc2eqcifupJNHkMCIRIHyg+Oqh9Sd+cg0onbQm82d1WQ0nqKHvnljmlKdpPtT49x
 vd7LkIMzkOYwZ9SalPqoEKnKoomfogVLvMbtTzw+MGL1qEIFCAElA8vcYbvpOU7ibNL6
 nCxFMW2sVlYIl2Z/Fhk/4o1lRg43++rW/TuGdirqdbMN4OsyY/C6khkaaFk2TjLez6Vc
 uDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aTTMNRB031bD6WF5LRaX+YyHLsjPi59m8iHcK2bvses=;
 b=h4JQ5Jktmf7raUimX6PQW/nu698m7+JNJYnb3ifHQn2ztiLeX2nJ3G6PVThHyahfNL
 9mSo8dvtpE159x0XypH3mr3lEfwSZshhZP3SvbDNn6TbDyjihYhHLnt9A/hUlchCJiAL
 8vJW2uGi060JkTiKPFtr6bs2PiJVgBkqcbB1AMNwVNiz64tksgxMzI4rzpMpCCHQbLHQ
 Zgj+ijc8x+OaHFHw0O+zZK3z3Vv5uELeIRef2XP1eJQoHz1Yv6ELP+pbSkR1RwCpV1al
 8iI2obrsx93iTRQgpipKeW5H1eI8J9dP3JlaaXDqVrpsprRFWh5SKv6l3BPVK6Dd2Egs
 qz2w==
X-Gm-Message-State: AJIora/2ePiysszgAARoC1ksnBnR4WE29Uj/Q8Kgk44Q5vkLosG3NxrC
 UXmPnMkx1h/lo9RqG2sPDPl2cw==
X-Google-Smtp-Source: AGRyM1s3ZpmGiThWqzCp0125GFM8jg2Q1EQfCDiCFOEQdzkH0cninFU7VEbFD1hf1TH6XBGT/CZpfA==
X-Received: by 2002:a17:90b:4d05:b0:1e2:bf91:8af2 with SMTP id
 mw5-20020a17090b4d0500b001e2bf918af2mr47950014pjb.210.1657093787478; 
 Wed, 06 Jul 2022 00:49:47 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a17090a2bcb00b001e85f38bc79sm13998922pje.41.2022.07.06.00.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 00:49:46 -0700 (PDT)
Message-ID: <c420494e-52c1-e83f-c959-d4eb69799bd8@bytedance.com>
Date: Wed, 6 Jul 2022 15:44:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Re: [PATCH v2 1/1] qga: add command 'guest-get-cpustats'
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
References: <20220704023618.626849-1-pizhenwei@bytedance.com>
 <20220704023618.626849-2-pizhenwei@bytedance.com>
 <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
 <1b3f926b-9fe6-a3ec-b697-6fa8471510ad@bytedance.com>
 <d43a478f-e54b-e624-8c67-2392bf3d3dbb@bytedance.com>
 <CAJ+F1CKpTz4pNKX9XdZER70wrgYkNmHTzhhWB69O1SS1kS-zrg@mail.gmail.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CAJ+F1CKpTz4pNKX9XdZER70wrgYkNmHTzhhWB69O1SS1kS-zrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/6/22 15:20, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 6, 2022 at 7:09 AM zhenwei pi <pizhenwei@bytedance.com 
> <mailto:pizhenwei@bytedance.com>> wrote:
> 
>     On 7/4/22 16:00, zhenwei pi wrote:
>      >
>      >
>      >>     +##
>      >>     +# @GuestOsType:
>      >>     +#
>      >>     +# An enumeration of OS type
>      >>     +#
>      >>     +# Since: 7.1
>      >>     +##
>      >>     +{ 'enum': 'GuestOsType',
>      >>     +  'data': [ 'linuxos', 'windowsos' ] }
>      >>
>      >>
>      >> I would rather keep this enum specific to GuestCpuStats,
>      >> "GuestLinuxCpuStatsType"?
>      >>
>      >
>      > Hi,
>      >
>      > 'GuestOsType' may be re-used in the future, not only for the CPU
>      > statistics case.
>      >
>      >> I would also drop the "os" suffix
>      >>
>      > I'm afraid we can not drop "os" suffix, build this without "os"
>     suffix:
>      > qga/qga-qapi-types.h:948:28: error: expected member name or ';'
>     after
>      > declaration specifiers
>      >          GuestLinuxCpuStats linux;
>      >          ~~~~~~~~~~~~~~~~~~ ^
>      > <built-in>:336:15: note: expanded from here
>      > #define linux 1
>      >
> 
>     Hi, Marc
> 
>     Could you please give any hint about this issue?
> 
> 
> Yes, it looks like we need to add "linux" to the "polluted_words":
> 

OK, I'll fix this in the next versoin.

By the way, 'GuestCpuStatsType' seems to be used for CPU statistics 
only, but 'data': [ 'linux', 'windows' ] } is quite common, it may be 
used for other OS specified commands in the future. Should I use 
'GuestCpuStatsType' instead of 'GuestOsType'?

> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 489273574aee..737b059e6291 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool = True) -> str:
>                        'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
>                        'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>       # namespace pollution:
> -    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
> +    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386', 
> 'linux'])
> 
> 
>      >>     +
>      >>     +
>      >>
>      >>
>      >>
>      >> Looks good to me otherwise.
>      >> thanks
>      >>
>      >> --
>      >> Marc-André Lureau
>      >
> 
>     -- 
>     zhenwei pi
> 
> 
> 
> -- 
> Marc-André Lureau

-- 
zhenwei pi

