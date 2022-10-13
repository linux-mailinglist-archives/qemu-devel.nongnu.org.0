Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CE5FE33A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:24:33 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4kq-0001US-1d
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4iv-0007Qr-VU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:22:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4it-0000RW-4X
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665692550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyKFyIOToy9EpCv60Z/TaPL79CxTtjb7piI61UKtSvE=;
 b=NcfX3Yek9poD5w9u2+t8FELLBQfeKEAeUGs97tAP6WoaJIVWCyyYoh2D9ix5Z+UxK/7D9v
 HV3hEl/5I5KR2Mt/g3Lcp8QzelcYHYEi5oNwthOcmn7m5wypLslLYl+AjOCqmnJHoSHM0E
 VkQOht7bQc8Kp42rIu18co7Fji+Vu20=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-TIk8w1N3MAOWKWRfuCp89A-1; Thu, 13 Oct 2022 16:22:28 -0400
X-MC-Unique: TIk8w1N3MAOWKWRfuCp89A-1
Received: by mail-ed1-f69.google.com with SMTP id
 v4-20020a056402348400b0045bd50cb9adso2235678edc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hyKFyIOToy9EpCv60Z/TaPL79CxTtjb7piI61UKtSvE=;
 b=gXIoRl2mQZDlHsIVdsS8r9TiqSfRIkgUf+H3bJSqE6UVr8tIKhSNlJlXJA0wW2RXzh
 Ojt51amAR5l51qDsk1332rZs8DLID7nE0NGmOs3zPHcHymUFw89qHlya/TZkk/bvVlWK
 9If2ayvgCU/1cuttXVfWTsoIPi6KCU/Br814UuVFpvsDSnZrU7zBtRFlcgEkKEJQxl0b
 uw1PvbJCyFNdJrM5KreLGgPnrAxbE+6xGTx1PfnGogyRAwFJlO/jCpvJt6f4iTQUlVpB
 DP3GLGHDeNPYUbNE5v2dXA809oA3wIxzTXhF4GWrpz+fKuyIEYH/P4XVipVaDGFq9/sV
 33aA==
X-Gm-Message-State: ACrzQf3Zdg0BQfXrpfStmv7kn8NShE+zCLGKrwscXqIaqc56/rGEJrnT
 XaoVyRQyWm1ES37o+1rFD2uycGOUOh0blQW9VX+DXL15kUzgKdrjWAmvvi214sbMPlezFVhvmYE
 lzVn4BtVfmgJnKmg=
X-Received: by 2002:a17:907:968e:b0:78d:d68d:6751 with SMTP id
 hd14-20020a170907968e00b0078dd68d6751mr1085111ejc.403.1665692547661; 
 Thu, 13 Oct 2022 13:22:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YzRRZ1cgr4nFAc0T7oNO6iS4bKXxvlGeu2h8QQn3md4FdZeRbnw8N5LzMbVII8ee04gQrtw==
X-Received: by 2002:a17:907:968e:b0:78d:d68d:6751 with SMTP id
 hd14-20020a170907968e00b0078dd68d6751mr1085094ejc.403.1665692547334; 
 Thu, 13 Oct 2022 13:22:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 m13-20020aa7c2cd000000b004580b26e32esm387317edp.81.2022.10.13.13.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 13:22:25 -0700 (PDT)
Message-ID: <21c7fbe4-fc7f-554b-29a3-88a22ea0dbf2@redhat.com>
Date: Thu, 13 Oct 2022 22:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] configure: Avoid using strings binary
Content-Language: en-US
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <3936c716d6fe31bd6c2a8779775c5c0d1cf7fea9.1665668535.git.mprivozn@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <3936c716d6fe31bd6c2a8779775c5c0d1cf7fea9.1665668535.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/13/22 15:43, Michal Privoznik wrote:
> When determining the endiandness of the target architecture we're
> building for a small program is compiled, which in an obfuscated
> way declares two strings. Then, we look which string is in
> correct order (using strings binary) and deduct the endiandness.
> But using the strings binary is problematic, because it's part of
> toolchain (strings is just a symlink to
> x86_64-pc-linux-gnu-strings or llvm-strings). And when
> (cross-)compiling, it requires users to set the symlink to the
> correct toolchain.
> 
> Fortunately, we have a better alternative anyways. We can mimic
> what compiler.h is already doing: comparing __BYTE_ORDER__
> against values for little/big endiandness.
> 
> Bug: https://bugs.gentoo.org/876933
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
> 
> v2 of:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02054.html
> 
> diff to v1:
> - Fixed reversed logic
> - Ditched custom compiler macros in favor of __BYTE_ORDER__
> 
>   configure | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/configure b/configure
> index 45ee6f4eb3..2ac26c6978 100755
> --- a/configure
> +++ b/configure
> @@ -1423,30 +1423,31 @@ if test "$tcg" = "enabled"; then
>       git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>   fi
>   
> -# ---
> +##########################################
>   # big/little endian test
>   cat > $TMPC << EOF
> -#include <stdio.h>
> -short big_endian[] = { 0x4269, 0x4765, 0x4e64, 0x4961, 0x4e00, 0, };
> -short little_endian[] = { 0x694c, 0x7454, 0x654c, 0x6e45, 0x6944, 0x6e41, 0, };
> -int main(int argc, char *argv[])
> -{
> -    return printf("%s %s\n", (char *)big_endian, (char *)little_endian);
> -}
> +#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__

#if defined __BYTE_ORDER__ && ...

> +# error LITTLE
> +#endif
> +int main(void) { return 0; }
>   EOF
>   
>   if compile_prog ; then

And then you need to check if it *fails* (i.e. "if ! compile_prog ; then 
bigendian=no", and likewise below for the big-endian test).  This way if 
the macro is not defined both tests will compile successfully and you'll 
print the error here:

> +  if compile_prog ; then
> +    bigendian="no"
> +  else
>       echo big/little test failed
>       exit 1
> +  fi
>   fi

You can test it by misspelling __BYTE_ORDER__ intentionally.

Thanks,

Paolo


