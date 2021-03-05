Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D83B32ECF6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:19:59 +0100 (CET)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBJ8-0006kV-4f
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBHN-0006HF-Oz
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:18:09 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBHM-0001Ae-3c
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:18:09 -0500
Received: by mail-ej1-x630.google.com with SMTP id mj10so3768057ejb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4rQ5zITk7EeTwxjKItCPsz5IQLQwfiJf4FJ7rq/MPU=;
 b=nHSF1dRWT6Mb+dGpkx4lO0PM2S1RtB94Kqo2Q6pQrbbInqhyskcvCC/TQZngLvplme
 iipqn6NH5W5p6IFafLJcYKrSvmyGbJqhKHVz4xofhddOpoMBjObJNkQyf4ZtDbN35N1z
 Moao8rnhmaIIUGWJFp6YdhtLbrOQoYCu5EwCv/T+YAzD3/9GW0pr1m2iMzx/v64d0wBu
 s26iysKrdBUVVRTs12MEip//3+8+sOtEsjRSefxu68FSJh6Qi7CZYIOFCN6bfwvfV1Ty
 hUfL4gMivdfxh45BN75aPyHFpNuBrHWE6Vj21oYc/aHunn6KDbrG8YuiVewNb57NVeqd
 qReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4rQ5zITk7EeTwxjKItCPsz5IQLQwfiJf4FJ7rq/MPU=;
 b=gcjC6HiI4IlGmwZINxNmUlqdwEJxlye6iNDx2COodAZj+E+Y9WEo/6l/f0mZrr0oId
 yU+eMUHVWH55TJn39K7n5MLtE6rkZZLmLjvNPJj7K47Z78QynqsDe/Jt46c4P83Kxt1F
 5D5w+YmpvsnC59Nu90lMpINxB0Ol/nKDLOsCxBD6s4M/ZCry0v+PcTzQeXbbz/tAzYN2
 gCHq+6LhgbAJ3NpLbSR/DKB8pU+GfzYABbxMEndn9hK4nzbDLhPaVylAfKbZ84dyFJMD
 6pDnknoHB4/zn3ridWovh2XGEGQoNvqcqO2xwdY57eZuIuQOvHmZeEkDbTtS1okO5JW8
 XOlg==
X-Gm-Message-State: AOAM531DdjnvJxPtd5b4gPmp6umJIwAI76km+VHaRGrVM/wovXFJq1CA
 XfQRFIHFoKWSE48wFjsrgxs4/dPF3QRFdqKoQLMSgw==
X-Google-Smtp-Source: ABdhPJxI8sjeE6dcaeG4uJDY1kFVftJrdF+avc0OqDrv+Pm1zqDj8R+3XJya8wMDPphq1SG7jY5C+qbhqc3sKKUwBAc=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2479588ejb.56.1614953886352; 
 Fri, 05 Mar 2021 06:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-3-richard.henderson@linaro.org>
In-Reply-To: <20210302175741.1079851-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:17:50 +0000
Message-ID: <CAFEAcA-YocOs4+Wk+fLhpdFxqNZSYSVPDYQQHjAa3jSqGY--AQ@mail.gmail.com>
Subject: Re: [PATCH 02/27] tcg/aarch64: Fix I3617_CMLE0
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021 at 18:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fix a typo in the encodeing of the cmle (zero) instruction.
>
> Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index ec0a86d9d8..c8e41dd638 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -561,7 +561,7 @@ typedef enum {
>      I3617_CMEQ0     = 0x0e209800,
>      I3617_CMLT0     = 0x0e20a800,
>      I3617_CMGE0     = 0x2e208800,
> -    I3617_CMLE0     = 0x2e20a800,
> +    I3617_CMLE0     = 0x2e209800,
>      I3617_NOT       = 0x2e205800,
>      I3617_ABS       = 0x0e20b800,
>      I3617_NEG       = 0x2e20b800,
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

