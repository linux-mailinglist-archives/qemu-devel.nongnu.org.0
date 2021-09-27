Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A92419168
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:17:34 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUmlR-00019L-5W
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmjP-0008I5-Vp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:15:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmjN-0006Tg-T9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:15:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id x20so5727171wrg.10
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XIUwrOMRtuq2HjpYrAvMSG7B5JaPwc4NjYIYoTpHMYc=;
 b=TG181ztWWbUaEq58V2vaz38x44sNg5ixx4s1fZyEDksU/hMdwD7vPJifueaobbYcau
 +G2URCv0sYvS3tW25TQVYb6ePD3xkm6YyKtR8g4NIzA7FySIY3q2CEbvBFlVKlvPzwzx
 k7EN0xGraumP2bCSgbqUYrTUEdFIs0UpjmSfsuV+4wtMDQzVaGAM1uwqCx+jW+SDQ4nU
 TU6E0Gmjfj4/Q9u5SXVqkV0jyFAoYEs9+lAo/aHVIRmooURKjNGHnJFRI6J0SJup+w0m
 L08EVhqyiojVV0UChPVFfukJGfJHTdntE8iptBghg5t8QMnpc9Ygtlun8WpExNtN/VZ3
 ObGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XIUwrOMRtuq2HjpYrAvMSG7B5JaPwc4NjYIYoTpHMYc=;
 b=ZsdOQ4f7oI9zEiacP5Xy+zVsU6AARoqS3nXQI9D76Sw4KN+MI8gbQ7n51FxOkDDA3C
 +S0bcZYC8//Uzuo3y7B+0ykWUWvSL/paSaai2f4za8xudPGRtu1OCtuXHz/GMFDGeWuC
 OX2jIW90zRFWD4BIPA5MKZf4yk/AiQPMM0bdQDpDSZNryH9/wRyRwXALlD3D9HrdmsQE
 9YgoHkU3ILd6Y29vb2QgSIygONKbx/YqxEZyBuLr4I4VSOeWNrVxqibBL7OyBub+radp
 kGGCq+Ygb5bBO0bHmH55OO/LLDPJQK1CPgWnTbk6Nvl+A8sPHOIavzOEEcGgsnkGsmJx
 Zecw==
X-Gm-Message-State: AOAM530Fn0VWWhH9tn6yh75oktsddrSZRR9/m+dCDTQmj7QKGLLMhXD5
 xFAQlz6rPHJ/6tcxOIpSlcsh5Hig3y1KGDK/XUsrRA==
X-Google-Smtp-Source: ABdhPJzuVPY2YPjPKa9USN//6Gv8405ac1Hfl6pcWvCgXkq5VKugcxSkGVJR7yV0lvXIInSfDXNMmleJ5EsQH50auI8=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27256317wro.302.1632734124306; 
 Mon, 27 Sep 2021 02:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
In-Reply-To: <20210926220103.1721355-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 10:14:31 +0100
Message-ID: <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Reported-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 03695493408..a7607e1c884 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_host.has_key('CONFIG_BSD')
> +  subdir_done()
> +endif
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',


So, what's the reason for this change? The commit messages and
the cover letter don't really explain it. Is this fixing a bug
(if so what?), a precaution to avoid possible future bugs,
fixing a performance issue with how long meson takes to run (if
so, how much effect does this have), or something else?

thanks
-- PMM

