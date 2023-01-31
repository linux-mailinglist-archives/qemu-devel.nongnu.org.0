Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD106834E8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMv6U-00056Q-7Q; Tue, 31 Jan 2023 13:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMv6Q-00053x-NX
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:11:32 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMv6O-0002qv-Vn
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:11:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 143so10651158pgg.6
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4Vqs0iClb6pKF8sIxy5oGledBd/RI6obklhjA91XmQ=;
 b=MImVhWkQL4Cn7Hj8ZlK3JQLovoVIrBr7QROWwvENWZ0Sm3lwojMp9tptPOif2vHBLv
 vb62yy2PdtvCDc1Rw0VXBjlQHYDZqkrVTYBJLSBsZZdXhxEo2hPFHRRBjYeEU5nF7vz7
 gWnMTtZVgtrTRpRnzmZ7RrXByAypZmobS5e2aGh3JrWEFruy/DxxA2C1ifOnvb+R8l8K
 t53JtBMhlei4wz938c7UYdlfKgbFrTeg0Ml8peC+R7OHZThhiBk9CruAFuKPaQgcHXnm
 Woax/MKWZupYGd3SCATmzgybSlCpYs+vtjJSs7mWblTmlG7PwBS2AXk3UJIbb02hyVNG
 qJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4Vqs0iClb6pKF8sIxy5oGledBd/RI6obklhjA91XmQ=;
 b=2mb/GsrHHbI0EKoVrzihzZ4Td8Wad2viLrNEQh5jucLE112+XRY+2PTh8KCWf+jxmR
 lKnasUFm1SwG3Zri34v/uC6cxHhrOVQw+CLY03esOpwRaAi7wHbD6m2maeINMIC7Ve0y
 tiT9v5bp5IXAKL74q82vuq5bXc6K0hJsr1Mp3c7euyfUZ/Jq9bFZS625LSlDgplfwz0/
 h+SO607cJDIXCKCMaClMPNqFD5dlL7QEfIGMRNQwbIAwdPNZWclZP4b40Q5oJCBrLgWC
 5Jv9u972mCz5JyRp9ww+j+AAUXxYnQ3Ab7WkOugf1ZSWxVPJ7s6Ixx/fa7F0T/HRKvk8
 tcvg==
X-Gm-Message-State: AO0yUKUvV47bQW5obizjn9xo3WxD3RLKCB2JsMBeLyD7UnLemGc/0Bvr
 bEPYm/b4uiZmOhXAy2Pho3WFHg==
X-Google-Smtp-Source: AK7set9pLAOmV+jm0DG2ctnPkdSaWrtcJ+IAvo5+6OyPEUbr+mov35XUR0pzH2MPiFCYbWDFObEwZQ==
X-Received: by 2002:a05:6a00:b94:b0:593:e84a:deda with SMTP id
 g20-20020a056a000b9400b00593e84adedamr5117287pfj.7.1675188687089; 
 Tue, 31 Jan 2023 10:11:27 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 u2-20020aa78482000000b0058e12bbb560sm5798367pfn.15.2023.01.31.10.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 10:11:26 -0800 (PST)
Message-ID: <13702cf4-bc17-0ccf-96d6-040c3a221f7f@linaro.org>
Date: Tue, 31 Jan 2023 08:11:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] configure: Bump minimum Clang version to 10.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, anthony.perard@citrix.com, berrange@redhat.com
References: <20230131180239.1582302-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230131180239.1582302-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/31/23 08:02, Thomas Huth wrote:
> Anthony Perard recently reported some problems with Clang v6.0 from
> Ubuntu Bionic (with regards to the -Wmissing-braces configure test).
> Since we're not officially supporting that version of Ubuntu anymore,
> we should better bump our minimum version check in the configure script
> instead of using our time to fix problems of unsupported compilers.
> According to repology.org, our supported distros ship these versions
> of Clang (looking at the highest version only):
> 
>                Fedora 36: 14.0.5
>        CentOS 8 (RHEL-8): 12.0.1
>                Debian 11: 13.0.1
>       OpenSUSE Leap 15.4: 13.0.1
>         Ubuntu LTS 20.04: 12.0.0
>            FreeBSD Ports: 15.0.7
>            NetBSD pkgsrc: 15.0.7
>                 Homebrew: 15.0.7
>              MSYS2 mingw: 15.0.7
>              Haiku ports: 12.0.1
> 
> While it seems like we could update to v12.0.0 from that point of view,
> the default version on Ubuntu 20.04 is still v10.0, and we use that for
> our CI tests based via the tests/docker/dockerfiles/ubuntu2004.docker
> file.
> 
> Thus let's make v10.0 our minimum version now (which corresponds to
> Apple Clang version v12.0). The -Wmissing-braces check can then be
> removed, too, since both our minimum GCC and our minimum Clang version
> now handle this correctly.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   configure | 25 ++++++-------------------
>   1 file changed, 6 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

