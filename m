Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C406D079D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:06:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsuj-0001Sq-Lv; Thu, 30 Mar 2023 10:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phsuf-0001Sh-Rl
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:06:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phsue-0008OE-0K
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:06:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id y14so19226475wrq.4
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680185158;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWtgT6rvpfmwwbOmgWn/47elUZECVGrm7udM7vX5Azk=;
 b=oxUlUVYovLPv7lg3EEJNI7wrSHyr1CxlcgnWXZ/HB4+qqjGAq1GDyybH2gsliHjrIn
 h7TCP0UJxV1O5mNfhosqZR0031XvA1kAXoMrR2WhQV9eFWktvCVh8ARO/R6eAjZUM97+
 8SYKuXUI5lj2phbjVcZl6BwkNFJLHfCw2af10EH2oeqEXYx63GsgSogPiudYYOoHphPo
 +dCDk2HZSrN5y7Xo0JPhgQMa+Sbce208LMyAeZfx/8fSp8Zm5G0AYmu4cu7xd0lzBxGB
 NsN/GW/YzDIxrVL3LxkpU8r7tqGg0lmFqfXwnmq6tI0Vaz4O/mldXMLfDBQB/UUvPwHH
 x5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680185158;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jWtgT6rvpfmwwbOmgWn/47elUZECVGrm7udM7vX5Azk=;
 b=RH1cH89Dv5Q0vUVQt6FGs2gwFboYcBIGu4j6ZECrV8tFvbYI6DCJCrVFa627RcajTG
 M/MTalvDnwuCjkqAcKy1eJkt8mTEXvYvolglZ1+u5jlWgOd/JhM/0LfRR1uORmRDxRox
 s/5r/H+D+DtW5wIPeo+pUcw6Lk5pi7Fe61flV15ss3N0DYKAgVWHMQEgoSKr3gRfGuQx
 fx677dJ+7qfBsP9E95kAJfhsw/mKqF1opzHc/CEpWfXrzjRgncObSMA19WVTdnNNiTVK
 14LQAEJdejLrdE4cO6rNM7N9fEepYWg0vJ6qfOcFYTb/dYhN1T6X7AC7ESDz8GuOJlRN
 clTg==
X-Gm-Message-State: AAQBX9eCUDDoNy1aONi3tzzaBjK/+/mRuKP7LWirf3j9dAkz7su51sqo
 xUMsF5H+bPQQOGPLynQPfGNbFt8SywrJ7bDNfYM=
X-Google-Smtp-Source: AKy350bQo95OvQwInZOqDuZs2sWbZcGrAoW51Ap+xjf9mwTKFdGZ1kwQ4998xtxTlDMCO5uk/trQYQ==
X-Received: by 2002:adf:f345:0:b0:2d4:d898:75e5 with SMTP id
 e5-20020adff345000000b002d4d89875e5mr4845001wrp.32.1680185157842; 
 Thu, 30 Mar 2023 07:05:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d484c000000b002c59f18674asm33075018wrs.22.2023.03.30.07.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:05:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 023DA1FFB7;
 Thu, 30 Mar 2023 15:05:57 +0100 (BST)
References: <cover.1678770219.git.y-koj@outlook.jp>
 <TYZPR06MB5418B64D371016CCEDE577419DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, Yohei Kojima <y-koj@outlook.jp>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 1/2] util: Add thread-safe qemu_strerror() function
Date: Thu, 30 Mar 2023 15:04:49 +0100
In-reply-to: <TYZPR06MB5418B64D371016CCEDE577419DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Message-ID: <87ileinxkr.fsf@linaro.org>
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


Yohei Kojima <y-koj@outlook.jp> writes:

> Add qemu_strerror() which follows the POSIX specification for
> strerror(). While strerror() is not guaranteed to be thread-safe, this
> function is thread-safe.
>
> This function is added to solve the following issue:
> https://gitlab.com/qemu-project/qemu/-/issues/416

If you tag this as:

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/416

then it will auto clear when merged.

>
> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> ---
>  include/qemu/cutils.h | 20 +++++++++++++++++++
>  util/cutils.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 92c436d8c7..0bcae0049a 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -117,6 +117,26 @@ int stristart(const char *str, const char *val, cons=
t char **ptr);
>   * Returns: length of @s in bytes, or @max_len, whichever is smaller.
>   */
>  int qemu_strnlen(const char *s, int max_len);
> +/**
> + * qemu_strerror:
> + * @errnum: error number
> + *
> + * Return the pointer to a string that describes errnum, like
> + * strerror(). This function is thread-safe because the buffer for
> + * returned string is allocated per thread.
> + *
> + * This function is thread-safe, but not reentrant. In other words,
> + * if a thread is interrupted by a signal in this function, and the
> + * thread calls this function again in the signal handling, then
> + * the result might be corrupted.
> + *
> + * This function has the same behaviour as the POSIX strerror()
> + * function.
> + *
> + * Returns: the pointer to an error description, or an
> + * "Unknown error nnn" message if errnum is invalid.
> + */
> +char *qemu_strerror(int errnum);
>  /**
>   * qemu_strsep:
>   * @input: pointer to string to parse
> diff --git a/util/cutils.c b/util/cutils.c
> index 5887e74414..3d14f50c75 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -131,6 +131,51 @@ int qemu_strnlen(const char *s, int max_len)
>      return i;
>  }
>=20=20
> +/**
> + * It assumes the length of error descriptions are at most 1024.
> + * The concern of write buffer overflow is cared by strerror_r().
> + */
> +static __thread char qemu_strerror_buf[1024];
> +
> +#if (_POSIX_C_SOURCE >=3D 200112L) && ! _GNU_SOURCE
> +/**
> + * In POSIX.1-2001 and after, the return type of strerror_r is int, but
> + * glibc overrides the definition of strerror_r to the old strerror_r
> + * if _GNU_SOURCE is defined. This condition handles it.
> + */
> +
> +char *qemu_strerror(int errnum)
> +{
> +    int is_error =3D strerror_r(errnum, qemu_strerror_buf, 1024);
> +
> +    if (is_error =3D=3D 0) return qemu_strerror_buf;
> +
> +    /**
> +     * handle the error occured in strerror_r
> +     *
> +     * If is_error is greater than 0, errno might not be updated by
> +     * strerror_r. Otherwise, errno is updated.
> +     */
> +    if (is_error > 0) errno =3D is_error;
> +
> +    strncpy(qemu_strerror_buf, "Error %d occured\n", errno);
> +    return qemu_strerror_buf;
> +}
> +#else
> +/**
> + * In glibc, the return type of strerror_r is char* if _GNU_SOURCE
> + * is defined. In this case, strerror_r returns qemu_strerror_buf iff
> + * some error occured in strerror_r, and otherwise it returns a pointer
> + * to the pre-defined description for errnum.
> + *
> + * This is the same behaviour until POSIX.1-2001.
> + */
> +char *qemu_strerror(int errnum)
> +{
> +    return strerror_r(errnum, qemu_strerror_buf, 1024);
> +}
> +#endif
> +
>  char *qemu_strsep(char **input, const char *delim)
>  {
>      char *result =3D *input;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

