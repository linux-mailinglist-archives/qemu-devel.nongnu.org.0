Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADE64BBF10
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:11:26 +0100 (CET)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7j1-0004tu-Rg
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:11:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7gN-0003WQ-7A
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:08:39 -0500
Received: from [2607:f8b0:4864:20::1032] (port=37546
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7gL-0002hj-K6
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:08:38 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so13065217pjl.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 10:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EQRbb5SlIEmlxArByPR/4KxbKq08EqPQdxvSuIzGrE4=;
 b=C5JlB5dM8bwYCqI/X0x0b7TPIqCANCtZN+rgDn4zTwOEd7Kpmc/h6s4pBY9y1BO5c3
 daHBtHOfu+P8yioXPO3iflw6RyvW2xm5B8ElkemrSh/sE0nfByC6UKSA+RIysbboHV96
 kHunzr5l5R2sB5+xKS9CrrIzb24Cl+8TfVnbRgUwp6xcIzMfjv5JNg+DzE0hs71Ilclm
 Az21jyUMCd3Kscl/4Y7yTmLDag0izthsdz1JqTXZRW0dWgUunR+aaxJ5OebjJdadtExZ
 SHi/NxH2NszwzwUq9tGSImuF3WXPrK7fN3SI5nYyKt4s4EVt3M9DTj+SAEVBWQaBGvB5
 YL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EQRbb5SlIEmlxArByPR/4KxbKq08EqPQdxvSuIzGrE4=;
 b=631qnfuUQuMTdRJruspTkWHZkwQjPPnv5hdiczvbWTOT/goyCZwJoWAggfVnDjagFv
 ffqdaalbQ4aiVLufs8HWJ+PONVaiSLLY1qYfiXLxpV71YjMj/rwTiSqZRkgsypNzxHBZ
 BAuW7KgXSbKBp9GU67LYNDRntPzq3XpGAwkDRr52nH37ChqiPExoUDx7o5N1roO74RMs
 ycI9hjjXarpMkIgZ1pVyKQIOc2TJMLNLFNiQ73xUG1U9/MwgprZRcvKQ8C/2PH8ngr59
 9Dqt+RWyruhtmeVAS+IqkOEHYlLoyS/Io1AJ/OL+VVOp58Hf0somWN0FQx5sdnbGqdOD
 H6ow==
X-Gm-Message-State: AOAM531o2y8OfqYJj3n8Gq3CeXN4IPCs3vBCuciAOJ8kGSrAUrMkfCrk
 Eqms5yJsBtCnrA3J7QNDp5M=
X-Google-Smtp-Source: ABdhPJzOaokstqsS9qLMBzQeQlfC9Z1Mw2FkLu4t20TVitEtmvZOM60Bx4NhnVl+jBy/iHknw0x2wA==
X-Received: by 2002:a17:90a:5505:b0:1b8:ebd4:d602 with SMTP id
 b5-20020a17090a550500b001b8ebd4d602mr9464832pji.147.1645207716194; 
 Fri, 18 Feb 2022 10:08:36 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 w198sm3867359pff.96.2022.02.18.10.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:08:35 -0800 (PST)
Message-ID: <15f72069-bbf2-045b-ed0c-cd23a1ca844e@gmail.com>
Date: Sat, 19 Feb 2022 03:08:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/15] configure: Allow passing extra Objective C
 compiler flags
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-3-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220215080307.69550-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/02/15 17:02, Philippe Mathieu-Daudé via wrote:
> We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
> variables, or via configure --extra-cflags / --extra-cxxflags /
> --extra-ldflags options. Provide similar behavior for Objective C:
> use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   configure   | 8 ++++++++
>   meson.build | 5 +++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/configure b/configure
> index 3a29eff5cc..06c03cebd3 100755
> --- a/configure
> +++ b/configure
> @@ -287,6 +287,7 @@ done
>   
>   EXTRA_CFLAGS=""
>   EXTRA_CXXFLAGS=""
> +EXTRA_OBJCFLAGS=""
>   EXTRA_LDFLAGS=""
>   
>   xen_ctrl_version="$default_feature"
> @@ -391,9 +392,12 @@ for opt do
>     --extra-cflags=*)
>       EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
>       EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
> +    EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
>       ;;
>     --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
>     ;;
> +  --extra-objcflags=*) EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
> +  ;;
>     --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
>     ;;
>     --enable-debug-info) debug_info="yes"
> @@ -774,6 +778,8 @@ for opt do
>     ;;
>     --extra-cxxflags=*)
>     ;;
> +  --extra-objcflags=*)
> +  ;;
>     --extra-ldflags=*)
>     ;;
>     --enable-debug-info)
> @@ -1312,6 +1318,7 @@ Advanced options (experts only):
>     --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
>     --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
>     --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
> +  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
>     --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
>     --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
>     --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
> @@ -3724,6 +3731,7 @@ if test "$skip_meson" = no; then
>     echo "[built-in options]" >> $cross
>     echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
>     echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
> +  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
>     echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
>     echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
>     echo "[binaries]" >> $cross
> diff --git a/meson.build b/meson.build
> index ae5f7eec6e..df25e7a5e7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3292,6 +3292,11 @@ if link_language == 'cpp'
>                                                  + ['-O' + get_option('optimization')]
>                                                  + (get_option('debug') ? ['-g'] : []))}
>   endif
> +if targetos == 'darwin'
> +  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
> +                                               + ['-O' + get_option('optimization')]
> +                                               + (get_option('debug') ? ['-g'] : []))}
> +endif
>   link_args = get_option(link_language + '_link_args')
>   if link_args.length() > 0
>     summary_info += {'LDFLAGS':         ' '.join(link_args)}


