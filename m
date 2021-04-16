Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B536276B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:05:47 +0200 (CEST)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSqg-00010i-2s
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS5k-0002Ka-KP
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:17:16 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS5i-00057g-VM
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:17:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso14993299pje.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z/W/bvZfhaKHTERL4p+BlaKetsewOq0Q6+GGVjacDas=;
 b=C5nVBVWgS/e9+cLSzuz6ZgI3pdyCyPz3n3TqL9O8qVES5uEDFpouHCQcLaUJHJmaYX
 I0DTScfuRUA6nqVS8Dvy6XxX1g7UwFTCQX3ecTd36fBPsQVPt8b6SFiEPCQbh0/sHLEJ
 AFoVpYyYPx8FwheGItV9C8vxggO6X9BkSom1+2zxv6yOnucsAtp0YMI6FK9B6Q29K59S
 RF2uiMkLKqE01tEMn7Pe5XQ8uJzkjn1SS2Z1Km0uNWNeGad4sIV7oioi3nj3gssVr1bV
 NdYgcguq/S6EIawVavIadlqJLJ8kzObqBPzkqPBsC6jKpMVCADPsJ8EfYLNrHzvPUOTx
 kUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/W/bvZfhaKHTERL4p+BlaKetsewOq0Q6+GGVjacDas=;
 b=PhHC8RI++PVgE051LlHI8P/igzpYXGtWufnacYVv+agSpsrgrLlV/RK7dbGOjE4zzX
 vBypNkVX43OC/xKpkFSUjxxTngNZxZefLoT4sclbwJpzHJV62oMktDMe2Tuqp8hyMlVd
 6+EzcEv9d9spkafjVWHdBFpelRDIT0f6NosElj4NuGAfjr+c7odeedQW4smRg5yvRnsa
 NQ+f69PW1Dk6gvL+lM0e5ouyea2Zlh4/nBIGc5fYQwPWM6YrQggOPxO55MjM94DYfgMv
 yWbqqWGh35BUpjQHFmIbmdvL5+AnpMDPUQft4bFwMCL1UDFH7PAxgA/8C7vMiQxeW4zn
 Z41g==
X-Gm-Message-State: AOAM533oyMuMhqeOFbX6UQ+BlgZwrcOkGjgwf/QO6MxPeAgdYEdiUvN1
 jBTSewlsMXAE+ZJv8DHGyElSoA==
X-Google-Smtp-Source: ABdhPJzAXKYkoA2nRlU9JtVnSrR2CQtDzVuMiAT15G2qkKHcwYad9NTOYWhd/gQHVHFILb/GrFqs9A==
X-Received: by 2002:a17:90b:60d:: with SMTP id
 gb13mr10471900pjb.173.1618593432133; 
 Fri, 16 Apr 2021 10:17:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h24sm5364247pfq.123.2021.04.16.10.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:17:11 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 2/6] osdep: protect qemu/osdep.h with extern "C"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64378e37-5bc7-8c52-19de-c43e6b2b9e7a@linaro.org>
Date: Fri, 16 Apr 2021 10:17:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:55 AM, Peter Maydell wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> System headers may include templates if compiled with a C++ compiler,
> which cause the compiler to complain if qemu/osdep.h is included
> within a C++ source file's 'extern "C"' block.  Add
> an 'extern "C"' block directly to qemu/osdep.h, so that
> system headers can be kept out of it.
> 
> There is a stray declaration early in qemu/osdep.h, which needs
> to be special cased.  Add a definition in qemu/compiler.h to
> make it look nice.
> 
> config-host.h, CONFIG_TARGET, exec/poison.h and qemu/compiler.h
> are included outside the 'extern "C"' block; that is not
> an issue because they consist entirely of preprocessor directives.
> 
> This allows us to move the include of osdep.h in our two C++
> source files outside the extern "C" block they were previously
> using for it, which in turn means that they compile successfully
> against newer versions of glib which insist that glib.h is
> *not*  inside an extern "C" block.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> [PMM: Moved disas/arm-a64.cc osdep.h include out of its extern "C" block;
>   explained in commit message why we're doing this]
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/compiler.h |  6 ++++++
>   include/qemu/osdep.h    | 10 +++++++++-
>   disas/arm-a64.cc        |  2 +-
>   disas/nanomips.cpp      |  2 +-
>   4 files changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

