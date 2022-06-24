Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51703559DF8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:01:26 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lkL-00069Q-Ax
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4lgm-000403-0X
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:57:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4lgk-00038Q-5j
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:57:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so6246826pjr.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=NmmWCgrpxNBD5fgUNfC7+o7JsMEaI5P9IIh9sx7vXOM=;
 b=CF+oBA5IFafaQAdHEjpIKiFy6ryxLBbpoOYkT9T31b6QER5GQbR0CJEImreDn7IaJ1
 DwMsZ73P/wU1CooZ7tpCmJCiT/B8SpDyBRcoeYnCvU5+bnF7qXm/vMvpaLNF6b30P0Dc
 XT5yC67eVkSGcsfiw4lGD5QCCkK6zX4G/niwuOLe/u5jqOlNUU/t1e/jQgibZ3WOccTw
 /VCPKQCRIQlPSyBhwydpv2+/2hryF93qPD64OCNwwpLi3HatHfjoOiL0dR8g0x5LCqd1
 zzqkdJZOCjRyHYXZm2UepPtJk7pp1WTGGKlZ4xxgYqeLi3KlV7uUiUrPGuPKbqWn9wxH
 cwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NmmWCgrpxNBD5fgUNfC7+o7JsMEaI5P9IIh9sx7vXOM=;
 b=oCImjdLUYMPav4bK3lLiWeNDCjEv7llG3L7CftoWcWaJp/Jwiiu09+rwxwTHXv8sNY
 lOYW3hNjTzELly/E46WJ4R48wz3Ghtd5r3/yy9kVzyrkuqK4GMle4bd+bPpGe3SjB+8G
 3+x84ZmILzU2Hh7d1ovxXwTo162GnDrBkA4BnkBfgL74Mz1EIqvkleS0TftdCmV/0MUW
 9uEbKGbpS5qJBNVGpEZ3wc/WjaEF5ID5t0PG8LSqxWTg5+2gfFjlmmN+aGyAhLw/37gc
 isqgPzlbVGuaKZjJGHKRRdamgJfdpuwFwcbZOGWU/1xWg++nCgTwOX+m0cL4Zf159IOF
 W8yw==
X-Gm-Message-State: AJIora+FiSOpFINcWS5PcGUPhO4yhulC3K7NSVtKfGUFqHc+6r23DNMb
 wXR3hDU5DHUrF/D5NZpqpp0RGQ==
X-Google-Smtp-Source: AGRyM1suG3iyt1Ovg81nQRTZmrLzvHS1kRiBeS3Vxf7QWuYG6zCo8HYiAb4Cm7x905Jj/vTho9VjEQ==
X-Received: by 2002:a17:90a:aa8a:b0:1c9:bfd8:9a90 with SMTP id
 l10-20020a17090aaa8a00b001c9bfd89a90mr4815056pjq.118.1656086260461; 
 Fri, 24 Jun 2022 08:57:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a631001000000b003fe4836abdasm1782802pgl.1.2022.06.24.08.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:57:39 -0700 (PDT)
Message-ID: <9d4d83cc-d4e5-6b8e-2ed9-00cefb534082@linaro.org>
Date: Fri, 24 Jun 2022 08:57:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/14] (Mostly) build system changes for 2022-06-24
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220624082730.246924-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/24/22 01:27, Paolo Bonzini wrote:
> The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:
> 
>    Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 72da35fec9a9ba91a5b2cb9ee00843a94fa9413d:
> 
>    accel: kvm: Fix memory leak in find_stats_descriptors (2022-06-24 10:19:17 +0200)
> 
> ----------------------------------------------------------------
> * fuzzing fixes
> * fix cross compilation CFLAGS and compiler choice
> * do not specify -bios option for tests/vm
> * miscellaneous fixes

Build failure here.  I have ubuntu 22.04,

crossbuild-essential-arm64/jammy,jammy,now 12.9ubuntu3 all [installed]

crossbuild-essential-armhf/jammy,jammy,now 12.9ubuntu3 all [installed]

crossbuild-essential-i386/jammy,jammy,now 12.9ubuntu3 all [installed]

crossbuild-essential-mips64el/jammy,jammy,now 12.9 all [installed]

crossbuild-essential-ppc64el/jammy,jammy,now 12.9ubuntu3 all [installed]

crossbuild-essential-riscv64/jammy,jammy,now 12.9ubuntu3 all [installed]

crossbuild-essential-s390x/jammy,jammy,now 12.9ubuntu3 all [installed]


which is properly detected during configure,

   Cross compilers

     aarch64                      : aarch64-linux-gnu-gcc

     alpha                        : $(DOCKER_SCRIPT) cc --cc alpha-linux-gnu-gcc -i 
qemu/debian-alpha-cross -s /home/rth/qemu-publish/src --

     arm                          : arm-linux-gnueabihf-gcc

     i386                         : i686-linux-gnu-gcc

     nios2                        : $(DOCKER_SCRIPT) cc --cc nios2-linux-gnu-gcc -i 
qemu/debian-nios2-cross -s /home/rth/qemu-publish/src --

     x86_64                       : cc

...


But then the i386 cross-compiler isn't used:

$ cat tests/tcg/config-i386-softmmu.mak

# Automatically generated by configure - do not modify

TARGET_NAME=i386

BUILD_STATIC=

EXTRA_CFLAGS=-m32

CC=cc

CCAS=cc

AR=ar

AS=as

LD=ld

NM=nm

OBJCOPY=objcopy

RANLIB=ranlib

STRIP=strip

QEMU=/home/rth/qemu-publish/bld/qemu-system-i386


leading to failure:

cc -nostdlib -ggdb -O0 -isystem /home/rth/qemu-publish/src/tests/tcg/minilib -m32 
-ffreestanding /home/rth/qemu-publish/src/tests/tcg/multiarch/system/hello.c -o hello 
-Wl,-T/home/rth/qemu-publish/src/tests/tcg/i386/system/kernel.ld -Wl,-melf_i386 -static 
-nostdlib boot.o  printf.o -lgcc

/usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/11/libgcc.a when 
searching for -lgcc

/usr/bin/ld: cannot find -lgcc: No such file or directory

collect2: error: ld returned 1 exit status

make[1]: *** [/home/rth/qemu-publish/src/tests/tcg/i386/Makefile.softmmu-target:32: hello] 
Error 1



r~

