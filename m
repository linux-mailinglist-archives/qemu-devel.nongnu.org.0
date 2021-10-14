Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4A42E4DE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:47:32 +0200 (CEST)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbARf-0003eI-JR
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAPI-0001O4-AO
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:45:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAPG-0006EF-HL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:45:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id n11so5244884plf.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sEJU+/XWTUDW5F2Hga3zi/v15YR5l0WN/eprRuI/oF0=;
 b=AtZY0uLZSaTAFR/afIT5AukVFm91wI7NRciyQRoQ5Va3hvc+fJn/uKaz4ZV6EBLmGH
 KTTWSQRbphm3oGgu2krJUX527/LmDff7w8lb4VlnpyvxsyCj8CZwACtz5uxSW60idWJ8
 EZuxnWyiOm6KXsYynQPNfDtR9mr6JJWn0enFdq48WR/4c2/lsb5mYA+cWAEQkAvxxmWK
 Ld0+ry/c1nNNJ8fXYnc+LPA4vnk3GEbLG52ciHINJJLdDF+OH8w1zvfNtJ+wDsyKk/1c
 zzq5l/cHgw5g3u/NFB3J6LCzF+R+2Jn56Cn0qu1n6/ofYmANZ0Ik+5/9cd3Ls1FWiOV8
 v/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sEJU+/XWTUDW5F2Hga3zi/v15YR5l0WN/eprRuI/oF0=;
 b=Da2feuxdhLuKOd2yJPznamAhFKR5UzTye73FEI8vU4ln280YQbgiZ1je4wFq1DSQkS
 i2QE2gkX+PkLX+bE/GiD8gRNFtPQ+14PxJuYdnPbN/B6GMlP1mtMMbXcckMbMylhbzYF
 Zc7YqZ5vHkI9UcuLLAd8f8XCkFLdh9CLk2NkQMA28a/zDtALqCEXOeaXewDD73NLbjae
 4wMQkdk4raOvU9Aq2Ww+soae6iCiAZq7LqVCM6HtwTwBZexcyaVQB7CrEq9BF8ExjgxI
 A16V0bTvZqNVo8LidVf0ApNlJ4hskFKYX+WoNV/8aT3A2L3Ae1mK/9AlB9qChMJVaZMG
 A4Bw==
X-Gm-Message-State: AOAM531J6RdW+/bNoG+wOGsOgMEr+ZzxquWE4bCKHOFA+egCVToUqBqQ
 B2MD1jOqNMDjH8K8oyeiHIskGg==
X-Google-Smtp-Source: ABdhPJzrBklXVCspSIZC/+5PMoeau1kAHRytIWGOmVxuG+zlNou/dVJ116X+bcstPfHqyjiIzYtVlA==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
 om5mr9769333pjb.115.1634255100892; 
 Thu, 14 Oct 2021 16:45:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm3480457pfp.68.2021.10.14.16.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 16:45:00 -0700 (PDT)
Subject: Re: [PATCH 3/4] linux-user: Fix XER access in ppc version of
 elf_core_copy_regs
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37e8d241-9323-ae1d-25aa-9b188e4d5ac4@linaro.org>
Date: Thu, 14 Oct 2021 16:44:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014223234.127012-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: laurent@vivier.eu, Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 3:32 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> env->xer doesn't hold some bits of XER, like OV and CA. To write the
> complete register in the core dump we should read XER value with
> cpu_read_xer.
> 
> Reported-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   linux-user/elfload.c | 2 +-
>   target/ppc/cpu.c     | 2 +-
>   target/ppc/cpu.h     | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

