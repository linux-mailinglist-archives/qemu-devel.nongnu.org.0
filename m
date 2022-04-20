Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F53C508DCE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:54:01 +0200 (CEST)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDaa-0006cK-KJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhDLn-0006RG-J9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:38:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhDLk-0002if-Fe
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:38:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so5422536pjb.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=WOQbHKBnmcqZdK/9TEraClq3NxyLNh74hpa0PIFcw80=;
 b=gLQpga0IRjKKT/AMFjQEBVj24FQWCXBxuO23CMJL6aW9DWhWRnjEIlaOld9LGmdgEv
 zjUQstDJ4oJgt9Bnyi8uBoSg1Kt3opR5b/jfO7J5S5EC16TBCS2K6skwFJ1LwKH1bDdk
 3XBe36uL3wSISvXtkiPwvLvRFQ8+5q7cKxh75DPKw8X9i2LV/OBudI/YEUUAxRtoJ87M
 gOk2QWz7q2eaAUAuZgoe0zdG0cMR1mYi8AVd9OJKphoHqW8BfMlVO+lE+19xr1gAGDhC
 7Z5GS/yQlojwNJrJ4DJ5GVhOlcAMEZPbAc3urpolwvDuCTuW3oL7BXVKzQCNQ9hcspqW
 I88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WOQbHKBnmcqZdK/9TEraClq3NxyLNh74hpa0PIFcw80=;
 b=R/ZVhHTgaUEl5mEjMFjcuF6Sd8Q6qCS//MSYdXNRCym0l3mBcnteh2qvY+S4dJBVsb
 fblcPVPHmuKYnVoC49kS/Wfs2GXWVuxFYmzFOvHqTcthcOX4WA02NDlECsGvN5371UMe
 RvEX3+RLJPvtZuctDNt316t7T0hAofQcUPJu8puGM1olnQ+k+mCwZF6y06g/Z/F3DVIX
 5TsHcKdyFammls7n2lAd1752TYmk1bVb3lCMk5qFv/6cRsI5jKqjBigNJaRoLx+R1aJs
 FjYKiRoAIKjln5+ywGHPtzBlswqaHuakSqh2ElTWdwHRfA2xfaQCRqCcE1po4wKFCUu4
 gD1Q==
X-Gm-Message-State: AOAM532baeuI9cpF6Z3SNZrCvO8s5QzwAtwKYigavG+0dKy6Eu+g1i6D
 2pCDKI671UaDiwhrsxaYlwD8ow==
X-Google-Smtp-Source: ABdhPJxYDLZC20eMt4HN76cslPRw78kyicj9/aArnuIlPpSZd6MK9Y2KF3T97cbnIKONQnFOQbXoEQ==
X-Received: by 2002:a17:902:c3c4:b0:158:85b8:1459 with SMTP id
 j4-20020a170902c3c400b0015885b81459mr21691764plj.10.1650472718753; 
 Wed, 20 Apr 2022 09:38:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 r33-20020a63fc61000000b003a9f98905e9sm11086383pgk.76.2022.04.20.09.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 09:38:38 -0700 (PDT)
Message-ID: <fbecfbb9-32cb-4922-e865-3e164ac1eb67@linaro.org>
Date: Wed, 20 Apr 2022 09:38:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] Misc patches
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220420103309.264479-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220420103309.264479-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 4/20/22 03:33, Thomas Huth wrote:
> The following changes since commit 1be5a765c08cee3a9587c8a8d3fc2ea247b13f9c:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-19 18:22:16 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-04-20
> 
> for you to fetch changes up to 41663beda53c517fd442648e4b62c9dada8bff9b:
> 
>    tests/avocado: Allow overwrite smp and memory size command line options (2022-04-20 09:44:29 +0200)
> 
> ----------------------------------------------------------------
> * Drop perl-Test-Harness from the CI containers / VMs
> * Some qtest fixes
> * Convert ccid doc to restructuredText
> * Add compat machines for 7.1
> * Allow overwrite smp and memory size in avocado tests

Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Ahmed Abouzied (1):
>        tests/avocado: Allow overwrite smp and memory size command line options
> 
> Alex Bennée (1):
>        tests/qtest: properly initialise the vring used idx
> 
> Cornelia Huck (1):
>        hw: Add compat machines for 7.1
> 
> Lucas Ramage (1):
>        docs/ccid: convert to restructuredText
> 
> Thomas Huth (3):
>        tests: Drop perl-Test-Harness from the CI containers / VMs
>        tests/qtest: Enable more tests for the "mipsel" target
>        tests/qtest: Move the fuzz tests to x86 only
> 
>   docs/ccid.txt                                      | 182 ---------------------
>   docs/system/device-emulation.rst                   |   1 +
>   docs/system/devices/ccid.rst                       | 171 +++++++++++++++++++
>   include/hw/boards.h                                |   3 +
>   include/hw/i386/pc.h                               |   3 +
>   hw/arm/virt.c                                      |   9 +-
>   hw/core/machine.c                                  |   3 +
>   hw/i386/pc.c                                       |   3 +
>   hw/i386/pc_piix.c                                  |  14 +-
>   hw/i386/pc_q35.c                                   |  13 +-
>   hw/m68k/virt.c                                     |   9 +-
>   hw/ppc/spapr.c                                     |  15 +-
>   hw/s390x/s390-virtio-ccw.c                         |  14 +-
>   tests/qtest/endianness-test.c                      |   1 +
>   tests/qtest/fuzz-lsi53c895a-test.c                 |   8 +-
>   tests/qtest/fuzz-megasas-test.c                    |  12 +-
>   tests/qtest/fuzz-sb16-test.c                       |  12 +-
>   tests/qtest/fuzz-sdcard-test.c                     |  12 +-
>   tests/qtest/fuzz-virtio-scsi-test.c                |   8 +-
>   tests/qtest/libqos/virtio.c                        |   2 +
>   .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
>   .gitlab-ci.d/cirrus/macos-11.vars                  |   4 +-
>   tests/avocado/avocado_qemu/__init__.py             |   6 +-
>   tests/docker/dockerfiles/alpine.docker             |   1 -
>   tests/docker/dockerfiles/centos8.docker            |   1 -
>   tests/docker/dockerfiles/debian-arm64-cross.docker |   1 -
>   tests/docker/dockerfiles/debian-s390x-cross.docker |   1 -
>   .../docker/dockerfiles/debian-tricore-cross.docker |   1 -
>   tests/docker/dockerfiles/fedora-i386-cross.docker  |   1 -
>   tests/docker/dockerfiles/fedora-win32-cross.docker |   1 -
>   tests/docker/dockerfiles/fedora-win64-cross.docker |   1 -
>   tests/docker/dockerfiles/fedora.docker             |   1 -
>   tests/docker/dockerfiles/opensuse-leap.docker      |   1 -
>   tests/docker/dockerfiles/ubuntu1804.docker         |   1 -
>   tests/docker/dockerfiles/ubuntu2004.docker         |   1 -
>   tests/lcitool/projects/qemu.yml                    |   1 -
>   tests/qtest/meson.build                            |  27 +--
>   tests/vm/centos.aarch64                            |   3 +-
>   tests/vm/fedora                                    |   2 +-
>   40 files changed, 289 insertions(+), 265 deletions(-)
>   delete mode 100644 docs/ccid.txt
>   create mode 100644 docs/system/devices/ccid.rst
> 


