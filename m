Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A295655AFB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:52:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p99bT-00009u-RQ; Sat, 24 Dec 2022 13:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99bR-00006H-28
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:50:37 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99bO-0001Df-0S
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:50:35 -0500
Received: by mail-pl1-x62a.google.com with SMTP id 4so7667787plj.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bT0w5INo14rEA9GNlNBCXC5dWLFMzSL6LWMif9U1BTI=;
 b=twxQZRfKZcq/OGf22O9MLh7zuhQZRxnhTiWK8R+Z9gAfmOICJuMVhqRgrutPbOe01Q
 jUTStbfUR6YsI7hpFtOEjVCRwi1vb+OLIhvCYYIwxQ0csQgFvEodaQBdFGu0GGNixSSn
 9ZiYa52Uk26t3pqbGk3C6jV/K/obXqbLzevsCR9Ge20kJZcqmJ/nWGGeYPigbjrY+JKt
 pz93bZiR1Qlyc2nXn1hrt6Nul2mAOF4mrp4iqD4EAhePP9tPyQL1+XY/RxHmZBCK5Rty
 laXoRDDPm5NHkoqz63k2MvR5GWfQn7RNMTIyp0nnjMk4W9R2xdXvm0uL+3NKZfolox4S
 P/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bT0w5INo14rEA9GNlNBCXC5dWLFMzSL6LWMif9U1BTI=;
 b=V5P4u1g3qwH64dQ2hVzJGajkuFSLk6sFyphLeK7mampQDaLq5T4OKHRCQmNP2+hNV0
 cEuq0eZm4/FnJC6tLtyL5p1Rblynf1daWnlF7l5QH3rKagJDHJk3OJ4qp24/d7dfkpY7
 Z/56Dmh+/e+MjMU2KOxIwn5aA19uzmWwr0wuGDOjV239L1QYiMGN75khEB5QPX3YdMW6
 41nIryO7wlWjbAnbrCqPH68JIlAyvx0ByAQaDHq0eZ6e2W+LQ7IRcGJyMkahSevJpFCK
 cRfYOgsN/C/RTiJZB7jYGx6rlRlG0KP/mnKAjhDyf9Z1xLjyqrGRD+b8JkcG/4R/OUoT
 MNIw==
X-Gm-Message-State: AFqh2kpzgBb4exZ9monLoNXvUWYOJ5fZReqRuuwuv/O4LeWYHqR5PYFo
 /clpbOwiHzqSJRoSvUvQRAKQFQ==
X-Google-Smtp-Source: AMrXdXtPnDcPQHi3/TP2vqbDOja96TAZhA/xeoaKAbLr0S6NRRPuMxofCZ5HEZmurtcNhCjnDLgFfA==
X-Received: by 2002:a17:90b:2314:b0:225:c2b4:8458 with SMTP id
 mt20-20020a17090b231400b00225c2b48458mr7264795pjb.21.1671907831804; 
 Sat, 24 Dec 2022 10:50:31 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a8a8d00b0021870b2c7absm3931058pjn.42.2022.12.24.10.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:50:30 -0800 (PST)
Message-ID: <d436cf21-f0c5-c4ab-c0b2-47734550e438@linaro.org>
Date: Sat, 24 Dec 2022 10:50:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 36/43] target/loongarch: Implement vseq vsle vslt
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-37-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-37-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
> +DEF_HELPER_4(vseq_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseq_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseq_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseq_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseqi_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseqi_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseqi_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vseqi_d, void, env, i32, i32, i32)
> +
> +DEF_HELPER_4(vsle_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsle_du, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslei_du, void, env, i32, i32, i32)
> +
> +DEF_HELPER_4(vslt_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslt_du, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslti_du, void, env, i32, i32, i32)

These are tcg_gen_gvec_cmp.


r~

