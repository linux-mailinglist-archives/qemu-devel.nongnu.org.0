Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E63D6FC79F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:13:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN9J-0001LA-L4; Tue, 09 May 2023 09:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN9G-0001J5-5X
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:12:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN9E-0005gm-MM
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:12:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso10956530a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637975; x=1686229975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOiQFatwQ447mPutCz8qrRS4iLU0wpnrxUxJDkF0KiY=;
 b=pcdvjj9xvHzdDWdRkvFMrj8GLvC4t7BO2TPirIDbG8taWNBeVk7Ip7OeW/JytHxIl7
 zMT1qbmw4LMHZ2Z+l7t9qxNVjaEo2g0VWinvfVm4eA/i3sLrARjcfhhLoRkkUHwUto/4
 w1m7vkALMyBpYZFqvBHL/VPRq+CG85FWE0iOicNQgVDJmlx/4ap7gAkheHZgMyw1Q2KS
 tu2ZRVEyl7PLRp4Q0AtvcT3i5vrhMSBGuCWSkxqDy7yrQpt2IoarxGhCiNI9cvjjtL5E
 R4j2Zhpj59K77DgDs+ozp/DqgHekTc0ug+PUVM4xCWfAPCwNwfW5bFTWKGXCOh0oZ5SW
 bO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637975; x=1686229975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOiQFatwQ447mPutCz8qrRS4iLU0wpnrxUxJDkF0KiY=;
 b=EJfAnnEHk7OmWX3BjmmtqClJxSCkQuAUSFFIW3kBLDVY7DaG+mCcX1KHUekhCIufBm
 ewDAREGlxg6fP7DfFkjxd1x5nRIi5ZHdjztwxADlSSNsYYdzqnnLfEhIOptXuEBN7Usb
 /wlUa8aSMzzfRzdRfLDHRM9uBTWdiu9YlNtxDA7N0Hv7CyCG/L2/W1nYBzC4IIAEovTQ
 VKP7bRT4MTTZXcJXJXQgjV2lFCHwFAQ2h/lVzSiaa0ooasCaDrRzcHor1zcnnHzD6fUW
 a6yQOC57iW50iR84ziP0ll8OWuHXVRRXivRdizzhZmB11m5hlrW/lNH0xb5pCGy4UWSr
 Y+9A==
X-Gm-Message-State: AC+VfDyzBxm6MHGfd5T6xL4ZCyrCz4L17XqxJUyt8rtw9tYgCpa0yyn3
 1PUP3RV4qfuYYbVYLOjcZfYSSIOAKNCf+G8heqBnjg==
X-Google-Smtp-Source: ACHHUZ4NYDzCoy8SZ3ijb5HE17sLi94n7N7SisvMF1fYObKrvd9D9GHfOpUMQNtUsXuMz1DCM3eKilYs7wy6dGUra64=
X-Received: by 2002:a05:6402:685:b0:50b:f7b2:79d0 with SMTP id
 f5-20020a056402068500b0050bf7b279d0mr11873761edy.31.1683637975144; Tue, 09
 May 2023 06:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230506072333.32510-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230506072333.32510-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:12:44 +0100
Message-ID: <CAFEAcA_2m8NyVMe_iBkFrfNZX8NkiBXBnZfqEbcUcT3GpHhwTw@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Akihiko Odaki's email address
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 6 May 2023 at 08:23, Akihiko Odaki <akihiko.odaki@daynix.com> wrote=
:
>
> From: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> I am now employed by Daynix. Although my role as a reviewer of
> macOS-related change is not very relevant to the employment, I decided
> to use the company email address to avoid confusions from different
> addresses.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> V1 -> V2: This patch got missed so I rebased it and am resubmitting.

Oops, sorry about that. I'll take this via target-arm.next.

-- PMM

