Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90103B6CAC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 04:53:45 +0200 (CEST)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly3se-0000rH-PV
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 22:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ly3rY-0008PO-J5; Mon, 28 Jun 2021 22:52:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ly3rW-0000oL-SM; Mon, 28 Jun 2021 22:52:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id nd37so33652146ejc.3;
 Mon, 28 Jun 2021 19:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9JxeQ5eDatqKTtu34USp6Wn6kWunQASgJfRebLJ9x78=;
 b=WTPMnF7RAUKiElrq9ifiDZIUqmnHSAVIw4tfW8HOt3sAnIE5OhR++1xIQDRnsB2FA+
 vUxFFJ6TImNr5iRMx1mzTr6sLoJUZwynhb28ez/1wPWlFLlacqYEfCKhuYPrBRVAiEuT
 8QtHbFuNxBrtmwkTnSuWIz0Ql9WE+ozpO4Bxh6+b8t1/vH/ra+ctHEXebQz3DMNQVgmi
 JB4tqJLN1qySVA0D+xYX+QEf1a+eGpEOLa41sGMkb4Nc9VTS9Z38JG+UUXklxXUY244c
 NnWYN2nCUjkjOz1zkkFkitSg9gJRgtfHUcW0tURdash3M0ChDgLacR5A7/4IcZgZ5CGI
 C3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9JxeQ5eDatqKTtu34USp6Wn6kWunQASgJfRebLJ9x78=;
 b=Tz0yrMQen4qBK6JA05gw/2fl+bAPquJFljJMl37gRhTUYOYCH7rlQViaM5bzD7ZLua
 H2T+KuctjBMBeswnU4yOk/qWoh4QvuAes3+dLD6VDU36MiOh+k0niHQ79i81TL5HKxQi
 mPOYI2XCrlU9pOEAivLC81IyRoJhxmuZbBjgF29Cnz96VVDa7kICLGwM6qBZIShpUHvC
 h9BaqFpUn6l8r/ELYIDv6+IaTmdD4KR60691GU+GvSY2ITY+yzhH9GjOrSokuxsy8kI1
 lDljqxBUeV+42qya90k3FQaCLqOaNKEyrMlHqXkproyazT9QWy5Fo0Vg4LwjRw+gAXim
 8v+Q==
X-Gm-Message-State: AOAM533QQZuFuIoUVVganPxc+8VGu6KcKkIsiGn9Anos26oMMYRH8uwb
 iloTb2YQQIvs9rhW0hR/Ev3/QXSlCq+Rpt8GtL0=
X-Google-Smtp-Source: ABdhPJzCPJj24R68dWPQvgo455FdH2HO1DqTk9+ECHUWIhQY0HT2oJ3Eghp7WqlT1V1tcM9K/LP8DG6MujkOOo5zQ7I=
X-Received: by 2002:a17:907:62a7:: with SMTP id
 nd39mr27502882ejc.502.1624935152704; 
 Mon, 28 Jun 2021 19:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210628160914.2461906-1-philmd@redhat.com>
 <20210628160914.2461906-4-philmd@redhat.com>
In-Reply-To: <20210628160914.2461906-4-philmd@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 29 Jun 2021 11:52:21 +0900
Message-ID: <CAMVc7JW23VFMG4tboxjpds2SnK_1j9aqpOboGY7xOG2mwwUWGQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

2021=E5=B9=B46=E6=9C=8829=E6=97=A5(=E7=81=AB) 1:09 Philippe Mathieu-Daud=C3=
=A9 <philmd@redhat.com>:
>
> Avoid accessing QCryptoTLSCreds internals by using
> the qcrypto_tls_creds_check_endpoint() helper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qemu-nbd.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 93ef4e288fd..26ffbf15af0 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -43,6 +43,7 @@
>  #include "io/channel-socket.h"
>  #include "io/net-listener.h"
>  #include "crypto/init.h"
> +#include "crypto/tlscreds.h"
>  #include "trace/control.h"
>  #include "qemu-version.h"
>
> @@ -422,18 +423,12 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const cha=
r *id, bool list,
>          return NULL;
>      }
>
> -    if (list) {
> -        if (creds->endpoint !=3D QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
> -            error_setg(errp,
> -                       "Expecting TLS credentials with a client endpoint=
");
> -            return NULL;
> -        }
> -    } else {
> -        if (creds->endpoint !=3D QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
> -            error_setg(errp,
> -                       "Expecting TLS credentials with a server endpoint=
");
> -            return NULL;
> -        }
> +    if (!qcrypto_tls_creds_check_endpoint(creds,
> +                                          list
> +                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_C=
LIENT
> +                                          : QCRYPTO_TLS_CREDS_ENDPOINT_S=
ERVER,
> +                                          errp)) {
> +        return NULL;
>      }
>      object_ref(obj);
>      return creds;
> --
> 2.31.1
>

