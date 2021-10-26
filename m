Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1183A43BBA6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:36:55 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTBl-00030i-JI
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfT9h-0001Mf-V3
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:34:46 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfT9g-0008Vj-8b
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:34:45 -0400
Received: by mail-pg1-x536.google.com with SMTP id f5so633951pgc.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=380u5ocE19AbTGLoGPLkQSryvr+vpOntxEmak5q/N6k=;
 b=aDSiqI8GrlGvbuOQkybqtcjNJkzYriBbSYEn8AgkcdstRFwk0dpJwozeBNR8kNqYgf
 fpNacpa2sSlX2cFA392fHL98u+DNyR2HXH/UGm4s3z/ISbEXAKxT61GZABsOPSOKJEfy
 UazZpgpWLRek0QtU99IcDmeeaA2PLV2lKor8w38ADz96N/pdU329uzRRwPPtlpqOpPCi
 kTPUq53AEMISOVyc2Ye+qh1QzqSqSofBHC3FNSeyyPlkhZLuXeqS+J7s6FqwDMMT03oY
 FBOmcG1aPtztw4qQmVx+Eybe/ajeWlfForlS4LFlAl3uhFKf8/j0z8CZt/u79ViLlLyH
 0dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=380u5ocE19AbTGLoGPLkQSryvr+vpOntxEmak5q/N6k=;
 b=frwjiD7NUpNKfJnt7PdWn9bC7+OdNe0dVTth2ctM6te0bKjSJScAh85mUeKY3DDjvx
 ag0iifEaCQjofeubmPbzofnET54Vxp1iJO0Ju//RIFmIjWy9K6Vu0Mv7xN9MoWFADz8L
 FgnYygUO6J00IjdTSAKhZOWw//ON4liEoejMmqvwwBCMQdBw4hh6Krsl8x94BBIXTsw0
 aQCWRoiw5Sp4/2xxz5v0df08/M7WvFoF220Rc/VdI6UVj4z2/Ez+JrWxmEu97/4Ouv7G
 j8PQ2FmueRYfhGzoZWkXADY7USpRjkc7Kn+gZWgxaJ3k36wcUBwAreJUO/t4eSRCTJcT
 lKSQ==
X-Gm-Message-State: AOAM531PXS0JruqKHMByaiaj0kjR/6wagoFiI0KlMGxjKaxMPAk5Hy8q
 gd+2p8nQ/Ig7L7dlAnqQ1JfWGQ==
X-Google-Smtp-Source: ABdhPJxiUwx9lBtoW3evEvF3X8RnvMUOFXjZaeYgvc9JgPbweliSha4QmdLpoAwmDVMq0hCwsVpyaQ==
X-Received: by 2002:a05:6a00:1c46:b0:47b:e953:cf03 with SMTP id
 s6-20020a056a001c4600b0047be953cf03mr18163206pfw.2.1635280482272; 
 Tue, 26 Oct 2021 13:34:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j6sm19636728pgq.0.2021.10.26.13.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:34:41 -0700 (PDT)
Subject: Re: [PATCH v1 28/28] gdbstub: Switch to the thread receiving a signal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <076632af-aa40-b99c-6bdb-dc3a18ec4334@linaro.org>
Date: Tue, 26 Oct 2021 13:34:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Pavel Labath <pavel@labath.sk>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> From: Pavel Labath<pavel@labath.sk>
> 
> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
> thread received the signal. Otherwise, the debugger will associate it
> with the main one. Also automatically select this thread, as that is
> what gdb expects.
> 
> Signed-off-by: Pavel Labath<pavel@labath.sk>
> Message-Id:<20211019174953.36560-1-pavel@labath.sk>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub.c                                     |  8 ++-
>   tests/tcg/multiarch/Makefile.target           | 10 +++-
>   .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>   3 files changed, 75 insertions(+), 3 deletions(-)
>   create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

