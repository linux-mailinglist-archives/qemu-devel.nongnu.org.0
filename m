Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CC750132C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:17:23 +0200 (CEST)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1Dm-00080n-LT
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1CB-0006Zp-EZ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:15:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1C9-0002jg-By
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:15:42 -0400
Received: by mail-ed1-x52d.google.com with SMTP id 11so1754314edw.0
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JPqK7VZ2Djad86dizYTzPMvChJCtXLgc0MQlaIc1lnE=;
 b=O0iNs+yH/+TfpZX7pua+vLfBMGXwPDtGjIWj0B6JEBzHeokDp03D7QvrlkbJ5bJsqk
 nfVXtopB/9dKc+6WfpH9JSf1QGEDUA8vqTTjecsaROUai1yCfDefEReLgGn/GWFKpX2J
 pjGU6apni0xiCDkWwFo0POEQHbSH/RU5T+aAgR6H7u62c64Fy6lflcF86jv8FLmbmTrH
 nBAl4DZZ+ZQ1ds6UcyQdyzx3W3y7EhEVN3r3J1+YFzF1hbcrohH0P58wsLkGZKoaWzZB
 ht/SOd3z/HqdEm1OB0rV9qoZWpxCXyw4zBqrjDbZE5kF2h0YpmT1Qdsw8X0E7M8VldE5
 Cfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JPqK7VZ2Djad86dizYTzPMvChJCtXLgc0MQlaIc1lnE=;
 b=UtQzAIyDmNQeUm61v5DsIhY539O2Fd/PrU71PhbduzAd2dN5z2JZEbK0n1J/ejLi73
 QAajBZg6bR00MGCDoV6Ecnz8WQZVObK/aQ5DYhL92wn0grd6MOFL7bl4CzFr4VUOFxng
 NZzaqC324B99IspZt2ge0Bzer0L+VkVr/Y700KE0MP/O1PeZZiaBAqxcDIKtOlTIlp1D
 MtCMW+hCL+eNUcxk+8SOamu9R3oWFAZ92hfEt1SxDUW/vEYMGyfMVHlrk+ISpKWTsHGG
 dxjbBnt2OxCpTbxWoU7O0JWdGZwkL4CE8ZWgsvvcKuzkyD3KUQPvOMnphIvS26GuwqD6
 5h1w==
X-Gm-Message-State: AOAM530igpcBszou/W+M0xLV57iylyIeM7qfba/LBgZaYV+j0gMZUrGI
 57NoK0FULWXMJFnuPxBuCptOfw==
X-Google-Smtp-Source: ABdhPJwBxX9PhAL0e7gzMPSiCUgXBsjJIacyD7evk1VkKEet+au6vxpEyzPBgKmTf9p11coYxgvD2Q==
X-Received: by 2002:a05:6402:1b0b:b0:41d:84e8:2ae8 with SMTP id
 by11-20020a0564021b0b00b0041d84e82ae8mr3457379edb.271.1649949339363; 
 Thu, 14 Apr 2022 08:15:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a1709064e9500b006e8973a14d0sm720748eju.174.2022.04.14.08.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:15:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91AEB1FFB7;
 Thu, 14 Apr 2022 16:15:37 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-38-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 29/39] linux-user: Use qemu_set_log_filename_flags
Date: Thu, 14 Apr 2022 16:06:48 +0100
In-reply-to: <20220326132534.543738-38-richard.henderson@linaro.org>
Message-ID: <875ynbvgpy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Perform all logfile setup in one step.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/main.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index d263b2a669..0297ae8321 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -85,6 +85,7 @@ static bool enable_strace;
>   * Used to support command line arguments overriding environment variabl=
es.
>   */
>  static int last_log_mask;
> +static const char *last_log_filename;
>=20=20
>  /*
>   * When running 32-on-64 we should make sure we can fit all of the possi=
ble
> @@ -257,7 +258,7 @@ static void handle_arg_dfilter(const char *arg)
>=20=20
>  static void handle_arg_log_filename(const char *arg)
>  {
> -    qemu_set_log_filename(arg, &error_fatal);
> +    last_log_filename =3D arg;
>  }
>=20=20
>  static void handle_arg_set_env(const char *arg)
> @@ -643,7 +644,6 @@ int main(int argc, char **argv, char **envp)
>      int i;
>      int ret;
>      int execfd;
> -    int log_mask;
>      unsigned long max_reserved_va;
>      bool preserve_argv0;
>=20=20
> @@ -677,10 +677,9 @@ int main(int argc, char **argv, char **envp)
>=20=20
>      optind =3D parse_args(argc, argv);
>=20=20
> -    log_mask =3D last_log_mask | (enable_strace ? LOG_STRACE : 0);
> -    if (log_mask) {
> -        qemu_set_log(log_mask, &error_fatal);
> -    }
> +    qemu_set_log_filename_flags(last_log_filename,
> +                                last_log_mask | (enable_strace * LOG_STR=
ACE),
> +                                &error_fatal);

I guess enable_strace ? LOG_STRACE : 0 should generate the same code
either way.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>=20=20
>      if (!trace_init_backends()) {
>          exit(1);


--=20
Alex Benn=C3=A9e

