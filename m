Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9F5F6F47
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:38:02 +0200 (CEST)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXd3-0005sd-IJ
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogXaJ-0003NC-K1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:35:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogXaH-00063D-4E
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:35:11 -0400
Received: by mail-wr1-x436.google.com with SMTP id bu30so4378746wrb.8
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMUfU9lVA5zwuS5k/qkUI9pY6C3vPiFA66tnDFsUF7I=;
 b=qMVUPf7dfEaSZXAj75jaVze4nTbJ6Jsz4g1DgvqDehSTe8NWYBXN8MHUnPTlVxVMTo
 v2tz/4FPUsbnQpxRtoU6l4Bxkxa5nooP9XEtE4DqXc3td9xEmvKmJcBBOKQPN2xBLsPu
 B28Z9mvrBdU6ikNCN9Bt290OkkniLGWDNAQU4Y9aYJhonBN8BjuRVgICOTtPibjO5cBv
 yzW3jEqsjD+pxLLDSeGcWiKpF4la4MmL/Uf0UIbvV1GlCFUb/2nzuu1CyjsI4PhShW5F
 oJumReZpTwi67ZPs70rqB72YGd3C3CyeylD58cnQ9F1m8FUQqBhCtidAgZ1gxQZpVCti
 0mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jMUfU9lVA5zwuS5k/qkUI9pY6C3vPiFA66tnDFsUF7I=;
 b=DIDmi7k5hUyzsEwSos4skGylzfsvtyTU9E3cdILDCmyQkkxk5ib9rQL/gciSar9mV9
 yflH+HxyEYViy8kSo5WHcnurm0kZ73OZfh4pm+MuAK7ILGTrWfoqRkNjPIBfEeMwIzV+
 T+c9Kh6y/MnHxnQjiejCwGxIJZS4kt9ULJbnNVkItrF8N2t1Be93AMDvuxkwqco188Ha
 Rx1vNF3lSmFtUNKFMDZDjV2SKlBe56iwyrREPDyjFkkMZxFnp8B9LgW9Dm/QFgRtnhUX
 Ye42aCybNaVgdp0rJwNwyQ3NZuMwKVKbaJYkEELM2lrEPgvNMfRZroUiwFEjzNM9DaqS
 mlqA==
X-Gm-Message-State: ACrzQf2gWoOXlfimJhVz4lP5BA99DsElcKW0UYm17FkBsZH2l9GQ5nzj
 NyhBLHCsiJsEJm4N4TegdORP1w==
X-Google-Smtp-Source: AMsMyM55UserezbjqeqtvMjl9JfmsUjteXOTRI5OccAC4Xn4PoaZAKwQ2rAy+fV+0x0/vI183DpnNw==
X-Received: by 2002:a05:6000:1688:b0:22e:58cd:5a2b with SMTP id
 y8-20020a056000168800b0022e58cd5a2bmr1055012wrd.365.1665088507285; 
 Thu, 06 Oct 2022 13:35:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adfdb03000000b0022e309d35f8sm332376wri.12.2022.10.06.13.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 13:35:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2CE31FFB7;
 Thu,  6 Oct 2022 21:35:05 +0100 (BST)
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz
 <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v5 00/18] tests/qtest: Enable running qtest on Windows
Date: Thu, 06 Oct 2022 21:33:14 +0100
In-reply-to: <20221006151927.2079583-1-bmeng.cn@gmail.com>
Message-ID: <87ilkwitc6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> In preparation to adding virtio-9p support on Windows, this series
> enables running qtest on Windows, so that we can run the virtio-9p
> tests on Windows to make sure it does not break accidently.

I'm happy to take this whole series through my testing/next however I
don't have working CI for the month so need to wait for my minutes to
reset. Have you done a full CI run* with this?

(*make sure any CI run is only on a repo forked from
https://gitlab.com/qemu-project as you won't get the discount cost
factor otherwise)

>
> Changes in v5:
> - Rebase on qemu/master
> - Drop patches that are already merged
> - Use g_autoptr(GError)
> - Restore to v1 version which does not touch the posix implementation
> - Replace sighandler_t with its actual definition, since it is not
>   available on BSD hosts
>
> Changes in v4:
> - Update the error reporting by using the GError "error" argument
>   of g_dir_make_tmp()
> - Remove the const from tmpfs declaration
>
> Changes in v3:
> - Split to a separate patch
> - Add a usleep(1) in the busy wait loop
> - Drop the host test
>
> Changes in v2:
> - Use g_autofree to declare the variable
> - Change to use g_mkdir()
> - Change to use g_mkdir()
> - Change to use g_mkdir()
> - Introduce qemu_send_full() and use it
> - Move the enabling of building qtests on Windows to a separate
>   patch to keep bisectablity
> - Call socket_init() unconditionally
> - Add a missing CloseHandle() call
> - Change to a busy wait after migration is canceled
> - new patch: "io/channel-watch: Drop the unnecessary cast"
> - Change the timeout limit to 90 minutes
> - new patch: "tests/qtest: Enable qtest build on Windows"
>
> Bin Meng (15):
>   semihosting/arm-compat-semi: Avoid using hardcoded /tmp
>   tcg: Avoid using hardcoded /tmp
>   util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
>     temporary files
>   tests/qtest: migration-test: Avoid using hardcoded /tmp
>   block/vvfat: Unify the mkdir() call
>   fsdev/virtfs-proxy-helper: Use g_mkdir()
>   hw/usb: dev-mtp: Use g_mkdir()
>   tests/qtest: libqtest: Install signal handler via signal()
>   tests/qtest: Support libqtest to build and run on Windows
>   tests/qtest: libqtest: Correct the timeout unit of blocking receive
>     calls for win32
>   io/channel-watch: Drop a superfluous '#ifdef WIN32'
>   io/channel-watch: Drop the unnecessary cast
>   io/channel-watch: Fix socket watch on Windows
>   .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
>   tests/qtest: Enable qtest build on Windows
>
> Xuzhou Cheng (3):
>   accel/qtest: Support qtest accelerator for Windows
>   tests/qtest: Use send/recv for socket communication
>   tests/qtest: migration-test: Make sure QEMU process "to" exited after
>     migration is canceled
>
>  include/hw/core/cpu.h         |   1 +
>  include/qemu/sockets.h        |   2 +
>  accel/dummy-cpus.c            |  14 +++-
>  block/vvfat.c                 |   9 +--
>  fsdev/virtfs-proxy-helper.c   |   3 +-
>  hw/usb/dev-mtp.c              |   4 +-
>  io/channel-watch.c            |  12 +---
>  semihosting/arm-compat-semi.c |   3 +-
>  softmmu/cpus.c                |   9 +--
>  tcg/tcg.c                     |   3 +-
>  tests/qtest/libqmp.c          |   5 +-
>  tests/qtest/libqtest.c        | 124 +++++++++++++++++++++++++++++-----
>  tests/qtest/migration-test.c  |  14 ++--
>  util/osdep.c                  |  33 +++++++++
>  util/qemu-sockets.c           |   5 +-
>  .gitlab-ci.d/windows.yml      |   4 +-
>  accel/meson.build             |   1 +
>  accel/qtest/meson.build       |   1 +
>  tests/qtest/meson.build       |   6 --
>  19 files changed, 194 insertions(+), 59 deletions(-)


--=20
Alex Benn=C3=A9e

