Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67D66BD89
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:13:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOLe-0001JC-NN; Mon, 16 Jan 2023 07:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHOLZ-0001Ii-Dh
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:12:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHOLX-000892-4G
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:12:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id d2so7156347wrp.8
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uf6LjhDqDKx6NclMh3AJ4ZeTdyJ7OXCozbEMCRKDjpA=;
 b=ETkDa2ET0RGebXiEvSj1rPIA1cedqghhjPJjPJQEeFbbxO14Kq8a/PTaZ3FRcmrhkv
 nsK3oAPjJqWioMse493YuBSaB+DdKvif8LK5LbmsQoAYwGYjt1apUaK+dBopKEdDlOOq
 8voqOBmWyX3uwWBZtO85v6Dk7+BroaLidSSuJfV/X64NG9nB76zGu8sr4IlDeTaEPy6M
 M4BDNzEy+kbw7q7oHRq/c05g8CC0dOAryuQl4zR6n3vs8eWQdilgXwIYsafCt0smr5ZC
 kzPQbWLSPNcAfmMXK5jlFCNSRkVjF5t5XIJj4Kb6m/VkBWA5EyXedzltMcuiDwGQ9yOI
 Ldkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uf6LjhDqDKx6NclMh3AJ4ZeTdyJ7OXCozbEMCRKDjpA=;
 b=iaQRXzTJDFQAmqGKERofxsec8UokKbp5bq7O7OLVrVnux/ofru7MQqUtSktrMg8hZG
 wvifhoYBftbzAyRWCe4LR7R+DeOaVfpWVf3GJt6fSGzcaCaf8Bo7a/xxoaMU/xlCNoB+
 MY8BZaiFHr0Osppktf4DEDp19XBWW4HXFNIkWTyR/5VurGLqj/ihVJfcAxiUDKN86cUs
 SVOyG4czHIJmYdFRFMqoCLetCBNj1w0ZXlCLIfAWcG28XiqxnTrb4U311FTnEqkrsR9P
 /pHLCaVeERk1SfXcSDFrq86cg4MOw5luJUpLqDU0mEoPw4E89A4FklorxDT5NzaIE4iB
 T/kg==
X-Gm-Message-State: AFqh2koE4LIhVZgdOIAx2/ZCgsGcWuB7KIYx4H96uoABBfbg62fQH0hJ
 s43fX3Oy7UtKMCQkfvf4aLw+Wg==
X-Google-Smtp-Source: AMrXdXvFmzT8EXvxmVYwVWsKzHvrSsshcQm9YJFLh8l5VxKSH1DHAiSs6kcknUQXaCzgAWLdIyNDMA==
X-Received: by 2002:adf:ffc3:0:b0:2bb:ede4:5dd4 with SMTP id
 x3-20020adfffc3000000b002bbede45dd4mr8372832wrs.34.1673871132354; 
 Mon, 16 Jan 2023 04:12:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d62c7000000b002bbeda3809csm20320714wrv.11.2023.01.16.04.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:12:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6995E1FFB7;
 Mon, 16 Jan 2023 12:12:10 +0000 (GMT)
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-9-marcandre.lureau@redhat.com>
 <87bkmyvljj.fsf@linaro.org> <Y8Uq6sEL813/Suu+@redhat.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, John Snow
 <jsnow@redhat.com>, kraxel@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric
 Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 thuth@redhat.com, Halil Pasic <pasic@linux.ibm.com>, Michael Roth
 <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 8/8] lcitool: drop texinfo from QEMU
 project/dependencies
Date: Mon, 16 Jan 2023 12:09:48 +0000
In-reply-to: <Y8Uq6sEL813/Suu+@redhat.com>
Message-ID: <87sfgael0l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jan 16, 2023 at 10:06:07AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> marcandre.lureau@redhat.com writes:
>>=20
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>=20
>> I'm not sure how but this is re-breaking the windows build you just fixe=
d:
>>=20
>>   In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include/e=
poxy/egl.h:46,
>>                    from /tmp/qemu-test/src/include/ui/egl-helpers.h:5,
>>                    from /tmp/qemu-test/src/include/ui/gtk.h:25,
>>                    from ../src/ui/gtk.c:42:
>>   /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:1=
1:10: fatal error: EGL/eglplatform.h: No such file or directory
>>      11 | #include "EGL/eglplatform.h"
>>         |          ^~~~~~~~~~~~~~~~~~~
>>   compilation terminated.
>>=20
>> I'm going to drop this patch for now.
>
> We don't include mingw*-epoxy in the QEMU container, and AFAIK
> nothing else we install has it as a dependency, so I'm guessing
> you must have done a build locally rather than with our windows
> containers ?

No I was building with the container but weirdly I am seeing different
results on different machines:

 make docker-test-mingw@fedora-win64-cross J=3D9 V=3D1

works on my desktop

 make docker-test-mingw@fedora-win64-cross V=3D1 J=3D20

fails on my build box. This must be some sort of weird caching behaviour
but I was trying to track down the failures in CI:


>
> Ultimately this is a RPM packaging bug, which was recently fixed
> in Fedora
>
> commit 1e748f66e067d9332bc02f1ea994b6dd3b5e47f3 (HEAD -> f37,
> origin/rawhide, origin/main, origin/f37, origin/HEAD, rawhide)
> Author: Kalev Lember <klember@redhat.com>
> Date:   Fri Jan 13 14:36:35 2023 +0100
>
>     Add missing runtime requires on mingw-angleproject
>=20=20=20=20=20
>     This fixes gtk cross compilation in upstream CI that started to fail
>     with:
>=20=20=20=20=20
>     /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:=
11:10:
> fatal error: EGL/eglplatform.h: No such file or directory
>
>
> So you should be able to just 'dnf update' to fix this.
>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

