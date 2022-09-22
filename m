Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C35E6988
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:22:10 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPtp-0002RA-5t
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obP8N-0000Bk-8N
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:33:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obP8G-00043G-9f
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:33:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id s14so14430653wro.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=Egw+F4b5XqwXUj1DHLWLGXtI934CxqB3FFawFUEXh/A=;
 b=Ty7ftzXk7uALAssstRiapIq5KTRBYHRXCVtULpOrYfk/6dwCP6QPQpgbH/o7movvnR
 sSsAsLc+4Fc+hBDJVL7ikoUpCXrjBpbxGNmi2kfTd0Fysxempi05ErAF8UMkbnCH0WJF
 FjykMXtxeW2DYvSkTiC6ufswQPrY9N0EAtZ4iTr8dpT0GyMjfzwdKxG8Y0v/I7keX10l
 BX2GNjMJ0B6J8OY7AWS8EjpC5klLBV5d6jHZBNfhrso+vUbVcxm0feLBDZp9L2paFe9p
 7VyqcWs1zTsUYWridktdK23VDMb/cbHybAjl3vxIVrckQ5jGk733sX87R9thu1h/4JMX
 Y7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=Egw+F4b5XqwXUj1DHLWLGXtI934CxqB3FFawFUEXh/A=;
 b=2YK7wIVf48RIhjEzpAIUeMmeU9ZlSU+PXKUfBG5I7dVjdidB7og4iI2PhY6+rGWyow
 Tik+2A/LIL4DrAhp+SqZl5O7lwKJ+bKmxO1wLz3+bSQDH94vkTzEBiTRGdgXTDSeZtra
 viK9j6De9rJahoIMlSzRRp6QVSKA+TQqT+o0BgnJ4maUCaMTJ8Rx7Ydr2WaEEAt5d2+Z
 flck6xhEPkX5cruM1/W29Mp0uvttXnzlABCuwv3NUztA3Nzsm948DNnTXT1RE/bYhXRr
 t6s5DIAHZZBUB/clQ1DFJR7C5zFYANw4DqdVrtCAFa1Nvhwqj6YalSTobpgy3GmT30Lp
 NgYw==
X-Gm-Message-State: ACrzQf1tdIBiD/ApkSo8LwweWi2V73mfVc54Q50w7K/iH/o4s5nEiBUq
 FKPytc0wRIZjTOBxUsIitTchtw==
X-Google-Smtp-Source: AMsMyM7XamZEydSyHfw6FUBt0oaXl2jToy5u9J3Mujcfyj6Z5A544hNfCuwl6T9gpNA5aMg5zTabxw==
X-Received: by 2002:a05:6000:15ce:b0:226:f2ab:516d with SMTP id
 y14-20020a05600015ce00b00226f2ab516dmr2638081wry.264.1663864378138; 
 Thu, 22 Sep 2022 09:32:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b00223b8168b15sm5225491wrw.66.2022.09.22.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:32:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0D891FFB7;
 Thu, 22 Sep 2022 17:32:56 +0100 (BST)
References: <20220922135516.33627-1-lucas.araujo@eldorado.org.br>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, =?utf-8?Q?Daniel_P_=2E_Ber?=
 =?utf-8?Q?rang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Daniel Henrique
 Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 0/4] Patch series to set up a ppc64le CI
Date: Thu, 22 Sep 2022 17:32:24 +0100
In-reply-to: <20220922135516.33627-1-lucas.araujo@eldorado.org.br>
Message-ID: <874jwz4bev.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


"Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br> writes:

> This patch series aim to make easier to set up a compilation and CI
> environment on PPC64 and PPC64LE machines.

Queued to testing/next, thanks.

Do we have a donated ppc64 machine to add to the custom runners?

> v3:
> Changed patch 1 to respect alphabetical order
>
> v2:
> This patch series are only patches 2-4 of v1 and an alternative to patch 1
> suggested by Daniel.
>
> Lucas Mateus Castro (alqotel) (4):
>   scripts/ci/setup: ninja missing from build-environment
>   scripts/ci/setup: Fix libxen requirements
>   scripts/ci/setup: spice-server only on x86 aarch64
>   tests/docker: run script use realpath instead of readlink
>
>  scripts/ci/setup/build-environment.yml | 15 +++++++++++++--
>  tests/docker/run                       |  2 +-
>  2 files changed, 14 insertions(+), 3 deletions(-)


--=20
Alex Benn=C3=A9e

