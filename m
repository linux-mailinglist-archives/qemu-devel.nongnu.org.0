Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D693AA1DD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:54:45 +0200 (CEST)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYoO-0001Lr-Sd
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYmQ-0007v5-TJ; Wed, 16 Jun 2021 12:52:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYmO-00050n-TU; Wed, 16 Jun 2021 12:52:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c9so3457966wrt.5;
 Wed, 16 Jun 2021 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4zP8LM6Rcs34w258eINQcx93/kkyoFdgqTHw246VKiA=;
 b=VFNRbll+fZrHN+1YhBSTP1V6C+MxARlhmAx9BjTqjAj/qrSHEhvtndjh9GIFg6N/7j
 YO5j3ch0v2vkMQ+R52q6Uc5qmCJtBfLhp+8Nt1yq7PQu4rVnzjDtQ+VOgjYwUSrmP1qv
 2BibOML6kRuiqc7nq1lVJ7uDkRtiM+aiXhtBoRRZetEUq2qDXbYyDVgCDu8ASBarMxYe
 kLJFr5zSxQNyn+3QdrsNsAnjBC9I4VZRMj+PLdT52UFgZI+5g5p1iaj42EOGISMxk4Sk
 Bl1BtXWRxfaYPqNkU1OTou++KLFEZPptAEgHk9uS0UkZ/LhVC0gALc7Tf4g/AIhI0U7+
 1gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4zP8LM6Rcs34w258eINQcx93/kkyoFdgqTHw246VKiA=;
 b=Ek25aTQpt2AxEG8JbQRikfV+D7B2jX29ENWFaJ3SV7MQLcGoGmPzllQrDp3F2Oa/l1
 t/CZptpWcKHxsSiWQxT6+vyH3QZ1M78Fu0yE/CEzhUg7JFHWddUurDBhuQUUxRGcGU7r
 XyAAjTnKbcSOHx/hMtcYnRLDzFIQu7MuikNYBnFec1ICjyq23eFMbwi12SeXmsPsyIu1
 S0L5PJZ1VjnxkG4Z2Kuw8a/qGAyHSIkBoPMNVQZXXMpxFHH8PRgWfyyOjioEoISfIF4j
 P+cwR+atoRHjoK/Ev4P981daq3Ysmdene89+qK8wFWdar2V9v6xyjqaOqbW7Oo+n/eF0
 j+/w==
X-Gm-Message-State: AOAM5329rgSfn551drurLjGiD95FjKpZ01rjUNFpbTBQthR/eKOGBjLh
 5qeY6hytfR9UPAybEs8wYWlvZLTJJF+QYA==
X-Google-Smtp-Source: ABdhPJz7RifmqyBf0M78F0Eg5C6DOW703afMlSek1HnGAA1HEpI/4UchoJXB/Jv4EgPNnENooY9j9A==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr411162wrx.107.1623862359405; 
 Wed, 16 Jun 2021 09:52:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i9sm3192889wrn.54.2021.06.16.09.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:52:38 -0700 (PDT)
Subject: Re: [PATCH 17/21] linux-user/s390x: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a70a28a2-74a0-2bee-926e-c2d940b40400@amsat.org>
Date: Wed, 16 Jun 2021 18:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:12 AM, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> 
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/s390x/target_signal.h |  2 ++
>  linux-user/s390x/signal.c        | 24 ++++++++++++++++--------
>  2 files changed, 18 insertions(+), 8 deletions(-)

> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4, 0);

4 -> 2 + 2 seems clearer (applies to some other targets in this series).

> +    assert(tramp != NULL);
> +
> +    default_sigreturn = sigtramp_page;
> +    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn, &tramp[0]);
> +
> +    default_rt_sigreturn = sigtramp_page + 2;
> +    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn, &tramp[1]);
> +
> +    unlock_user(tramp, sigtramp_page, 4);

Ditto, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> 


