Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6A4BBC61
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:47:40 +0100 (CET)
Received: from localhost ([::1]:60498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL5Tv-0006Vc-KH
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5R2-00058T-O8
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:44:42 -0500
Received: from [2a00:1450:4864:20::42c] (port=43528
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5Qy-0006cz-Mk
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:44:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i14so15238014wrc.10
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 07:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JN81EyOSyaX49sCdfpBZTXEmiXz7vvO+C/WfbW5YBvs=;
 b=NcT60mHYfqXjtuu2tq3kcLg2Blm2xF8x1GD0wEKXMh2sbeXoSx/OfR+Pyj8EuABXPG
 Ryue5cqazA4Q6XfMvaNoW901QwqlSs3fg2mjsN6zsRoTUH0oR9HmriUWtCLw6Y0yR0T7
 Jv27P3c/qdodh+n2UgFyoEAX2NPoNctRRrAnzCJAC0I5upTxm+8l5qPRzSPlzEnJzZs+
 w6AsOBfa9g247oaisXf971urPbpnBmZsFfpCa1UQ4WMW+gBozRsrofYlVV7bSUf/0DpM
 ZR2/mBG4ihcWIH7fPnGKFL96ADcQiTiRpNFxJxNhXS43DfV2aVqZ4RddR3gkKA/maB1d
 dpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JN81EyOSyaX49sCdfpBZTXEmiXz7vvO+C/WfbW5YBvs=;
 b=Fr2u9ODLlHki/rrDs0/u9xilsnjrwwrGYfXX1IsUKSNziEH+TD3VjeXizl+hXsXYcp
 SGeykG6Kl5Ka6G+QR8gBrM7Nd0oBljwAbymEvf0MUxn1jDBVqa4YeF0jzuzlVpprZbHn
 rDPljJfOE3GOHGcomhLj+y6n/uKLyeMtAZQYqloDUMdNNJsvQKruACuDYLzglwrFh1Lb
 G4DGGCcPAcrtLt5g43Zk/HJuAV7YmXC1cjb4bB6Wdix7uQH7hKySrgwR+xoYP3SvTBoZ
 wV9WbS1afHRbS+0iPMZ+789X08vBbtoiwtpt/VTwboNCzpSpu3tkxu0q/2uwTipQ8YTW
 tsww==
X-Gm-Message-State: AOAM533o49xickSQ14NC0dAXHcennbmR1D5eoFzVdGjXkxtxtah3HW6Z
 JUKIHLRY3VRWWWHKLSTTydw=
X-Google-Smtp-Source: ABdhPJyP2mXry+KVyAddsEvLjmW0qRmZ8aMnbhOM2QhxLqeTIWtqQCuqBhNUiQCai32xeU8Dk3Qv0Q==
X-Received: by 2002:a5d:6110:0:b0:1e4:b3d1:f567 with SMTP id
 v16-20020a5d6110000000b001e4b3d1f567mr6415798wrt.211.1645199072234; 
 Fri, 18 Feb 2022 07:44:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id t16sm5123339wmq.43.2022.02.18.07.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 07:44:31 -0800 (PST)
Message-ID: <c892e4b7-ea41-39ea-213f-0b980eef1106@redhat.com>
Date: Fri, 18 Feb 2022 16:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/8] configure: Pass filtered QEMU_OBJCFLAGS to meson
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-7-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220215170106.95848-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 18:01, Philippe Mathieu-Daudé via wrote:
> Filter unsupported Objective-C options, to avoid
> 'unknown-warning-option' warnings when using Clang:
> 
>    [34/373] Compiling Objective-C object libcommon.fa.p/audio_coreaudio.m.o
>    warning: unknown warning option '-Wold-style-declaration'; did you mean '-Wout-of-line-declaration'? [-Wunknown-warning-option]
>    warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean '-Wimplicit-fallthrough'? [-Wunknown-warning-option]
>    2 warnings generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   configure   | 23 +++++++++++++++++++++++
>   meson.build |  5 ++++-
>   2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 3217aa22cb..df6eaec067 100755
> --- a/configure
> +++ b/configure
> @@ -77,6 +77,7 @@ TMPB="qemu-conf"
>   TMPC="${TMPDIR1}/${TMPB}.c"
>   TMPO="${TMPDIR1}/${TMPB}.o"
>   TMPCXX="${TMPDIR1}/${TMPB}.cxx"
> +TMPM="${TMPDIR1}/${TMPB}.m"
>   TMPE="${TMPDIR1}/${TMPB}.exe"
>   
>   rm -f config.log
> @@ -148,6 +149,10 @@ do_cxx() {
>       do_compiler "$cxx" $CPU_CFLAGS "$@"
>   }
>   
> +do_objc() {
> +    do_compiler "$objcc" $CPU_CFLAGS "$@"
> +}
> +
>   # Append $2 to the variable named $1, with space separation
>   add_to() {
>       eval $1=\${$1:+\"\$$1 \"}\$2
> @@ -1616,10 +1621,27 @@ cc_has_warning_flag() {
>       compile_prog "-Werror $optflag" ""
>   }
>   
> +objcc_has_warning_flag() {
> +    cat > $TMPM <<EOF
> +int main(void) { return 0; }
> +EOF
> +
> +    # Use the positive sense of the flag when testing for -Wno-wombat
> +    # support (gcc will happily accept the -Wno- form of unknown
> +    # warning options).
> +    optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
> +    do_objc -Werror $optflag \
> +      $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
> +      -o $TMPE $TMPM $QEMU_LDFLAGS
> +}
> +
>   for flag in $gcc_flags; do
>       if cc_has_warning_flag $flag ; then
>           QEMU_CFLAGS="$QEMU_CFLAGS $flag"
>       fi
> +    if objcc_has_warning_flag $flag ; then
> +        QEMU_OBJCFLAGS="$QEMU_OBJCFLAGS $flag"
> +    fi
>   done
>   
>   if test "$stack_protector" != "no"; then
> @@ -3579,6 +3601,7 @@ echo "LD=$ld" >> $config_host_mak
>   echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
>   echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
>   echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
> +echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
>   echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
>   echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
>   echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 215c253683..7b78235a39 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -199,9 +199,11 @@ if get_option('fuzzing')
>   endif
>   
>   add_global_arguments(config_host['QEMU_CFLAGS'].split(),
> -                     native: false, language: ['c', 'objc'])
> +                     native: false, language: ['c'])
>   add_global_arguments(config_host['QEMU_CXXFLAGS'].split(),
>                        native: false, language: 'cpp')
> +add_global_arguments(config_host['QEMU_OBJCFLAGS'].split(),
> +                     native: false, language: ['objc'])
>   add_global_link_arguments(config_host['QEMU_LDFLAGS'].split(),
>                             native: false, language: ['c', 'cpp', 'objc'])
>   
> @@ -3306,6 +3308,7 @@ if link_args.length() > 0
>   endif
>   summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
>   summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
> +summary_info += {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
>   summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
>   summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
>   summary_info += {'link-time optimization (LTO)': get_option('b_lto')}


