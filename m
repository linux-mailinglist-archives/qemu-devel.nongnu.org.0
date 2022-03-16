Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563674DB3D1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:00:48 +0100 (CET)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUV8p-00022X-4i
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:00:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUV6I-0008Qp-Ee
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUV6H-00042R-1f
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647442688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPjEFpCeEz2mkvrpvTJI4rIdG8ZsV/OAF3vOO0hjG1c=;
 b=FdYhp6zDDdEe0UKGIlUespyTPTqisbStQMw+rHNhWc1wRhRm0rkAB4MPGwXNVcuX52FkXg
 VAMcGWcApoqgOVTzmPPCleHUKzW7kF4IpBOsKZ7xu5Zj8olMscKgsUDwnMiG022E3zSNoU
 B2PK6nKrqJBc0PWIqX48XMRY2fZtYC8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-UMUpq9XgMa6gF55F1pRJUw-1; Wed, 16 Mar 2022 10:58:07 -0400
X-MC-Unique: UMUpq9XgMa6gF55F1pRJUw-1
Received: by mail-yb1-f199.google.com with SMTP id
 y19-20020a25ad13000000b006336877f6d0so2149537ybi.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VPjEFpCeEz2mkvrpvTJI4rIdG8ZsV/OAF3vOO0hjG1c=;
 b=q2+wxFlpmzHMkpTl/pQiiPjtNfayKONPNjqprSB5nsF2imzjUY79JoFzeY0/0gqwCO
 bGo5L6mSodW943YnGI6qfuaj0boH4P2WTIyqpjJlKiHYkAgZJ4RDuaelSwy7iWmJgbJt
 GswvKFMCrKhaMkZMS2QF0YJjolxzWHT+1IebD25YHQ6cET2zpIvirYruq+BgbAAFDoqu
 eVCNqmpAhub3sdGcRluuzELYgsBz5NgPcOBv6WXKjIP0jiEqZiN8oT7iZKgu15IKBXi7
 GI1zHl3Sw7ofRCCYTKQz4tp1RufgAoGLyh4QNApZwt96n3fyiVzZKfo4ZCQksHslqwsQ
 +6OQ==
X-Gm-Message-State: AOAM531u7wStGZaezjobTusVCM/oI8Jqua4enDyO8FXip9dGQsS/zlQo
 0KUu6U7yqpM/Spq+2OOz8mnTYAwNG4YOCeYOhySdUsTSH/ON5wZI+LCgI7NGGuU0foY9d5D5xv6
 KlFiBoftXRfA1SXxulyoXzwHnI+tE5kY=
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id
 c1-20020a25af41000000b00633905f9e9bmr267000ybj.77.1647442686797; 
 Wed, 16 Mar 2022 07:58:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyclSIfCLkT16vhc/6n3C7D4jrTnP5QzD07d7tkHIoYj8QGkUlbGwoLoMa8R+abioTYAPxBW0ZAzjza1n1HoSQ=
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id
 c1-20020a25af41000000b00633905f9e9bmr266981ybj.77.1647442686602; Wed, 16 Mar
 2022 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095344.2613706-1-marcandre.lureau@redhat.com>
 <CAMxuvawM-Od_ED4mVoBt+VMYLOn_XEE1DxCKH9n-a4KCdRXSsw@mail.gmail.com>
 <20220316145445.wh6qy4qiybsbqmk6@sirius.home.kraxel.org>
In-Reply-To: <20220316145445.wh6qy4qiybsbqmk6@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 18:57:55 +0400
Message-ID: <CAMxuvaw5YZtC8cqBe6QtkJ3vaSc29yBfXx9hh9hXia4ymOD6kg@mail.gmail.com>
Subject: Fwd: Fwd: [PATCH 14/27] scripts/modinfo-collect: remove unused/dead
 code
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Hoffmann, Gerd" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---------- Forwarded message ---------
From: Hoffmann, Gerd <kraxel@redhat.com>
Date: Wed, Mar 16, 2022 at 6:54 PM
Subject: Re: Fwd: [PATCH 14/27] scripts/modinfo-collect: remove unused/dead=
 code
To: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


On Wed, Mar 16, 2022 at 06:33:03PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> Hi Gerd, can you ack?
>
> (get_maintainer.pl doesn't catch you here)

Looks ok, arg is never set to True.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

>
> thanks
>
> ---------- Forwarded message ---------
> From: <marcandre.lureau@redhat.com>
> Date: Wed, Mar 16, 2022 at 1:53 PM
> Subject: [PATCH 14/27] scripts/modinfo-collect: remove unused/dead code
> To: <qemu-devel@nongnu.org>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>, John Snow
> <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
>
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/modinfo-collect.py | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
> index 61b90688c6dc..4e7584df6676 100755
> --- a/scripts/modinfo-collect.py
> +++ b/scripts/modinfo-collect.py
> @@ -18,13 +18,8 @@ def find_command(src, target, compile_commands):
>
>  def process_command(src, command):
>      skip =3D False
> -    arg =3D False
>      out =3D []
>      for item in shlex.split(command):
> -        if arg:
> -            out.append(x)
> -            arg =3D False
> -            continue
>          if skip:
>              skip =3D False
>              continue
> --
> 2.35.1.273.ge6ebfd0e8cbb
>

--


