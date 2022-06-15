Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99A54D02D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:40:29 +0200 (CEST)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1X0F-0002Yk-Uu
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wtx-0007OO-OE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:33:57 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:47017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wtw-0006po-1Q
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:33:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d13so10967712plh.13
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9mOrhzBA04tjz7v+X+jAk4EHiQhaOObT90153U51D1U=;
 b=b/L+Z7kIyYouNokZg1uqazhi7FSgyyzmiVcpZ64M07n49GqyuI7WBQ5R3TpBZcxNUL
 LpNjRSIo16UNGKcg2mgs3WrcbPk6iDMSkdxVwud56NmtCZPyHhamQQ0NOL+72QJEFAqe
 Da2cP1iF+OB5lGlcOCUv/FZLoG+z8tsIBZc9j1H3MBtiuM3jgGlxDx+fYVwesOERR+Cc
 94pquPAGGyX+tLP8PLJ77pIj1RW9Y00OW+Z5/4IEsqtd/RWzCfTWVhL22X0/CpZFD8J8
 EhiR3cScQ/z5YNzT5lQ52zGE7LbwwGW2BeaYH7tbs3QhA6r3O0AtSHYCeNAsMMTooWau
 j4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9mOrhzBA04tjz7v+X+jAk4EHiQhaOObT90153U51D1U=;
 b=KnDRUPzP4VcEXuexSOGMj2IR75OAYET9YkIgPvLiGZQQrJgMHqpa5l2HJ56qiFt3Ir
 guigTS3NHIL3noNdiG02v8vqsd/4Idlwns8jykDPfcInY7g27oIPLfHluZxqaAV5avZm
 faFpMLQgTtEvUJLG0YqZqe0y9q5lDRDBR2QrJ3VrL95Ex0Cjp019gsRF17RVWshu8yrw
 jw5uz3dOy8FNFHhwJREBkx9GGcc6NNj2Ah2570N7U9ksDXl5GD3u/rz4SXUPbq82b40m
 H3nUD316+It6XASvrjyWhimU3G4UWbWQa47ArBpAzJPodQ9VJ3t1SsuIEEZkkan9/TFE
 oPPQ==
X-Gm-Message-State: AJIora85pCeOnr923RraTlpLfS5OGOnIqVSkTucWOUVcbZQwXvZlqJUv
 tSpe1ZgujC46h/1E4cLGeRU=
X-Google-Smtp-Source: AGRyM1sCzPueVi5nt4NQLccYnoFHW4NZE2yTzCq6kdDxQwSeSSLEGhFzoRmNhGrlXrSHDUe00uAipQ==
X-Received: by 2002:a17:90b:388b:b0:1e8:7347:c3cd with SMTP id
 mu11-20020a17090b388b00b001e87347c3cdmr11502934pjb.135.1655314434480; 
 Wed, 15 Jun 2022 10:33:54 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a633c4d000000b003fcf1279c84sm10171451pgn.33.2022.06.15.10.33.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 10:33:53 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v7 0/6] cutils: Introduce bundle mechanism
Date: Thu, 16 Jun 2022 02:33:39 +0900
Message-Id: <20220615173345.32456-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62d.google.com
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

Akihiko Odaki (6):
  qga: Relocate a path emitted in the help text
  Remove prefixes from path configuration macros
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  ui/icons: Use bundle mechanism
  net: Use bundle mechanism

 .travis.yml                 |  2 +-
 include/qemu/cutils.h       | 21 ++++++++++++++-
 meson.build                 | 37 +++++++++++++++++---------
 net/tap.c                   |  2 +-
 pc-bios/keymaps/meson.build |  2 ++
 pc-bios/meson.build         | 19 +++++++------
 qemu-options.hx             | 11 ++++----
 qga/main.c                  |  2 +-
 scripts/oss-fuzz/build.sh   |  2 +-
 softmmu/datadir.c           | 41 +++++++++++-----------------
 tests/qtest/fuzz/fuzz.c     | 15 -----------
 tests/vm/fedora             |  2 +-
 tests/vm/freebsd            |  2 +-
 tests/vm/netbsd             |  2 +-
 tests/vm/openbsd            |  2 +-
 ui/cocoa.m                  |  2 +-
 ui/gtk.c                    |  2 +-
 ui/icons/meson.build        | 32 ++++++++++++++++------
 ui/sdl2.c                   |  4 +--
 util/cutils.c               | 53 ++++++++++++++++++-------------------
 20 files changed, 138 insertions(+), 117 deletions(-)

-- 
2.32.1 (Apple Git-133)


