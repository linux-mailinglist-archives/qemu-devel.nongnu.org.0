Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998D66D003
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 21:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHVu4-000181-Vp; Mon, 16 Jan 2023 15:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHVtu-00012u-3t
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:16:14 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHVtq-0000qc-Tm
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:16:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id c6so31396946pls.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 12:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/a+mPmC9TPOjkNF3qNNdOtO5M7BdDFvcpHOMGaqfT3c=;
 b=CbGnaim5UOqJzoPIaTEu2edCSt64wSqjW2LHPDtbvods4a0bAs2SvE1Kl7mK8dd1kk
 v4nRk8zVD+fJaQy5JpR2IrGmiL3ECU3/lIMFH+p7sNPqev8BT1NPLwHOUSF7A0ZjIj9A
 XCrbewEYW623ViFPkBQ9F1FnKBlZlvEASFgyHM7lPlzsJgMCz37w3ysta54Ads3nRrSr
 Epxnd4NARs1KzZ8bHEJbFHf7LrB+YzLW1oEBtC2TajkKdnpKZMfoi7cHV+h+DUhcm+Ch
 p81tRBNfkJpCbnA5trkhMYM7z3u3UBQ39uY7J0O8ATaxz/XjRtUU5YBK6Ltkdn0HLurx
 Pb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/a+mPmC9TPOjkNF3qNNdOtO5M7BdDFvcpHOMGaqfT3c=;
 b=dDktK4V0oC1O1IGd5Tx0Q/R3w73wAuucQHyOgI5rbdpJf9TtsB6+NYVuvnmU97zxIE
 0oyIImpmskhH062IfYw5jn5aOHvB1tJ4ckBEqJP/TgxVLk3eWXsgHgoPPiyWV5mhtqT+
 4FEGKLWLET01/6rxeiMGRbSnn1EmPz593y9xprqOpr9WV+ZViLFtVrCt2OcAjpws8PbU
 Z8+oDkEtxRkcyNwEmwNO4enNch1hUPlTDI/BdoozygzLFJg1pPI2XpZe0T4aHeGJI7kw
 vTiYSn9aZCdkwfDF5Ue2JuMYdBI5RsUJL3vw/2Ae/uJD7P243J+NdBr5i4prY/hXWT8F
 pbxQ==
X-Gm-Message-State: AFqh2kpBC9813gFYErd0is9ge7qdaA2Hbrg0iSp3lwur2444PIi4L4Ah
 JSuJJXZHfwEz4j9ZTkSo1bHy/B0cPbFK+FqG
X-Google-Smtp-Source: AMrXdXsps2pu/YLWT5OGSSq2lGCExNZp2GHMKhuAhHPsg+v3jWlfO9OE1PRsO08+QOunTAf9lO8LUQ==
X-Received: by 2002:a17:90b:60c:b0:226:e59a:f869 with SMTP id
 gb12-20020a17090b060c00b00226e59af869mr381394pjb.43.1673900169099; 
 Mon, 16 Jan 2023 12:16:09 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a3f0800b0022984422236sm1518435pjc.11.2023.01.16.12.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 12:16:08 -0800 (PST)
Message-ID: <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
Date: Mon, 16 Jan 2023 10:16:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
In-Reply-To: <20230106194451.1213153-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

Ping.

r~

On 1/6/23 09:44, Richard Henderson wrote:
> Here's a short-to-medium term alternative to moving all of the ARMCPU
> cp_regs hash table to the ARMCPUClass, so that we're no longer leaving
> dangling pointers to freed objects encoded in the compiled
> TranslationBlocks.  (I still think we ought to do less work at
> object_{init,realize}, but that may be a much longer term project.)
> 
> Instead of giving the helper a direct pointer, pass the cpreg hash key,
> which will be constant across cpus.  Perform this lookup in the existing
> helper_access_check_cp_reg (which had a return value going spare), or a
> new helper_lookup_cp_reg.  The other cp_regs functions are unchanged,
> because they still get a pointer.
> 
> This ought to be enough to re-instate Alex's linux-user patch
> to free the cpu object after thread termination.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    target/arm: Reorg do_coproc_insn
>    target/arm: Look up ARMCPRegInfo at runtime
> 
>   target/arm/helper.h        |  11 +-
>   target/arm/translate.h     |   7 +
>   target/arm/op_helper.c     |  27 ++-
>   target/arm/translate-a64.c |  49 +++--
>   target/arm/translate.c     | 430 +++++++++++++++++++------------------
>   5 files changed, 285 insertions(+), 239 deletions(-)
> 


