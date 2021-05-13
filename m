Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588F37F5E4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:50:06 +0200 (CEST)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8ur-00027c-3E
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ct-0003UV-BW
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:31:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8cn-0001wG-Gc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:31:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id s6so30366636edu.10
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rLDI1LGXpBqOaDRoG8Hza71T/rZN6gaFGuVEqDytGh8=;
 b=g65vPxIUKR9OZVQ+K8RNb4EaqP4/IiU9k+ZFHaBFyBvZlxdkaZk1VqaYdmq08C8Awh
 iWduni8sv5E7TTM0ih50+PCBwzyrPPbVrwVQ7S6chk5/ermUhZwKQ+VhhQhzcgEkHvV0
 xQc1DhqTUc3m/Igyo1sRICb3p0QvjLcaJe7X86Jgq+fewI4wl0We0bjGS166A6yhr9gN
 okIqE3MlZpIM6jYH19gvhbMVVjYshV0fLa4X73Dubb88i+6r3rutWCxbG90TdC2BH2y3
 U+DXKhxk1wgY00sP3qUtlzDtvarAiTj3xsA2S1Fi1VzpVzuQy4RzJkEsIoPBMqHq17DI
 RFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLDI1LGXpBqOaDRoG8Hza71T/rZN6gaFGuVEqDytGh8=;
 b=U19DmqULD+WBQdwK5dFU8wmXAfuiiRiKSme9Td6Nl2CpmhwiXTTKembqOeE+cMkTgD
 fBlvg2WTONUiVQsybkr257YLmxlXPbwHUQWh2VDmHdmYWtS9D9psJ0iyI4cCn8lZHvm1
 A8jAAzFnhzL0EpRhkpnllGFX9pYPtC5S4hBoF527oK1HvDvP5beHk+yjb6xpqgnz5UdH
 T5H3YOLkuyNMFjlPdM+haAuHfGp4kJ31SPiOX97y8lBak42c+qqswOhPUcYG1NVTzOX4
 q/xHKfOJl50sFryM781XcpUfC4i7z8ufIH9u7JAuDzoAMza7BVDMYqpBv9AalpyJvBOA
 3gNA==
X-Gm-Message-State: AOAM533WqqZXMLh6YAYi1YG2tjwPStr+6uv7cPWiLtW5/m+b+3IflIdT
 NsuTYPQzdQQWWkwA1uzyb7XJOg6ibWgCcK+/Qq115Q==
X-Google-Smtp-Source: ABdhPJyw6y2UDbFkpLrFjCGXVGFEvkjQ+wLCPQOtmjJzHvynJOWjMYobrDwtpNIzdobmtsC68jdFcfl5DUsdEm/cFu0=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr48790567edd.251.1620901883546; 
 Thu, 13 May 2021 03:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-45-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:31:12 +0100
Message-ID: <CAFEAcA-1sFDwB8H+gRpkDzJNnKcLQ0ywAVvT-ed0SCYHO9n11w@mail.gmail.com>
Subject: Re: [PATCH v6 44/82] target/arm: Implement SVE2 scatter store insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
> store insns.
>
> 64-bit
> * STNT1B (vector plus scalar)
> * STNT1H (vector plus scalar)
> * STNT1W (vector plus scalar)
> * STNT1D (vector plus scalar)
>
> 32-bit
> * STNT1B (vector plus scalar)
> * STNT1H (vector plus scalar)
> * STNT1W (vector plus scalar)
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

