Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0664EE5C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:01:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6D7j-0004h4-Hx; Fri, 16 Dec 2022 10:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6D7i-0004gv-3p
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:59:46 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6D7g-0001hf-8p
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:59:45 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso8717194pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L59+mIJ7ylWWN4Xqil1+BbWUD33F66Sva01wsVVLKEA=;
 b=cNaWctkfukEXlIo9FAZIZ/cKMyB56KBJD/uRHMzxMH+gEj/xnGSMWx3ytZYi6ncuI+
 Y55lCJUYn3z+a7A7Xux2569OHTOe2gY1LD7eHXb53jtneaD2BO3rg5jcuEZe+KVbevAU
 qx/zvo4nSHLvLCf1MJeM6N1Ld016qF507WPKb+iLRwH68/3308YIdh5oXFLgO6Dcw7nO
 T5oWtmXD6oYW/QwHeNdf7jWu+bg9V+TLDHKax3wOiaGHicms8SYjpvnU1mIUEoNS6m6Y
 W32muPxa10TEnKOBc9fITq2vwzVJ0DhUl8jvGX+leeSmkrJUQTBENvvzs+X6CiyIsQ7c
 rFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L59+mIJ7ylWWN4Xqil1+BbWUD33F66Sva01wsVVLKEA=;
 b=TVptW2IEgq1blnPDyTLXO9+bVKRaXQgUIR0ALalk8u2NcUJ2Kt3yG+WB6lr+LETlvJ
 K1DM/gqwuXClE05G1a6jvWnzUKjuGCB+6SYCJKrlbzhrZwwkKoUXOWHnASzSk0bYfpA6
 czYjgPkRXH4PeYgVvoX/npcz54Yyr5Mt3uozbr/1J8oPjKjqZrNybFcaYTXdi+uoIKAl
 A+mx6OZP3gP49VuaT5Jdvzi0cNRx+aM2dhXo3uMczXBjF8uHrfqZPSztau3aQVoZ0eUI
 KDUnjVakf6yblKLD5AlqW6kAh9qShxa3wnfCxow9iOBVT1+bxAhho3NCu+AqWpEImWqz
 QiUw==
X-Gm-Message-State: ANoB5pmq1K32kce/+SR0alaJRk3Q9jvE+r+NfYyvVuJ7+JSIM3djcLyY
 XEUF9Xu/R38tS0IhZr0N6OlJWQ==
X-Google-Smtp-Source: AA0mqf68tIyh52zhDG8OVXg/9HlVQAdBdXO7WUEovRcZ4hoGRTtvHZzd1ZLRmRqsJooIaRXxnjyU1w==
X-Received: by 2002:a05:6a20:5481:b0:a4:93ca:a2d with SMTP id
 i1-20020a056a20548100b000a493ca0a2dmr60700984pzk.49.1671206382244; 
 Fri, 16 Dec 2022 07:59:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 a24-20020aa79718000000b0056b6d31ac8asm1697390pfg.178.2022.12.16.07.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 07:59:41 -0800 (PST)
Message-ID: <1009093c-9809-7c0a-fd75-a59fc7c3c1c9@linaro.org>
Date: Fri, 16 Dec 2022 07:59:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs: do not talk about past removal as happening in the
 future
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20221216101506.524217-1-pbonzini@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216101506.524217-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 02:15, Paolo Bonzini wrote:
> KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
> the sentence describing it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/removed-features.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 63df9848fda2..7e12145c120d 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -565,9 +565,8 @@ KVM guest support on 32-bit Arm hosts (removed in 5.2)
>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The Linux kernel has dropped support for allowing 32-bit Arm systems
> -to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
> -its support for this configuration and will remove it in a future version.
> -Running 32-bit guests on a 64-bit Arm host remains supported.
> +to host KVM guests as of the 5.7 kernel, and was thus removed from QEMU
> +as well.  Running 32-bit guests on a 64-bit Arm host remains supported.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


