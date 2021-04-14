Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D835FE32
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 01:09:02 +0200 (CEST)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWod3-0003cq-5E
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 19:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWoby-00036j-Qu
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 19:07:54 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWobv-0006eF-Lo
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 19:07:54 -0400
Received: by mail-pl1-x630.google.com with SMTP id y2so10990074plg.5
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lFl7y2iAIJqc3cs10Tu67yTTNbUSGSUFrTy+PzLhW3M=;
 b=nGzuXdULesEgPkXN5LxnTbhoFdbFah6iRqyr0bvOY4lYzx3NrQFwhsriQKO16e0T4L
 DVdvu5icffZkTUn8CpVTFIWtqk6GkFKCRSODC9CKidsAW6ll+p2+LVyFEMd8iXR6hWKZ
 fOERrJXM8raZWigdjNBIdB0rGU0o1pWHw/jUXjUuKASLeqyJqIRgjLgqnyN/WGwpaS5y
 399k7rj4VBqEVl7xGbPU/Hcji+Mj0CDzjw5ELn4/2A2U3i7DrLsklKGzPCIPsL+2U0rw
 cwlrw6lkFh+XVZYZDTcQIMaL6ZVAOWBIiBU6WqCS6KXSE3clWfzXwpTBhnRRWmiNPWbs
 1vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFl7y2iAIJqc3cs10Tu67yTTNbUSGSUFrTy+PzLhW3M=;
 b=DDuWOlaFoR6Ib+uqR813wslStSKJCGnlwuWqs+eJ/yVKQVF5mgh8LS4/YnMCleom0f
 9cVeYTHCTffSQARVtmKdk2NBt+kFovTuTTQ/BefWkaASE2sbJpvypj+nr/48kOf5dq1i
 yW6b0QPoSGT1ToI00SS5dJbp/dOJTTZD7qyHP/GqxpvvW22Ef7+iLVH9k4S6SvsYMZ2+
 UVFuJ9vCc4tSBbVuOEZn/y/axyoY72K0fsZSQOKEnoDJb5pIhA8jmkHCdING9o926W3k
 wpIN1nvP8hO2w5UPWpJ5/0e7SNJaUgNkLyzD3Dcbl6sySEbWu6oHc9N2BtRwwzgEEn/O
 ROpg==
X-Gm-Message-State: AOAM5306T46lcZ21BordNu+KbnRNcKewB0TiMWaCdlnuqxsuxSxiwTJm
 k09TsTfMQs8vbp3A0gFjWHLR+Q==
X-Google-Smtp-Source: ABdhPJwEHgTmNxpDNZ1iwC+HDFV2ntyC4syHwtxT8FUgFfbSimSbASnqBDU4daui6ediCvmOo1/5Lg==
X-Received: by 2002:a17:90a:f2d7:: with SMTP id
 gt23mr497635pjb.199.1618441670154; 
 Wed, 14 Apr 2021 16:07:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i22sm383248pfq.170.2021.04.14.16.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 16:07:49 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
From: Richard Henderson <richard.henderson@linaro.org>
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-6-luis.pires@eldorado.org.br>
 <35a37fdc-0580-7c0b-5748-1f194386007c@linaro.org>
Message-ID: <c1e25987-6252-4cf8-fee1-d55f56480beb@linaro.org>
Date: Wed, 14 Apr 2021 16:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35a37fdc-0580-7c0b-5748-1f194386007c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 12:11 PM, Richard Henderson wrote:
> static bool
> allow_prefix_MLS(DisasContext *ctx, arg_D *a)
> {
>      int64_t imm;
> 
>      /* Require MLS prefix or no prefix. */
>      if (ctx->prefix_type != PREFIX_MLS) {
>          if (ctx->prefix_type == PREFIX_NONE) {
>              return true;
>          }
>          gen_invalid(ctx);
>          return false;
>      }

Combined with the switch on prefix_type in translate_insn, I think this can 
just simplify to

     if (ctx->prefix_type != PREFIX_MLS) {
         return ctx->prefix_type == PREFIX_NONE;
     }

because decode_legacy is only called from within PREFIX_NONE.


r~

