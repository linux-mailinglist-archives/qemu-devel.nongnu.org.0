Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C255D559CAF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:55:10 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kiD-0007pE-Ri
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4ke9-0001sV-HP
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:50:57 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4ke5-0000Rx-EA
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:50:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s185so2646001pgs.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WND5E8S/ihgmjUjyuS3yRTyE65sxcjyybPxJL9g5LSA=;
 b=iCbG6wEJZok8T5BSB+83c75QFxti8qeMVXQXD8bwLWMqHrlHYtSpeNxK9LcpHv18ax
 oCs8SXJfqKU2pwgOkFP6spluM2n8W72ywkkGCOinoHzHvcKXXc3oWLUBIFnhoMx80fyx
 iTmnW40dtp2on5sW+8fVNIZJDKQUfT6Xqxi7jwxAlfn5MtJjfnak9oSnFZfJJCFwUiLU
 16sh4GSXvWRTU666Lir6t59u+ZveBBXoG08BwNNygnaSGRHXILbi40PhAYDlwyqAXIg0
 8MwGwM0Re2OLRD429d6ZvkDI+2WLeBiWiQD1wbzGVv5ZJbXoEjxtRUnaZbTce/uZOD/v
 hfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WND5E8S/ihgmjUjyuS3yRTyE65sxcjyybPxJL9g5LSA=;
 b=DOwn70Qkzz5/o4aojCa3irh0Gk5eKUTZnzugzMIhBkYVia/tjHVhmjV3rSknhHevCr
 PvANzujdbl7eDIavl720sJlqv4TA5AxYBLV6gGUXT3J50ILHL8Sxo2Z/1M2y9RMMYndl
 W8fZ44syosW90PhaCsH/TYV2Kh+4UA0rrdQB99Z/zOPGX8f7gkZCIoUCytpCjd3YXjFX
 Efbx5QksKGlSXOkGVBC2jXj21P0IJbg0riN5W5dMcxuAUY+RrB8VfYxKnXCdrh9g2BR0
 gtIAuurz0BUWPwNwgQN7bz8H55D7jABTIZiiL5A1a2vqpbw4/K/hfdbspXEpbVuvHiKD
 RsLQ==
X-Gm-Message-State: AJIora8+weWBaA0MsM6r3aphpLQKp1fGcavWXX5PmGex2x24kBu4yByr
 uEhAHOaDEq0gDpy5i0SJmCc=
X-Google-Smtp-Source: AGRyM1v4EMVyQjzGdpkOiOu9Y8wakwQu1yIqMvgUpEyPiLhrrtc99C2imbPj8C/wHnODXVGODv+1lg==
X-Received: by 2002:a63:2c90:0:b0:40c:fe76:59ef with SMTP id
 s138-20020a632c90000000b0040cfe7659efmr11906075pgs.288.1656082249726; 
 Fri, 24 Jun 2022 07:50:49 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170902ee5400b001690a7df347sm1921125plo.96.2022.06.24.07.50.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 07:50:49 -0700 (PDT)
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
Subject: [PATCH v8 0/4] cutils: Introduce bundle mechanism
Date: Fri, 24 Jun 2022 23:50:35 +0900
Message-Id: <20220624145039.49929-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52c.google.com
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

Note that this abandons compatibility with Windows older than 8 to use
PathCchSkipRoot(). The extended support for the prior version, 7 ended
more than 2 years ago, and it is unlikely that anyone would like to run
the latest QEMU on such an old system.

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
 meson.build                     |  4 ++
 pc-bios/keymaps/meson.build     | 21 +++-------
 pc-bios/meson.build             | 13 ++-----
 scripts/oss-fuzz/build.sh       |  2 +-
 scripts/symlink-install-tree.py | 37 ++++++++++++++++++
 softmmu/datadir.c               | 22 +----------
 tests/qtest/fuzz/fuzz.c         | 15 --------
 tests/vm/fedora                 |  1 -
 tests/vm/freebsd                |  1 -
 tests/vm/netbsd                 |  1 -
 tests/vm/openbsd                |  1 -
 util/cutils.c                   | 68 +++++++++++++++++++++++----------
 util/meson.build                |  1 +
 util/module.c                   |  1 -
 17 files changed, 117 insertions(+), 93 deletions(-)
 create mode 100755 scripts/symlink-install-tree.py

-- 
2.32.1 (Apple Git-133)


