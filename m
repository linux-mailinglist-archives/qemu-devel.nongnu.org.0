Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F985F2EBA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:23:43 +0200 (CEST)
Received: from localhost ([::1]:48422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIbu-000113-Fj
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofISM-0004jI-9e
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofISI-0007CC-Uq
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664792025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDFE4hWKiGIoEWEycfYjOqCKF3pB1knVwiEANmltENM=;
 b=AS2KYSceKTwCxGfx5B2VrhC84o9GGVtIWdAR7bqRRRXbnXWfw9jmIhrHQUpXXgk/oKA1uA
 zBNQLw6Qt4GQc0zfmhtGH5ip0DxhMPKVy+D79Odz96XvDsZiZ5aBgb9GV9lMOJdoUQoYR8
 nyNwRqxZAJCo+yxKFf7ArhJxXVl/GZQ=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-U9UawYUtOC2itibCffPGMg-1; Mon, 03 Oct 2022 06:13:44 -0400
X-MC-Unique: U9UawYUtOC2itibCffPGMg-1
Received: by mail-oo1-f71.google.com with SMTP id
 n5-20020a4a3445000000b004728fe7a331so6036868oof.23
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 03:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QDFE4hWKiGIoEWEycfYjOqCKF3pB1knVwiEANmltENM=;
 b=r10BEM8fLyOVEbnxmRgddhghFgpFugZGqHc072C7aihy8KEMSFZn3To/tCMn8iI7Uw
 v/mNiGNIxyTmTdaTIZdyOpea2Qokgk9HC1rVeP24w/ePoheJylLibQ411qlkJlc5G3y9
 4ap4vza2SJPJ42rDBK/TkViUUpnQvjyVCoO2PNvdaS9zRp3fvE7UWZZxM5xSequISCp5
 jjvrQ06HgAaRZ66QxMtg+6n+lvon0uW5WIaHvJ8kkXtkPnAcvq3eWeHh777BLRvkwc3H
 mK9dA3hAMokzCcF7CFl0AoTSIpCOiwExp87Gzq8pshhbtAxekO3PvI6R6IExBfDA5Hwy
 kUXw==
X-Gm-Message-State: ACrzQf085NYNI24YF3JPlV1fDrXTx9SU6bPnzLZbuU3LC1ltAHNWZ/xv
 dPyfrEn86s94AtNmOjbR0VUz/odvlbdEfMmubCkEYlzQnLe5I+7AiLnNlq9jogrhwlt9h2hLKc3
 QAGXx2C0sBAebWyHALjPEjDW0G8ZLRfw=
X-Received: by 2002:a05:6830:b8d:b0:65f:22fb:be09 with SMTP id
 a13-20020a0568300b8d00b0065f22fbbe09mr3195090otv.38.1664792023926; 
 Mon, 03 Oct 2022 03:13:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Bs1/vfWX4SyahpaIPuRrZJTtmPCWurS4lydAvnO/KaJmhXWXxeghe062OJjyNijRdUutUZQBp+rGhVfcCKkU=
X-Received: by 2002:a05:6830:b8d:b0:65f:22fb:be09 with SMTP id
 a13-20020a0568300b8d00b0065f22fbbe09mr3195081otv.38.1664792023715; Mon, 03
 Oct 2022 03:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221003100612.596845-1-berrange@redhat.com>
In-Reply-To: <20221003100612.596845-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 3 Oct 2022 14:13:32 +0400
Message-ID: <CAMxuvax3KKWeYkD59ZeYWOa1-GqOdNxJLhHfxzPEmuRcLn8y4A@mail.gmail.com>
Subject: Re: [PATCH] net: improve error message for missing netdev backend
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Oct 3, 2022 at 2:06 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> The current message when using '-net user...' with SLIRP disabled at
> compile time is:
>
>   qemu-system-x86_64: -net user: Parameter 'type' expects a net backend t=
ype (maybe it is not compiled into this binary)
>
> An observation is that we're using the 'netdev->type' field here which
> is an enum value, produced after QAPI has converted from its string
> form.
>
> IOW, at this point in the code, we know that the user's specified
> type name was a valid network backend. The only possible scenario that
> can make the backend init function be NULL, is if support for that
> backend was disabled at build time. Given this, we don't need to caveat
> our error message with a 'maybe' hint, we can be totally explicit.
>
> The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> user friendly error message text. Since this is not used to set a
> specific QAPI error class, we can simply stop using this pre-formatted
> error text and provide something better.
>
> Thus the new message is:
>
>   qemu-system-x86_64: -net user: network backend 'user' is not compiled i=
nto this binary
>
> The case of passing 'hubport' for -net is also given a message reminding
> people they should have used -netdev/-nic instead, as this backend type
> is only valid for the modern syntax.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> NB, this does not make any difference to people who were relying on the
> QEMU built-in default hub that was created if you don't list any -net /
> -netdev / -nic argument, only those using explicit args.
>
>  net/net.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/net/net.c b/net/net.c
> index 2db160e063..8ddafacf13 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1036,19 +1036,23 @@ static int net_client_init1(const Netdev *netdev,=
 bool is_netdev, Error **errp)
>      if (is_netdev) {
>          if (netdev->type =3D=3D NET_CLIENT_DRIVER_NIC ||
>              !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a netdev backend type");
> +            error_setg(errp, "network backend '%s' is not compiled into =
this binary",
> +                       NetClientDriver_str(netdev->type));
>              return -1;
>          }
>      } else {
>          if (netdev->type =3D=3D NET_CLIENT_DRIVER_NONE) {
>              return 0; /* nothing to do */
>          }
> -        if (netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT ||
> -            !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a net backend type (maybe it is not compiled "
> -                       "into this binary)");
> +        if (netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT) {
> +            error_setg(errp, "network backend '%s' is only supported wit=
h -netdev/-nic",
> +                       NetClientDriver_str(netdev->type));
> +            return -1;
> +        }
> +
> +        if (!net_client_init_fun[netdev->type]) {
> +            error_setg(errp, "network backend '%s' is not compiled into =
this binary",
> +                       NetClientDriver_str(netdev->type));
>              return -1;
>          }
>
> --
> 2.37.3
>


