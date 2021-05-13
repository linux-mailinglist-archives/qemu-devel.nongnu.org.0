Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955137F959
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:06:37 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBz2-0005bc-Eb
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBwM-0003fQ-1r
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:03:53 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBwJ-0003iL-FL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:03:49 -0400
Received: by mail-ed1-x533.google.com with SMTP id di13so31114965edb.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FNQjPOrxZ/jIIjUZAHJPYqYoWX4k4US3+xqwV5zhqZk=;
 b=YgoHetklZWys3zj27C+p+h9tiqB7QEu7l0IRmzAQzbswtn+d1tuIunb1/cFrekBQzp
 rIZ6QXEfqje5alCyQBBiGYPZzl8MHUCS33WPHnDu+OM7cRRLQe6em5zcU5G+WMwEoj73
 Yg6mEZG5ZhoKTmPDnJWBxt0D47MgxIMRy2jfJ7A5TOEBmT6hpRbiwYF6BI1AoIbfALzB
 Da1bjNLG2aDj2yjhNTgzmqeBwXLHBknZswAiJzeIdgLAKXmYF9PIgJQ2rstiwDo44ziR
 gHjA+DVsTBY+KB4u0iKuq/H5y7n26/SDrtLJE1CZpO2dJMlGGNP/UrA4By6mRJ3MsIkk
 /jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FNQjPOrxZ/jIIjUZAHJPYqYoWX4k4US3+xqwV5zhqZk=;
 b=AZvTGlFLJsLL3SlrFnECY7WbNGVVfY9MO9wJjvII+pM9LAL198tw6qBpxDJrqYXYL4
 0M49ebtMD9r5L9Wp4mkbcYM9+c0VgnMDVr0SbnSBEGqx9092XH01UoRxKYBmwY0oLQBa
 WGdtQqInm/TdEdp2XJd6HdxVMbsUH+EcgTJCkPP8E+Lzx0YLu3mHf+EVgB1PilioooNe
 GMTLx0crvCZm7vT69DUi6CtqfwAp5y65ZsTVsUMDbpb/HBjHBepa32Gh4aLMjhXoz/b2
 7glaQD/ykPWA7KQiu/GoJ1t0Zo6A+Ll2s2H5GgL8Ato4sLeBFzDJ0K/Ma693VOFoGPn8
 zpvw==
X-Gm-Message-State: AOAM531vLnINCKQutWQFpS5cP/EIGmj91vhy4ax3Rvl98wW1Nx+bXcaL
 S/UoI4tAESm/r+wgIXU8V9gl8dZ1zR8jTFTftX1cgQ==
X-Google-Smtp-Source: ABdhPJzJnBic+wJHbePGIyZ4x/zp5OvJTQSEBcMcIczyufQGdQJ46eb3klkqpEGhX6Tu3kS6L2f24n68qP+sJS33lqs=
X-Received: by 2002:a05:6402:1a58:: with SMTP id
 bf24mr10986678edb.146.1620914625953; 
 Thu, 13 May 2021 07:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-67-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:03:34 +0100
Message-ID: <CAFEAcA89U5tdv2+zfitvXYi0yRMZ+BW03d3EOPMFV21bq23UYQ@mail.gmail.com>
Subject: Re: [PATCH v6 66/82] target/arm: Implement SVE2 FCVTLT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      |  2 ++
>  target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  4 files changed, 46 insertions(+)


> +DO_FCVTLT(sve2_fcvtlt_hs, uint32_t, uint16_t, H1_4, H1_2, sve_f16_to_f32)
> +DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t, H1_4, H1_2, float32_to_float64)

Again, I suspect one of these has the wrong H macros.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

