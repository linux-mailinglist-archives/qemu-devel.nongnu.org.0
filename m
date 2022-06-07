Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309EF541F3E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:58:05 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi9E-0003Pm-93
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nygGd-0006lY-6W
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nygGa-00033h-2l
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654635449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJQtP4Azi/1Q3vHpZxu0O6w8LauQtD7NY5/t1oKbQlk=;
 b=QDZQhYi4wSnNhCtUt48a177j84BG9IOOK5As1LranBv7y9AaGj6i68KexkWxLmcy2syMgq
 p0PUl+neRGaw0dpuUBTPy4XjLLMTVsNYhiZvTfQ0A761rLkC17ixahdjNsmTaKhCpl1Oik
 ffg/xTM3+Cqc0uBfouSEed6Oh0CFJqk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-e5tS21xDOja2pQfms3IXDQ-1; Tue, 07 Jun 2022 16:57:28 -0400
X-MC-Unique: e5tS21xDOja2pQfms3IXDQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 bb37-20020a05680816a500b0032e8964db0fso4875605oib.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sJQtP4Azi/1Q3vHpZxu0O6w8LauQtD7NY5/t1oKbQlk=;
 b=tYTzPvAT5eRUndhNTRdB3D8eX9Vy4lYAptB+Sd4hd3xBpYn7ZguDq8LCRVoZPsHiuT
 AfL4c2/2yjT1urlT3MGCP8fRDI0Nbm1lkubqGh8Lcohlk6IRInQmr9syPIKWYjfO2Lca
 qOMKK2TpqPr1VA+ZVGfuLxGWs9334OvZUVbsH2oVo2uvyIoXZage9KfFommV4wJGp84T
 2NcYxbNh+2Bt/NxNzcnZQF03YCwc6rV4lulpXUoDDP78vi5wFdFCf2L2UoJc+ZvF52DL
 3ouBoH3SoObP6xx08aERwcVrxCe3FPoQOlzgQGYsjIOl3OufeYrDm8LZhEMg/lpkgTIh
 pQ+w==
X-Gm-Message-State: AOAM530W9lYEsrNq8QEwnVa9vizRFwfLX3X3DNOkQBnIJsLEgw4ssvRT
 1WWKbEhfdYeoggpISpXRNfTYBGZrqXh51468cHaqpVPwPDa8Y1Dm9eoMSBXDOBmg50xRpMlQNSL
 urAOGjKwAoO0a0F68kZ0o8Nl4oqY/rBg=
X-Received: by 2002:a05:6808:3021:b0:2f7:4c5b:2783 with SMTP id
 ay33-20020a056808302100b002f74c5b2783mr486281oib.53.1654635447695; 
 Tue, 07 Jun 2022 13:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykLsMXACA4nd43JtktoxSqVypnEzNZUFU5MbZjnOfBDgIUADfmmflKHlHLyCKuAAkgArRoSYmBCNg35FYM/iE=
X-Received: by 2002:a05:6808:3021:b0:2f7:4c5b:2783 with SMTP id
 ay33-20020a056808302100b002f74c5b2783mr486270oib.53.1654635447461; Tue, 07
 Jun 2022 13:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <d2847516-b923-5301-f20f-8d4704a41b2c@redhat.com>
In-Reply-To: <d2847516-b923-5301-f20f-8d4704a41b2c@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Jun 2022 00:57:16 +0400
Message-ID: <CAMxuvaxs1Aa5Pxw39YB-QM7q5_FcL6_3Q6O=AZiXFefWf3rZbQ@mail.gmail.com>
Subject: Re: dbus-display-test is flakey
To: Cole Robinson <crobinso@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cole,


On Sun, Jun 5, 2022 at 6:46 PM Cole Robinson <crobinso@redhat.com> wrote:
>
> Hi Marc-Andr=C3=A9,
>
> dbus-display-test seems flakey. I'm occasionally seeing:
>
> =E2=96=B6 692/746
> ERROR:../tests/qtest/dbus-display-test.c:68:test_dbus_display_vm:
> assertion failed
> (qemu_dbus_display1_vm_get_name(QEMU_DBUS_DISPLAY1_VM(vm)) =3D=3D
> "dbus-test"): (NULL =3D=3D "dbus-test") ERROR
>

Quite an interesting error. The generated dbus proxy code is all
gobject async init, but the proxy is created synchronously with
qemu_dbus_display1_vm_proxy_new_sync(), and all cached properties must
have been set at construction time.

And nobody else reported this issue so far, but I also noticed that it
does not seem to be covered by the CI at this point (only centos has
--enabled-modules, but is missing the glib 2.64 requirements)

> Examples:
>
> fedora rawhide x86_64:
> https://kojipkgs.fedoraproject.org//work/tasks/4945/87834945/build.log
> fedora rawhide aarch64:
> https://kojipkgs.fedoraproject.org//work/tasks/4946/87834946/build.log
> fedora 35 x86_64:
> https://download.copr.fedorainfracloud.org/results/@virtmaint-sig/virt-pr=
eview/fedora-35-x86_64/04491978-qemu/builder-live.log.gz
>

Are you able to reproduce outside koji? I have been running the test
in a loop for a long while, not seeing any error.

> This is qemu v7.0.0 with some unrelated patches on top. /usr/bin/make -O
> -j5 V=3D1 VERBOSE=3D1 check
>
> Side question: I know I can patch meson.build to skip the test, or
> similar patch changes, but is there a non-patch way to skip specific test=
s?

"meson test" currently supports specifying the tests or subproject to
run, or using --suite / --no-suite SUITE.

(mtest2make.py creates convenience check-SUITE rules)

We could probably add a suite "dbus", and add the test(s) there, so
you could run "meson test --no-suite dbus".


