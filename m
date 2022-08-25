Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C971D5A1D62
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:54:30 +0200 (CEST)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMg9-0007vH-Ls
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMer-0006ZR-09
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:53:09 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMep-0000v6-EJ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:53:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so6510007pjn.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 16:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=/A5RtfIm+z2CC2yeEbOn3ia7S7vKnBSmLNyBnZKfpXg=;
 b=zaTg7WTlN3Ddr7vd16zsuFpy7YOqRdcHIvpZPVIjs6Vv97S8/awfDBeDnM2H1KhN9K
 /HwEi3bS8j8ce7aXnwWf7sQVtGTZ/AEqbFY/18CPF781X/e+jntlB706buxTEw01ccWr
 82yPw70fISpJiXtU9FE0rSQ/veKADIrIKohROwk0I9blxepzyleRrd8wVuXir49WlYTu
 htJyR1Kptj5MtAqcY/UUSY6hS/d2HihZKPq5Aug3UU8hHTrc88VNVDmnMm65m4XT1xtn
 4U9eoXP5q7ukb12YSO2U1XheFrkJPIaKupARGA4f60fV9H8JjGwdm9d5QtVQoFYjarfK
 YVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/A5RtfIm+z2CC2yeEbOn3ia7S7vKnBSmLNyBnZKfpXg=;
 b=DY1RMPMeIT/LWpsrNgY1CAoXbZByO1YNza1FT7nRBAWk+Q3LgNP7sXTdoHZAVvRemB
 85La5V769dm+/XFmBs+hj1QLQAJIbxEkKlXN6BM2RtbMl5PuQKWgIVXRMy7QbUgxfuQ8
 WTCRvmcIubc9vv5Ua+dF8+V3WuqG9L5NaQ+Y9mdPV7nivtEj6Y5d8WF2e0vmIODuhU0p
 ujZi645e/u56wPTfEvR7FBEuoRFjQ4jh1uSAF2WdW1y5cqpctYZ8FvdcEGGPccio3693
 pleNAB6wqEUh6cUxWKqmFXlPS6P9zwECv2P5iHutkwjM7N+pf84xzF2QsZLirFMk/csl
 Q0HQ==
X-Gm-Message-State: ACgBeo2u2oK6OglixAJIasIRPdezCY1dLI6LaldYY3rJgWvY/hRa4mKb
 r9mmocF6ajm09Knyw1eaWs7w6Q==
X-Google-Smtp-Source: AA6agR7TleyqBPUBgdw1nPM7iuLsMLOkafenZhVdfhJtfIB81Bzd6vHRZzEPl4XTYB+vlqTlzHxMGQ==
X-Received: by 2002:a17:902:bb94:b0:172:8fd9:7438 with SMTP id
 m20-20020a170902bb9400b001728fd97438mr1222904pls.174.1661471585844; 
 Thu, 25 Aug 2022 16:53:05 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a17090a454800b001f559e00473sm292822pjm.43.2022.08.25.16.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 16:53:05 -0700 (PDT)
Message-ID: <0ca92e68-a494-c643-0773-829d850cc625@linaro.org>
Date: Thu, 25 Aug 2022 16:53:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/18] i386: Rewrite vector shift helper
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 8/25/22 15:13, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Rewrite the vector shift helpers in preperation for AVX support (3 operand
> form and 256 bit vectors).
> 
> For now keep the existing two operand interface.
> 
> No functional changes to existing helpers.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-11-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 221 ++++++++++++++++++------------------------
>   1 file changed, 96 insertions(+), 125 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

