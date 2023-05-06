Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F76F8FFC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:28:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCKZ-0006V2-6e; Sat, 06 May 2023 03:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCKW-0006Ku-Bw
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:27:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCKU-00065o-9p
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:27:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f420618d5bso125385e9.1
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683358060; x=1685950060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/+KMc0yGt/i1OCiy83lO9mr5LEwSOLTKvYOXBf7XcA=;
 b=roPh7MFc9t2M2sVxkBBqqFlZ5KSi0GAcQxh2Q3D30Bsf310UiSyDcys/W7+NgKgPup
 jIuULrHNcuhPsQzDx9DCS91cHSmNseTzOV2RgN1bx0kYkd4o69vSEnz0Ou8RkFoh8uHv
 wP7e8a7+2AVmFhUkIQEzzk+JDXo0q4EnNsnqfm1zG/QdtOAkdmqe89Lq2gVKoigcyd4I
 2K1B5gK610Y206M8Vjcn05Y6p/YydLotGICqZdhoG3oyjUxtslitBhd8hEtLHMEAkLWk
 CGaCupZ+HBLiOhhg8/b2V9ye9swaBMcnfaqWUyBi7XOC1DgSur4Q2soemK8P7XD7cNU0
 yI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683358060; x=1685950060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/+KMc0yGt/i1OCiy83lO9mr5LEwSOLTKvYOXBf7XcA=;
 b=QfFVbX4PkwH+W6nG5JRiX0Ejmwd/gLlOVas2iQeb6QIRuMjR8r18NLaWf1+x/Yir3t
 EWKaU0azqzYqIIRd2JxiWxgHAGsruqUgGGegaVqeiyE9ViMWQkkOr9pe4TNdQMlMcLfb
 1nnf/B6Ws2iCa7y514mjHd+cx040Kr+k20qddP+5FwxXed2GsbXorfxr6x7fTPeZX2ik
 ccJejkgGiBiyRIxtUq6mh4tjPixAutWsKmK0nJ3Oe9VsK8pod742BfCR5CoLKoQhTecT
 lzCws5Q81xN2clkSV1GeWgJVMMs8M1WH89qslgacbeAyglZEgv4tyvay3nY6hab4rc0E
 CJzw==
X-Gm-Message-State: AC+VfDw4glGCWjfQBbkrscRWougiLEcx6Sl5Xj+1xp6f/ViiRYMuoxSB
 yKKhRU+FvzweTkAXAgrj9J3r6UPUvAyZY+m7aMbznA==
X-Google-Smtp-Source: ACHHUZ7iHLy8QR/57stezah7emP1gEbosRuSa1OXIaFJa/dBjr+VzsY0OFDW628g49hz7SC2VS57wA==
X-Received: by 2002:a05:600c:21cf:b0:3f1:987b:7a28 with SMTP id
 x15-20020a05600c21cf00b003f1987b7a28mr2717680wmj.29.1683358060363; 
 Sat, 06 May 2023 00:27:40 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b003f193d7c6b7sm9869057wme.41.2023.05.06.00.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 May 2023 00:27:40 -0700 (PDT)
Message-ID: <d14a5c41-c4a2-3549-e272-1255f6dc79f9@linaro.org>
Date: Sat, 6 May 2023 08:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS*
 instructions on pre 3.0 ISAs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/6/23 07:52, Richard Purdie wrote:
> The following commits changed the code such that the fallback to MFSS for MFFSCRN,
> MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
> 
>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
> 
> The hardware will handle them as a MFFS instruction as the code did previously.
> This means applications that were segfaulting under qemu when encountering these
> instructions which is used in glibc libm functions for example.
> 
> The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
> 
> This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
> as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
> the MFSS instruction is used for currently reserved bits to handle other potential
> ISA additions more correctly.
> 
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   target/ppc/insn32.decode           | 19 ++++++++++++-------
>   target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
>   2 files changed, 36 insertions(+), 13 deletions(-)
> 
> v2 - switch to use decodetree pattern groups per feedback

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

