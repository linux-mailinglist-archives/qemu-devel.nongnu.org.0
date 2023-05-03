Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5826F557E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:59:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9Gm-0000Jk-Bu; Wed, 03 May 2023 05:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Gk-0000J1-Jm
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:59:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Gi-0005Gb-VD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:59:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so30881845e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107967; x=1685699967;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=igf4zwPCPJarr0KLrzkiuupJdmLtcrvRBVl6Qse8SPE=;
 b=lTkJJLQLyZHgNWwigifJy7LwNnSqrw/0uvRRycjw2wbuFMNz38H1N88CalF1q1Is2s
 YcTKJEb8WYOXk6k6BnG1pwDSTcICnmdwqasRAMtuhTtmaMjVzxgbAbEQO6Z2canq0S89
 5Cuus4Ah74WJaSVL07FActKREBLLUPz0tC0g8cI6+Kpl8tDQN2DdIjjaAIPZd8Ad+B0W
 rzXRwYjDgMr2KAELXmK6EhZonw2eIaLS47/0L/qjs0QJUjvMPGe/CpOeJq5WDr8kwItH
 Zmd1Eixs8a0n0x+TX63QXKNr8G7JXZLbHSWoqjXSKN31RzlcplxGxsbewGF/gJShFkB/
 ggkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107967; x=1685699967;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=igf4zwPCPJarr0KLrzkiuupJdmLtcrvRBVl6Qse8SPE=;
 b=SEeT6+CX7yWlrleerEfkO4hhCo9iwcs9M4yNnrqQMUzHLadUU5sYVD6ZbjHkO7rLqu
 v4j3/okHRJWoU1VXXyqejWtqIuwk+X/11/+sYU7r7Tdn9yl52irRwr5eSQRC4vFqXLXG
 CvKJfWy9V9Cz9jRCcdebK0PSb1HT4bbe8nDkvntXdGELpkO3yHZa5Tycy0w1ADgOZtgy
 fawPBj9ef6t5VTIK3BkVQVB4yZFchSywpxjT288NB5/EbBWfO4q6y2+UFcu+8/S9wia7
 Nm7QvNzyI3ui6mNZM0tzGmeJDyjefaBL1UlRf0Gpb+rP+mAYxT3JOWqb1s7SbXS4EoHa
 t+jg==
X-Gm-Message-State: AC+VfDzTSdafjoLVga97tbNl7rLGb/DLCO/MkBDX9zi+SBvX90gOPlYe
 McTEXGUVVRVAp5JOAUMCY0v1Hi0ucPtWt73WASgNVA==
X-Google-Smtp-Source: ACHHUZ7oM3M/vzX2zova2p6h/yaz7w2nLr1IsFewSmrHesRjLB1vMTjPCmRHUCVaivClNh4hPr3a3Q==
X-Received: by 2002:a05:600c:ac8:b0:3f1:819d:d050 with SMTP id
 c8-20020a05600c0ac800b003f1819dd050mr13526510wmr.37.1683107966973; 
 Wed, 03 May 2023 02:59:26 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003f1978bbcd6sm44674348wmo.3.2023.05.03.02.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:59:26 -0700 (PDT)
Message-ID: <d0fa3739-5baf-37dc-299b-8a7023f13fea@linaro.org>
Date: Wed, 3 May 2023 10:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/10] trace: remove control-vcpu.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:17, Alex Bennée wrote:
> Now we no longer have vcpu controlled trace events we can excise the
> code that allows us to query its status.
> 
> Message-Id:<20230420150009.1675181-8-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   trace/control-vcpu.h          | 47 -----------------------------------
>   trace/qmp.c                   |  2 +-
>   scripts/tracetool/format/h.py |  5 +---
>   3 files changed, 2 insertions(+), 52 deletions(-)
>   delete mode 100644 trace/control-vcpu.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

