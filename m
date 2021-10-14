Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEE42E4E3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:49:02 +0200 (CEST)
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAT7-0006x6-Kf
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAPq-0002Nz-Aa
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:45:40 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAPo-0006fs-IU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:45:37 -0400
Received: by mail-pf1-x430.google.com with SMTP id t184so5973823pfd.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cwYXP/QEmIu3ElcxaUUj+H1GXH7xoImkovqAZxTxktg=;
 b=FNmEcAWR28OHdW62hoMO8Sk37eAryinHqS29y4jBI27gJxb+pwjoJNnZ7sdXJ0YJh/
 Gzc0u08Fgonnoj0qMc+L0UgjwsPMIAfepe8xNn3IyFO0aBomnEBwtpZW+kArfTS3yBiU
 /QJTpYgDq/mW4TMqwX7gYuVYa9igDmsBf1F5ShDrz6HF6TBjYI4gkF+GNymwihcKqnax
 WTxDlwVEG2nAQnfKQq7TAxgZOn27BtxMpRS4oBQmIa5F6d9VN4i9Ze2a5uHmrgUVqGKB
 bp5tIkSh4oHiWra7mStGIT7gdzVD9dQuOT/C0mfCMN/d73hjM86IiCEAp//h3gWDESjr
 vWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwYXP/QEmIu3ElcxaUUj+H1GXH7xoImkovqAZxTxktg=;
 b=YWUlF0cOKUtAmshvcGeWEOrphlPZ9BA408GYkpzqLHhyWvXif3FV17Jtf7lAk/IFQP
 +W3XuzUSPs6XzB3WjQSLM2Uc5GXOzYh1gwPDE3ay3FDYTB1nhSRIGKEWo5JabEQEGorU
 RL8Voz/DEy0KYzJ9tdV07bik3k/Lb2JkcQSunByHQGNDZmH2gCq098p5XlcH5JBthPaq
 c44ZEzbkx6EcXRrWh7I6vSZMCMLX4jZlgCdhKwzF4wZVwi50bok2htJhkf4f4GDWsq7g
 oZJkEtiOfBT/NclTnvfVo2Z590LRXCbYyZT2taLo4L+8gJBgIo+/jteMG9NQLYsC7jKX
 GbUA==
X-Gm-Message-State: AOAM530d/NtKY8ykcPRN1DM4Of1hobiupdNr6j9xqZ4rIMNEttjb69y5
 vKkVUL5xBu3BFLElG00u151peg==
X-Google-Smtp-Source: ABdhPJwBnW5cDLP+Tos5ZASi3vmj72fTNJ7Pv+KHV02fEtuRm5YfvOQ9rACHz7BoqlgM7KJRv2XrUg==
X-Received: by 2002:a63:4717:: with SMTP id u23mr6525577pga.359.1634255135095; 
 Thu, 14 Oct 2021 16:45:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 21sm9803150pjg.57.2021.10.14.16.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 16:45:34 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/ppc: Fix XER access in monitor
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45f48ef5-8301-4f65-4ff9-5184ed5eee71@linaro.org>
Date: Thu, 14 Oct 2021 16:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014223234.127012-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: laurent@vivier.eu, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 3:32 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> We can't read env->xer directly, as it does not contain some bits of
> XER. Instead, we should have a callback that uses cpu_read_xer to read
> the complete register.
> 
> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/monitor.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

