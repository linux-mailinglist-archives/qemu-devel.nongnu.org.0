Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54BA3FCDC2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:49:03 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9kf-00035U-8F
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL9jf-0002Ax-3R
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:47:55 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL9jd-0006Oi-4u
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:47:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a25so1352761ejv.6
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dGA/mZWuLpm8206G2uLBKhCKQ5KX8Fhjx7Itc17dnoE=;
 b=LTi3LCDTrR0h7K3lO2Ur8m0klTYBrUklt0eADq2jvJgKP7xBAs80iENnAO+9O3EHsJ
 6G/DiYFFO0vaMe5brCD1qu2L1ZMVppy7bgBt0oMmbpLW+FTlR/ADPCpf9UwwmBNfyhq8
 solTVqXOtpx7hlOK5Szu2Bbxk0vuXtopFDKUxylcDEUIjwWeepOAsbc6O+cEE4jACvaJ
 9pmziG7wsWuVYlN2bydk0xjoZGkhP2VGZHubNcNXzCv3BpcGoh6Iw4QaQr3WhgbfVjl9
 mIJ8ZQ7Sn64EHhFSPkMhckVxVuq+C0xAUxgVWuQngwTZaakgseKptVpOK1cNXEuEiSpD
 69sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dGA/mZWuLpm8206G2uLBKhCKQ5KX8Fhjx7Itc17dnoE=;
 b=bRsa5WFuurSmXs+lt1BotTYscQtIlGSdm4lPp6XwXVWrvYT9Dv+VAgbupoWkEp7r1K
 sEkyKlfOg213HGtLrzeuE764CBBRqt22vAZQ7UozyYe6WvNYROrQonr3yKlORYWJk12G
 Ohmu2uXWU+VxXbo3rcFADwzHJrPFKjydNqGTh0xz9EGuBWMVwok9pAHM4zNq8fw70X9K
 Dx7sVbRalEISf/OrtAVvQzLgRUtglQUodI9IIDHHvSAp4C9KO8ymf+kgLhCNACM+H1m3
 z26ziXRErkMpSb15zySSatTDPEHrs7gNvVwaorFyVH0k4lSYzAXfElCR0YrLaP0spKpX
 s5kQ==
X-Gm-Message-State: AOAM530CQyL2IZAGbfFoGuyvTHpCVScJQC8zqlRyGT0nNDS09r1RkvNN
 cuvRjHiY7sddJYD/7XqMZoYDUsqNFcqMaaoXuppWng==
X-Google-Smtp-Source: ABdhPJzQ+OK9Xxwuh3FpTA6hFVEnQE9VuyumyZxKcqui0qwuln0mH31G3M8A3elIgh9O6CCmOMLOgbprEj33WFf1PQI=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr32866386ejy.407.1630439271557; 
 Tue, 31 Aug 2021 12:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 20:47:03 +0100
Message-ID: <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 19:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> We test whenever the path of unix-domain socket
> address is non-empty and strictly-less than
> the length of the path buffer. Both these
> conditions are wrong: the socket can be unnamed,
> with empty path, or socket can have pathname
> null-terminated _after_ the sun_path buffer,
> since we provided more room when asking kernel.
>
> So on one side, allow empty, unnamed sockets
> (and adjust the test for abstract socket too -
> only do that if the socket is not unnamed),
> and on another side, allow path length to be
> up to our own maximum, - we have up to size
> of sockaddr_storage there.
>
> While at it, fix the duplication of regular
> pathname socket to not require trailing \0
> (since it can be missing for unnamed sockets).
>
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> Fixes: http://bugs.debian.org/993145
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: qemu-stable@nongnu.org
> --
> Two questions.
> 1. Why do we store the name of the socket to start with?
> 2. The code in the abstract socket case should not use
>    g_strndup but g_memdup instead, since the whole thing
>    is a blob of the given length, not a \0-terminated string.
> ---
>  util/qemu-sockets.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..7c83d81792 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,13 +1345,20 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su = (struct sockaddr_un *)sa;
>
> -    assert(salen >= sizeof(su->sun_family) + 1 &&
> -           salen <= sizeof(struct sockaddr_un));
> +    /* there's a corner case when trailing \0 does not fit into
> +     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
> +     * not with sizeof(sockaddr_un), since this is what we actually
> +     * provide, to ensure we had no truncation and a room for
> +     * the trailing \0 which we add below.
> +     * When salen == sizeof(sun_family) it is unnamed socket,
> +     * and when first byte of sun_path is \0, it is abstract. */
> +    assert(salen >= sizeof(su->sun_family) &&
> +           salen <= sizeof(struct sockaddr_storage));

Again, why are we asserting an upper bound? We don't care here:
the representation in the SocketAddress structure has no length
limit on the path. (Conversely, we do care about the max length
when we convert from a SocketAddress to a sockaddr_un: we do this
in eg unix_connect_saddr().)

>      addr = g_new0(SocketAddress, 1);
>      addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>  #ifdef CONFIG_LINUX
> -    if (!su->sun_path[0]) {
> +    if (salen > sizeof(su->sun_family) && !su->sun_path[0]) {
>          /* Linux abstract socket */
>          addr->u.q_unix.path = g_strndup(su->sun_path + 1,
>                                          salen - sizeof(su->sun_family) - 1);
> @@ -1363,7 +1370,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>      }
>  #endif
>
> -    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
> +    addr->u.q_unix.path = g_strndup(su->sun_path, salen - sizeof(su->sun_family));
>      return addr;
>  }

-- PMM

