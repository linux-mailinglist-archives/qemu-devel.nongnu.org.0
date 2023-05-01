Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702596F35F9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:44:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYUh-0003KF-TK; Mon, 01 May 2023 14:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYUe-0003K3-Fl
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:43:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYUc-0001NH-HR
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:43:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so16962095e9.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682966601; x=1685558601;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9/v6d7eiICFJ+bUzyuHnadyxZ1SPlvYFDVLRVIEloGU=;
 b=ZoQVkP1z7EvsDp4qUEvitYC03SvzfUDHcYSjFFIRFwLHxKGEk94+lFhFvUrjdojj1N
 lWkxDftt6EV8yvD3eL6LGiHasxKCoNLeK04vPeFntqw88girjjD1jm6ogKcfcQv6Yy6F
 ROzl2SGGdboeuD4OCQIhAQkBr/OqQsrmfeP7u1nfp7VuznPyxvQoTArTrlxyjF0rhVdt
 Bx60nES2BX4E9S24mtPi3JJu7Hzgrz65Pd0nNjZRObQ/jMDbZzKTPYlMPA0bgXYkyFg6
 luShtK/TwaFDEOGfSUf1KgIq6pUH0MFie96txeOl5mTjYpMH0rIRxXZdj5xi5vRHUvFc
 lhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966601; x=1685558601;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/v6d7eiICFJ+bUzyuHnadyxZ1SPlvYFDVLRVIEloGU=;
 b=gXotlWgGuSKesigKhWKVMczACn3l8nt7kBlcqp7toSpmf1yqPttTTNiZxpqmu3BQLu
 JLANauzeVvHKX2OmW+mOpOEmD+Zc36/JtimF0MsTtKZHkrNgneKvywHVCMIbA3QGHb3R
 NPtDUzPqT/t8MVzcF86JboQ3ILpxgOg5H/8ptYRlmwaxeZOhgCrkOmD8NcFylK+aH6Lw
 46TFiKdzQiQTbNNaE1jqCsdp2NQBmbnVVqFvSCOUs6fa5YjbScg2AduqCuYiNmH1muOT
 Ylh8PeoHHgg+pviJqZMvwUoRtCSKNrryuNNiwBkyVW5iRIaKx1qqKt1ikoK2AmCm2Kt3
 WNzA==
X-Gm-Message-State: AC+VfDz4A505hsdXSNenjksYBqoyuXWv/o5jgjVToeWikQGAobN7JwUW
 3HpYzr4bt+v8Y25qbAdVBooQE0tny45KRv1phZmINg==
X-Google-Smtp-Source: ACHHUZ7WAskptJniON40PbWMqKgPeK1OnosrYAwVSTupIUrOZfSMuB6Pb3m+2tYETCfetDmsmnWuZA==
X-Received: by 2002:a05:600c:b45:b0:3f1:987b:7a13 with SMTP id
 k5-20020a05600c0b4500b003f1987b7a13mr9723306wmr.4.1682966600841; 
 Mon, 01 May 2023 11:43:20 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c294300b003f182c11667sm33095223wmd.39.2023.05.01.11.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:43:20 -0700 (PDT)
Message-ID: <8a821169-6dc3-ab82-bd32-990b0f9a8c98@linaro.org>
Date: Mon, 1 May 2023 19:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 00/44] Add LoongArch LSX instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/25/23 08:02, Song Gao wrote:
> Hi,
> 
> This series adds LoongArch LSX instructions, Since the LoongArch
> Vol2 is not open, So we use 'RFC' title.
> 
> I'm not sure when the manual will be open.
> After these patches are reviewed, how about merging them?
> 
> About test:
> V2 we use RISU test the LoongArch LSX instructions.
> 
> QEMU:
>      https://github.com/loongson/qemu/tree/tcg-old-abi-support-lsx
> RISU:
>      https://github.com/loongson/risu/tree/loongarch-suport-lsx
> 
> Build test:
> make docker-test-build@fedora-i386-cross
> 
> The following patches need to be reviewed:
>    0001-target-loongarch-Add-LSX-data-type-VReg.patch
>    0014-target-loongarch-Implement-vmul-vmuh-vmulw-ev-od.patch
>    0030-target-loongarch-Implement-vpcnt.patch
>    0034-target-loongarch-Implement-LSX-fpu-fcvt-instructions.patch
>    0037-target-loongarch-Implement-vbitsel-vset.patch
>    0041-target-loongarch-Implement-vld-vst.patch
> 
> V4:
>    - R-b and rebase;
>    - Migrate the upper half lsx regs;
>    - Remove tcg_gen_mulus2_*;
>    - Vsetallnez use !do_match2;
>    - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to replace
>      TCGV128_LOW(val)/TCGV128_High(val);

One minor nit, everything reviewed!  Congratulations.


r~

