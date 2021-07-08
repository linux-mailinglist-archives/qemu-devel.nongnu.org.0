Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC883BFA0B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:26:11 +0200 (CEST)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T6Y-00035C-8S
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T3S-0000H1-5c
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:22:58 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T3P-0007aE-HI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:22:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id o5so9290866ejy.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C4TmXYgfGILjaBmMroUS7lOu3VF13a0PHux7yTPtOY8=;
 b=hAgdidTyoDrIvmKUXVpsjvS78gPYJIkgXmqdT9W1Q+Di/g/a552snAARvOcqi8Ryxs
 PxRwFHizjpWt6+p75gKs7BI54zbQgK91Ub/cSD8DcJc+Og0sGSJNIWcuEFlYOe7YQvLw
 24wGObzsQ7GqqQrxFpiEsqamR47Z+cTw0GCPrzD3uf0Z1nhU+jgt98y2T156W1hlDYR5
 NE8/9/dugm2bqjxtLaIQbBR6skb0VlKqHzx71C4wf/DaqMS7Fli+86giXhT3sgn5MjL6
 RX29DS5Eb15SOuem1Yh37CKCN/T98wnZg2ovT/4PRTSfHO1FDCRHKzAqodB1Y3hwjRFJ
 SGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C4TmXYgfGILjaBmMroUS7lOu3VF13a0PHux7yTPtOY8=;
 b=garBwJTWNMQmBx5HtxirDCYeWHen1di0NXwDjSt87mM+KEUdSOM5DioXSyYzffHLWC
 QP5DfZBGEOUPsyaS+G1w57qEukVPZV4pwTQpfuFgRN9mNqfkc7y3LOJBgvUbxxC0jKoB
 BnBAOwU9pWC24ilfSj08WIgvcf2rbpHtlmTfWOgBEaybYGOflF6orSDr13m2P0a4sH83
 14K2bs4hhnTaPxElEsEW3ckrqK7bXeZakwPJloiUtd2nocciJoDa9pkO8BV22kj7B5dd
 /dCXpuaZL3wW57Wwqp8sDpQHqSTb9O5/kxbNm5xdOKRMItG24L5WzTUfpNhhiXXtE9vM
 llmg==
X-Gm-Message-State: AOAM533Qbo0TYKIYp741dYUVGjqi9cMECT0hOgqR6mx59vlP61tVVkEB
 1Tio2OX+9/5ToiVDpXwRlZk2JVUB+5YarBxu4V1aZw==
X-Google-Smtp-Source: ABdhPJySyzsFDIoY7zfyVuN/C8zmlr6epMF+BnQmMbeZrmlNAh2XxSHpigZWwW9qiYNl1uMMHJaGo/DiYkVxXD7JzlQ=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr9405479ejb.482.1625746973204; 
 Thu, 08 Jul 2021 05:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-14-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:22:14 +0100
Message-ID: <CAFEAcA_Hh1oZ-ukGT+-yN5M2wnmq4b98ocghWqPCCbXf4JuOQQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/28] target/m68k: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Acked-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

