Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BF53CC26
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 17:17:40 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx93T-0000nD-R6
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 11:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx922-0007l6-KL
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:16:11 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx91w-0007oe-Uy
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:16:10 -0400
Received: by mail-pg1-x531.google.com with SMTP id r71so7477654pgr.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eC3FE7dy2hbNG6VmanS6zZ78YuVvVyj4K6/HMisvcng=;
 b=aqCBI0Q4WFRuclKEE0RkfPaTtHDH+SzULXNgJXHAalnmvZGFT/SGIyMXjpNIcm+ySg
 31zoOTgxjjMqBhWqeaHetMb5xjj6z1GdlR0JnLFmqWBEiZ/GnINZi4fzAeQ/019ruCNZ
 Ep3Y2iMftWYqfx7uQBdPoyJnJDikEn9Q1sZjjOxsFm9IeRSim1QztV+6VpAOLMoaM7jQ
 O4+YUAn+Wtjgo7ezlKwI3IvFFf/hOGWcGxDMSCNr+lG2HFgSVnir1ttryx39Gu7aq1zM
 Q9rJgzWCBr5/OH0DD1Fq41Qu8vdPHj+P+NBaEpCsAPlLGcWzrQEfmfNIziAUN+3d5pmc
 aU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eC3FE7dy2hbNG6VmanS6zZ78YuVvVyj4K6/HMisvcng=;
 b=gaO59Vpv6mL5jyyEvF17LyPUHkwPNioUxcfDflKlIHH2E8SE2L3jFH1KpF4dXyj3UY
 1JEvpZSiwBN4T4NNVqybjHKWSsL6DeoeIpHt5xKCClzbFhSSowDcLVNbhGSTj0VDun1W
 gn2tSRPEKvOZpXPmQeTeCs4uSY0+FkhBNGzuKqKyQn0f3uF8YTNaxxvFtCRH4qbn5XRf
 fizsWOabygEFc1DhwawSdWv8SBBvwp4hCBzavJVuoqT5hXO13IJbKQbV7F2imw3mkhKS
 F8nQJTvQt4rrzAEESpv51DtIgzGipVnGe1bwp244U/24DtS0GrTkun+JR06RQtBgky/b
 4kJA==
X-Gm-Message-State: AOAM533zHp6/UEdPp1UFfBXE8t7oE0qXofDmeIPL41lU1gky3d9aKKzW
 Rc5paJ9O13N/kP1PuxKVtL8/8g==
X-Google-Smtp-Source: ABdhPJxUnOUNMUIun7teB2a//KHDkKhB9io1bTCPtVrmMnciKzfIB0mwFQtplPwunc7QNkjT/G/ERQ==
X-Received: by 2002:a63:24a:0:b0:3fc:52a9:b5d6 with SMTP id
 71-20020a63024a000000b003fc52a9b5d6mr9260414pgc.132.1654269363304; 
 Fri, 03 Jun 2022 08:16:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 185-20020a6216c2000000b005183434ec84sm1528128pfw.145.2022.06.03.08.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 08:16:02 -0700 (PDT)
Message-ID: <60c83066-f698-0bbf-ceef-62cefa3b1a5e@linaro.org>
Date: Fri, 3 Jun 2022 08:16:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/12] s390x and misc patches
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220603065905.23805-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/2/22 23:58, Thomas Huth wrote:
> The following changes since commit 1e62a82574fc28e64deca589a23cf55ada2e1a7d:
> 
>    Merge tag 'm68k-for-7.1-pull-request' of https://github.com/vivier/qemu-m68k into staging (2022-06-02 06:30:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-06-03
> 
> for you to fetch changes up to 707d93d4abc6485c638e2aecd93fbd904f2f6b3e:
> 
>    ui: Remove deprecated options "-sdl" and "-curses" (2022-06-03 08:03:28 +0200)
> 
> ----------------------------------------------------------------
> * s390x storage key improvements for KVM
> * Some cosmetics for s390x
> * Update MAINTAINERS entries
> * Improve some spots wrt memory handling in the qtests
> * Clean up the "-display sdl" parameter parsing

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (1):
>        tests/qtest: use g_autofree for test_server_create_chr
> 
> Dr. David Alan Gilbert (1):
>        s390: Typo fix FLOATING_POINT_SUPPPORT_ENH
> 
> Eric Farman (1):
>        MAINTAINERS: Update s390 vhost entries
> 
> Gautam Agrawal (1):
>        tests/tcg: Test overflow conditions
> 
> Hailiang Zhang (1):
>        MAINTAINERS: Change my email address
> 
> Janis Schoetterl-Glausch (1):
>        target/s390x: kvm: Honor storage keys during emulation
> 
> Miaoqian Lin (1):
>        qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set
> 
> Thomas Huth (4):
>        hw/s390x/s390-virtio-ccw: Improve the machine description string
>        ui: Remove deprecated parameters of the "-display sdl" option
>        ui: Switch "-display sdl" to use the QAPI parser
>        ui: Remove deprecated options "-sdl" and "-curses"
> 
> Wenchao Wang (1):
>        MAINTAINERS: Update maintainers for Guest x86 HAXM CPUs
> 
>   docs/about/deprecated.rst           |  26 --------
>   docs/about/removed-features.rst     |  27 ++++++++
>   qapi/ui.json                        |  26 +++++++-
>   include/sysemu/sysemu.h             |   2 -
>   target/s390x/cpu_features_def.h.inc |   2 +-
>   hw/s390x/s390-virtio-ccw.c          |   2 +-
>   softmmu/globals.c                   |   2 -
>   softmmu/vl.c                        | 128 +-----------------------------------
>   target/s390x/gen-features.c         |   6 +-
>   target/s390x/kvm/kvm.c              |   9 +++
>   target/s390x/tcg/translate.c        |   8 +--
>   tests/qtest/npcm7xx_pwm-test.c      |   3 +
>   tests/qtest/vhost-user-test.c       |   7 +-
>   tests/tcg/multiarch/overflow.c      |  58 ++++++++++++++++
>   ui/sdl2.c                           |  10 +++
>   MAINTAINERS                         |   6 +-
>   qemu-options.hx                     |  56 ++--------------
>   17 files changed, 151 insertions(+), 227 deletions(-)
>   create mode 100644 tests/tcg/multiarch/overflow.c
> 


