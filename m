Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7C6D97C3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:16:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPTT-00073s-Oq; Thu, 06 Apr 2023 09:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkPTM-00073N-Jk
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:16:18 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkPTK-0000df-BZ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:16:15 -0400
Received: by mail-ej1-x635.google.com with SMTP id g18so1300583ejj.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680786972; x=1683378972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jE98TjuvqrqZo7dS5XGPVqd4QzQvq9MbHwXt8hhCm80=;
 b=j7KnP8kvUy3qYJstcnIqnHfPCCTOmlcIJ9yjZuD5fQ9DUKQIxC2cXEYll396hwRDIE
 fmWr0pINcKJHi+hQlRicVEVvs35HfBCllhgPkTBvupZEX+82YMEYAsEsKP1ds7PMBwIU
 j7PLtEco8IR+TMRTw5B07OQq1dNNrWCmmKiA2ACjz9P/e4FONTCpDJwFstpXxzOSqE+p
 6ZgZkd19Npn0b8KnKYhPaLC3Q5K5aLHuY/CBrfvfrX4sqDZHyjE6WOL1oYNZCi69oQC/
 Ljziz8O3gGykKgm3W5qacNVZmxdv/YBac0hx001aR/Rj4L4PCjn9SBKA53aLTDMxUEx7
 yWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680786972; x=1683378972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jE98TjuvqrqZo7dS5XGPVqd4QzQvq9MbHwXt8hhCm80=;
 b=FuRie0IRr7uCu3ge7dimqAi25uRpLhWIE8guSc0rABN8vF+fopBcEEKMIyngSvoPpx
 kYBJN0ggbEW/SLpEecg00X/4R6/xBejZrxmYe0uWoGDk0Yfn5eak655ohGxA3gB8bfbo
 tlxfDlLTxD3HBbV1xaJkRmg9KPDldEKR8Y0Rxtv/0/Bwg3OE/R4YkbuJDMnpEgz6N1hh
 g33h8ENBnDAyN7erlRE19sBwT57ZYHYPkVBEcqu4YEq26fp3gzzCHeplcEUNgPniIxRh
 iy4yZmZ3wfE2xHPwwstmbxD3UJCE3ToxNqNHhYoqVH7tEfQTTfB9CEuM2UPOP79D0ODr
 0pig==
X-Gm-Message-State: AAQBX9d6fPlZBvfi4m5gwhImlEA23mb1n32vihiL+jyZBUyCRCQbcNLu
 hYkcskuIJGQEJIERHyRz7Nx9VZhvez4rxVcpLZIZiA==
X-Google-Smtp-Source: AKy350YBujJNrDWOJhpSxwvoCcz5BLRpOWduG1oPBI6+lU1/AfBvD5Bfu8iFo0p+qWUG4qGpu7/tzOd07FANKYU2Ivc=
X-Received: by 2002:a17:906:3e0d:b0:92f:cbfe:1635 with SMTP id
 k13-20020a1709063e0d00b0092fcbfe1635mr3614935eji.6.1680786972209; Thu, 06 Apr
 2023 06:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-6-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 14:16:01 +0100
Message-ID: <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 13 Mar 2023 at 11:47, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This can help debugging issues or develop, when error handling is
> introduced.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Message-Id: <20230221124802.4103554-6-marcandre.lureau@redhat.com>

Hi; Coverity points out that this introduces a use-after-free
(CID 1507493):

> -static void error_handle_fatal(Error **errp, Error *err)
> +static void error_handle(Error **errp, Error *err)
>  {
>      if (errp =3D=3D &error_abort) {
>          fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
> @@ -43,6 +44,9 @@ static void error_handle_fatal(Error **errp, Error *err=
)
>          error_report_err(err);
>          exit(1);
>      }
> +    if (errp =3D=3D &error_warn) {
> +        warn_report_err(err);
> +    }
>  }

The old error_handle_fatal() either:
 * did not return
 * or it left the passed in 'err' alone

The new error_handle() introduces a new case, which
calls warn_report_err() and returns. warn_report_err()
prints the error and frees 'err'. Neither of the callsites
seems to expect the possibility "error_handle() returned
but 'err' is no longer valid":

>  G_GNUC_PRINTF(6, 0)
> @@ -71,7 +75,7 @@ static void error_setv(Error **errp,
>      err->line =3D line;
>      err->func =3D func;
>
> -    error_handle_fatal(errp, err);
> +    error_handle(errp, err);
>      *errp =3D err;

Here we stuff the now-invalid pointer into *errp
(ie into the global local_error). Probably harmless
but definitely rather odd.

>      errno =3D saved_errno;
> @@ -284,7 +288,7 @@ void error_propagate(Error **dst_errp, Error *local_e=
rr)
>      if (!local_err) {
>          return;
>      }
> -    error_handle_fatal(dst_errp, local_err);
> +    error_handle(dst_errp, local_err);
>      if (dst_errp && !*dst_errp) {
>          *dst_errp =3D local_err;
>      } else {

Here, if error_warn happens to be NULL then we'll
stuff the freed pointer into it. But if error_warn
is not NULL (eg because we've already had one use of
it) then the 'else' clause here does an error_free(local_err),
which is a double-free.

thanks
-- PMM

