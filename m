Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DBA6FC8DE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:25:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOHe-0008TH-D0; Tue, 09 May 2023 10:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOHc-0008T0-GG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:25:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOHa-0005Es-Se
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:25:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so6756695e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642337; x=1686234337;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atGj45eVDBXDFQvySBgoDE+w/e//9ud2edIaUh2p59M=;
 b=zULO3+R2yz8OMjxq5dmFjFYbk88KNcpFLwsRzXthowV9dprc3C6ww4ARyuZzCCBCaf
 qx0o+3v3acoQIeCTEz2LymZgg4K9iqQG8IVfUV/GLHziz3w5vKI3QhUUyVLEj6VPhcnr
 B7I6LUV009TVtoSzC3DGgjMq7o5Zn57+gPrcNbXSvIwuOmHTf70uaW8eSYk0m1qioHvC
 hVTCulZ46JPjJN0qqYZ/kxoo66DOtW0dyiqXSyPLvlToegalsQhOiqP0hdShTt8yw4yL
 lUQfx7F9kp0Kr6optMlISrqnMCxUIc7T/03BfjV1FCyL4HxmhYrn4h6R+anMXMWF/ca5
 bohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642337; x=1686234337;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atGj45eVDBXDFQvySBgoDE+w/e//9ud2edIaUh2p59M=;
 b=UXCkQUEBAxPYjWTDODbU7Xzxl7wJtNirgzMh23XGdn0DQI9By+J+0OGoMdEhp3Ubhz
 110hO2Hs4Y1qc9Kyxk00ddT7veoJdb13bopaSmUT5w+NAeaTetf8RhIpFsLVH/ICsFil
 FR4EWUGzJLXNM+iXBKdSLDCRSi1/5+AIU+fqO9z1/IOQYNRb+1SMqffxFyk/9SuqMvrv
 tS6eX0elD5HgXAPlClCCxpKADmRmd1XC1yIznzcKn+CiN4dxrYJF92iVNzk8B5oNQ4Md
 /3Z1XNpxt8NlUur2KOTvIFNbgx4TjoqFmtaUrBz83xHbn9dTIFkx4OnIl9hvAbkXlGEh
 Mnkg==
X-Gm-Message-State: AC+VfDwgavI2CzuY3R7eRjnHLlxfYYDuKBA8ZyaVv9ZMFcc0bvbCM4XE
 F27Mu3Y7pwL+FiheEy7RigHyycUBaog+BnCIXTM=
X-Google-Smtp-Source: ACHHUZ66FFf800NqKFeVClkQJ0PTDrjmZZh+LVgtQU6I2sY1NHj4wjX5RZda/oL0pvk/9mbDiahpxA==
X-Received: by 2002:a7b:c8c9:0:b0:3f0:46ca:f201 with SMTP id
 f9-20020a7bc8c9000000b003f046caf201mr9581046wml.1.1683642336760; 
 Tue, 09 May 2023 07:25:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4d82000000b003078681a1e8sm11474645wru.54.2023.05.09.07.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:25:36 -0700 (PDT)
Message-ID: <42010caa-982e-c41c-a224-a035e87b85c7@linaro.org>
Date: Tue, 9 May 2023 16:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] accel/tcg: Fix atomic_mmu_lookup for reads
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20230505204049.352469-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230505204049.352469-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/5/23 22:40, Richard Henderson wrote:
> A copy-paste bug had us looking at the victim cache for writes.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: 08dff435e2 ("tcg: Probe the proper permissions for atomic ops")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
> 
> To be inserted before patch 3 in
> 
> https://lore.kernel.org/qemu-devel/45cba357-ba20-399a-27e6-5e99741179d0@linaro.org/T/#m5dc55cf04d564f4a8f97bc95e7f0e427c24a4f0b
> 
> r~
> 
> ---
>   accel/tcg/cputlb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 3117886af1..0b8a5f93d2 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1835,7 +1835,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>       } else /* if (prot & PAGE_READ) */ {
>           tlb_addr = tlbe->addr_read;
>           if (!tlb_hit(tlb_addr, addr)) {
> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> +            if (!VICTIM_TLB_HIT(addr_read, addr)) {
>                   tlb_fill(env_cpu(env), addr, size,
>                            MMU_DATA_LOAD, mmu_idx, retaddr);
>                   index = tlb_index(env, mmu_idx, addr);


