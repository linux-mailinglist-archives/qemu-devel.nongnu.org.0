Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2086FDB4F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:06:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgh8-0001GS-OH; Wed, 10 May 2023 06:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgh6-0001G2-Ig
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:05:12 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgh5-0003Kf-15
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:05:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3064099f9b6so4480334f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683713109; x=1686305109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8CKSVjek81xWbN3WLMP6MIF/QawIQPZxJF0M/RrfV7c=;
 b=hS2gA9/Otsub1NCrNuKaxU8LLuBrvW4yNnzPFztJoqIfZZ5ZnmdAMddVlHqYGIoujT
 rRvy7gFMankVkAvh3s9Y90jXqURUMwIcrYhs+AB6MC2CRkagPZ6hMaA9/QL+mhsZGY3a
 7hy57FZ7KuMggEJu38viwp35ENGz6M6SkGpdbI19414c1BZ6VGFX/gQZk+3bfoHFiE8a
 fopumFjilJmkY0O2dCipWE6AvIorLXtGpticENhfcSYDha0jFB1P1TrKIBftj7cf89Y7
 5NX7JPqNRJsLIZCQxELYyBORdQDdbREnTCds0Ddd6oYC5lvcltjcjiv8iep/dMCXyJMi
 +hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683713109; x=1686305109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8CKSVjek81xWbN3WLMP6MIF/QawIQPZxJF0M/RrfV7c=;
 b=KSmwnkOrmaIRmqLcw+dVUIsxyXIcffHSpCrIfe23qtVYGUAJwSZgndveTVwHXUhCQ3
 VRoykMpM/G+KIadoNBqafLGYB+/JRRt4oFyNqygyRz/VkWYL4FwoKCJZhpHzBzgOPKwG
 IlIWwK8sI9i3Ex0mf5U/jriVUHUkdMOWm4Z6uZVNoG/lOO+4IxQwv86h1RrBP6fpTUXY
 PYn7Vc40j+9xuJGEYarz8S30+91MKXauCzuO1Tt64/EC/QfAbM/CVFSvHI/xVnGbMK0x
 V6yLKgt6oKdUkRySXS+AqeJKdaIxFJMyAJ0iEj7qeZAulYtPtpnkJC6cJnS/Es/p7HlT
 zWzA==
X-Gm-Message-State: AC+VfDx7B8GWFwQ/cY7EM8Qi4ociiPvqkZM+wbNBs+c7dYksh9vVsBxC
 Pu4NG2Vq2/N8Vh3h6p6YOoyOnQ==
X-Google-Smtp-Source: ACHHUZ7uVpCVq6WTDdS0jnl4zEYZoiDEeN17gDhoCUSKCnmyDlgmaUCYvdn7UGQYatjPLamYwdPIbA==
X-Received: by 2002:adf:df0f:0:b0:2fc:7b62:f459 with SMTP id
 y15-20020adfdf0f000000b002fc7b62f459mr11968753wrl.32.1683713109557; 
 Wed, 10 May 2023 03:05:09 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b00304adbeeabbsm16825076wrt.99.2023.05.10.03.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:05:09 -0700 (PDT)
Message-ID: <6f6a5858-7050-b592-a2b1-47bf3fdc8c8d@linaro.org>
Date: Wed, 10 May 2023 11:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 12/12] cpu: Replace target_ulong with hwaddr in
 tb_invalidate_phys_addr()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-13-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-13-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/5/23 15:14, Anton Johansson wrote:
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   cpu.c                   | 2 +-
>   include/exec/exec-all.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

