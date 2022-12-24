Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623E655AE3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:02:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98q2-0004L0-JV; Sat, 24 Dec 2022 13:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98pz-0004Kh-PE
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:01:35 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98py-0008RD-84
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:01:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 gv5-20020a17090b11c500b00223f01c73c3so9683889pjb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=43hUpoFL8c/yOrwMDe+eUB5kC7E4lONrLdo3rBIgqM0=;
 b=bFdqPK6e+3vxAw4lTJATQwL7NGn4ce98/2n9+ujbb8TH0RT7aWZSpQ7yhV1Wb/W9bX
 PyAZbUegoROKoCnRa9NDvSAJK8Gzs65rugILYK6GnEH8Gjnm4SrYUJvUVbV0f8z/inyX
 YMfnTsqojJWUwq2ZbdmkYM6/MSYa12jw1RBct0wdljk1c4tkxIKH05Yqlj2cL5xkDVLA
 DLAjNR556u2eKofENFAoqQ+c7mVDs41w6pRbY9wCyWIKxhQAP+kMwzC52CaZTZ/wXQqP
 s1ASCC4lmQTjojmZSG1HhOuY6subzhr7tuBWfUjN3hc3cdesPQzpSyXiaxIolWDPlXEe
 HuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=43hUpoFL8c/yOrwMDe+eUB5kC7E4lONrLdo3rBIgqM0=;
 b=Y15EuoficZjURpHihlMpdvXO0QwptuN7UO/xBq//r2grYe27LfkH1w4mS8ImTSQxBV
 n9ISHR7QUAMjMCLQEA3fWMZ7u53u1RL6DVBDb5HcWRZuD2F5SPkSkgd04uUmuzwIWVjS
 azUO5lNpunEYyx7wLxzzEpe1Qw7tOyz/bzRWsSV/jg2rVs7CU3EG3zOlkObBL9YZGGpR
 qCWTc/IcqJfocSut/Y6d5gsWZ2Ls+pNNMSOCMiZGWlAp8b1hjmZYCT7PTiPEXyltSxWW
 MLofW/cev4p/8q+5L1564wPMkUwDygvy8s2cU0j2bNJDRXEwsyYT2hdnKj6Sy+sSOvHS
 sVEw==
X-Gm-Message-State: AFqh2krQxmMnal4fV8boKtNJuZN4HcLR8TIjiPi7prCk4aFVnug8YJ47
 tlhRohEHnypoQI12ieW3o+BhMA==
X-Google-Smtp-Source: AMrXdXu9r2lK74HJajppMK/Zf7c+jWAEQ1w4Ha5ennsfAc0VuoK4GbR/s8Ks/F5k5zUNW3AeIYlhFg==
X-Received: by 2002:a17:902:aa8f:b0:189:e55d:ec72 with SMTP id
 d15-20020a170902aa8f00b00189e55dec72mr13107414plr.20.1671904892539; 
 Sat, 24 Dec 2022 10:01:32 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0018f6e4e425dsm4324025plp.198.2022.12.24.10.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:01:31 -0800 (PST)
Message-ID: <bf2c4b05-0437-92e8-378d-854b91affeb7@linaro.org>
Date: Sat, 24 Dec 2022 10:01:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 14/43] target/loongarch: Implement vmax/vmin
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-15-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-15-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 12/24/22 00:16, Song Gao wrote:
> +INSN_LSX(vmax_b,           vvv)
> +INSN_LSX(vmax_h,           vvv)
> +INSN_LSX(vmax_w,           vvv)
> +INSN_LSX(vmax_d,           vvv)
> +INSN_LSX(vmin_b,           vvv)
> +INSN_LSX(vmin_h,           vvv)
> +INSN_LSX(vmin_w,           vvv)
> +INSN_LSX(vmin_d,           vvv)
> +INSN_LSX(vmax_bu,          vvv)
> +INSN_LSX(vmax_hu,          vvv)
> +INSN_LSX(vmax_wu,          vvv)
> +INSN_LSX(vmax_du,          vvv)
> +INSN_LSX(vmin_bu,          vvv)
> +INSN_LSX(vmin_hu,          vvv)
> +INSN_LSX(vmin_wu,          vvv)
> +INSN_LSX(vmin_du,          vvv)

These can be implemented with tcg_gen_gvec_{smin,umin,smax,umax}.

> +INSN_LSX(vmaxi_b,          vv_i)
> +INSN_LSX(vmaxi_h,          vv_i)
> +INSN_LSX(vmaxi_w,          vv_i)
> +INSN_LSX(vmaxi_d,          vv_i)
> +INSN_LSX(vmini_b,          vv_i)
> +INSN_LSX(vmini_h,          vv_i)
> +INSN_LSX(vmini_w,          vv_i)
> +INSN_LSX(vmini_d,          vv_i)
> +INSN_LSX(vmaxi_bu,         vv_i)
> +INSN_LSX(vmaxi_hu,         vv_i)
> +INSN_LSX(vmaxi_wu,         vv_i)
> +INSN_LSX(vmaxi_du,         vv_i)
> +INSN_LSX(vmini_bu,         vv_i)
> +INSN_LSX(vmini_hu,         vv_i)
> +INSN_LSX(vmini_wu,         vv_i)
> +INSN_LSX(vmini_du,         vv_i)

These have no direct immediate variant.  Use a combination pattern with dup + minmax.


r~

