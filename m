Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B03D9F02
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:55:14 +0200 (CEST)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90sr-00063N-Tb
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90rv-0005IA-49
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90rs-00052P-Ag
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGszhGcxGGbTBPDR9APNvi61o3xFOnchSrDEK1GGpiA=;
 b=gnmWg15xL0WmcniuAbAcQOWDtYhiOpkACdZ7tUR6Y3wG7HJfzQuofieETbOGnM+Ytkr5ke
 35OKFY8S8Nsr6QcBSPgZbW9NTk4jiHconsCIL46g5HyBj6iSSwerk2eWpZ49PjcZ4poWsX
 nE1tFJwBMyflgaXxTFZG9PEyN/b3+KE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-xZnKxpEmM_Kk_GVGLpYI8Q-1; Thu, 29 Jul 2021 03:54:10 -0400
X-MC-Unique: xZnKxpEmM_Kk_GVGLpYI8Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 kq12-20020a170906abccb0290591922761bdso405333ejb.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZGszhGcxGGbTBPDR9APNvi61o3xFOnchSrDEK1GGpiA=;
 b=JGljfAJtmxqg7e4tPjKBjek3YYdWjM0rW4sdPkteeXyFfGZnCeSmgcxqTycbBb7a+y
 JKAwR/GxX9Jbbas8y8Fx373iTTaK2UbL+04wIAvUlTpXFs+ySW67aCtAyGaTSO56KnuU
 uM/WqDhQxsYpwuBhFGzhAVGgqBeEeRVNofnjLARTpkBX/jDU2tcVfUc4QH+C/DFGjxm0
 WtfYvJuLqbuOR7pr7I64KoocTUOuDXD3tI5MWS6emtzfit/HLKiy1n2N+gDevSPeJiQs
 bYFsqCXqNNw1MX1hfFZ0FQUa61BU6FXB+wFcDQFmPIreaRxMlwwvHQ+eH/hHj1u46TyT
 iRvw==
X-Gm-Message-State: AOAM532GfaDMle475Iqp7uN3R/bYOCr0Bzi4op5lKeXDWj470uunRXtW
 4oEgUV0UagYLSCz8HCOjSiFRQ1+C2BvmKhu8eypRLKTFd+OZnuJsT5LGUeDideleNTPYCPKwqSG
 B5pTMzJNq0VIJnLzQ8z/Ndo6ZgKoyPmitLD1JN2KP0quVHp5zq8kSbj5V2h/nJ+f7xlI=
X-Received: by 2002:a17:906:e089:: with SMTP id
 gh9mr3515754ejb.80.1627545248708; 
 Thu, 29 Jul 2021 00:54:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk+1aaAk5v+ObarYW/7r9cZnBFdShQ1yDilLtNBLT6zx0phmDudV2Yj1tktZi08HjyeX/4Mw==
X-Received: by 2002:a17:906:e089:: with SMTP id
 gh9mr3515738ejb.80.1627545248439; 
 Thu, 29 Jul 2021 00:54:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id gu2sm671200ejb.96.2021.07.29.00.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:54:07 -0700 (PDT)
Subject: Re: [PATCH] configure: Add -Werror to avx2, avx512 tests
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210719200112.295316-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2bf7b5c7-82ba-e5f7-0c68-173a24e3fef5@redhat.com>
Date: Thu, 29 Jul 2021 09:54:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719200112.295316-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 19/07/21 22:01, Richard Henderson wrote:
> When using clang, we get
> 
> ERROR: configure test passed without -Werror but failed with -Werror.
>         This is probably a bug in the configure script. The failing command
>         will be at the bottom of config.log.
>         You can run configure with --disable-werror to bypass this check.
> 
> What we really want from these two tests is whether the
> entire code sequence is supported, including pragmas.
> Adding -Werror makes the test properly fail for clang.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 63f38fa94c..cf4616f635 100755
> --- a/configure
> +++ b/configure
> @@ -3884,7 +3884,7 @@ static int bar(void *a) {
>   }
>   int main(int argc, char *argv[]) { return bar(argv[0]); }
>   EOF
> -  if compile_object "" ; then
> +  if compile_object "-Werror" ; then
>       avx2_opt="yes"
>     else
>       avx2_opt="no"
> @@ -3914,7 +3914,7 @@ int main(int argc, char *argv[])
>   	return bar(argv[0]);
>   }
>   EOF
> -  if ! compile_object "" ; then
> +  if ! compile_object "-Werror" ; then
>       avx512f_opt="no"
>     fi
>   else
> 

Queued, thanks.

Paolo


