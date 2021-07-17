Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF53CC4F7
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:43:55 +0200 (CEST)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oLy-0004KG-9i
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oJz-0002b0-M3
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:41:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oJx-0001yH-7Y
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:41:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id hc15so20402324ejc.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IaJi1UpStyRCSpJijsubK8zV5JE7Lu8XTw+O9Glfp34=;
 b=tG9CXcfYlw4OoJ3gG8jGmcBgy1lRc0ALgWuVRBeWhDC0V+1OwowpC1JEvOJ7mfkoMI
 C6Yox61f7K4uz7QdyDx+s1Vs+DIVyYzohS/912FT47e13/ioUbjXE+HIESBF0rVdP4Vw
 W2z00lbYCalzpg4LxD3MIgqkBCEogJoAJCUue27xVr0+gZaQW9VbrF4CFTncqbYUwikj
 l+gciOfEE//RUG/w+lUWN7U26fd0mgS3arLA8pksKii5V4jOvxGNaZMlgcsRQO/edCLG
 DK7R201xWwUv9bvaLe6BCWneGbxjP6X7jmztKJsnGnOxZVGK+pqCjOE/KrmvszHs1sHy
 0jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IaJi1UpStyRCSpJijsubK8zV5JE7Lu8XTw+O9Glfp34=;
 b=gk+mNXWyxMX6Wl0RSJmqQXv3+BWi96ZeD9jlr6OQHESO9TsqrgyJXSIs0TWs6XM271
 MvLNYLsFJi8s6jljhJbp4OC6dSwnVLAq+DdPTTwP9xUA6+VqbQ0bvypVeMQc1OzinOtt
 8KIPcM+z8VokosnubyZZw/Q3SmYVP+D3OWB2oT4IapR4WLkJWHo0i5pzAQKbJYvuAXxp
 Jvn6EgKDFJEuSq+opDLuuglpDrmya7YDQkUwjAxjwqYpOTn6j/TY+aXQhghxJV3SEG1Y
 kIVEoHO29+RIjsopKD02YokDubCNXYkLGOWol/Ov10WlU7n6sffShvKwod/7BlbxWm4U
 u8Tw==
X-Gm-Message-State: AOAM531eK0WboLXGcXkQt1OP9uI0+xUTCwo+ycd3qYkDBsHeUybT3f9B
 tL+ChQ7koBClsAfQsE43PSSGDWTFj/XUkiAZAvgU07eie4o=
X-Google-Smtp-Source: ABdhPJzqSr8it/7FB2VxfFJxz3W23o1j/ThdiNNSGuA0jgMgxgz8hFVH5BarfWi2JREhR21nCXIcLV4Iah0yplB3kGc=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr18879638ejc.56.1626543707825; 
 Sat, 17 Jul 2021 10:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-6-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:41:07 +0100
Message-ID: <CAFEAcA-_EjhjrHKf7K8ccxu=hqCqXcqtYYMs0s-VMTahZwzPuA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] accel/tcg: Handle -singlestep in curr_cflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Exchange the test in translator_use_goto_tb for CF_NO_GOTO_TB,
> and the test in tb_gen_code for setting CF_COUNT_MASK to 1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c      | 8 +++++++-
>  accel/tcg/translate-all.c | 2 +-
>  accel/tcg/translator.c    | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

