Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A993C5852EC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:40:52 +0200 (CEST)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHS6d-0002bY-QC
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHS2p-00061g-IP
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:36:55 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHS2m-0005hz-B3
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:36:55 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y9so4919013pff.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HFMS/eE6AvnYAOpmF8ahWThqEcJmDkEFKEulbt7UKn0=;
 b=tcSBpf2RbYGugE6l36bTz/GcmyyQkAU66qRsrEkmvxcszTgjw0mzJ4vCNDQ6X2NxLL
 /X4RX4ZQ4PqVDX+0NrpWk6zZKeu0bEZdCmhc7FpZldDNRUhz6NkSZ9Wq8a6YlXo6vhRH
 q87oApz5wAQyDtxju9mLOYbDQu3pitqZAVtbc2RKJSY/p8Dwr2H9bP2Hx6C21WLPm3+S
 08Rn1xH43WWJF9ePWLCcJ3JHjmA4PlQ9wjyEDDt4qo1YbYtU1L0QaOlC4jMachU3rC05
 d7SEM6a0yhOl0emv9kwqgZeTXzLvPrm8NHguL7WNCcg/CBJknaZSUDdJNWYUbvyptqat
 kVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HFMS/eE6AvnYAOpmF8ahWThqEcJmDkEFKEulbt7UKn0=;
 b=wE1MSyY89rzUnulrYmejEIUnN7MtGgIdp3DjzHFWoHjy6rGC6X11PkHgsvNQpKteqC
 Ydws/c08BBHnyjBwzOeOF9s+zFpo5dMosb4z6UACxoVAoP6vhIcVCgjH5I8nvp0pBuG6
 uzm0+JCZOX89awKH8r1nKEEkjYLIJtIm9lc/CIE3TouvRClN4KX0nlcoLWJFEQZ0/ZpB
 Cp0RL+2lcfS7xPESZhfy89VKqMsUYBJtc8fuZp4zZgZZFP9SvM303Sp4Py0pdwylzkuW
 OnFGOcpuPiEIdBC3sUv4gO5eQHuZs1+qDiviEIBl2/ZZ+ua6mN9/gKfF0Jzmij+HML2F
 MVUQ==
X-Gm-Message-State: AJIora9j7U2J210Zs4uTOyb05cb46G+AuG+lpHrg7wzag1zsFp4t/qR+
 rtRnhvUt4RG/h+Kf11HhDS4nMQ==
X-Google-Smtp-Source: AGRyM1u4+gbwkxHnQTueThXPGUJP7hMp5x2cOPd4230saw4pKBqSq3DKu/iP6ZYvzXKxg4owU47Dgw==
X-Received: by 2002:a05:6a00:23c7:b0:52b:3246:3cc6 with SMTP id
 g7-20020a056a0023c700b0052b32463cc6mr4444277pfc.10.1659109010714; 
 Fri, 29 Jul 2022 08:36:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170903230b00b0016d4b17e7a7sm3882945plh.24.2022.07.29.08.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 08:36:48 -0700 (PDT)
Message-ID: <f321b75a-dbc9-9947-85ea-48d7e7be7199@linaro.org>
Date: Fri, 29 Jul 2022 08:36:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/13] testing, semihosting and doc fixes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 7/29/22 02:19, Alex Bennée wrote:
> The following changes since commit cc42559ab129a15554cc485ea9265e34dde7ab5b:
> 
>    Merge tag 'pull-ppc-20220728' of https://gitlab.com/danielhb/qemu into staging (2022-07-28 15:06:42 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-testing-next-290722-1
> 
> for you to fetch changes up to 1235cf7d315b415fc2e4aa81815fda6ce96518c4:
> 
>    qemu-options: bring the kernel and image options together (2022-07-29 09:48:01 +0100)
> 
> ----------------------------------------------------------------
> Testing, semihosting and doc fixes:
> 
>    - update to latest libvirt-ci
>    - echo testlog.txt on failed cirrus runs
>    - drop containers-layer2 stage
>    - update handling of symlinks on windows builds
>    - return 0 for failure of semihosting console write
>    - don't copy unused buffer after semihost operation
>    - check for errors in semihosting args
>    - fix buffer handling for semihosting TMPNAM
>    - add qapi exit-failure PanicAction
>    - add lowcore unaligned access test to s390x
>    - fix documentation of OBJECT_DECLARE_SIMPLE_TYPE
>    - expand documentation on booting code

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (2):
>        docs/devel: fix description of OBJECT_DECLARE_SIMPLE_TYPE
>        qemu-options: bring the kernel and image options together
> 
> Bin Meng (2):
>        .cirrus.yml: Change winsymlinks to 'native'
>        .gitlab-ci.d/windows.yml: Enable native Windows symlink
> 
> Daniel P. Berrangé (3):
>        tests: refresh to latest libvirt-ci module
>        gitlab: show testlog.txt contents when cirrus/custom-runner jobs fail
>        gitlab: drop 'containers-layer2' stage
> 
> Ilya Leoshkevich (2):
>        qapi: Add exit-failure PanicAction
>        tests/tcg/s390x: Test unaligned accesses to lowcore
> 
> Peter Maydell (4):
>        semihosting: Don't return negative values on qemu_semihosting_console_write() failure
>        semihosting: Don't copy buffer after console_write()
>        semihosting: Check for errors on SET_ARG()
>        semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM
> 
>   docs/devel/qom.rst                                 |  3 +-
>   qapi/run-state.json                                |  5 +-
>   include/sysemu/sysemu.h                            |  2 +-
>   semihosting/arm-compat-semi.c                      | 29 +++++--
>   semihosting/console.c                              |  3 +-
>   semihosting/syscalls.c                             |  2 +-
>   softmmu/main.c                                     |  6 +-
>   softmmu/runstate.c                                 | 17 +++-
>   .cirrus.yml                                        |  2 +-
>   .gitlab-ci.d/cirrus/build.yml                      |  3 +-
>   .gitlab-ci.d/cirrus/freebsd-12.vars                |  3 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars                |  3 +-
>   .gitlab-ci.d/cirrus/macos-11.vars                  |  4 +-
>   .gitlab-ci.d/container-cross.yml                   | 24 +++---
>   .../custom-runners/centos-stream-8-x86_64.yml      |  2 +
>   .../custom-runners/ubuntu-20.04-aarch32.yml        |  2 +
>   .../custom-runners/ubuntu-20.04-aarch64.yml        | 12 +++
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 +++
>   .gitlab-ci.d/stages.yml                            |  1 -
>   .gitlab-ci.d/windows.yml                           |  2 +
>   qemu-options.hx                                    | 98 +++++++++++++++++-----
>   tests/docker/dockerfiles/alpine.docker             |  4 +-
>   tests/docker/dockerfiles/centos8.docker            |  6 +-
>   tests/docker/dockerfiles/debian-amd64.docker       |  2 +
>   tests/docker/dockerfiles/debian-arm64-cross.docker |  2 +
>   tests/docker/dockerfiles/debian-armel-cross.docker |  2 +
>   tests/docker/dockerfiles/debian-armhf-cross.docker |  2 +
>   .../dockerfiles/debian-mips64el-cross.docker       |  2 +
>   .../docker/dockerfiles/debian-mipsel-cross.docker  |  2 +
>   .../docker/dockerfiles/debian-ppc64el-cross.docker |  2 +
>   tests/docker/dockerfiles/debian-s390x-cross.docker |  2 +
>   tests/docker/dockerfiles/fedora.docker             |  3 +-
>   tests/docker/dockerfiles/opensuse-leap.docker      |  7 +-
>   tests/docker/dockerfiles/ubuntu2004.docker         |  2 +
>   tests/lcitool/libvirt-ci                           |  2 +-
>   tests/lcitool/projects/qemu.yml                    |  6 +-
>   tests/lcitool/refresh                              |  4 +-
>   tests/tcg/s390x/Makefile.softmmu-target            |  9 ++
>   tests/tcg/s390x/unaligned-lowcore.S                | 19 +++++
>   39 files changed, 243 insertions(+), 70 deletions(-)
>   create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
>   create mode 100644 tests/tcg/s390x/unaligned-lowcore.S
> 


