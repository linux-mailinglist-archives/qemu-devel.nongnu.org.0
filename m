Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1F381F06
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:11:21 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGYC-0001Y5-HS
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liG4V-00007l-90; Sun, 16 May 2021 08:40:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liG4S-0002fz-85; Sun, 16 May 2021 08:40:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id r12so3633512wrp.1;
 Sun, 16 May 2021 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NoLBzZdL0FumuacnJGhtYyU2aY6iNhUgiP9HORU+z3k=;
 b=QWdedhJQPYT6jZgBNxaToHUUUpCGSFEx9dWnMjGoXBEaKQYi6u+nKI6cexp/74bqV5
 mN9WwqKSaExpivk8AJnqBXAlZCdQzRazDggVWLWeqcpFoXY4Ko+Y/1+yfTtITGMCvrdP
 u+7edwKuPXvGzx7Ln3g3r1YwW1iSwOiuOqv/jMN8qTm3O6yHriyBQbp4TWTV9e0U7erk
 vCKQh/PPjAxOyjColpCw0dA8704OfiNiZmSvQWEIxDIP1hOTWOE8Gx5YjRel6JzYan9X
 DypqQJJedYZ8mCqIONUkMRTOs72ZlXWnQCwXutqKN4j533OAZRYCgyhvojXdtoPuPYJ9
 Skrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NoLBzZdL0FumuacnJGhtYyU2aY6iNhUgiP9HORU+z3k=;
 b=s07UzNcMXqUWsplNexfqp5l3tXL7/5hREqtZz6O5UiyLJrwrqMPwc2npR5EfboWISs
 Fzylu5P0zMFqRe9KSPsE1DpSRbPKWn4UZxbijwdiVxOke0cbKlKomP9p5FebZI7preS0
 lA0pEFRX1MBJWyJBaN9LYt+0lC136qrZS0l4CQ/NYZKCe+Ozn0s7PVdSOKnWd699CfDs
 oT21eL43dp/ft2wgCMy1gJlYDLd9hN5Q0mVLkZCNiwo8Wj14fm3OXDOl/n8o0z88EBAT
 IlbXxgNE6Efjd1u6kVDxUYzJfcYLvXzaKaHz8qPelKyVXJ4RLDgpaFRs/DVfgIls7oa7
 CkTg==
X-Gm-Message-State: AOAM530/FNpNiSZsHxg2c6BDT3vvAW1Tp3ouet/XV+SSf2vP86m2EGLd
 0avt7hQXksKCPJNpcw3qQCI=
X-Google-Smtp-Source: ABdhPJwDDxThISPVo5tK09EZlSLTaAEcsUgW06N5/TVi6vmGqLaQnsm4KHMwoDffCdNkzflkpKPM5w==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr67482165wrx.182.1621168831574; 
 Sun, 16 May 2021 05:40:31 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s5sm12141308wrw.95.2021.05.16.05.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 05:40:30 -0700 (PDT)
Subject: Re: [PATCH] disas/libvixl: Protect C system header for C++ compiler
To: qemu-devel@nongnu.org
References: <20210515183531.372925-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ceb7fcb9-8b17-5fd7-00a6-9daa3cc6a806@amsat.org>
Date: Sun, 16 May 2021 14:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515183531.372925-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to tag as RFC.

Cc'ing mjt to have feedback from Debian packaging.

On 5/15/21 8:35 PM, Philippe Mathieu-Daudé wrote:
> When selecting an ARM target on Debian unstable, we get:
> 
>   Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>   FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>   c++ -Ilibcommon.fa.p -I. -I.. [...] -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/vixl/utils.cc
>   In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
>                    from ../disas/libvixl/vixl/utils.cc:27:
>   /usr/include/string.h:36:43: error: missing binary operator before token "("
>      36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
>         |                                           ^
>   /usr/include/string.h:53:62: error: missing binary operator before token "("
>      53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2X)
>         |                                                              ^
>   /usr/include/string.h:165:21: error: missing binary operator before token "("
>     165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
>         |                     ^
>   /usr/include/string.h:174:43: error: missing binary operator before token "("
>     174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X)
>         |                                           ^
>   /usr/include/string.h:492:19: error: missing binary operator before token "("
>     492 | #if __GNUC_PREREQ (3,4)
>         |                   ^
> 
> Similarly to commit 875df03b221 ('osdep: protect qemu/osdep.h with
> extern "C"'), guard the <string.h> system header with 'extern "C"'.
> 
> Relevant information from the host:
> 
>   $ lsb_release -d
>   Description:    Debian GNU/Linux 11 (bullseye)
>   $ gcc --version
>   gcc (Debian 10.2.1-6) 10.2.1 20210110
>   $ dpkg -S /usr/include/string.h
>   libc6-dev: /usr/include/string.h
>   $ apt-cache show libc6-dev
>   Package: libc6-dev
>   Version: 2.31-11
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because I've no idea about C++, but this fixes the build for me.
> 
> Quick reproducer:
> 
>   $ ../configure --disable-tools --target-list=aarch64-linux-user
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>  disas/libvixl/vixl/utils.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
> index 5ab134e240a..fc28d7456c1 100644
> --- a/disas/libvixl/vixl/utils.h
> +++ b/disas/libvixl/vixl/utils.h
> @@ -27,8 +27,10 @@
>  #ifndef VIXL_UTILS_H
>  #define VIXL_UTILS_H
>  
> -#include <string.h>
>  #include <cmath>
> +extern "C" {
> +#include <string.h>
> +}
>  #include "vixl/globals.h"
>  #include "vixl/compiler-intrinsics.h"
>  
> 

