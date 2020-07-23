Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D434522B537
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 19:51:36 +0200 (CEST)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyfNX-00043i-Sj
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 13:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyfML-0002qv-R6
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 13:50:21 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyfMJ-0004Ui-0O
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 13:50:21 -0400
Received: by mail-oi1-x241.google.com with SMTP id 12so5763327oir.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zkEc11aezMqEOzWHJlRsSHP3gzclzPgF5XrFNoeoog=;
 b=YzlTJ8vUEjezGUm0epnNBtW84QM3UI/0OqvJ5Zknh+AqW8qkYjbR/vaW19zjB2AgCC
 IkOA2pyRYkeNcZQhDtQ7/nX/52NB+K1AkaIuJVUewoPxcEx5hd1O++VHG7MBjYxDQiYy
 1dr3PRICt5Aw2kd/LcVNTXSUT7VQoSrpt8vQgBiX90r3yjtnZZ7SgzKdEpDxJdl6mB6Z
 QCk5RAS6THuFrT3L5MRMeDI0SF9jTWnHRo71P47WujjaQa+xSWUfHEx2ErE+c9d8owoF
 6VNP1wWHFO6bWZpZLwIvZPtzo8cLeApAMUeTJMmPCk6Av/Nuw2ODy5I/dWxkKUFHfzK0
 GYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zkEc11aezMqEOzWHJlRsSHP3gzclzPgF5XrFNoeoog=;
 b=V9zLfndpij+Fet+bxOxL3aZVS8i11SvvNHk0wMGabBokkLxf8rZGUgD4qbl+mGGawG
 Hdbu129P+9onfkeTToApcx/jh5ZWgzrAR9RYuH+9y+zK4+Ttc9UUWaUldPuPKWYwWOQB
 i9YL93ODluYPg9TGysSxzhp8/1OKroiXLD/QJoCAEhaGL7Vqd3Heqtvrqpag4MgfVXKd
 /9yC9oHs6s9DVCl2a2SaDSvO0T6mjTXVwdWjrkGUJvFfEPv8xaSDIrkandJvWkTMP8Zn
 RLvLDcVJl+bKFYqeowdSJv1vgGC6qNa4WeHw41+AyP8a8ZL66nnbP/SZY6faAhzvnqpB
 xTCQ==
X-Gm-Message-State: AOAM531g/HYkTd7Fbr+ULEU/oEk40vdDEprExk//Mnkb5b2PwC4KGf/d
 UjUYYL4bfl5FrYl8j/dKFzUN0dklJHYAIfhwWvD2bA==
X-Google-Smtp-Source: ABdhPJwMznm0gN6PNGUIpVwzhYmJL7qHImQI3Ge+3JVEEHQDYMdorTRReskR4kltzf+Gx0pERKzFrdNhMX+TZZnhi+I=
X-Received: by 2002:aca:54c9:: with SMTP id i192mr4879925oib.163.1595526617607; 
 Thu, 23 Jul 2020 10:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200622113146.33421-1-gengdongjiu@huawei.com>
In-Reply-To: <20200622113146.33421-1-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jul 2020 18:50:06 +0100
Message-ID: <CAFEAcA-NDpWCfqQybu=6svi-ZR=MBBxSKz4dRikDXwW8fftsaA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Assert that we don't run out of the preallocated
 memory
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Jun 2020 at 12:30, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> data_length is a constant value, so we use assert instead of
> condition check.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> 1. Address Peter and Michael's comments to use assert instead of if().
> https://lore.kernel.org/qemu-devel/ca79ea28-9ea9-18a5-99ad-25c3eb744721@huawei.com/

Oops, looks like we forgot about this patch -- Michael, are you
taking it through your tree or should I take it via target-arm ?

thanks
-- PMM

