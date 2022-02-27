Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F04C591B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 04:21:25 +0100 (CET)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOA7e-0007mR-BP
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 22:21:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOA6Z-0006zc-Cc
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 22:20:15 -0500
Received: from [2607:f8b0:4864:20::436] (port=33494
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOA6X-0005vy-Ga
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 22:20:15 -0500
Received: by mail-pf1-x436.google.com with SMTP id d17so8111668pfl.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 19:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vbURPle3yzBiElO55jnRmMCOS7Ekisd7sm3UJXlOYTw=;
 b=SdAX6h/C5Fz2Im5DyEJASEhqbZ5aHyaQCOukfqWU22sw0gCyeSyn8HUhh0Cww//YJX
 oLZ8DM5WJYEzEEYF4bgRgqv6DmkqrPTNm1EhBa5HqUnGXZtfk5T52YIH77FsVz4S0rKQ
 5wzjrIgIsZ52K5Fo+4V8S/OxbXp7Exb8KqsCuHXH+QNP+8d9aDBS0AvmV1XmKd89GlJl
 Bbei9OHuFj94JPAxoQQtuNwDn6NnQrCiwZBZExSRoFI3NOV1lcG+IbmrZ76FSbEAQbGP
 4Bl4LWtL6em/nda3aoviTPWIXFprAuWufZym2TZaym+3jMAgoZF1z9uO5vXUz3dPCKHZ
 ZiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vbURPle3yzBiElO55jnRmMCOS7Ekisd7sm3UJXlOYTw=;
 b=aeYd8iMSWbXTJGlgMO4vyJ3TXr1aMOydGGsQliQqejITTLpbseYqm/xyNfx7VtG4GC
 nE1SdPTml09dIb96/E/KkuD59QzKBGh75v8qhopJW4keTJoP8Jpc1LZA7fUYsCpzb/4a
 xApVShB0fdhCR+5ai9lD+moo1nR4x/wnyf0xECvnj7it4/uWcN/FIjgZXaAQB+3oB+2k
 osHVxnIXZUBMIdX8fmsm8tyRd6ZqiYQnl87TIjzeeB2Y4xU+JxQK+r5OT0yT/mjDugZb
 Mj5P5bifoOeY3fqxoe659AfPAsAPgdZWBrG225zSR4o6syl8SuvJyLpw9yqLUz9YUIKW
 BCYQ==
X-Gm-Message-State: AOAM532FiOEkQ+mU5bIN9q5E06aB4lMCI0CItiRTBv23gRdpLybj3RYY
 6g5P+aPvExsQqKcfHODQQUP43Q==
X-Google-Smtp-Source: ABdhPJyzZJ99UGlHXCDB9lklGRTMK6DDvQFl65+EGSPpUK4PIoMrx1qPNEJFfMP8Q483ztqWXxP+Vw==
X-Received: by 2002:a62:84c9:0:b0:4f3:9654:16c5 with SMTP id
 k192-20020a6284c9000000b004f3965416c5mr15292062pfd.39.1645932011923; 
 Sat, 26 Feb 2022 19:20:11 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9bf1:95f3:95b7:8abd?
 (2603-800c-1201-c600-9bf1-95f3-95b7-8abd.res6.spectrum.com.
 [2603:800c:1201:c600:9bf1:95f3:95b7:8abd])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm12788842pjg.24.2022.02.26.19.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 19:20:11 -0800 (PST)
Message-ID: <bd55c350-be88-2125-8976-c95d85eee3aa@linaro.org>
Date: Sat, 26 Feb 2022 17:20:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/16] bsd-user/bsd-file.h: Implementation details for
 the filesystem calls
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220226170744.76615-1-imp@bsdimp.com>
 <20220226170744.76615-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226170744.76615-14-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 07:07, Warner Losh wrote:
> An include file that pulls in all the definitions needed for the file
> related system calls. This also includes the host definitions to
> implement the system calls and some helper routines to lock/unlock
> different aspects of the system call arguments.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 30 ++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  2 ++
>   2 files changed, 32 insertions(+)
>   create mode 100644 bsd-user/bsd-file.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

