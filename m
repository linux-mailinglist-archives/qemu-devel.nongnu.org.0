Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C83570C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:48:37 +0200 (CEST)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0Kb-0006Gu-4Z
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0J2-0004qj-NM
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0J0-0005HD-Dj
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657572417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z2Uh5wGAQRnWhuWdmRnU59CA2Oi6nG+4RZgJzSKrQJI=;
 b=Kj369WYanQX0gWwfY+nWZpF6d3iWWmkIUOFCeieJwfKB4wwcz/mffWbDfbqN7R1ku28f9H
 1ydtKTYi3fCRYc7uExt/UruBQTcYcYhAMLNCLzdKYfRImESG7UHRnGtEU5f+GtdPuRP9bw
 5qmblQbAzWTbX8Ql/wDmtC8CUykRg/A=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-UWvXK15VM2CUblH_OPGT5g-1; Mon, 11 Jul 2022 16:46:56 -0400
X-MC-Unique: UWvXK15VM2CUblH_OPGT5g-1
Received: by mail-ua1-f71.google.com with SMTP id
 i19-20020ab01593000000b0038317fe5e1dso1221754uae.17
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2Uh5wGAQRnWhuWdmRnU59CA2Oi6nG+4RZgJzSKrQJI=;
 b=yT5qZCtlDyn+X5yfXPhPUxdpXzBqV+1h5GaTbzse7CsVlLJ4f3rvZlGtTg7Ll56Y6z
 A99wiKMWLPLcXtPDZX4GVTTQwDEgZEKGX3OxNmqRYVGeAuR5kfJz6YSX4WDzmSf8OtXd
 KqtckmNjpVmbI+i8mC+GGIabRT4svc6RTBsHU06ePbgOjgFSU6mX+NuUy36vT1/bXZ2n
 9hOhWJIT2/5CKQPzyiQxk9UuNQYgFc8Tt8/4QjCCbiwtafGkelNOsA+G+oT0QalrCHsb
 ms4Bs5loEtA6WQQr1dmRMiXQwW0r2Sfqi/rXCJ2zIPAl30FGMyG6XLKxTshP7NqX/uin
 Bu7w==
X-Gm-Message-State: AJIora+r5a5QLJEg5gjXgP6Ctl6oYcYvVJxYPt16YwwjFMEl8nW8fzmL
 jVLTUilHYZSqYPCKaiZ8P33kRNtCK+VS7TgQhnVtoCTRs0qmlony6uyHLVVna/h7hVV1LXj+4P+
 eYjfigSpJuN2ClTYXl1VmoYY5dsMnmsE=
X-Received: by 2002:a05:6102:31ac:b0:357:530e:6496 with SMTP id
 d12-20020a05610231ac00b00357530e6496mr3168226vsh.38.1657572415782; 
 Mon, 11 Jul 2022 13:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXsnpxcUYKFxBSVaxpKLQC+iLxaQD8l8PXvMw0MfG92Fdqy/OJvqCUqIh1ks9HfeqB0MRgnHF2cYG8l04ixqQ=
X-Received: by 2002:a05:6102:31ac:b0:357:530e:6496 with SMTP id
 d12-20020a05610231ac00b00357530e6496mr3168217vsh.38.1657572415548; Mon, 11
 Jul 2022 13:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-11-ani@anisinha.ca>
In-Reply-To: <20220710170014.1673480-11-ani@anisinha.ca>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:46:44 -0400
Message-ID: <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] pytest: add pytest to the meson build system
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Integrate the pytest framework with the meson build system. This will make meson
> run all the pytests under the pytest directory.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/Makefile.include   |  4 +++-
>  tests/meson.build        |  1 +
>  tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 tests/pytest/meson.build
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 3accb83b13..40755a6bd1 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -3,12 +3,14 @@
>  .PHONY: check-help
>  check-help:
>         @echo "Regression testing targets:"
> -       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> +       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"

Does this mean that "make check" *requires* an internet connection? If
so, I'm afraid that introduces some complications for downstreams
which require that "make check" can run without an internet
connection. It's something I've been trying to wrestle with as I split
the qemu.qmp library out of the QEMU tree, and I have been working
(slowly) on remedying it with some additional Makefile logic.

I have been looking into making a testing "dummy package" for python
with optional dependency groups that use a venv building script to
either pull from PyPI in online mode, or use system packages in
offline mode. In the case of offline mode, I am working on augmenting
the configure script to test that dependencies are met, and disabling
test groups when the correct dependencies cannot be located.

I hope to have another version of that series soon; it should be
trivial to add a new optional dependency group to it. I'll CC you on
the next version of the series.

--js

>         @echo " $(MAKE) bench                  Run speed tests"
>         @echo
>         @echo "Individual test suites:"
>         @echo " $(MAKE) check-qtest-TARGET     Run qtest tests for given target"
>         @echo " $(MAKE) check-qtest            Run qtest tests"
> +       @echo " $(MAKE) check-pytest           Run pytest tests"
> +       @echo " $(MAKE) check-pytest-TARGET    Run pytest for a given target"
>         @echo " $(MAKE) check-unit             Run qobject tests"
>         @echo " $(MAKE) check-qapi-schema      Run QAPI schema tests"
>         @echo " $(MAKE) check-block            Run block tests"
> diff --git a/tests/meson.build b/tests/meson.build
> index 8e318ec513..f344cbdc6c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -93,3 +93,4 @@ subdir('unit')
>  subdir('qapi-schema')
>  subdir('qtest')
>  subdir('migration')
> +subdir('pytest')
> diff --git a/tests/pytest/meson.build b/tests/pytest/meson.build
> new file mode 100644
> index 0000000000..e60d481ae4
> --- /dev/null
> +++ b/tests/pytest/meson.build
> @@ -0,0 +1,49 @@
> +slow_pytests = {
> +  'acpi-bits' : 120,
> +}
> +
> +pytests_generic = []
> +
> +# biosbits tests are currenly only supported on x86_64 platforms.
> +pytests_x86_64 = ['acpi-bits-test']
> +
> +pytest_executables = {}
> +other_deps = []
> +
> +subdir('acpi-bits')
> +
> +foreach dir : target_dirs
> +  if not dir.endswith('-softmmu')
> +    continue
> +  endif
> +
> +  target_base = dir.split('-')[0]
> +  pytest_emulator = emulators['qemu-system-' + target_base]
> +  target_pytests = get_variable('pytests_' + target_base, []) + pytests_generic
> +
> +  test_deps = roms
> +  pytest_env = environment()
> +  if have_tools
> +    pytest_env.set('QTEST_QEMU_IMG', './qemu-img')
> +    test_deps += [qemu_img]
> +  endif
> +  pytest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
> +  pytest_env.set('PYTEST_QEMU_BINARY', './qemu-system-' + target_base)
> +  pytest_env.set('PYTEST_SOURCE_ROOT', meson.project_source_root())
> +  if have_tools and have_vhost_user_blk_server
> +    pytest_env.set('PYTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
> +    test_deps += [qsd]
> +  endif
> +
> +  foreach test : target_pytests
> +    test('pytest-@0@/@1@'.format(target_base, test),
> +         pytest_executables[test],
> +         depends: [test_deps, pytest_emulator, emulator_modules, other_deps],
> +         env: pytest_env,
> +         args: ['--tap', '-k'],
> +         protocol: 'tap',
> +         timeout: slow_pytests.get(test, 30),
> +         priority: slow_pytests.get(test, 30),
> +         suite: ['pytest', 'pytest-' + target_base])
> +  endforeach
> +endforeach
> --
> 2.25.1
>


