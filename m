Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648E6A2879
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:30:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqhK-0008EB-KB; Sat, 25 Feb 2023 04:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqh5-0007iw-H2
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:18:16 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqh3-0002hv-As
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:18:15 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so7866978pjn.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
 b=CCksE971udFBvISfU4vGG5CkgX4CGqC31u1DQOETeBzLkOKBQE/GzvABB0bveCD62k
 /iDg9VRD+MabahlyZlbJDu6oE88V3iCg/CWFgngoCb4iL9PJEfwGwU54DPOmQeI4Z/S9
 wDjK8xs2UnOrQDWMLVkSsFDdhqxl3+oqLvpOj7HVEmwfEpZ6/sfrZpvIzxQ+tVLg8iug
 JEqfsXRzXXWcDsEeE0L/brlNCNfytaRg0Dc/RLlmejbDAJ7vh8Gb01EGesZ/yNta2yMS
 m0TnrdiqKsZ2Hj7tGUszF2RGUYHm0GMFNR3sTtU1f15Ga0zZH3GBcd/SZVtCBOrk0q87
 Mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
 b=QgIs67kxsJqhvZKdoR+ZjjIzsEiBOtHMg1bk/01noKbOijPUqdi3oFxhHyGBWZoQlQ
 4Hs66aYqk2qyydlclqOOx+H8uu43QLFFgoJslMiylOBXawTaxjO4WJbvY2lKRooMOxox
 4esMwEEnSxrJz2NZ+fW0znP3OvKE1uQY0bVWxKlYS7odZnv5Y9lZl6WpmCA03u1MJ3qo
 a6pxss/pw3NcULbwVA/cE46wPIsJY9MnxopcGletsV7gzjNDgbmA0hmARxD/0AI3DzOX
 /pS0QD9Fohi+1bVyz1Wq+hdHbfIeoB3W8YyUKh6pf9nb/hY/8J/IsO+QFLytKuI4EZj5
 AtVQ==
X-Gm-Message-State: AO0yUKUbWzQD+0CsytUwVd3rMvo9ByiSvHZ/o7kDmB0EFoETxBGQPeMo
 8tbHemgjyU5cFjjZ6JSD+MvG1siwWv02eHcGNEE=
X-Google-Smtp-Source: AK7set8ed26UqRj53odM7RGzgetttifzx/G4dGEVKSFRrj/RNH5xc7g0ssTE4UBxIL5bbMm6F3wDEw==
X-Received: by 2002:a17:902:e84b:b0:196:44d4:2453 with SMTP id
 t11-20020a170902e84b00b0019644d42453mr22023371plg.7.1677316691091; 
 Sat, 25 Feb 2023 01:18:11 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090282c900b001991f07f41dsm804218plz.297.2023.02.25.01.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:18:10 -0800 (PST)
Message-ID: <d54fb59f-549c-9eae-80e7-8f02462e9a2b@linaro.org>
Date: Fri, 24 Feb 2023 23:18:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 26/76] target/cris: Drop tcg_temp_free from
 gen_tcg_funcs.py
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-27-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/24/23 23:13, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
>   1 file changed, 1 insertion(+), 78 deletions(-)

Bah.  s/cris/hexagon/ in $SUBJECT.


r~


