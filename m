Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A722FA901
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:39:37 +0100 (CET)
Received: from localhost ([::1]:36296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ZRA-00049p-KB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1ZOJ-0003IV-Rl
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:36:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1ZOG-0000mM-Su
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610994995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/4Z8ksDdzgzwMNda3AD8iRvIUu9aWyblqa3Fya88a0=;
 b=V9HTuDEZbwtm3MLQdDFsouMydRSM08D6tyMpHC3z6S92GSLmgEK4WuGVIV/kumgCszegGT
 AbEI6jD0cZ61pysc646GVcBlsx/t4po+i5L0lUlpy85UuY3/9PHDmsblVfbMdzeFujZh+P
 aTkcZu095KKhGsf6R477lxlQ8LSW+cw=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102--t6SgvTrMCSIZDVoZNdZKA-1; Mon, 18 Jan 2021 13:36:33 -0500
X-MC-Unique: -t6SgvTrMCSIZDVoZNdZKA-1
Received: by mail-oo1-f72.google.com with SMTP id p13so14007767oos.14
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 10:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/4Z8ksDdzgzwMNda3AD8iRvIUu9aWyblqa3Fya88a0=;
 b=k79C+ly2mgnMameiYvBwScBJyXXtnL9Q81yRwrgVpyXJy2jw/A4Ay3zzIBqxSjY3Wp
 R/4xvU48iRkpmReLgW0T2VtNG8K7Ga3CZY/TWowQYAHxHraxo+Xlsa6RlvmGM2HXj/vd
 YKgqS4iAWehpMU/vSc6cfC+BienjgAhWmws/6kSSiuwQuY2h8+Jgok40iG0KlXZ2CJnB
 2OmrXdceGd/C6AbgCHbcrclGaOa8lfWCdsujPeZvPb7xt4Pz8R/BVfUwXPifYAZZedyg
 iSQ3b4TXgTctQB10Eaqh6enCaFt67PUCAgbhopKKtIgTa8py1Uiw5uBn2vm0uCpxpTMJ
 A2sQ==
X-Gm-Message-State: AOAM531qIcichPPRuvqg05KyAYHvOdjYsxVNuNtqutGLSuEvVg3LNzc7
 m+SNEFOtjss5k/u/l6n8yPt3+I7T5I7yuZmYxSFfacwtySRt1AhCLXtwy3kV4eW4T5KMtFiX231
 BxHEy00cpty71blok7T7vR+MBD5ocZX0=
X-Received: by 2002:a54:4391:: with SMTP id u17mr441697oiv.30.1610994993188;
 Mon, 18 Jan 2021 10:36:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1wW/YJctOr6G0G5i/uBOxopL6TPCgpCyEAv0hRWAwhKVyVOjDQtvCc+rOe9TFsei7NmncP7f42lvhNHDlwFU=
X-Received: by 2002:a54:4391:: with SMTP id u17mr441683oiv.30.1610994993019;
 Mon, 18 Jan 2021 10:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-6-alex.bennee@linaro.org>
In-Reply-To: <20210115130828.23968-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 18 Jan 2021 19:36:22 +0100
Message-ID: <CAP+75-XSyx2yCpz5uvx2ZofCGY=9pQ88ffSDRSXVjJk48qXNFw@mail.gmail.com>
Subject: Re: [PULL 05/30] Makefile: wrap ctags in quiet-command calls
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Fri, Jan 15, 2021 at 2:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> For prettier output.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20210114165730.31607-6-alex.bennee@linaro.org>
>
> diff --git a/Makefile b/Makefile
> index 0c509a7704..bbab640b31 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -250,8 +250,13 @@ find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_P=
ATH)/meson" -prune -o \( -name
>
>  .PHONY: ctags
>  ctags:
> -       rm -f "$(SRC_PATH)/"tags
> -       $(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
> +       $(call quiet-command,                   \
> +               rm -f "$(SRC_PATH)/"tags,       \
> +               "CTAGS", "Remove old tags")
> +       $(call quiet-command, \
> +               $(find-src-path) -exec ctags            \
> +               -f "$(SRC_PATH)/"tags --append {} +,    \
> +               "CTAGS", "Re-index $(SRC_PATH)")
>
>  .PHONY: gtags
>  gtags:
> --
> 2.20.1
>

Build now fails if ctags is not installed:

$ if test -n "$MAKE_CHECK_ARGS"; then make -j"$JOBS" $MAKE_CHECK_ARGS ; fi
CTAGS Remove old tags
CTAGS Re-index /builds/philmd/qemu
find: 'ctags': No such file or directory
find: 'ctags': No such file or directory
find: 'ctags': No such file or directory
make: *** [Makefile:254: ctags] Error 1
make: *** Waiting for unfinished jobs....


