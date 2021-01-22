Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414B301023
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:40:45 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l356i-0007GZ-C4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l355q-0006qQ-Jd
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:39:50 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l355o-0006fY-V5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:39:50 -0500
Received: by mail-ej1-x632.google.com with SMTP id w1so9852210ejf.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1r3++19gyMx+HSz5ker63OzMgTo0Hg1xSpYT7BXAMms=;
 b=BB0ArbeaDIsRCe5mJDMH8d977b+CS0F0OEaw3KFekF3yKTvTwfZ895pTJhn3Hh04rn
 WQjkOadrapbks0PXJ2Ks+yv9FNZupeIHnNS6L0dakJq/D2pQ0r5QtRsdVJLITsc2GVrC
 hma338e7iFbkBMtrJQcIk2FV+W7NpYmHDS1jAgHJsFZF3hZLWJWYSA6AQBdAqo1JsTKo
 W6DVx5Lm1/2xcBTcXuAULnCvhXdzODKkwrFGceRhWrBYI7MWu0/NQuPCLZr78bU32qg4
 vh4JunP4+wX3lQjmPZ0GP8s/uhqG+LI5/vjUZ2ir0mXbNH75g+hwe6vrnBVyg0vn7L1z
 dTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1r3++19gyMx+HSz5ker63OzMgTo0Hg1xSpYT7BXAMms=;
 b=C0PXbmB5dBeUZDUOIz7UqmdJq7FLQY0+lwZR7fq4Xo+MBngVehARTbqwGkWksTCJj3
 sedhrVjNkVWC7/ZkOUUOKLVpZvD/JvpIQ39GM1Ait9I/nFGSAAfwWVNExbaAMTk0uHSA
 aoOb4EoJlQ8ZnN1kTRM2zSfe4vNR9+6NVWT3Jfe71FJKu7uuVTCRR207Jx+euz24wbr3
 TSQMI/1BYYDmEBPjqEH8jW3Lo+Rx8n0hkzZ70pTWBn5lUxvH0AxuhPKK/ZKIG5oEWv4h
 AJ6aiiWwwVAK4lKybym2rb/XKKpvG6/ICFHffYiia2TD9tOnKZsRpHbCGyzfGoQHYyT1
 4W5Q==
X-Gm-Message-State: AOAM530m3F+SlXLSKH/TcKiD8goRVKS44238lds9a3+vuaAW04hUCmQS
 SjMyywI+PFwRuC04PWw8q38HFAVdSDOIlkQQ8N3vfA==
X-Google-Smtp-Source: ABdhPJyn3sL3eEzYJwwQn7X7JVFZPXjI+l+JZOVp5zVR5irUxNMj1ZoRXhJXgfzc8v/whCSmibtO7dZixMxicGnnZ9Y=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr4452557ejf.85.1611355187505; 
 Fri, 22 Jan 2021 14:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-12-j@getutm.app>
In-Reply-To: <20210122201113.63788-12-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 22:39:36 +0000
Message-ID: <CAFEAcA-5v2kkFQ07S553XKbpESTFkgj7Fak9nzZ_w93YzLPYpg@mail.gmail.com>
Subject: Re: [PATCH v7 11/11] darwin: remove 64-bit build detection on 32-bit
 OS
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Fri, 22 Jan 2021 at 20:16, Joelle van Dyne <j@getutm.app> wrote:
>
> A workaround added in early days of 64-bit OSX forced x86_64 if the
> host machine had 64-bit support. This creates issues when cross-
> compiling for ARM64. Additionally, the user can always use --cpu=* to
> manually set the host CPU and therefore this workaround should be
> removed.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/configure b/configure
> index fb671258e6..c7fbda22b9 100755
> --- a/configure
> +++ b/configure
> @@ -626,13 +626,6 @@ fi
>  # the correct CPU with the --cpu option.
>  case $targetos in
>  Darwin)
> -  # on Leopard most of the system is 32-bit, so we have to ask the kernel if we can
> -  # run 64-bit userspace code.
> -  # If the user didn't specify a CPU explicitly and the kernel says this is
> -  # 64 bit hw, then assume x86_64. Otherwise fall through to the usual detection code.
> -  if test -z "$cpu" && test "$(sysctl -n hw.optional.x86_64)" = "1"; then
> -    cpu="x86_64"
> -  fi
>    HOST_DSOSUF=".dylib"
>    ;;
>  SunOS)

I was just thinking the other day that we could remove this hack...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

