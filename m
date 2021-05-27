Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFBE392A40
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:05:53 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmBxh-0001Zg-2s
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmBwd-0000YQ-MJ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:04:47 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmBwc-0000y0-3w
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:04:47 -0400
Received: by mail-ed1-x530.google.com with SMTP id y7so8143eda.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j1K665DWN4ZiKQztmxe9q0N6SGvqyosNgZAisBnHWWA=;
 b=s+b8FjYIR92L1aTOa7NEQqanHqqphs6s4KeT9uXve/VqVfjcXGlG4qBAPvi1ylrcfG
 n2wqkugHEbS1m51HDPborn2WjbjN768DRzZbS0teNcFnwTCh+Pw3BWG9Uk25k61c62cj
 Te52VtckUdCVwjsPryoHt+hqbq7omna9S3rsmJv8kRxK6gaf1WUmqOS2CPYEwKCfWUI6
 T1cMh53mvmVPljoH82e3kmwoJCG7UN+pV/8L27KzfC3eoVCMyOKsMufE4UdPfN5LJm/o
 Je+EtEq2dW6gaziafrr/HDcwwqbRDX/A5cMrBI/O+9q+FY3u1RIVkkBGDCxPIzpXBMM/
 B+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j1K665DWN4ZiKQztmxe9q0N6SGvqyosNgZAisBnHWWA=;
 b=At7W6uNEe8zaui+8qtKU3pIPI4ZKAQFPEBHp20myrH9afdZ8VhOSNK2jyE2OTHug6L
 izFb2UL/jFgzaWTPFA1a6Yu59J4474tKc1ppuIJOLXXXDHDEro6ESdN4AUxAubifKDR2
 +Ev5nYcTX2iGPe4oLY5NTcDnPkwaMAMgfAzEisstzCjc184Cr8XnhQ0t/HTJWo4VgpQt
 /qIkjH8px4y1Ghn9Ba61JH8upB1W42Gp96QDCb4AVxU/J1KO8gVyfYlD/cL18dzHC3eS
 6a3dOaDAxAjoXPtUU8d+D64NVsnlhxcZhffYyQKY0YiadVUFIQtbrn7UKcP8e3NjgAts
 tBIg==
X-Gm-Message-State: AOAM533BVnx01hPa6pB7Cq9uuXjxVM/3FbtRjS7zwfqiOt2xVdZXBBX9
 R+0HOR1loTg25+CCazxf5lHpkNroJ6uDwd6Hs5ir/Q==
X-Google-Smtp-Source: ABdhPJyeG0MtStkQN5tq2ZmhYY1uy9ylXyOr5jfRT2Io49vHnWdIRJ7oAfHNVnxfrLTgsLl0Bwm+ZmGfNrPuR+m+M/g=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr2924467edd.251.1622106284055; 
 Thu, 27 May 2021 02:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210520051542.2378774-1-f4bug@amsat.org>
 <20210520051542.2378774-2-f4bug@amsat.org>
In-Reply-To: <20210520051542.2378774-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:04:18 +0100
Message-ID: <CAFEAcA-CUvV3G+C_cE-1sQNQAFpsv2W=VYsoufr28VB-9cRiTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/arm/boot: Abort if set_kernel_args() fails
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Thu, 20 May 2021 at 06:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If a address_space_write() call fails while calling
> set_kernel_args(), the guest kernel will boot using
> crap data. Avoid that by aborting if this ever occurs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> @@ -786,10 +811,16 @@ static void do_cpu_reset(void *opaque)
>                  cpu_set_pc(cs, info->loader_start);
>
>                  if (!have_dtb(info)) {
> +                    int err;
> +
>                      if (old_param) {
> -                        set_kernel_args_old(info, as);
> +                        err =3D set_kernel_args_old(info, as);
>                      } else {
> -                        set_kernel_args(info, as);
> +                        err =3D set_kernel_args(info, as);
> +                    }
> +                    if (err) {
> +                        error_report("could not set kernel arguments");
> +                        exit(1);
>                      }
>                  }
>              } else {

Since this is in the 'reset' method it's in theory possible that
we might end up exit()ing here in mid-run if the simulation
does a reset and the second reset fails but the one on bootup
didn't. But that seems pretty unlikely, and in any case this
code is all in the "booting Linux, but no DTB" codepath, which
is nowadays a pretty rare case.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

