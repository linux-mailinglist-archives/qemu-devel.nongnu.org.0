Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F45655AD4
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98Ka-00024l-GB; Sat, 24 Dec 2022 12:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98KY-00024W-Bo
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:29:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98KW-0008Ja-NA
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:29:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so7573659pjd.0
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKn3qZyJX/RcKBAcHAXm8mGfcrJ6kFrrPUX+dI2p9pU=;
 b=jvUAW6utRwuY5CeQTiYT92CNagRqBRgdW9Guyi9jUMJUJcaAEple5NJPVQTA/+Cl1U
 JsbTaq7yV++OwEBcpRIi4jui1f8WgVGBb+jPR6JiFESuXnkbSbeeCGhHisKBfUIEVWB0
 e7Or3Au7eX41HL2/JQ8W2DPYiyoJIX1iTt2zMkE4fxId+aPK0xE57dA8WsMVCaYDJQ0A
 ZRUsdyoDBWBPdKxWUkCSslSImPW+AohRbuUJzlxEo1Pb2MZ/K8OPTDz6eRiOiccchPLt
 TlGntxmVKh5LYrBUSy/l7IXNpRnpJnF83jEWnHm0WQFD+MHObw4YNrAYJUtB8qrRRBif
 gQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKn3qZyJX/RcKBAcHAXm8mGfcrJ6kFrrPUX+dI2p9pU=;
 b=V43U5Z3jEyiKo10ywHzrkrX6k0rmJLFn/j66SY0/fYvPr/84Nc7fdIhIgDqozeTlTe
 kzkpdQqrK9oRsEoI4oFTHPYuo5Z2H0VZRN57xWUlPbbwZtCtixr8z6NUKMle1J2jrSHj
 jfmDxdWaWlnNinQ8GtmOyGjMrAXA3Jxc072V6hKV+EziC6JVE/9W9miuYMQOzebQ6WmS
 pv6Vqkdc+A3AxIube7jArjZBcxwbwKxU3Mc2R91m/xVaCuT2g7szDlitAzCrmIpZjlx6
 4304mumVdM8Mz7cr0PDgE3FuDiStX3Q1D8XRW/G/TFHBgwdJr6g5ummHstOSR+YzA0aL
 DydQ==
X-Gm-Message-State: AFqh2korOqz4QBOFuKOFKQzv78tcCg6DHcoKPabI/ESQgEmmkkyKO9MC
 8TMUSpaYeeYRXBiSZEpGy04Q4A==
X-Google-Smtp-Source: AMrXdXvHu8Dt8jdhZYX6RSnMVStZCAToMW3yN20yRGbCqYoNoPOsFPKxxPs8O7j+ydutOx73DQVmcQ==
X-Received: by 2002:a17:90a:b306:b0:218:d7ee:d4ba with SMTP id
 d6-20020a17090ab30600b00218d7eed4bamr15326093pjr.3.1671902942936; 
 Sat, 24 Dec 2022 09:29:02 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 27-20020a63115b000000b00477bdc1d5d5sm3963704pgr.6.2022.12.24.09.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:29:02 -0800 (PST)
Message-ID: <2dbba2b4-d39e-c844-9f30-8205962f6311@linaro.org>
Date: Sat, 24 Dec 2022 09:29:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 07/43] target/loongarch: Implement vneg
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-8-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-8-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:15, Song Gao wrote:
> +TRANS(vneg_b, gen_vv, gen_helper_vneg_b)
> +TRANS(vneg_h, gen_vv, gen_helper_vneg_h)
> +TRANS(vneg_w, gen_vv, gen_helper_vneg_w)
> +TRANS(vneg_d, gen_vv, gen_helper_vneg_d)

These can be implemented with tcg_gen_gvec_neg.


r~

