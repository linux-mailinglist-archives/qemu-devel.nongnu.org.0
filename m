Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4226954BC85
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:10:14 +0200 (CEST)
Received: from localhost ([::1]:42422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Dng-0007hQ-Qw
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1DlY-0005IO-QK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1DlX-0007kT-4C
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:00 -0400
Received: by mail-pg1-x529.google.com with SMTP id h192so9614938pgc.4
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Np4QMwKnIjMhuykyfSZBf5qL+iF0ja/nS2DZ5Fp8Sck=;
 b=X43BiOowh648gVXkZ3betws7u/eSjiIOyIwwvXxKJ6BtDVo/t7/TKNV99DtnCRRemb
 jpJvVVaRDd3gTHfh9fAObqf3wd33eaWl7b71uZOQGwYyZeEaGY3gOIVsCx0dUb92VxeG
 MTavluoOHqwLZVDKiHM/rrKQch7gxB+eGYUJh4faGuMynnhrS5wzuSzIDCRJsBLyPDuK
 gVoect+MJNrSJAEo6BLu1IXuXEOA9P58DP7F/VKHDpCxxM9KhYXoxexGDRcJMloSkN/e
 JuUuF6DP0wcQ6CuU5fbHagVKzNBNw//Lc+rXxgpzOw3mskGdk3DMPpVvRZYx2iZfq1R3
 vUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Np4QMwKnIjMhuykyfSZBf5qL+iF0ja/nS2DZ5Fp8Sck=;
 b=w6RkZx01ezdNfn83zgzdbqxSJhbsi4L5GzFTDVXUKO6r1A1KHQXnlZQNyVckL7IpGA
 esQr+fxuMirxBQ3XrSrR2JV04fDOvxiV1JxBQpOTS5gf8LB6WuJxR3r5/bsjHmQpU1GD
 b3ImTAmnsIqnpaC2SIwUmebhNJue3+mRQCdkyd/yPWUHWIkfvnP4KcnaSKsVzFsImvKo
 GZjAJlpV0wJCegShB8drgcFHWx+7ta6IWArzw10KKegd92a6woJfynbExrisX9Mmmr1A
 hbXMxNc3y2zghCdN2vTUd3gSat5m5aOtUabV1Rje32UP3s57QypBUhydls4DyH8JmRP6
 J+1Q==
X-Gm-Message-State: AOAM5334NBtuE2/J3KYjM6hzMUzU5hZ4Fs4hP7UMWzkrpUA3RrF9Pz67
 MroEchlbuF2yi5YkT6Th13I=
X-Google-Smtp-Source: ABdhPJwzhYruXWYYLqoegc1dcI5b4uhTvYj1A4bmBQnxDgW8dDp71HSCMYf47SyhS1o7clqC+9rKKQ==
X-Received: by 2002:a05:6a00:1c4e:b0:51b:ebf1:53c4 with SMTP id
 s14-20020a056a001c4e00b0051bebf153c4mr6393895pfw.49.1655240876909; 
 Tue, 14 Jun 2022 14:07:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 h65-20020a62de44000000b0050dc762813csm8129456pfg.22.2022.06.14.14.07.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:07:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 0/4] cutils: Introduce bundle mechanism
Date: Wed, 15 Jun 2022 06:07:42 +0900
Message-Id: <20220614210746.78911-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files located relative
to the installation tree. The build tree must have a new directory,
qemu-bundle, to represent what files the installation tree would
have for reference by the executables.

v4:
* Add Daniel P. Berrangé to CC. Hopefully this helps merging his patch:
  https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg02276.html
* Rebased to the latest QEMU.

v3:
* Note that the bundle mechanism is for any files located relative to the
  installation tree including but not limited to datadir. (Peter Maydell)
* Fix "bridge" typo (Philippe Mathieu-Daudé)

v2: Rebased to the latest QEMU.

Akihiko Odaki (4):
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  ui/icons: Use bundle mechanism
  net: Use bundle mechanism

 .travis.yml                 |  2 +-
 include/net/net.h           |  2 +-
 include/qemu/cutils.h       | 19 +++++++++++++++++++
 meson.build                 | 13 ++++++++++---
 net/tap.c                   |  6 +++++-
 pc-bios/keymaps/meson.build |  3 +++
 pc-bios/meson.build         | 17 +++++++++--------
 qemu-options.hx             |  4 ++--
 scripts/oss-fuzz/build.sh   |  2 +-
 softmmu/datadir.c           | 35 ++++++++++++-----------------------
 tests/qtest/fuzz/fuzz.c     | 15 ---------------
 tests/vm/fedora             |  2 +-
 tests/vm/freebsd            |  2 +-
 tests/vm/netbsd             |  2 +-
 tests/vm/openbsd            |  2 +-
 ui/cocoa.m                  | 29 ++++++++++++++++-------------
 ui/gtk.c                    |  6 +++++-
 ui/icons/meson.build        | 36 ++++++++++++++++++++++++++++--------
 ui/sdl2.c                   | 18 +++++++++++-------
 util/cutils.c               | 33 +++++++++++++++++++++++++++++++++
 20 files changed, 160 insertions(+), 88 deletions(-)

-- 
2.32.1 (Apple Git-133)


