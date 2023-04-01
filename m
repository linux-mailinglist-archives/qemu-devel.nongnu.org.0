Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B36D2E4E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:11:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTWJ-0001QM-Cl; Sat, 01 Apr 2023 01:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTWH-0001Pw-Pp
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:11:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTWG-00075k-BS
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:11:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso27711224pjb.0
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680325874;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uoU6/GsYeZQVgm7z6+myKgylBxBDFQ2MyIdfddE718M=;
 b=izjZZm1vzZVMKg2PxtDsRDpAjsFbS+709IC2RUu2mErLTY4Ux1J2OI8bruRrZ6rQwg
 +MtBOJv/OmdtcmZ1yp1lm1cbzYS37r6tixsisLXKVtU81vhGb2ka4vesrNVCFknuzLX8
 4wyLpmsVwPzpKCl0f6Ujw69bCk6mjyiHdO6JoxDOIL5K5X6ECpUDS1PdsrptkHxu6wE0
 R5Ubx5IgA1XqIGLrVhM5pK4+LYtIbHsl3hqbwxNXlPZw0JAAnm9HT/kmdpuFmr762/S7
 83yoowGZqb1Phj1De1kat4Z8y9reLyfVgJd2axrdwSIFCdOJJHuFKj4wosc2Y6g94Zav
 B5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680325874;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uoU6/GsYeZQVgm7z6+myKgylBxBDFQ2MyIdfddE718M=;
 b=k/HBHfXm1AtdXt2AQ8zj21RS5anF9u+S8btvjCdosVMmdeTAFa+SQZaBawxWEfVgVw
 rZVWdf3KLjjKLUn/ApDNUkeaU0Rp3aDZGou6WhU9NmgJoN7/sv2/+u6gtpjlvv4FIHgQ
 domilMUrQMSs2kv+OT/GmcMaRFTSJV0kBwhAZFvphFgfMszIyoTO1ehl+19V/MyaydMy
 x17wr7IM/yRd7+PPmdHrsRpsG6JnfJrxiW5avoWQAVxrGxrPTquaBQyG/9ymdK9teq2n
 a6mcx8ZY8Q0WiQXwIaYPW6vDdPi80G2VmffokXtrXmoKLbJtkJJzGZ7JD3sxIcoHORI4
 1XbA==
X-Gm-Message-State: AO0yUKX6WyGhdZ4YNkIoFciGOEIuKERFfeHUrmml3qYUhTAduxX0shyU
 GIV3VdyCtrq/mWFR/f1cCtsykw==
X-Google-Smtp-Source: AK7set/2hMv7zFXOToUCfcxJNyFTmXqOMEMBDfoDvimTp4O1vhrKxZW7AsK74ZC61IROYVpLhjyWbg==
X-Received: by 2002:a05:6a20:c523:b0:c2:fb92:3029 with SMTP id
 gm35-20020a056a20c52300b000c2fb923029mr25619662pzb.33.1680325874471; 
 Fri, 31 Mar 2023 22:11:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 x47-20020a056a000bef00b0062cc53e5db9sm2621288pfu.197.2023.03.31.22.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:11:14 -0700 (PDT)
Message-ID: <0d3beb2e-273b-872b-267b-5600be57013b@linaro.org>
Date: Fri, 31 Mar 2023 22:11:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 20/44] target/loongarch: Implement vsigncov
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-21-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-21-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 20:06, Song Gao wrote:
> +static void gen_vsigncov(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    TCGv_vec t1, t2;
> +
> +    t1 = tcg_temp_new_vec_matching(t);
> +    t2 = tcg_temp_new_vec_matching(t);
> +
> +    tcg_gen_neg_vec(vece, t1, b);
> +    tcg_gen_dupi_vec(vece, t2, 0);

tcg_constant_vec_matching.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

