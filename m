Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284253DF7C0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 00:22:17 +0200 (CEST)
Received: from localhost ([::1]:36558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB2ng-00008W-8b
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 18:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mB2mi-0007YU-B5
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 18:21:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mB2mg-0002Su-HY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 18:21:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id k4so63155wms.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 15:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CRdVSS3A+3Q2MtQzH0iaT4eaGYum71TlZOCwYf+dsII=;
 b=Of5MiVceyg2aXheFCqcHYSHvJUgIoCi8a6n++zFzg8ui1MeS452KRTzEMW6x2uMd2e
 Es3ggzOFjKq48tCbtslU4v/wcNmi42YBP6FXOfIxNRhFS6PNxjEblD81Tj9ovQb1UA6S
 IKqMB/hwPpV6vo90rUraoi28NX710Ad/eGYfV5HmyGl2eIGP18KYvSOyvuW7u+2F2gAd
 djlsyt8fnTuzpV7UZNeMrC9pE3z0L4hjCXmrpBnnqTGeCHje9w7kWxsK98BV/ZBfNCsx
 +pUWng//N7kpW3siEyJyUTRJi2eeaDfKCoTSbLr6/hVVtxRYKYelIpeeo+owQVwNj7HN
 lmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CRdVSS3A+3Q2MtQzH0iaT4eaGYum71TlZOCwYf+dsII=;
 b=WKEjvVpIanK3tK08v2vvozr6BApUgIHOn+6zjxc5fIlDWMNYXjNvz8Nz0nkojAgZX+
 4HOQFY97Wedb3yKO59f7milBzx8TNsqAIVhD3b5DXdZjC8KQcKbSVPwjYBizmCjynz7T
 30M4YjxFFbExEyJLL/JuA5zChXo5g+GDIK6gtQaM1+TpiWHpyuHxwrqljkvdLhPy2Yzy
 hbMFH46h2TyMALSLAUeJeWGhsYW1b+S9NHP5wKS1wV/CNwCXxRgeBGaBadTdnDm/BnxW
 1nrjsB681KOC0vR4fwJxtXuN4wSxzE86m0nJeoDZulRF1KxfzFbIPHdugbU7MSaGYAx/
 1mag==
X-Gm-Message-State: AOAM531xSkOk3pG76HimCez4C75vo7MrfmOa/F6TMtKEYxq+/RjR27zL
 TfxKJDGFEL5ACBUQUksdid1uJDSkLuSaAIP2
X-Google-Smtp-Source: ABdhPJyCFALZzunCqgKRs+Mvcf8TECnyWjCC4/EflZd246T2v7+5msEuPXHC3A7fga3S4Svk4I+qJQ==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr24652066wmr.134.1628029272034; 
 Tue, 03 Aug 2021 15:21:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm200820wrx.73.2021.08.03.15.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 15:21:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DD921FF96;
 Tue,  3 Aug 2021 23:21:10 +0100 (BST)
References: <20210801171144.60412-1-peterx@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] Makefile: Fix cscope issues on MacOS and soft links
Date: Tue, 03 Aug 2021 23:18:36 +0100
In-reply-to: <20210801171144.60412-1-peterx@redhat.com>
Message-ID: <87a6lyf9ux.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Xu <peterx@redhat.com> writes:

> This patch fixes actually two issues with 'make cscope'.
>
> Firstly, it fixes the command for MacOS "find" command as MacOS will appe=
nd the
> full path of "$(SRC_PATH)/" before each found entry, then after the final=
 "./"
> replacement trick it'll look like (e.g., "qapi/qmp-dispatch.c"):
>
>   /qapi/qmp-dispatch.c
>
> Which will point to the root directory instead.
>
> Fix it by simply remove the "/" in "$(SRC_PATH)/" of "find-src-path", then
> it'll work for at least both Linux and MacOS.
>
> The other OS-independent issue is to start proactively ignoring soft link=
s when
> generating tags, otherwise by default on master branch we'll see this err=
or
> when "make cscope":
>
> cscope: cannot find file subprojects/libvhost-user/include/atomic.h
>
> This patch should fix the two issues altogether.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 401c623a65..5562a9b464 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -229,7 +229,8 @@ distclean: clean
>  	rm -f linux-headers/asm
>  	rm -Rf .sdk
>=20=20
> -find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -=
o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
> +find-src-path =3D find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune -o=
 \
> +	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)

The second half of the change causes my "make gtags" to descend down
build directories and complain about unindexed files.

>  .PHONY: ctags
>  ctags:


--=20
Alex Benn=C3=A9e

