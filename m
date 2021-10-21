Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6937436D30
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:59:50 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdg6H-0007Dy-RG
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfbY-00043z-3y
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:28:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfbW-0003n0-7n
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:28:03 -0400
Received: by mail-pj1-x1035.google.com with SMTP id kk10so1466288pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3TIEc5sXmEk1FCFhJFXyVPqkCVb+P/EyN0mfU5Xc7nE=;
 b=R6mvfz7hYQC0Cd5yj1xPNWWeT6D/Q/r1zIXBuYZn0iWo2rJRgdfd64GOvoqjH8aFPe
 wYV/kq0hutRQK2bN/AeQnyY77+Bu3P3dSWOXqxSnL7MaHscYIsTGC1g3nApuftOpyklY
 4/E7/Y3F2EhvO68xF/ResAgf8cB+AGpC5WEhi6RNPHeVTgth5MzKgPaf6QGmi/jmL8/w
 k4T3cWuW9EFVYxic2CbpKEf0uO+r6wTF43+vSsVJlp4rgxiMM3m0M7JXcV1F9rQ6v16I
 wQWGKbT2Fw2/DWxJ6QyiQDx/vu/0QJit1R5Q+3M0GFHTG75LcgS3YIb+7Ctfiiq1hkwU
 2xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3TIEc5sXmEk1FCFhJFXyVPqkCVb+P/EyN0mfU5Xc7nE=;
 b=TtpyzL1tBnGPQJcDdrXpeMwpCmv/TbcGJJJaNgRLkJJTHzOR8EM35mBCLKrHnuGlYv
 7QDe9PsgJBP9sxxnZeHf0b+yw7RKXyLzH+bGg5/9BDgsE0iN/ZkdWU1qZGkwHLiDhkZm
 owBQojXk5OaazplLt1tGIhw5UOf1PNxkEJiZRdN+E4LuLiLDpXf75qGlXYtJCxPxXUBD
 abt/ZZjvlsx7rhdM7ceCuGQHV5YVoUf7bpgCrZOHWq5eiPIPnHDOs7U5RpzcJ16mGNQF
 nRzljK0G11xLx40Bk/MlKkCmxQxirPN3aDr/DGBFHKTVF51m5LUuopFZuW+ss1wgItKL
 4SjA==
X-Gm-Message-State: AOAM533w7H+NDRC89DYwD5PrAWarSaGhjd+RfmaGOLBvDUBJBiLDK9Aq
 gqY6b1kDvsmgFpXEXObVVxCZjQ==
X-Google-Smtp-Source: ABdhPJylFjynuD64GnKN2KZpP0riG7jVrp0qLMZyD1fCwSrYqTNisQ6xSloLi6SGS6gOi4/TpiJSKQ==
X-Received: by 2002:a17:902:d2c2:b0:13e:f4d2:ed3f with SMTP id
 n2-20020a170902d2c200b0013ef4d2ed3fmr7387561plc.87.1634851680092; 
 Thu, 21 Oct 2021 14:28:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y9sm6962819pjj.6.2021.10.21.14.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 14:27:59 -0700 (PDT)
Subject: Re: [PATCH v3 12/22] target/ppc: Implement DCFFIXQQ
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-13-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d0bfbfd-9784-b3d7-0fd0-bf69f653df43@linaro.org>
Date: Thu, 21 Oct 2021 14:27:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-13-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> +void helper_DCFFIXQQ(CPUPPCState *env, ppc_fprp_t *t, ppc_avr_t *b)
> +{
> +    struct PPC_DFP dfp;

Space here after the variable declaration would help.

> +    dfp_prepare_decimal128(&dfp, NULL, NULL, env);
> +    decNumberFromInt128(&dfp.t, (uint64_t)b->VsrD(1), (int64_t)b->VsrD(0));
> +    dfp_finalize_decimal128(&dfp);
> +    CFFIX_PPs(&dfp);
> +
> +    set_dfp128(t, &dfp.vt);
> +}

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

