Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF83E7DC3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:46:54 +0200 (CEST)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUtw-0000U6-3t
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUs5-0007KB-H6
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:44:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUs4-00071A-5A
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:44:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so5118220pjn.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1baDQEDwqwg9dsI4ql74FFaQL+CvNzHjwaZr0OU5gaw=;
 b=oE7KQhoBOGE875w0OATnuYHCiiWceEyYCB5mdX3zG6k9SdlJPQPLclC9qpirFmzH27
 lxzjib931IW5r1m8BtRLXZ8Ibf9gG1mr8sCR3MLBUHMtw9lpenMRM0t3SUo8YmS/iFJR
 U2s0LJ579sveftHWgo1tj7dlainN3fHJEbUZ6b4yV6n4R8MUIQ9tRG0bfFedDSxDUxi8
 8UAoqjQgGm5mv+l7DXQPF/Bp3hjb2oyMr1NdjAdFFePAsiRtZULjYzNnYVAjk0CsEAHe
 ZCa4a9Fw2d0jViSKIdaTECIsFCQCAl1q+N0qyUBL4mW4PkjWhq8pGd+Pssz+KnfKHWZo
 YHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1baDQEDwqwg9dsI4ql74FFaQL+CvNzHjwaZr0OU5gaw=;
 b=UI89fm1bfm1e5z+aJ6NVATshe0/My7xuhVBy3ecDc68vFYaNeYkOPvricXkfojRId5
 ajt2uzksYE+xq7NBt627BUzWSJaJRIe+gElVxYs7Nj8emm0UnIupSKzu05wwD+X45svp
 0zJCR4lhIvsRW1D2WDLG+0dWNKm8RU+flPhLrBRA/Mx2uSNyvp6lsqp9FtdG8GCRK2k5
 L/xiO9SH56TnNDmbwnRh1Pb7+12Uf1dnpYY5RLhNtXoRHcFHvhBfGo7R/tFX/yjEw6Xg
 dPhFsShvBW+pm0MxQbIhIp9zyHD6g+oalqsbY+Y5xuhGtZnTD3caCXASNLLMlWoSW/46
 DqfA==
X-Gm-Message-State: AOAM531v+8tV6Bb8IgBnb0+VWI+F7icvN5E6JIKGyu24zMzdb3wG24mm
 RrIz+u9wKWg8On9bVxuipj5hOg==
X-Google-Smtp-Source: ABdhPJx7VpjddWTR58RSI71PV8Oi9yOxKlTccVFow8oKrVwTHnKbCH9PPeXXffs5Yl0m7fL3qPSNdQ==
X-Received: by 2002:a17:90a:450e:: with SMTP id
 u14mr5972918pjg.164.1628613894588; 
 Tue, 10 Aug 2021 09:44:54 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x19sm29114338pgk.37.2021.08.10.09.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:44:54 -0700 (PDT)
Subject: Re: [PATCH for 6.2 40/49] bsd-user: Add target_arch_reg to describe a
 target's register set
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-41-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <755a1305-a022-5ffa-3623-d1c965adeca4@linaro.org>
Date: Tue, 10 Aug 2021 06:44:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-41-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> target_reg_t is the normal register. target_fpreg_t is the floating
> point registers. target_copy_regs copies the registers out of CPU
> context for things like core dumps.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_reg.h   | 82 +++++++++++++++++++++++++++
>   bsd-user/x86_64/target_arch_reg.h | 92 +++++++++++++++++++++++++++++++
>   2 files changed, 174 insertions(+)
>   create mode 100644 bsd-user/i386/target_arch_reg.h
>   create mode 100644 bsd-user/x86_64/target_arch_reg.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

While this mirrors what linux-user does, I've wondered if this wasn't just pointless 
copying.  If a bit of code knows enough about a target to fill in its core dump, why 
wouldn't it just copy the data straight from CPUArchState instead of using these 
intermediaries?


r~

