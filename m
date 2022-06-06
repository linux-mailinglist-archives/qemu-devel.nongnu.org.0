Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F354653EDF7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 20:39:13 +0200 (CEST)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyHdB-0006WQ-3P
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 14:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyHah-0004z7-OS
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:36:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyHaf-0005pe-MI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:36:39 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so13589390pgc.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 11:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=e0QaYOWaYI+H3yNqyrLNWiEm6Sehl0oFJYe8L1rdKEs=;
 b=UoDMAnmMKwQAUYjdUh5i1/dVXYMm/s5v+v7U8UNE41AQsx4oB6w6e/Zg2J+/a0lypZ
 LZeOewvR5q+iNidn6vLg0wMrb9kIh2d0ZDe/cQhIQw0hRuXaz6vX91dxCgtTEMsadfUS
 kh5uSWBaTWHMluJreBku3BUd2xS2LGMCO6FHKpQRivFN/Q4SfGefX7c4jX0H1OOl7rmc
 SutBLfjqWyE57tJHzjgBITCdrX2W1SHDqgsqVqF3LncVTyTdMOjpvVRFGT5/n7HbEibJ
 4z4qo+gAe3BaoS6Tpxw63pPmTTfIzIWggUI5VzCvUMaF3Ch/gum5tScs82UYQkSBxVAZ
 DfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e0QaYOWaYI+H3yNqyrLNWiEm6Sehl0oFJYe8L1rdKEs=;
 b=USUBanef0E7FJT+O5t2uhhsp5kqYwRLe64cQsvO/Dr6C0F4Y04w+AMHHPl1p+112/Z
 ISp/l9RUABv2HfjbjQ9Uim5L/ckGqqgmSkJh32z0IEvcs4Ypr+267gbGnJnMYUKKIPn+
 w0m+w8ng/xlyuAs2Y57FNMbfI5eTNIwCHm0nT4lBTv3WJTGHNif5ihm8/JFYqtDmwA4p
 mhznQV0UP12Cw4Oyr5I3k+NKwbs0kC5GJ8/w7xnVLoNbkQLS6ACLsbwa+pcqvJ23PGq1
 F5VdJT4loA5WU5tpYlrngVdq+YGNo2e/5z0NYM7OrMWIX7orcHUZ5ZZU9uSgBn25PW0R
 oVEQ==
X-Gm-Message-State: AOAM531MfgMOWDWtBLovc6gDZ6XBM4fsk7dFGbkyRfraS5g8hkOWXBwz
 10Cu9rXQAJRUFXyylzUrcNN+uM0aduH8CA==
X-Google-Smtp-Source: ABdhPJzdS3nV0kZBPWMVVlHQKmYN1E1HlH3G9sj7G8iZMQB0sEGHkwLdK+/oSeXLsP0kM0T/QCJFvw==
X-Received: by 2002:aa7:8d0f:0:b0:518:d867:bae8 with SMTP id
 j15-20020aa78d0f000000b00518d867bae8mr25011240pfe.13.1654540596339; 
 Mon, 06 Jun 2022 11:36:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b0015e8d4eb28esm10930528plb.216.2022.06.06.11.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 11:36:35 -0700 (PDT)
Message-ID: <cd65e56b-105b-77ee-7202-8a8f2dd7f37c@linaro.org>
Date: Mon, 6 Jun 2022 10:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/29] Misc patches for 2022-06-06
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220606143644.1151112-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/6/22 07:36, Paolo Bonzini wrote:
> The following changes since commit ca127b3fc247517ec7d4dad291f2c0f90602ce5b:
> 
>    Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-06-03 14:14:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to ca5765c8521b8284b8277ed4b811ac0ab9010fc8:
> 
>    meson: qga: do not use deprecated meson.build_root() (2022-06-06 16:04:08 +0200)
> 
> ----------------------------------------------------------------
> * prepare to expand usage of test venv
> * fix CPUID when passing through host cache information
> * a20 fix
> * SGX fix
> * generate per-target modinfo
> * replay cleanups and simplifications
> * "make modules" target

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Dario Faggioli (1):
>        tests/Makefile.include: Fix 'make check-help' output
> 
> Igor Mammedov (2):
>        x86: cpu: make sure number of addressable IDs for processor cores meets the spec
>        x86: cpu: fixup number of addressable IDs for logical processors sharing cache
> 
> John Snow (9):
>        python: update for mypy 0.950
>        tests: add "TESTS_PYTHON" variable to Makefile
>        tests: use python3 as the python executable name
>        tests: silence pip upgrade warnings during venv creation
>        tests: add quiet-venv-pip macro
>        tests: install "qemu" namespace package into venv
>        tests: use tests/venv to run basevm.py-based scripts
>        tests: add python3-venv to debian10.docker
>        tests: run 'device-crash-test' from tests/venv
> 
> Jose R. Ziviani (2):
>        modules: introduces module_kconfig directive
>        modules: generates per-target modinfo
> 
> Paolo Bonzini (4):
>        build: add a "make modules" target
>        regenerate meson-buildoptions.sh
>        configure: remove reference to removed option
>        meson: qga: do not use deprecated meson.build_root()
> 
> Pavel Dovgalyuk (9):
>        replay: fix event queue flush for qemu shutdown
>        replay: notify vCPU when BH is scheduled
>        replay: rewrite async event handling
>        replay: simplify async event processing
>        docs: convert docs/devel/replay page to rst
>        docs: move replay docs to docs/system/replay.rst
>        tests/avocado: update replay_linux test
>        tests/avocado: add replay Linux tests for virtio machine
>        tests/avocado: add replay Linux test for Aarch64 machines
> 
> Stephen Michael Jothen (1):
>        target/i386/tcg: Fix masking of real-mode addresses with A20 bit
> 
> Yang Zhong (1):
>        target/i386: Fix wrong count setting
> 
>   .gitlab-ci.d/buildtest.yml               |   8 +-
>   accel/tcg/tcg-accel-ops-icount.c         |   5 +-
>   configure                                |   1 -
>   docs/devel/index-tcg.rst                 |   1 +
>   docs/devel/replay.rst                    | 306 +++++++++++++++++++++++
>   docs/devel/replay.txt                    |  46 ----
>   docs/replay.txt                          | 410 -------------------------------
>   docs/system/index.rst                    |   1 +
>   docs/system/replay.rst                   | 237 ++++++++++++++++++
>   hw/display/qxl.c                         |   1 +
>   hw/display/vhost-user-gpu-pci.c          |   1 +
>   hw/display/vhost-user-gpu.c              |   1 +
>   hw/display/vhost-user-vga.c              |   1 +
>   hw/display/virtio-gpu-base.c             |   1 +
>   hw/display/virtio-gpu-gl.c               |   1 +
>   hw/display/virtio-gpu-pci-gl.c           |   1 +
>   hw/display/virtio-gpu-pci.c              |   1 +
>   hw/display/virtio-gpu.c                  |   1 +
>   hw/display/virtio-vga-gl.c               |   1 +
>   hw/display/virtio-vga.c                  |   1 +
>   hw/s390x/virtio-ccw-gpu.c                |   1 +
>   hw/usb/ccid-card-emulated.c              |   1 +
>   hw/usb/ccid-card-passthru.c              |   1 +
>   hw/usb/host-libusb.c                     |   1 +
>   hw/usb/redirect.c                        |   1 +
>   include/qemu/module.h                    |  10 +
>   include/sysemu/cpu-timers.h              |   1 +
>   include/sysemu/replay.h                  |   9 +-
>   meson.build                              |  28 ++-
>   python/qemu/qmp/util.py                  |   4 +-
>   python/setup.cfg                         |   1 +
>   qga/meson.build                          |   2 +-
>   replay/replay-events.c                   |  56 ++---
>   replay/replay-internal.h                 |  37 ++-
>   replay/replay-snapshot.c                 |   2 -
>   replay/replay.c                          |  78 +++---
>   scripts/device-crash-test                |  14 +-
>   scripts/meson-buildoptions.sh            |   4 +-
>   scripts/modinfo-generate.py              |  49 +++-
>   softmmu/icount.c                         |  12 +-
>   stubs/icount.c                           |   4 +
>   target/i386/cpu.c                        |  22 +-
>   target/i386/tcg/sysemu/excp_helper.c     |   4 +-
>   tests/Makefile.include                   |  48 ++--
>   tests/avocado/avocado_qemu/__init__.py   |  11 +-
>   tests/avocado/replay_linux.py            |  85 ++++++-
>   tests/avocado/virtio_check_params.py     |   1 -
>   tests/avocado/virtio_version.py          |   1 -
>   tests/docker/dockerfiles/debian10.docker |   1 +
>   tests/requirements.txt                   |   1 +
>   tests/vm/Makefile.include                |  13 +-
>   tests/vm/basevm.py                       |   6 +-
>   util/async.c                             |   8 +
>   53 files changed, 894 insertions(+), 649 deletions(-)
>   create mode 100644 docs/devel/replay.rst
>   delete mode 100644 docs/devel/replay.txt
>   delete mode 100644 docs/replay.txt
>   create mode 100644 docs/system/replay.rst


