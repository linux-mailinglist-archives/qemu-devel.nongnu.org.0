Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1350A7DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:12:01 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbHc-0007Yb-PQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaIG-000100-F0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:08:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaIE-0007cQ-U7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:08:36 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h1so5547299pfv.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PantD3J97K+S58onTh6J/zYTIHyuR0qRBL/hFQqoMUE=;
 b=BAUzbplTEW8xsnDXv+uDvCB7aqaKKPVUqdCsoaJdalWSuwE6aWwnpE21OY7G0d66WV
 sBK/TfOZHxAbW0nQAH+Vum6OFptpNIsIEOYxUQr8byLjpwm+ubBp5gUc9ZNiNI6L7Fzl
 VybqpZCcV3VK2sc8EOlJozcgqn+IRDGOvJODdtEVBID/ixyoCxfr9h9M91uLMhCjN5VT
 T0XKfswD/0OIcLJbZ3ihAuT1rA5fJWJTbz5SLCtK19sqmv6CRPAsj2OACJvwBCjZDhYf
 umymrF0yXIHiRUZ1MgMTkGxtsP1uSZnS0DYfqfPidJ06W1pWP9Elkcur/yQnQUkLtIuE
 PtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PantD3J97K+S58onTh6J/zYTIHyuR0qRBL/hFQqoMUE=;
 b=j16gBhTykaKFgSWkCHT2yj0dXMYiHCUT2BtuPhXPGcgtaht/y1VIoJ4viiipLw05cP
 e9tbUW1XU8dJrzaujNz3S53xKD/FHkfX4ZtNB5rZlGUCUbPVOQWxcu5d1g/wL5/1N3/T
 KzKMuTF+w0rYrn38b7E8O39itrS4EVCDwEQUILwKeQEvs/W9xXyN4n6QPrCe/ji6oYOI
 kuLLBcvSKGoBxLIH9S2HUfDlI3o9bO0+zSJ6FgRDW1ZXyV2pcdxDa3k6M62zS9Zl9z+4
 CjP8E8KO5QBvD/kTnb73fUyfuKpbkUglLk53JQ4Gb4wqJfAh56SbkN9Z7WbAZtLGscY7
 C+HQ==
X-Gm-Message-State: AOAM530eHFkBYpGUiJToQdnWVFOtjUAfS1HdUFZddRjtb+QbzSHbIpsn
 RkJ+WNT2Y7r3wpDN3D0oqIG47GO9CyYYYw==
X-Google-Smtp-Source: ABdhPJyL/UtOuOq4Md4F4HfLbD3aDHy3GYj1uuSbwL15Z3t57c/O3ZunDD/6DGtfFS5gbY3Se060cA==
X-Received: by 2002:a05:6a00:711:b0:4fa:daf1:94c1 with SMTP id
 17-20020a056a00071100b004fadaf194c1mr702564pfl.52.1650560913441; 
 Thu, 21 Apr 2022 10:08:33 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056a00114a00b004f784ba5e6asm26736089pfm.17.2022.04.21.10.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:08:32 -0700 (PDT)
Message-ID: <d8c774f7-2ba7-506f-727f-fdf2946099e4@linaro.org>
Date: Thu, 21 Apr 2022 10:08:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/rx: set PSW.I when executing wait instruction
Content-Language: en-US
To: Tomoaki Kawada <i@yvt.jp>, qemu-devel@nongnu.org
References: <20220417045937.2128699-1-i@yvt.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220417045937.2128699-1-i@yvt.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/22 21:59, Tomoaki Kawada wrote:
> This patch fixes the implementation of the wait instruction to
> implicitly update PSW.I as required by the ISA specification.
> 
> Signed-off-by: Tomoaki Kawada <i@yvt.jp>
> ---
>   target/rx/op_helper.c | 1 +
>   1 file changed, 1 insertion(+)

Queued to target-rx-next.


r~

