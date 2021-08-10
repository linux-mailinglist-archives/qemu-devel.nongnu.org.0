Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE8E3E82DD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:21:24 +0200 (CEST)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDWNP-0002m0-H2
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDWLy-00019H-Tc
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:19:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDWLw-0006lb-Qq
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:19:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id w14so3770000pjh.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hJHP2uAJuW+/9VfgAyhJqo/Wz3Lr42gBTMygK4Gib5Y=;
 b=pvAqmCMROMlfKAgZDWZo3hf6ZyVCDtMdfBpw7pknafoR5RAEsBm2hvv81IK5wYpDer
 7A/0vrz46S9nmuZzffoUxSJ34uH6f6CY7M3e5QJvB+8D5/sEvupU5bxHZi6jdEW9SzWx
 ZsNpc4BCx6TLW+fFmKQmgy0Bp793JtKo5PLmwbx/E8hnpprA345POZUbyWuxpZ+pgGug
 AZqpLjcpzhCYkcb+mzecJecpsb+gHQZkJz5BPYjvrW6YrEsEJ1YOSkmPe5und94HSoZc
 m/tjQpavYtBN++rNXBOLsHEG6qihx8JXIKAjsgnSlEe0mg48X9VsuuvZFKNn+I0GLSPb
 jh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hJHP2uAJuW+/9VfgAyhJqo/Wz3Lr42gBTMygK4Gib5Y=;
 b=MGQo0nzIdUFR9VtkbO7e5faZcF2D6GgJOOdhjeahmpOfTPEfOSGWqP4gJc8+1ALvnW
 55IaE0+1rZh6tEDyb0TA9WG3NBoyFmNh/iX8GKoJO801uvuhQKyyUew5dR2JdXWa2y3H
 jetzOD458H/pfC9Zo9PlLTo3TQLkyymsGi5aWEUDM1o1hEx1O+1rG/MNFKZqislIZ38U
 ugcJUkHqcnKwGCfhMj+sQfHDD4zJYLHwkbB2NBKTk/KYMBwxJ6Jp9xBmkkN3PTzPxD2u
 rC/hzgLiElKoHq6cK/ltzfPSKliMBfz7Alkp/W8r9eB4wBsmf0tEhodmrBStJSklxyDm
 0P5A==
X-Gm-Message-State: AOAM5333G1THM0364eenkiKrRmbRCcw3j7nzdlwuxWzYBVHPHkgMMBIt
 h8VpP5/yOyjkk+QxHpjiP96JIg==
X-Google-Smtp-Source: ABdhPJwykSrN32WWhgXa5zwCRu5eu7hpkM3XtnPTzShk5TvvjCsDdZrpjRJPrIZcv2VbvmRQpFVHWQ==
X-Received: by 2002:a63:f342:: with SMTP id t2mr1347627pgj.45.1628619591363;
 Tue, 10 Aug 2021 11:19:51 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z16sm27785199pgu.21.2021.08.10.11.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 11:19:43 -0700 (PDT)
Subject: Re: [PATCH for 6.2 16/49] bsd-user: elfload: simplify bswap a bit.
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3660bb4f-abcf-0f02-ade2-845c0dfe2a16@linaro.org>
Date: Tue, 10 Aug 2021 08:19:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-17-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> @@ -367,9 +383,7 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
>       last_bss = 0;
>       error = 0;
>   
> -#ifdef BSWAP_NEEDED
>       bswap_ehdr(interp_elf_ex);
> -#endif
>       /* First of all, some simple consistency checks */
>       if ((interp_elf_ex->e_type != ET_EXEC &&
>            interp_elf_ex->e_type != ET_DYN) ||

Existing bug here: You should be checking, at minimum, EI_CLASS and EI_DATA before bswap. 
  Otherwise you don't even know you're swapping the correct structure.

I noticed this much later in the series.

r~

