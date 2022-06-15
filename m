Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4954C972
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:11:35 +0200 (CEST)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1So1-00017X-Uv
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Slf-0007O2-Ru
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:09 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Sld-0007Rj-6C
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s37so8730983pfg.11
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ha3ayKvHgDAyM/G7T2uHtMqEH6EAxZ2XVkL0lWevY4Y=;
 b=kuWHoMZlz3z8/Ut2d82Q+TOe7glLw9F4Qg+AKpyQD8xlonVbbDZfbW866pVtT7nHZK
 Wu52gYbbJfLchIUjhAfsaz2ov8hg9xwYXT3tz9YG3N322nSVfWFzXLpeKbKeuF7t+LT8
 nKYYo2qNh8tX0qnkS8znVAkmLWsvBOSmFc6WBpe7petFfnqlAy0DV4HfpGZHkMTvncY3
 +Js0ca17jgi2LCZHQ15jprs5saqf3Ncop8jfr/Ls8o3SuA2iUYABzkkiODAoj6cAadio
 uRkEAmwp6tjoYksTcgbaMXsPx/J+B9JnzAwT/29J9R+1CXwu4NiPK+X/GDAF+ItUYVTO
 lJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ha3ayKvHgDAyM/G7T2uHtMqEH6EAxZ2XVkL0lWevY4Y=;
 b=NpgbbkofnoD486S8p9m5CZ2x6MMuIMTyNI1DL2UaV1ZbL0nqNm8PiXnp7pU16yncxS
 C12KEcuz9eMJeGAf6LoJQElsp8UgJPJQTvbDckdFxEwHuIKEEkAxgklKbfdrciF6C/Z/
 bROECBRVVCi9nFcGwXeAykrITXPCrrnY4eXO2TGCZHgNmwXs28R284rogGCI7oooLrGn
 FDO3WtMbhdoufRTvoRZHLmZvGNFPoFp7lnjPUQXt6+KFWUiO9dO9LQo5Yny0FaRtvca6
 Em4J2S0eR/MgBKRQdPvAlGYb9mfbpPdmWuxqGl7Cgiorl65GncNgnjWON4TaixAaTRiT
 VI2g==
X-Gm-Message-State: AOAM530D6hPvcmt1V2sKd8mf2mAubKnNMoF0qqkndUQtE5VjpMPeQh9Z
 +tDhJh9M9ErjdMx/U3t5/V8=
X-Google-Smtp-Source: ABdhPJwqWh8qcjFglTcd3OC9lkAb6dOn6YrW2ZB0pu6o0eX0NQmZB3rQCEyObmTOZkXlq4BkfPXQJw==
X-Received: by 2002:a05:6a00:2447:b0:520:6b82:6dfd with SMTP id
 d7-20020a056a00244700b005206b826dfdmr10038845pfj.39.1655298543753; 
 Wed, 15 Jun 2022 06:09:03 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b0016392bd5060sm9278448pln.142.2022.06.15.06.09.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 06:09:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 0/4] cutils: Introduce bundle mechanism
Date: Wed, 15 Jun 2022 22:08:41 +0900
Message-Id: <20220615130845.32674-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
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

v5:
* Prefer qemu-bundle if it exists. (Daniel P. Berrangé)
* Check install_blobs option before installing BIOSes (Paolo Bonzini)
* Add common code to set up qemu-bundle to the top level meson.build
  (Paolo Bonzini)

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
 meson.build                 | 20 +++++++++++++++++---
 net/tap.c                   |  6 +++++-
 pc-bios/keymaps/meson.build |  2 ++
 pc-bios/meson.build         | 19 +++++++++----------
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
 ui/icons/meson.build        | 32 ++++++++++++++++++++++++--------
 ui/sdl2.c                   | 18 +++++++++++-------
 util/cutils.c               | 33 +++++++++++++++++++++++++++++++++
 20 files changed, 162 insertions(+), 90 deletions(-)

-- 
2.32.1 (Apple Git-133)


