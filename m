Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240A3F29F6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:14:21 +0200 (CEST)
Received: from localhost ([::1]:41556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1XY-0007cw-6Y
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1WV-0006tt-PP
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:13:15 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1WU-0007cU-A9
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:13:15 -0400
Received: by mail-ed1-x531.google.com with SMTP id i6so13266995edu.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zg7Q3fOW/IUckOX/x10YXauV5v+FTy6TynVCMYXf3FY=;
 b=dk+hojGtyVaqqdhUk8Fjf6P3VL7og6nPkCqtTNZ5KJ/alAmsp3kdpoG8exrg8n5mZb
 lPaZv8KvI+NhJfIip8Il5BLH0kfUdLQEnkLaTf5IefiywyZE4Hg067DzmM+3GwVpudOQ
 Q0pQ5k6larlj/UVWnhCUEYw/6oeIIpp0LxMZZ9NNNXifIRYQJLn9q3yAWGxkbHFVADu4
 mdhvFH705IE81BE/rrXF1C8HPpysHn8+F3bM2hNag0WgRSDmEuAFygMr1u6i0bxpviNf
 RRzuZ3kE4Kh26PZhtsgvjb+RvfAExSSYYY/RnQ9O5E3FhXXNYV34//906CdmivxgNZ3x
 hgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zg7Q3fOW/IUckOX/x10YXauV5v+FTy6TynVCMYXf3FY=;
 b=fgI3zvqMae1lVcRM6uukIXVZVC2cLcmB4e9wuJzB40eJjOb1JI0sxhwevMku/nbyEf
 k45hoBypHDRfAGAK28omXwO/4Df8RzIbdH2SjLwbOf0Wq+803h24eASVjbH3KQcbln/Y
 Hh7vA7k9GoTaOPXBfwtkpQs0vRTTPcBjOJafglyNii5z7TuOzvDbGRsLgaG5x80db4WO
 fjv3Uk0V60Wdisxk1JpCWJthongL8aFtOlc46dsx/pDgKvWd1MfgMCUsBfcxZLMEH2XL
 tKcvSLTJ2FyBQr3iFHPAPSOOvrMz8cFS+Mo/QZhg466GzAWNYyh+1+PyDlfUWnDEA1Kz
 ugNw==
X-Gm-Message-State: AOAM530LWCrqv/7ZZQAAHSyj9qZYdbAHOgNrUSyEh24rBf/Ny3p10No/
 BPS2YIxmOnr4uWJc6cHOJiwWPCq4hXD4mZi7hPJex5zzo9I=
X-Google-Smtp-Source: ABdhPJxQl/RrcncHZ089PqyNPAPz58qbhI6EIvTD4LeWeFkotnsNthzKa/OV16Yan7aIp3NUImRzOPdB/hgSetW6iaU=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr21430111edc.204.1629454392433; 
 Fri, 20 Aug 2021 03:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-63-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-63-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:12:26 +0100
Message-ID: <CAFEAcA8mxrK=VV0KdABaRmBnQMtxGyF4MNvCp70p=BE4Cp3FFQ@mail.gmail.com>
Subject: Re: [PATCH v3 62/66] tcg/s390: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Wed, 18 Aug 2021 at 20:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390/tcg-target.h     |  2 --
>  tcg/s390/tcg-target.c.inc | 63 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 61 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

