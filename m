Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1E6FC992
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:53:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOi2-0004Jm-7E; Tue, 09 May 2023 10:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOhz-0004J4-SR
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:52:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOhx-0002lE-Fq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:52:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3077d134028so3149725f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683643972; x=1686235972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6q5dcj20VdG+ResSqRCQ8wjaFZk71lyYKIG9sYhRXWs=;
 b=hmria/Ibp/9OF6YgtXlL1KsC5WNbROLUOocuykpLTQeJ7MmTfj2b8z30JCm+VkQE2w
 DaELp7lYRfGEt+WZdc2c5VeOc+w2b2xceQWOqG/VChoChcsAHLKfYXOZX/9ogHDRt1gs
 Lu8RkvAtkgeEqDtV5GrMOvq1G0OHgtyeZ4YgYuXRjAJckxZ05M1DvXrA0kUunYUPZiEk
 UhIMz4n1UGshwhMSjRIRgVYiH2UN5nD47EwvPejDMLhkYJFGequ2bebddDNRCFFesSDF
 spCAvKFL7C34Y4nYmNPdPMLWeIPjrwiouDtrrhHP1562uRJuWGxIhvfrOEoQXLFS32/f
 bRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683643972; x=1686235972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6q5dcj20VdG+ResSqRCQ8wjaFZk71lyYKIG9sYhRXWs=;
 b=BHTSaIJ6HEGwk2kyEGCG4p7iAuKgJDNxuhx190L/wZ2G3vMJSLf2dtKZ96hz7O1hJF
 uJexTbuxE4+jInmA6SEFE0qt5hXpfyQHQCw8ny4wEecucc/3v+T/sNdJCTAVbRgJsuU5
 AgY9R8frwguxjo4QS96oWyu69PD+3DNu6qpg4HOUFQo8M7w/+dTGDSB+UImBIVOvZaxo
 kXovA7JeoWBri57vvRydiNCfwJ8EVE1c8TxRSks47/PumcPJ07rsKTC7LfrLpViokzhR
 Tnbtbm97RHEizl5Wlh0zb/9Oz0J2ZlIKkM/fXGR1C7WOR7ABSD/xvM3ktYESvi0+Mh8H
 AzIQ==
X-Gm-Message-State: AC+VfDyoDLT7Gm0po8ysJP7NNDf6ltesLmovcbZ+hw1A71hd2k34MZjd
 ETsGsO06Gn3CKQJVADxqxE8n9YvyuQCHXas5BzCU4Q==
X-Google-Smtp-Source: ACHHUZ6UNU2b+OjiiGo0wzdZrK/hA2uKwatZ1d0sUJ5/HDHXvs7dNjmv4P9adms5H7B2lifXHZFCDg==
X-Received: by 2002:a5d:68c1:0:b0:306:28fa:16a7 with SMTP id
 p1-20020a5d68c1000000b0030628fa16a7mr10065602wrw.43.1683643971745; 
 Tue, 09 May 2023 07:52:51 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d4a84000000b003062b6a522bsm14691469wrq.96.2023.05.09.07.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:52:51 -0700 (PDT)
Message-ID: <eda69f90-3223-3c0a-e791-4e651009dc0e@linaro.org>
Date: Tue, 9 May 2023 15:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input
 size check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230509092059.3176487-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509092059.3176487-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/9/23 10:20, Peter Maydell wrote:
> In check_s2_mmu_setup() we have a check that is attempting to
> implement the part of AArch64.S2MinTxSZ that is specific to when EL1
> is AArch32:
> 
>      if !s1aarch64 then
>          // EL1 is AArch32
>          min_txsz = Min(min_txsz, 24);
> 
> Unfortunately we got this wrong in two ways:
> 
> (1) The minimum txsz corresponds to a maximum inputsize, but we got
> the sense of the comparison wrong and were faulting for all
> inputsizes less than 40 bits
> 
> (2) We try to implement this as an extra check that happens after
> we've done the same txsz checks we would do for an AArch64 EL1, but
> in fact the pseudocode is*loosening*  the requirements, so that txsz
> values that would fault for an AArch64 EL1 do not fault for AArch32
> EL1, because it does Min(old_min, 24), not Max(old_min, 24).
> 
> You can see this also in the text of the Arm ARM in table D8-8, which
> shows that where the implemented PA size is less than 40 bits an
> AArch32 EL1 is still OK with a configured stage2 T0SZ for a 40 bit
> IPA, whereas if EL1 is AArch64 then the T0SZ must be big enough to
> constrain the IPA to the implemented PA size.
> 
> Because of part (2), we can't do this as a separate check, but
> have to integrate it into aa64_va_parameters(). Add a new argument
> to that function to indicate that EL1 is 32-bit. All the existing
> callsites except the one in get_phys_addr_lpae() can pass 'false',
> because they are either doing a lookup for a stage 1 regime or
> else they don't care about the tsz/tsz_oob fields.
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1627
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Since we pass the CPUARMState to aa64_va_parameters(), it would be
> possible to have that function call arm_el_is_aa64(env, 1) itself;
> but since that seems a rather non-obvious thing for the function to
> be doing and a potentially more transient (or at least "not
> configured yet") bit of CPU state than the translation regime
> configuration, I preferred to have the callers pass in the
> information explicitly.  I don't feel super strongly about this
> though, so we could do it the other way if you prefer.
> ---

I prefer the extra argument, as you've done.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

