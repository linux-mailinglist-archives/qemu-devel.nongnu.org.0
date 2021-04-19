Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCB3648EB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:17:08 +0200 (CEST)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXWG-00023F-0N
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXPo-0002Gj-So
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:10:29 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXPj-0006fd-Qw
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:10:28 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so54041166ejc.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSJ2TLskuUFwZbWmYxchmTIoDhwxzt2StyCFqzxmeQk=;
 b=PSqrGWzNIv2B5+czkE3N0MlBZu9RMZOvem7vW8Kt2vDcTSphe7zttQKN4Otmr5y4gq
 yRTyy6jkblLDRt0mRyKAPi8sxScHCZRP1iIc/ynPYiTbCh7RG0dCgY5hc5YorJn8x/jv
 xIMusEpRRILQIljG4qvDWAYm2p0DOWH1haK8jhiJOIY6y7CaTjPEJO/+q3HcB80RW8Ci
 wgTuDTn9+1/TI4nDbKsrHmzX1IA0jgUKPUvwFb11mnpEZVGqctEwPMVNzDC9JakQvXZC
 Qp5SrLyHZN9m0ornbHN6XCHb+vNgi7K3tJJnhr0z0ke3LDgyZEm+0TK6bIn5WkWY7znB
 PB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSJ2TLskuUFwZbWmYxchmTIoDhwxzt2StyCFqzxmeQk=;
 b=St7vc/JBU4O1OJAqfMkeENw+Cb9704MdHvyNT7Rab/9XCrL1uZtbCpKyL77kbsFwEq
 OxYLN5iah4RWLib4NnNA8GoTnFBTfSjpAjZzROPTKASNaJSefTUB4ML6BiE/GtuwFTlJ
 17OlPbyWs7use0CETiAHKv5g15IsSGGLCd0qiUCettRsSmSNcJ5ntJhL10B0wulEGILl
 YIjNJzgX9t6GcooI/Fp27d+XJrEjB1lOo4nicLOTk04f+NJwHo4k6JamO4+GSlT+r4Ks
 EJ6DLc0NNNpvuY/9K4/dMvUHv4Mq++7bemLAQKeNhNSTGQB2IV1aobiTbRonXmv1sziV
 jrYA==
X-Gm-Message-State: AOAM530dPjStEXBj5m8MSeSJDNIynWutDlEoPizOSEQu85IzXAquzvcv
 lIRkdzxgnASmapit1S6v0YY5NAkSrlwTpi6AOoSIYg==
X-Google-Smtp-Source: ABdhPJyuJ1bH0mmrptkBEMwtnbyVJTO1Euj9288efEEUbnHxT7nH90P4j90lO5y23nxczTemKDWxY2/9O00IY+KoeBs=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr23723490eje.250.1618852222452; 
 Mon, 19 Apr 2021 10:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-22-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:09:30 +0100
Message-ID: <CAFEAcA80T3e4hOWvR+8QoNvtrWv+tgHsds=2idbLD1DfQ7fVLQ@mail.gmail.com>
Subject: Re: [PATCH v4 21/30] target/arm: Enforce alignment for VLDn (all
 lanes)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Fri, 16 Apr 2021 at 20:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix alignment for n in {2, 4}.
> ---
>  target/arm/translate.h          |  1 +
>  target/arm/translate.c          | 15 +++++++++++++
>  target/arm/translate-neon.c.inc | 37 +++++++++++++++++++++++++--------
>  3 files changed, 44 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

