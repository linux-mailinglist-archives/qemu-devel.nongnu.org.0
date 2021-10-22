Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E24377A8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:06:38 +0200 (CEST)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduFp-0001rJ-2U
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mduEG-0001Au-6l
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:05:00 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mduED-0003YK-V1
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:04:59 -0400
Received: by mail-lj1-x232.google.com with SMTP id 145so752764ljj.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RXt8hhAYWxQh1kmleSCyU9pIys2a2G0UnLjoKfjXD1Q=;
 b=CR9BvkvpXPazH3PQcRf5t4USOFFV86W+sU4H7sAAl/WxoX7ogQqE4KNHa0UmrG6lEL
 7GPJHDxeYF6pd3PDdWJLmOYicgq2CcqxT4lmkhj38gWi2WDY1NP+GbV6KoebeGzDBiLx
 wMXoqqiYzxPw+SThGwRqnFsyJ3Q4yYMLyhUdQV7luv1JeL6oEsUpTMEfhbheEVsLbKyn
 4KUy5SXy8kgxTTXseHxPlYWXkht6GPqinGbXr9WsWsX6JRw3ieiuEVRDaHhExFCnqRrc
 zE6Rmi9e0OK2OslHGFRXoW0EvSfm6p0YFf/YuTCDRmZX7/RCpd55TrhApWO3FjtOcC/u
 06zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RXt8hhAYWxQh1kmleSCyU9pIys2a2G0UnLjoKfjXD1Q=;
 b=UPZ48eGav7+XajODogvgxj8E8djLFwEA17E9gcfz3QPsAli4Aez1Eav+F2cWEdTaRX
 xp+tXFNbm1Pl4MTlkqtOklppBbtLyRDCqgTqUa+aFmHjDHZlf3hl13vwWg/LoqJLvt4H
 bVy6oq0I8tVsoNdrqoQwMk+VrPAfCPbEqEqoKrnBIqUVV6GEmh9/MLeE2ztptSroN/cQ
 Ur+AFuk4oNCYbMquytLOZ4UYBC1WQsfiCLGJLFNhGUvoQficjaEOvtwI+g2VFoN8SGgH
 9efCvH+I5Clhtz5L01ihw0a4q2QxdCfQqbGje+EfNLtRtYq3LDdIpDl1kIsaMIwLzbpv
 Xkxg==
X-Gm-Message-State: AOAM531QYSwKwMwYvu80V2v+RNALn3ML/wyMjF5XoM7uEenE8Rn6TgkA
 TFFQDA/2rnnT2Ih+GbrldFN/z/NOp7NkoIhDDlQ=
X-Google-Smtp-Source: ABdhPJwxtap0TNQcV5tq/4/FiQqDSfGbNDKLNRv0qwHY4MtRvtQZoALOI3wvZ4nRepT5QFXJGSkWWk8nqjEtDPuOkfE=
X-Received: by 2002:a2e:9d48:: with SMTP id y8mr13093468ljj.19.1634907895222; 
 Fri, 22 Oct 2021 06:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211020101844.988480-1-mst@redhat.com>
 <20211020101844.988480-3-mst@redhat.com>
In-Reply-To: <20211020101844.988480-3-mst@redhat.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 22 Oct 2021 09:04:43 -0400
Message-ID: <CAKf6xpvZjvFMNOersS-dSxDOffNeOmhcL2y_36_xOnuPUsrEMQ@mail.gmail.com>
Subject: Re: [PULL v2 02/44] tests: qtest: add qtest_has_accel() to check if
 tested binary supports accelerator
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=jandryuk@gmail.com; helo=mail-lj1-x232.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 6:23 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Igor Mammedov <imammedo@redhat.com>
>
> Currently it is not possible to create tests that have KVM as a hard
> requirement on a host that doesn't support KVM for tested target
> binary (modulo going through the trouble of compiling out
> the offending test case).
>
> Following scenario makes test fail when it's run on non x86 host:
>   qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288
>
> This patch introduces qtest_has_accel() to let users check if accel is
> available in advance and avoid executing non run-able test-cases.
>
> It implements detection of TCG and KVM only, the rest could be
> added later on, when we actually start testing them in qtest.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  tests/qtest/libqos/libqtest.h |  8 ++++++++
>  tests/qtest/libqtest.c        | 27 +++++++++++++++++++++++++++
>  meson.build                   |  6 ++++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index a68dcd79d4..59e9271195 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -588,6 +588,14 @@ bool qtest_big_endian(QTestState *s);
>   */
>  const char *qtest_get_arch(void);
>
> +/**
> + * qtest_has_accel:
> + * @accel_name: Accelerator name to check for.
> + *
> + * Returns: true if the accelerator is built in.
> + */
> +bool qtest_has_accel(const char *accel_name);
> +
>  /**
>   * qtest_add_func:
>   * @str: Test case path.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 73f6b977a6..25aeea385b 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -922,6 +922,33 @@ const char *qtest_get_arch(void)
>      return end + 1;
>  }
>
> +bool qtest_has_accel(const char *accel_name)
> +{
> +    if (g_str_equal(accel_name, "tcg")) {
> +#if defined(CONFIG_TCG)
> +        return true;
> +#else
> +        return false;
> +#endif
> +    } else if (g_str_equal(accel_name, "kvm")) {
> +        int i;
> +        const char *arch = qtest_get_arch();
> +        const char *targets[] = { CONFIG_KVM_TARGETS };
> +
> +        for (i = 0; i < ARRAY_SIZE(targets); i++) {

A xen osstest build fails with:
../qemu-xen-dir-remote/tests/qtest/libqtest.c: In function 'qtest_has_accel':
../qemu-xen-dir-remote/tests/qtest/libqtest.c:938:23: error:
comparison of unsigned expression < 0 is always false
[-Werror=type-limits]
         for (i = 0; i < ARRAY_SIZE(targets); i++) {
                       ^

Super long osstest log
here:http://logs.test-lab.xenproject.org/osstest/logs/165703/build-i386-xsm/6.ts-xen-build.log

It was configured like:
$source/configure --enable-xen --target-list=i386-softmmu \
--enable-debug \
--enable-trace-backend=log \
--prefix=/usr/local \
--libdir=/usr/local/lib/xen/lib \
--includedir=/usr/local/lib/xen/include \
--extra-cflags="-DXC_WANT_COMPAT_EVTCHN_API=1 \
-DXC_WANT_COMPAT_GNTTAB_API=1 \
-DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
-DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
" \
--extra-ldflags="-Wl,-rpath,/usr/local/lib/xen/lib" \
--bindir=/usr/local/lib/xen/bin \
--datadir=/usr/local/share/qemu-xen \
--localstatedir=/var \
--docdir=/usr/local/lib/xen/share/doc \
--mandir=/usr/local/lib/xen/share/man \
--libexecdir=/usr/local/lib/xen/libexec \
--firmwarepath=/usr/local/lib/xen/share/qemu-firmware \
--disable-kvm \
--disable-docs \
--disable-guest-agent \
--python=python3 \
--cpu=i386 ;

--cpu=i386 may be important?  osstest is building in a 32bit debian
environment.  My 64bit fedora workstation fails to configure with
--cpu=i386, and it builds successfully without it.

Maybe add #if defined(CONFIG_KVM) around the code like CONFIG_TCG above?

Regards,
Jason

