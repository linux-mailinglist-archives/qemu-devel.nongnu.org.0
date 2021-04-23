Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA463698A4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:47:18 +0200 (CEST)
Received: from localhost ([::1]:46152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZztd-00049t-Es
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzs0-0003U2-Bx
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:45:36 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzrx-0000ct-Pd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:45:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id h8so18203314edb.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sewNWV1TNP6wUtwXwXG9cYSJCjsfFUZRNXFfYVZ8B/w=;
 b=QI8bfUJBVCTdAk212Y+edXdzvEO0gfq8BBw5YWH7gfeiC1zQYJr4VWrtgix0qps81F
 g2RCpLAafWPARb543O6BD7MH5dkA1RbddhkOp/liyOSPxR4lgSkoiyMUogUfnCZ5M4ZM
 IZ+mo+RSzSNw7RCUDEct87eksRP+WgR0Us3cgJJzjV15yAWBDJI2ux2Q4YyJ1E9iudCm
 YKXF8fMr5rsxIDSLU5zswaNc3zExxB6OfkXNz4sdP/6AFKGoeJcAfzikKVUoDBtGtNGW
 OQYJ8s+B14Z4Kku5lzfNhn9T0cXarHKpQRH3NTaGk1kCfgBkooKF6AiM9QuW+tH7vVq8
 4E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sewNWV1TNP6wUtwXwXG9cYSJCjsfFUZRNXFfYVZ8B/w=;
 b=sZoPGG+nDjwwuRA34LuUAoOg09ab7ZK9yshTkV5aSb2eyojdZkgb6aYdCv/pcCYUWh
 HmeSAroBYzMEuAvZCIfU2OvTFCKSepjFcsdPks19NnN3jSxdFD1CGoLt4tywb2tIgqua
 dcuiZJCJxQgGIJhP5IaRQ0ct0ZS6GAnRh6nu7Cf0BRllU90uMd1rYIO+TXWEwza5KNRF
 hAiRrHxhdyiP2NPogcZcWjBuSJ6vfFWjdahB/OCv/AD8sjOevzSRfS66trTR0v7dDyrB
 koHAqnr1j7OAcJd4+OJDzi3zfS+qHxguHsLaL+eEi7qGYAw5He5nP2A40iTXcMcn4P5y
 Hrfw==
X-Gm-Message-State: AOAM532bRuci3j73O5npTGkv5TzVXyg5NdyqV/ZAQmoViYuukprIRzoS
 UVVkuyWOZpWlCRyvF8Ea7ik7jZ3UNBeDYnWIbz4/SQ==
X-Google-Smtp-Source: ABdhPJw8zKEBSuG1cNJbU9HFE64e9AQjUpfQ2cO5luXmxvyPvGMNztcu1ayIwoW+Z9BLfb9gk0UJBIpbIL8rJzX/WiU=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5807708edv.44.1619199931792; 
 Fri, 23 Apr 2021 10:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-5-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:44:36 +0100
Message-ID: <CAFEAcA_=ux_34CW6KQmCrsm+6b_+CBdzJeJKo0yamOFKy-v+fg@mail.gmail.com>
Subject: Re: [PATCH 4/4] linux-user/arm: Simplify accumulating and raising
 fpa11 exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use bit masking instead of an if tree.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 50 ++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 32 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

