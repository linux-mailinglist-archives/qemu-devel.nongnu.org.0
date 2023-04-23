Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA26EBE3C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:15:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVoR-0007N5-Hn; Sun, 23 Apr 2023 05:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVoL-0007Jf-4X
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:15:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVoJ-0001Xz-9E
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:15:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so3059536f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241304; x=1684833304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W/PEk3qgusWqlVhI8sXupDxhw8i1+tV1wrM4prZxeD0=;
 b=fO3xPSZq0g+8ixEeGdKChisA+Z/suymIdZ9ei1+WhYkiDzoC7OuGLGQBw+rOUzSPph
 K++uSw8C7nKe0k8ZOpEvghkTxviT1JcbB2fsGGeDeI/+jyJP9WHQPKxhKZiq3pcba1eJ
 4GMgq29dtKlm/MkgfKe66WnnL/y7VKW/guKZajNYZkmfz/sA0QY7WwvD4mEamcosO5q/
 g3KFcmsGMVlGBlQzDY2/s/5Siz7JccBdfu2LHdZM8NEhfQe+JG9jhGb91w8lFWFLUef/
 OlQ1qCPpEOO6f4ANNz7E/GcIy5COalyWDXcs+7xA80vNH75mY8FFQJ7Igy9sciK5LOHR
 J34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241304; x=1684833304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W/PEk3qgusWqlVhI8sXupDxhw8i1+tV1wrM4prZxeD0=;
 b=IzLHhZXVPRePeuxKEvX3WMas/nEvGJGmkxAfc3iB6eYHi9Z6JpcXlI+R3+hoX6MlA6
 Oqj5j4y1RTrUHffYOA29NIN40LTdZjzElYsGfmCCLOJQW8TVB/vZQMxN5M2kfd/c/e4d
 w4yxHYrg5T2dCtwmNW6ZTkTsFKki4RaeMH//hGdg25ot73kCpTJBzuR34gS4EYoQLGPh
 qiqp6IYKhLDnPi3/jQAJI1NVhEyqOXh9VPKbx453A+fXKdaa7jMuHPQ+0jgyXY++FK+j
 JV/E6QnQ3xF8/tkmvV4QfbvigfjnFyPENRsF3h7WB6ao0hcW4iNDao7lv9B05PgYlRY2
 gNKg==
X-Gm-Message-State: AAQBX9cFHRtLDbUof1FvrGIT2sG+ynryI/qeuqtH5ToFGFXXj1OaRzlq
 O7jjzwhNbyYgtuVGI28jUuxr1g==
X-Google-Smtp-Source: AKy350Z9FHvTFe9gqjJKRccAv2p+I2qM9bzY15h1/s0Z9DM9kwGF2mNvy98KmMm1GSFfm5H41P0uWg==
X-Received: by 2002:adf:dd85:0:b0:2d8:82f9:9dbd with SMTP id
 x5-20020adfdd85000000b002d882f99dbdmr6980920wrl.11.1682241304467; 
 Sun, 23 Apr 2023 02:15:04 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003f199662956sm3448488wmc.47.2023.04.23.02.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:15:04 -0700 (PDT)
Message-ID: <4fb94ed3-be17-9724-db7b-f84e1d410496@linaro.org>
Date: Sun, 23 Apr 2023 10:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 8/8] tcg: Replace target_ulong with vaddr in tcg_gen_code()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-9-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-9-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/20/23 22:28, Anton Johansson wrote:
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   include/tcg/tcg.h | 2 +-
>   tcg/tcg.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

