Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E158869D0B8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8Bt-0006jm-PH; Mon, 20 Feb 2023 10:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU8Bp-0006dP-VT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:34:53 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU8Bg-0006ep-8t
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:34:45 -0500
Received: by mail-wr1-x431.google.com with SMTP id t15so1738359wrz.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eCeKNbipg+KYNa+ydPyzvWgRi1wTqDlPY29XuumKS8=;
 b=ELQ4cXcGx1dr0dRNPhLYqCBoluGUKoqwlAsi1BIiHieVZDYNfkYpTLW8acx+jRRp8g
 PI4lKHMxfSontHBtn9MThDU8OYYjlF5JS73mPQ1xP/FZ9HT3sXFdfL4It9SsZXVPJCZg
 Ef8XLYyFujmXtN23EO2+QmO92Qih5i9lgE5Xlnil7WVsLtIApyZvx80P4UISCC08vY8x
 dmb1ho2PdOypbwtoYYMy/ZKzWT3tL09mzAbT/tBITxXEvrapwCHiEqS1DX5zBag9E28A
 lmuIOhgZ3nNgsWQiM5i/De10iJITJKWOeXnGvNgxwy5ZVDekCozoPhlBeM2fnQJ6mQoW
 ji5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1eCeKNbipg+KYNa+ydPyzvWgRi1wTqDlPY29XuumKS8=;
 b=UfQHA35zGT47fRwYa+uPCHnA0cTAW8XA2a07XLfqdVmNsAl2E+4pIUc0uDseSIV8Kd
 a0YIXFAfccj2elsB3/AUbFTYQx5Yj6EbcooOyWuHPneVUIIrZh53qh+gbnfM7RW4o0EH
 0AD9Q9PdvGCpApQKToKSGQcH+uF4cabQdfBFhzwGlq9k2c2aPH9KQElvjyETzTdPULtF
 dHX498j9U1sKAvTKOjl+BZ+FQO1jVfNE6/5NDJMVR0ZTOO2pbxbRfzdWwabnlVwroV4F
 uO04f0V5q4WyVAieBxYyO7oTsFA/5NJ9uaJK8hDKnmmCk9oQ6UNb36CInvaCct6KhVIb
 xHhw==
X-Gm-Message-State: AO0yUKV1S7gCI5L7wN9RqfuHqVO8hcSGpowdBuvOFj4UIG9t8WmaEp8V
 udoTZARwUmLr//L/FdkzHtuvvw==
X-Google-Smtp-Source: AK7set/HW2oHxIlS5e7ghayP+wECaUFJwBH3hny2gL+XlFXJghr9h1QhtD3+fL3qZ2B1XiWlbDMbWA==
X-Received: by 2002:adf:f70b:0:b0:2c6:67c9:860a with SMTP id
 r11-20020adff70b000000b002c667c9860amr1919872wrp.44.1676907283406; 
 Mon, 20 Feb 2023 07:34:43 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a5d4c88000000b002c5598c14acsm2893538wrs.6.2023.02.20.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:34:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6A0C1FFB7;
 Mon, 20 Feb 2023 15:34:42 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-9-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 8/8] hw/intc/armv7m_nvic: Use QOM cast CPU() macro
Date: Mon, 20 Feb 2023 15:34:38 +0000
In-reply-to: <20230220115114.25237-9-philmd@linaro.org>
Message-ID: <874jrgs63x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid accessing 'parent_obj' directly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

