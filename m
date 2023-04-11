Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328766DDA06
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCUL-0005y9-4U; Tue, 11 Apr 2023 07:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmCUH-0005xW-KK
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:48:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmCUF-0007r3-4l
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:48:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso10837048wmq.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681213713; x=1683805713;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbQzvp9zaWu47dv4nK7+pFv+JyS2x8g5zBieJfVff+Y=;
 b=Ox+BW8b7bBA+Bpaz/SKWbORwfFCtR9WGvhXn9HlriCvTaYLMnDbAnSpuXuyIedy5oj
 0noByXT2aiyugc5VFeZnW7lmvCdODHPKMzjXO+dXWwySFDchr55hV39uNAKSX3VQSXUp
 FRAgfJSumGtgzNUVpJk2OtDqWVwIqRny3BtVAnxVflv+TSvE2/KaJHM0HCMCcH8LCZIv
 aqqvstnY8TPTiIXYO1iYwc69U8YEdZLR1y48M4XnHRLRryHm+wYIGUu013xx2jASp6Mk
 zJhc1uicKSchFQ9YRUT2NNjoe5mQcolOFchi13pujdGcljOdJBrpXh4D+QEP45msJU1t
 GpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681213713; x=1683805713;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cbQzvp9zaWu47dv4nK7+pFv+JyS2x8g5zBieJfVff+Y=;
 b=f0y86QMjUf3ZMIBKTZUYLIz6dABvPSqMYmlwmObo/YQwlJU9mKHqMBsag/ywaoOU6c
 iF9WlLBohCmh9V51tfa+/3NhLbJ00dZylZsnCHvweN0a5UoeVEuyOZ1zuTpoo0YEbI7x
 BA0PQaarAnUV7LDxk5XxsyowR7WY49doX8WVpbg3CrJd9V+HF7a/Ik1kxZKNgzXVQU+8
 oLIsZokG/UQ8ICXUFNjxkKT9OxUzKcztjWl09kY0Mb/EWbqT6IjAk94R2qEftexP3UT0
 qMF4+tfeeLu9Ih9r6LVkCEVxXxFxtah9H1WKhZDB6FNSAYIX9agkt/YmIIXK/SxutTSU
 yrpg==
X-Gm-Message-State: AAQBX9cnn9X9g/B0oX3ZuX/3w3R178MgPqgF/XuvMlBXovU6r8jU7Hbm
 jw8SRmjFKbgv54CqELGtE7NUaQ==
X-Google-Smtp-Source: AKy350bY+Cu/WJV6CHkPF3X1YxH7XTH+ru2oxkFv/UM9Z9BZl555WwjPlbO8XOq+xw1ctM3XIsMtdg==
X-Received: by 2002:a7b:c857:0:b0:3ee:4dc0:d4f6 with SMTP id
 c23-20020a7bc857000000b003ee4dc0d4f6mr9336873wml.17.1681213712951; 
 Tue, 11 Apr 2023 04:48:32 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003ef5bb63f13sm20891162wms.10.2023.04.11.04.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 04:48:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39E641FFB7;
 Tue, 11 Apr 2023 12:48:32 +0100 (BST)
References: <20230411103106.3992862-1-peter.maydell@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qianfan Zhao <qianfanguijin@163.com>, Thomas Huth
 <thuth@redhat.com>, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-arm@nongnu.org
Subject: Re: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of
 TYPE_AW_I2C_SUN6I
Date: Tue, 11 Apr 2023 12:48:24 +0100
In-reply-to: <20230411103106.3992862-1-peter.maydell@linaro.org>
Message-ID: <871qkqr65r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
> minor variant of the TYPE_AW_I2C device.  However, we didn't quite
> get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
> subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
> use a pointer to this object via the AW_I2C() cast macro, which
> insists on having something that is an instance of TYPE_AW_I2C or
> some subclass of that type.
>
> This only causes a problem if QOM cast macro debugging is enabled;
> that is supposed to be on by default, but a mistake in the meson
> conversion in commit c55cf6ab03f4c meant that it ended up disabled by
> default, and we didn't catch this bug.
>
> Fix the problem by arranging the classes in the same way we do for
> TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
> variant class be a subclass of the "normal" version of the device.
>
> This was reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
> isn't sufficient, as there is a separate cast-related issue in the
> CXL code in pci_expander_bridge.c.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

