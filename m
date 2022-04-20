Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2286508B7A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:02:27 +0200 (CEST)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBqc-0002yg-Ta
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBV6-0004uX-51
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBV3-0008LL-6L
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650465608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7j0q9rUjtUMW42Ys6s4L+FTdf85S34zc2iNihGYoOfM=;
 b=KeHlZHol+1uxbuvpig+zTDVh7zQrR8UdaR6+Q+s0W4LYu4XhyuTEymXVtBm4i2Y7ANnaWv
 /sA6/pxP2e47uDLaSqkrXnqGGS1DIpwzQT9koLXwf6dJR5EZNqtqj9F3JOT47402k3LW/Q
 n15CtaVLQzQYvS+aqcDwo/JpGh1EQLA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-dd5rv6rKObecRyJRCV_Fww-1; Wed, 20 Apr 2022 10:40:06 -0400
X-MC-Unique: dd5rv6rKObecRyJRCV_Fww-1
Received: by mail-wm1-f71.google.com with SMTP id
 az27-20020a05600c601b00b0038ff021c8a4so3040687wmb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7j0q9rUjtUMW42Ys6s4L+FTdf85S34zc2iNihGYoOfM=;
 b=yrqlT7MNjTizHTBzledu19zzZts/13vNAQ8FibBZQpfbkoA2lB01soOXGT1QmTW2Pi
 24qqK901BQAt95DZzFQR/wpn6EW0YaDKo0Q95bohsn7hqplns9nvqxGLozgUIbv/yb4M
 5iMdozUQ4U6W8KpheTLl3fb4KJ84/xthPJC0ZFvYYc4yF6exOruYc6hhC/jPgwe6mcPL
 SA+Ym4DE6oRqToFf8Z2aOfok8p/1J0zi+0UOb4kpnAQAeNta+ubOS4HQrxe2M6Caq7Z0
 GsJ7198cJ00G88cCqZ8zkG/88S8oVJM+f/7g3KGdv8u3kq9M0PA0FHbtVSapeEDPv54E
 Wg4g==
X-Gm-Message-State: AOAM532jkgn11l6MRjXMH0k0wylSSJXbrBXPG7VcRvcs9dI71GWBPJQx
 ZAQc5J98XPw0aQg3vNfxS49vFm9I4gliJjp2L/jns4538e500n/cb0/6ES1X8kCwByV2bAhJdTc
 ggt3jfx18jy3Bbc4=
X-Received: by 2002:a5d:47a1:0:b0:20a:9d5e:e1e7 with SMTP id
 1-20020a5d47a1000000b0020a9d5ee1e7mr9950421wrb.377.1650465605658; 
 Wed, 20 Apr 2022 07:40:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCdDLX8YxA0IYB09qB10uq295WefPnBMHdUn+lL543iwlMuemjnDLXoktDf2gUEOB14Fc3DQ==
X-Received: by 2002:a5d:47a1:0:b0:20a:9d5e:e1e7 with SMTP id
 1-20020a5d47a1000000b0020a9d5ee1e7mr9950403wrb.377.1650465605433; 
 Wed, 20 Apr 2022 07:40:05 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6c63000000b0020a94e82a3dsm48710wrz.64.2022.04.20.07.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:40:04 -0700 (PDT)
Message-ID: <ed5eb3de-a008-a695-1124-6419de11a9cb@redhat.com>
Date: Wed, 20 Apr 2022 16:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/41] Misc cleanups
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/04/2022 15.25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Another batch of cleanup patches, mostly while working on moving the common code
> in some future subprojects. (a few patches have been posted and reviewed
> earlier)
> 
> Marc-André Lureau (41):
>    qga: use fixed-length for usecs formatting
>    glib-compat: isolate g_date_time_format_iso8601 version-bypass
>    scripts/analyze-inclusions: drop qemu-common.h from analysis
>    Simplify softmmu/main.c
>    hw/hyperv: remove needless qemu-common.h include
>    include: rename qemu-common.h qemu/copyright.h
>    build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
>    build-sys: simplify MSI's QEMU_GA_MANUFACTURER
>    build-sys: simplify MSI's QEMU_GA_VERSION
>    build-sys: drop MSI's QEMU_GA_DISTRO
>    qga: replace usleep() with g_usleep()
>    docs: trace-events-all is installed without renaming
>    arm/digic: replace snprintf() with g_strdup_printf()
>    arm/allwinner-a10: replace snprintf() with g_strdup_printf()
>    intc/exynos4210_gic: replace snprintf() with g_strdup_printf()
>    doc/style: CLang -> Clang
>    doc/build-platforms: document supported compilers
>    osdep.h: move qemu_build_not_reached()
>    compiler.h: replace QEMU_NORETURN with G_NORETURN
>    include: move qemu_msync() to osdep
>    include: move qemu_fdatasync() to osdep
>    include: move qemu_*_exec_dir() to cutils
>    include: add qemu/keyval.h
>    include: move qdict_{crumple,flatten} declarations
>    tests: remove block/qdict checks from check-qobject.c
>    compiler.h: add QEMU_SANITIZE_{ADDRESS,THREAD}
>    Use QEMU_SANITIZE_THREAD
>    Use QEMU_SANITIZE_ADDRESS
>    tests: run-time skip test-qga if TSAN is enabled
>    Move error_printf_unless_qmp() with monitor unit
>    qga: move qga_get_host_name()
>    qtest: simplify socket_send()
>    tests: move libqtest.c under libqos/
>    libqtest: split QMP part in libqmp
>    util: simplify write in signal handler
>    util: use qemu_write_full() in qemu_write_pidfile()
>    util: use qemu_create() in qemu_write_pidfile()
>    util: replace qemu_get_local_state_pathname()
>    qga: remove need for QEMU atomic.h
>    migration/ram: fix clang warning
>    tests/fuzz: fix warning
> 
>   docs/about/build-platforms.rst               |  10 +
>   docs/devel/qtest.rst                         |   4 +-
>   docs/devel/style.rst                         |   2 +-
>   docs/devel/tracing.rst                       |   2 +-
>   configure                                    |  16 --
>   accel/tcg/internal.h                         |   3 +-
>   include/block/qdict.h                        |   3 +
>   include/exec/exec-all.h                      |  20 +-
>   include/exec/helper-head.h                   |   2 +-
>   include/glib-compat.h                        |  12 +-
>   include/hw/core/cpu.h                        |   2 +-
>   include/hw/core/tcg-cpu-ops.h                |   6 +-
>   include/hw/hw.h                              |   2 +-
>   include/monitor/monitor.h                    |   3 +
>   include/qapi/qmp/qdict.h                     |   3 -
>   include/qemu-main.h                          |  10 +
>   include/qemu/atomic.h                        |   8 +-
>   include/qemu/compiler.h                      |  26 +--
>   include/{qemu-common.h => qemu/copyright.h}  |   5 -
>   include/qemu/cutils.h                        |   9 +-
>   include/qemu/error-report.h                  |   2 -
>   include/qemu/keyval.h                        |  14 ++
>   include/qemu/option.h                        |   6 -
>   include/qemu/osdep.h                         |  51 ++--
>   include/qemu/thread.h                        |   2 +-
>   include/tcg/tcg-ldst.h                       |   4 +-
>   include/tcg/tcg.h                            |   2 +-
>   linux-user/user-internals.h                  |   2 +-
>   qga/commands-common.h                        |  11 +
>   scripts/cocci-macro-file.h                   |   2 +-
>   subprojects/libvhost-user/include/compiler.h |   1 +
>   target/alpha/cpu.h                           |  10 +-
>   target/arm/internals.h                       |  12 +-
>   target/hppa/cpu.h                            |   2 +-
>   target/i386/tcg/helper-tcg.h                 |  24 +-
>   target/microblaze/cpu.h                      |   6 +-
>   target/mips/tcg/tcg-internal.h               |  17 +-
>   target/nios2/cpu.h                           |   6 +-
>   target/openrisc/exception.h                  |   2 +-
>   target/ppc/cpu.h                             |  14 +-
>   target/ppc/internal.h                        |   6 +-
>   target/riscv/cpu.h                           |  10 +-
>   target/s390x/s390x-internal.h                |   6 +-
>   target/s390x/tcg/tcg_s390x.h                 |  12 +-
>   target/sh4/cpu.h                             |   6 +-
>   target/sparc/cpu.h                           |  10 +-
>   target/xtensa/cpu.h                          |   6 +-
>   tests/qtest/libqos/libqmp.h                  |  50 ++++
>   tests/qtest/libqos/libqtest.h                |  29 +--
>   accel/stubs/tcg-stub.c                       |   4 +-
>   bsd-user/main.c                              |   2 +-
>   bsd-user/signal.c                            |   3 +-
>   hw/arm/allwinner-a10.c                       |   4 +-
>   hw/arm/digic.c                               |   5 +-
>   hw/hyperv/syndbg.c                           |   1 -
>   hw/intc/exynos4210_gic.c                     |   9 +-
>   hw/misc/mips_itu.c                           |   3 +-
>   linux-user/main.c                            |   2 +-
>   linux-user/signal.c                          |   3 +-
>   migration/ram.c                              |   2 +-
>   monitor/hmp.c                                |   4 +-
>   monitor/monitor.c                            |  10 +
>   qapi/qobject-input-visitor.c                 |   2 +-
>   qemu-img.c                                   |  14 +-
>   qemu-io.c                                    |   3 +-
>   qemu-nbd.c                                   |   2 +-
>   qga/commands-posix.c                         |  35 +++
>   qga/commands-win32.c                         |  13 ++
>   qga/commands.c                               |  14 +-
>   qga/main.c                                   |  19 +-
>   qom/object_interfaces.c                      |   1 +
>   scsi/qemu-pr-helper.c                        |   8 +-
>   softmmu/main.c                               |  25 +-
>   softmmu/vl.c                                 |   4 +-
>   storage-daemon/qemu-storage-daemon.c         |   3 +-
>   stubs/error-printf.c                         |   1 +
>   target/alpha/helper.c                        |  10 +-
>   target/arm/pauth_helper.c                    |   4 +-
>   target/arm/tlb_helper.c                      |   7 +-
>   target/hexagon/op_helper.c                   |   9 +-
>   target/hppa/cpu.c                            |   8 +-
>   target/hppa/op_helper.c                      |   4 +-
>   target/i386/tcg/bpt_helper.c                 |   2 +-
>   target/i386/tcg/excp_helper.c                |  31 +--
>   target/i386/tcg/misc_helper.c                |   6 +-
>   target/i386/tcg/sysemu/misc_helper.c         |   7 +-
>   target/openrisc/exception.c                  |   2 +-
>   target/openrisc/exception_helper.c           |   3 +-
>   target/riscv/op_helper.c                     |   4 +-
>   target/rx/op_helper.c                        |  22 +-
>   target/s390x/tcg/excp_helper.c               |  22 +-
>   target/sh4/op_helper.c                       |   5 +-
>   target/sparc/mmu_helper.c                    |   8 +-
>   target/tricore/op_helper.c                   |   6 +-
>   tcg/tcg.c                                    |   3 +-
>   tests/fp/fp-bench.c                          |   3 +-
>   tests/fp/fp-test.c                           |   3 +-
>   tests/qtest/fdc-test.c                       |   2 +-
>   tests/qtest/fuzz/fuzz.c                      |   1 +
>   tests/qtest/fuzz/generic_fuzz.c              |   2 -
>   tests/qtest/libqos/libqmp.c                  | 230 +++++++++++++++++++
>   tests/qtest/{ => libqos}/libqtest.c          | 222 +-----------------
>   tests/unit/check-qobject.c                   |   7 -
>   tests/unit/check-qom-proplist.c              |   1 +
>   tests/unit/test-forward-visitor.c            |   2 +-
>   tests/unit/test-keyval.c                     |   2 +-
>   tests/unit/test-qga.c                        |   7 +
>   tools/virtiofsd/fuse_virtio.c                |   4 +-
>   tools/virtiofsd/passthrough_ll.c             |   2 +-
>   ui/vnc.c                                     |   1 +
>   util/compatfd.c                              |  18 +-
>   util/coroutine-ucontext.c                    |   2 +-
>   util/cutils.c                                | 163 ++++++++-----
>   util/error-report.c                          |  17 +-
>   util/keyval.c                                |   2 +-
>   util/osdep.c                                 |  16 ++
>   util/oslib-posix.c                           | 146 ++----------
>   util/oslib-win32.c                           |  64 +-----
>   qga/installer/qemu-ga.wxs                    |  24 +-
>   qga/meson.build                              |   5 +-
>   scripts/analyze-inclusions                   |   4 -
>   scripts/checkpatch.pl                        |   2 +-
>   tests/qtest/libqos/meson.build               |   5 +-
>   tests/unit/meson.build                       |   4 +-
>   ui/cocoa.m                                   |   3 +-

This series has become really too big, touching too many different topics 
... please split it by sub-topics and/or maintenance areas.

  Thomas


