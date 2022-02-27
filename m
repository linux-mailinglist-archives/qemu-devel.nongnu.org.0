Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A994C58CE
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:31:00 +0100 (CET)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7Sk-0005AS-TL
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:30:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7RO-0004Lp-Iv
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:29:34 -0500
Received: from [2607:f8b0:4864:20::630] (port=34675
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7RN-0007rX-45
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:29:34 -0500
Received: by mail-pl1-x630.google.com with SMTP id ay5so4985138plb.1
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nd+cE4UmCxJ4E0xuZ/O+NJlcAwbGJrXSDkv5dTWUp7Q=;
 b=pcKZzF9rXFAP34bbpUdbZWC+/J0PeWQfT0BgcBU/jKDvPkxrpg96dXm4Hvpaoocvi0
 CULUBzhscZ/js4J58NWsm7TL96qLy0rkLcanY+8VZU0pY6YtFQUMI3Vdk/PVmSOIoJM1
 zwkmuDaigCLhrOwlSETOdnH6/HqjUBBeLC/bIkcySA3tYntKCxFmmM51GGsLpHm6vIhX
 bX3LQxQF3T2b9oSgzi4G+ecEFNwFgcZGo7cdnd/CVffkIq3LwQoCWhMpH+dcyn5e/Km6
 E55HkjtK9AvnRpcV3eHvyuM0usSIoxq2tjLPbN/Tk0x1vs3/JRbr5EfuOqXQA/PnWkNn
 T5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nd+cE4UmCxJ4E0xuZ/O+NJlcAwbGJrXSDkv5dTWUp7Q=;
 b=i67XJlaGwOMyLeVAR4Wtlg4cuD9n3OJvZ9pdIsEGfr2S5EjZNjiPnP2NTTxowgxrYq
 DT1n7StqnpCmyrcdEDP+QBalR0rxIdCmaxGLex/75Op4bazkB/IZUj6CtISqoDJwaf+M
 YXuETSyfjT72ITHfk9vPwsJqbqFooYBN+BrI1VCpoXd8uapt49gdPQa+u7JF1IQH1qf/
 lYRCWyM3zONEEqqD6FuXsyQiv9lhWPTF6bib0hL2ka1JHTeGNw1+M156myeDnkhmjRL0
 f/HxaWr9fs+gD1O96DYJAltmm+H7/m53t83Rki5i415cAVy+87SS3mYHW7zSdmV7W/ro
 LyMQ==
X-Gm-Message-State: AOAM530AMXvMc9EorBBj0LWf7GJUyjAIzCYHhS+EsfHhU8J81Y+IGlEG
 ZIvTDeRJSLs+KhW1jLKN4ZDfMw==
X-Google-Smtp-Source: ABdhPJxE4o/Gu1s+pmyeSw51StOVuKt/Nr0tBrt+Y3lDzTuVsbXxGmYwfeqx/i8wX9nyzQh77UfyEw==
X-Received: by 2002:a17:902:bb02:b0:151:56a8:f80b with SMTP id
 im2-20020a170902bb0200b0015156a8f80bmr2584610plb.30.1645921771759; 
 Sat, 26 Feb 2022 16:29:31 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056a00244300b004bc9397d3d0sm7920073pfj.103.2022.02.26.16.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:29:31 -0800 (PST)
Message-ID: <428a0ab6-967f-ad71-5f3f-d0320fad20cc@linaro.org>
Date: Sat, 26 Feb 2022 14:29:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/9] util: Unify implementations of qemu_memalign()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> We implement qemu_memalign() in both oslib-posix.c and oslib-win32.c,
> but the two versions are essentially the same: they call
> qemu_try_memalign(), and abort() after printing an error message if
> it fails.  The only difference is that the win32 version prints the
> GetLastError() value whereas the POSIX version prints
> strerror(errno).  However, this is a bug in the win32 version: in
> commit dfbd0b873a85021 in 2020 we changed the implementation of
> qemu_try_memalign() from using VirtualAlloc() (which sets the
> GetLastError() value) to using _aligned_malloc() (which sets errno),
> but didn't update the error message to match.
> 
> Replace the two separate functions with a single version in a
> new memalign.c file, which drops the unnecessary extra qemu_oom_check()
> function and instead prints a more useful message including the
> requested size and alignment as well as the errno string.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   util/memalign.c    | 39 +++++++++++++++++++++++++++++++++++++++
>   util/oslib-posix.c | 14 --------------
>   util/oslib-win32.c | 14 --------------
>   util/meson.build   |  1 +
>   4 files changed, 40 insertions(+), 28 deletions(-)
>   create mode 100644 util/memalign.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

