Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A5042EE73
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:09:41 +0200 (CEST)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbK9k-0004Pd-LZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7X-0001sY-HC; Fri, 15 Oct 2021 06:07:23 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7V-0000aN-By; Fri, 15 Oct 2021 06:07:23 -0400
Received: by mail-ed1-x536.google.com with SMTP id ec8so36041859edb.6;
 Fri, 15 Oct 2021 03:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z0KLwC4wTB/bvpTEoAeHnGM4/LogQdwq8pydDvvTv04=;
 b=Zmr7fDxQrNKHA6QFPmSgEA3l/GRoAb16cZq69qNaV3nYSbshp+Tj8/WgZNbRJBPzFk
 KsWnYj4+bWCxsbYSiogNDY5cXc6hZqexAfF0SITC98TF7/G4JoraLnVxYBKroECFtwrM
 NLDTeDXwj0fhjwhZ+eqi2bZRva9X13c8Q2o0x6hm+HwjYtTAPMkFOAi8MkQhBgLVQ+qb
 kWAushBGAmUF6o84ERxfQB98INpXxnjzWs6E9n1rJLdpQwS6Uiq4zS1paR8Bpe1AtrT3
 8vGizq85nOgpf+OQytt45mYSBoNnuaRipS9x4JrafGP9j1bEvmIY0WChQo861RvCI/HX
 mLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Z0KLwC4wTB/bvpTEoAeHnGM4/LogQdwq8pydDvvTv04=;
 b=wURo5M0K6iEvD6OL7tq00BeqEj0fsZCjkgBchamT/luHAjXDNLFNGrpJjx6h5uzuhy
 mIClvM2q7H2s7ObIOljtQj/ikZfCFLVUKpF8X7WAY/2tkepejjcu7cTbsxfdJksnrnad
 N91yMp/GoDruAerqdtxJaLc2j9nOF0PC11I29ZFMGLz4/HeKeqPvxQwVry0VB71InhIO
 W5Gp2QDSNllDy9ufevVm6n9Pc9mo5HvTLV+OUYfFS8iLKCa+I5mJUT7nn70NjpKmvlAv
 bLh3r11lDa7SMRvLF2G3DahH5Dl7/D9/DhOaM/+az4Xrpr+cxwc9OdwC11+5aXusGKlk
 HE5Q==
X-Gm-Message-State: AOAM531eFT2HMzGjgr2cTfUoYVik47uSl3bI5F+N6WQJ5ZIQxIo/17AM
 9UCPW4jsvvmNX3w/Hh0EsjblJl5/0A0=
X-Google-Smtp-Source: ABdhPJwv0O+z11GwwBXqoTc38paW5K7D4G/YtGf14lcQcmGae+oleTi8n8Ez+6H5ZxZyb6/jiEbuVQ==
X-Received: by 2002:a17:907:1caa:: with SMTP id
 nb42mr5711254ejc.293.1634292439337; 
 Fri, 15 Oct 2021 03:07:19 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r3sm4090564edo.59.2021.10.15.03.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 03:07:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] Replace custom test harness with "meson test"
Date: Fri, 15 Oct 2021 12:07:14 +0200
Message-Id: <20211015100718.17828-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, hreitz@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Starting with Meson 0.57, "meson test" has all features of QEMU's
makefile-based harness and more.  In particular, some features that
were added to reach feature parity are:

* print reproducer command line for each failed test right below the test

* keep the output of multiple (non-TAP) tests together in verbose mode,
  similar to "make --output-sync target"

* report on TAP subtests as they are encountered

It also includes nicer handling of test interruption, logging of the run
in the meson-logs/ subdirectory, and a progress report/spinner.  For
these reasons it would be nice to adopt it and remove the Perl scripts
that we have to present TAP output nicely.  While at it, this series
also changes qemu-iotests to be described in tests/qemu-iotests/meson.build
and it replaces the current "-makecheck" output style with TAP.

This is an RFC just to let people try it out and because I still haven't
sorted out timeouts (e.g.  OpenBSD is insanely slow on some tests).
But in theory, if you want to try it out, the only things you need to
know are:

* while "make check" does not timeout tests like it doesn't right now,
  "meson test" does respect timeouts, so you could get failures because
  of that.  That can and probably will change from RFC to final.

* CTRL+C will only interrupt the longest running test.  Pressing
  CTRL+C repeatedly three times (which you would likely do anyway,
  that's how things work) interrupts the whole run

* Right now "make check-block" only does a single test run just like
  "../tests/check-block.sh", but it would be possible to add the thorough
  suite to "meson test --suite block" as well.

* If you were using make check-report.tap and similar, they are replaced
  by targets like make check-report.junit.xml.  This is because Gitlab
  is able to parse the resulting XML and include on the website a report
  of which tests failed.

An example of non-verbose "make check" output is available at
https://gitlab.com/bonzini/qemu/-/jobs/1680980620.  A verbose run
instead is like https://asciinema.org/a/e5irnEszSnAheOHM30exbo3F6
(does not include check-block).

Paolo

Paolo Bonzini (4):
  build: use "meson test" as the test harness
  build: make check-block a meson test
  check-block: replace -makecheck with TAP output
  configure: remove dead EXESUF variable

 .gitlab-ci.d/crossbuild-template.yml |   2 +-
 Makefile                             |   3 +-
 configure                            |   3 -
 meson.build                          |   5 +-
 scripts/mtest2make.py                | 111 +++-----
 scripts/tap-driver.pl                | 379 ---------------------------
 scripts/tap-merge.pl                 | 111 --------
 tests/Makefile.include               |  15 +-
 tests/check-block.sh                 |  28 +-
 tests/fp/meson.build                 |   2 +-
 tests/meson.build                    |   1 +
 tests/qemu-iotests/check             |   6 +-
 tests/qemu-iotests/meson.build       |  14 +
 tests/qemu-iotests/testenv.py        |  30 +--
 tests/qemu-iotests/testrunner.py     |  48 ++--
 15 files changed, 121 insertions(+), 637 deletions(-)
 delete mode 100755 scripts/tap-driver.pl
 delete mode 100755 scripts/tap-merge.pl
 create mode 100644 tests/qemu-iotests/meson.build

-- 
2.31.1


