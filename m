Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836754E9CB0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:50:02 +0200 (CEST)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYsZ7-0003vw-Bh
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:50:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYsXU-0002rF-7B
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:48:20 -0400
Received: from [2a00:1450:4864:20::62c] (port=44970
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYsXS-0006EP-Kr
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:48:19 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lr4so21490377ejb.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=i9pi1xdeVtRlmWkD0W/DE/T0MPWYJyiQ0u/MKkuJk4s=;
 b=QXnPfti4Z6TsNvvKxtAKjOc3Q1c9ZRpO1LLDPMK3+35GaGPiM9UEJzZa3FEAixG40N
 3RPWexXuONknjibqrfYyLNfXlkDX6K6kA+JzC3D2Z1j85RE625G7rZk99KWxpkbJBAqa
 RlRpU656Pjjcm+RmvIGHufJr1ONvjqQPaV2AkRnhuOMc7sA975ey6jMW/gnVdlJmsn87
 cCfC3Y1tbiGmGCMf/pVdnixLxqjaCW/ZiYWIbNZ8tB115G2iuOc/XvrUAmsTH6C6UKxp
 ZuYhCXQ0xh3P9D8ehaJYhqO4WYDYISNpec396yx++wsuCPdRYFjjzwDNnu8Ihe8hRbMK
 yYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=i9pi1xdeVtRlmWkD0W/DE/T0MPWYJyiQ0u/MKkuJk4s=;
 b=7OG4/f2GIzZGXd9suXIY9fXENA+KfDM+Isb/ImJva5E4f9gLx11uBp7mzP+gvgNonf
 d54hKm1/PqiWz07d5efuXEXBKOAE0SI/OpP0AEkSytEAAFOWJEaZZPttMs5xC5V90Ok7
 09/kfYSlvyhIeeaMiJMOc2O78NG88fHyqMHuUmtCcUsyGkryqQShilgWKFbt4Qs3pb0H
 pbGDnI6Db4UNhks9MBduJZZR/pwaIM9o9ogL4KsG/Zp7wYcGa7j+ZpmsmXWwyWu1arQn
 9EEYBRQh3mM4yGal0vSoui18s5MHGO9+ssCWwcW7aAy0n2zL3NKodCfd8tucmgLFBNVG
 6G6g==
X-Gm-Message-State: AOAM531KJA8Pqn9T5P8Ogv2f58ExBPvxn7QKQbHpOyjteq6sBSP6IXVZ
 Wtk9Sa2O/PJE8Kt6RW+LubQhRRkrCEQmXg==
X-Google-Smtp-Source: ABdhPJym74ogt63yuK5++wHbfd3z3LotOqcaTSAnPP6MdiEBC69FfUbPDJf0VugOe7STooBJ1JcZKg==
X-Received: by 2002:a17:906:4ad9:b0:6cf:93f:f77e with SMTP id
 u25-20020a1709064ad900b006cf093ff77emr28906853ejt.558.1648486095798; 
 Mon, 28 Mar 2022 09:48:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170906144b00b006cf61dfb03esm6047866ejc.62.2022.03.28.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:48:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B3F31FFB7;
 Mon, 28 Mar 2022 17:48:12 +0100 (BST)
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-9-pbonzini@redhat.com>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/15] tests/tcg: add compiler test variables when using
 containers
Date: Mon, 28 Mar 2022 17:48:07 +0100
In-reply-to: <20220328140240.40798-9-pbonzini@redhat.com>
Message-ID: <874k3ixbub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Even for container-based cross compilation use $(CROSS_CC_HAS_*) variable=
s.
> This makes the TCG test makefiles oblivious of whether the compiler is
> invoked through a container or not.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

