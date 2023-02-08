Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B426268F802
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq6i-0006Nd-7n; Wed, 08 Feb 2023 14:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPq6f-0006NJ-UV
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:27:49 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPq6e-0006Ew-9v
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:27:49 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so3350905pjb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7wydLwGWVIqSR00/L+soQ4BqsoKEj0d3QM3Zrtq6iY=;
 b=u/5TqDSSy+6h6iwWPQhSo+t7WtsO6vniK2MqHTT0Xj98LaJMIzhUv1spGiSvEm2m7t
 IxfP14DdifsyZo4oIqhBWIoglp9TBXGLDKoXUOfJmoJloeRCGsNUGEhVDuq+BbjWnhuf
 GzIMYBvwgATkqAEfUJveeo8x2b5emRiHTS/ev4xyORcLf3lO605FBemvaaWScQ6Ulfo+
 LnY/k/DHa50IWMIGiAkVaqXxyvhYEO12hHtwSduHMGOJPRbVdRIMbWIYxkOK7var8c7n
 lthBSXdUNj6a/o23KywSZ2o3dYxmc90elxqEujl7rlpI0Uy2gq/WvxK4tJnJL+s2WerJ
 9mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7wydLwGWVIqSR00/L+soQ4BqsoKEj0d3QM3Zrtq6iY=;
 b=XgbXP85UkZT7vyXKysyFvQVjEhJ8S2Yua833v5+5kbJ0Djgr+HQFz+3Bt3rOQZbcOi
 ge9wzM5pvhaL3FxK06bryYu+VpZbXzcw+RpZ3LwGxv65D6B603wR6B1ME6HR7hh8gIWn
 4yyntOUhCA308yghu7EJL2tOEgXJ0+AWeMs/pWvb6lsMi2F0a2DIcQ4d8VSISp6ettBf
 0Wtdsz8Z0hiZuQFIr9j6pc5NnKNfrvRsHNy9OkGMgVXXvH7fsP9OxiYtLeGSBH7YvBUu
 7QA+arYXk6KKtiU9/kd7NK+VDKlfXS1fD0rE66U/DJIX4bcLpZZDqt01VrkeXDmRy59O
 R3cQ==
X-Gm-Message-State: AO0yUKVGAch1yc1DUcS2O0yxF5NxYXUakZp0V5aKmcPfFCP3eTdPHq6I
 3qSPJ2E5iOIfIKeWyh4P5qfYSw==
X-Google-Smtp-Source: AK7set+6peDvrGfcnAdRaztCCRs548P6Nnjx7M9tKepu1hFOPLZ0h1eRNMNn7Fynr2N6vv6Sf0IhUg==
X-Received: by 2002:a17:902:e885:b0:198:dd3f:2847 with SMTP id
 w5-20020a170902e88500b00198dd3f2847mr10133476plg.21.1675884466565; 
 Wed, 08 Feb 2023 11:27:46 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 e6-20020a170902d38600b00192aa53a7d5sm6490819pld.8.2023.02.08.11.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:27:46 -0800 (PST)
Message-ID: <270529db-7822-e530-a009-6f20d789432f@linaro.org>
Date: Wed, 8 Feb 2023 09:27:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/7] hw/isa: Un-inline isa_bus_from_device()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230208000743.79415-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 14:07, Philippe Mathieu-Daudé wrote:
> No point in inlining isa_bus_from_device() which is only
> used at device realization time.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c     | 5 +++++
>   include/hw/isa/isa.h | 5 +----
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

