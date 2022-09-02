Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5B5AB804
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:13:49 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBAq-0005Fy-8N
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUAkw-0007Qp-Pr
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:47:11 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUAkr-0002NE-Nw
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:47:00 -0400
Received: by mail-pg1-x533.google.com with SMTP id 73so2569860pga.1
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 10:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=M4vVkEjH5TmncZco5Xky2UzIlEe7+anjWspVFwi9tOA=;
 b=QT9CNPVVpLdFgaTx3a1GON4iOK5I2KianbSvQ49R+hn6De+IkFuxtSnz9+7xlZMDkE
 dl5ko91Qf71h21edIskrMr0o+7PYoMB3jjE4PtgbCNt/D4ycAr//2mXemrE94xDvuhLR
 8qJpD0oCbGs8UT/tsIGJL+DkbisrlAiMSKhZMtcMqwZkgBpoUbTkFd0sU2oqAXYtrZlk
 cjHGpRtnnOUa625Olornt4f61KpgkAaZTgaz1GfGigI6WH1r5BMlvkZnC0feWGtHapR5
 5YnU067iV6u8riwaC0fby6+zqt0zaiGiz4pcjBKpkGO6VKZrvtIJeWwJp2CDuacIaimu
 m/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=M4vVkEjH5TmncZco5Xky2UzIlEe7+anjWspVFwi9tOA=;
 b=X1c8pMV/4dnFonI5l94EwpKUdhKvV0IisYLMLEtlAGWo9GJSP3HyYRV2bx03dn3q5T
 A1iCnQk+/SLZiQAIvTcofnuj/kNJFOuodgQ1Z/stsVXVAASINrnjgMOQIRAiMhMgT43r
 6oiVrWzOgoAT54406HM2peEnvKFwJauYEGlZnSnGAgdC5Q8/MHMXdyKRZv9VQ9+58tSV
 m5ETZZ+KveuDatuIO9FWys0K5DJru9Yt8WGkxWD3JuCSSeiWfRjKqTckuGKJjWDG8qpf
 txntx+cgq7ZlM/k8jfMNF8vUaCYBsHVKFQznXz0Bt4e5fJUSr0RO4yrgDq1574SwUsQD
 EPGQ==
X-Gm-Message-State: ACgBeo341zfjZK3v+hR8JrclczHfbe2uZbntrmKubi1ZZ1i5Bt59TMl6
 BVvBTuym1wMCIdE6UWOSHbRIcLgfGlI=
X-Google-Smtp-Source: AA6agR7zDpLeJaYOMrVSQLAuZjxXXkintJGHfNAj3Pe+xZthfFt1sJYEX3mMyxfb4qDwwkLUdyJFRg==
X-Received: by 2002:a63:4a08:0:b0:428:d6ca:5a99 with SMTP id
 x8-20020a634a08000000b00428d6ca5a99mr32528350pga.98.1662140816171; 
 Fri, 02 Sep 2022 10:46:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a170902db1000b001725d542190sm1950746plx.181.2022.09.02.10.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 10:46:55 -0700 (PDT)
Message-ID: <57fadaac-5153-0af5-c2dd-b5dac41f0612@amsat.org>
Date: Fri, 2 Sep 2022 19:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] configure: Only add configuration for targets that are
 enabled
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20220902163312.994-1-quintela@redhat.com>
In-Reply-To: <20220902163312.994-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/9/22 18:33, Juan Quintela wrote:
> Current code configure devices even for targets that we are not
> compiling, just in case that we have configured the target
> architecture.
> 
> Example that showed on my build is that I am compiling only for
> x86_64-softmmu, but it insists in building roms/SLOF, that I am not
> using at all.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   configure | 120 +++++++++++++++++++++++++++++-------------------------
>   1 file changed, 64 insertions(+), 56 deletions(-)
> 
> diff --git a/configure b/configure
> index 72ab03f11a..a2741df05d 100755
> --- a/configure
> +++ b/configure
> @@ -2326,62 +2326,70 @@ for f in $LINKS ; do
>       fi
>   done
>   
> -# Mac OS X ships with a broken assembler
> -roms=
> -probe_target_compiler i386-softmmu
> -if test -n "$target_cc" &&
> -        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
> -        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
> -    # Different host OS linkers have different ideas about the name of the ELF
> -    # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
> -    # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
> -    for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
> -        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
> -            ld_i386_emulation="$emu"
> -            break
> -        fi
> -    done
> -    if test -n "$ld_i386_emulation"; then
> -        roms="pc-bios/optionrom"
> -        config_mak=pc-bios/optionrom/config.mak
> -        echo "# Automatically generated by configure - do not modify" > $config_mak
> -        echo "TOPSRC_DIR=$source_path" >> $config_mak
> -        echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
> -        write_target_makefile >> $config_mak
> -    fi
> -fi
> -
> -probe_target_compiler ppc-softmmu
> -if test -n "$target_cc" && test "$softmmu" = yes; then
> -    roms="$roms pc-bios/vof"
> -    config_mak=pc-bios/vof/config.mak
> -    echo "# Automatically generated by configure - do not modify" > $config_mak
> -    echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
> -    write_target_makefile >> $config_mak
> -fi
> -
> -# Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
> -# (which is the lowest architecture level that Clang supports)
> -probe_target_compiler s390x-softmmu
> -if test -n "$target_cc" && test "$softmmu" = yes; then
> -  write_c_skeleton
> -  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
> -  has_z900=$?
> -  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> -    if [ $has_z900 != 0 ]; then
> -      echo "WARNING: Your compiler does not support the z900!"
> -      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
> -    fi
> -    roms="$roms pc-bios/s390-ccw"
> -    config_mak=pc-bios/s390-ccw/config-host.mak
> -    echo "# Automatically generated by configure - do not modify" > $config_mak
> -    echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
> -    write_target_makefile >> $config_mak
> -    # SLOF is required for building the s390-ccw firmware on s390x,
> -    # since it is using the libnet code from SLOF for network booting.
> -    git_submodules="${git_submodules} roms/SLOF"
> -  fi
> -fi
> +for target in $target_list; do
> +    case $target in
> +	i386-softmmu)
> +	    # Mac OS X ships with a broken assembler
> +	    roms=
> +	    probe_target_compiler i386-softmmu
> +	    if test -n "$target_cc" &&
> +		    test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
> +			test "$targetos" != "haiku" && test "$softmmu" = yes ; then
> +		# Different host OS linkers have different ideas about the name of the ELF
> +		# emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
> +		# variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
> +		for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
> +		    if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
> +			ld_i386_emulation="$emu"
> +			break
> +		    fi
> +		done
> +		if test -n "$ld_i386_emulation"; then
> +		    roms="pc-bios/optionrom"
> +		    config_mak=pc-bios/optionrom/config.mak
> +		    echo "# Automatically generated by configure - do not modify" > $config_mak
> +		    echo "TOPSRC_DIR=$source_path" >> $config_mak
> +		    echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
> +		    write_target_makefile >> $config_mak
> +		fi
> +	    fi
> +	    ;;
> +	ppc-softmmu)
> +	    probe_target_compiler ppc-softmmu
> +	    if test -n "$target_cc" && test "$softmmu" = yes; then
> +		roms="$roms pc-bios/vof"
> +		config_mak=pc-bios/vof/config.mak
> +		echo "# Automatically generated by configure - do not modify" > $config_mak
> +		echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
> +		write_target_makefile >> $config_mak
> +	    fi
> +	    ;;
> +	s390-softmmu)
> +	    # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
> +	    # (which is the lowest architecture level that Clang supports)
> +	    probe_target_compiler s390x-softmmu
> +	    if test -n "$target_cc" && test "$softmmu" = yes; then
> +		write_c_skeleton
> +		do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
> +		has_z900=$?
> +		if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> +		    if [ $has_z900 != 0 ]; then
> +			echo "WARNING: Your compiler does not support the z900!"
> +			echo "         The s390-ccw bios will only work with guest CPUs >= z10."
> +		    fi
> +		    roms="$roms pc-bios/s390-ccw"
> +		    config_mak=pc-bios/s390-ccw/config-host.mak
> +		    echo "# Automatically generated by configure - do not modify" > $config_mak
> +		    echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
> +		    write_target_makefile >> $config_mak
> +		    # SLOF is required for building the s390-ccw firmware on s390x,
> +		    # since it is using the libnet code from SLOF for network booting.
> +		    git_submodules="${git_submodules} roms/SLOF"
> +		fi
> +	    fi
> +	    ;;
> +    esac
> +done

Could it be simpler to check $target_list in probe_target_compiler()?

