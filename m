Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664EE57B337
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:48:38 +0200 (CEST)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5Nl-0002Lu-Fo
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oE5M9-0000wR-M3
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:46:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oE5M8-00078N-1N
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:46:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id e15so19868017wro.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MG5/0lwkpGN0a6t8fb/UEWKAYBjxcByvjRnJm5o2Sq8=;
 b=PB01X+rWFiMlpPzjUmPwNj6kj6xaXOWaJTq4O/eC9DcC0TwFpdqyONIB5OIWkxfaPH
 6MbIztn284p/ZdAzABAo7Jk80uvth0RzBmHAnzJ9MV8vxuLNwyCQBRPfCcDMXAHFJDDz
 G5MP9JVg1I3TRcypDn6lzdslCdPKlYbqvdwIhvLq3g4hOdjVXezEfRrI3667t4aTTe1V
 1FY8Mz/fbzPLLj5rEsNBY3fjx9lYJLu9/RS7Op3bJXnRU1BC1i3hyhnLGgiKt0Hya6oU
 YAK65WqV9VQA7uwP9Xe3l5JhA30s4bA4syzODpNcXTkyKJ+QVLthFMwqePkfQx+5C1E4
 PECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MG5/0lwkpGN0a6t8fb/UEWKAYBjxcByvjRnJm5o2Sq8=;
 b=AYDxcBn8uZ3RdKbocqFBjKkMjX1vESdxS8Bs8S/FYmcO+fXDnjKKl3/RdIePSfaOl3
 Xa0cav6t4tKsm6rHrymXn/utWpXW4mzfrU0LcAUBjiuxjkknxzuRWq5+HK7vckSyTuRk
 1GkAFhFZYCBj27gFuu8izJDeBnPu33JUbelF52HjPxqLbYEUt7Wk80qlc46pQ9cD2ZWi
 jeQXXlsgtQlz5cS1ixzFkjhRaAI4Om6gTHxbtxrTkzfyAqPeUwQpW1+WMZO00mC1nXGV
 /Asm5sLPlLrLh+LWeCJK1O2jr3iUqefkq9kCZRXMG5+woOdY6MutjZZKbUStR9AC1TI1
 Gfmg==
X-Gm-Message-State: AJIora/qYDrtv/e1rIlLDJWCpHAzqTEl+Ba69cQ2k7MUsxFV1GMqemQ1
 bZHtkd+PWiRW0lVe8JKky2VWtw==
X-Google-Smtp-Source: AGRyM1vRPMtjQfAfR8ziuhF4zM61DUVoZpGdiSXDZQlptJY21VRGmlM33Au9Yw3x3e4Yyp4ofIEGDA==
X-Received: by 2002:a05:6000:98b:b0:21d:b70f:2726 with SMTP id
 by11-20020a056000098b00b0021db70f2726mr29795066wrb.237.1658306813820; 
 Wed, 20 Jul 2022 01:46:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfdbc2000000b0021d4aca9d1esm533861wrj.99.2022.07.20.01.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 01:46:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C25A11FFB7;
 Wed, 20 Jul 2022 09:46:51 +0100 (BST)
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Access target TranslatorOps
Date: Wed, 20 Jul 2022 09:44:58 +0100
In-reply-to: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
Message-ID: <87y1woyxvo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> Hello,
>
> I would like to be able to, from the linux-user/main.c, access the target=
's registered TranslatorOps instance. How would I
> do that when 1) the TCG is correctly initialized and ready to run 2)
> before QEMU starts to run or when it is safely paused?

Why would you want to mess with the TranslatorOps?

If you want to do some sort of analysis you might want to consider:

  https://qemu.readthedocs.io/en/latest/devel/tcg-plugins.html

At which point you can hook into any translation or individual instructions.

--=20
Alex Benn=C3=A9e

