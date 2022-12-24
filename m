Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C586655AF3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p99Lf-0005RH-Hm; Sat, 24 Dec 2022 13:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99Ld-0005R1-HC
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:34:17 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99Lb-0002Uo-NW
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:34:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 u4-20020a17090a518400b00223f7eba2c4so7605361pjh.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dNJ1bjPvl2A742f9l7cQ0CsaGoC3NfvGB4ssedgWTxw=;
 b=Xq1tXLabuqYpSUSxjd0kMkMSMBWj7RKIjjjrQkGy3iSpMfS9E2pkb75tUDP5jw1rJD
 E9AFtqVnyS1kd7iwNK/RO0MbpcHDzB0vUqN62+0fwcgycGnRcjK9+ZNAeZtBgXtVYDol
 LK/Q9TBqblNzhkNEydqcqbnlPYG3MzZcWONZuqr2xBamO1RccXZb4F1YS0Q3vl0bpwXA
 ZcVUpbwl3dzIb/hMpxK4zNiLtYEycvbqBmlBPPuwfAukDB/ldozNbhA5MDhmTsSdSOyA
 YtRoPRiJ/Zhcep5WrGJazXktG0IpdNtE+SI6nAiT+r0jYsmUK4iXf+9eQ7tDY2xfrwWA
 OnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dNJ1bjPvl2A742f9l7cQ0CsaGoC3NfvGB4ssedgWTxw=;
 b=Rw9Y28mbdYx9g1OkuFhWe6OLYnd6UZ21exGMtSGA+WgeOJcq80d7+kWbJE/XgN5LJi
 jrwDmAwGEvGTiW+9riatH9KKmjD+iCIpuSANlujdxR5yfOKPMvsriAbDN6LVCI/22UCY
 J4mdefl7QHsSAcxOxocYFQOVc2efxKmuB5If24v5jY4ah3WvxCF8X7yQW39ihmq8i/39
 ktULz+olVjAsEYTDjcgFk+v75GuweP9vmk6/KCaC4uR5t9O5l/4ngbzblaDY9kh4eHnd
 +t+YzLFjOeMebsRJIbflfxp4uk2xIjN0awnYrpbMlySos8NRkb8eXXZO1PFQyY3BecPh
 hILg==
X-Gm-Message-State: AFqh2kpzSLKhpEkBlLdks5tbHk9vFeKsH0xWgpg1xiM/+QH09DVDBbzX
 r0eDWz+qfJrHNH1iGcL8f6EdvHs10fxJ3Fw/
X-Google-Smtp-Source: AMrXdXt6xFJjY4IHV66bQwAp414cELhLjBbEPTRyj2t8LaFGG8Xn5nOUTp42J51amzuei8joPaTQSQ==
X-Received: by 2002:a17:90b:360f:b0:20d:bd60:adab with SMTP id
 ml15-20020a17090b360f00b0020dbd60adabmr16009067pjb.39.1671906854175; 
 Sat, 24 Dec 2022 10:34:14 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a63f751000000b0047712e4bc51sm3944468pgk.55.2022.12.24.10.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:34:13 -0800 (PST)
Message-ID: <7fb00103-4eb9-a003-1cfa-f08305caa5b4@linaro.org>
Date: Sat, 24 Dec 2022 10:34:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 22/43] target/loongarch: Implement LSX logic
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-23-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-23-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> +TRANS(vand_v, gen_vvv, gen_helper_vand_v)
> +TRANS(vor_v, gen_vvv, gen_helper_vor_v)
> +TRANS(vxor_v, gen_vvv, gen_helper_vxor_v)
> +TRANS(vnor_v, gen_vvv, gen_helper_vnor_v)
> +TRANS(vandn_v, gen_vvv, gen_helper_vandn_v)
> +TRANS(vorn_v, gen_vvv, gen_helper_vorn_v)

These can be implemented with tcg_gen_gvec_{and,or,xor,andc,orc,nor}.

> +TRANS(vandi_b, gen_vv_i, gen_helper_vandi_b)
> +TRANS(vori_b, gen_vv_i, gen_helper_vori_b)
> +TRANS(vxori_b, gen_vv_i, gen_helper_vxori_b)

These are tcg_gen_gvec_{andi,ori,xori}.

> +TRANS(vnori_b, gen_vv_i, gen_helper_vnori_b)

This would need dup + nor.


r~

