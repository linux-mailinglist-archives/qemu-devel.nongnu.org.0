Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E90382113
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 22:59:17 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liNr2-00015y-GL
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 16:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNpz-0000PN-Qg
 for qemu-devel@nongnu.org; Sun, 16 May 2021 16:58:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNpy-0005Sz-3K
 for qemu-devel@nongnu.org; Sun, 16 May 2021 16:58:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y14so2251584wrm.13
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oFF/KqTLIUGtPSFLoD2Kn7XfzezL6Jr0ZzfxlSQnccg=;
 b=oKBOYVpSPSL5yzMIL9Z7Abe0rR0cmsAZFAHEzs75vD1avJ/eHD8ulT3Z8O5TU8ujOx
 t9cu67pj/cR+hAj/AFST7oZMUKwyhPUESWupQQzJ6Gfw7qGKNCa3uWBJB+PrvDcLOvrH
 iDsIFsyPz03Vqcm9Iv8U3+59BHOBS0V3/R3Y3k8IqBD1tWt5BtWNEAHv+IDDmyDu0aQj
 WwLoL2l/MDSxi5wIwHzEspkUZnUpMRWq0kgXX5Ok1h7GovovLNFAZX7L4G+aXW6fFQFw
 vt0qaXkfjD2CYLkAqECJz2jLyTx7AEOCziL1pWHligmxG2e9FDlagHm/bRXd/Ucpbll9
 IaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oFF/KqTLIUGtPSFLoD2Kn7XfzezL6Jr0ZzfxlSQnccg=;
 b=oJvCC3kFt0/DsSaHiKA06LgMB8nQl+4zPOcFOv8CQKvqgIHvgpxQKpZTxKsdS/tgup
 CzGPM0fRwEEYqLSNcMdkfGhKIobeICfSuXC5B1MQm9leToAOC9G+diKSa11lacqC12Cj
 gLE7HH0J558SIRYl7T4ajiIK/Hij/dUbZMvuyiSBhIteIjlc2OeCIVcuDPnoI82C1jvl
 o3WFjt/XGXMmzpY4YY1Pioj2fLPfJ8Bw8DNmj6UmW+IBRYxBYZdK9wXY3KkWPZUpZrwP
 55XCxKCuChIgNk3MNubEZrsYg97x6JZAQVAKTH/+KEj+UT+fX505pNgx/OCrTZpoLBBt
 do4g==
X-Gm-Message-State: AOAM532+8sSvv5tBaxhlPOSYfxluorSyWVB3spfbHDUJWU+Dd/qoHSfa
 UeI0ms3hDjYge867JxD8kQQ=
X-Google-Smtp-Source: ABdhPJxrAKNRj9A1jj8f1qVvC9te2ADsgsJPKQWqG3L+PRJSApl3Wbh6SbrteiNn+QRK4d5JST9eRQ==
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr72656979wrz.105.1621198688581; 
 Sun, 16 May 2021 13:58:08 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d127sm17997774wmd.14.2021.05.16.13.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 13:58:07 -0700 (PDT)
Subject: Re: [PULL 17/20] configure: Poison all current target-specific
 #defines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210514121518.832729-1-thuth@redhat.com>
 <20210514121518.832729-18-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5d6e779f-1bd8-8e71-860d-a3dccb55e7e8@amsat.org>
Date: Sun, 16 May 2021 22:58:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514121518.832729-18-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 2:15 PM, Thomas Huth wrote:
> We are generating a lot of target-specific defines in the *-config-devices.h
> and *-config-target.h files. Using them in common code is wrong and leads
> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
> as expected. To avoid these issues, we are already poisoning many of the
> macros in include/exec/poison.h - but it's cumbersome to maintain this
> list manually. Thus let's generate an additional list of poisoned macros
> automatically from the current config switches - this should give us a
> much better test coverage via the different CI configurations.
> 
> Note that CONFIG_TCG (which is also defined in config-host.h) and
> CONFIG_USER_ONLY are special, so we have to filter these out.
> 
> Message-Id: <20210414112004.943383-5-thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile              | 2 +-
>  configure             | 7 +++++++
>  include/exec/poison.h | 2 ++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index bcbbec71a1..4cab10a2a4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -213,7 +213,7 @@ qemu-%.tar.bz2:
>  
>  distclean: clean
>  	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
> -	rm -f config-host.mak config-host.h*
> +	rm -f config-host.mak config-host.h* config-poison.h
>  	rm -f tests/tcg/config-*.mak
>  	rm -f config-all-disas.mak config.status
>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
> diff --git a/configure b/configure
> index f05ca143b3..0e4233fd8a 100755
> --- a/configure
> +++ b/configure
> @@ -6473,6 +6473,13 @@ if test -n "${deprecated_features}"; then
>      echo "  features: ${deprecated_features}"
>  fi
>  
> +# Create list of config switches that should be poisoned in common code...
> +# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
> +sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
> +    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
> +    *-config-devices.h *-config-target.h | \
> +    sort -u > config-poison.h

In my --disable-system builds I'm getting:

sed: can't read *-config-devices.h: No such file or directory


>  # Save the configure command line for later reuse.
>  cat <<EOD >config.status
>  #!/bin/sh
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index a527def5f0..7ad4ad18e8 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -4,6 +4,8 @@
>  #ifndef HW_POISON_H
>  #define HW_POISON_H
>  
> +#include "config-poison.h"
> +
>  #pragma GCC poison TARGET_I386
>  #pragma GCC poison TARGET_X86_64
>  #pragma GCC poison TARGET_AARCH64
> 


