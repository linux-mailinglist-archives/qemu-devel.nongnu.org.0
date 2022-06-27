Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46B55B5F3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 06:11:14 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5g5g-0001uh-3K
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 00:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5fss-0004Va-2i
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:57:58 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5fsq-0007ul-8l
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:57:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id 23so7942452pgc.8
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 20:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WG79Q3C3z9wSqmKXKw3izrvrHSntzWjM2H7yoBKElJE=;
 b=Tfzx3J7NjMFys9UhaXRj9vcVllNiDpvV0oYgy2APdTUI+Bn7XjIXAp0NMaMF8klXZq
 WJkyac5Hs9p/PCH96gRtTPn/H5jul7ovEuKkEbtHDc9Bqhy/9axv0IRLDh4h8qIRzrkB
 pkkVTJ9NUWu/SMRKvCbUDmEjfMXo7tdc/13Nl541/cdwnEUP06OEH/zr+0TB0ow/Ek9j
 PNextAuszIBLXCAd8NcmTz2TKLJ45miSNyDIjEC72rE0WZulwxOuHiD3p7O+Bs1oSCIc
 9iwSEcdTBrd/ty/wCuDeorsNUtpwWZvESwyjPDMCaDxrvM/XpmnnBjEpM6FlBGIqbpKf
 6VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WG79Q3C3z9wSqmKXKw3izrvrHSntzWjM2H7yoBKElJE=;
 b=J/EsxcT0G+Rk/+SjM5g+MWCgK7LIktboNhelGTpxKDsXDdXvk707D1GqCM2rpDZ3O1
 +VXrSjayROKUUZtg5IljlBXtGqHSJRUaWKf5E+xwGKxBslU0CPb023FG1dOytmUVgy5N
 2hNcIRzriK/haVL2go3Ui2gQ0o1NhYpJ8SxJFhgTaA4af0tL8rb9Zb+NukRxQwySlOh7
 4gFu1RsgpBGzlPPKtO2krRsFwbnu/e1SbuUEm26S5AUfQHXo2Vc5IjZqg+H8ew1C4v5C
 +x+v+pbFvmaKcf6PNTrYPMoXWhjRn6mXyl9De8wEbYpYhvtGk8YKlHfVdAKIF2h8H3nx
 xGMA==
X-Gm-Message-State: AJIora/7J5IXPA3yTsQfR5VFMzB6+oh5lv9tdbQYIW1MD9xcu8kD1YKM
 zO+fePsyDIIjwKMx16VU79M=
X-Google-Smtp-Source: AGRyM1vVYvY/dcbMXayo/x5yM9N51yAg8mF6UKK5FXjKL+8vmrRIw4QE7beUvYTNUZf9Vj0q0s6akg==
X-Received: by 2002:a65:490d:0:b0:40d:9867:2df with SMTP id
 p13-20020a65490d000000b0040d986702dfmr11120664pgs.171.1656302274214; 
 Sun, 26 Jun 2022 20:57:54 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b0052531985e3esm5951314pfo.22.2022.06.26.20.57.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jun 2022 20:57:53 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v10 0/4] cutils: Introduce bundle mechanism
Date: Mon, 27 Jun 2022 12:57:40 +0900
Message-Id: <20220627035744.23218-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Note that this abandons compatibility with Windows older than 8 to use
PathCchSkipRoot(). The extended support for the prior version, 7 ended
more than 2 years ago, and it is unlikely that anyone would like to run
the latest QEMU on such an old system.

v10:
* Update destdir_join() in scripts/symlink-install-tree.py with the
  latest implementation from Meson:
  https://github.com/mesonbuild/meson/pull/10531

v9:
* Update _WIN32_WINNT in include/qemu/osdep.h (Thomas Huth)

v8:
* Pass absolute paths to get_relocated_path() (Paolo Bonzini)
* Use meson introspection (Paolo Bonzini)
* Drop "qga: Relocate a path emitted in the help text" as it is no longer
  relevant for the bundle mechanism.

v7: Properly fix --firmwarepath (Daniel P. Berrangé)

v6: Reuse get_relocated_path() in find_bundle() (Paolo Bonzini)

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

Akihiko Odaki (3):
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  module: Use bundle mechanism

Paolo Bonzini (1):
  tests/vm: do not specify -bios option

 .travis.yml                     |  2 +-
 docs/about/build-platforms.rst  |  2 +-
 include/qemu/cutils.h           | 18 +++++++--
 include/qemu/osdep.h            |  2 +-
 meson.build                     |  4 ++
 pc-bios/keymaps/meson.build     | 21 +++-------
 pc-bios/meson.build             | 13 ++-----
 scripts/oss-fuzz/build.sh       |  2 +-
 scripts/symlink-install-tree.py | 34 +++++++++++++++++
 softmmu/datadir.c               | 22 +----------
 tests/qtest/fuzz/fuzz.c         | 15 --------
 tests/vm/fedora                 |  1 -
 tests/vm/freebsd                |  1 -
 tests/vm/netbsd                 |  1 -
 tests/vm/openbsd                |  1 -
 util/cutils.c                   | 68 +++++++++++++++++++++++----------
 util/meson.build                |  1 +
 util/module.c                   |  1 -
 18 files changed, 115 insertions(+), 94 deletions(-)
 create mode 100755 scripts/symlink-install-tree.py

-- 
2.32.1 (Apple Git-133)


