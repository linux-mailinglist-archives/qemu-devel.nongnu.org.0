Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D904CDF11
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:00:53 +0100 (CET)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQF2i-00039t-AV
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:00:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQF10-0001kX-2f
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:59:06 -0500
Received: from [2607:f8b0:4864:20::432] (port=40898
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQF0y-0000z1-Kd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:59:05 -0500
Received: by mail-pf1-x432.google.com with SMTP id z15so8597045pfe.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Eekm2WvIyzo5soLnTdnUKGwZaHNDNCEUFHSu4cjA86U=;
 b=bQ4xhkY4v1RvuzE40lAvrBF+reRnIzys/Pks7vZM0vWfKY6wWdWaZj95+skGVkhD3e
 jQBCj0hz2z4JFM8ofzV18bUms2cKfaFFQI96XhOiBo315xC1HhPatNqaUIGovbkai5dY
 bKH7poJyymHfihwwVimNO7Qwa2xWSMoymljFEs0bzNAUUr6Q5lW8+a/vTcAO7p7EfA1b
 klZXd6EQcUDr0rC6DDvGZiZDN01f12jlY1mvH1JjxxdnGNgZHep8yEHdyiiwdcxLAYC0
 aJnVFFwyRF4U6YqM0D1bOaTG/vbRqy/qQw65yL9KioybyHlmm4cI041K4HLMyhLic330
 kc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eekm2WvIyzo5soLnTdnUKGwZaHNDNCEUFHSu4cjA86U=;
 b=tijjWzjmyKpVqiQ/7F5SPLa0cIR32r7OzVBMeK4qbA/TSvuwqkHWyaTMJxVrKz/LKv
 5NWj+f/jzNZPxhKt7WYsHMvUjmZv3emMkWmWd27BmnWtT0PeL897QL1+hoOMA6j/82g4
 Yv3MwERGpTeqCfJ4RLbAgrwjB4VIT4kp00S79r21hjlILODDnyHcnPK8u+6CeM1X2NNW
 DrW9Ec5RkAmvmuPHeH50b8LXI2ahVNPnz0zSdGBLHwgoOPKIWkCiLhSHwa/2soRstQiP
 oVIwcBce600NZV0oXw8m3hkIh6bXLSq+ErNiPnEBRKY0sn6OmYXL5wHAg29hBLQUrYnf
 lnEQ==
X-Gm-Message-State: AOAM533Ee4szhOfR7OC8AAxNQAo4+NlDsUhrufDQkV+hPpyhalosKiOZ
 I6/oirSkRVbOX1zbsZ4KWrWPgQ==
X-Google-Smtp-Source: ABdhPJyT+FnzppAkRVMvVxcr6yrgiL2tlBJzTv+hwFTevJ78CIc+plFdNmKLQUUczG3cWiJAOkPqqQ==
X-Received: by 2002:aa7:8256:0:b0:4e0:78ad:eb81 with SMTP id
 e22-20020aa78256000000b004e078adeb81mr311680pfn.30.1646427543292; 
 Fri, 04 Mar 2022 12:59:03 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a17090a899400b001bc44cd08fesm11647167pjn.20.2022.03.04.12.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:59:02 -0800 (PST)
Message-ID: <62831816-2566-f65b-684a-baaa9cbac186@linaro.org>
Date: Fri, 4 Mar 2022 10:58:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/5] target/nios2: Check supervisor on eret
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
 <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 05:39, Amir Gonnen wrote:
> eret instruction is only allowed in supervisor mode.
> 
> Signed-off-by: Amir Gonnen<amir.gonnen@neuroblade.ai>
> ---
>   target/nios2/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

