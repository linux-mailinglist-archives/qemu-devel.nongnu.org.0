Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA946D2C53
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 03:07:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piPhJ-0003EK-1f; Fri, 31 Mar 2023 21:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPhG-0003DR-Ul
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:06:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPhE-0001El-Ta
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:06:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so27250697pjt.2
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 18:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680311178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=91wvJ6cxHZmm/KkL/Yxe171RrLkqIyhQT2fZbByREqs=;
 b=Envm8FQj3XgQ3X/xFoa8yK9NqJK5hFxx8nXAjbyrBDW+vl8o3+19Ojuwi3bgK592Ys
 /lRzhFye4Z9LF4vXfRnktDb56o1EUlNZwEG8js6rixkNU6UWGeEQIx5+FZ5qXx5KJGO7
 QVXB4wKwvPmsCRcGZOjn5gqVyTHfhsenU9g3DfBMT25ROLAEqQGrUZ/VqdZvKn+V5epp
 slaH/MXcw28I9qXW+xYdsj0RSmRtk1mFOdY3g57f3YGp8esCJObVRSj2ETp/aqYARJjc
 5Fpwmu9/Pngy4gDSVQj+JmRgKenCCu4HWHusO5sR6qWxJ3/7t1hLCttW4nqC8s1NrSL+
 eopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680311178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91wvJ6cxHZmm/KkL/Yxe171RrLkqIyhQT2fZbByREqs=;
 b=GltEq3Sc4Z4PiYPxlfxnpZQlu49LlOgA3O1YJ9+F4evMAx9WuwaB2umunHHfTXoNDq
 QZE5wrgmEkn19PeLrAgVeUG8GHLmg2rMe6nb9mLHA2T2G8vmeKZn3lbBLyVHvUR30SWg
 ProD+tNtf+YXF9Eq8FeGtmiiLTXLa9uDkpw4mXNtbbbN5lEi82Vn9tKIY+dSFVTtInnf
 rKO/bsE2jIU7yC3RAD+C6e7ye4l2gTVKSSBMgIU47QyofzA0l/LYMSQujKgxzCYf+pvi
 5iI1+RXRht2gZ0Nx36lSV0NfejBhyryH4B85xTFp166CLNdU85BWxR3PFXrdJ6+xsMJ8
 DDTg==
X-Gm-Message-State: AAQBX9cujcPGNNspl//FCoRoIkdvNWVDsNDJZJlAOv9iV4EcGhU+Ta/W
 p360ig25gx0Q+QYDPyclfyR5YA==
X-Google-Smtp-Source: AKy350bTSJ1rjdR4IjDUvCOMW+qIoj7vIK7+W8gbxSSp50K/peALHKuPlRVgx005ZGEJAxNCOMqjoA==
X-Received: by 2002:a17:902:ce8e:b0:1a0:65ae:df32 with SMTP id
 f14-20020a170902ce8e00b001a065aedf32mr38015428plg.37.1680311178304; 
 Fri, 31 Mar 2023 18:06:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 jc20-20020a17090325d400b0019aa4c00ff4sm2130797plb.206.2023.03.31.18.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:06:17 -0700 (PDT)
Message-ID: <a256aa68-8cff-337d-bc33-401d8e39d387@linaro.org>
Date: Fri, 31 Mar 2023 18:06:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/8] target/riscv: Fix target address to update badaddr
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/31/23 08:06, Weiwei Li wrote:
> Compute the target address  before storing it into badaddr
> when mis-aligned exception is triggered.
> Use a target_pc temp to store the target address to avoid
> the confusing operation that udpate target address into
> cpu_pc before misalign check, then update it into badaddr
> and restore cpu_pc to current pc if exception is triggered.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 23 ++++++++++++++++-------
>   target/riscv/translate.c                | 21 ++++++++++-----------
>   2 files changed, 26 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

