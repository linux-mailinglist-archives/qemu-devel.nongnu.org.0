Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18841309BBC
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:53:55 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BIf-0003j8-LV
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFP-0001nV-1w; Sun, 31 Jan 2021 06:50:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFM-0005EB-D4; Sun, 31 Jan 2021 06:50:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u14so10751056wmq.4;
 Sun, 31 Jan 2021 03:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gCD684y2+yR8ZPFp0RrwyPF7ZTcIuoLv37e2hkgFE0=;
 b=n/rUycdc+ct+UAqDtNRrvH32lMXamGwdH/hrZpmxT5tFvY/s3Yt9F8aZkX9j4jtwqP
 ujuykrOso7k6mKqrGY4dNKu1x+SqgfERulsiFPHm7Bs9POeqwzV6W2qVO31s1MJffxLA
 Go5XmdNKRrrNV7xzzETC4xkxqMXnuX/xVwPduR4mNEZaQbjK5Kzuoy9up/bd2iUXZ+3U
 S9+bFqz2m53y3bVyiwj6pfQ3NXAHBSqMgrHbDF0KDJkEvY3squ+2FaeICfjkqIVBu2DQ
 dtE6Pn9JhTFPDzknw4DWaiVAtDRs4ZhplHKoalaxdC6xOtO+k5V8b5xEYZmwXr8jU8ck
 AMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1gCD684y2+yR8ZPFp0RrwyPF7ZTcIuoLv37e2hkgFE0=;
 b=Ux9AbG+HTb5SwdYUgI2bBMuO2ipvpHAkHnEphFx6Z7Z8RBx+MAfIEMbHRTUZtQZXm2
 flOBKm734UZW2i1SufUjfZL1BqslNW3N6wyfOn1I47/xh6DTUO28UZzwf4dDhbWST/Jb
 kzYTv2dosYqZTqAh9Is8wZaX8ywCUBkMufwWDGzLn1Rmimn2V+lPFOWLSkk4O7b7pg99
 u+CCx/Ixu8Dp09PrwrEhDfIQVnmF/kqAnoLiyMRGlo2WIyb5RSC+3+ywqsUtMQCpivpr
 RzAtS2kb5fYFh/AIxW4OqkohAhVh2QagICXfOLzN8aJ6ldWFMFzIeV21Ign74JW/fm+y
 80Uw==
X-Gm-Message-State: AOAM533KgP7+1PlOy+iIFgiyzc5U9E+N5OpEGYfvC1NwrZua6V4MFLZs
 dbBDf9V17X3OCgyS2Bg554JJhEUBd4E=
X-Google-Smtp-Source: ABdhPJxub8KK7dIC58IEzuZSU43m5r7m7PqN3sJd1N+IK8W88v9tfmfMGC7iaD18Qc5HF+HixP+deA==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr10774027wmk.72.1612093825430; 
 Sun, 31 Jan 2021 03:50:25 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id g194sm17384967wme.39.2021.01.31.03.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:50:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/11] Support disabling TCG on ARM (part 2)
Date: Sun, 31 Jan 2021 12:50:11 +0100
Message-Id: <20210131115022.242570-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover from Samuel Ortiz from (part 1) [1]:=0D
=0D
  This patchset allows for building and running ARM targets with TCG=0D
  disabled. [...]=0D
=0D
  The rationale behind this work comes from the NEMU project where=0D
  we're trying to only support x86 and ARM 64-bit architectures,=0D
  without including the TCG code base. We can only do so if we can=0D
  build and run ARM binaries with TCG disabled.=0D
=0D
Peter mentioned in v5 [6] that since 32-bit host has been removed,=0D
we have to remove v7 targets. This is not done in this series, as=0D
linking succeeds, and there is enough material to review (no need=0D
to spend time on that extra patch if the current approach is not=0D
accepted).=0D
=0D
CI: https://gitlab.com/philmd/qemu/-/pipelines/249272441=0D
=0D
v6:=0D
- rebased on "target/arm/Kconfig" series=0D
- introduce/use tcg_builtin() for realview machines=0D
=0D
v5:=0D
- addressed Paolo/Richard/Thomas review comments from v4 [5].=0D
=0D
v4 almost 2 years later... [2]:=0D
- Rebased on Meson=0D
- Addressed Richard review comments=0D
- Addressed Claudio review comments=0D
=0D
v3 almost 18 months later [3]:=0D
- Rebased=0D
- Addressed Thomas review comments=0D
- Added Travis-CI job to keep building --disable-tcg on ARM=0D
=0D
v2 [4]:=0D
- Addressed review comments from Richard and Thomas from v1 [1]=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html=0D
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html=0D
[3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html=0D
[4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html=0D
[5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746041.html=0D
[6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html=0D
=0D
Based-on: <20210131111316.232778-1-f4bug@amsat.org>=0D
          "target: Provide target-specific Kconfig"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  sysemu/tcg: Introduce tcg_builtin() helper=0D
  exec: Restrict TCG specific headers=0D
  target/arm: Restrict ARMv4 cpus to TCG accel=0D
  target/arm: Restrict ARMv5 cpus to TCG accel=0D
  target/arm: Restrict ARMv6 cpus to TCG accel=0D
  target/arm: Restrict ARMv7 R-profile cpus to TCG accel=0D
  target/arm: Restrict ARMv7 M-profile cpus to TCG accel=0D
  target/arm: Reorder meson.build rules=0D
  .travis.yml: Add a KVM-only Aarch64 job=0D
=0D
Samuel Ortiz (1):=0D
  target/arm: Do not build TCG objects when TCG is off=0D
=0D
Thomas Huth (1):=0D
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M=0D
=0D
 default-configs/devices/aarch64-softmmu.mak |  1 -=0D
 default-configs/devices/arm-softmmu.mak     | 27 --------=0D
 include/exec/helper-proto.h                 |  2 +=0D
 include/sysemu/tcg.h                        |  2 +=0D
 target/arm/cpu.h                            | 12 ----=0D
 hw/arm/realview.c                           |  7 +-=0D
 target/arm/cpu_tcg.c                        |  4 +-=0D
 target/arm/helper.c                         |  7 --=0D
 target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++=0D
 tests/qtest/cdrom-test.c                    |  6 +-=0D
 .travis.yml                                 | 32 +++++++++=0D
 hw/arm/Kconfig                              | 38 +++++++++++=0D
 target/arm/Kconfig                          | 17 +++++=0D
 target/arm/meson.build                      | 28 +++++---=0D
 14 files changed, 196 insertions(+), 60 deletions(-)=0D
 create mode 100644 target/arm/m_helper-stub.c=0D
=0D
-- =0D
2.26.2=0D
=0D

