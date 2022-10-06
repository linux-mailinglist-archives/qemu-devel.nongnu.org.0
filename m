Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAE5F6B10
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:55:55 +0200 (CEST)
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTE2-00071v-Et
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSex-0003wo-Km; Thu, 06 Oct 2022 11:19:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSev-0005yL-Oi; Thu, 06 Oct 2022 11:19:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id bh13so2158018pgb.4;
 Thu, 06 Oct 2022 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6o+30SmN2bco3CjzBwlafSMtQ2m68d1i+due7WP7eU=;
 b=Ga1qVfgxA9FyRrTq7ag+CpW8SkuEvG7XmaYMRBrsIt8oL/Z37tbvXul9UdjAl1NI64
 BUiV5S2l1IGg8NdooTuYfRygYECeBsSr+3rr7VRqE5flW4CTE4YbN2Lfd0scV0WH69JV
 ImWw364IvIJz4UNUcUIbphOTLDLhC+0jkE8Zi7Oth4YKkuBmK4T0KxW90B+EIOK8d+xy
 ouq1U6x/Ttv8YpQnDKLT4fjlPeP/dIP8RhR3rpoN0B4ADa+D/jFx2F0GPkTC7mH9icYO
 FLQVkiZgLgcmiKQiXxFBoi7JoRERb5wvTA7vKPiwz3zDSprx8wQicINmHHKIOWa21rBd
 C6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z6o+30SmN2bco3CjzBwlafSMtQ2m68d1i+due7WP7eU=;
 b=devbHzJUpesNaYDAVPs0NxHwKrPjJd8jePr7XYG8LzYDxfLiUWqUmR8RtOYLyfG5Dp
 5/BNYcczJhDfsJB+fN7JvdlqUmaVkNjhitYt2p0AxfU2WBi6gIOiV7MduYD3qkp3W/b9
 0Yk2YLk7uqwkodrFg+Etqpc22gOQ+FpAJByvgDPmD1UuSoNxyCbG2CvOwFzo51p5qmd4
 2OdnZAIkWhyx5ur4SHN94XJRw29UpriWM64gypI0gWRwYayxhnt44DDAHbsNs9A+wxPY
 dbc/+ooC1GeshqtbfwdDfhXBgRNpJ3N2VMif4RKWNaQ7VKoWPrRePkZcNs2ChNvNKBM0
 WtCw==
X-Gm-Message-State: ACrzQf3tWWNJIu2AJMQH+Fp5ErCMfRjtK7pxtjXstLAcRVBIn2sXT+9i
 Gyx52Nldix1aUIutkaeJPaM11CwPlu4=
X-Google-Smtp-Source: AMsMyM4u4sON35rmGlgGLNJNHWCOEYaBcngx8kT9k/8lCo+f6fYhEOLq/rkxpys4i+Sg+3C188LDmg==
X-Received: by 2002:a05:6a00:301e:b0:560:d5c5:83a2 with SMTP id
 ay30-20020a056a00301e00b00560d5c583a2mr5688260pfb.63.1665069575634; 
 Thu, 06 Oct 2022 08:19:35 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Subject: [PATCH v5 00/18] tests/qtest: Enable running qtest on Windows
Date: Thu,  6 Oct 2022 23:19:09 +0800
Message-Id: <20221006151927.2079583-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

In preparation to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Changes in v5:
- Rebase on qemu/master
- Drop patches that are already merged
- Use g_autoptr(GError)
- Restore to v1 version which does not touch the posix implementation
- Replace sighandler_t with its actual definition, since it is not
  available on BSD hosts

Changes in v4:
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration

Changes in v3:
- Split to a separate patch
- Add a usleep(1) in the busy wait loop
- Drop the host test

Changes in v2:
- Use g_autofree to declare the variable
- Change to use g_mkdir()
- Change to use g_mkdir()
- Change to use g_mkdir()
- Introduce qemu_send_full() and use it
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call
- Change to a busy wait after migration is canceled
- new patch: "io/channel-watch: Drop the unnecessary cast"
- Change the timeout limit to 90 minutes
- new patch: "tests/qtest: Enable qtest build on Windows"

Bin Meng (15):
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests/qtest: migration-test: Avoid using hardcoded /tmp
  block/vvfat: Unify the mkdir() call
  fsdev/virtfs-proxy-helper: Use g_mkdir()
  hw/usb: dev-mtp: Use g_mkdir()
  tests/qtest: libqtest: Install signal handler via signal()
  tests/qtest: Support libqtest to build and run on Windows
  tests/qtest: libqtest: Correct the timeout unit of blocking receive
    calls for win32
  io/channel-watch: Drop a superfluous '#ifdef WIN32'
  io/channel-watch: Drop the unnecessary cast
  io/channel-watch: Fix socket watch on Windows
  .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
  tests/qtest: Enable qtest build on Windows

Xuzhou Cheng (3):
  accel/qtest: Support qtest accelerator for Windows
  tests/qtest: Use send/recv for socket communication
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled

 include/hw/core/cpu.h         |   1 +
 include/qemu/sockets.h        |   2 +
 accel/dummy-cpus.c            |  14 +++-
 block/vvfat.c                 |   9 +--
 fsdev/virtfs-proxy-helper.c   |   3 +-
 hw/usb/dev-mtp.c              |   4 +-
 io/channel-watch.c            |  12 +---
 semihosting/arm-compat-semi.c |   3 +-
 softmmu/cpus.c                |   9 +--
 tcg/tcg.c                     |   3 +-
 tests/qtest/libqmp.c          |   5 +-
 tests/qtest/libqtest.c        | 124 +++++++++++++++++++++++++++++-----
 tests/qtest/migration-test.c  |  14 ++--
 util/osdep.c                  |  33 +++++++++
 util/qemu-sockets.c           |   5 +-
 .gitlab-ci.d/windows.yml      |   4 +-
 accel/meson.build             |   1 +
 accel/qtest/meson.build       |   1 +
 tests/qtest/meson.build       |   6 --
 19 files changed, 194 insertions(+), 59 deletions(-)

-- 
2.34.1


