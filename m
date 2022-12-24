Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288F655AE0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98hf-00013c-QX; Sat, 24 Dec 2022 12:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98hd-00013B-CC
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:52:57 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98hb-0005GH-OQ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:52:57 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o2so2022491pjh.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thfRjXdPVnZQBju7fpQJVWUn1elNjzOMHG4Ic+Dsc9I=;
 b=vtT4lAkZKOl3tdeeN8tWdw2EMRrrJqsKX4u6fn4C/wZ0bfpJiV4QFWgskxJBDIPOtn
 BKhzaHu2ZsfXslxPnrXuXAvnwDJTxzumU5Y+KwVLsewZUx0KU1pT0Q4Fm2kFPVpMfrHt
 nr1GjKJZUfZn8fOOUrZiV8D7VUN8W3Dl0+EkNx8WedMgIRE+dhKYA8IQ+dBh248icORT
 WhlMGFNezfZ9+1JcDAtyMciwtY61LLlX+3q/S1Cw/yW0q71qliWASHKg+09Drc7RXazT
 5DFRBCZwOIAcX0KfK1vsKMH2RPvrocSTczuTEm1PXHkvR4Yd9tECm3VzpdJJfYhZYz3o
 pbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thfRjXdPVnZQBju7fpQJVWUn1elNjzOMHG4Ic+Dsc9I=;
 b=rOYiKUQ4BjdzVdZyWrINfG5tB35yKA3kNB8ODhZJVrqidnrL6ykMbP32HhsvwMkod6
 D3ECu9eQgsCqfp4DluBP8RJelHITH7pJ8n7iS46lbaQNjxdwmcobAX4zPPFrLzpCX1tZ
 XZDuVgyGH5wr1XZNp1MARLh9F/Op3dDQ6lqLnJdXCQVG0EgULL+rzribBQ0Q/58cK5rF
 LdIuSVVycgAQtyjyoTmsQSyQjzGn9lxWy95XLisgXjpYhW/JElDANUNZRLNBH7xzeVOR
 ia7x1imBhrC1rKy8vSnmYpdD8gw6US3AMzWNID3eeTusXxzbxQi57dGm6kBuY629WeF3
 oBzQ==
X-Gm-Message-State: AFqh2kqc/sKOtgYqgLKnKpqjVNUjGr2zftpNe41FfJMXW8RcUwM5+Bna
 b5niFDPYlF7LzIS+bveun5doFZVXpJUtaP6P
X-Google-Smtp-Source: AMrXdXuMBgu1AOcqNYshSEAEED8195o8vcbG5RMaCCr8oK+r8X0bciN3Zo0L6omWL7g283+686Sc+A==
X-Received: by 2002:a17:902:e0c9:b0:192:61ed:a887 with SMTP id
 e9-20020a170902e0c900b0019261eda887mr5255809pla.57.1671904374211; 
 Sat, 24 Dec 2022 09:52:54 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 je20-20020a170903265400b001869394a372sm4328399plb.201.2022.12.24.09.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:52:53 -0800 (PST)
Message-ID: <342352b8-e339-4600-c0e4-27bd4cd96fea@linaro.org>
Date: Sat, 24 Dec 2022 09:52:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 11/43] target/loongarch: Implement vavg/vavgr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-12-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-12-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> +TRANS(vavg_b, gen_vvv, gen_helper_vavg_b)
> +TRANS(vavg_h, gen_vvv, gen_helper_vavg_h)
> +TRANS(vavg_w, gen_vvv, gen_helper_vavg_w)
> +TRANS(vavg_d, gen_vvv, gen_helper_vavg_d)
> +TRANS(vavg_bu, gen_vvv, gen_helper_vavg_bu)
> +TRANS(vavg_hu, gen_vvv, gen_helper_vavg_hu)
> +TRANS(vavg_wu, gen_vvv, gen_helper_vavg_wu)
> +TRANS(vavg_du, gen_vvv, gen_helper_vavg_du)
> +TRANS(vavgr_b, gen_vvv, gen_helper_vavgr_b)
> +TRANS(vavgr_h, gen_vvv, gen_helper_vavgr_h)
> +TRANS(vavgr_w, gen_vvv, gen_helper_vavgr_w)
> +TRANS(vavgr_d, gen_vvv, gen_helper_vavgr_d)
> +TRANS(vavgr_bu, gen_vvv, gen_helper_vavgr_bu)
> +TRANS(vavgr_hu, gen_vvv, gen_helper_vavgr_hu)
> +TRANS(vavgr_wu, gen_vvv, gen_helper_vavgr_wu)
> +TRANS(vavgr_du, gen_vvv, gen_helper_vavgr_du)

These can be implemented with gvec.  See e.g. do_vx_vavg in 
target/ppc/translate/vmx-impl.c.inc, which implements the rounding version.


r~

