Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5372239F585
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:48:02 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaDB-0001Jx-C5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaBO-0008CL-Dj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:46:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaBL-0004a1-NF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:46:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id e11so11028953wrg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dVCm/0kfMADEgmaOibtTb+YWAB1a65QnBWnTHLQzyH0=;
 b=i0a/wNnxStg8qJ7JIFsPxhHAFlKBp/cK4bu7gwwNGLifMT7n6cOmG2eTVzQIGhTJs+
 58y3NYq009JdvYJM+S4fzgtBBpLUqlev32Sgv2J/BHq8Y+l+zO3AweVWnqCQVjj6dBkX
 U3a9D43jYL1lUJg9jJdS7ttF7Kk0ee5RC5DcQXhYgkKGumbBh5sfCukUhFkRZVy+dpEn
 i2AfzeQ4xRyvVgiuQW0wyT1ed7KccbCAiSuAyEAe4GDl9xfaQ2rFluxG6s6UnRur6+Ix
 aDilNftY2DAwYl8aPZ2fbzQs2bGSi6fGbhZLsyTK/KBDEEAkJIHeak3YZZVbnUh53s8+
 sYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dVCm/0kfMADEgmaOibtTb+YWAB1a65QnBWnTHLQzyH0=;
 b=lII9CnUiHw5V2qCxsoOA2oqWrzZ4f6v7ftKmElMhWE2u3dRuvRsCYhz0Fg8Xz0Efyc
 o3NY7oT5ugpr36xafNRYe8jTUiQKO93EczgtI+dwOqMVZSbmvRhR0IFOcyMxOnqyYRll
 ev1jT09Pcxh/umNYL32GEtXDxRSIi+rD76FYqGi1PHz1q80T2ab4dA67jJLmG1vcuz0p
 qMq0Wh/f948b0s+FldUIyz8gGkWUqbQr/DlJUesk/2Pd76VALzh5eO8bh2NyKhX58XAI
 qP/9s1Fg/A9Sp2AhDzD8eteCO2bm7U1BB6cXcMSCClQ4TPKXTjaJNd6PkI19cUbUMOmK
 sYZA==
X-Gm-Message-State: AOAM532fSgyW3tn+4+M9HmuSbEG3xZtDQXoQxl9clYLYej+pUTOvCan6
 tv4rtWovsaZ2YYuGc51BmxLhQw==
X-Google-Smtp-Source: ABdhPJyx/8h51gs2TxXMeurHbRhMWljQo4UHHsraHs5Xbwit66+N4vTbA/uI2+SSHHTLIDDbDe+K3g==
X-Received: by 2002:a5d:4681:: with SMTP id u1mr15046477wrq.268.1623152765526; 
 Tue, 08 Jun 2021 04:46:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o129sm2788152wmo.22.2021.06.08.04.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:46:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA9C41FF7E;
 Tue,  8 Jun 2021 12:46:03 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 05/28] tcg: Split out tcg_region_initial_alloc
Date: Tue, 08 Jun 2021 12:45:47 +0100
In-reply-to: <20210502231844.1977630-6-richard.henderson@linaro.org>
Message-ID: <87bl8gmves.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This has only one user, and currently needs an ifdef,
> but will make more sense after some code motion.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/tcg.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 8b57e93ca2..df78c89673 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -729,6 +729,15 @@ static void tcg_region_initial_alloc__locked(TCGCont=
ext *s)
>      g_assert(!err);
>  }
>=20=20
> +#ifndef CONFIG_USER_ONLY
> +static void tcg_region_initial_alloc(TCGContext *s)
> +{
> +    qemu_mutex_lock(&region.lock);
> +    tcg_region_initial_alloc__locked(s);
> +    qemu_mutex_unlock(&region.lock);
> +}
> +#endif
> +
>  /* Call from a safe-work context */
>  void tcg_region_reset_all(void)
>  {
> @@ -962,9 +971,7 @@ void tcg_register_thread(void)
>      }
>=20=20
>      tcg_ctx =3D s;
> -    qemu_mutex_lock(&region.lock);
> -    tcg_region_initial_alloc__locked(s);
> -    qemu_mutex_unlock(&region.lock);
> +    tcg_region_initial_alloc(s);
>  }
>  #endif /* !CONFIG_USER_ONLY */


--=20
Alex Benn=C3=A9e

