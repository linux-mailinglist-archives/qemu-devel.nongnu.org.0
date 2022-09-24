Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E145E8FCD
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:23:17 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCcG-0001KL-7Y
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCYw-0004qP-6y
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:19:55 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCYu-0001Ff-53
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:19:49 -0400
Received: by mail-qt1-x833.google.com with SMTP id s18so2056424qtx.6
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=XOrWf7e3wjc74UTWibLkWf9+WZkKjTy6gTN1aSAXINQ=;
 b=MIfUaJBwpkUvy8ChyywPTFx7ui8b1s90yNYdxsAwKpaESvpPXkZeE15joTWzKA76oz
 JS3f1Yz6NNBsXeemHmFxwcuwqn5SV40GxXY+0urpxblbMcScS/8G/+qVwLdfmgeBFihl
 1komRjOxXPiFPavPmtKVJTXf/1GWG9ibE70MvnjK2wRK3jBEjWJRYNRXIcmiKpc0ITXG
 5V5x9dtwk+hC4oRpkd6NxZyARKgOocju1mOg3pS4f6sD7Q1a5cZuVgpVzcRy51So7Frs
 /ddIp0PfueKAQyg88y7Y5K4ywxfAV5yTAme7ggfwK68cuq8X+U/gR9YLbQ3q7c0R+3yL
 YsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XOrWf7e3wjc74UTWibLkWf9+WZkKjTy6gTN1aSAXINQ=;
 b=dhOGjhHvL92M728SS/yqKbpQ2eP/zFY7MS7Zs5UVonzoBSjEQvjgOZk1T7OSeP+04+
 q/WEJXI4utqiI20akKWMdKy9c+YsXy//UXfO91HCcW5MvtH0v1suuaeANhfkl5trovIh
 0YkdvRZES6LlpxXfmb2XZCxtVVWWrECNQY7HIYf2h+uiChwSs83WMncPXEmZ+ayDJ1Me
 LeM8bmH8V2S+4CBF2O7Wzdn286JrtgOfWILi/1JFxY3AUwlnoCz9ZvFzZsc1ERP4O9Bn
 7bxwd2WBcRYWrb0IZHVXoF5wrZ1aSpFFM0Z/2u2TSekXZm/1XM1/CGoxUpwAXSKEbvbi
 k1Eg==
X-Gm-Message-State: ACrzQf2UDtoZeB3rZnTVgXzMdNLi/f5Bh7pL/Mp3rdtIvC5j+LFanCuI
 WUY9AL5AbqN5fEzA/K0kB80Yng==
X-Google-Smtp-Source: AMsMyM7t3nHgJD2deScf+Pnp4hW8COnTVxcbnd+qmdgTDF3d0ZDha6ZdotQYATXLcxCZ6AfpEgkGRQ==
X-Received: by 2002:a05:622a:54d:b0:35c:f693:d754 with SMTP id
 m13-20020a05622a054d00b0035cf693d754mr12742239qtx.181.1664054386437; 
 Sat, 24 Sep 2022 14:19:46 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 g3-20020ac81243000000b00342f8984348sm7903333qtj.87.2022.09.24.14.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:19:45 -0700 (PDT)
Message-ID: <e06def60-db11-203f-8481-0ffa9570f14c@linaro.org>
Date: Sat, 24 Sep 2022 21:19:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 32/37] target/i386: implement XSAVE and XRSTOR of AVX
 registers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-33-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-33-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:25, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/fpu_helper.c | 78 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 75 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

