Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D20655B28
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 21:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9BE0-0002ru-OO; Sat, 24 Dec 2022 15:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9BDz-0002rh-HP
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 15:34:31 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9BDy-0001OS-0X
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 15:34:31 -0500
Received: by mail-pg1-x534.google.com with SMTP id d10so5198423pgm.13
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 12:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/VYdQkbV3H8qj01Mca7bkR+xGZl8NkXC0SahbvTg1vE=;
 b=jxs+2+CQ1p0xdavLMq08p/inDpN8sIEl54oFIbNP3CvLYOrZzUtFbCbf+jqk4S8T93
 OSeiaRr4sGoFdDgrQq+gaDFhTJbqOisHvXigcToyH1M0sVPcfe2VbPEynilKtp8ITY2R
 qxUf6yI75LYnusWfmN+4jW5crL34oY6pwyOPZGVoWjonhQs/pZMbiAa65EnNQbYjcTsy
 6oivgxRYe6ROXXdKx3Dv2cLH0QjBjTXcUZOSM1TXg9+1R8/jECVA8o5S68P8o//qKHr1
 mCN45db3IIXr3AN6C+iGkk2BPZxLpREovA77tCG/mfyWs22+eau8kNgW3K6TQnXZpLfO
 KiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/VYdQkbV3H8qj01Mca7bkR+xGZl8NkXC0SahbvTg1vE=;
 b=VmpB1+7pJKyLa5gwERcwbUUonMAl2D8ayHo9Ww+u+T/dFj9hRxljj4R2sDdoYclFVM
 cBvWz9mOoz8SDNxr/wvx2Yx5kxMT38ye4MOdU/q7prZB0zCdiwP701vhFA0/8fVZ9VNi
 UmhxRiZKN7McvtpDd5IyDMXm8QbYz07sV6chKHFyhKwXbnw4+25K1Eutu8HHvL6uZpUw
 F8/Kpb5r2G+25tje1dLo7U2ZlgtPOBzh9jamu2cQfOFDkZUQdYYbM639+YJAYbylnnbU
 6oUXzN5WL9E6yz5qJ+iL+DdjInqbfI/tAzxtWK8dRpXEVWarr8IWjeUQdKm8SrcC2SR/
 uYFA==
X-Gm-Message-State: AFqh2kppDzHjYzb1a31C1SbIYYwD2eQR4Sx8QVMr8DN+z/TLigvgCgmN
 IFTeyaUnHEPGu6u21/x6X8CdhptpQLuc0P0a
X-Google-Smtp-Source: AMrXdXsc9QbAzNkMQWjJ9QGImGgaYAh5kcqa1mWox6+SOPWoAPkHPyZauERnF//UCVVNCES/a2k+Og==
X-Received: by 2002:a05:6a00:179b:b0:57e:827a:52ac with SMTP id
 s27-20020a056a00179b00b0057e827a52acmr20561708pfg.31.1671914067858; 
 Sat, 24 Dec 2022 12:34:27 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 i184-20020a6287c1000000b00574ee8d8779sm4458046pfe.65.2022.12.24.12.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 12:34:27 -0800 (PST)
Message-ID: <3acda962-c167-29f4-054b-5ac7bf32c55b@linaro.org>
Date: Sat, 24 Dec 2022 12:34:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 39/43] target/loongarch: Implement vinsgr2vr
 vpickve2gr vreplgr2vr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-40-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-40-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
> +DEF_HELPER_4(vinsgr2vr_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vinsgr2vr_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vinsgr2vr_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vinsgr2vr_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vpickve2gr_du, void, env, i32, i32, i32)

These can be implemented with tcg_gen_{ld,st}_i64, and offsetof.

> +DEF_HELPER_3(vreplgr2vr_b, void, env, i32, i32)
> +DEF_HELPER_3(vreplgr2vr_h, void, env, i32, i32)
> +DEF_HELPER_3(vreplgr2vr_w, void, env, i32, i32)
> +DEF_HELPER_3(vreplgr2vr_d, void, env, i32, i32)

These are tcg_gen_gvec_dup_i64.


r~

