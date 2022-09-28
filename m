Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2AA5EE829
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:18:11 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeRW-0005Dl-DN
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odeI5-0003bN-9L
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:08:28 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odeI3-0004kH-Jv
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:08:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so3957196pjs.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Yb5jkatCbd934Hi5+gLiuAZZ03aq8OvW9FfNUIdbvAA=;
 b=zKhgNx4I9jUEzOrOF9n0WolL36EOJLXMk+5Rq05cmXySje9VxaxCIe+m6MDX7oojcY
 bvbyxKQHsVkvRnZ5hb1CiUlQs0XEKOKo4/v39f4cMyYAdGT8saDSFeFEpNwPNTQW2VlQ
 wZq4Myz7tW4+xEW1DiJKFKY9bbXYbrk++TEc0NQgKo5FkvkF4POUCPYl6dQw7O8tZcr8
 dsjIdEGhUq7AQkft5BdAhfqDp9wiBJvK4DSyhqwLZBSaSDgkWKs+sXO3F7sYgWj5o7+H
 LJwpMjbGeh+MVF/SiS6DsPJIIDFtRdQar0xPR7GFs9DNA7nZIond12h+iHEH7wuULwin
 6Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Yb5jkatCbd934Hi5+gLiuAZZ03aq8OvW9FfNUIdbvAA=;
 b=5TZZuwtd6Kxr06IDRC9iEk9l6cFZDr6GU5gYnHEePW5Gpa4n0tWbP3u0Gd08ghT2CG
 7mdpG8suqeuA/Seu9DtBgmCFyEKiAUy+osnh9fFthL2HYjziLGlTzqzWHA+9BYR4N8EW
 J4AYgGiFxqHcpzxQ95SnbKuutFyxcyCDhLVvg9XWiB7XzxIkFyoM38+yehVNDEfpccW1
 bSdRBTumotbv9SCyll4jER+FWAjo3cN1A5NbFfsiuhX351mJqFhDRkK3IXnuBoUGcZja
 bsSSpHq+9mzd07biKxjpSZopjQtfjgBu+h8FM2Iv4KYh900SGmsoJWKHAdX0lYEvPiR8
 4CLw==
X-Gm-Message-State: ACrzQf02hPk/he3HgR6AcU4BO9SK15zVMxsTTTMuheuQDLwFcb9STEum
 kzDpP8611v3iAOJ+U7Jj6XKqLw==
X-Google-Smtp-Source: AMsMyM7NkCEfxJeYLJOoWYJWxLJBrQc+wjWTksHP9VxgIol+Acx+fHL+Xa22yz1+4UGKBrFaZ9OeIw==
X-Received: by 2002:a17:902:7107:b0:17a:46a:b0bc with SMTP id
 a7-20020a170902710700b0017a046ab0bcmr1642756pll.172.1664399302055; 
 Wed, 28 Sep 2022 14:08:22 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ce8d00b0017534ffd491sm4239405plg.163.2022.09.28.14.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 14:08:21 -0700 (PDT)
Message-ID: <d25bff61-646a-6ccf-0b43-20e6f1e8a85a@linaro.org>
Date: Wed, 28 Sep 2022 14:08:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] configure, meson: move C++ compiler detection to
 meson.build
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-5-pbonzini@redhat.com>
 <afb177dc-ab07-5167-e559-5b5280150c46@linaro.org>
 <CABgObfbPcy63-nZBzZe1Dtinm-h0FmoHYukZQY6uxLMsn8fesA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfbPcy63-nZBzZe1Dtinm-h0FmoHYukZQY6uxLMsn8fesA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/28/22 12:21, Paolo Bonzini wrote:
> Heh, I wanted to get it in for exactly that reason, so that a future revert would not 
> introduce the test in configure. But I guess having the patch out there on the archives 
> may also be enough.

Heh.  I suppose that's fair, being wary of reversion.


r~

> 
> Paolo
> 
> Il mer 28 set 2022, 18:25 Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> ha scritto:
> 
>     On 9/27/22 02:59, Paolo Bonzini wrote:
>      > The test is slightly weaker than before, because it does not
>      > call an extern "C" function from a C source file.  However,
>      > in practice what we seek to detect is ABI compatibility of the
>      > various sanitizer flags, and for that it is enough to compile
>      > anything with CC and link it with CXX.
> 
>     Maybe just wait a moment on this one?
>     We have patches on list to remove the last use of C++.
> 
> 
> 
>     r~
> 


