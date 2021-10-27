Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041A243CCEF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:03:09 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkSK-0008Ie-2J
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mfjmb-0000sP-1Z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:20:01 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mfjmX-0005HD-UK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:20:00 -0400
Received: by mail-lj1-x22c.google.com with SMTP id n7so4980633ljp.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GotKWnUo/ZJmrfoB05cYT7DbhAYrAPpzP1P8I/T5lCU=;
 b=crKYhL0yQ2IL03Mx1V54TLrR+eyZNnXM+3sL+pZeCpMvSeE57+t4nBrIdWZbmhP+St
 LIsYRQJzK9NTc6/vDJycVOVS26YBhhwGP3TuhJw/iVMN2f+pWfeFmPIGRyMJfQq1Kzhu
 h4m4QoE5ySswpoecstTaX4jOYksoFRj+xPjjKH6KMqy1czHQePnDlQ/aroLJis6G99oD
 91Sh7aAF4yVREzwb41PCYtyKkgtgqbNJ7mqvRWoL74eaKlsyopH/mtDYZ0npmRn+gqtF
 yPBfTLLanl6OIAN5Snco99RdJnl5EHZUCjKHUkrVF5Qe+akj+/mHb23lD+hWzLrttHFZ
 kXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GotKWnUo/ZJmrfoB05cYT7DbhAYrAPpzP1P8I/T5lCU=;
 b=g2QutCneqj5+DAm/6WFnAB0iPL/8ELbhtr53KqEYdyklLgQ7QbY+elzCeK4sw95KzI
 BCf/sYXXwfXazgupKOFsYCAKCtV651TZNPMxPiMMe/Z5gWYD3HIUd5ZzN2qJ8efEw0ud
 kbyBuXqQpfHGoa7oAaa8fMoaUkqpZvAj4UmeMBb91wEwRfsyKPK9F7vN6UE/FwDIY6x9
 4aBejUcHTBpyId9paMWVmVCxB7p2ncx7p32VYbvgYo5ebHAlimBE+ZNVfONUkOvKE/3T
 SjLCZl8A8M0EgDqFo3T0A25iMLU7qkj/q7VaUA/jdtBT3wom/JvA4yor5kDESDuFpx/D
 C4Qw==
X-Gm-Message-State: AOAM532/8dBUp0szE6ie6SEh1nFLVlw6Mls3xdbixcO6xr0bfUCbOBlR
 q+rYSq2dgDp4AW0IZG7w90mTfODB7+E++340Jhs=
X-Google-Smtp-Source: ABdhPJw0WOZuldU+5z//4gGGOVM6O9a3HIr3m9CnhtrTGaSIntxe2kjUuUSOYBNTI9hbA6M8gqN0I0XQlitTnDTdSK0=
X-Received: by 2002:a2e:553:: with SMTP id 80mr5514433ljf.459.1635344394235;
 Wed, 27 Oct 2021 07:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211027074542.2607865-1-imammedo@redhat.com>
 <20211027042734-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211027042734-mutt-send-email-mst@kernel.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 27 Oct 2021 10:19:42 -0400
Message-ID: <CAKf6xpvjZSD1p8dqa9G+mSNzXGj2_H=q-a3tSY9U7jhxfSBkuw@mail.gmail.com>
Subject: Re: [PATCH] qtest: fix 'expression is always false' build failure in
 qtest_has_accel()
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=jandryuk@gmail.com; helo=mail-lj1-x22c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 4:34 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Oct 27, 2021 at 03:45:42AM -0400, Igor Mammedov wrote:
> > If KVM is disabled or not present, qtest library build
> > may fail with:
> >    libqtest.c: In function 'qtest_has_accel':
> >       comparison of unsigned expression < 0 is always false
> >       [-Werror=type-limits]
> >          for (i = 0; i < ARRAY_SIZE(targets); i++) {
> >
> > due to empty 'targets' array.
> > Fix it by compiling KVM related part only if
> > CONFIG_KVM_TARGETS is set.
> >
> > Fixes: e741aff0f43343 ("tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator")
> > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
>
> > ---
> >  tests/qtest/libqtest.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 25aeea385b..9833e16f84 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -931,6 +931,7 @@ bool qtest_has_accel(const char *accel_name)
> >          return false;
> >  #endif
> >      } else if (g_str_equal(accel_name, "kvm")) {
> > +#if defined(CONFIG_KVM_TARGETS)
>
> Ugh.
>         const char *targets[] = { CONFIG_KVM_TARGETS };
>
> are you use CONFIG_KVM_TARGETS is not defined?
>
> Looks like it's defined, just empty.
>
> which is not standard C BTW.
>
> How about we just add an empty string in meson?
>
> diff --git a/meson.build b/meson.build
> index 2c5b53cbe2..ff85e9c2af 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -75,7 +75,7 @@ else
>    kvm_targets = []
>  endif
>
> -kvm_targets_c = ''
> +kvm_targets_c = '""'
>  if not get_option('kvm').disabled() and targetos == 'linux'
>    kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
>  endif

This allows Debian buster (gcc 8.3.0) to compile.

Thanks,
Jason

