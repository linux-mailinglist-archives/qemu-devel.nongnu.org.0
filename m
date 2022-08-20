Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3059AB77
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 07:22:02 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPGvp-00063F-DL
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 01:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGtc-0004HN-Sa
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 01:19:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGtb-0003rl-6N
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 01:19:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo9263550pjd.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 22:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Gt1LQjHVm6dNUnA0JJYzhr+cF4q8Z4YhDdujLaWT6Is=;
 b=uPlxWW2Ehzr4GIWWmOfNcBIMsTDsBqXWsVailm0dacC+SUucZJxWlY0Ady1j4I9e/g
 DELqmHiAWtvUWGxgJGmsiEhhMyCKRe0gsDerhuNKj6rQ4at1xrpZoZXQPEQ1BfZshPRU
 OPcWleayjJh4J4X7lzS8aqLaLMQMWfcalnQdCmVLgwQ/5Ixy62HmEPPQA5tBw3WJfxy+
 wieccBuH4TRkCEDSvrxHzHKaYQWPJ3bEOU+sOsLwjxvFEuN6zdPYGFMaITviYZ0iW09i
 UdaB+MYlUDXmFQI4TrlANVAUhSzZDa/vtRbh3IJJsrcXqwI+DatXeXFW2JyOufZsoAeY
 d5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Gt1LQjHVm6dNUnA0JJYzhr+cF4q8Z4YhDdujLaWT6Is=;
 b=wAwvGEzjyEGzSPUlZC9jLs6eO+fj/DUZL7rZOEXzknO2L0uLAt1WRf8EiQ/kF1d2Lp
 y0MpWQEArpoyCT3L54SmrnkIewK6rf/bXiwSJiXDkXqON+waSRvhjbAweXfi5RoodBu5
 9hLLozRnShD2IsIaanEh11wSKMZL/+tyDmT8EeXxVchet/ZcS9xxcelzzR3dMz8urAPN
 VizFFUqQC77L6XZ3bAEjeBjgJhZFtQoAL822W7l0a51Cap8fZJRzHUHawEVx1LI/UaW5
 5P4pSDgCq73b5Y2zMu6zI9DJww2NCXEwyTkYJnJL7W+cSQkvRzpjfNfHYxNhxYgspSp/
 SgJw==
X-Gm-Message-State: ACgBeo0XackNqApHXhw6i7Expm31/xTGRw/Sr5/sZTuETklqGjv1OQNg
 JIBwBcNk5cVHpwsS5/osapR1xg==
X-Google-Smtp-Source: AA6agR6rma0N26ySf3GA1ySr1tiyv3DXrJlJsS8H4S/ZXnM+4Mu9c8k58t3tjgb78V3QZQ/44ptJcg==
X-Received: by 2002:a17:902:f64d:b0:172:d004:8b2d with SMTP id
 m13-20020a170902f64d00b00172d0048b2dmr1876435plg.14.1660972781179; 
 Fri, 19 Aug 2022 22:19:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:b651:a70f:2852:70f5?
 ([2602:47:d49d:ec01:b651:a70f:2852:70f5])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090a6b0f00b001fac90ead43sm4043660pjj.29.2022.08.19.22.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 22:19:40 -0700 (PDT)
Message-ID: <eb492ba7-017a-178c-ea9e-1f089d40c421@linaro.org>
Date: Fri, 19 Aug 2022 22:19:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] target/arm: Implement ID_DFR1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/22 04:00, Peter Maydell wrote:
> In Armv8.6, a new AArch32 ID register ID_DFR1 is defined; implement
> it. We don't have any CPUs with features that they need to advertise
> here yet, but plumbing in the ID register gives it the right name
> when debugging and will help in future when we do add a CPU that
> has non-zero ID_DFR1 fields.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 1 +
>   target/arm/helper.c | 4 ++--
>   target/arm/kvm64.c  | 2 ++
>   3 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

