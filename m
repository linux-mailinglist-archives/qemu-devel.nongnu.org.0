Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ADC3A9C7B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:48:01 +0200 (CEST)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVtg-00051c-GD
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltVs2-0003K7-N5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:46:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltVs0-0005CH-Rz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:46:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id v9so2771907wrx.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=iYgnYyl9KS4i5S8PvG9+f6a/qYA1mLD5Ch9oDmLOYoQ=;
 b=KheB8dvvfBG80ZIrnbwelSrri7S0Usn9czIuLsxhgEKqA4FIglm89jyXvmbftT1D7/
 x6mTML2aNmwUxMl7TBccug5KLzPSkrYqtlVfKxEPZTXyumcnQ8VkPccdrX8KAdIpcbJe
 /nNRt6wKEd6h+hgGSyR5ffTMseCBpQmEhQT2wK7kmYBrSfBy8Cv0cZBJtoI4fcb8TeB0
 Ba/GZH8DFPepCif29lNAgPZzgN4M0vG1Pi9WlBU47TJtOPsZoNgqarueCZmT90LvIROY
 knQPOS95fOZjythn0S5RkncDZJQiQlmLNIKI3AfN9qZrpoH+z7EZ1rlG98xabm2BZQS2
 NxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=iYgnYyl9KS4i5S8PvG9+f6a/qYA1mLD5Ch9oDmLOYoQ=;
 b=khjX/G+KG8MqsVmeuIDKVf8xkWq80tLQkB6WfAfkd5e8WMFCBac9gcAGypw+Mhoh1B
 0Ix4Q4pqQ16O+rZuO2JlomJMV0JH9atmQYGUI5uVmBY44ZIMRkENGNVolqCQqWscNgdY
 1/8ycv40soLcQMoQm8XQRckgqBo+uzBm8JS78dLgn0gIkqHEXFebca12p1uqgogQHdIJ
 VhG9tN5T+4q3Oj+G6xt0do2MZVK0jrYQJZevvKfyA0629fQwmwo3/l4bE+UjEQjV5bu+
 7/Znc7Hwnz11Uhvzgmdu5vYVvGpMdtSZl7Lm9jIK8KkoNoo1og1ISccBEbSvZ/ODBjlm
 dYnw==
X-Gm-Message-State: AOAM5319+EHzQ1PwK6jWBszFUU3RjfP8GAy2A1cZqY+2nrIoYg/uXJzQ
 7lAeJqio7YMq+bDiZaQ4WkCldw==
X-Google-Smtp-Source: ABdhPJzw4xHkl8q8R9kj8K0sdyW1BiWMvAs1KC8ivHUp5W8iCT44KG00GKdoo+go5082cgny2vCI/A==
X-Received: by 2002:adf:9031:: with SMTP id h46mr5624794wrh.125.1623851174653; 
 Wed, 16 Jun 2021 06:46:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i21sm4886971wmq.12.2021.06.16.06.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 06:46:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C04E41FF7E;
 Wed, 16 Jun 2021 14:46:12 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-5-richard.henderson@linaro.org>
Date: Wed, 16 Jun 2021 14:46:12 +0100
In-Reply-To: <20210616011209.1446045-5-richard.henderson@linaro.org> (Richard
 Henderson's message of "Tue, 15 Jun 2021 18:11:52 -0700")
Message-ID: <87y2b9gbx7.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> ARM is more complicated than the others, in that we also
> have trampolines for using SA_RESTORER with FDPIC, and
> we need to create trampolines for both ARM and Thumb modes.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/target_signal.h |   2 +
>  linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 72 deletions(-)
>
> +
> +    /* ARM sigframe */
> +    _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xfff);
> +    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
> +    __put_user(0xe8998200, &tramp[i++]);

Erm is this based on your c11 series?

> +
> +    /* Thumb sigframe */
> +    _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
> +    _Static_assert((SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);
> +    __put_user(0x9a00e9dd | (SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
> +    __put_user(0x46c04750, &tramp[i++]);
> +
> +    /* ARM rt_sigframe */
> +    _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xfff);
> +    __put_user(0xe59d9000 | RT_SIGFRAME_FDPIC_OFS, &tramp[i++]);
> +    __put_user(0xe8998200, &tramp[i++]);
> +
> +    /* Thumb rt_sigframe */
> +    _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
> +    _Static_assert((RT_SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);
> +    __put_user(0x9a00e9dd | (RT_SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
> +    __put_user(0x46c04750, &tramp[i++]);
> +
> +    unlock_user(tramp, sigtramp_page, total_size);
> +}

--=20
Alex Benn=C3=A9e

