Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A33F1D52
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:51:09 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkJx-0006Gy-2e
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkIw-0004tB-4D
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:50:06 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkIu-0007lq-Io
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:50:05 -0400
Received: by mail-ej1-x633.google.com with SMTP id qk33so13800891ejc.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5I0zrfj8GUgu8d8PpuwQI/q1pwsOjpyrWK0zwiRjo8=;
 b=fdRpdJlhUaHGXHSbwBFkh/2RPp5jVrIdq9Q0dML02s36kuw0DGmnrdqUik46YsP8wv
 jbJ48OfqMC1yPr8kg5zW9M1UNmzzXoKVUNdRdGuGU4wqcSx3Oqd93O5nM+Y+6YvaI4JJ
 kGxJyNrJWr08Y7eb9xRF+6UXqFiynXsnxBjqokuJoJkovJbWB8Tewu2SkGPNJAHfvdBr
 AThvwIEJ8oo6oyQ2Js3fwlN9oFErYLQP7CrTqEylT5iwX+G8+vUsW6T7/A6Lgc4DiSOG
 yCbBX2vOUjAGMOZm2QoHyc1959WchLZRz1qbJWiDGKKErNu/wlJxep/wFOT2pAsUtHAs
 dNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5I0zrfj8GUgu8d8PpuwQI/q1pwsOjpyrWK0zwiRjo8=;
 b=oejqUM150+oTrT0ZkckucgpHB9kgh18juk9eke+wx9atqJB1dZLUYhoo7lxzrOsxHC
 s1zEqnitI0OveTIhMBgJlAbVlJWpZLwkoWQfTyyhZ/u7k3ENCv3tGpIFVBAeyhH6RzAe
 U5BOJKZzT+mHM1Msb60QLVCux3QtitXIt2gM5gyNSP9DzqTUss9C8//MKyKmgZsH7UMC
 0JS7FofWElZ1Dz0G25XAsRbIXlVt5vMJHd+PoWCsQ3V/BrtMSUwdQfUZ7Lsb8QLPSsfE
 04Z4aDtJvTffaPN41x7qbmEkNiL99+kHJlbHX4C1yZUEq/HlOnd0O5+KEybNIV6QrJgf
 rcvg==
X-Gm-Message-State: AOAM5306kvXU0i7Vq3o7u0mQbchvAfuu1lZ/VzFczIT63t2SDlF9HcqY
 qmyytbtZeOdJjVIPZkYXt04XTSUyhky3d0dwGYafqeoTNgM=
X-Google-Smtp-Source: ABdhPJzUmlUAfpphXjGdEaaRnTqIcMcRRku3Ad2ENtIhF/D8NlO+jlWNBYVo8F3E3MV0RhLhwPOivrdPNqYHJL8hkeM=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr16592736ejf.85.1629388203144; 
 Thu, 19 Aug 2021 08:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-27-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:49:17 +0100
Message-ID: <CAFEAcA9zto133FEz_pWuYUH2z1obhtoyizwN_T2Z0nj1EfwqEQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/66] trace/mem: Pass MemOpIdx to trace_mem_get_info
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We (will) often have the complete MemOpIdx handy, so use that.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

