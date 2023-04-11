Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141B6DDBB4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:05:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDgM-0003iP-4p; Tue, 11 Apr 2023 09:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmDg8-0003hy-Ik
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:04:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmDg5-0008Bm-Nh
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:04:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so748187wms.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681218292; x=1683810292;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VsLOycAHyGZoxoPqUjjK9qLhajHi2nxfZLNUeNazbU=;
 b=gbOmLCmuIScS2z0LOiNoMXkdN/CaFp4IOGreYjmCp5ohvxd0PukiO+daoaxEFYV2T1
 OfTngPbS1qJFuFJGbm3AdX0FAUT8fxeMh3WXxh/ylVEw61l68O5hnUkHeAIzSgUzpUkL
 rB49yTD0m1dhutmYCuQrZCsCLlg7oYsFLFcfi9b0cDxXUTMEAKMfq0516UmqA9tTOK1e
 LMoE7/ro3o5FNhnnvzbWnsuEF5cvJwtflCZb6pTRvoxsBkUXx10hKEWUZgVmxinKFR6H
 2nEz+LtiJE/Q8IcREWEXUIBfaYX6WGxlTkRBpv1cCB7C1iGAOtZItjBjOrOncZC/XWhH
 Qv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681218292; x=1683810292;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+VsLOycAHyGZoxoPqUjjK9qLhajHi2nxfZLNUeNazbU=;
 b=vx+lGVOvRi5meh9tUfJYRlLolGy6GazaA27oCr01v/HxT5QpNQC1jKmcextKL0Dfe+
 I4vR9mhcGpTHbKe1hJDXJZq6hb2fLuZXuT7J3xo0peJft2oNrIDrcv81dXeCRFJ+as/B
 WKsYCcw2geI+eiOrMv7N2Zomzyk1JC76okGO/0PE9sTvVQyeTskcUVViFoUupLYJ4wy3
 L6SYdvmJlSh7QXvHQnOZavUc943Y99KPJYUHA7uuAtdQlly0HuPwkt6YIz559VDQuCCo
 s+yw1AgevvICapFcrautL2IdQJySiv7B9VRBi3qEUJEy5o9HmZC5K0es1it22VN4D1RJ
 JFtw==
X-Gm-Message-State: AAQBX9e3vyU/fHZy1vtYm4/+YLBOR/CZsDOsqsCRvjaH1FO5/jagwZe6
 f4V67bDnz7ksyNHkkGMiFkxBAQ==
X-Google-Smtp-Source: AKy350bSzYQKI+JiwlucbWXfDBB89IiLUayKbfhkAVFYgHvUcugimzW1q0J4r7UlrQ2tGjrcMEevpA==
X-Received: by 2002:a7b:c5c2:0:b0:3ed:c84c:7efe with SMTP id
 n2-20020a7bc5c2000000b003edc84c7efemr9597516wmk.7.1681218292069; 
 Tue, 11 Apr 2023 06:04:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05600c475000b003f092f0e0a0sm2037796wmo.3.2023.04.11.06.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 06:04:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 075CE1FFB7;
 Tue, 11 Apr 2023 14:04:51 +0100 (BST)
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
 <20230403134920.2132362-6-alex.bennee@linaro.org>
 <ZCwsvaxRzx4bzbXo@redhat.com>
 <cbb3df0a-7714-cbc0-efda-45f1d608e988@msgid.tls.msk.ru>
 <ZCxNqb9tEO24KaxX@redhat.com> <ZC8qXxB6X8t7RBa+@gorilla.13thmonkey.org>
 <ZDVN9TlzrCOJHlDR@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Reinoud Zandijk <reinoud@netbsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Ryo ONODERA
 <ryoon@netbsd.org>, qemu-block@nongnu.org, Hanna Reitz
 <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>, Beraldo Leal
 <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle Evans
 <kevans@freebsd.org>, kvm@vger.kernel.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>, Thomas Huth
 <thuth@redhat.com>, armbru@redhat.com
Subject: Re: [PATCH v2 05/11] qemu-options: finesse the recommendations
 around -blockdev
Date: Tue, 11 Apr 2023 14:03:36 +0100
In-reply-to: <ZDVN9TlzrCOJHlDR@redhat.com>
Message-ID: <87o7nupo25.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Kevin Wolf <kwolf@redhat.com> writes:

> Am 06.04.2023 um 22:23 hat Reinoud Zandijk geschrieben:
>> On Tue, Apr 04, 2023 at 06:17:45PM +0200, Kevin Wolf wrote:
>> > Am 04.04.2023 um 17:07 hat Michael Tokarev geschrieben:
>> > > 04.04.2023 16:57, Kevin Wolf =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> > Maybe -snapshot should error out if -blockdev is in use. You'd general=
ly
>> > expect that either -blockdev is used primarily and snapshots are done
>> > externally (if the command line is generated by some management tool),
>> > or that -drive is used consistently (by a human who likes the
>> > convenience). In both cases, we wouldn't hit the error path.
>> >=20
>> > There may be some exceptional cases where you have both -drive and
>> > -blockdev (maybe because a human users needs more control for one
>> > specific disk). This is the case where you can get a nasty surprise and
>> > that would error out. If you legitimately want the -drive images
>> > snapshotted, but not the -blockdev ones, you can still use individual
>> > '-drive snapshot=3Don' options instead of the global '-snapshot' (and =
the
>> > error message should mention this).
>>=20
>> I didn't know that! I normally use the -snapshot as global option. Is th=
ere a
>> reason why -blockdev isn't honouring -snapshot?
>
> The philosophy behind -blockdev is that you're explicit about every
> image file (and other block node) you want to use and that QEMU doesn't
> magically insert or change things behind your back.
>
> For simple use cases that might not seem necessary, but many of the
> newer functions added to the block layer, like the block jobs, are
> operations that can work on any node in the block graph (i.e. any of the
> open images, including backing files etc.). If QEMU changed something
> behind your back, you can easily access the wrong image. Especially for
> management software like libvirt this kind of magic that -drive involves
> was really hard to work with because it always had to second guess what
> the world _really_ looked like on the QEMU side.
>
> For example, imagine you open foo.img with -snapshot. Now you want to
> create a backup of your current state, so tell QEMU to backup the block
> node for foo.img because that's what your VM is currently running on,
> right? Except that nobody told you that the active image is actually a
> temporary qcow2 image file that -snapshot created internally. You're
> backing up the wrong image without the changes of your running VM.
>
> So it's better to always be explicit, and then it's unambiguous which
> image file you really mean in operations.

With that in mind please review:

  Subject: [PATCH v3] qemu-options: finesse the recommendations around -blo=
ckdev
  Date: Thu,  6 Apr 2023 10:53:17 +0100
  Message-Id: <20230406095317.3321318-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

