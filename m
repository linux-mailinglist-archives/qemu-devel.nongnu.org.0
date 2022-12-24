Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E422655AD3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98JS-0001Se-F6; Sat, 24 Dec 2022 12:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98JP-0001S6-U3
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:27:55 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98JO-0003MX-EX
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:27:55 -0500
Received: by mail-pl1-x635.google.com with SMTP id m4so7550656pls.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yBp3NMfIxXL2pqy1wrJdFxn/2NuUpGaFxKBZdTtTdt4=;
 b=Yvmwafxjyp3dOf83OnrbiSM32WEWXoSurPikaA2rnEApKCJgEn678uyQh0oJkFVZsx
 mVN6TLUsttrvsPZh1v9CXRZ02M7khmW4FAqTgmdOo37fPwUBNHz0iDpTzx1Qq9M14AeG
 BknkVwYws0TGYb1ahUpHvuVxLTvBl1h2J4EDJkBl4eaB5zE1HsYYmujsOEdvSIcU9DSy
 QrVoxpG+yyOb6iUdNSzhYESwoyP/LvJVfE+PTIsf/b+lqm/h5valSbLa++RO+m7Uv6Ca
 vyTCZBbEUWLLDigw3iL2aiBFfksdjsncpSd8o/7n4aN34S5F8I3qxJHDKQHCAI6NGe7f
 eG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBp3NMfIxXL2pqy1wrJdFxn/2NuUpGaFxKBZdTtTdt4=;
 b=HcakjtEp8/kcOfe52mX0dksgGZNJHNfVCaPnwiNmFuY4Kw1IL7hziFfvp01qcR3kfj
 IAh+VmYQY26Pk9N8f9olEQ6aBixX4nc/ir0BYQxBtnUvCvS+DpbEjiSmFeCdGm2MpC94
 eQ90IX4APKMgNsicB0ccL/7mdMMi8a2lt18ZW0KyUkw3c++MvA4FdsYpcgaAS2AXunpa
 jqdzIHjcF5KcxR42/4YzKLAZluhJ57yeGUwOLwj1f5M3c1bGREd00MoZon9LWhJSdbtP
 AbwHn1DUyCpeWJXnBNnN1ZN9UeScLKS+ew3E0/wQDQo6T4GBFHz/yI1wPLX3ASbcTTmX
 ZL0w==
X-Gm-Message-State: AFqh2kp8iH5gs4vr2/IcAntPGPOztNzmGv7cJamV6Rakp66M+uKkjw3g
 SsEVt4RyDi0Fbov8Un3dQvWwdg==
X-Google-Smtp-Source: AMrXdXtIL3S5t34+20CXzMxqJIo91tlWQ5CIIDmfmdSLxW9yk+DgGY2V4d0IfF7t2urbS2aGUquHzQ==
X-Received: by 2002:a17:90b:2710:b0:219:f993:7f0f with SMTP id
 px16-20020a17090b271000b00219f9937f0fmr14608683pjb.11.1671902872826; 
 Sat, 24 Dec 2022 09:27:52 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a63e70c000000b00470275c8d6dsm3951383pgi.10.2022.12.24.09.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:27:52 -0800 (PST)
Message-ID: <6f2229ef-bb9c-f714-e562-2d4ad6cb24d7@linaro.org>
Date: Sat, 24 Dec 2022 09:27:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 06/43] target/loongarch: Implement vaddi/vsubi
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-7-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-7-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
> +static bool gen_vv_i(DisasContext *ctx, arg_vv_i *a,
> +                     void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
> +{
> +    TCGv_i32 vd = tcg_constant_i32(a->vd);
> +    TCGv_i32 vj = tcg_constant_i32(a->vj);
> +    TCGv_i32 imm = tcg_constant_i32(a->imm);
> +
> +    CHECK_SXE;
> +    func(cpu_env, vd, vj, imm);
> +    return true;
> +}
> +
>   TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
>   TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
>   TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
> @@ -37,3 +49,12 @@ TRANS(vsub_h, gen_vvv, gen_helper_vsub_h)
>   TRANS(vsub_w, gen_vvv, gen_helper_vsub_w)
>   TRANS(vsub_d, gen_vvv, gen_helper_vsub_d)
>   TRANS(vsub_q, gen_vvv, gen_helper_vsub_q)
> +
> +TRANS(vaddi_bu, gen_vv_i, gen_helper_vaddi_bu)
> +TRANS(vaddi_hu, gen_vv_i, gen_helper_vaddi_hu)
> +TRANS(vaddi_wu, gen_vv_i, gen_helper_vaddi_wu)
> +TRANS(vaddi_du, gen_vv_i, gen_helper_vaddi_du)
> +TRANS(vsubi_bu, gen_vv_i, gen_helper_vsubi_bu)
> +TRANS(vsubi_hu, gen_vv_i, gen_helper_vsubi_hu)
> +TRANS(vsubi_wu, gen_vv_i, gen_helper_vsubi_wu)
> +TRANS(vsubi_du, gen_vv_i, gen_helper_vsubi_du)

These can be implemented with tcg_gen_gvec_addi.


r~

